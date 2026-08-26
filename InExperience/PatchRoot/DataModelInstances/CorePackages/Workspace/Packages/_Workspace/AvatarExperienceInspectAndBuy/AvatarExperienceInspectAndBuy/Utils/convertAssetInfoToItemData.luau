local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local parent = avatarExperienceInspectAndBuy.Parent
local _ = require(avatarExperienceInspectAndBuy.Types)
local tutilsModule = require(parent.tutils)
local itemTypeEnum = require(avatarExperienceInspectAndBuy.Parent.AXCommon).Enums.ItemTypeEnum
local fFlagAXEnableIaBTimedOptionsBulkPurchase = require(parent.AvatarExperienceFlags).FFlagAXEnableIaBTimedOptionsBulkPurchase

return function(p1, p2)
	-- upvalues: tutilsModule (ref), itemTypeEnum (ref), fFlagAXEnableIaBTimedOptionsBulkPurchase (ref)
	local t = {
		id = p1.assetId,
		name = p1.name,
		meta = p1.meta,
		description = p1.description,
		itemType = itemTypeEnum.Asset,
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
		creatingUniverseId = p1.creatingUniverseId
	}
	local t_1 = {
		quantityLimitPerUser = p1.collectibleQuantityLimitPerUser,
		resellableCount = p1.resellableCount or (if p2 then tutilsModule.fieldCount(p2) else 0),
		collectibleLowestAvailableResaleProductId = p1.collectibleLowestAvailableResaleProductId,
		collectibleLowestAvailableResaleItemInstanceId = p1.collectibleLowestAvailableResaleItemInstanceId,
		unitsAvailableForConsumption = p1.remaining
	}
	local hasResellers = p1.hasResellers
	
	if not hasResellers and p1.collectibleLowestAvailableResaleProductId ~= nil then
		hasResellers = p1.collectibleLowestAvailableResaleProductId ~= ""
	end
	t_1.hasResellers = hasResellers
	t_1.lowestResalePrice = p1.collectibleLowestResalePrice or 0
	t_1.totalQuantity = p1.collectibleTotalQuantity or 0
	t_1.experiences = p1 and (p1.saleLocation and (p1.saleLocation.UniverseIds or {}))
	t.collectibleItemDetails = t_1
	t.favoritesDetails = {
		numFavorites = p1.numFavorites,
		isFavorited = p1.isFavorited
	}
	t.timedOptions = if fFlagAXEnableIaBTimedOptionsBulkPurchase then p1.timedOptions else nil
	
	return t
end