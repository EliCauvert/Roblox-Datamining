local networkRequests = script.Parent.networkRequests
local createGetExperiencesPlayabilityStatusModule = require(networkRequests.createGetExperiencesPlayabilityStatus)
local createGetExperiencesProductInfoModule = require(networkRequests.createGetExperiencesProductInfo)
local createGetExperiencesDetailsModule = require(networkRequests.createGetExperiencesDetails)
local createGetExperienceMediaModule = require(networkRequests.createGetExperienceMedia)

return function(p0)
	-- upvalues: createGetExperiencesPlayabilityStatusModule (ref), createGetExperiencesProductInfoModule (ref), createGetExperiencesDetailsModule (ref), createGetExperienceMediaModule (ref)
	return {
		GetExperiencesPlayabilityStatus = createGetExperiencesPlayabilityStatusModule(p0),
		GetExperiencesProductInfo = createGetExperiencesProductInfoModule(p0),
		GetExperiencesDetails = createGetExperiencesDetailsModule(p0),
		GetExperienceMedia = createGetExperienceMediaModule(p0)
	}
end