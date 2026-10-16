local PREMIUMFEATURESURLModule = require(script.Parent.Parent.PREMIUM_FEATURES_URL)

return function(p1) --[[ Line: 8 ]]
	-- upvalues: PREMIUMFEATURESURLModule (copy)
	return p1.roduxNetworking.GET({ Name = "GetUserPremiumMembershipStatus" }, function(Callback, p2) --[[ Line: 13 ]]
		-- upvalues: PREMIUMFEATURESURLModule (upval)
		return Callback(PREMIUMFEATURESURLModule):path("v1"):path("users"):id(p2):path("validate-membership")
	end)
end