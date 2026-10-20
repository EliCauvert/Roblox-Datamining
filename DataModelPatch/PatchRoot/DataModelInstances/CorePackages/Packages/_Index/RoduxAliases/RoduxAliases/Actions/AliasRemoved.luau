return require(script:FindFirstAncestor("RoduxAliases").Parent.Rodux).makeActionCreator(script.Name, function(UserId)
	return { payload = { userId = UserId } }
end)