return require(script:FindFirstAncestor("SongDetailRodux").Parent.Rodux).makeActionCreator(script.Name, function(SongDetail)
	return { songDetail = SongDetail }
end)