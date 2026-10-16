local UseAppPolicyFunction = require(script:FindFirstAncestor("EditProfile").Parent.UniversalAppPolicy).useAppPolicy

return function() --[[ Line: 5 ]]
	-- upvalues: UseAppPolicyFunction (copy)
	return UseAppPolicyFunction(function(p1) --[[ Line: 6 ]]
		return p1.getRealNamesInDisplayNamesEnabled()
	end)
end