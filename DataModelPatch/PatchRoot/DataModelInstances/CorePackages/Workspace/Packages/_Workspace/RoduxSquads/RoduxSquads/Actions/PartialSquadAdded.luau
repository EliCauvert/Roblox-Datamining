return require(script:FindFirstAncestor("RoduxSquads").Parent.Rodux).makeActionCreator(script.Name, function(PartialSquad)
	return { payload = { partialSquad = PartialSquad } }
end)