local useSelector = require(script:FindFirstAncestor("RobloxAppHooks").Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function()
	-- upvalues: useSelector (ref)
	return useSelector(function(p1)
		return p1.LocalUserId
	end)
end