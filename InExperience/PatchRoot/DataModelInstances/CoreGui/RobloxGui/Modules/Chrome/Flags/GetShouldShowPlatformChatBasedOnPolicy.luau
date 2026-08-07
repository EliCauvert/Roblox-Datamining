local universalAppPolicyModule = require(game:GetService("CorePackages").Workspace.Packages.UniversalAppPolicy)

return function() --[[ line: 5 ]]
	-- upvalues: universalAppPolicyModule (ref)
	return universalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTab()
end