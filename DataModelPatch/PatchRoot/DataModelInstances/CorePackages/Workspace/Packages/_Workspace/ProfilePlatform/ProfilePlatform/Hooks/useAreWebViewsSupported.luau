local UseAppPolicyFunction = require(script:FindFirstAncestor("ProfilePlatform").Parent.UniversalAppPolicy).useAppPolicy

return function()
	-- upvalues: UseAppPolicyFunction (copy)
	return UseAppPolicyFunction(function(p1)
		return p1.getWebViewSupport()
	end)
end