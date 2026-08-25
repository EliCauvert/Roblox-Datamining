local useAppPolicy = require(script:FindFirstAncestor("EditProfile").Parent.UniversalAppPolicy).useAppPolicy

return function()
	-- upvalues: useAppPolicy (ref)
	return useAppPolicy(function(p0)
		return p0.getRealNamesInDisplayNamesEnabled()
	end)
end