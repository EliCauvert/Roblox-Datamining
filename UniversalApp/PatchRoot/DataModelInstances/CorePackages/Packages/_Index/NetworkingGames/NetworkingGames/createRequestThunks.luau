local networkRequests = script.Parent.networkRequests
local createGetExperiencesPlayabilityStatusModule = require(networkRequests.createGetExperiencesPlayabilityStatus)
local createGetExperiencesProductInfoModule = require(networkRequests.createGetExperiencesProductInfo)
local createGetExperiencesDetailsModule = require(networkRequests.createGetExperiencesDetails)
local createGetExperienceMediaModule = require(networkRequests.createGetExperienceMedia)

return function(p1)
	-- upvalues: createGetExperiencesPlayabilityStatusModule (ref), createGetExperiencesProductInfoModule (ref), createGetExperiencesDetailsModule (ref), createGetExperienceMediaModule (ref)
	return {
		GetExperiencesPlayabilityStatus = createGetExperiencesPlayabilityStatusModule(p1),
		GetExperiencesProductInfo = createGetExperiencesProductInfoModule(p1),
		GetExperiencesDetails = createGetExperiencesDetailsModule(p1),
		GetExperienceMedia = createGetExperienceMediaModule(p1)
	}
end