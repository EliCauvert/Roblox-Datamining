-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:54 2026 Pacific Standard Time.

local networkRequests = script.Parent.networkRequests
local createGetExperiencesPlayabilityStatusModule = require(networkRequests.createGetExperiencesPlayabilityStatus)
local createGetExperiencesProductInfoModule = require(networkRequests.createGetExperiencesProductInfo)
local createGetExperiencesDetailsModule = require(networkRequests.createGetExperiencesDetails)
local createGetExperienceMediaModule = require(networkRequests.createGetExperienceMedia)

return function(p0) --[[ line: 8 ]]
	-- upvalues: createGetExperiencesPlayabilityStatusModule (ref), createGetExperiencesProductInfoModule (ref), createGetExperiencesDetailsModule (ref), createGetExperienceMediaModule (ref)
	return {
		GetExperiencesPlayabilityStatus = createGetExperiencesPlayabilityStatusModule(p0),
		GetExperiencesProductInfo = createGetExperiencesProductInfoModule(p0),
		GetExperiencesDetails = createGetExperiencesDetailsModule(p0),
		GetExperienceMedia = createGetExperienceMediaModule(p0)
	}
end