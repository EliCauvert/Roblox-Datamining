local PREMIUM_FEATURES_URLModule = require(script.Parent.Parent.PREMIUM_FEATURES_URL)

return function(p0)
	-- upvalues: PREMIUM_FEATURES_URLModule (ref)
	return p0.roduxNetworking.GET({ Name = "GetUserPremiumMembershipStatus" }, function(p1, p2)
		-- upvalues: PREMIUM_FEATURES_URLModule (copy)
		return p1(PREMIUM_FEATURES_URLModule):path("v1"):path("users"):id(p2):path("validate-membership")
	end)
end