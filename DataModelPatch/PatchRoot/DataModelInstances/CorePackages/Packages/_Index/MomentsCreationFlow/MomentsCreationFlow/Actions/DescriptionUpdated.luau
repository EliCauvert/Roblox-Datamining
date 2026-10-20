return require(script:FindFirstAncestor("MomentsCreationFlow").Parent.Rodux).makeActionCreator(script.Name, function(Description)
	return { description = Description }
end)