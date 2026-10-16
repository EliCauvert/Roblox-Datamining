return require(script:FindFirstAncestor("UserLib").Parent.Rodux).makeActionCreator(script.Name, function(UserId) --[[ Line: 6 ]]
	return { userId = UserId }
end)