local UniversalAppPolicyModule = require(script:FindFirstAncestor("FriendsMenu").Parent.UniversalAppPolicy)

return function()
	-- upvalues: UniversalAppPolicyModule (copy)
	return UniversalAppPolicyModule.getAppFeaturePolicies().getRenameFriendsToConnections()
end