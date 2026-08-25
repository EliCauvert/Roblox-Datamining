local networkRequests = script.Parent.networkRequests
local createGetPresencesFromUserIdsModule = require(networkRequests.createGetPresencesFromUserIds)
local createSetInvisibilityStatusModule = require(networkRequests.createSetInvisibilityStatus)
local _ = require(script.Parent.networkingPresenceTypes)

return function(p0)
	-- upvalues: createGetPresencesFromUserIdsModule (ref), createSetInvisibilityStatusModule (ref)
	return {
		GetPresencesFromUserIds = createGetPresencesFromUserIdsModule(p0),
		SetInvisibilityStatus = createSetInvisibilityStatusModule(p0)
	}
end