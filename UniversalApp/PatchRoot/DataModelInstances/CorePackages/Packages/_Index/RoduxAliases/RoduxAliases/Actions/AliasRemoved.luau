return require(script:FindFirstAncestor("RoduxAliases").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { payload = { userId = p1 } }
end)