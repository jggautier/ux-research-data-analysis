"""Get the root collection URL of each installation that has author affiliations with RORs.

Re-uses the logic of notebooks/04_get_root_collection_aliases.ipynb:
- Installations are listed in data/processed/installations/summary_counts.csv
- Root collection aliases are fetched with dataverse_functions.get_root_collection_info()
- Aliases already in data/processed/root_collection_aliases.csv (including ones added
  by hand for installations that block the API call) are used instead of calling the API again

Saves data/processed/root_collection_urls.csv
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
knownAliasesFilePath = os.path.join(processedDataDir, 'root_collection_aliases.csv')
outputFilePath = os.path.join(processedDataDir, 'root_collection_urls.csv')

# Load installations that have author affiliations (drops QDR and Libra Data, which have 0)
installationsDf = pd.read_csv(summaryCountsFilePath, encoding='utf-8-sig')
installationsDf = installationsDf[installationsDf['distinct_affiliation_name_count'] > 0].reset_index(drop=True)

# Data quality checks
print(f'Row count (expecting 14): {len(installationsDf)}')
print(f'Missing values:\n{installationsDf.isna().sum()}')
print(f"Duplicate installation URLs: {installationsDf['installation_url'].duplicated().sum()}")

# Load aliases found earlier, if any
knownAliasesDict = {}
if os.path.exists(knownAliasesFilePath):
    knownAliasesDf = pd.read_csv(knownAliasesFilePath, encoding='utf-8-sig')
    knownAliasesDf = knownAliasesDf.dropna(subset=['root_alias'])
    knownAliasesDict = dict(zip(knownAliasesDf['installation_url'], knownAliasesDf['root_alias']))

rootCollectionsList = []
failuresList = []

loopObj = tqdm(bar_format=tqdmBarFormat, iterable=installationsDf.to_dict('records'))
for row in loopObj:
    installationUrl = row['installation_url']
    loopObj.set_postfix_str(installationUrl)

    rootAlias = knownAliasesDict.get(installationUrl)

    # Only call the API if the alias isn't already known
    if rootAlias is None:
        try:
            rootCollectionInfoDict = dataverse_functions.get_root_collection_info(
                installationUrl, headers=headers)
            rootAlias = rootCollectionInfoDict['rootAlias']
        except Exception as e:
            failuresList.append({
                'installation_url': installationUrl,
                'error': f'{type(e).__name__}: {e}'})
        # Pause between API calls to avoid rate limits
        sleep(2)

    rootCollectionUrl = f'{installationUrl}/dataverse/{rootAlias}' if rootAlias else None
    rootCollectionsList.append({
        'installation_name': row['installation_name'],
        'installation_url': installationUrl,
        'root_alias': rootAlias,
        'root_collection_url': rootCollectionUrl})

rootCollectionsDf = pd.DataFrame(rootCollectionsList)

print(f'Failures: {len(failuresList)}')
for failure in failuresList:
    print(failure)

# Saves a new CSV file; no raw source data files are overwritten
rootCollectionsDf.to_csv(outputFilePath, index=False, encoding='utf-8-sig')
print(f'Saved {len(rootCollectionsDf)} rows to {outputFilePath}')
print(rootCollectionsDf[['installation_name', 'root_collection_url']].to_string(index=False))
