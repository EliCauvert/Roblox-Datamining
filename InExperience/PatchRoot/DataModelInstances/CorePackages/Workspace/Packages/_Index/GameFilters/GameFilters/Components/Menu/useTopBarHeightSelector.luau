local useSelector = require(script:FindFirstAncestor("GameFilters").Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function() --[[ line: 7 | named "useTopBarHeightSelector" ]]
	-- upvalues: useSelector (ref)
	return useSelector(function(p0) --[[ line: 8 ]]
		return p0.TopBar.topBarHeight
	end)
end