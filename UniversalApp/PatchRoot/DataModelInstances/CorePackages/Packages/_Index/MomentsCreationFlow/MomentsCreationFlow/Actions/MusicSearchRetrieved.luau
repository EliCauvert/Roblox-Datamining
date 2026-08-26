return require(script:FindFirstAncestor("MomentsCreationFlow").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { musics = p1 }
end)