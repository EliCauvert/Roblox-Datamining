local ItemType = require(script:FindFirstAncestor("AvatarExperienceGifting").Parent.Gifting).Enums.ItemType

return function(ItemId)
	-- upvalues: ItemType (copy)
	return if ItemId == nil or ItemId == "" then nil else { itemType = ItemType.CollectibleItem, itemId = ItemId }
end