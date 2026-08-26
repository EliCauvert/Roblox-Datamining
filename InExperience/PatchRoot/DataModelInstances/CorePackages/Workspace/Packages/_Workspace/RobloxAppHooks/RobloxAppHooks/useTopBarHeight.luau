local useSelector = require(script:FindFirstAncestor("RobloxAppHooks").Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function()
	-- upvalues: useSelector (ref)
	return useSelector(function(p1)
		return if p1.TopBar then if p1.TopBar.topBarHeight then p1.TopBar.topBarHeight else 0 else 0
	end)
end