return require(script:FindFirstAncestor("AvatarExperienceRodux").Parent.Rodux).makeActionCreator(script.Name, function(CurrentCharacter)
	return { currentCharacter = CurrentCharacter }
end)