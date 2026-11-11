local UseAppPolicyFunction = require(script:FindFirstAncestor("EditProfile").Parent.UniversalAppPolicy).useAppPolicy

return function()
	-- upvalues: UseAppPolicyFunction (copy)
	return UseAppPolicyFunction(function(p1)
		return p1.getRealNamesInDisplayNamesEnabled()
	end)
end