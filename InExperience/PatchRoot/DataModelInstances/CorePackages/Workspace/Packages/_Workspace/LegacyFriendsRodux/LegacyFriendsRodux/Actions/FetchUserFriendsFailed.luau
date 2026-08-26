return require(script:FindFirstAncestor("LegacyFriendsRodux").Parent.Rodux).makeActionCreator(script.Name, function(p1, p2)
	return { userId = p1, response = p2 }
end)