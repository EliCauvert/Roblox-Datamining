local networkRequests = script.Parent.networkRequests
local createGetPresencesFromUserIdsModule = require(networkRequests.createGetPresencesFromUserIds)
local createSetInvisibilityStatusModule = require(networkRequests.createSetInvisibilityStatus)
local _ = require(script.Parent.networkingPresenceTypes)

return function(p1)
	-- upvalues: createGetPresencesFromUserIdsModule (ref), createSetInvisibilityStatusModule (ref)
	return {
		GetPresencesFromUserIds = createGetPresencesFromUserIdsModule(p1),
		SetInvisibilityStatus = createSetInvisibilityStatusModule(p1)
	}
end