local useAppPolicy = require(script:FindFirstAncestor("EditProfile").Parent.UniversalAppPolicy).useAppPolicy

return function() --[[ line: 5 ]]
	-- upvalues: useAppPolicy (ref)
	return useAppPolicy(function(p0) --[[ line: 6 ]]
		return p0.getRealNamesInDisplayNamesEnabled()
	end)
end