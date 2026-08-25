return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator("SET_FRIEND_STATUS", function(p0, p1)
	return { userId = p0, friendStatus = p1 }
end)