return require(script:FindFirstAncestor("AvatarExperienceRodux").Parent.Rodux).makeActionCreator(script.Name, function(RetainTryOnColor)
	return { retainTryOnColor = RetainTryOnColor }
end)