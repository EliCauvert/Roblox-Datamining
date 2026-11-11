return require(script:FindFirstAncestor("AvatarExperienceRodux").Parent.Rodux).makeActionCreator(script.Name, function(OutfitTryOns)
	return { outfitTryOns = OutfitTryOns }
end)