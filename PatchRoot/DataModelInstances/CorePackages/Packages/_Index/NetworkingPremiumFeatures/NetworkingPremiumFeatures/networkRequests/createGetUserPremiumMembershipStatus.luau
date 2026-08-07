-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:54 2026 Pacific Standard Time.

local PREMIUM_FEATURES_URLModule = require(script.Parent.Parent.PREMIUM_FEATURES_URL)

return function(p0) --[[ line: 8 ]]
	-- upvalues: PREMIUM_FEATURES_URLModule (ref)
	return p0.roduxNetworking.GET({ Name = "GetUserPremiumMembershipStatus" }, function(p1, p2) --[[ line: 13 ]]
		-- upvalues: PREMIUM_FEATURES_URLModule (copy)
		return p1(PREMIUM_FEATURES_URLModule):path("v1"):path("users"):id(p2):path("validate-membership")
	end)
end