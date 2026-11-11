return require(script:FindFirstAncestor("LegacyFriendsRodux").Parent.Rodux).makeActionCreator(script.Name, function(PresenceCounts)
	return { presenceCounts = PresenceCounts }
end)