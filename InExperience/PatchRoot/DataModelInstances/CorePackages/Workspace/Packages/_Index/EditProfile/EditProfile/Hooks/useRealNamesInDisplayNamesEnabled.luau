local useAppPolicy = require(script:FindFirstAncestor("EditProfile").Parent.UniversalAppPolicy).useAppPolicy

return function()
	-- upvalues: useAppPolicy (ref)
	return useAppPolicy(function(p1)
		return p1.getRealNamesInDisplayNamesEnabled()
	end)
end