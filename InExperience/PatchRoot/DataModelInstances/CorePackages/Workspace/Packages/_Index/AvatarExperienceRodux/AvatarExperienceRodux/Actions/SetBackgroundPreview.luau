return require(script:FindFirstAncestor("AvatarExperienceRodux").Parent.Rodux).makeActionCreator(script.Name, function(PreviewKey)
	return { previewKey = PreviewKey }
end)