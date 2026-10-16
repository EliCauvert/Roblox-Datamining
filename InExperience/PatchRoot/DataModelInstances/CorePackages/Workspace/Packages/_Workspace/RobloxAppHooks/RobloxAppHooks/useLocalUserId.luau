local UseSelectorFunction = require(script:FindFirstAncestor("RobloxAppHooks").Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function() --[[ Line: 6 ]]
	-- upvalues: UseSelectorFunction (copy)
	return UseSelectorFunction(function(p1) --[[ Line: 7 ]]
		return p1.LocalUserId
	end)
end