local universalAppPolicyModule = require(script:FindFirstAncestor("FriendsMenu").Parent.UniversalAppPolicy)

return function()
	-- upvalues: universalAppPolicyModule (ref)
	return universalAppPolicyModule.getAppFeaturePolicies().getRenameFriendsToConnections()
end