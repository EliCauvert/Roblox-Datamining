return require(script:FindFirstAncestor("AvatarExperienceHeadRefinement").Parent.Rodux).makeActionCreator(script.Name, function(IsEnabled)
	return { isEnabled = IsEnabled }
end)