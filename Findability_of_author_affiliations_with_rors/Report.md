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

