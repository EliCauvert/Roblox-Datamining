return require(script:FindFirstAncestor("GameThumbnailsRodux").Parent.Rodux).makeActionCreator(script.Name, function(Thumbnails)
	assert(type(Thumbnails) == "table", string.format("SetGameThumbnails action expects thumbnailsTable to be a table, was %s", (type(Thumbnails))))
	
	return { thumbnails = Thumbnails }
end)