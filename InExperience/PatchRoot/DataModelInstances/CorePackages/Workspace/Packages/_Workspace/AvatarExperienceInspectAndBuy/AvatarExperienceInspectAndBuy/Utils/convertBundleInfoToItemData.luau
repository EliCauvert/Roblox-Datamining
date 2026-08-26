local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local parent = avatarExperienceInspectAndBuy.Parent
local _ = require(avatarExperienceInspectAndBuy.Types)
local AXCommonModule = require(avatarExperienceInspectAndBuy.Parent.AXCommon)
local itemTypeEnum = AXCommonModule.Enums.ItemTypeEnum
local salesLocationType = AXCommonModule.Enums.SalesLocationType
local tutilsModule = require(parent.tutils)

return function(p1, p2)
	-- upvalues: tutilsModule (ref), itemTypeEnum (ref), salesLocationType (ref)
	local var1 = if p2 then tutilsModule.fieldCount(p2) else 0
	local t = {}
	
	if p1.assetsInBundle then
		for i, v in p1.assetsInBundle do
			table.insert(t, {
				id = tostring(v.id),
				assetType = tostring(v.assetType),
				isIncluded = v.isIncluded,
				meta = v.meta,
				name = v.name
			})
		end
	end
	return {
		id = p1.bundleId,
		name = p1.name,
		description = p1.description,
		itemType = itemTypeEnum.Bundle,
		itemSubType = p1.bundleType,
		creator = {
			creatorId = p1.creatorId or "",
			creatorName = p1.creatorName or "",
			creatorHasVerifiedBadge = p1.creatorHasVerifiedBadge or false
		},
		saleLocationType = p1.saleLocationType or salesLocationType.Invalid,
		itemRestrictions = p1.itemRestrictions or {},
		priceInRobux = p1.price,
		noPriceStatus = p1.noPriceStatus,
		catalogPriceStatus = p1.catalogPriceStatus,
		isOwned = p1.owned,
		hasResellers = p1.hasResellers,
		isOffSale = p1.isOffSale,
		collectibleItemId = p1.collectibleItemId,
		collectibleItemDetails = {
			quantityLimitPerUser = p1.collectibleQuantityLimitPerUser,
			collectibleLowestAvailableResaleProductId = p1.collectibleLowestAvailableResaleProductId,
			collectibleLowestAvailableResaleItemInstanceId = p1.collectibleLowestAvailableResaleItemInstanceId,
			unitsAvailableForConsumption = p1.remaining,
			hasResellers = p1.hasResellers,
			lowestResalePrice = p1.collectibleLowestResalePrice,
			resellableCount = p1.resellableCount or var1,
			totalQuantity = p1.collectibleTotalQuantity or 0
		},
		assetsInBundle = t,
		favoritesDetails = {
			isFavorited = p1.isFavorited,
			numFavorites = p1.numFavorites
		}
	}
end