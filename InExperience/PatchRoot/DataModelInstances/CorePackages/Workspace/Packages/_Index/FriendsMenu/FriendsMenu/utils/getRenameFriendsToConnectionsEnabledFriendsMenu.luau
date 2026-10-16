local UniversalAppPolicyModule = require(script:FindFirstAncestor("FriendsMenu").Parent.UniversalAppPolicy)

return function() --[[ Line: 6 | Named "getRenameFriendsToConnectionsEnabledFriendsMenu" ]]
	-- upvalues: UniversalAppPolicyModule (copy)
	return UniversalAppPolicyModule.getAppFeaturePolicies().getRenameFriendsToConnections()
end