-- Get the depositor and author metadata for every published, non-harvested dataset in the repository
with
	all_versions_deaccessioned_or_draft as(
		select distinct dvobject.id as dataset_id
		from datasetversion
		join dataset on dataset.id = datasetversion.dataset_id
		where
			dataset.id not in (select distinct datasetversion.dataset_id from datasetversion where versionstate in ('RELEASED')) and
			harvestingclient_id is null
		),
	dataset_depositors as(
		select
		authenticateduser.id as depositor_id,
		authenticateduser.affiliation as depositor_affiliation,
		authenticateduser.email as depositor_email,
		case
			when authenticateduserlookup.authenticationproviderid = 'shib' and authenticateduserlookup.persistentuserid like 'https://fed.huit.harvard.edu/idp/shibboleth%@harvard.edu' then 'shib-harvardkey'
			when authenticateduserlookup.authenticationproviderid = 'shib' and authenticateduserlookup.persistentuserid not like 'https://fed.huit.harvard.edu/idp/shibboleth%@harvard.edu' then 'shib-other'
			else authenticateduserlookup.authenticationproviderid
		end as depositor_account_type
		from authenticateduser
		join authenticateduserlookup on authenticateduserlookup.authenticateduser_id = authenticateduser.id
		),
	author_names as(
		select datasetversion.dataset_id, datasetfield1.parentdatasetfieldcompoundvalue_id, datasetfieldvalue.value as author_name
		from datasetfield datasetfield1
		join datasetfieldvalue on datasetfieldvalue.datasetfield_id = datasetfield1.id
		join datasetfieldcompoundvalue on datasetfieldcompoundvalue.id = datasetfield1.parentdatasetfieldcompoundvalue_id
		join datasetfield datasetfield2 on datasetfield2.id = datasetfieldcompoundvalue.parentdatasetfield_id
		join datasetversion on datasetversion.id = datasetfield2.datasetversion_id
		join datasetfieldtype on datasetfieldtype.id = datasetfield2.datasetfieldtype_id
		join dataset on dataset.id = datasetversion.dataset_id
		join dvobject on dvobject.id = datasetversion.dataset_id
		where
			dataset.harvestingclient_id is null and
			dvobject.publicationdate is not null and
			datasetfield1.datasetfieldtype_id = 8 and
			datasetfield1.template_id is null and
			(datasetversion.dataset_id, array[datasetversion.versionnumber, datasetversion.minorversionnumber]) in (
				select datasetversion.dataset_id, max(array[datasetversion.versionnumber, datasetversion.minorversionnumber]) 
				from datasetversion 
				group by datasetversion.dataset_id)
		),
	author_affiliations as(
		select datasetversion.dataset_id, datasetfield1.parentdatasetfieldcompoundvalue_id, datasetfieldvalue.value as author_affiliation
		from datasetfield datasetfield1
		join datasetfieldvalue on datasetfieldvalue.datasetfield_id = datasetfield1.id
		join datasetfieldcompoundvalue on datasetfieldcompoundvalue.id = datasetfield1.parentdatasetfieldcompoundvalue_id
		join datasetfield datasetfield2 on datasetfield2.id = datasetfieldcompoundvalue.parentdatasetfield_id
		join datasetversion on datasetversion.id = datasetfield2.datasetversion_id
		join datasetfieldtype on datasetfieldtype.id = datasetfield2.datasetfieldtype_id
		join dataset on dataset.id = datasetversion.dataset_id
		join dvobject on dvobject.id = datasetversion.dataset_id
		where
			dataset.harvestingclient_id is null and
			dvobject.publicationdate is not null and
			datasetfield1.datasetfieldtype_id = 9 and
			datasetfield1.template_id is null and
			(datasetversion.dataset_id, array[datasetversion.versionnumber, datasetversion.minorversionnumber]) in (
				select datasetversion.dataset_id, max(array[datasetversion.versionnumber, datasetversion.minorversionnumber]) 
				from datasetversion 
				group by datasetversion.dataset_id)
		),
	author_identifier_schemes as(
		select datasetversion.dataset_id, datasetfield1.parentdatasetfieldcompoundvalue_id, controlledvocabularyvalue.strvalue as author_identifier_scheme
		from datasetfield datasetfield1
		join datasetfield_controlledvocabularyvalue on datasetfield_controlledvocabularyvalue.datasetfield_id = datasetfield1.id 
		join controlledvocabularyvalue on controlledvocabularyvalue.id = datasetfield_controlledvocabularyvalue.controlledvocabularyvalues_id
		join datasetfieldcompoundvalue on datasetfieldcompoundvalue.id = datasetfield1.parentdatasetfieldcompoundvalue_id
		join datasetfield datasetfield2 on datasetfield2.id = datasetfieldcompoundvalue.parentdatasetfield_id
		join datasetversion on datasetversion.id = datasetfield2.datasetversion_id
		join datasetfieldtype on datasetfieldtype.id = datasetfield2.datasetfieldtype_id
		where
			datasetfield1.datasetfieldtype_id = 10 and
			datasetfield1.template_id is null and
			(datasetversion.dataset_id, array[datasetversion.versionnumber, datasetversion.minorversionnumber]) in (
				select datasetversion.dataset_id, max(array[datasetversion.versionnumber, datasetversion.minorversionnumber])
				from datasetversion
				group by datasetversion.dataset_id)

		),
	author_identifiers as(
		select datasetversion.dataset_id, datasetfield1.parentdatasetfieldcompoundvalue_id, datasetfieldvalue.value as author_identifier
		from datasetfield datasetfield1
		join datasetfieldvalue on datasetfieldvalue.datasetfield_id = datasetfield1.id
		join datasetfieldcompoundvalue on datasetfieldcompoundvalue.id = datasetfield1.parentdatasetfieldcompoundvalue_id
		join datasetfield datasetfield2 on datasetfield2.id = datasetfieldcompoundvalue.parentdatasetfield_id
		join datasetversion on datasetversion.id = datasetfield2.datasetversion_id
		join datasetfieldtype on datasetfieldtype.id = datasetfield2.datasetfieldtype_id
		join dataset on dataset.id = datasetversion.dataset_id
		join dvobject on dvobject.id = datasetversion.dataset_id
		where
			dataset.harvestingclient_id is null and
			dvobject.publicationdate is not null and
			datasetfield1.datasetfieldtype_id = 11 and
			datasetfield1.template_id is null and
			(datasetversion.dataset_id, array[datasetversion.versionnumber, datasetversion.minorversionnumber]) in (
				select datasetversion.dataset_id, max(array[datasetversion.versionnumber, datasetversion.minorversionnumber]) 
				from datasetversion 
				group by datasetversion.dataset_id)
		)
select
	concat('https://doi.org/', dvobject.authority, '/', dvobject.identifier) as dataset_doi_url, 
	dataset_depositors.depositor_id, dataset_depositors.depositor_account_type,
	dataset_depositors.depositor_affiliation, dataset_depositors.depositor_email,
	author_names.author_name, author_affiliations.author_affiliation,
	author_identifier_schemes.author_identifier_scheme, author_identifiers.author_identifier
from dataset
join dvobject on dvobject.id = dataset.id
join dataset_depositors on dataset_depositors.depositor_id = dvobject.creator_id
full outer join author_names on author_names.dataset_id = dataset.id
full outer join author_affiliations on 
	author_affiliations.dataset_id = dataset.id and
	author_affiliations.parentdatasetfieldcompoundvalue_id = author_names.parentdatasetfieldcompoundvalue_id
full outer join author_identifier_schemes on 
	author_identifier_schemes.dataset_id = dataset.id and
	author_identifier_schemes.parentdatasetfieldcompoundvalue_id = author_names.parentdatasetfieldcompoundvalue_id
full outer join author_identifiers on 
	author_identifiers.dataset_id = dataset.id and
	author_identifiers.parentdatasetfieldcompoundvalue_id = author_names.parentdatasetfieldcompoundvalue_id
where
	dataset.harvestingclient_id is null and
	--Include only "published" datasets by excluding datasets with only a draft version or only deaccessioned versions
	dataset.id not in(select all_versions_deaccessioned_or_draft.dataset_id from all_versions_deaccessioned_or_draft)
