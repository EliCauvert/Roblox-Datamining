local itemType = require(script:FindFirstAncestor("AvatarExperienceGifting").Parent.Gifting).Enums.ItemType

return function(p1)
	-- upvalues: itemType (ref)
	return if p1 == nil or p1 == "" then nil else { itemType = itemType.CollectibleItem, itemId = p1 }
end