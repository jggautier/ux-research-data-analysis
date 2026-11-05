with
	ror_urls_from_externalvocabularyvalue as(
		select uri as ror_url_from_externalvocabularyvalue
		from externalvocabularyvalue
		where uri ~* '^https://ror\.org/0[a-hj-km-np-tv-z0-9]{6}\d{2}$'
	), 
	ror_urls_from_author_affiliation as(
		select 
			'author_affiliation' as metadata_field,
			datasetfieldvalue.value as ror_url,
			json_agg(distinct dvobject.identifier) as dataset_identifiers,
			count(distinct dvobject.identifier) as dataset_count
		from datasetfield datasetfield1
		join datasetfieldvalue on 
			datasetfieldvalue.datasetfield_id = datasetfield1.id
		join datasetfieldcompoundvalue on 
			datasetfieldcompoundvalue.id = datasetfield1.parentdatasetfieldcompoundvalue_id
		join datasetfield datasetfield2 on 
			datasetfield2.id = datasetfieldcompoundvalue.parentdatasetfield_id
		join datasetversion on
			datasetversion.id = datasetfield2.datasetversion_id
		join datasetfieldtype on
			datasetfieldtype.id = datasetfield2.datasetfieldtype_id
		join dvobject on
			dvobject.id = datasetversion.dataset_id
		join dataset on
			dataset.id = datasetversion.dataset_id
		where
			datasetfield1.datasetfieldtype_id = 9 and
			datasetfield1.template_id is null and
			datasetfieldvalue.value ~* '^https://ror\.org/0[a-hj-km-np-tv-z0-9]{6}\d{2}$' and
			dataset.harvestingclient_id is null and
			dvobject.publicationdate is not null
		group by datasetfieldvalue.value
	),
	ror_urls_from_funding_agency as(
		select 
			'funding_agency' as metadata_field,
			datasetfieldvalue.value as ror_url,
			json_agg(distinct dvobject.identifier) as dataset_identifiers,
			count(distinct dvobject.identifier) as dataset_count
		from datasetfield datasetfield1
		join datasetfieldvalue on 
			datasetfieldvalue.datasetfield_id = datasetfield1.id
		join datasetfieldcompoundvalue on 
			datasetfieldcompoundvalue.id = datasetfield1.parentdatasetfieldcompoundvalue_id
		join datasetfield datasetfield2 on 
		datasetfield2.id = datasetfieldcompoundvalue.parentdatasetfield_id
		join datasetversion on
			datasetversion.id = datasetfield2.datasetversion_id
		join datasetfieldtype on
			datasetfieldtype.id = datasetfield2.datasetfieldtype_id
		join dvobject on
			dvobject.id = datasetversion.dataset_id
		join dataset on
			dataset.id = datasetversion.dataset_id
		where
			datasetfield1.datasetfieldtype_id = 47 and
			datasetfield1.template_id is null and
			datasetfieldvalue.value ~* '^https://ror\.org/0[a-hj-km-np-tv-z0-9]{6}\d{2}$' and
			dataset.harvestingclient_id is null and
			dvobject.publicationdate is not null
		group by datasetfieldvalue.value
	)
select *
from ror_urls_from_author_affiliation
where ror_url in (
	select ror_url_from_externalvocabularyvalue
	from ror_urls_from_externalvocabularyvalue
)

union all

select *
from ror_urls_from_funding_agency
where ror_url in (
	select ror_url_from_externalvocabularyvalue
	from ror_urls_from_externalvocabularyvalue
)