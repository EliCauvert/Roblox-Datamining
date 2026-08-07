local useSelector = require(script:FindFirstAncestor("AppChat").Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function() --[[ line: 6 ]]
	-- upvalues: useSelector (ref)
	return useSelector(function(p0) --[[ line: 7 ]]
		return p0.Users
	end)
end