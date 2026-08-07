-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:52 2026 Pacific Standard Time.

local ALIAS_URLModule = require(script.Parent.Parent.ALIAS_URL)
local _ = require(script.Parent.Parent.networkingAliasesTypes)

return function(p0) --[[ line: 4 ]]
	-- upvalues: ALIAS_URLModule (ref)
	return p0.roduxNetworking.POST({ Name = "SetUserTag" }, function(p1, p2, p3) --[[ line: 9 ]]
		-- upvalues: ALIAS_URLModule (copy)
		return p1(ALIAS_URLModule):path("v1"):path("user"):path("tag"):body({ targetUserId = p2, userTag = p3 })
	end)
end