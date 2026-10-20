local UseAppPolicyFunction = require(script:FindFirstAncestor("Squads").Parent.UniversalAppPolicy).useAppPolicy

return function()
	-- upvalues: UseAppPolicyFunction (copy)
	return UseAppPolicyFunction(function(p1)
		return p1.getCanAccessParty()
	end)
end