local UseSelectorFunction = require(script:FindFirstAncestor("RoduxSquads").Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function() --[[ Line: 5 | Named "useCurrentSquadSelector" ]]
	-- upvalues: UseSelectorFunction (copy)
	return (UseSelectorFunction(function(p1) --[[ Line: 6 ]]
		return p1.Squad and (p1.Squad.Squad and p1.Squad.Squad.currentSquad)
	end))
end