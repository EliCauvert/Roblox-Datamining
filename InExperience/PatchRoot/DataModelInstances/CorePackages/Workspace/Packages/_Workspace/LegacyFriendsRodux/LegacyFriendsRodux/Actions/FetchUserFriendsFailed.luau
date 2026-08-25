return require(script:FindFirstAncestor("LegacyFriendsRodux").Parent.Rodux).makeActionCreator(script.Name, function(p0, p1)
	return { userId = p0, response = p1 }
end)