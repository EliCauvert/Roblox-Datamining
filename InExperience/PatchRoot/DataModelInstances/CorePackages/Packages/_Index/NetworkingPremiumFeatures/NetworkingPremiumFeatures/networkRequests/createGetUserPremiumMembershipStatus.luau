local PREMIUM_FEATURES_URLModule = require(script.Parent.Parent.PREMIUM_FEATURES_URL)

return function(p1)
	-- upvalues: PREMIUM_FEATURES_URLModule (ref)
	return p1.roduxNetworking.GET({ Name = "GetUserPremiumMembershipStatus" }, function(p2, p3)
		-- upvalues: PREMIUM_FEATURES_URLModule (copy)
		return p2(PREMIUM_FEATURES_URLModule):path("v1"):path("users"):id(p3):path("validate-membership")
	end)
end