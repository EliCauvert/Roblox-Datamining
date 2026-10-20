return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(NewParticipants)
	return { newParticipants = NewParticipants }
end)