local useAppPolicy = require(script:FindFirstAncestor("ProfilePlatform").Parent.UniversalAppPolicy).useAppPolicy

return function()
	-- upvalues: useAppPolicy (ref)
	return useAppPolicy(function(p0)
		return p0.getCanSeeChatTab()
	end)
end