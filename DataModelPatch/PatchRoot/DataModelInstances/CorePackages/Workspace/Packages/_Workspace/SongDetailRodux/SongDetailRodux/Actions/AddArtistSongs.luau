return require(script:FindFirstAncestor("SongDetailRodux").Parent.Rodux).makeActionCreator(script.Name, function(ArtistSongs)
	return { artistSongs = ArtistSongs }
end)