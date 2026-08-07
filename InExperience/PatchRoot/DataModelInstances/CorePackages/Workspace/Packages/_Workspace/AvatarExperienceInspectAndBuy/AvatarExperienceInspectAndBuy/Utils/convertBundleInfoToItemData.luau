local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local parent = avatarExperienceInspectAndBuy.Parent
local _ = require(avatarExperienceInspectAndBuy.Types)
local AXCommonModule = require(avatarExperienceInspectAndBuy.Parent.AXCommon)
local itemTypeEnum = AXCommonModule.Enums.ItemTypeEnum
local salesLocationType = AXCommonModule.Enums.SalesLocationType
local tutilsModule = require(parent.tutils)

return function(p0, p1) --[[ line: 20 ]]
	-- upvalues: tutilsModule (ref), itemTypeEnum (ref), salesLocationType (ref)
	local var3 = if p1 then tutilsModule.fieldCount(p1) else 0
	local t = {}
	
	if p0.assetsInBundle then
		for i, v in p0.assetsInBundle do
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
		id = p0.bundleId,
		name = p0.name,
		description = p0.description,
		itemType = itemTypeEnum.Bundle,
		itemSubType = p0.bundleType,
		creator = {
			creatorId = p0.creatorId or "",
			creatorName = p0.creatorName or "",
			creatorHasVerifiedBadge = p0.creatorHasVerifiedBadge or false
		},
		saleLocationType = p0.saleLocationType or salesLocationType.Invalid,
		itemRestrictions = p0.itemRestrictions or {},
		priceInRobux = p0.price,
		noPriceStatus = p0.noPriceStatus,
		catalogPriceStatus = p0.catalogPriceStatus,
		isOwned = p0.owned,
		hasResellers = p0.hasResellers,
		isOffSale = p0.isOffSale,
		collectibleItemId = p0.collectibleItemId,
		collectibleItemDetails = {
			quantityLimitPerUser = p0.collectibleQuantityLimitPerUser,
			collectibleLowestAvailableResaleProductId = p0.collectibleLowestAvailableResaleProductId,
			collectibleLowestAvailableResaleItemInstanceId = p0.collectibleLowestAvailableResaleItemInstanceId,
			unitsAvailableForConsumption = p0.remaining,
			hasResellers = p0.hasResellers,
			lowestResalePrice = p0.collectibleLowestResalePrice,
			resellableCount = p0.resellableCount or var3,
			totalQuantity = p0.collectibleTotalQuantity or 0
		},
		assetsInBundle = t,
		favoritesDetails = {
			isFavorited = p0.isFavorited,
			numFavorites = p0.numFavorites
		}
	}
end