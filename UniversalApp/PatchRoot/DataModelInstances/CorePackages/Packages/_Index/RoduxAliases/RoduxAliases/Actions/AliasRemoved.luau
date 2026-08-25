return require(script:FindFirstAncestor("RoduxAliases").Parent.Rodux).makeActionCreator(script.Name, function(p0)
	return { payload = { userId = p0 } }
end)