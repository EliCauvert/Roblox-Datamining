local useAppPolicy = require(script:FindFirstAncestor("Squads").Parent.UniversalAppPolicy).useAppPolicy

return function()
	-- upvalues: useAppPolicy (ref)
	return useAppPolicy(function(p0)
		return p0.getCanAccessParty()
	end)
end