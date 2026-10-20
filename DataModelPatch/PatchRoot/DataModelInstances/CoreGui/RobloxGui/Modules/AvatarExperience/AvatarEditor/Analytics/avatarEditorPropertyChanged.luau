local ImpressionEnums = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceAnalytics).Enums.ImpressionEnums

return function(p1, p2, p3, ItemId, p4, p5, RequestId)
	-- upvalues: ImpressionEnums (copy)
	assert(type(p2) == "string", "Expected eventContext to be a string")
	assert(type(p3) == "string", "Expected propertyName to be a string")
	assert(type(ItemId) == "string" or type(ItemId) == "number", "Expected propertyValue to be a string")
	assert(type(p4) == "number", "Expected currentCategoryIndex to be a number")
	assert(type(p5) == "number", "Expected tabIndex to be a number")
	p1:sendTelemetryEvent(p2, "marketplaceOrganicFELog", {
		requestId = RequestId,
		itemId = ItemId,
		actionType = if p2 == "EquipAsset" then ImpressionEnums.ActionType.ITEM_CLICK elseif p2 == "UnequipAsset" then ImpressionEnums.ActionType.ITEM_DESELECTED else nil,
		surface = ImpressionEnums.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
	})
end