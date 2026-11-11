return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(LastRemovedFriendId)
	return { lastRemovedFriendId = LastRemovedFriendId }
end)