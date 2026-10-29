# Align OpenAIRE/oai_datacite export's publicationYear logic with DataCite/Datacite export's logic

**Overview of the Feature Request**

The OpenAIRE/oai_datacite export should use the same logic as the DataCite/Datacite export when determining the value of the `publicationYear` element. Currently, the two exports use different logic to determine the publication year, which means the same dataset can produce different `publicationYear` values depending on which export is used. Aligning the logic would make the two exports more consistent.

This issue is part of a larger effort to align both metadata exports, described in https://github.com/IQSS/dataverse/issues/11916.

**What kind of user is the feature intended for?**

API User, Superuser, and Sysadmin

**What inspired the request?**

This is part of a larger effort to align the OpenAIRE/oai_datacite and DataCite/Datacite metadata exports. There is more context at https://github.com/IQSS/dataverse/issues/11916.

**What existing behavior do you want changed?**

Currently, the DataCite/Datacite export determines `publicationYear` using the following logic:
- Dataverse uses the year of the date field that the user has set as the citation date, using the API endpoint ["Set Citation Date Field Type for a Dataset"](https://guides.dataverse.org/en/6.10/api/native-api.html#set-citation-date-field-type-for-a-dataset)
- If the user hasn't set the dataset's citation date using that API endpoint, then the DataCite export uses the latest of:
  - the Publication Date, when the dataset's first version was published in the Dataverse repository, or
  - the embargo citation date, being the latest date of embargoed files on the dataset's first version
- If the latest dataset version is a draft and the user hasn't set any embargo dates for files in the dataset, the DataCite export uses the date when the user last updated the draft version

The OpenAIRE/oai_datacite export uses different logic: it uses the year of the latest Publication Date, Distribution Date, or Deposit Date.

The OpenAIRE/oai_datacite export should be changed to use the same logic as the DataCite/Datacite export.

**Any open or closed issues related to this feature request?**

https://github.com/IQSS/dataverse/issues/11916

---

# Fix schemeURI casing and coverage in OpenAIRE/oai_datacite export's creator nameIdentifier element

**Overview of the Feature Request**

The OpenAIRE/oai_datacite export should use the same casing and coverage for the `schemeURI` property in the creator `nameIdentifier` element as the DataCite/Datacite export does. Currently, the OpenAIRE/oai_datacite export uses `SchemeURI` (capital S) instead of `schemeURI`, and only includes it for ORCID identifiers rather than for all supported identifier types.

This issue is part of a larger effort to align both metadata exports, described in https://github.com/IQSS/dataverse/issues/11916.

**What kind of user is the feature intended for?**

API User, Superuser, and Sysadmin

**What inspired the request?**

This is part of a larger effort to align the OpenAIRE/oai_datacite and DataCite/Datacite metadata exports. There is more context at https://github.com/IQSS/dataverse/issues/11916.

**What existing behavior do you want changed?**

Currently, the DataCite/Datacite export uses lowercase `schemeURI` and includes it for all supported author identifier types (except DAI). For example:

```xml
<nameIdentifier
    nameIdentifierScheme="ORCID"
    schemeURI="https://orcid.org">https://orcid.org/0000-0001-9229-5317
</nameIdentifier>

<nameIdentifier
    nameIdentifierScheme="ISNI"
    schemeURI="http://www.isni.org">http://www.isni.org/isni/0000000121479733
</nameIdentifier>
```

The OpenAIRE/oai_datacite export uses `SchemeURI` (capital S) for ORCID identifiers only, and omits the property entirely for other identifier types. For example:

```xml
<nameIdentifier
    SchemeURI="https://orcid.org/"
    nameIdentifierScheme="ORCID">0000-0001-9229-5317
</nameIdentifier>

<nameIdentifier
    nameIdentifierScheme="ISNI">0000000121479733
</nameIdentifier>
```

The OpenAIRE/oai_datacite export should be changed to use lowercase `schemeURI` and to include it for all supported author identifier types (except DAI), matching the behavior of the DataCite/Datacite export.

**Any open or closed issues related to this feature request?**

https://github.com/IQSS/dataverse/issues/11916