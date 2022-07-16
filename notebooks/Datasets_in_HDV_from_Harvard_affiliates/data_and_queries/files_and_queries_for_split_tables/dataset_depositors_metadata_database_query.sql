-- Get metadata of depositors of published, non-harvested datasets

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
	case
		when authenticateduserlookup.authenticationproviderid = 'shib' and authenticateduserlookup.persistentuserid like 'https://fed.huit.harvard.edu/idp/shibboleth%@harvard.edu' then 'shib-harvardkey'
		when authenticateduserlookup.authenticationproviderid = 'shib' and authenticateduserlookup.persistentuserid not like 'https://fed.huit.harvard.edu/idp/shibboleth%@harvard.edu' then 'shib-other'
		else authenticateduserlookup.authenticationproviderid
	end as depositor_account_type,
	authenticateduser.id as depositor_id,
	authenticateduser.firstname as depositor_firstname,
	authenticateduser.lastname as depositor_lastname,
	authenticateduser.affiliation as depositor_affiliation,
	authenticateduser.email as depositor_email
from authenticateduser
join authenticateduserlookup on authenticateduserlookup.authenticateduser_id = authenticateduser.id
join dvobject on dvobject.creator_id = authenticateduser.id
join dataset on dataset.id = dvobject.id
where
	dataset.harvestingclient_id is null and
	--Include only "published" datasets by excluding datasets with only a draft version or only deaccessioned versions
	dataset.id not in(select all_versions_deaccessioned_or_draft.dataset_id from all_versions_deaccessioned_or_draft)
