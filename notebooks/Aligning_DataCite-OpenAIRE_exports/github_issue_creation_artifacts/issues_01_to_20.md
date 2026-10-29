# In OpenAIRE/oai_datacite export, for determining publicationYear, use logic that DataCite/Datacite export uses

**Overview of the Feature Request**

The OpenAIRE/oai_datacite export should use the same logic as the DataCite/Datacite export when determining the value of the `publicationYear` element. Currently, the two exports use different logic to determine the dataset's publication year, which means the same dataset can have different `publicationYear` values depending on which export is used.

This issue is part of a larger effort to align both metadata exports, described in https://github.com/IQSS/dataverse/issues/11916.

**What kind of user is the feature intended for?**

API User, Superuser, and Sysadmin

**What inspired the request?**

This is part of a larger effort to align the OpenAIRE/oai_datacite and DataCite/Datacite metadata exports. There is more context at https://github.com/IQSS/dataverse/issues/11916.

**What existing behavior do you want changed?**

Currently, the DataCite/Datacite export determines `publicationYear` using the following logic:
- Dataverse uses the year of the date field that the user has set as the citation date, using the API endpoint ["Set Citation Date Field Type for a Dataset"](https://guides.dataverse.org/en/6.10/api/native-api.html#set-citation-date-field-type-for-a-dataset)
- If the user hasn't set the dataset's citation date using that API endpoint, then the DataCite/Datacite export uses the latest of:
  - the Publication Date, when the dataset's first version was published in the Dataverse repository, or
  - the embargo citation date, being the latest date of embargoed files on the dataset's first version
- If the latest dataset version is a draft and the user hasn't set any embargo dates for files in the dataset, the DataCite/Datacite export uses the date when the user last updated the draft version

The OpenAIRE/oai_datacite export uses different logic: it uses the year of the latest Publication Date, Distribution Date, or Deposit Date.

The OpenAIRE/oai_datacite export should be changed to use the same logic as the DataCite/Datacite export.

**Any open or closed issues related to this feature request?**

https://github.com/IQSS/dataverse/issues/11916

---

# In OpenAIRE/oai_datacite export, use "Updated" as dateType for dataset version's release date

**Overview of the Feature Request**

The OpenAIRE/oai_datacite export should use "Updated" as the `dateType` when adding the dataset version's release date to the `date` element, as the DataCite/Datacite export already does. Currently, the OpenAIRE/oai_datacite export uses "Available" as the `dateType` instead.

This issue is part of a larger effort to align both metadata exports, described in https://github.com/IQSS/dataverse/issues/11916.

**What kind of user is the feature intended for?**

API User, Superuser, and Sysadmin

**What inspired the request?**

This is part of a larger effort to align the OpenAIRE/oai_datacite and DataCite/Datacite metadata exports. There is more context at https://github.com/IQSS/dataverse/issues/11916.

**What existing behavior do you want changed?**

Currently, the DataCite/Datacite export uses "Updated" as the `dateType` when adding the dataset version's release date. For example:

```xml
<date
    dateType="Updated">2025-12-07
</date>
```

The OpenAIRE/oai_datacite export uses "Available" as the `dateType` instead. For example:

```xml
<date
    dateType="Available">2025-12-07
</date>
```

The OpenAIRE/oai_datacite export should be changed to use "Updated" as the `dateType` for the dataset version's release date, matching the behavior of the DataCite/Datacite export.

**Any open or closed issues related to this feature request?**

https://github.com/IQSS/dataverse/issues/11916

---

# In OpenAIRE/oai_datacite export, fix casing of creator nameIdentifier's schemeURI element and include schemeURI for all supported identifier types

**Overview of the Feature Request**

The OpenAIRE/oai_datacite export should use the same casing for the `schemeURI` property in the creator `nameIdentifier` element, and include schemeURI for all supported identifier types, as the DataCite/Datacite export does. Currently, when a user adds author information that includes an identifier, the OpenAIRE/oai_datacite export uses `SchemeURI` (capital S) instead of `schemeURI`, and includes it only for ORCID identifiers rather than for all supported identifier types (except DAI).

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

---

# In DataCite/Datacite export, when the user adds a DAI author identifier, include in creator nameIdentifier element

**Overview of the Feature Request**

When the user adds a DAI author identifier type, the DataCite/Datacite export should include the DAI author identifier in the creator `nameIdentifier` element, as the OpenAIRE/oai_datacite export already does. Currently, the DataCite/Datacite export omits the DAI identifier entirely.

This issue is part of a larger effort to align both metadata exports, described in https://github.com/IQSS/dataverse/issues/11916.

**What kind of user is the feature intended for?**

API User, Superuser, and Sysadmin

**What inspired the request?**

This is part of a larger effort to align the OpenAIRE/oai_datacite and DataCite/Datacite metadata exports. There is more context at https://github.com/IQSS/dataverse/issues/11916.

**What existing behavior do you want changed?**

Currently, when the user adds a DAI author identifier type and a DAI identifier, the DataCite/Datacite export does not include the identifier in the `nameIdentifier` element.

The OpenAIRE/oai_datacite export does include it. For example:

```xml
<nameIdentifier
    nameIdentifierScheme="DAI">info:eu-repo/dai/nl/072728442
</nameIdentifier>
```

The DataCite/Datacite export should be changed to include the DAI identifier in the `nameIdentifier` element in the same way that the OpenAIRE/oai_datacite export does.

**Any open or closed issues related to this feature request?**

https://github.com/IQSS/dataverse/issues/11916

---

# In OpenAIRE/oai_datacite export, when the user chooses author affilitation that includes a ROR, add ROR information and use organization's name instead of ROR URL

**Overview of the Feature Request**

When Dataverse includes a ROR with the author affiliation that the user chose, the OpenAIRE/oai_datacite export should include the `affiliationIdentifier`, `schemeURI`, and `affiliationIdentifierScheme` properties in the creator `affiliation` element, and should use the organization's name (not the ROR URL) as the value of the `affiliation` element. The DataCite/Datacite export does this.

This issue is part of a larger effort to align both metadata exports, described in https://github.com/IQSS/dataverse/issues/11916.

**What kind of user is the feature intended for?**

API User, Superuser, and Sysadmin

**What inspired the request?**

This is part of a larger effort to align the OpenAIRE/oai_datacite and DataCite/Datacite metadata exports. There is more context at https://github.com/IQSS/dataverse/issues/11916.

**What existing behavior do you want changed?**

Currently, when Dataverse includes a ROR with the author affiliation that the user chose, the DataCite/Datacite export includes `affiliationIdentifier`, `schemeURI`, and `affiliationIdentifierScheme` and uses the organization's name as the `affiliation` element's value. For example:

```xml
<affiliation
    affiliationIdentifier="https://ror.org/03vek6s52"
    schemeURI="https://ror.org"
    affiliationIdentifierScheme="ROR">Harvard University
</affiliation>
```

The OpenAIRE/oai_datacite export omits `affiliationIdentifier`, `schemeURI`, and `affiliationIdentifierScheme` and uses the ROR URL as the element value instead. For example:

```xml
<affiliation>https://ror.org/03vek6s52</affiliation>
```

The OpenAIRE/oai_datacite export should be changed to include `affiliationIdentifier`, `schemeURI`, and `affiliationIdentifierScheme`, and to use the organization's name as the element value, matching the behavior of the DataCite/Datacite export.

**Any open or closed issues related to this feature request?**

https://github.com/IQSS/dataverse/issues/11916

---

# In OpenAIRE/oai_datacite export, when the user adds contributor and chooses any contriubutor type, or adds Distributors and Producers, add guessed nameType to `contributor` element

**Overview of the Feature Request**

The OpenAIRE/oai_datacite export should include guessed `nameType` values (person or organization) for all contributors that the user adds and when the user adds Distributors and Producers, as the DataCite/Datacite export does. Currently, the OpenAIRE/oai_datacite export doesn't include the guessed `nameType` when the user adds Distributors and Producers, and when the user adds a Contributor and chooses any of about half of the contributor types in the Contributor Type dropdown.

This issue is part of a larger effort to align both metadata exports, described in https://github.com/IQSS/dataverse/issues/11916.

**What kind of user is the feature intended for?**

API User, Superuser, and Sysadmin

**What inspired the request?**

This is part of a larger effort to align the OpenAIRE/oai_datacite and DataCite/Datacite metadata exports. There is more context at https://github.com/IQSS/dataverse/issues/11916.

**What existing behavior do you want changed?**

Currently, the DataCite/Datacite export includes a guessed `nameType` (person or organization) when the user adds Distributors and Producers and when they add Contributors and choose any of the contributor types in the Contributor Type dropdown.

For example:

```xml
<contributors>
    <contributor
        contributorType="Editor">
        <contributorName
            nameType="Personal">Name of Editor
        </contributorName>
    </contributor>
    <contributor
        contributorType="Distributor">
        <contributorName
            nameType="Personal">Name of Distributor
        </contributorName>
    </contributor>
</contributors>
```

The OpenAIRE/oai_datacite export includes guessed `nameType` values for the Contributors that a user adds when they choose only about half of the contributor types. The export doesn't include guessed `nameType` values when the user adds a contributor and chooses any of the following from the Contributor Type dropdown: Editor, Hosting Institution, Project Leader, Project Manager, Project Member, Researcher, Rights Holder, Sponsor, Supervisor, Work Package Leader, and Other. And the export doesn't include guessed `nameType` values when the user adds Distributors and Producers.

For example:

```xml
<contributor
    contributorType="Producer">
    <contributorName>Producer Name</contributorName>
```

The OpenAIRE/oai_datacite export should be changed to include guessed `nameType` values for the Distributors and Producers that the user adds and when they add Contributors and choose any types or no type from the Contributor Type dropdown, matching the behavior of the DataCite/Datacite export.

**Any open or closed issues related to this feature request?**

https://github.com/IQSS/dataverse/issues/11916

---

# In OpenAIRE/oai_datacite export, when the user chooses no contributor type, default contributorType to "Other"

**Overview of the Feature Request**

When the user adds a contributor name but does not choose a contributor type, the OpenAIRE/oai_datacite export should use "Other" as the `contributorType`, as the DataCite/Datacite export already does. Currently, the OpenAIRE/oai_datacite export omits `contributorType` in this case.

This issue is part of a larger effort to align both metadata exports, described in https://github.com/IQSS/dataverse/issues/11916.

**What kind of user is the feature intended for?**

API User, Superuser, and Sysadmin

**What inspired the request?**

This is part of a larger effort to align the OpenAIRE/oai_datacite and DataCite/Datacite metadata exports. There is more context at https://github.com/IQSS/dataverse/issues/11916.

**What existing behavior do you want changed?**

Currently, when the user adds a contributor name but does not choose a contributor type, the DataCite/Datacite export defaults `contributorType` to "Other". For example:

```xml
<contributor
    contributorType="Other">
    <contributorName
        nameType="Personal">Name with no Contributor Type chosen
    </contributorName>
</contributor>
```

The OpenAIRE/oai_datacite export omits `contributorType` entirely in this case. For example:

```xml
<contributor>
    <contributorName>Name with no Contributor Type chosen</contributorName>
</contributor>
```

The OpenAIRE/oai_datacite export should be changed to default `contributorType` to "Other" when the user does not choose a contributor type, matching the behavior of the DataCite/Datacite export.

**Any open or closed issues related to this feature request?**

https://github.com/IQSS/dataverse/issues/11916

---

# In DataCite/Datacite export, when the user enters a Keyword Term URI, include Keyword Term URI in the `valueURI` element of the `subject` element

**Overview of the Feature Request**

When the user enters a Keyword Term URI, the DataCite/Datacite export should include the Keyword Term URI in the `valueURI` element of the `subject` element, as the OpenAIRE/oai_datacite export already does. Currently, the DataCite/Datacite export excludes the Keyword Term URI from the `valueURI` element.

This issue is part of a larger effort to align both metadata exports, described in https://github.com/IQSS/dataverse/issues/11916.

**What kind of user is the feature intended for?**

API User, Superuser, and Sysadmin

**What inspired the request?**

This is part of a larger effort to align the OpenAIRE/oai_datacite and DataCite/Datacite metadata exports. There is more context at https://github.com/IQSS/dataverse/issues/11916.

**What existing behavior do you want changed?**

Currently, the DataCite/Datacite export doesn't include a `valueURI` element with the Keyword Term URI. For example:

```xml
<subject
    schemeURI="https://controlledvocabularyurl1.org"
    subjectScheme="Keyword Vocab Name 1">Keyword Term 1
</subject>

<subject>Keyword Term 2</subject>
```

The OpenAIRE/oai_datacite export includes the Keyword Term URI in the `valueURI` element. For example:

```xml
<subject
    schemeURI="https://controlledvocabularyurl1.org"
    valueURI="https://keywordtermuri1.org"
    subjectScheme="Keyword Vocab Name 1">Keyword Term 1
</subject>

<subject
    valueURI="https://keywordtermuri2.org">Keyword Term 2
</subject>
```

The DataCite/Datacite export should be changed to include the Keyword Term URI in the `valueURI` element in the same way that the OpenAIRE/oai_datacite export does.

**Any open or closed issues related to this feature request?**

https://github.com/IQSS/dataverse/issues/11916

---



---

# In OpenAIRE/oai_datacite export, include user's partial Date of Collection

**Overview of the Feature Request**

The OpenAIRE/oai_datacite export should include Date of Collection entries even when the user has not provided both a start and end date, using "null" for the missing value, as the DataCite/Datacite export does. Currently, the OpenAIRE/oai_datacite export doens't include the user's Date of Collection when either the start or end date is missing.

This issue is part of a larger effort to align both metadata exports, described in https://github.com/IQSS/dataverse/issues/11916.

**What kind of user is the feature intended for?**

API User, Superuser, and Sysadmin

**What inspired the request?**

This is part of a larger effort to align the OpenAIRE/oai_datacite and DataCite/Datacite metadata exports. There is more context at https://github.com/IQSS/dataverse/issues/11916.

**What existing behavior do you want changed?**

Currently, when the user adds only a start or end date in the Citation metadata block's Date of Collection block, the DataCite/Datacite export includes a `date` element with `dateType="Collected"`, using "null" for the missing value. For example:

```xml
<date
    dateType="Collected">2000-08-01/null
</date>
<date
    dateType="Collected">null/2000-09-01
</date>
```

The OpenAIRE/oai_datacite export omits the Date of Collection entries entirely when the user adds only a start date or only an end date.

The OpenAIRE/oai_datacite export should be changed to include partial Date of Collection entries in the same way that the DataCite/Datacite export does.

**Any open or closed issues related to this feature request?**

https://github.com/IQSS/dataverse/issues/11916

---

# In OpenAIRE/oai_datacite export, add what user enters in Time Period field to the date element

**Overview of the Feature Request**

When a user enters dates in the Citation metadata block's Time Period field, the OpenAIRE/oai_datacite export should include those dates in the `date` element, as the DataCite/Datacite export already does. Currently, the OpenAIRE/oai_datacite export does not include what users enter in the Time Period field.

This issue is part of a larger effort to align both metadata exports, described in https://github.com/IQSS/dataverse/issues/11916.

**What kind of user is the feature intended for?**

API User, Superuser, and Sysadmin

**What inspired the request?**

This is part of a larger effort to align the OpenAIRE/oai_datacite and DataCite/Datacite metadata exports. There is more context at https://github.com/IQSS/dataverse/issues/11916.

**What existing behavior do you want changed?**

Currently, the DataCite/Datacite export includes what the user enters in the Citation metadata block's Time Period field in the `date` element. For example:

```xml
<date
    dateType="Other"
    dateInformation="Time period covered by the data">2000-04-01/2000-05-01
</date>
<date
    dateType="Other"
    dateInformation="Time period covered by the data">2000-05-02/null
</date>
<date
    dateType="Other"
    dateInformation="Time period covered by the data">null/2000-05-03
</date>
```

The OpenAIRE/oai_datacite export does not include the Time Period field.

The OpenAIRE/oai_datacite export should be changed to include the Time Period field in the `date` element in the same way that the DataCite/Datacite export does.

**Any open or closed issues related to this feature request?**

https://github.com/IQSS/dataverse/issues/11916

---

# In OpenAIRE/oai_datacite export, add Previous Dataset Persistent ID to Alternate Identifier element

**Overview of the Feature Request**

When a dataset has a Previous Dataset Persistent ID, the OpenAIRE/oai_datacite export should include it the `alternateIdentifier` element, as the DataCite/Datacite export already does. Currently, the OpenAIRE/oai_datacite export does not include the Previous Dataset Persistent ID.

This issue is part of a larger effort to align both metadata exports, described in https://github.com/IQSS/dataverse/issues/11916.

**What kind of user is the feature intended for?**

API User, Superuser, and Sysadmin

**What inspired the request?**

This is part of a larger effort to align the OpenAIRE/oai_datacite and DataCite/Datacite metadata exports. There is more context at https://github.com/IQSS/dataverse/issues/11916.

**What existing behavior do you want changed?**

Currently, the DataCite/Datacite export includes the dataset's Previous Dataset Persistent ID in the `alternateIdentifier` element. For example:

```xml
<alternateIdentifier
    alternateIdentifierType="Handle">1902.1/ZJCKVBBXJN
</alternateIdentifier>
```

The OpenAIRE/oai_datacite export does not include the Previous Dataset Persistent ID.

The OpenAIRE/oai_datacite export should be changed to include the dataset's Previous Dataset Persistent ID in the `alternateIdentifier` element in the same way that the DataCite/Datacite export does.

**Any open or closed issues related to this feature request?**

https://github.com/IQSS/dataverse/issues/11916

---

# In OpenAIRE/oai_datacite export, when user doesn't enter an Other Identifier Agency, default alternateIdentifierType to ":unav"

**Overview of the Feature Request**

When the user adds an Other Identifier but does not enter an Agency, the OpenAIRE/oai_datacite export should default `alternateIdentifierType` to `:unav`, as the DataCite/Datacite export already does. Currently, the OpenAIRE/oai_datacite export doesn't include `alternateIdentifierType` at all in this case.

This issue is part of a larger effort to align both metadata exports, described in https://github.com/IQSS/dataverse/issues/11916.

**What kind of user is the feature intended for?**

API User, Superuser, and Sysadmin

**What inspired the request?**

This is part of a larger effort to align the OpenAIRE/oai_datacite and DataCite/Datacite metadata exports. There is more context at https://github.com/IQSS/dataverse/issues/11916.

**What existing behavior do you want changed?**

Currently, when the user adds an Other Identifier but does not choose an Agency, the DataCite/Datacite export defaults `alternateIdentifierType` to `:unav`. For example:

```xml
<alternateIdentifier
    alternateIdentifierType=":unav">https://nogagencyvalue.org/1234
</alternateIdentifier>
```

The OpenAIRE/oai_datacite export doesn't include `alternateIdentifierType` all all in this case.

The OpenAIRE/oai_datacite export should be changed to default `alternateIdentifierType` to `:unav` when the user doens't enter anything in the Agency field, matching the behavior of the DataCite/Datacite export.

**Any open or closed issues related to this feature request?**

https://github.com/IQSS/dataverse/issues/11916

---

# In OpenAIRE/oai_datacite export, when user doesn't choose a relationType, use "IsSupplementTo"

**Overview of the Feature Request**

When the user adds a Related Publication but does not choose an option from the Related Publication Relation Type dropdown, the OpenAIRE/oai_datacite export should use "IsSupplementTo" as the default `relationType`, as the DataCite/Datacite export already does. Currently, the OpenAIRE/oai_datacite export uses "IsCitedBy" as the default instead.

This issue is part of a larger effort to align both metadata exports, described in https://github.com/IQSS/dataverse/issues/11916.

**What kind of user is the feature intended for?**

API User, Superuser, and Sysadmin

**What inspired the request?**

This is part of a larger effort to align the OpenAIRE/oai_datacite and DataCite/Datacite metadata exports. There is more context at https://github.com/IQSS/dataverse/issues/11916.

**What existing behavior do you want changed?**

Currently, when the user adds a Related Publication but does not choose an option from the Related Publication Relation Type dropdown, the DataCite/Datacite export uses "IsSupplementTo" as the default `relationType`. For example:

```xml
<relatedIdentifier
    relationType="IsSupplementTo"
    relatedIdentifierType="ARK">12345
</relatedIdentifier>
```

The OpenAIRE/oai_datacite export uses "IsCitedBy" as the default instead. For example:

```xml
<relatedIdentifier
    relationType="IsCitedBy"
    relatedIdentifierType="ARK">12345
</relatedIdentifier>
```

The OpenAIRE/oai_datacite export should be changed to use "IsSupplementTo" as the default `relationType` when the user doesn't choose an option from the Related Publication Relation Type dropdown, matching the behavior of the DataCite/Datacite export.

**Any open or closed issues related to this feature request?**

https://github.com/IQSS/dataverse/issues/11916

---

# In DataCite/Datacite export, when user chooses cstr and URL from Related Publication Identifier Type dropdown, add cstr and URL to related identifiers

**Overview of the Feature Request**

When the user adds a Related Publication and chooses `cstr` or `URL` from the Related Publication Identifier Type dropdown, the DataCite/Datacite export should include the related identifiers, as the OpenAIRE/oai_datacite export already does. Currently, the DataCite/Datacite export does not include the related identifiers in these cases.

This issue is part of a larger effort to align both metadata exports, described in https://github.com/IQSS/dataverse/issues/11916.

**What kind of user is the feature intended for?**

API User, Superuser, and Sysadmin

**What inspired the request?**

This is part of a larger effort to align the OpenAIRE/oai_datacite and DataCite/Datacite metadata exports. There is more context in the closed issue at https://github.com/IQSS/dataverse/issues/11916.

**What existing behavior do you want changed?**

Currently, when the user chooses `cstr` or `URL` from the Related Publication Identifier Type dropdown, the DataCite/Datacite export does not include the related identifier. See https://github.com/IQSS/dataverse/issues/11089 for more context.

The OpenAIRE/oai_datacite export does include the related identifier in these cases. For example:

```xml
<relatedIdentifier
    relationType="IsCitedBy"
    relatedIdentifierType="cstr">CSTR:16666.11.nbsdc.J0V2mNIU
</relatedIdentifier>
<relatedIdentifier
    relationType="IsCitedBy"
    relatedIdentifierType="URL">https://url.org
</relatedIdentifier>
```

The DataCite/Datacite export should be changed to include related identifiers when the user chooses `cstr` or `URL` as the identifier type, matching the behavior of the OpenAIRE/oai_datacite export.

**Any open or closed issues related to this feature request?**

https://github.com/IQSS/dataverse/issues/11916
https://github.com/IQSS/dataverse/issues/11089

---

# In OpenAIRE/oai_datacite export, when user enters DOI without choosing the identifier type, include related identifier

**Overview of the Feature Request**

When the user enters a DOI in the Identifier field or a DOI URL in the URL field but doesn't choose an option from the Related Publication Identifier Type dropdown, the OpenAIRE/oai_datacite export should include a related identifier with `relatedIdentifierType="DOI"`, as the DataCite/Datacite export already does. Currently, the OpenAIRE/oai_datacite export does not include the related identifier in this case.

This issue is part of a larger effort to align both metadata exports, described in https://github.com/IQSS/dataverse/issues/11916.

**What kind of user is the feature intended for?**

API User, Superuser, and Sysadmin

**What inspired the request?**

This is part of a larger effort to align the OpenAIRE/oai_datacite and DataCite/Datacite metadata exports. There is more context at https://github.com/IQSS/dataverse/issues/11916.

**What existing behavior do you want changed?**

Currently, the DataCite/Datacite export detects when the user has entered a DOI in the Identifier field (such as `10.12345/FK2/123456`) or a DOI URL in the URL field (such as `https://doi.org/10.12345/FK2/123456`) without choosing an identifier type, and includes the related identifier with `relatedIdentifierType="DOI"`. The OpenAIRE/oai_datacite export does not include the related identifier in this case.

The OpenAIRE/oai_datacite export should be changed to include the related identifier with `relatedIdentifierType="DOI"` when the user enters a DOI or DOI URL but doesn't choose an identifier type, matching the behavior of the DataCite/Datacite export.

**Any open or closed issues related to this feature request?**

https://github.com/IQSS/dataverse/issues/11916

---

# To OpenAIRE/oai_datacite export, add file DOI related identifiers

**Overview of the Feature Request**

The OpenAIRE/oai_datacite export should include related identifiers for files that Dataverse registers DOIs for, as the DataCite/Datacite export already does. Currently, the OpenAIRE/oai_datacite export does not include this information.

This issue is part of a larger effort to align both metadata exports, described in https://github.com/IQSS/dataverse/issues/11916.

**What kind of user is the feature intended for?**

API User, Superuser, and Sysadmin

**What inspired the request?**

This is part of a larger effort to align the OpenAIRE/oai_datacite and DataCite/Datacite metadata exports. There is more context at https://github.com/IQSS/dataverse/issues/11916.

**What existing behavior do you want changed?**

Currently, the DataCite/Datacite export includes related identifiers for files that Dataverse registers DOIs for. For example:

```xml
<relatedIdentifier
    relationType="HasPart"
    relatedIdentifierType="DOI">10.7910/DVN/YKAMUT/QCHYCL
</relatedIdentifier>
```

The OpenAIRE/oai_datacite export does not include this information.

The OpenAIRE/oai_datacite export should be changed to include related identifiers for files that Dataverse registers DOIs for, matching the behavior of the DataCite/Datacite export.

**Any open or closed issues related to this feature request?**

https://github.com/IQSS/dataverse/issues/11916

---

# In OpenAIRE/oai_datacite export, use the user-entered PURL as the PURL related identifier

**Overview of the Feature Request**

When the user chooses PURL from the Related Publication Identifier Type dropdown, the OpenAIRE/oai_datacite export should use the value the user enters as the related identifier, as the DataCite/Datacite export already does. Currently, the OpenAIRE/oai_datacite export uses "https://purl.org" as the related identifier instead of the value the user entered.

This issue is part of a larger effort to align both metadata exports, described in https://github.com/IQSS/dataverse/issues/11916.

**What kind of user is the feature intended for?**

API User, Superuser, and Sysadmin

**What inspired the request?**

This is part of a larger effort to align the OpenAIRE/oai_datacite and DataCite/Datacite metadata exports. There is more context at https://github.com/IQSS/dataverse/issues/11916.

**What existing behavior do you want changed?**

Currently, the DataCite/Datacite export uses the value the user entered as the related identifier when the user chooses PURL from the Related Publication Identifier Type dropdown. For example:

```xml
<relatedIdentifier
    relationType="IsCitedBy"
    relatedIdentifierType="PURL">12345
</relatedIdentifier>
```

The OpenAIRE/oai_datacite export uses "https://purl.org" as the related identifier instead of the value the user entered. For example:

```xml
<relatedIdentifier
    relationType="IsCitedBy"
    relatedIdentifierType="PURL">https://purl.org
</relatedIdentifier>
```

The OpenAIRE/oai_datacite export should be changed to use the value the user entered as the related identifier when the user chooses PURL as the identifier type, matching the behavior of the DataCite/Datacite export.

**Any open or closed issues related to this feature request?**

https://github.com/IQSS/dataverse/issues/11916

---

# In OpenAIRE/oai_datacite export's description element, when user doesn't enter Software Version, include Software Name

**Overview of the Feature Request**

When the user has entered something in the Software Name field but doesn't include a Software Version, the OpenAIRE/oai_datacite export should include Software Name in the `description` element, as the DataCite/Datacite export already does. Currently, the OpenAIRE/oai_datacite export omits Software Name entirely when the user does not enter a Software Version.

This issue is part of a larger effort to align both metadata exports, described in https://github.com/IQSS/dataverse/issues/11916.

**What kind of user is the feature intended for?**

API User, Superuser, and Sysadmin

**What inspired the request?**

This is part of a larger effort to align the OpenAIRE/oai_datacite and DataCite/Datacite metadata exports. There is more context at https://github.com/IQSS/dataverse/issues/11916.

**What existing behavior do you want changed?**

Currently, the DataCite/Datacite export includes Software Name in the `description` element even when the user has not added a Software Version. For example:

```xml
<description
    descriptionType="TechnicalInfo">Software Name
</description>
```

The OpenAIRE/oai_datacite export does not include Software Name when the user does not enter a Software Version.

The OpenAIRE/oai_datacite export should be changed to include Software Name in the `description` element even when no Software Version is entered, matching the behavior of the DataCite/Datacite export.

**Any open or closed issues related to this feature request?**

https://github.com/IQSS/dataverse/issues/11916

---

# In DataCite/Datacite and OpenAIRE/oai_datacite exports, add to GeoLocationPlace elements what user enters in Production Location and Geospatial Geographic Coverage fields

**Overview of the Feature Request**

When the user enters in something in the Citation metadata block's Production Location field and in the Geospatial metadata block's Geographic Coverage fields, both the DataCite/Datacite and OpenAIRE/oai_datacite exports should be updated so that they include in a `GeoLocationPlace` element what the user entered.

Currently, the DataCite/Datacite export includes only what the user enters in the Geospatial metadata block's Geographic Coverage fields. And the OpenAIRE/oai_datacite export includes only what the user enters in the Citation metadata block's Production Location field.

This issue is part of a larger effort to align both metadata exports, described in https://github.com/IQSS/dataverse/issues/11916.

**What kind of user is the feature intended for?**

API User, Superuser, and Sysadmin

**What inspired the request?**

This is part of a larger effort to align the OpenAIRE/oai_datacite and DataCite/Datacite metadata exports. There is more context at https://github.com/IQSS/dataverse/issues/11916.

**What existing behavior do you want changed?**

Currently, the DataCite/Datacite export adds what the user enters in the Geospatial metadata block's Geographic Coverage fields (Country, State, etc.) to `GeoLocationPlace`. For example:

```xml
<geoLocationPlace>Afghanistan, State,, City,, Other,</geoLocationPlace>
```

The OpenAIRE/oai_datacite export adds what the user enters in the Citation metadata block's Production Location field to `GeoLocationPlace` instead. For example:

```xml
<geoLocationPlace>Production Location</geoLocationPlace>
```

Two changes are recommended:

- The DataCite/Datacite export should be updated to also include, in `GeoLocationPlace`, what the user enters in the Citation metadata block's Production Location field.
- The OpenAIRE/oai_datacite export should be updated to also include, in `GeoLocationPlace`, what the user enters in any of the Geospatial metadata block's Geographic Coverage fields.

**Any open or closed issues related to this feature request?**

https://github.com/IQSS/dataverse/issues/11916