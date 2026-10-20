return require(script:FindFirstAncestor("RoduxUsers").Parent.Rodux).makeActionCreator(script.Name, function(Id)
	return { payload = { id = Id } }
end)