local universalAppPolicyModule = require(script:FindFirstAncestor("FriendsMenu").Parent.UniversalAppPolicy)

return function() --[[ line: 6 | named "getRenameFriendsToConnectionsEnabledFriendsMenu" ]]
	-- upvalues: universalAppPolicyModule (ref)
	return universalAppPolicyModule.getAppFeaturePolicies().getRenameFriendsToConnections()
end