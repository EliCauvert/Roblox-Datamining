local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local Parent = AvatarExperienceInspectAndBuy.Parent
local _ = require(AvatarExperienceInspectAndBuy.Types)
local ItemTypeEnum = require(AvatarExperienceInspectAndBuy.Parent.AvatarExperienceModel).Enums.ItemTypeEnum
local SalesLocationType = require(AvatarExperienceInspectAndBuy.Parent.AXCommon).Enums.SalesLocationType
local TutilsModule = require(Parent.tutils)
local FFlagAXMarketplaceLicensingItemCards = require(Parent.AvatarExperienceFlags).FFlagAXMarketplaceLicensingItemCards

return function(p1, p2) --[[ Line: 23 ]]
	-- upvalues: TutilsModule (copy), ItemTypeEnum (copy), FFlagAXMarketplaceLicensingItemCards (copy), SalesLocationType (copy)
	local FieldCountResult = if p2 then TutilsModule.fieldCount(p2) else 0
	local AssetsInBundle = {}
	
	if p1.assetsInBundle then
		for _, value in p1.assetsInBundle do
			table.insert(AssetsInBundle, {
				id = tostring(value.id),
				assetType = tostring(value.assetType),
				isIncluded = value.isIncluded,
				meta = value.meta,
				name = value.name
			})
		end
	end
	return {
		id = p1.bundleId,
		name = p1.name,
		description = p1.description,
		itemType = ItemTypeEnum.Bundle,
		itemSubType = p1.bundleType,
		creator = {
			creatorId = p1.creatorId or "",
			creatorName = p1.creatorName or "",
			creatorHasVerifiedBadge = p1.creatorHasVerifiedBadge or false
		},
		itemLicensingInfo = if FFlagAXMarketplaceLicensingItemCards then p1.itemLicensingInfo else nil,
		saleLocationType = p1.saleLocationType or SalesLocationType.Invalid,
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
			resellableCount = p1.resellableCount or FieldCountResult,
			totalQuantity = p1.collectibleTotalQuantity or 0
		},
		assetsInBundle = AssetsInBundle,
		favoritesDetails = {
			isFavorited = p1.isFavorited,
			numFavorites = p1.numFavorites
		}
	}
end