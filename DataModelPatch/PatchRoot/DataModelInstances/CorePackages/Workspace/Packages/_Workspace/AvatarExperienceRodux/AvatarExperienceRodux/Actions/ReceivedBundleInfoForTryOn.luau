return require(script:FindFirstAncestor("AvatarExperienceRodux").Parent.Rodux).makeActionCreator(script.Name, function(ItemId, OutfitId)
	return { itemId = ItemId, outfitId = OutfitId }
end)