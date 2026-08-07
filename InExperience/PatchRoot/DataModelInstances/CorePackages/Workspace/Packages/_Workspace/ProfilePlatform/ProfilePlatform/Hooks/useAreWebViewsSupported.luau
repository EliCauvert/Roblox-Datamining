local useAppPolicy = require(script:FindFirstAncestor("ProfilePlatform").Parent.UniversalAppPolicy).useAppPolicy

return function() --[[ line: 6 ]]
	-- upvalues: useAppPolicy (ref)
	return useAppPolicy(function(p0) --[[ line: 7 ]]
		return p0.getWebViewSupport()
	end)
end