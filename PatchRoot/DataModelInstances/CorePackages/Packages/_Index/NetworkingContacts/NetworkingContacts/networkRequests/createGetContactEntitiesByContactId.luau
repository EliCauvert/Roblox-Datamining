-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:53 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local API_URLModule = require(parent.API_URL)
local _ = require(parent.Types.networkRequestsTypes)

return function(p0) --[[ line: 5 ]]
	-- upvalues: API_URLModule (ref)
	return p0.roduxNetworking.POST({ Name = "GetContactEntitiesByContactId" }, function(p1, p2) --[[ line: 10 ]]
		-- upvalues: API_URLModule (copy)
		return p1(API_URLModule):path("contacts-api"):path("v1"):path("contacts"):path("entities"):body({ userContactIds = p2 })
	end)
end