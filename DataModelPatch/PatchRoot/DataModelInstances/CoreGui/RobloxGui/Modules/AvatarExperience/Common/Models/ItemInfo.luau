local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local _ = require(Modules.AvatarExperience.Common.Types)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local TModule = require(CorePackages.Packages.t)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local ItemTileEnums = require(CorePackages.Packages.UIBlox).Tile.ItemTileEnums
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local MemoizeFunction = require(CorePackages.Workspace.Packages.AppCommonLib).memoize
local MemoizeResult = MemoizeFunction(function(List)
	-- upvalues: CatalogConstantsModule (copy), ItemTileEnums (copy)
	if not List then
		return nil, nil
	end
	if #List == 0 then
		return nil, nil
	end
	local t = {}
	
	for _, value in List do
		t[value] = true
	end
	local Alert = nil
	local New = nil
	
	if t[CatalogConstantsModule.ItemStatus.Sale] then
		Alert = ItemTileEnums.StatusStyle.Alert
		New = CatalogConstantsModule.ItemStatusLocale.Sale
		
		return Alert, New
	end
	if t[CatalogConstantsModule.ItemStatus.New] then
		Alert = ItemTileEnums.StatusStyle.Info
		New = CatalogConstantsModule.ItemStatusLocale.New
	end
	return Alert, New
end)
local MemoizeResult1 = MemoizeFunction(function(p1)
	-- upvalues: CatalogConstantsModule (copy)
	return if p1 then if p1[CatalogConstantsModule.ItemRestrictions.Limited] then true elseif p1[CatalogConstantsModule.ItemRestrictions.LimitedUnique] then true else not p1[CatalogConstantsModule.ItemRestrictions.Collectible] and nil else nil
end)
local MemoizeResult2 = MemoizeFunction(function(p1, p2)
	-- upvalues: CatalogConstantsModule (copy)
	local v1 = p2 and p2[CatalogConstantsModule.ItemRestrictions.LimitedUnique]
	local v2 = p2 and p2[CatalogConstantsModule.ItemRestrictions.Collectible]
	
	return p2 and p2[CatalogConstantsModule.ItemRestrictions.Limited] or (v2 or v1 and (p1 and p1 == 0))
end)
local MemoizeResult3 = MemoizeFunction(function(p1, _): boolean
	-- upvalues: CatalogConstantsModule (copy)
	return if p1 then p1[CatalogConstantsModule.ItemRestrictions.Collectible] ~= nil else false
end)

return {
	fromOutfitInfo = MemoizeFunction(function(OutfitInfo)
		-- upvalues: ConstantsModule (copy), UtilsModule (copy)
		local IncludedItems = {}
		
		for _, asset in OutfitInfo.assets do
			for Id, _ in asset do
				table.insert(IncludedItems, { id = Id, type = ConstantsModule.ItemType.Asset })
			end
		end
		return {
			hasPremiumBenefits = false,
			isPremiumExclusive = false,
			itemType = ConstantsModule.ItemType.Outfit,
			itemId = OutfitInfo.outfitId,
			name = OutfitInfo.name,
			isEditable = OutfitInfo.isEditable,
			hasAttribution = if OutfitInfo.creatingUniverseId then true else false,
			updateCounter = OutfitInfo.updateCounter,
			itemSubType = OutfitInfo.outfitType,
			itemIconType = UtilsModule.getItemIconTypeFromOutfit(OutfitInfo),
			includedItems = IncludedItems,
			outfitInfo = OutfitInfo
		}
	end),
	fromAssetInfo = MemoizeFunction(function(AssetInfo)
		-- upvalues: MemoizeResult (copy), MemoizeResult3 (copy), ConstantsModule (copy), MemoizeResult1 (copy), MemoizeResult2 (copy)
		local MemoizeResultResult, MemoizeResultResult2 = MemoizeResult(AssetInfo.itemStatus)
		
		return {
			itemType = ConstantsModule.ItemType.Asset,
			itemId = AssetInfo.id,
			name = AssetInfo.name,
			description = AssetInfo.description,
			isEditable = false,
			itemSubType = AssetInfo.assetType,
			priceInRobux = AssetInfo.priceInRobux,
			priceStatus = AssetInfo.priceStatus,
			productId = AssetInfo.product and AssetInfo.product.id,
			collectibleItemId = AssetInfo.collectibleItemId,
			statusStyle = MemoizeResultResult,
			statusText = MemoizeResultResult2,
			resellerUserAssetIds = AssetInfo.resellerUserAssetIds,
			receivedCatalogData = AssetInfo.receivedCatalogData,
			lowestPrice = AssetInfo.lowestPrice,
			isOwned = AssetInfo.isOwned,
			isTradeable = MemoizeResult1(AssetInfo.itemRestrictions),
			isResellable = MemoizeResult2(AssetInfo.numberRobloxHasAvailable, AssetInfo.itemRestrictions),
			hasAttribution = if AssetInfo.creatingUniverseId then true else false,
			expectedSellerId = AssetInfo.expectedSellerId,
			creator = AssetInfo.creator,
			receivedRecommendedData = AssetInfo.receivedRecommendedData,
			recommendedItemSummaries = AssetInfo.recommendedItemSummaries,
			favoriteCount = AssetInfo.favoriteCount,
			soldCount = AssetInfo.soldCount,
			totalQuantity = AssetInfo.totalQuantity,
			originalPrice = AssetInfo.originalPrice,
			averagePrice = AssetInfo.averagePrice,
			creatingUniverseId = AssetInfo.creatingUniverseId,
			isForRent = AssetInfo.isForRent,
			isPurchasable = AssetInfo.isPurchasable,
			isLimitedCollectible = MemoizeResult3(AssetInfo.itemRestrictions, AssetInfo.collectibleItemId),
			assetInfo = AssetInfo
		}
	end),
	fromBundleInfo = MemoizeFunction(function(BundleInfo)
		-- upvalues: MemoizeResult (copy), MemoizeResult3 (copy), ConstantsModule (copy), MemoizeResult1 (copy), MemoizeResult2 (copy), ItemTileEnums (copy)
		local MemoizeResultResult, MemoizeResultResult2 = MemoizeResult(BundleInfo.itemStatus)
		
		return {
			hasPremiumBenefits = false,
			isPremiumExclusive = false,
			isEditable = false,
			itemType = ConstantsModule.ItemType.Bundle,
			itemId = BundleInfo.id,
			name = BundleInfo.name,
			description = BundleInfo.description,
			itemSubType = BundleInfo.bundleType,
			priceInRobux = BundleInfo.priceInRobux,
			priceStatus = BundleInfo.priceStatus,
			productId = BundleInfo.product and BundleInfo.product.id,
			statusStyle = MemoizeResultResult,
			statusText = MemoizeResultResult2,
			receivedCatalogData = BundleInfo.receivedCatalogData,
			lowestPrice = BundleInfo.lowestPrice,
			isOwned = BundleInfo.isOwned,
			isTradeable = MemoizeResult1(BundleInfo.itemRestrictions),
			isResellable = MemoizeResult2(BundleInfo.numberRobloxHasAvailable, BundleInfo.itemRestrictions),
			itemIconType = ItemTileEnums.ItemIconType.Bundle,
			expectedSellerId = BundleInfo.expectedSellerId,
			creator = BundleInfo.creator,
			receivedRecommendedData = BundleInfo.receivedRecommendedData,
			recommendedItemSummaries = BundleInfo.recommendedItemSummaries,
			favoriteCount = BundleInfo.favoriteCount,
			includedItems = BundleInfo.items,
			isForRent = BundleInfo.isForRent,
			isPurchasable = BundleInfo.isPurchasable,
			collectibleItemId = BundleInfo.collectibleItemId,
			isLimitedCollectible = MemoizeResult3(BundleInfo.itemRestrictions, BundleInfo.collectibleItemId),
			bundleInfo = BundleInfo
		}
	end),
	Validator = TModule.strictInterface({
		itemType = TModule.string,
		itemId = TModule.optional(TModule.string),
		name = TModule.optional(TModule.string),
		description = TModule.optional(TModule.string),
		itemSubType = TModule.optional(TModule.string),
		priceInRobux = TModule.optional(TModule.number),
		priceStatus = TModule.optional(TModule.string),
		productId = TModule.optional(TModule.string),
		collectibleItemId = TModule.optional(TModule.string),
		statusStyle = TModule.optional(TModule.string),
		statusText = TModule.optional(TModule.string),
		resellerUserAssetIds = TModule.optional(TModule.table),
		lowestPrice = TModule.optional(TModule.number),
		premiumPricing = TModule.optional(TModule.table),
		tileRestrictionsMap = TModule.optional(TModule.table),
		updateCounter = TModule.optional(TModule.number),
		itemIconType = TModule.optional(TModule.userdata),
		expectedSellerId = TModule.optional(TModule.string),
		creator = TModule.optional(TModule.table),
		recommendedItemSummaries = TModule.optional(TModule.table),
		favoriteCount = TModule.optional(TModule.number),
		includedItems = TModule.optional(TModule.table),
		soldCount = TModule.optional(TModule.number),
		totalQuantity = TModule.optional(TModule.number),
		originalPrice = TModule.optional(TModule.number),
		averagePrice = TModule.optional(TModule.number),
		creatingUniverseId = TModule.optional(TModule.string),
		hasAttribution = TModule.optional(TModule.boolean),
		hasPremiumBenefits = TModule.optional(TModule.boolean),
		isEditable = TModule.optional(TModule.boolean),
		isForRent = TModule.optional(TModule.boolean),
		isLimitedCollectible = TModule.optional(TModule.boolean),
		isLimitedBundle = TModule.optional(TModule.boolean),
		isOwned = TModule.optional(TModule.boolean),
		isPremiumExclusive = TModule.optional(TModule.boolean),
		isPurchasable = TModule.optional(TModule.boolean),
		isResellable = TModule.optional(TModule.boolean),
		isTradeable = TModule.optional(TModule.boolean),
		receivedCatalogData = TModule.optional(TModule.boolean),
		receivedRecommendedData = TModule.optional(TModule.boolean),
		assetInfo = TModule.optional(TModule.table),
		bundleInfo = TModule.optional(TModule.table),
		outfitInfo = TModule.optional(TModule.table)
	})
}