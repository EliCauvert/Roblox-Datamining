local useAppPolicy = require(script:FindFirstAncestor("ProfilePlatform").Parent.UniversalAppPolicy).useAppPolicy

return function()
	-- upvalues: useAppPolicy (ref)
	return useAppPolicy(function(p1)
		return p1.getWebViewSupport()
	end)
end