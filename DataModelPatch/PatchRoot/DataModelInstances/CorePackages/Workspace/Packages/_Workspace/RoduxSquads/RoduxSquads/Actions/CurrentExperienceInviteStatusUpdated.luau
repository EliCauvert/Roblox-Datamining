return require(script:FindFirstAncestor("RoduxSquads").Parent.Rodux).makeActionCreator(script.Name, function(Payload)
	return { payload = Payload }
end)