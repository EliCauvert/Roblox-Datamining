return require(script:FindFirstAncestor("RoduxAliases").Parent.Rodux).makeActionCreator(script.Name, function(p0, p1)
	return { payload = { userId = p0, newAlias = p1 } }
end)