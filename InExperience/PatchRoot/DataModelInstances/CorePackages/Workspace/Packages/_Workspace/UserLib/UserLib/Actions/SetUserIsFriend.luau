return require(script:FindFirstAncestor("UserLib").Parent.Rodux).makeActionCreator(script.Name, function(UserId, IsFriend) --[[ Line: 6 ]]
	return { userId = UserId, isFriend = IsFriend }
end)