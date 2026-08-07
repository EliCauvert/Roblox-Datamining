local useSelector = require(script:FindFirstAncestor("RobloxAppHooks").Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function() --[[ line: 8 ]]
	-- upvalues: useSelector (ref)
	return useSelector(function(p0) --[[ line: 9 ]]
		return if p0.TopBar then if p0.TopBar.statusBarHeight then p0.TopBar.statusBarHeight else 0 else 0
	end)
end