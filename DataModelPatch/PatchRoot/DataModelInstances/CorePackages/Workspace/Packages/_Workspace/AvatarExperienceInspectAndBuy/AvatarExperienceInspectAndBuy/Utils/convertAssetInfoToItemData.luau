local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local Parent = AvatarExperienceInspectAndBuy.Parent
local _ = require(AvatarExperienceInspectAndBuy.Types)
local TutilsModule = require(Parent.tutils)
local ItemTypeEnum = require(AvatarExperienceInspectAndBuy.Parent.AXCommon).Enums.ItemTypeEnum
local FFlagAXEnableIaBTimedOptionsBulkPurchase = require(Parent.AvatarExperienceFlags).FFlagAXEnableIaBTimedOptionsBulkPurchase

return function(p1, p2)
	-- upvalues: TutilsModule (copy), ItemTypeEnum (copy), FFlagAXEnableIaBTimedOptionsBulkPurchase (copy)
	local FieldCountResult = if p2 then TutilsModule.fieldCount(p2) else 0
	
	return {
		id = p1.assetId,
		name = p1.name,
		meta = p1.meta,
		description = p1.description,
		itemType = ItemTypeEnum.Asset,
		itemSubType = p1.assetTypeId,
		creator = {
			creatorId = p1.creatorId or "",
			creatorName = p1.creatorName or "",
			creatorHasVerifiedBadge = p1.creatorHasVerifiedBadge or false
		},
		saleLocationType = p1.saleLocationType,
		itemRestrictions = p1.itemRestrictions or {},
		priceInRobux = p1.price,
		noPriceStatus = p1.noPriceStatus,
		catalogPriceStatus = p1.catalogPriceStatus,
		isOwned = p1.owned,
		isOffSale = p1.isOffSale,
		collectibleItemId = p1.collectibleItemId,
		creatingUniverseId = p1.creatingUniverseId,
		collectibleItemDetails = {
			quantityLimitPerUser = p1.collectibleQuantityLimitPerUser,
			resellableCount = p1.resellableCount or FieldCountResult,
			collectibleLowestAvailableResaleProductId = p1.collectibleLowestAvailableResaleProductId,
			collectibleLowestAvailableResaleItemInstanceId = p1.collectibleLowestAvailableResaleItemInstanceId,
			unitsAvailableForConsumption = p1.remaining,
			hasResellers = p1.hasResellers or p1.collectibleLowestAvailableResaleProductId ~= nil and p1.collectibleLowestAvailableResaleProductId ~= "",
			lowestResalePrice = p1.collectibleLowestResalePrice or 0,
			totalQuantity = p1.collectibleTotalQuantity or 0,
			experiences = p1 and p1.saleLocation and p1.saleLocation.UniverseIds or {}
		},
		favoritesDetails = {
			numFavorites = p1.numFavorites,
			isFavorited = p1.isFavorited
		},
		timedOptions = if FFlagAXEnableIaBTimedOptionsBulkPurchase then p1.timedOptions else nil
	}
end