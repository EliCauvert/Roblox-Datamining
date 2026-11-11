return require(script:FindFirstAncestor("AvatarExperienceRodux").Parent.Rodux).makeActionCreator(script.Name, function(ProfileConfiguration)
	return { profileConfiguration = ProfileConfiguration }
end)