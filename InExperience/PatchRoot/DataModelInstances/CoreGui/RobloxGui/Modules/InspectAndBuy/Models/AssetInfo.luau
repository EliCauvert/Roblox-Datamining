local corePackagesService = game:GetService("CorePackages")
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local dashModule = require(corePackagesService.Packages.Dash)
local fFlagAXEnableIaBTimedOptionsBulkPurchase = require(corePackagesService.Workspace.Packages.AvatarExperienceFlags).FFlagAXEnableIaBTimedOptionsBulkPurchase
local parent = script.Parent.Parent
local mockIdModule = require(parent.MockId)
local constantsModule = require(parent.Constants)
local _ = require(corePackagesService.Workspace.Packages.AvatarExperienceInspectAndBuy)
local itemRestrictions = require(corePackagesService.Workspace.Packages.AvatarExperienceCommon).Enums.ItemRestrictions
local getFFlagIBEnableCollectiblesSystemSupportModule = require(parent.Flags.GetFFlagIBEnableCollectiblesSystemSupport)
local fFlagAXParseAdditionalItemDetailsFromCatalogModule = require(parent.Flags.FFlagAXParseAdditionalItemDetailsFromCatalog)
local fFlagIBV2Attribution = sharedFlagsModule.FFlagIBV2Attribution
local t = {
	new = function() --[[ line: 63 ]]
		return {}
	end
}

local _ = function(p0) --[[ line: 59 ]]
	return math.round(p0 * 100) / 100
end

function t.mock() --[[ line: 69 ]]
	-- upvalues: t (ref), mockIdModule (ref), getFFlagIBEnableCollectiblesSystemSupportModule (ref)
	local var8 = t.new()
	var8.name = ""
	var8.assetId = mockIdModule()
	var8.assetTypeId = ""
	var8.creatorId = ""
	var8.creatorName = ""
	var8.creatorHasVerifiedBadge = false
	var8.owned = false
	var8.isForSale = false
	var8.description = ""
	var8.price = ""
	var8.productId = ""
	var8.isLimited = false
	var8.isLimitedUnique = if getFFlagIBEnableCollectiblesSystemSupportModule() then false else nil
	var8.collectibleIsLimited = if getFFlagIBEnableCollectiblesSystemSupportModule() then false else nil
	var8.bundlesAssetIsIn = {}
	var8.parentBundleId = nil
	var8.numFavorites = 0
	var8.minimumMembershipLevel = 0
	var8.collectibleItemId = ""
	var8.collectibleProductId = ""
	var8.collectibleLowestResalePrice = 0
	var8.collectibleLowestAvailableResaleProductId = ""
	var8.collectibleLowestAvailableResaleItemInstanceId = ""
	var8.collectibleQuantityLimitPerUser = 0
	var8.remaining = 0
	var8.creatingUniverseId = nil
	
	return var8
end

function t.fromBulkPurchaseResult(p1, p2) --[[ line: 111 ]]
	-- upvalues: t (ref), itemRestrictions (ref)
	local var9 = t.new()
	local var10 = if p2 and p2.itemRestrictions then p2.itemRestrictions else {}
	var9.resellableCount = if p2 and p2.resellableCount then p2.resellableCount else 0
	
	if p1.status == Enum.MarketplaceItemPurchaseStatus.Success and p1.type == Enum.MarketplaceProductType.AvatarAsset then
		var9.owned = true
		
		if var10[itemRestrictions.Collectible] or var10[itemRestrictions.Limited] or var10[itemRestrictions.LimitedUnique] then
			var9.resellableCount += 1
		end
	end
	return var9
end

function t.fromAvatarPreviewItem(p3) --[[ line: 133 ]]
	-- upvalues: t (ref)
	local var11 = t.new()
	var11.name = p3.name
	var11.description = p3.description
	var11.price = p3.priceInRobux
	var11.productId = tostring(p3.productId)
	var11.collectibleItemId = p3.collectibleItemId
	var11.owned = p3.quantityOwned > 0
	var11.resellableCount = p3.quantityOwned
	var11.creatorId = tostring(p3.creator.id)
	var11.creatorName = p3.creator.name
	var11.creatorHasVerifiedBadge = p3.creator.hasVerifiedBadge
	var11.assetId = tostring(p3.id)
	var11.assetTypeId = tostring(p3.assetType)
	var11.productId = tostring(p3.productId)
	var11.isForSale = p3.isPurchasable
	var11.noPriceStatus = p3.noPriceStatus
	var11.meta = p3.meta
	
	if p3.itemRestrictions then
		local t_1 = {}
		
		for i, v in p3.itemRestrictions do
			t_1[v] = true
		end
		var11.itemRestrictions = t_1
	end
	return var11
end

function t.fromGetProductInfo(p4) --[[ line: 164 ]]
	-- upvalues: t (ref), constantsModule (ref), getFFlagIBEnableCollectiblesSystemSupportModule (ref)
	local var13 = t.new()
	var13.name = p4.Name
	var13.description = p4.Description
	var13.price = p4.PriceInRobux
	var13.productType = p4.ProductType
	var13.remaining = p4.Remaining
	var13.creatorId = tostring(p4.Creator.Id)
	var13.creatorName = p4.Creator.Name
	var13.assetId = tostring(p4.AssetId)
	var13.assetTypeId = tostring(p4.AssetTypeId)
	var13.productId = tostring(p4.ProductId)
	var13.isForSale = p4.IsForSale
	var13.canBeSoldInThisGame = p4.CanBeSoldInThisGame
	var13.saleLocation = p4.SaleLocation
	var13.remaining = p4.Remaining or 0
	
	if var13.productType == constantsModule.ProductType.CollectibleItem then
		var13.collectibleItemId = p4.CollectibleItemId or ""
		var13.collectibleProductId = p4.CollectibleProductId or ""
		
		if p4.CollectiblesItemDetails then
			var13.collectibleLowestResalePrice = p4.CollectiblesItemDetails.CollectibleLowestResalePrice or 0
			var13.collectibleLowestAvailableResaleProductId = p4.CollectiblesItemDetails.CollectibleLowestAvailableResaleProductId or ""
			var13.collectibleLowestAvailableResaleItemInstanceId = p4.CollectiblesItemDetails.CollectibleLowestAvailableResaleItemInstanceId or ""
			var13.collectibleQuantityLimitPerUser = p4.CollectiblesItemDetails.CollectibleQuantityLimitPerUser or 0
			var13.collectibleIsLimited = p4.CollectiblesItemDetails.IsLimited
		end
	end
	var13.creatorHasVerifiedBadge = p4.Creator.HasVerifiedBadge
	
	if getFFlagIBEnableCollectiblesSystemSupportModule() then
		var13.isLimited = p4.IsLimited
		var13.isLimitedUnique = p4.IsLimitedUnique
		
		return var13
	end
	var13.isLimited = p4.IsLimited or p4.IsLimitedUnique
	
	return var13
end

function t.fromHumanoidDescription(p5) --[[ line: 209 ]]
	-- upvalues: t (ref)
	local var14 = t.new()
	var14.assetId = tostring(p5)
	
	return var14
end

function t.fromHumanoidDescriptionAccessory(p6) --[[ line: 217 ]]
	-- upvalues: t (ref)
	local var15 = t.new()
	var15.assetId = tostring(p6.AssetId)
	var15.meta = {}
	var15.meta.position = {
		x = math.round(p6.Position.X * 100) / 100,
		y = math.round(p6.Position.Y * 100) / 100,
		z = math.round(p6.Position.Z * 100) / 100
	}
	var15.meta.rotation = {
		x = math.round(p6.Rotation.X * 100) / 100,
		y = math.round(p6.Rotation.Y * 100) / 100,
		z = math.round(p6.Rotation.Z * 100) / 100
	}
	var15.meta.scale = {
		x = math.round(p6.Scale.X * 100) / 100,
		y = math.round(p6.Scale.Y * 100) / 100,
		z = math.round(p6.Scale.Z * 100) / 100
	}
	
	if p6.IsLayered then
		var15.meta.order = p6.Order
	end
	return var15
end

function t.fromGetAssetBundles(value, p7) --[[ line: 247 ]]
	-- upvalues: t (ref)
	local var16 = t.new()
	var16.assetId = tostring(value)
	var16.bundlesAssetIsIn = p7
	
	return var16
end

function t.fromGetFavoriteForAsset(value, p8) --[[ line: 257 ]]
	-- upvalues: t (ref)
	local var17 = t.new()
	var17.assetId = tostring(value)
	var17.isFavorited = p8
	
	return var17
end

function t.fromBundleInfo(p9, p10) --[[ line: 264 ]]
	-- upvalues: t (ref), constantsModule (ref)
	local var18 = t.new()
	var18.assetId = tostring(p9)
	var18.parentBundleId = p10.bundleId
	var18.bundlesAssetIsIn = { p10.bundleId }
	var18.collectibleItemId = p10.collectibleItemId
	var18.collectibleProductId = p10.collectibleProductId
	var18.collectibleLowestResalePrice = p10.collectibleLowestResalePrice
	var18.collectibleLowestAvailableResaleProductId = p10.collectibleLowestAvailableResaleProductId
	var18.collectibleLowestAvailableResaleItemInstanceId = p10.collectibleLowestAvailableResaleItemInstanceId
	var18.collectibleQuantityLimitPerUser = p10.collectibleQuantityLimitPerUser
	var18.collectibleIsLimited = p10.collectibleIsLimited
	var18.isForSale = p10.isForSale
	var18.remaining = p10.remaining
	var18.owned = p10.owned
	
	if not var18.collectibleIsLimited then
		var18.isForSale = var18.isForSale and not var18.owned
	end
	var18.description = p10.description or ""
	var18.productType = constantsModule.ProductType.CollectibleItem
	
	if p10.price then
		var18.price = p10.price
	end
	return var18
end

function t.fromGetAssetFavoriteCount(value, p11) --[[ line: 306 ]]
	-- upvalues: t (ref)
	local var19 = t.new()
	var19.assetId = tostring(value)
	var19.numFavorites = p11
	
	return var19
end

function t.fromGetEconomyProductInfo(p12, p13, p14, p15, p16) --[[ line: 315 ]]
	-- upvalues: t (ref)
	local var20 = t.new()
	var20.assetId = tostring(p12.assetId)
	var20.owned = p13
	
	if p14 then
		var20.price = p14
	end
	var20.isForSale = p15
	var20.premiumPricing = p16
	
	return var20
end

function t.fromGetItemDetailsV2(p17) --[[ line: 329 ]]
	-- upvalues: t (ref), fFlagAXEnableIaBTimedOptionsBulkPurchase (ref)
	local var21 = t.new()
	var21.assetId = tostring(p17.id)
	var21.isForSale = p17.isPurchasable
	var21.price = p17.price or 0
	var21.hasResellers = p17.hasResellers
	var21.collectibleItemId = p17.collectibleItemId
	local t_1 = {}
	
	if p17.itemRestrictions then
		for i, v in p17.itemRestrictions do
			t_1[v] = true
		end
		var21.itemRestrictions = t_1
	end
	var21.saleLocationType = p17.saleLocationType
	var21.remaining = p17.unitsAvailableForConsumption
	var21.collectibleTotalQuantity = p17.totalQuantity
	var21.collectibleLowestResalePrice = p17.lowestResalePrice
	var21.isOffSale = p17.isOffSale
	var21.saleLocationType = p17.saleLocationType
	var21.numFavorites = p17.favoriteCount
	var21.catalogPriceStatus = p17.priceStatus
	
	if fFlagAXEnableIaBTimedOptionsBulkPurchase then
		var21.timedOptions = p17.timedOptions
	end
	return var21
end

function t.fromGetItemDetails(p18) --[[ line: 362 ]]
	-- upvalues: t (ref), fFlagAXParseAdditionalItemDetailsFromCatalogModule (ref), fFlagIBV2Attribution (ref)
	local var23 = t.new()
	var23.assetId = tostring(p18.Id)
	var23.owned = p18.Owned
	var23.isForSale = p18.IsPurchasable
	var23.price = p18.Price or 0
	var23.hasResellers = p18.HasResellers
	var23.collectibleItemId = p18.CollectibleItemId
	
	if fFlagAXParseAdditionalItemDetailsFromCatalogModule then
		local t_1 = {}
		
		if p18.ItemRestrictions then
			for i, v in p18.ItemRestrictions do
				t_1[v] = true
			end
			var23.itemRestrictions = t_1
		end
		var23.saleLocationType = p18.SaleLocationType
		var23.remaining = p18.UnitsAvailableForConsumption
		var23.collectibleTotalQuantity = p18.TotalQuantity
		var23.collectibleLowestResalePrice = p18.LowestResalePrice
		var23.isOffSale = p18.IsOffSale
		var23.saleLocationType = p18.SaleLocationType
		var23.numFavorites = p18.FavoriteCount
		var23.catalogPriceStatus = p18.PriceStatus
	end
	if fFlagIBV2Attribution then
		var23.creatingUniverseId = p18.CreatingUniverseId
	end
	return var23
end

function t.fromPurchaseSuccess(p19) --[[ line: 398 ]]
	-- upvalues: t (ref)
	local var25 = t.new()
	var25.assetId = tostring(p19)
	var25.owned = true
	
	return var25
end

function t.fromGetVersionInfo(p20, p21) --[[ line: 411 ]]
	-- upvalues: t (ref)
	local var26 = t.new()
	var26.assetId = tostring(p20)
	var26.creatingUniverseId = if p21.creatingUniverseId then tostring(p21.creatingUniverseId) else nil
	
	return var26
end

function t.getSaleDetailsForCollectibles(p22) --[[ line: 422 ]]
	-- upvalues: dashModule (ref), constantsModule (ref)
	local var27 = dashModule.joinDeep({}, p22)
	local saleLocation = p22.saleLocation
	
	if p22.productType == constantsModule.ProductType.CollectibleItem then
		local var28 = saleLocation and saleLocation.SaleLocationType ~= constantsModule.SaleLocationType.ShopOnly
		local var29 = saleLocation and saleLocation.SaleLocationType ~= constantsModule.SaleLocationType.ShopAndExperiencesById
		local var30 = saleLocation and (saleLocation.SaleLocationType == constantsModule.SaleLocationType.ShopAndExperiencesById and (type(saleLocation.UniverseIds) == "table" and table.find(saleLocation.UniverseIds, game.GameId) ~= nil))
		local var31 = saleLocation and saleLocation.SaleLocationType ~= constantsModule.SaleLocationType.ExperiencesDevApiOnly
		local isForSale = p22.isForSale
		
		if isForSale then
			isForSale = p22.canBeSoldInThisGame
			
			if isForSale then
				isForSale = var28
				
				if isForSale and not var29 then
					isForSale = var30 and var31
				end
			end
		end
		var27.isForSale = isForSale
		
		if p22.collectibleIsLimited then
			return var27
		else
			var27.isForSale = var27.isForSale and not var27.owned
			
			return var27
		end
	else
		var27.isForSale = p22.isForSale and p22.canBeSoldInThisGame
		
		if p22.canBeSoldInThisGame == nil then
			var27.isForSale = p22.isForSale
		end
	end
end

return t