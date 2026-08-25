local useSelector = require(script:FindFirstAncestor("GameFilters").Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function()
	-- upvalues: useSelector (ref)
	return useSelector(function(p0)
		return p0.TopBar.topBarHeight
	end)
end