return require(script:FindFirstAncestor("AvatarExperienceRodux").Parent.Rodux).makeActionCreator(script.Name, function(CurrentCharacter) --[[ Line: 5 ]]
	return { currentCharacter = CurrentCharacter }
end)