-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:54 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local _ = require(parent.networkingPresenceTypes)
local PRESENCE_URLModule = require(parent.PRESENCE_URL)

return function(p0) --[[ line: 5 ]]
	-- upvalues: PRESENCE_URLModule (ref)
	return p0.roduxNetworking.POST({ Name = "GetPresencesFromUserIds" }, function(p1, p2) --[[ line: 8 ]]
		-- upvalues: PRESENCE_URLModule (copy)
		return p1(PRESENCE_URLModule):path("v1"):path("presence"):path("users"):body({ userIds = p2 }):setStatusIds(p2)
	end)
end