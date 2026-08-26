local useAppPolicy = require(script:FindFirstAncestor("Squads").Parent.UniversalAppPolicy).useAppPolicy

return function()
	-- upvalues: useAppPolicy (ref)
	return useAppPolicy(function(p1)
		return p1.getCanAccessParty()
	end)
end