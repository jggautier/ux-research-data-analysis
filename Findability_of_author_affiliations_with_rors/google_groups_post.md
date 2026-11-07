Subject line:

Body:

Hi everyone,

As we're working on helping people more easily find data in Dataverse repositories by increasing the use of persistent identifiers, I've been helping troubleshoot one or more bugs that can make data than we intended harder to find. In a few GitHub issues where we track work related to Harvard Dataverse, I've been tracking what I've been doing and learning. But since I've learned that the bug can affect other installations' users and datasets, I'm posting what I've learned here so folks in the Dataverse community are aware, especially folks managing installations.

The bug or bugs can affect users of and datasets published in at least 14 of the Dataverse installations we know about, which have dataset deposit forms with Author Affiliation fields that have been redesigned to let depositors choose organizations from the ROR API.

{screenshot of redesigned_author_affiliation_field}

When a depositor chooses one of the field's suggestions, like that second International Labour Organization option in the screenshot above, Dataverse should:
- index that organization's name and its ROR URL, so that when people search for datasets with that author affiliation by name or by ROR URL, they see that dataset in their search results
- add that organization name and ROR URL in the "DataCite/Datacite" export (and eventually the OpenAIRE/oai_datacite export ([IQSS/dataverse/issues/12297](https://github.com/IQSS/dataverse/issues/12297)))

But I've found cases in those 14 Dataverse installations where:
- datasets' author affiliation names aren't indexed, so when users do name-based searches for datasets by author affiliation, datasets are missing
- datasets' "DataCite/Datacite" exports include this author affiliation information in a way that DataCite's systems don't expect, affecting how findable those datasets are for users of DataCite's API and of dashboards and other platforms and services, like [DataCite Commons](https://commons.datacite.org), that use DataCite's API.

To find these installations and example datasets in them, I used [information about all known Dataverse installations](https://doi.org/10.7910/DVN/LVVOER), which I collected in late August 2026, so I think it's possible that more installations' users and datasets have been affected.



*About why this is happening and potential fixes*, I've seen in Harvard Dataverse that the problem involves the installation database's externalvocabularyvalue table. When a user does an author-affiliation-name-based search and there are datasets with author affiliations that include that organization's ROR, if that ROR isn't in the externalvocabularyvalue table, the user's search results don't include the datasets with author affiliations that include that organization's ROR. For example, the links for Harvard Dataverse in the list below point to a dataset with an author whose affiliation is Western Governors University. The installation recorded the ROR, https://ror.org/0210dff90, but in the installation's externalvocabularyvalue table, there's no entry for that ROR.

So I'm wondering if other installations' externalvocabularyvalue tables are missing RORs


Why aren't the RORs in the table?

FWIW: When RORs are accessed in a CVoc field and the table doesn't have an entry, Dataverse should try to retrieve info about it from the ROR server. If that fails, it could be due to typos (are the missing RORs in exactly the same format as ones that work?), or a problem in the filtering setup for the ROR script being used. If there was a past problem, and the dataset hasn't been indexed since, it could be that nothing has triggered an attempt to contact ror.org since the problem.

If entries are in the table, I can think of two possible issues:

There was also a historic issue when ROR switched API versions which could cause partial entries in the CVoc table. If those aren't cleared, they could also cause a problem with names being resolved.
If the datasets haven't been reindexed successfully since the table was updated, they wouldn't have the names available (so if they were indexed when there was a problem contacting ROR and haven't been reindexed since, they would be searchable by affiliation name).


Here's a list of those 14 Dataverse installations, with links to example datasets; links for name-based and ROR-based searches for author affiliations; and links to "Datacite" exports and DataCite API calls. I also listed the Dataverse software version that each installation is running, in case that's a factor.

[BSC Dataverse](https://dataverse.bsc.es), v6.10.1
- Author affiliation (ROR URL): Institut Català de Nanociència i Nanotecnologia (https://ror.org/00k1qja49)
- https://doi.org/10.82201/UY2NDS - version 1.0
- [Name-based search for author affiliation](https://dataverse.bsc.es/dataverse/bsc/?q=authorAffiliation:"Institut+Català+de+Nanociència+i+Nanotecnologia"&fq1=publicationStatus:"Published"&types=datasets)
- [ROR-based search for author affiliation](https://dataverse.bsc.es/dataverse/bsc/?q=authorAffiliation:"https://ror.org/00k1qja49"&fq1=publicationStatus:"Published"&types=datasets)
- ["Datacite" export](https://dataverse.bsc.es/api/datasets/export?exporter=Datacite&persistentId=doi:10.82201/UY2NDS)
- [DataCite API call](https://api.datacite.org/dois/10.82201/UY2NDS)

[CORA. Research Data Repository (RDR)](https://dataverse.csuc.cat), v6.10.1
- Author affiliation (ROR URL): Instituto de Biomedicina de Valencia (https://ror.org/05pq8vh42)
- https://doi.org/10.34810/DATA2513 - version 1.2
- [Name-based search for author affiliation](https://dataverse.csuc.cat/dataverse/cat/?q=authorAffiliation:"Instituto+de+Biomedicina+de+Valencia"&fq1=publicationStatus:"Published"&types=datasets)
- [ROR-based search for author affiliation](https://dataverse.csuc.cat/dataverse/cat/?q=authorAffiliation:"https://ror.org/05pq8vh42"&fq1=publicationStatus:"Published"&types=datasets)
- ["Datacite" export](https://dataverse.csuc.cat/api/datasets/export?exporter=Datacite&persistentId=doi:10.34810/DATA2513)
- [DataCite API call](https://api.datacite.org/dois/10.34810/DATA2513)

[DANS Data Station Archaeology](https://archaeology.datastations.nl), v6.10.1 DANS-DataStation-PATCH-9
- Author affiliation (ROR URL): Gemeente Eindhoven (https://ror.org/04dyx6987)
- https://doi.org/10.17026/AR/Z1TR4N - version 1.0
- [Name-based search for author affiliation](https://archaeology.datastations.nl/dataverse/root/?q=authorAffiliation:"Gemeente+Eindhoven"&fq1=publicationStatus:"Published"&types=datasets)
- [ROR-based search for author affiliation](https://archaeology.datastations.nl/dataverse/root/?q=authorAffiliation:"https://ror.org/04dyx6987"&fq1=publicationStatus:"Published"&types=datasets)
- ["Datacite" export](https://archaeology.datastations.nl/api/datasets/export?exporter=Datacite&persistentId=doi:10.17026/AR/Z1TR4N)
- [DataCite API call](https://api.datacite.org/dois/10.17026/AR/Z1TR4N)

[DANS Data Station Life Sciences](https://lifesciences.datastations.nl), v6.10.1 DANS-DataStation-PATCH-9
- Author affiliation (ROR URL): Global Climate Forum (https://ror.org/02tce8t86)
- https://doi.org/10.17026/LS/SXZKOX - version 1.0
- [Name-based search for author affiliation](https://lifesciences.datastations.nl/dataverse/root/?q=authorAffiliation:"Global+Climate+Forum"&fq1=publicationStatus:"Published"&types=datasets)
- [ROR-based search for author affiliation](https://lifesciences.datastations.nl/dataverse/root/?q=authorAffiliation:"https://ror.org/02tce8t86"&fq1=publicationStatus:"Published"&types=datasets)
- ["Datacite" export](https://lifesciences.datastations.nl/api/datasets/export?exporter=Datacite&persistentId=doi:10.17026/LS/SXZKOX)
- [DataCite API call](https://api.datacite.org/dois/10.17026/LS/SXZKOX)

[DANS Data Station Physical and Technical Sciences](https://phys-techsciences.datastations.nl), v6.10.1 DANS-DataStation-PATCH-9
- Author affiliation (ROR URL): University of Groningen (https://ror.org/012p63287)
- https://doi.org/10.17026/PT/QEZHYF - version 1.0
- [Name-based search for author affiliation](https://phys-techsciences.datastations.nl/dataverse/root/?q=authorAffiliation:"University+of+Groningen"&fq1=publicationStatus:"Published"&types=datasets)
- [ROR-based search for author affiliation](https://phys-techsciences.datastations.nl/dataverse/root/?q=authorAffiliation:"https://ror.org/012p63287"&fq1=publicationStatus:"Published"&types=datasets)
- ["Datacite" export](https://phys-techsciences.datastations.nl/api/datasets/export?exporter=Datacite&persistentId=doi:10.17026/PT/QEZHYF)
- [DataCite API call](https://api.datacite.org/dois/10.17026/PT/QEZHYF)

[DANS Data Station Social Sciences and Humanities](https://ssh.datastations.nl), v6.10.1 DANS-DataStation-PATCH-9
- Author affiliation (ROR URL): Centraal Bureau voor de Statistiek (https://ror.org/0408v4c28)
- https://doi.org/10.17026/DANS-Z6C-NWP9 - version 4.1
- [Name-based search for author affiliation](https://ssh.datastations.nl/dataverse/root/?q=authorAffiliation:"Centraal+Bureau+voor+de+Statistiek"&fq1=publicationStatus:"Published"&types=datasets)
- [ROR-based search for author affiliation](https://ssh.datastations.nl/dataverse/root/?q=authorAffiliation:"https://ror.org/0408v4c28"&fq1=publicationStatus:"Published"&types=datasets)
- ["Datacite" export](https://ssh.datastations.nl/api/datasets/export?exporter=Datacite&persistentId=doi:10.17026/DANS-Z6C-NWP9)
- [DataCite API call](https://api.datacite.org/dois/10.17026/DANS-Z6C-NWP9)

[DaRUS](https://darus.uni-stuttgart.de), v6.12.1
- Author affiliation (ROR URL): Université de Picardie Jules Verne (https://ror.org/01gyxrk03)
- https://doi.org/10.18419/DARUS-5604 - version 1.0
- [Name-based search for author affiliation](https://darus.uni-stuttgart.de/dataverse/darus/?q=authorAffiliation:"Université+de+Picardie+Jules+Verne"&fq1=publicationStatus:"Published"&types=datasets)
- [ROR-based search for author affiliation](https://darus.uni-stuttgart.de/dataverse/darus/?q=authorAffiliation:"https://ror.org/01gyxrk03"&fq1=publicationStatus:"Published"&types=datasets)
- ["Datacite" export](https://darus.uni-stuttgart.de/api/datasets/export?exporter=Datacite&persistentId=doi:10.18419/DARUS-5604)
- [DataCite API call](https://api.datacite.org/dois/10.18419/DARUS-5604)

[Dataverse e-cienciaDatos](https://edatos.consorciomadrono.es), v6.11 ConsorcioMadroño_1.3
- Author affiliation (ROR URL): Autonomous University of San Luis Potosí (https://ror.org/000917t60)
- https://doi.org/10.21950/A2PYL0 - version 2.0
- [Name-based search for author affiliation](https://edatos.consorciomadrono.es/dataverse/Madrono/?q=authorAffiliation:"Autonomous+University+of+San+Luis+Potosí"&fq1=publicationStatus:"Published"&types=datasets)
- [ROR-based search for author affiliation](https://edatos.consorciomadrono.es/dataverse/Madrono/?q=authorAffiliation:"https://ror.org/000917t60"&fq1=publicationStatus:"Published"&types=datasets)
- ["Datacite" export](https://edatos.consorciomadrono.es/api/datasets/export?exporter=Datacite&persistentId=doi:10.21950/A2PYL0)
- [DataCite API call](https://api.datacite.org/dois/10.21950/A2PYL0)

[DataverseNL](https://dataverse.nl), v6.10.1 DANS-DataStation-PATCH-9
- Author affiliation (ROR URL): Institute of Ethnology and Social Anthropology of the Slovak Academy of Sciences (https://ror.org/01y3dn551)
- https://doi.org/10.34894/0S4P4M - version 1.0
- [Name-based search for author affiliation](https://dataverse.nl/dataverse/root/?q=authorAffiliation:"Institute+of+Ethnology+and+Social+Anthropology+of+the+Slovak+Academy+of+Sciences"&fq1=publicationStatus:"Published"&types=datasets)
- [ROR-based search for author affiliation](https://dataverse.nl/dataverse/root/?q=authorAffiliation:"https://ror.org/01y3dn551"&fq1=publicationStatus:"Published"&types=datasets)
- ["Datacite" export](https://dataverse.nl/api/datasets/export?exporter=Datacite&persistentId=doi:10.34894/0S4P4M)
- [DataCite API call](https://api.datacite.org/dois/10.34894/0S4P4M)

[DataverseNO](https://dataverse.no), v6.11
- Author affiliation (ROR URL): University of Gothenburg (https://ror.org/01tm6cn81)
- https://doi.org/10.18710/KQIA63 - version 1.0
- [Name-based search for author affiliation](https://dataverse.no/dataverse/root/?q=authorAffiliation:"University+of+Gothenburg"&fq1=publicationStatus:"Published"&types=datasets)
- [ROR-based search for author affiliation](https://dataverse.no/dataverse/root/?q=authorAffiliation:"https://ror.org/01tm6cn81"&fq1=publicationStatus:"Published"&types=datasets)
- ["Datacite" export](https://dataverse.no/api/datasets/export?exporter=Datacite&persistentId=doi:10.18710/KQIA63)
- [DataCite API call](https://api.datacite.org/dois/10.18710/KQIA63)

[Harvard Dataverse](https://dataverse.harvard.edu), v6.12.1
- Author affiliation (ROR URL): Western Governors University (https://ror.org/0210dff90)
- https://doi.org/10.7910/DVN/0IWOFY - version 3.0
- [Name-based search for author affiliation](https://dataverse.harvard.edu/dataverse/harvard/?q=authorAffiliation:"Western+Governors+University"&fq1=publicationStatus:"Published"&types=datasets)
- [ROR-based search for author affiliation](https://dataverse.harvard.edu/dataverse/harvard/?q=authorAffiliation:"https://ror.org/0210dff90"&fq1=publicationStatus:"Published"&types=datasets)
- ["Datacite" export](https://dataverse.harvard.edu/api/datasets/export?exporter=Datacite&persistentId=doi:10.7910/DVN/0IWOFY)
- [DataCite API call](https://api.datacite.org/dois/10.7910/DVN/0IWOFY)

[MBLWHOI Library Dataverse](https://dataverse.whoi.edu), v6.11 build master-dd1859d
- Author affiliation (ROR URL): University of Washington (https://ror.org/00cvxb145)
- https://doi.org/10.26027/DATA9FOZFB - version 1.0
- [Name-based search for author affiliation](https://dataverse.whoi.edu/dataverse/root/?q=authorAffiliation:"University+of+Washington"&fq1=publicationStatus:"Published"&types=datasets)
- [ROR-based search for author affiliation](https://dataverse.whoi.edu/dataverse/root/?q=authorAffiliation:"https://ror.org/00cvxb145"&fq1=publicationStatus:"Published"&types=datasets)
- ["Datacite" export](https://dataverse.whoi.edu/api/datasets/export?exporter=Datacite&persistentId=doi:10.26027/DATA9FOZFB)
- [DataCite API call](https://api.datacite.org/dois/10.26027/DATA9FOZFB)

[Texas Data Repository Dataverse](https://dataverse.tdl.org), v6.10.1 build master-300d5b5
- Author affiliation (ROR URL): United States Food and Drug Administration (https://ror.org/034xvzb47)
- https://doi.org/10.18738/T8/H2MXKU - version 1.1
- [Name-based search for author affiliation](https://dataverse.tdl.org/dataverse/root/?q=authorAffiliation:"United+States+Food+and+Drug+Administration"&fq1=publicationStatus:"Published"&types=datasets)
- [ROR-based search for author affiliation](https://dataverse.tdl.org/dataverse/root/?q=authorAffiliation:"https://ror.org/034xvzb47"&fq1=publicationStatus:"Published"&types=datasets)
- ["Datacite" export](https://dataverse.tdl.org/api/datasets/export?exporter=Datacite&persistentId=doi:10.18738/T8/H2MXKU)
- [DataCite API call](https://api.datacite.org/dois/10.18738/T8/H2MXKU)

[TUDOdata](https://data.tu-dortmund.de), v6.11
- Author affiliation (ROR URL): Czech Academy of Sciences, Institute of Organic Chemistry and Biochemistry (https://ror.org/04nfjn472)
- https://doi.org/10.17877/TUDODATA-2025-MGF1E8QB - version 1.0
- [Name-based search for author affiliation](https://data.tu-dortmund.de/dataverse/root/?q=authorAffiliation:"Czech+Academy+of+Sciences,+Institute+of+Organic+Chemistry+and+Biochemistry"&fq1=publicationStatus:"Published"&types=datasets)
- [ROR-based search for author affiliation](https://data.tu-dortmund.de/dataverse/root/?q=authorAffiliation:"https://ror.org/04nfjn472"&fq1=publicationStatus:"Published"&types=datasets)
- ["Datacite" export](https://data.tu-dortmund.de/api/datasets/export?exporter=Datacite&persistentId=doi:10.17877/TUDODATA-2025-MGF1E8QB)
- [DataCite API call](https://api.datacite.org/dois/10.17877/TUDODATA-2025-MGF1E8QB)
