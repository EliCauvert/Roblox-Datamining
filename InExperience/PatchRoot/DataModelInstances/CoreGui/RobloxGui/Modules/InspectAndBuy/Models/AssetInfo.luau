local corePackagesService = game:GetService("CorePackages")
local dashModule = require(corePackagesService.Packages.Dash)
local fFlagAXEnableIaBTimedOptionsBulkPurchase = require(corePackagesService.Workspace.Packages.AvatarExperienceFlags).FFlagAXEnableIaBTimedOptionsBulkPurchase
local parent = script.Parent.Parent
local mockIdModule = require(parent.MockId)
local constantsModule = require(parent.Constants)
local _ = require(corePackagesService.Workspace.Packages.AvatarExperienceInspectAndBuy)
local itemRestrictions = require(corePackagesService.Workspace.Packages.AvatarExperienceCommon).Enums.ItemRestrictions
local getFFlagIBEnableCollectiblesSystemSupportModule = require(parent.Flags.GetFFlagIBEnableCollectiblesSystemSupport)
local t = {
	new = function() --[[ line: 57 ]]
		return {}
	end
}

local _ = function(p0) --[[ line: 53 ]]
	return math.round(p0 * 100) / 100
end

function t.mock() --[[ line: 63 ]]
	-- upvalues: t (ref), mockIdModule (ref), getFFlagIBEnableCollectiblesSystemSupportModule (ref)
	local var6 = t.new()
	var6.name = ""
	var6.assetId = mockIdModule()
	var6.assetTypeId = ""
	var6.creatorId = ""
	var6.creatorName = ""
	var6.creatorHasVerifiedBadge = false
	var6.owned = false
	var6.isForSale = false
	var6.description = ""
	var6.price = ""
	var6.productId = ""
	var6.isLimited = false
	var6.isLimitedUnique = if getFFlagIBEnableCollectiblesSystemSupportModule() then false else nil
	var6.collectibleIsLimited = if getFFlagIBEnableCollectiblesSystemSupportModule() then false else nil
	var6.bundlesAssetIsIn = {}
	var6.parentBundleId = nil
	var6.numFavorites = 0
	var6.minimumMembershipLevel = 0
	var6.collectibleItemId = ""
	var6.collectibleProductId = ""
	var6.collectibleLowestResalePrice = 0
	var6.collectibleLowestAvailableResaleProductId = ""
	var6.collectibleLowestAvailableResaleItemInstanceId = ""
	var6.collectibleQuantityLimitPerUser = 0
	var6.remaining = 0
	var6.creatingUniverseId = nil
	
	return var6
end

function t.fromBulkPurchaseResult(p1, p2) --[[ line: 105 ]]
	-- upvalues: t (ref), itemRestrictions (ref)
	local var7 = t.new()
	local var8 = if p2 and p2.itemRestrictions then p2.itemRestrictions else {}
	var7.resellableCount = if p2 and p2.resellableCount then p2.resellableCount else 0
	
	if p1.status == Enum.MarketplaceItemPurchaseStatus.Success and p1.type == Enum.MarketplaceProductType.AvatarAsset then
		var7.owned = true
		
		if var8[itemRestrictions.Collectible] or var8[itemRestrictions.Limited] or var8[itemRestrictions.LimitedUnique] then
			var7.resellableCount += 1
		end
	end
	return var7
end

function t.fromAvatarPreviewItem(p3) --[[ line: 127 ]]
	-- upvalues: t (ref)
	local var9 = t.new()
	var9.name = p3.name
	var9.description = p3.description
	var9.price = p3.priceInRobux
	var9.productId = tostring(p3.productId)
	var9.collectibleItemId = p3.collectibleItemId
	var9.owned = p3.quantityOwned > 0
	var9.resellableCount = p3.quantityOwned
	var9.creatorId = tostring(p3.creator.id)
	var9.creatorName = p3.creator.name
	var9.creatorHasVerifiedBadge = p3.creator.hasVerifiedBadge
	var9.assetId = tostring(p3.id)
	var9.assetTypeId = tostring(p3.assetType)
	var9.productId = tostring(p3.productId)
	var9.isForSale = p3.isPurchasable
	var9.noPriceStatus = p3.noPriceStatus
	var9.meta = p3.meta
	
	if p3.itemRestrictions then
		local t_1 = {}
		
		for i, v in p3.itemRestrictions do
			t_1[v] = true
		end
		var9.itemRestrictions = t_1
	end
	return var9
end

function t.fromGetProductInfo(p4) --[[ line: 158 ]]
	-- upvalues: t (ref), constantsModule (ref), getFFlagIBEnableCollectiblesSystemSupportModule (ref)
	local var11 = t.new()
	var11.name = p4.Name
	var11.description = p4.Description
	var11.price = p4.PriceInRobux
	var11.productType = p4.ProductType
	var11.remaining = p4.Remaining
	var11.creatorId = tostring(p4.Creator.Id)
	var11.creatorName = p4.Creator.Name
	var11.assetId = tostring(p4.AssetId)
	var11.assetTypeId = tostring(p4.AssetTypeId)
	var11.productId = tostring(p4.ProductId)
	var11.isForSale = p4.IsForSale
	var11.canBeSoldInThisGame = p4.CanBeSoldInThisGame
	var11.saleLocation = p4.SaleLocation
	var11.remaining = p4.Remaining or 0
	
	if var11.productType == constantsModule.ProductType.CollectibleItem then
		var11.collectibleItemId = p4.CollectibleItemId or ""
		var11.collectibleProductId = p4.CollectibleProductId or ""
		
		if p4.CollectiblesItemDetails then
			var11.collectibleLowestResalePrice = p4.CollectiblesItemDetails.CollectibleLowestResalePrice or 0
			var11.collectibleLowestAvailableResaleProductId = p4.CollectiblesItemDetails.CollectibleLowestAvailableResaleProductId or ""
			var11.collectibleLowestAvailableResaleItemInstanceId = p4.CollectiblesItemDetails.CollectibleLowestAvailableResaleItemInstanceId or ""
			var11.collectibleQuantityLimitPerUser = p4.CollectiblesItemDetails.CollectibleQuantityLimitPerUser or 0
			var11.collectibleIsLimited = p4.CollectiblesItemDetails.IsLimited
		end
	end
	var11.creatorHasVerifiedBadge = p4.Creator.HasVerifiedBadge
	
	if getFFlagIBEnableCollectiblesSystemSupportModule() then
		var11.isLimited = p4.IsLimited
		var11.isLimitedUnique = p4.IsLimitedUnique
		
		return var11
	end
	var11.isLimited = p4.IsLimited or p4.IsLimitedUnique
	
	return var11
end

function t.fromHumanoidDescription(p5) --[[ line: 203 ]]
	-- upvalues: t (ref)
	local var12 = t.new()
	var12.assetId = tostring(p5)
	
	return var12
end

function t.fromHumanoidDescriptionAccessory(p6) --[[ line: 211 ]]
	-- upvalues: t (ref)
	local var13 = t.new()
	var13.assetId = tostring(p6.AssetId)
	var13.meta = {}
	var13.meta.position = {
		x = math.round(p6.Position.X * 100) / 100,
		y = math.round(p6.Position.Y * 100) / 100,
		z = math.round(p6.Position.Z * 100) / 100
	}
	var13.meta.rotation = {
		x = math.round(p6.Rotation.X * 100) / 100,
		y = math.round(p6.Rotation.Y * 100) / 100,
		z = math.round(p6.Rotation.Z * 100) / 100
	}
	var13.meta.scale = {
		x = math.round(p6.Scale.X * 100) / 100,
		y = math.round(p6.Scale.Y * 100) / 100,
		z = math.round(p6.Scale.Z * 100) / 100
	}
	
	if p6.IsLayered then
		var13.meta.order = p6.Order
	end
	return var13
end

function t.fromGetAssetBundles(value, p7) --[[ line: 241 ]]
	-- upvalues: t (ref)
	local var14 = t.new()
	var14.assetId = tostring(value)
	var14.bundlesAssetIsIn = p7
	
	return var14
end

function t.fromGetFavoriteForAsset(value, p8) --[[ line: 251 ]]
	-- upvalues: t (ref)
	local var15 = t.new()
	var15.assetId = tostring(value)
	var15.isFavorited = p8
	
	return var15
end

function t.fromBundleInfo(p9, p10) --[[ line: 258 ]]
	-- upvalues: t (ref), constantsModule (ref)
	local var16 = t.new()
	var16.assetId = tostring(p9)
	var16.parentBundleId = p10.bundleId
	var16.bundlesAssetIsIn = { p10.bundleId }
	var16.collectibleItemId = p10.collectibleItemId
	var16.collectibleProductId = p10.collectibleProductId
	var16.collectibleLowestResalePrice = p10.collectibleLowestResalePrice
	var16.collectibleLowestAvailableResaleProductId = p10.collectibleLowestAvailableResaleProductId
	var16.collectibleLowestAvailableResaleItemInstanceId = p10.collectibleLowestAvailableResaleItemInstanceId
	var16.collectibleQuantityLimitPerUser = p10.collectibleQuantityLimitPerUser
	var16.collectibleIsLimited = p10.collectibleIsLimited
	var16.isForSale = p10.isForSale
	var16.remaining = p10.remaining
	var16.owned = p10.owned
	
	if not var16.collectibleIsLimited then
		var16.isForSale = var16.isForSale and not var16.owned
	end
	var16.description = p10.description or ""
	var16.productType = constantsModule.ProductType.CollectibleItem
	
	if p10.price then
		var16.price = p10.price
	end
	return var16
end

function t.fromGetAssetFavoriteCount(value, p11) --[[ line: 300 ]]
	-- upvalues: t (ref)
	local var17 = t.new()
	var17.assetId = tostring(value)
	var17.numFavorites = p11
	
	return var17
end

function t.fromGetEconomyProductInfo(p12, p13, p14, p15, p16) --[[ line: 309 ]]
	-- upvalues: t (ref)
	local var18 = t.new()
	var18.assetId = tostring(p12.assetId)
	var18.owned = p13
	
	if p14 then
		var18.price = p14
	end
	var18.isForSale = p15
	var18.premiumPricing = p16
	
	return var18
end

function t.fromGetItemDetailsV2(p17) --[[ line: 323 ]]
	-- upvalues: t (ref), fFlagAXEnableIaBTimedOptionsBulkPurchase (ref)
	local var19 = t.new()
	var19.assetId = tostring(p17.id)
	var19.isForSale = p17.isPurchasable
	var19.price = p17.price or 0
	var19.hasResellers = p17.hasResellers
	var19.collectibleItemId = p17.collectibleItemId
	local t_1 = {}
	
	if p17.itemRestrictions then
		for i, v in p17.itemRestrictions do
			t_1[v] = true
		end
		var19.itemRestrictions = t_1
	end
	var19.saleLocationType = p17.saleLocationType
	var19.remaining = p17.unitsAvailableForConsumption
	var19.collectibleTotalQuantity = p17.totalQuantity
	var19.collectibleLowestResalePrice = p17.lowestResalePrice
	var19.isOffSale = p17.isOffSale
	var19.saleLocationType = p17.saleLocationType
	var19.numFavorites = p17.favoriteCount
	var19.catalogPriceStatus = p17.priceStatus
	
	if fFlagAXEnableIaBTimedOptionsBulkPurchase then
		var19.timedOptions = p17.timedOptions
	end
	return var19
end

function t.fromGetItemDetails(p18) --[[ line: 356 ]]
	-- upvalues: t (ref)
	local var21 = t.new()
	var21.assetId = tostring(p18.Id)
	var21.owned = p18.Owned
	var21.isForSale = p18.IsPurchasable
	var21.price = p18.Price or 0
	var21.hasResellers = p18.HasResellers
	var21.collectibleItemId = p18.CollectibleItemId
	local t_1 = {}
	
	if p18.ItemRestrictions then
		for i, v in p18.ItemRestrictions do
			t_1[v] = true
		end
		var21.itemRestrictions = t_1
	end
	var21.saleLocationType = p18.SaleLocationType
	var21.remaining = p18.UnitsAvailableForConsumption
	var21.collectibleTotalQuantity = p18.TotalQuantity
	var21.collectibleLowestResalePrice = p18.LowestResalePrice
	var21.isOffSale = p18.IsOffSale
	var21.saleLocationType = p18.SaleLocationType
	var21.numFavorites = p18.FavoriteCount
	var21.catalogPriceStatus = p18.PriceStatus
	var21.creatingUniverseId = p18.CreatingUniverseId
	
	return var21
end

function t.fromPurchaseSuccess(p19) --[[ line: 388 ]]
	-- upvalues: t (ref)
	local var23 = t.new()
	var23.assetId = tostring(p19)
	var23.owned = true
	
	return var23
end

function t.fromGetVersionInfo(p20, p21) --[[ line: 401 ]]
	-- upvalues: t (ref)
	local var24 = t.new()
	var24.assetId = tostring(p20)
	var24.creatingUniverseId = if p21.creatingUniverseId then tostring(p21.creatingUniverseId) else nil
	
	return var24
end

function t.getSaleDetailsForCollectibles(p22) --[[ line: 412 ]]
	-- upvalues: dashModule (ref), constantsModule (ref)
	local var25 = dashModule.joinDeep({}, p22)
	local saleLocation = p22.saleLocation
	
	if p22.productType == constantsModule.ProductType.CollectibleItem then
		local var26 = saleLocation and saleLocation.SaleLocationType ~= constantsModule.SaleLocationType.ShopOnly
		local var27 = saleLocation and saleLocation.SaleLocationType ~= constantsModule.SaleLocationType.ShopAndExperiencesById
		local var28 = saleLocation and (saleLocation.SaleLocationType == constantsModule.SaleLocationType.ShopAndExperiencesById and (type(saleLocation.UniverseIds) == "table" and table.find(saleLocation.UniverseIds, game.GameId) ~= nil))
		local var29 = saleLocation and saleLocation.SaleLocationType ~= constantsModule.SaleLocationType.ExperiencesDevApiOnly
		local isForSale = p22.isForSale
		
		if isForSale then
			isForSale = p22.canBeSoldInThisGame
			
			if isForSale then
				isForSale = var26
				
				if isForSale and not var27 then
					isForSale = var28 and var29
				end
			end
		end
		var25.isForSale = isForSale
		
		if p22.collectibleIsLimited then
			return var25
		else
			var25.isForSale = var25.isForSale and not var25.owned
			
			return var25
		end
	else
		var25.isForSale = p22.isForSale and p22.canBeSoldInThisGame
		
		if p22.canBeSoldInThisGame == nil then
			var25.isForSale = p22.isForSale
		end
	end
end

return t