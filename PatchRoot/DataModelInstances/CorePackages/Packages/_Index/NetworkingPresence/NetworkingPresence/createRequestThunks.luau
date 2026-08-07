-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:54 2026 Pacific Standard Time.

local networkRequests = script.Parent.networkRequests
local createGetPresencesFromUserIdsModule = require(networkRequests.createGetPresencesFromUserIds)
local createSetInvisibilityStatusModule = require(networkRequests.createSetInvisibilityStatus)
local _ = require(script.Parent.networkingPresenceTypes)

return function(p0) --[[ line: 7 ]]
	-- upvalues: createGetPresencesFromUserIdsModule (ref), createSetInvisibilityStatusModule (ref)
	return {
		GetPresencesFromUserIds = createGetPresencesFromUserIdsModule(p0),
		SetInvisibilityStatus = createSetInvisibilityStatusModule(p0)
	}
end