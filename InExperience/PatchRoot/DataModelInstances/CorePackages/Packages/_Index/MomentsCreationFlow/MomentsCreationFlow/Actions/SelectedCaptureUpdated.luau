return require(script:FindFirstAncestor("MomentsCreationFlow").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { capture = p1 }
end)