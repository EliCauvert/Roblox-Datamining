local useSelector = require(script:FindFirstAncestor("GameFilters").Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function()
	-- upvalues: useSelector (ref)
	return useSelector(function(p1)
		return p1.TopBar.topBarHeight
	end)
end