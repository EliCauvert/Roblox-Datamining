return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator("SET_FRIEND_STATUS", function(p1, p2)
	return { userId = p1, friendStatus = p2 }
end)