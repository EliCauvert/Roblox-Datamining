return require(script:FindFirstAncestor("AvatarExperienceRodux").Parent.Rodux).makeActionCreator(script.Name, function(ItemId, OutfitId) --[[ Line: 12 ]]
	return { itemId = ItemId, outfitId = OutfitId }
end)