local NetworkRequests = script.Parent.networkRequests
local CreateGetExperiencesPlayabilityStatusModule = require(NetworkRequests.createGetExperiencesPlayabilityStatus)
local CreateGetExperiencesProductInfoModule = require(NetworkRequests.createGetExperiencesProductInfo)
local CreateGetExperiencesDetailsModule = require(NetworkRequests.createGetExperiencesDetails)
local CreateGetExperienceMediaModule = require(NetworkRequests.createGetExperienceMedia)

return function(p1)
	-- upvalues: CreateGetExperiencesPlayabilityStatusModule (copy), CreateGetExperiencesProductInfoModule (copy), CreateGetExperiencesDetailsModule (copy), CreateGetExperienceMediaModule (copy)
	return {
		GetExperiencesPlayabilityStatus = CreateGetExperiencesPlayabilityStatusModule(p1),
		GetExperiencesProductInfo = CreateGetExperiencesProductInfoModule(p1),
		GetExperiencesDetails = CreateGetExperiencesDetailsModule(p1),
		GetExperienceMedia = CreateGetExperienceMediaModule(p1)
	}
end