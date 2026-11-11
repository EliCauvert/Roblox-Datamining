return require(script:FindFirstAncestor("RoduxAliases").Parent.Rodux).makeActionCreator(script.Name, function(UserId, NewAlias)
	return { payload = { userId = UserId, newAlias = NewAlias } }
end)