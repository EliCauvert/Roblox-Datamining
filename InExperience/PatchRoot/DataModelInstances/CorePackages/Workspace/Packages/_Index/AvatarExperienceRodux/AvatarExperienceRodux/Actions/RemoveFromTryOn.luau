return require(script:FindFirstAncestor("AvatarExperienceRodux").Parent.Rodux).makeActionCreator(script.Name, function(ItemId, ItemType) --[[ Line: 10 ]]
	return { itemId = ItemId, itemType = ItemType }
end)