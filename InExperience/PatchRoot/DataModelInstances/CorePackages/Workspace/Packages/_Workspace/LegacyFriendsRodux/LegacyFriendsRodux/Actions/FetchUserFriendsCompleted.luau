return require(script:FindFirstAncestor("LegacyFriendsRodux").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { userId = p1 }
end)