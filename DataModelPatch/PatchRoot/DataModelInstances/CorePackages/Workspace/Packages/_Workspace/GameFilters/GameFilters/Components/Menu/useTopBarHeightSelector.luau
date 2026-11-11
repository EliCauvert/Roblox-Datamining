local UseSelectorFunction = require(script:FindFirstAncestor("GameFilters").Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function()
	-- upvalues: UseSelectorFunction (copy)
	return UseSelectorFunction(function(p1)
		return p1.TopBar.topBarHeight
	end)
end