local UseSelectorFunction = require(script:FindFirstAncestor("RobloxAppHooks").Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function()
	-- upvalues: UseSelectorFunction (copy)
	return UseSelectorFunction(function(p1)
		return if p1.TopBar and p1.TopBar.topBarHeight then p1.TopBar.topBarHeight else 0
	end)
end