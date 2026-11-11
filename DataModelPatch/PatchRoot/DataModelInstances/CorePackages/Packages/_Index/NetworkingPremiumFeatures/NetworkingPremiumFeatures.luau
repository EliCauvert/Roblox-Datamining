local CreateGetUserPremiumMembershipStatusModule = require(script.networkRequests.createGetUserPremiumMembershipStatus)

return {
	config = function(p1)
		-- upvalues: CreateGetUserPremiumMembershipStatusModule (copy)
		return {
			GetUserPremiumMembershipStatus = CreateGetUserPremiumMembershipStatusModule(p1)
		}
	end
}