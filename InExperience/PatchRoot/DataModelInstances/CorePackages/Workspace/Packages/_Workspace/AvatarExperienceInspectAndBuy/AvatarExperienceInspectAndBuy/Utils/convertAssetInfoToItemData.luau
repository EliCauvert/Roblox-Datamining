local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local parent = avatarExperienceInspectAndBuy.Parent
local _ = require(avatarExperienceInspectAndBuy.Types)
local tutilsModule = require(parent.tutils)
local itemTypeEnum = require(avatarExperienceInspectAndBuy.Parent.AXCommon).Enums.ItemTypeEnum
local fFlagAXEnableIaBTimedOptionsBulkPurchase = require(parent.AvatarExperienceFlags).FFlagAXEnableIaBTimedOptionsBulkPurchase

return function(p0, p1) --[[ line: 22 ]]
	-- upvalues: tutilsModule (ref), itemTypeEnum (ref), fFlagAXEnableIaBTimedOptionsBulkPurchase (ref)
	local t = {
		id = p0.assetId,
		name = p0.name,
		meta = p0.meta,
		description = p0.description,
		itemType = itemTypeEnum.Asset,
		itemSubType = p0.assetTypeId,
		creator = {
			creatorId = p0.creatorId or "",
			creatorName = p0.creatorName or "",
			creatorHasVerifiedBadge = p0.creatorHasVerifiedBadge or false
		},
		saleLocationType = p0.saleLocationType,
		itemRestrictions = p0.itemRestrictions or {},
		priceInRobux = p0.price,
		noPriceStatus = p0.noPriceStatus,
		catalogPriceStatus = p0.catalogPriceStatus,
		isOwned = p0.owned,
		isOffSale = p0.isOffSale,
		collectibleItemId = p0.collectibleItemId,
		creatingUniverseId = p0.creatingUniverseId
	}
	local t_1 = {
		quantityLimitPerUser = p0.collectibleQuantityLimitPerUser,
		resellableCount = p0.resellableCount or (if p1 then tutilsModule.fieldCount(p1) else 0),
		collectibleLowestAvailableResaleProductId = p0.collectibleLowestAvailableResaleProductId,
		collectibleLowestAvailableResaleItemInstanceId = p0.collectibleLowestAvailableResaleItemInstanceId,
		unitsAvailableForConsumption = p0.remaining
	}
	local hasResellers = p0.hasResellers
	
	if not hasResellers and p0.collectibleLowestAvailableResaleProductId ~= nil then
		hasResellers = p0.collectibleLowestAvailableResaleProductId ~= ""
	end
	t_1.hasResellers = hasResellers
	t_1.lowestResalePrice = p0.collectibleLowestResalePrice or 0
	t_1.totalQuantity = p0.collectibleTotalQuantity or 0
	t_1.experiences = p0 and (p0.saleLocation and (p0.saleLocation.UniverseIds or {}))
	t.collectibleItemDetails = t_1
	t.favoritesDetails = {
		numFavorites = p0.numFavorites,
		isFavorited = p0.isFavorited
	}
	t.timedOptions = if fFlagAXEnableIaBTimedOptionsBulkPurchase then p0.timedOptions else nil
	
	return t
end