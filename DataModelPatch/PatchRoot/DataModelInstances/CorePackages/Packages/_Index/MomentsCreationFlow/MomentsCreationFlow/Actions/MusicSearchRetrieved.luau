return require(script:FindFirstAncestor("MomentsCreationFlow").Parent.Rodux).makeActionCreator(script.Name, function(Musics)
	return { musics = Musics }
end)