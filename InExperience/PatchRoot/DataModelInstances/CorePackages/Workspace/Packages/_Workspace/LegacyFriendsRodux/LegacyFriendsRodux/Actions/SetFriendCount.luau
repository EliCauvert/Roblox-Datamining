return require(script:FindFirstAncestor("LegacyFriendsRodux").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { count = p1 }
end)