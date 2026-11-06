"""Get the Dataverse software version of each installation that has author affiliations with RORs.

- Installations are listed in data/processed/installations/summary_counts.csv
- Versions are fetched with dataverse_functions.get_dataverse_installation_version()
- Versions already in data/processed/installation_dataverse_software_versions.csv (including ones added by hand
  for installations that block the API call) are kept, and the API is only called for
  installations without a version there

Saves data/processed/installation_dataverse_software_versions.csv
"""
import os
import pandas as pd
import platform
import sys
from time import sleep
from tqdm import tqdm
tqdmBarFormat = "{l_bar}{bar:10}| {n_fmt}/{total_fmt} [Elapsed:{elapsed}<Remaining:{remaining}{rate_fmt}{postfix}]"

osName = platform.system()
if osName == 'Windows':
    dataverseFunctionsPath = os.path.join(
        'C:\\', 'Users', 'Owner', 'Documents', 'GitHub', 'dataverse-functions')
elif osName == 'Darwin':
    dataverseFunctionsPath = os.path.join(
        '/Users', 'juliangautier', 'dataverse-functions')
sys.path.append(dataverseFunctionsPath)
from dataverse_functions import dataverse_functions

# Some Dataverse installations block requests from scripts, so send a user agent and email address
userAgent = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36'
emailAddress = 'juliangautier@g.harvard.edu'
headers = {
    'User-Agent': userAgent,
    'From': emailAddress}

processedDataDir = '/Users/juliangautier/ux-research-data-analysis/Findability_of_author_affiliations_with_rors/data/processed'
summaryCountsFilePath = os.path.join(processedDataDir, 'installations', 'summary_counts.csv')
outputFilePath = os.path.join(processedDataDir, 'installation_dataverse_software_versions.csv')

# Load installations that have author affiliations (drops QDR and Libra Data, which have 0)
installationsDf = pd.read_csv(summaryCountsFilePath, encoding='utf-8-sig')
installationsDf = installationsDf[installationsDf['distinct_affiliation_name_count'] > 0].reset_index(drop=True)

# Data quality checks
print(f'Row count (expecting 14): {len(installationsDf)}')
print(f'Missing values:\n{installationsDf.isna().sum()}')
print(f"Duplicate installation URLs: {installationsDf['installation_url'].duplicated().sum()}")

# Load versions found earlier or added by hand, if any
knownVersionsDict = {}
if os.path.exists(outputFilePath):
    knownVersionsDf = pd.read_csv(outputFilePath, encoding='utf-8-sig')
    knownVersionsDf = knownVersionsDf.dropna(subset=['dataverse_software_version'])
    knownVersionsDict = dict(zip(knownVersionsDf['installation_url'], knownVersionsDf['dataverse_software_version']))

versionsList = []
failuresList = []

loopObj = tqdm(bar_format=tqdmBarFormat, iterable=installationsDf.to_dict('records'))
for row in loopObj:
    installationUrl = row['installation_url']
    loopObj.set_postfix_str(installationUrl)

    dataverseVersion = knownVersionsDict.get(installationUrl)

    # Only call the API if the version isn't already known
    if dataverseVersion is None:
        try:
            versionDict = dataverse_functions.get_dataverse_installation_version(
                installationUrl, headers=headers)
            dataverseVersion = versionDict['dataverseVersion']

            # The function returns a status code instead of a version if the installation can't be reached
            if not isinstance(dataverseVersion, str):
                failuresList.append({
                    'installation_url': installationUrl,
                    'error': f'No version returned: {dataverseVersion}'})
                dataverseVersion = None
        except Exception as e:
            failuresList.append({
                'installation_url': installationUrl,
                'error': f'{type(e).__name__}: {e}'})
        # Pause between API calls to avoid rate limits
        sleep(2)

    versionsList.append({
        'installation_name': row['installation_name'],
        'installation_url': installationUrl,
        'dataverse_software_version': dataverseVersion})

versionsDf = pd.DataFrame(versionsList)

print(f'Failures: {len(failuresList)}')
for failure in failuresList:
    print(failure)

# Saves a CSV file of versions only; no raw source data files are overwritten
versionsDf.to_csv(outputFilePath, index=False, encoding='utf-8-sig')
print(f'Saved {len(versionsDf)} rows to {outputFilePath}')
print(versionsDf[['installation_name', 'dataverse_software_version']].to_string(index=False))
