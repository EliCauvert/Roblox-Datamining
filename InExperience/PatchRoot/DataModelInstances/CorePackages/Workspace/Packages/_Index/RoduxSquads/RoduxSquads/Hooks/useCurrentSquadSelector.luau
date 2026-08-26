local useSelector = require(script:FindFirstAncestor("RoduxSquads").Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function()
	-- upvalues: useSelector (ref)
	return useSelector(function(p1)
		return p1.Squad and (p1.Squad.Squad and p1.Squad.Squad.currentSquad)
	end)
end