local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local Parent = AvatarExperienceInspectAndBuy.Parent
local _ = require(AvatarExperienceInspectAndBuy.Types)
local _ = require(Parent.AXCommon)
local _ = require(Parent.AvatarExperienceRodux)
local TutilsModule = require(Parent.tutils)
local ItemTypeEnum = require(Parent.AvatarExperienceModel).Enums.ItemTypeEnum

local function buildCollectibleItemDetails(p1, CollectibleItemDetails) --[[ Line: 19 ]]
	-- upvalues: TutilsModule (copy)
	local Collectibles = p1.Collectibles
	local CollectibleItemId = CollectibleItemDetails.collectibleItemId
	local CollectiblesItem = if Collectibles and CollectibleItemId and Collectibles.CollectiblesItemInfo then Collectibles.CollectiblesItemInfo[CollectibleItemId] else nil
	local CollectiblesResellableInstance = if Collectibles and CollectibleItemId and Collectibles.CollectiblesResellableInstances then Collectibles.CollectiblesResellableInstances[CollectibleItemId] else nil
	local LowestAvailableResaleProductId = if CollectiblesItem then CollectiblesItem.lowestAvailableResaleProductId else nil
	
	return {
		quantityLimitPerUser = if CollectiblesItem then CollectiblesItem.quantityLimitPerUser else nil,
		resellableCount = if CollectiblesResellableInstance then TutilsModule.fieldCount(CollectiblesResellableInstance) else 0,
		collectibleProductId = if CollectiblesItem then CollectiblesItem.collectibleProductId else nil,
		collectibleLowestAvailableResaleProductId = LowestAvailableResaleProductId,
		collectibleLowestAvailableResaleItemInstanceId = if CollectiblesItem then CollectiblesItem.lowestAvailableResaleItemInstanceId else nil,
		unitsAvailableForConsumption = (if CollectiblesItem then CollectiblesItem.unitsAvailableForConsumption else nil) or CollectibleItemDetails.numberRobloxHasAvailable,
		hasResellers = CollectibleItemDetails.hasResellers or ((if CollectiblesItem then CollectiblesItem.hasResellers else nil) or LowestAvailableResaleProductId ~= nil and LowestAvailableResaleProductId ~= ""),
		lowestResalePrice = CollectibleItemDetails.lowestResalePrice,
		totalQuantity = CollectibleItemDetails.totalQuantity,
		experiences = CollectibleItemDetails.experiences or (if CollectiblesItem then CollectiblesItem.experiences else nil)
	}
end

local function buildAssetsInBundle(Items) --[[ Line: 69 ]]
	if not Items then
		return nil
	end
	local List = {}
	
	for _, item in Items do
		table.insert(List, {
			id = tostring(item.id),
			assetType = if item.assetType == nil then nil else tostring(item.assetType)
		})
	end
	return List
end

return function(p1, Id, Bundle) --[[ Line: 93 | Named "buildItemDataFromAXRodux" ]]
	-- upvalues: ItemTypeEnum (copy), buildCollectibleItemDetails (copy), buildAssetsInBundle (copy)
	if not p1 then
		return nil
	end
	local AssetInfo = nil
	
	if Bundle == ItemTypeEnum.Asset then
		AssetInfo = if p1.AssetInfos then p1.AssetInfos[Id] else nil
	elseif Bundle == ItemTypeEnum.Bundle then
		AssetInfo = if p1.BundleInfos then p1.BundleInfos[Id] else nil
	end
	if AssetInfo then
		local Creator = AssetInfo.creator
		
		return {
			id = Id,
			name = AssetInfo.name,
			description = AssetInfo.description,
			itemType = Bundle,
			itemSubType = if Bundle == ItemTypeEnum.Bundle then AssetInfo.bundleType else AssetInfo.assetType,
			creator = {
				creatorId = (if Creator then Creator.id else nil) or "",
				creatorName = (if Creator then Creator.name else nil) or (AssetInfo.creatorName or ""),
				creatorHasVerifiedBadge = (if Creator then Creator.hasVerifiedBadge else nil) or false
			},
			creatingUniverseId = AssetInfo.creatingUniverseId,
			saleLocationType = AssetInfo.saleLocationType,
			itemRestrictions = AssetInfo.itemRestrictions or {},
			priceInRobux = AssetInfo.priceInRobux,
			discountInformation = AssetInfo.discountInformation,
			catalogPriceStatus = AssetInfo.priceStatus,
			isOwned = AssetInfo.isOwned,
			isOffSale = AssetInfo.isOffSale,
			collectibleItemId = AssetInfo.collectibleItemId,
			collectibleItemDetails = buildCollectibleItemDetails(p1, AssetInfo),
			assetsInBundle = if Bundle == ItemTypeEnum.Bundle then buildAssetsInBundle(AssetInfo.items) else nil,
			favoritesDetails = { numFavorites = AssetInfo.favoriteCount },
			timedOptions = AssetInfo.timedOptions,
			expirationTime = AssetInfo.expirationTime
		}
	else
		return nil
	end
end