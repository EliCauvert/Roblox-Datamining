local UseSelectorFunction = require(script:FindFirstAncestor("AppChat").Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function(p1) --[[ Line: 6 ]]
	-- upvalues: UseSelectorFunction (copy)
	return UseSelectorFunction(function(p2) --[[ Line: 7 ]]
		-- upvalues: p1 (copy)
		return if p1 then p2.Users[p1] else nil
	end)
end