-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:54 2026 Pacific Standard Time.

local createGetUserPremiumMembershipStatusModule = require(script.networkRequests.createGetUserPremiumMembershipStatus)

return {
	config = function(p0) --[[ line: 4 ]]
		-- upvalues: createGetUserPremiumMembershipStatusModule (ref)
		return {
			GetUserPremiumMembershipStatus = createGetUserPremiumMembershipStatusModule(p0)
		}
	end
}