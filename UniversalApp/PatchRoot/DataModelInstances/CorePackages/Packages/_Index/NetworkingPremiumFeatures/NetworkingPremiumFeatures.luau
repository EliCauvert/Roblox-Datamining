local createGetUserPremiumMembershipStatusModule = require(script.networkRequests.createGetUserPremiumMembershipStatus)

return {
	config = function(p1)
		-- upvalues: createGetUserPremiumMembershipStatusModule (ref)
		return {
			GetUserPremiumMembershipStatus = createGetUserPremiumMembershipStatusModule(p1)
		}
	end
}