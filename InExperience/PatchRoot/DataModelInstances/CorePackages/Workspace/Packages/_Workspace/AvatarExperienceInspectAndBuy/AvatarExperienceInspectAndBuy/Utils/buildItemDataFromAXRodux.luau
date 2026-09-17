local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local parent = avatarExperienceInspectAndBuy.Parent
local _ = require(avatarExperienceInspectAndBuy.Types)
local _ = require(parent.AXCommon)
local _ = require(parent.AvatarExperienceRodux)
local tutilsModule = require(parent.tutils)
local itemTypeEnum = require(parent.AvatarExperienceModel).Enums.ItemTypeEnum

local function buildCollectibleItemDetails(p1, p2)
	-- upvalues: tutilsModule (ref)
	local collectibles = p1.Collectibles
	local collectibleItemId = p2.collectibleItemId
	local var1 = if collectibles and collectibleItemId and collectibles.CollectiblesItemInfo then collectibles.CollectiblesItemInfo[collectibleItemId] else nil
	local var2 = if collectibles and collectibleItemId and collectibles.CollectiblesResellableInstances then collectibles.CollectiblesResellableInstances[collectibleItemId] else nil
	local var3 = if var1 then var1.lowestAvailableResaleProductId else nil
	local t = {
		quantityLimitPerUser = if var1 then var1.quantityLimitPerUser else nil,
		resellableCount = if var2 then tutilsModule.fieldCount(var2) else 0,
		collectibleProductId = if var1 then var1.collectibleProductId else nil,
		collectibleLowestAvailableResaleProductId = var3,
		collectibleLowestAvailableResaleItemInstanceId = if var1 then var1.lowestAvailableResaleItemInstanceId else nil,
		unitsAvailableForConsumption = (if var1 then var1.unitsAvailableForConsumption else nil) or p2.numberRobloxHasAvailable
	}
	local hasResellers = p2.hasResellers
	
	if not hasResellers then
		hasResellers = if var1 then var1.hasResellers else nil
		
		if not hasResellers and var3 ~= nil then
			hasResellers = var3 ~= ""
		end
	end
	t.hasResellers = hasResellers
	t.lowestResalePrice = p2.lowestResalePrice
	t.totalQuantity = p2.totalQuantity
	t.experiences = p2.experiences or (if var1 then var1.experiences else nil)
	
	return t
end

local function buildAssetsInBundle(value)
	if not value then
		return nil
	end
	local t = {}
	
	for i, v in value do
		table.insert(t, {
			id = tostring(v.id),
			assetType = if v.assetType ~= nil then nil else tostring(v.assetType)
		})
	end
	return t
end

return function(a, b, p1)
	-- upvalues: itemTypeEnum (ref), buildCollectibleItemDetails (ref), buildAssetsInBundle (ref)
	if not a then
		return nil
	end
	local var1 = nil
	
	if p1 == itemTypeEnum.Asset then
		var1 = if a.AssetInfos then a.AssetInfos[b] else nil
	elseif p1 == itemTypeEnum.Bundle then
		var1 = if a.BundleInfos then a.BundleInfos[b] else nil
	end
	if var1 then
		local creator = var1.creator
		
		return {
			id = b,
			name = var1.name,
			description = var1.description,
			itemType = p1,
			itemSubType = if p1 == itemTypeEnum.Bundle then var1.bundleType else var1.assetType,
			creator = {
				creatorId = (if creator then creator.id else nil) or "",
				creatorName = (if creator then creator.name else nil) or (var1.creatorName or ""),
				creatorHasVerifiedBadge = (if creator then creator.hasVerifiedBadge else nil) or false
			},
			creatingUniverseId = var1.creatingUniverseId,
			saleLocationType = var1.saleLocationType,
			itemRestrictions = var1.itemRestrictions or {},
			priceInRobux = var1.priceInRobux,
			discountInformation = var1.discountInformation,
			catalogPriceStatus = var1.priceStatus,
			isOwned = var1.isOwned,
			isOffSale = var1.isOffSale,
			collectibleItemId = var1.collectibleItemId,
			collectibleItemDetails = buildCollectibleItemDetails(a, var1),
			assetsInBundle = if p1 == itemTypeEnum.Bundle then buildAssetsInBundle(var1.items) else nil,
			favoritesDetails = { numFavorites = var1.favoriteCount },
			timedOptions = var1.timedOptions,
			expirationTime = var1.expirationTime
		}
	end
	return nil
end