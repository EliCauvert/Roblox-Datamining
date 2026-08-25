local universalAppPolicyModule = require(game:GetService("CorePackages").Workspace.Packages.UniversalAppPolicy)

return function()
	-- upvalues: universalAppPolicyModule (ref)
	return universalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTab()
end