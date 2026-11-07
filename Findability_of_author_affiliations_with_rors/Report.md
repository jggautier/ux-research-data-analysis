Subject line:

Body:

Hi everyone,

As we're working on helping people more easily find data in Dataverse repositories by increasing the use of persistent identifiers, I've been helping troubleshoot one or more bugs that can make data harder to discover.



At least 16 Dataverse installations redesigned their dataset deposit form's author affiliation fields so that the field suggests an organization from the ROR API, and when users choose a suggested affiliation, their repository stores the organization's ROR URL.

Of those 16 Dataverse installations, 14 have datasets with some author affiliation RORs that have not been sent to DataCite (when the installation has registered a DOI for the dataset).

And when users search for datasets by the name of those author affiliations, those datasets are not included in users' search results.

I've listed those 14 Dataverse installations below with links to example datasets, name-based and ROR-based search links, and links to "Datacite" exports and DataCite API calls. I also listed the Dataverse software version that each installation is running, in case that's a factor.


[Dataverse e-cienciaDatos](https://edatos.consorciomadrono.es), v6.11 ConsorcioMadroño_1.3
- Author affiliation (ROR URL): Autonomous University of San Luis Potosí (https://ror.org/000917t60)
- https://doi.org/10.21950/A2PYL0 - version 2.0
- [Name-based search for author affiliation](https://edatos.consorciomadrono.es/dataverse/Madrono/?q=authorAffiliation:"Autonomous+University+of+San+Luis+Potosí"&fq1=publicationStatus:"Published"&types=datasets)
- [ROR-based search for author affiliation](https://edatos.consorciomadrono.es/dataverse/Madrono/?q=authorAffiliation:"https://ror.org/000917t60"&fq1=publicationStatus:"Published"&types=datasets)
- ["Datacite" export](https://edatos.consorciomadrono.es/api/datasets/export?exporter=Datacite&persistentId=doi:10.21950/A2PYL0)
- [DataCite API call](https://api.datacite.org/dois/10.21950/A2PYL0)

[Harvard Dataverse](https://dataverse.harvard.edu), v6.12.1
- Author affiliation (ROR URL): Western Governors University (https://ror.org/0210dff90)
- https://doi.org/10.7910/DVN/0IWOFY - version 3.0
- [Name-based search for author affiliation](https://dataverse.harvard.edu/dataverse/harvard/?q=authorAffiliation:"Western+Governors+University"&fq1=publicationStatus:"Published"&types=datasets)
- [ROR-based search for author affiliation](https://dataverse.harvard.edu/dataverse/harvard/?q=authorAffiliation:"https://ror.org/0210dff90"&fq1=publicationStatus:"Published"&types=datasets)
- ["Datacite" export](https://dataverse.harvard.edu/api/datasets/export?exporter=Datacite&persistentId=doi:10.7910/DVN/0IWOFY)
- [DataCite API call](https://api.datacite.org/dois/10.7910/DVN/0IWOFY)

[DataverseNL](https://dataverse.nl), v6.10.1 DANS-DataStation-PATCH-9
- Author affiliation (ROR URL): Institute of Ethnology and Social Anthropology of the Slovak Academy of Sciences (https://ror.org/01y3dn551)
- https://doi.org/10.34894/0S4P4M - version 1.0
- [Name-based search for author affiliation](https://dataverse.nl/dataverse/root/?q=authorAffiliation:"Institute+of+Ethnology+and+Social+Anthropology+of+the+Slovak+Academy+of+Sciences"&fq1=publicationStatus:"Published"&types=datasets)
- [ROR-based search for author affiliation](https://dataverse.nl/dataverse/root/?q=authorAffiliation:"https://ror.org/01y3dn551"&fq1=publicationStatus:"Published"&types=datasets)
- ["Datacite" export](https://dataverse.nl/api/datasets/export?exporter=Datacite&persistentId=doi:10.34894/0S4P4M)
- [DataCite API call](https://api.datacite.org/dois/10.34894/0S4P4M)

[Texas Data Repository Dataverse](https://dataverse.tdl.org), v6.10.1 build master-300d5b5
- Author affiliation (ROR URL): United States Food and Drug Administration (https://ror.org/034xvzb47)
- https://doi.org/10.18738/T8/H2MXKU - version 1.1
- [Name-based search for author affiliation](https://dataverse.tdl.org/dataverse/root/?q=authorAffiliation:"United+States+Food+and+Drug+Administration"&fq1=publicationStatus:"Published"&types=datasets)
- [ROR-based search for author affiliation](https://dataverse.tdl.org/dataverse/root/?q=authorAffiliation:"https://ror.org/034xvzb47"&fq1=publicationStatus:"Published"&types=datasets)
- ["Datacite" export](https://dataverse.tdl.org/api/datasets/export?exporter=Datacite&persistentId=doi:10.18738/T8/H2MXKU)
- [DataCite API call](https://api.datacite.org/dois/10.18738/T8/H2MXKU)

[DataverseNO](https://dataverse.no), v6.11
- Author affiliation (ROR URL): University of Gothenburg (https://ror.org/01tm6cn81)
- https://doi.org/10.18710/KQIA63 - version 1.0
- [Name-based search for author affiliation](https://dataverse.no/dataverse/root/?q=authorAffiliation:"University+of+Gothenburg"&fq1=publicationStatus:"Published"&types=datasets)
- [ROR-based search for author affiliation](https://dataverse.no/dataverse/root/?q=authorAffiliation:"https://ror.org/01tm6cn81"&fq1=publicationStatus:"Published"&types=datasets)
- ["Datacite" export](https://dataverse.no/api/datasets/export?exporter=Datacite&persistentId=doi:10.18710/KQIA63)
- [DataCite API call](https://api.datacite.org/dois/10.18710/KQIA63)

[DANS Data Station Social Sciences and Humanities](https://ssh.datastations.nl), v6.10.1 DANS-DataStation-PATCH-9
- Author affiliation (ROR URL): Centraal Bureau voor de Statistiek (https://ror.org/0408v4c28)
- https://doi.org/10.17026/DANS-Z6C-NWP9 - version 4.1
- [Name-based search for author affiliation](https://ssh.datastations.nl/dataverse/root/?q=authorAffiliation:"Centraal+Bureau+voor+de+Statistiek"&fq1=publicationStatus:"Published"&types=datasets)
- [ROR-based search for author affiliation](https://ssh.datastations.nl/dataverse/root/?q=authorAffiliation:"https://ror.org/0408v4c28"&fq1=publicationStatus:"Published"&types=datasets)
- ["Datacite" export](https://ssh.datastations.nl/api/datasets/export?exporter=Datacite&persistentId=doi:10.17026/DANS-Z6C-NWP9)
- [DataCite API call](https://api.datacite.org/dois/10.17026/DANS-Z6C-NWP9)

[DANS Data Station Life Sciences](https://lifesciences.datastations.nl), v6.10.1 DANS-DataStation-PATCH-9
- Author affiliation (ROR URL): Global Climate Forum (https://ror.org/02tce8t86)
- https://doi.org/10.17026/LS/SXZKOX - version 1.0
- [Name-based search for author affiliation](https://lifesciences.datastations.nl/dataverse/root/?q=authorAffiliation:"Global+Climate+Forum"&fq1=publicationStatus:"Published"&types=datasets)
- [ROR-based search for author affiliation](https://lifesciences.datastations.nl/dataverse/root/?q=authorAffiliation:"https://ror.org/02tce8t86"&fq1=publicationStatus:"Published"&types=datasets)
- ["Datacite" export](https://lifesciences.datastations.nl/api/datasets/export?exporter=Datacite&persistentId=doi:10.17026/LS/SXZKOX)
- [DataCite API call](https://api.datacite.org/dois/10.17026/LS/SXZKOX)

[DANS Data Station Archaeology](https://archaeology.datastations.nl), v6.10.1 DANS-DataStation-PATCH-9
- Author affiliation (ROR URL): Gemeente Eindhoven (https://ror.org/04dyx6987)
- https://doi.org/10.17026/AR/Z1TR4N - version 1.0
- [Name-based search for author affiliation](https://archaeology.datastations.nl/dataverse/root/?q=authorAffiliation:"Gemeente+Eindhoven"&fq1=publicationStatus:"Published"&types=datasets)
- [ROR-based search for author affiliation](https://archaeology.datastations.nl/dataverse/root/?q=authorAffiliation:"https://ror.org/04dyx6987"&fq1=publicationStatus:"Published"&types=datasets)
- ["Datacite" export](https://archaeology.datastations.nl/api/datasets/export?exporter=Datacite&persistentId=doi:10.17026/AR/Z1TR4N)
- [DataCite API call](https://api.datacite.org/dois/10.17026/AR/Z1TR4N)

[BSC Dataverse](https://dataverse.bsc.es), v6.10.1
- Author affiliation (ROR URL): Institut Català de Nanociència i Nanotecnologia (https://ror.org/00k1qja49)
- https://doi.org/10.82201/UY2NDS - version 1.0
- [Name-based search for author affiliation](https://dataverse.bsc.es/dataverse/bsc/?q=authorAffiliation:"Institut+Català+de+Nanociència+i+Nanotecnologia"&fq1=publicationStatus:"Published"&types=datasets)
- [ROR-based search for author affiliation](https://dataverse.bsc.es/dataverse/bsc/?q=authorAffiliation:"https://ror.org/00k1qja49"&fq1=publicationStatus:"Published"&types=datasets)
- ["Datacite" export](https://dataverse.bsc.es/api/datasets/export?exporter=Datacite&persistentId=doi:10.82201/UY2NDS)
- [DataCite API call](https://api.datacite.org/dois/10.82201/UY2NDS)

[DANS Data Station Physical and Technical Sciences](https://phys-techsciences.datastations.nl), v6.10.1 DANS-DataStation-PATCH-9
- Author affiliation (ROR URL): University of Groningen (https://ror.org/012p63287)
- https://doi.org/10.17026/PT/QEZHYF - version 1.0
- [Name-based search for author affiliation](https://phys-techsciences.datastations.nl/dataverse/root/?q=authorAffiliation:"University+of+Groningen"&fq1=publicationStatus:"Published"&types=datasets)
- [ROR-based search for author affiliation](https://phys-techsciences.datastations.nl/dataverse/root/?q=authorAffiliation:"https://ror.org/012p63287"&fq1=publicationStatus:"Published"&types=datasets)
- ["Datacite" export](https://phys-techsciences.datastations.nl/api/datasets/export?exporter=Datacite&persistentId=doi:10.17026/PT/QEZHYF)
- [DataCite API call](https://api.datacite.org/dois/10.17026/PT/QEZHYF)

[MBLWHOI Library Dataverse](https://dataverse.whoi.edu), v6.11 build master-dd1859d
- Author affiliation (ROR URL): University of Washington (https://ror.org/00cvxb145)
- https://doi.org/10.26027/DATA9FOZFB - version 1.0
- [Name-based search for author affiliation](https://dataverse.whoi.edu/dataverse/root/?q=authorAffiliation:"University+of+Washington"&fq1=publicationStatus:"Published"&types=datasets)
- [ROR-based search for author affiliation](https://dataverse.whoi.edu/dataverse/root/?q=authorAffiliation:"https://ror.org/00cvxb145"&fq1=publicationStatus:"Published"&types=datasets)
- ["Datacite" export](https://dataverse.whoi.edu/api/datasets/export?exporter=Datacite&persistentId=doi:10.26027/DATA9FOZFB)
- [DataCite API call](https://api.datacite.org/dois/10.26027/DATA9FOZFB)

[TUDOdata](https://data.tu-dortmund.de), v6.11
- Author affiliation (ROR URL): Czech Academy of Sciences, Institute of Organic Chemistry and Biochemistry (https://ror.org/04nfjn472)
- https://doi.org/10.17877/TUDODATA-2025-MGF1E8QB - version 1.0
- [Name-based search for author affiliation](https://data.tu-dortmund.de/dataverse/root/?q=authorAffiliation:"Czech+Academy+of+Sciences,+Institute+of+Organic+Chemistry+and+Biochemistry"&fq1=publicationStatus:"Published"&types=datasets)
- [ROR-based search for author affiliation](https://data.tu-dortmund.de/dataverse/root/?q=authorAffiliation:"https://ror.org/04nfjn472"&fq1=publicationStatus:"Published"&types=datasets)
- ["Datacite" export](https://data.tu-dortmund.de/api/datasets/export?exporter=Datacite&persistentId=doi:10.17877/TUDODATA-2025-MGF1E8QB)
- [DataCite API call](https://api.datacite.org/dois/10.17877/TUDODATA-2025-MGF1E8QB)

[DaRUS](https://darus.uni-stuttgart.de), v6.12.1
- Author affiliation (ROR URL): Université de Picardie Jules Verne (https://ror.org/01gyxrk03)
- https://doi.org/10.18419/DARUS-5604 - version 1.0
- [Name-based search for author affiliation](https://darus.uni-stuttgart.de/dataverse/darus/?q=authorAffiliation:"Université+de+Picardie+Jules+Verne"&fq1=publicationStatus:"Published"&types=datasets)
- [ROR-based search for author affiliation](https://darus.uni-stuttgart.de/dataverse/darus/?q=authorAffiliation:"https://ror.org/01gyxrk03"&fq1=publicationStatus:"Published"&types=datasets)
- ["Datacite" export](https://darus.uni-stuttgart.de/api/datasets/export?exporter=Datacite&persistentId=doi:10.18419/DARUS-5604)
- [DataCite API call](https://api.datacite.org/dois/10.18419/DARUS-5604)

[CORA. Research Data Repository (RDR)](https://dataverse.csuc.cat), v6.10.1
- Author affiliation (ROR URL): Instituto de Biomedicina de Valencia (https://ror.org/05pq8vh42)
- https://doi.org/10.34810/DATA2513 - version 1.2
- [Name-based search for author affiliation](https://dataverse.csuc.cat/dataverse/cat/?q=authorAffiliation:"Instituto+de+Biomedicina+de+Valencia"&fq1=publicationStatus:"Published"&types=datasets)
- [ROR-based search for author affiliation](https://dataverse.csuc.cat/dataverse/cat/?q=authorAffiliation:"https://ror.org/05pq8vh42"&fq1=publicationStatus:"Published"&types=datasets)
- ["Datacite" export](https://dataverse.csuc.cat/api/datasets/export?exporter=Datacite&persistentId=doi:10.34810/DATA2513)
- [DataCite API call](https://api.datacite.org/dois/10.34810/DATA2513)
