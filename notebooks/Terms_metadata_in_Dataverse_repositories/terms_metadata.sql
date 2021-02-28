select --publisher, count(distinct basic_metadata.persistentUrl)
	--count(distinct basic_metadata.persistentUrl)
	basic_metadata.publisher, basic_metadata.persistentUrl, terms.license, availabilityStatus, citationRequirements, conditions, confidentialityDeclaration, contactForAccess, dataaccessPlace, depositorRequirements, disclaimer, originalArchive, restrictions, sizeOfCollection, specialPermissions, studyCompletion, termsOfAccess, termsOfUse
from basic_metadata
join terms on terms.persistentUrl = basic_metadata.persistentUrl
and terms.datasetVersionId = basic_metadata.datasetVersionId
where 
	(terms.license = 'CC0' or terms.license like '%CC%')
	and (
		availabilityStatus is not null or 
		citationRequirements is not null or 
		conditions is not null or 
		confidentialityDeclaration is not null or 
		contactForAccess is not null or 
		dataaccessPlace is not null or 
		depositorRequirements is not null or 
		disclaimer is not null or 
		originalArchive is not null or 
		restrictions is not null or 
		sizeOfCollection is not null or 
		specialPermissions is not null or 
		studyCompletion is not null or 
		termsOfAccess is not null
		--or termsOfUse is not null
		)
	and basic_metadata.datasetVersionId in (select max(basic_metadata.datasetVersionId) as max from basic_metadata group by basic_metadata.persistentUrl)
--group by publisher ORDER by count(*) desc
--limit 200