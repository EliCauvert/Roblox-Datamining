local UniversalAppPolicyModule = require(game:GetService("CorePackages").Workspace.Packages.UniversalAppPolicy)

return function()
	-- upvalues: UniversalAppPolicyModule (copy)
	return (UniversalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTab())
end