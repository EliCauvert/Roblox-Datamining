local Parent = script:FindFirstAncestor("AvatarExperienceRodux").Parent
local RoduxModule = require(Parent.Rodux)

return if require(Parent.AvatarExperienceFlags).FFlagAXMISEnableMultiShopping then RoduxModule.makeActionCreator(script.Name, function(ItemId, ItemType)
	return { itemId = ItemId, itemType = ItemType }
end) else RoduxModule.makeActionCreator(script.Name, function(ItemId)
	return { itemId = ItemId }
end)