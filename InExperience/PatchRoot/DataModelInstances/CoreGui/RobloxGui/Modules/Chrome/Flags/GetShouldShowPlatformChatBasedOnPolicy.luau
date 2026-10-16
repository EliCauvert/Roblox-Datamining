local UniversalAppPolicyModule = require(game:GetService("CorePackages").Workspace.Packages.UniversalAppPolicy)

return function() --[[ Line: 5 ]]
	-- upvalues: UniversalAppPolicyModule (copy)
	return (UniversalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTab())
end