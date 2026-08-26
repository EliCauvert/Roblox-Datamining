return require(script:FindFirstAncestor("LegacyFriendsRodux").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { presenceCounts = p1 }
end)