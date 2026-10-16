local UseSelectorFunction = require(script:FindFirstAncestor("RobloxAppHooks").Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function() --[[ Line: 8 ]]
	-- upvalues: UseSelectorFunction (copy)
	return UseSelectorFunction(function(p1) --[[ Line: 9 ]]
		return if p1.TopBar and p1.TopBar.topBarHeight then p1.TopBar.topBarHeight else 0
	end)
end