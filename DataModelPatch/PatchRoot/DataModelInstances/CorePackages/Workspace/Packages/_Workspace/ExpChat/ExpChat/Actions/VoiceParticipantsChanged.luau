return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(NewParticipants)
	return { newParticipants = NewParticipants }
end)