local useSelector = require(script:FindFirstAncestor("RobloxAppHooks").Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function()
	-- upvalues: useSelector (ref)
	return useSelector(function(p0)
		return if p0.TopBar then if p0.TopBar.topBarHeight then p0.TopBar.topBarHeight else 0 else 0
	end)
end