return require(script:FindFirstAncestor("AvatarExperienceRodux").Parent.Rodux).makeActionCreator(script.Name, function(SpecialFeaturesFilter)
	return { specialFeaturesFilter = SpecialFeaturesFilter }
end)