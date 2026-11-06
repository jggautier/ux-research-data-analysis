At least 16 Dataverse installations redesigned their dataset deposit form's author affiliation fields so that the field suggests an organization from the ROR API, and when users choose a suggested affiliation, their repository stores the organization's ROR URL.

Of those 16 Dataverse installations, 14 have datasets with some author affiliation RORs that have not been sent to DataCite (when the installation has registered a DOI for the dataset).

And when users search for datasets by the name of those author affiliations, those datasets are not included in users' search results.

I've listed those 14 Dataverse installations below with links to example datasets, name-based and ROR-based search links, and links to "Datacite" exports and DataCite API calls. I also listed the Dataverse software version that each installation is running, in case that's a factor.


Dataverse e-cienciaDatos (https://edatos.consorciomadrono.es)
- https://doi.org/10.21950/A2PYL0 V2
- [Name-based search](https://edatos.consorciomadrono.es/dataverse/Madrono/?q=authorAffiliation:%22Autonomous%20University%20of%20San%20Luis%20Potos%C3%AD%22&fq1=publicationStatus:%22Published%22&types=datasets)
- [ROR-based search](https://edatos.consorciomadrono.es/dataverse/Madrono/?q=authorAffiliation%3A%22https%3A%2F%2Fror.org%2F000917t60%22)
- ["Datacite" export](https://edatos.consorciomadrono.es/api/datasets/export?exporter=Datacite&persistentId=doi%3A10.21950/A2PYL0)
- [DataCite API call](https://api.datacite.org/dois/10.21950/A2PYL0)

Harvard Dataverse (https://dataverse.harvard.edu)
- https://doi.org/10.7910/DVN/0IWOFY V3
- [Name-based search](https://dataverse.harvard.edu/dataverse/harvard/?q=authorAffiliation:%22Western%20Governors%20University%22&fq1=publicationStatus:%22Published%22&types=datasets)
- [ROR-based search](https://dataverse.harvard.edu/dataverse/harvard/?q=authorAffiliation%3A%22https%3A%2F%2Fror.org%2F0210dff90%22)
- ["Datacite" export](https://dataverse.harvard.edu/api/datasets/export?exporter=Datacite&persistentId=doi%3A10.7910%2FDVN%2F0IWOFY)
- [DataCite API call](https://api.datacite.org/dois/10.7910/DVN/0IWOFY)

DataverseNL (https://dataverse.nl)
- https://doi.org/10.34894/0S4P4M V1
- [Name-based search](https://dataverse.nl/dataverse/root/?q=authorAffiliation:%22Institute%20of%20Ethnology%20and%20Social%20Anthropology%20of%20the%20Slovak%20Academy%20of%20Sciences%22&fq1=publicationStatus:%22Published%22&types=datasets)
- [ROR-based search](https://dataverse.nl/dataverse/root/?q=authorAffiliation%3A%22https%3A%2F%2Fror.org%2F01y3dn551%22)
- ["Datacite" export](https://dataverse.nl/api/datasets/export?exporter=Datacite&persistentId=doi%3A10.34894%2F0S4P4M)
- [DataCite API call](https://api.datacite.org/dois/10.34894/0S4P4M)

Texas Data Repository Dataverse (https://dataverse.tdl.org)
- https://doi.org/10.18738/T8/H2MXKU V1.1
- [Name-based search](https://dataverse.tdl.org/dataverse/root/?q=authorAffiliation:%22United%20States%20Food%20and%20Drug%20Administration%22&fq1=publicationStatus:%22Published%22&types=datasets)
- [ROR-based search](https://dataverse.tdl.org/dataverse/root/?q=authorAffiliation%3A%22https%3A%2F%2Fror.org%2F034xvzb47%22)
- ["Datacite" export](https://dataverse.tdl.org/api/datasets/export?exporter=Datacite&persistentId=doi%3A10.18738%2FT8%2FH2MXKU)
- [DataCite API call](https://api.datacite.org/dois/10.18738/T8/H2MXKU)

DataverseNO (https://dataverse.no)
- https://doi.org/10.18710/KQIA63 V1
- [Name-based search](https://dataverse.no/dataverse/root/?q=authorAffiliation:%22University%20of%20Gothenburg%22&fq1=publicationStatus:%22Published%22&types=datasets)
- [ROR-based search](https://dataverse.no/dataverse/root/?q=authorAffiliation%3A%22https%3A%2F%2Fror.org%2F01tm6cn81%22)
- ["Datacite" export](https://dataverse.no/api/datasets/export?exporter=Datacite&persistentId=doi%3A10.18710%2FKQIA63)
- [DataCite API call](https://api.datacite.org/dois/10.18710/KQIA63)

DANS Data Station Social Sciences and Humanities (https://ssh.datastations.nl)
- https://doi.org/10.17026/DANS-Z6C-NWP9 V4.1
- [Name-based search](https://ssh.datastations.nl/dataverse/root/?q=authorAffiliation:%22Centraal%20Bureau%20voor%20de%20Statistiek%22&fq1=publicationStatus:%22Published%22&types=datasets)
- [ROR-based search](https://ssh.datastations.nl/dataverse/root/?q=authorAffiliation%3A%22https%3A%2F%2Fror.org%2F0408v4c28%22)
- ["Datacite" export](https://ssh.datastations.nl/api/datasets/export?exporter=Datacite&persistentId=doi%3A10.17026%2FDANS-Z6C-NWP9)
- [DataCite API call](https://api.datacite.org/dois/10.17026/DANS-Z6C-NWP9)

DANS Data Station Life Sciences (https://lifesciences.datastations.nl)
- https://doi.org/10.17026/LS/SXZKOX V1
- [Name-based search](https://lifesciences.datastations.nl/dataverse/root/?q=authorAffiliation:%22Global%20Climate%20Forum%22&fq1=publicationStatus:%22Published%22&types=datasets)
- [ROR-based search](https://lifesciences.datastations.nl/dataverse/root/?q=authorAffiliation%3A%22https%3A%2F%2Fror.org%2F02tce8t86%22)
- ["Datacite" export](https://lifesciences.datastations.nl/api/datasets/export?exporter=Datacite&persistentId=doi%3A10.17026%2FLS%2FSXZKOX)
- [DataCite API call](https://api.datacite.org/dois/10.17026/LS/SXZKOX)

DANS Data Station Archaeology (https://archaeology.datastations.nl)
- https://doi.org/10.17026/AR/Z1TR4N V1
- [Name-based search](https://archaeology.datastations.nl/dataverse/root/?q=authorAffiliation:%22Gemeente%20Eindhoven%22&fq1=publicationStatus:%22Published%22&types=datasets)
- [ROR-based search](https://archaeology.datastations.nl/dataverse/root/?q=authorAffiliation%3A%22https%3A%2F%2Fror.org%2F04dyx6987%22)
- ["Datacite" export](https://archaeology.datastations.nl/api/datasets/export?exporter=Datacite&persistentId=doi%3A10.17026%2FAR%2FZ1TR4N)
- [DataCite API call](https://api.datacite.org/dois/10.17026/AR/Z1TR4N)

BSC Dataverse (https://dataverse.bsc.es)
- https://doi.org/10.82201/UY2NDS V1
- [Name-based search](https://dataverse.bsc.es/dataverse/bsc/?q=authorAffiliation:%22Institut%20Catal%C3%A0%20de%20Nanoci%C3%A8ncia%20i%20Nanotecnologia%22&fq1=publicationStatus:%22Published%22&types=datasets)
- [ROR-based search](https://dataverse.bsc.es/dataverse/bsc/?q=authorAffiliation%3A%22https%3A%2F%2Fror.org%2F00k1qja49%22)
- ["Datacite" export](https://dataverse.bsc.es/api/datasets/export?exporter=Datacite&persistentId=doi%3A10.82201%2FUY2NDS)
- [DataCite API call](https://api.datacite.org/dois/10.82201/UY2NDS)

DANS Data Station Physical and Technical Sciences (https://phys-techsciences.datastations.nl)
- https://doi.org/10.17026/PT/QEZHYF V1
- [Name-based search](https://phys-techsciences.datastations.nl/dataverse/root/?q=authorAffiliation:%22University%20of%20Groningen%22&fq1=publicationStatus:%22Published%22&types=datasets)
- [ROR-based search](https://phys-techsciences.datastations.nl/dataverse/root/?q=authorAffiliation%3A%22https%3A%2F%2Fror.org%2F012p63287%22)
- ["Datacite" export](https://phys-techsciences.datastations.nl/api/datasets/export?exporter=Datacite&persistentId=doi%3A10.17026%2FPT%2FQEZHYF)
- [DataCite API call](https://api.datacite.org/dois/10.17026/PT/QEZHYF)

MBLWHOI Library Dataverse (https://dataverse.whoi.edu)
- https://doi.org/10.26027/DATA9FOZFB V1
- [Name-based search](https://dataverse.whoi.edu/dataverse/root/?q=authorAffiliation:%22University%20of%20Washington%22&fq1=publicationStatus:%22Published%22&types=datasets)
- [ROR-based search](https://dataverse.whoi.edu/dataverse/root/?q=authorAffiliation%3A%22https%3A%2F%2Fror.org%2F00cvxb145%22)
- ["Datacite" export](https://dataverse.whoi.edu/api/datasets/export?exporter=Datacite&persistentId=doi%3A10.26027%2FDATA9FOZFB)
- [DataCite API call](https://api.datacite.org/dois/10.26027/DATA9FOZFB)

TUDOdata (https://data.tu-dortmund.de)
- https://doi.org/10.17877/TUDODATA-2025-MGF1E8QB V1
- [Name-based search](https://data.tu-dortmund.de/dataverse/root/?q=authorAffiliation:%22Czech%20Academy%20of%20Sciences%2C%20Institute%20of%20Organic%20Chemistry%20and%20Biochemistry%22&fq1=publicationStatus:%22Published%22&types=datasets)
- [ROR-based search](https://data.tu-dortmund.de/dataverse/root/?q=authorAffiliation%3A%22https%3A%2F%2Fror.org%2F04nfjn472%22)
- ["Datacite" export](https://data.tu-dortmund.de/api/datasets/export?exporter=Datacite&persistentId=doi%3A10.17877%2FTUDODATA-2025-MGF1E8QB)
- [DataCite API call](https://api.datacite.org/dois/10.17877/TUDODATA-2025-MGF1E8QB)

DaRUS (https://darus.uni-stuttgart.de)
- https://doi.org/10.18419/DARUS-5604 V1
- [Name-based search](https://darus.uni-stuttgart.de/dataverse/darus/?q=authorAffiliation:%22Universit%C3%A9%20de%20Picardie%20Jules%20Verne%22&fq1=publicationStatus:%22Published%22&types=datasets)
- [ROR-based search](https://darus.uni-stuttgart.de/dataverse/darus/?q=authorAffiliation%3A%22https%3A%2F%2Fror.org%2F01gyxrk03%22)
- ["Datacite" export](https://darus.uni-stuttgart.de/api/datasets/export?exporter=Datacite&persistentId=doi%3A10.18419%2FDARUS-5604)
- [DataCite API call](https://api.datacite.org/dois/10.18419/DARUS-5604)

CORA. Research Data Repository (RDR) (https://dataverse.csuc.cat)
- https://doi.org/10.34810/DATA2513 V1.2
- [Name-based search](https://dataverse.csuc.cat/dataverse/cat/?q=authorAffiliation:%22Instituto%20de%20Biomedicina%20de%20Valencia%22&fq1=publicationStatus:%22Published%22&types=datasets)
- [ROR-based search](https://dataverse.csuc.cat/dataverse/cat/?q=authorAffiliation%3A%22https%3A%2F%2Fror.org%2F05pq8vh42%22)
- ["Datacite" export](https://dataverse.csuc.cat/api/datasets/export?exporter=Datacite&persistentId=doi%3A10.34810%2FDATA2513)
- [DataCite API call](https://api.datacite.org/dois/10.34810/DATA2513)
