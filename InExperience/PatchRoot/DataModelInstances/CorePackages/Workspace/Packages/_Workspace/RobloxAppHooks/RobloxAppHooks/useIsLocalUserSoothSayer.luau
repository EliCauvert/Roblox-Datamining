local useSelector = require(script:FindFirstAncestor("RobloxAppHooks").Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function() --[[ line: 6 ]]
	-- upvalues: useSelector (ref)
	return useSelector(function(p0) --[[ line: 7 ]]
		return p0.IsLocalUserSoothsayer
	end)
end