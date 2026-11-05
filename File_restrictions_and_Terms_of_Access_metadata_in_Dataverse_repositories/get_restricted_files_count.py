'''
Parse Dataverse JSON metadata exports to record in a CSV file which datasets have restricted files and which do not
(and which are in repositories that aren't recording if files are restricted - https://github.com/IQSS/dataverse/issues/4645)
'''

import glob
import os
import csv
import json

# Save path and name of CSV file that this script will create
csvfile = '/Users/juliangautier/Desktop/file_restrictions.csv'

with open(csvfile, mode='w') as metadatafile:
    metadatafile = csv.writer(metadatafile, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)

    # Create header row
    metadatafile.writerow(['datasetVersionId', 'persistentUrl', 'restricted_files', 'file_access_request'])

# Save path of directory containing Dataverse JSON metadata exports
# jsonDirectory = '/Users/juliangautier/Desktop/dv_installation_metadata_database-all_dataset_versions/all_json_metadata_files'
jsonDirectory = '/Users/juliangautier/Desktop/dv_installation_metadata_database-all_dataset_versions/all_json_metadata_files'

# Save number of files in jsonDirectory to 'total' variable
total = len(os.listdir(jsonDirectory))

# Create variable for tracking of Dataverse JSON files parsed
datasetCount = 0

print('Getting metadata...')

for jsonfile in glob.glob(os.path.join(jsonDirectory, '*.json')):  # For each JSON file in a folder
    with open(jsonfile, 'r') as f1:  # Open each file in read mode
        datasetMetadata = f1.read()  # Copy content to datasetMetadata variable
        datasetMetadata = json.loads(datasetMetadata)  # Load content in variable as a json object

    # print('Getting info for %s' % (file))

    datasetCount += 1

    # Save datasetVersionId and persistentUrl of each file (used to identify datasets/versions and join with other tables)
    datasetVersionId = datasetMetadata['data']['datasetVersion']['id']
    persistentUrl = datasetMetadata['data']['persistentUrl']

    # Record if there are no files
    if len(datasetMetadata['data']['datasetVersion']['files']) == 0:
        restrictedFiles = 'NA (no files)'

    # If there are files...
    elif len(datasetMetadata['data']['datasetVersion']['files']) > 0:
        # If 'restricted' key doesn't exist, repository's JSON export doesn't include if files are restricted or not
        if 'restricted' not in datasetMetadata['data']['datasetVersion']['files'][0]:
            restrictedFiles = 'NA (not recorded)'
        # If there are restricted keys, count the number of restricted files
        elif 'restricted' in datasetMetadata['data']['datasetVersion']['files'][0]:
            restrictedCount = 0
            for file in datasetMetadata['data']['datasetVersion']['files']:
                if file['restricted'] is True:
                    restrictedCount += 1
            # Record if there are no restricted files
            if restrictedCount == 0:
                restrictedFiles = False
            # Otherwise record that there's one or more restricted files
            else:
                restrictedFiles = True

    # Record if file request is enabled

    # If fileAccessRequest key doesn't exist, repository's JSON export doesn't include info about file request feature
    if 'fileAccessRequest' not in datasetMetadata['data']['datasetVersion']:
        fileAccessRequest = 'NA (not recorded)'

    # If repository's JSON export does include info about file request feature, record if file request is enabled or not
    else:
        fileAccessRequest = datasetMetadata['data']['datasetVersion']['fileAccessRequest']

    # Append fields to the csv file
    with open(csvfile, mode='a') as metadatafile:
        metadatafile = csv.writer(metadatafile, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)

        # Create new row
        metadatafile.writerow([datasetVersionId, persistentUrl, restrictedFiles, fileAccessRequest])

    print('%s of %s' % (datasetCount, total))
