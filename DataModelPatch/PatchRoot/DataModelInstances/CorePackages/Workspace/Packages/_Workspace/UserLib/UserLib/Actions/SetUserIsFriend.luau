return require(script:FindFirstAncestor("UserLib").Parent.Rodux).makeActionCreator(script.Name, function(UserId, IsFriend)
	return { userId = UserId, isFriend = IsFriend }
end)