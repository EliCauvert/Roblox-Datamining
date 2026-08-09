local corePackagesService = game:GetService("CorePackages")
local dashModule = require(corePackagesService.Packages.Dash)
local parent = script.Parent.Parent
local constantsModule = require(parent.Constants)
local _ = require(corePackagesService.Workspace.Packages.AvatarExperienceInspectAndBuy)
local itemRestrictions = require(corePackagesService.Workspace.Packages.AvatarExperienceCommon).Enums.ItemRestrictions
local fFlagAXParseAdditionalItemDetailsFromCatalogModule = require(parent.Flags.FFlagAXParseAdditionalItemDetailsFromCatalog)
local mockIdModule = require(script.Parent.Parent.MockId)
local t = {
	new = function() --[[ line: 41 ]]
		return {}
	end
}

function t.mock() --[[ line: 47 ]]
	-- upvalues: t (ref), mockIdModule (ref)
	local var6 = t.new()
	var6.name = ""
	var6.bundleId = mockIdModule()
	var6.description = ""
	var6.bundleType = ""
	var6.creatorId = ""
	var6.creatorName = ""
	var6.productId = ""
	var6.isForSale = false
	var6.price = ""
	var6.assetIds = {}
	var6.numFavorites = 0
	var6.costumeId = ""
	var6.owned = false
	var6.isForSale = false
	var6.collectibleItemId = ""
	var6.collectibleIsLimited = nil
	var6.collectibleProductId = ""
	var6.collectibleLowestResalePrice = 0
	var6.collectibleLowestAvailableResaleProductId = ""
	var6.collectibleLowestAvailableResaleItemInstanceId = ""
	var6.collectibleQuantityLimitPerUser = 0
	var6.remaining = 0
	var6.productType = ""
	
	return var6
end

function t.fromBulkPurchaseResult(p0, p1) --[[ line: 80 ]]
	-- upvalues: t (ref), itemRestrictions (ref)
	local var7 = t.new()
	local var8 = if p1 and p1.itemRestrictions then p1.itemRestrictions else {}
	var7.resellableCount = if p1 and p1.resellableCount then p1.resellableCount else 0
	
	if p0.status == Enum.MarketplaceItemPurchaseStatus.Success and p0.type == Enum.MarketplaceProductType.AvatarBundle then
		var7.owned = true
		
		if var8[itemRestrictions.Collectible] or var8[itemRestrictions.Limited] or var8[itemRestrictions.LimitedUnique] then
			var7.resellableCount += 1
		end
	end
	return var7
end

function t.fromGetFavoriteForAsset(value, p2) --[[ line: 109 ]]
	-- upvalues: t (ref)
	local var9 = t.new()
	var9.bundleId = tostring(value)
	var9.isFavorited = p2
	
	return var9
end

function t.fromAvatarPreviewItem(p3) --[[ line: 116 ]]
	-- upvalues: t (ref)
	local var10 = t.new()
	var10.name = p3.name
	var10.description = p3.description
	var10.price = p3.priceInRobux
	var10.isForSale = p3.isPurchasable
	var10.productId = tostring(p3.productId)
	var10.collectibleItemId = p3.collectibleItemId
	var10.collectibleProductId = p3.collectibleProductId
	var10.owned = p3.quantityOwned > 0
	var10.resellableCount = p3.quantityOwned
	var10.creatorId = tostring(p3.creator.id)
	var10.creatorName = p3.creator.name
	var10.creatorHasVerifiedBadge = p3.creator.hasVerifiedBadge
	var10.bundleId = tostring(p3.id)
	var10.bundleType = tostring(p3.bundleType)
	var10.noPriceStatus = p3.noPriceStatus
	local t_1 = {}
	
	if p3.assetsInBundle then
		for i, v in p3.assetsInBundle do
			table.insert(t_1, {
				id = tostring(v.id),
				assetType = tostring(v.assetType),
				isIncluded = v.isIncluded,
				meta = v.meta
			})
		end
	end
	var10.assetsInBundle = t_1
	
	if p3.itemRestrictions then
		local t_2 = {}
		
		for i, v in p3.itemRestrictions do
			t_2[v] = true
		end
		var10.itemRestrictions = t_2
	end
	return var10
end

function t.fromGetAssetBundles(value) --[[ line: 161 ]]
	-- upvalues: t (ref), constantsModule (ref)
	local var13 = t.new()
	var13.name = value.name
	var13.bundleId = tostring(value.id)
	var13.description = value.description
	var13.bundleType = value.bundleType
	var13.creatorId = tostring(value.creator.id)
	var13.creatorName = value.creator.name
	var13.productId = tostring(value.product.id)
	
	if value.collectibleItemDetail then
		var13.isForSale = value.collectibleItemDetail.saleStatus == constantsModule.SaleStatus.OnSale
		var13.collectibleItemId = value.collectibleItemDetail.collectibleItemId or ""
		var13.collectibleProductId = value.collectibleItemDetail.collectibleProductId or ""
		var13.collectibleLowestResalePrice = value.collectibleItemDetail.lowestResalePrice or 0
		var13.collectibleLowestAvailableResaleProductId = value.collectibleItemDetail.lowestAvailableResaleProductId or ""
		var13.collectibleLowestAvailableResaleItemInstanceId = value.collectibleItemDetail.lowestAvailableResaleItemInstanceId or ""
		var13.collectibleQuantityLimitPerUser = value.collectibleItemDetail.quantityLimitPerUser or 0
		var13.productType = constantsModule.ProductType.CollectibleItem
		var13.price = value.collectibleItemDetail.price
		var13.remaining = value.collectibleItemDetail.unitsAvailable or 0
		var13.collectibleIsLimited = value.collectibleItemDetail.collectibleItemType == "Limited"
		var13.saleLocation = value.collectibleItemDetail.saleLocation
	end
	var13.assetIds = {}
	
	for i, v in pairs(value.items) do
		if v.type == "UserOutfit" then
			var13.costumeId = tostring(v.id)
		else
			table.insert(var13.assetIds, tostring(v.id))
		end
	end
	return var13
end

function t.fromGetItemDetailsV2(p4) --[[ line: 208 ]]
	-- upvalues: t (ref)
	local var14 = t.new()
	var14.bundleId = tostring(p4.id)
	var14.isForSale = p4.isPurchasable
	var14.price = p4.price or 0
	var14.hasResellers = p4.hasResellers
	var14.collectibleItemId = p4.collectibleItemId
	var14.remaining = p4.unitsAvailableForConsumption
	var14.collectibleTotalQuantity = p4.totalQuantity
	var14.collectibleLowestResalePrice = p4.lowestResalePrice
	var14.isOffSale = p4.isOffSale
	var14.saleLocationType = p4.saleLocationType
	var14.numFavorites = p4.favoriteCount
	var14.catalogPriceStatus = p4.priceStatus
	local t_1 = {}
	
	if p4.bundledItems then
		for i, v in p4.bundledItems do
			table.insert(t_1, { id = tostring(v.id), name = v.name })
		end
	end
	var14.assetsInBundle = t_1
	
	return var14
end

function t.fromGetItemDetails(p5) --[[ line: 240 ]]
	-- upvalues: t (ref), fFlagAXParseAdditionalItemDetailsFromCatalogModule (ref)
	local var16 = t.new()
	var16.bundleId = tostring(p5.Id)
	var16.owned = p5.Owned
	var16.isForSale = p5.IsPurchasable
	var16.price = p5.Price or 0
	var16.hasResellers = p5.HasResellers
	var16.collectibleItemId = p5.CollectibleItemId
	
	if fFlagAXParseAdditionalItemDetailsFromCatalogModule then
		var16.remaining = p5.UnitsAvailableForConsumption
		var16.collectibleTotalQuantity = p5.TotalQuantity
		var16.collectibleLowestResalePrice = p5.LowestResalePrice
		var16.isOffSale = p5.IsOffSale
		var16.saleLocationType = p5.SaleLocationType
		var16.numFavorites = p5.FavoriteCount
		var16.catalogPriceStatus = p5.PriceStatus
		local t_1 = {}
		
		for i, v in p5.BundledItems do
			table.insert(t_1, { id = tostring(v.Id), name = v.Name })
		end
		var16.assetsInBundle = t_1
	end
	return var16
end

function t.fromGetBundleFavoriteCount(p6, p7) --[[ line: 273 ]]
	-- upvalues: t (ref)
	local var18 = t.new()
	var18.bundleId = tostring(p6)
	var18.numFavorites = p7
	
	return var18
end

function t.fromGetEconomyProductInfo(p8, p9, p10, p11) --[[ line: 280 ]]
	-- upvalues: t (ref)
	local var19 = t.new()
	var19.bundleId = tostring(p9)
	var19.owned = p8
	var19.price = p10
	var19.isForSale = p11
	
	return var19
end

function t.fromPurchaseSuccess(p12) --[[ line: 289 ]]
	-- upvalues: t (ref)
	local var20 = t.new()
	var20.bundleId = tostring(p12)
	var20.owned = true
	
	return var20
end

function t.getSaleDetailsForCollectibles(p13) --[[ line: 296 ]]
	-- upvalues: dashModule (ref), constantsModule (ref)
	local var21 = dashModule.joinDeep({}, p13)
	
	if p13.productType == constantsModule.ProductType.CollectibleItem then
		local saleLocation = var21.saleLocation
		local var22 = saleLocation and saleLocation.saleLocationTypeId ~= constantsModule.SaleLocationType.ShopOnly
		local var23 = saleLocation and saleLocation.saleLocationTypeId ~= constantsModule.SaleLocationType.ShopAndExperiencesById
		local var24 = saleLocation and (saleLocation.saleLocationTypeId == constantsModule.SaleLocationType.ShopAndExperiencesById and (type(saleLocation.universeIds) == "table" and table.find(saleLocation.universeIds, game.GameId) ~= nil))
		local var25 = saleLocation and saleLocation.saleLocationTypeId ~= constantsModule.SaleLocationType.ExperiencesDevApiOnly
		local isForSale = var21.isForSale
		
		if isForSale then
			isForSale = var22
			
			if isForSale and not var23 then
				isForSale = var24 and var25
			end
		end
		var21.isForSale = isForSale
		
		if not p13.collectibleIsLimited then
			var21.isForSale = var21.isForSale and not var21.owned
		end
	end
	return var21
end

return t