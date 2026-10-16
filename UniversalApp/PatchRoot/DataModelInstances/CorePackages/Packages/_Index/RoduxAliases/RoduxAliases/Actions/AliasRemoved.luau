return require(script:FindFirstAncestor("RoduxAliases").Parent.Rodux).makeActionCreator(script.Name, function(UserId) --[[ Line: 5 ]]
	return { payload = { userId = UserId } }
end)