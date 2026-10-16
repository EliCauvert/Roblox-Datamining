local NetworkRequests = script.Parent.networkRequests
local CreateGetPresencesFromUserIdsModule = require(NetworkRequests.createGetPresencesFromUserIds)
local CreateSetInvisibilityStatusModule = require(NetworkRequests.createSetInvisibilityStatus)
local _ = require(script.Parent.networkingPresenceTypes)

return function(p1) --[[ Line: 7 ]]
	-- upvalues: CreateGetPresencesFromUserIdsModule (copy), CreateSetInvisibilityStatusModule (copy)
	return {
		GetPresencesFromUserIds = CreateGetPresencesFromUserIdsModule(p1),
		SetInvisibilityStatus = CreateSetInvisibilityStatusModule(p1)
	}
end