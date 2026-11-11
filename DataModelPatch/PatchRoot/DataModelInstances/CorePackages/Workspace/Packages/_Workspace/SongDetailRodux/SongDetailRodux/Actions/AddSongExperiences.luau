return require(script:FindFirstAncestor("SongDetailRodux").Parent.Rodux).makeActionCreator(script.Name, function(SongExperiences)
	return { songExperiences = SongExperiences }
end)