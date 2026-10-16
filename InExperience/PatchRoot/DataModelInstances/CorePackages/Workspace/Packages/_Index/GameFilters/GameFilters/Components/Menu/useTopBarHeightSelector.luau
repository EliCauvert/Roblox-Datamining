local UseSelectorFunction = require(script:FindFirstAncestor("GameFilters").Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function() --[[ Line: 7 | Named "useTopBarHeightSelector" ]]
	-- upvalues: UseSelectorFunction (copy)
	return UseSelectorFunction(function(p1) --[[ Line: 8 ]]
		return p1.TopBar.topBarHeight
	end)
end