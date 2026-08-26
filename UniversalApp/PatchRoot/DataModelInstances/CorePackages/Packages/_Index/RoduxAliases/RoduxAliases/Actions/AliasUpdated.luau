return require(script:FindFirstAncestor("RoduxAliases").Parent.Rodux).makeActionCreator(script.Name, function(p1, p2)
	return { payload = { userId = p1, newAlias = p2 } }
end)