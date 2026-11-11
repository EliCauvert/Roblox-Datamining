local UseSelectorFunction = require(script:FindFirstAncestor("RoduxSquads").Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function()
	-- upvalues: UseSelectorFunction (copy)
	return (UseSelectorFunction(function(p1)
		return p1.Squad and (p1.Squad.Squad and p1.Squad.Squad.currentSquad)
	end))
end