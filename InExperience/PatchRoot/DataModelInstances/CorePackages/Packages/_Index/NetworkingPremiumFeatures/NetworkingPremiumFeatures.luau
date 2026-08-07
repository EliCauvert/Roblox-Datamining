local createGetUserPremiumMembershipStatusModule = require(script.networkRequests.createGetUserPremiumMembershipStatus)

return {
	config = function(p0) --[[ line: 4 ]]
		-- upvalues: createGetUserPremiumMembershipStatusModule (ref)
		return {
			GetUserPremiumMembershipStatus = createGetUserPremiumMembershipStatusModule(p0)
		}
	end
}