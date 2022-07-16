with
	all_versions_deaccessioned_or_draft as(
		select distinct dataset.id as dataset_id
		from datasetversion
		join dataset on dataset.id = datasetversion.dataset_id
		where
			dataset.id not in (select distinct datasetversion.dataset_id from datasetversion where versionstate in ('RELEASED')) and
			harvestingclient_id is null
		)
select
	concat('https://doi.org/', dvobject.authority, '/', dvobject.identifier) as dataset_doi_url,
	dataverse.id as dataverse_collection_id,
	dataverse.alias as dataverse_collection_alias
from dataset
join dvobject on dvobject.id = dataset.id
join dataverse on dataverse.id = dvobject.owner_id
where
	dataset.harvestingclient_id is null and
	--Include only "published" datasets by excluding datasets with only a draft version or only deaccessioned versions
	dataset.id not in(select all_versions_deaccessioned_or_draft.dataset_id from all_versions_deaccessioned_or_draft)
