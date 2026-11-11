local UseSelectorFunction = require(script:FindFirstAncestor("RobloxAppHooks").Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function()
	-- upvalues: UseSelectorFunction (copy)
	return UseSelectorFunction(function(p1)
		return p1.ScreenSize
	end)
end