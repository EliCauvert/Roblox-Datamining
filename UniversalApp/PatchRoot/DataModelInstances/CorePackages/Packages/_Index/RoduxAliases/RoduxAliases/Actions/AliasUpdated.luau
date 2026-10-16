return require(script:FindFirstAncestor("RoduxAliases").Parent.Rodux).makeActionCreator(script.Name, function(UserId, NewAlias) --[[ Line: 5 ]]
	return { payload = { userId = UserId, newAlias = NewAlias } }
end)