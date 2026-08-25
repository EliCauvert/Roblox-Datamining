local useSelector = require(script:FindFirstAncestor("RoduxSquads").Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function()
	-- upvalues: useSelector (ref)
	return useSelector(function(p0)
		return p0.Squad and (p0.Squad.Squad and p0.Squad.Squad.currentSquad)
	end)
end