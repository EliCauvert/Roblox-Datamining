local corePackagesService = game:GetService("CorePackages")
local dashModule = require(corePackagesService.Packages.Dash)
local constantsModule = require(script.Parent.Parent.Constants)
local _ = require(corePackagesService.Workspace.Packages.AvatarExperienceInspectAndBuy)
local itemRestrictions = require(corePackagesService.Workspace.Packages.AvatarExperienceCommon).Enums.ItemRestrictions
local mockIdModule = require(script.Parent.Parent.MockId)
local t = {
	new = function() --[[ line: 38 ]]
		return {}
	end
}

function t.mock() --[[ line: 44 ]]
	-- upvalues: t (ref), mockIdModule (ref)
	local var5 = t.new()
	var5.name = ""
	var5.bundleId = mockIdModule()
	var5.description = ""
	var5.bundleType = ""
	var5.creatorId = ""
	var5.creatorName = ""
	var5.productId = ""
	var5.isForSale = false
	var5.price = ""
	var5.assetIds = {}
	var5.numFavorites = 0
	var5.costumeId = ""
	var5.owned = false
	var5.isForSale = false
	var5.collectibleItemId = ""
	var5.collectibleIsLimited = nil
	var5.collectibleProductId = ""
	var5.collectibleLowestResalePrice = 0
	var5.collectibleLowestAvailableResaleProductId = ""
	var5.collectibleLowestAvailableResaleItemInstanceId = ""
	var5.collectibleQuantityLimitPerUser = 0
	var5.remaining = 0
	var5.productType = ""
	
	return var5
end

function t.fromBulkPurchaseResult(p0, p1) --[[ line: 77 ]]
	-- upvalues: t (ref), itemRestrictions (ref)
	local var6 = t.new()
	local var7 = if p1 and p1.itemRestrictions then p1.itemRestrictions else {}
	var6.resellableCount = if p1 and p1.resellableCount then p1.resellableCount else 0
	
	if p0.status == Enum.MarketplaceItemPurchaseStatus.Success and p0.type == Enum.MarketplaceProductType.AvatarBundle then
		var6.owned = true
		
		if var7[itemRestrictions.Collectible] or var7[itemRestrictions.Limited] or var7[itemRestrictions.LimitedUnique] then
			var6.resellableCount += 1
		end
	end
	return var6
end

function t.fromGetFavoriteForAsset(value, p2) --[[ line: 106 ]]
	-- upvalues: t (ref)
	local var8 = t.new()
	var8.bundleId = tostring(value)
	var8.isFavorited = p2
	
	return var8
end

function t.fromAvatarPreviewItem(p3) --[[ line: 113 ]]
	-- upvalues: t (ref)
	local var9 = t.new()
	var9.name = p3.name
	var9.description = p3.description
	var9.price = p3.priceInRobux
	var9.isForSale = p3.isPurchasable
	var9.productId = tostring(p3.productId)
	var9.collectibleItemId = p3.collectibleItemId
	var9.collectibleProductId = p3.collectibleProductId
	var9.owned = p3.quantityOwned > 0
	var9.resellableCount = p3.quantityOwned
	var9.creatorId = tostring(p3.creator.id)
	var9.creatorName = p3.creator.name
	var9.creatorHasVerifiedBadge = p3.creator.hasVerifiedBadge
	var9.bundleId = tostring(p3.id)
	var9.bundleType = tostring(p3.bundleType)
	var9.noPriceStatus = p3.noPriceStatus
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
	var9.assetsInBundle = t_1
	
	if p3.itemRestrictions then
		local t_2 = {}
		
		for i, v in p3.itemRestrictions do
			t_2[v] = true
		end
		var9.itemRestrictions = t_2
	end
	return var9
end

function t.fromGetAssetBundles(value) --[[ line: 158 ]]
	-- upvalues: t (ref), constantsModule (ref)
	local var12 = t.new()
	var12.name = value.name
	var12.bundleId = tostring(value.id)
	var12.description = value.description
	var12.bundleType = value.bundleType
	var12.creatorId = tostring(value.creator.id)
	var12.creatorName = value.creator.name
	var12.productId = tostring(value.product.id)
	
	if value.collectibleItemDetail then
		var12.isForSale = value.collectibleItemDetail.saleStatus == constantsModule.SaleStatus.OnSale
		var12.collectibleItemId = value.collectibleItemDetail.collectibleItemId or ""
		var12.collectibleProductId = value.collectibleItemDetail.collectibleProductId or ""
		var12.collectibleLowestResalePrice = value.collectibleItemDetail.lowestResalePrice or 0
		var12.collectibleLowestAvailableResaleProductId = value.collectibleItemDetail.lowestAvailableResaleProductId or ""
		var12.collectibleLowestAvailableResaleItemInstanceId = value.collectibleItemDetail.lowestAvailableResaleItemInstanceId or ""
		var12.collectibleQuantityLimitPerUser = value.collectibleItemDetail.quantityLimitPerUser or 0
		var12.productType = constantsModule.ProductType.CollectibleItem
		var12.price = value.collectibleItemDetail.price
		var12.remaining = value.collectibleItemDetail.unitsAvailable or 0
		var12.collectibleIsLimited = value.collectibleItemDetail.collectibleItemType == "Limited"
		var12.saleLocation = value.collectibleItemDetail.saleLocation
	end
	var12.assetIds = {}
	
	for i, v in pairs(value.items) do
		if v.type == "UserOutfit" then
			var12.costumeId = tostring(v.id)
		else
			table.insert(var12.assetIds, tostring(v.id))
		end
	end
	return var12
end

function t.fromGetItemDetailsV2(p4) --[[ line: 205 ]]
	-- upvalues: t (ref)
	local var13 = t.new()
	var13.bundleId = tostring(p4.id)
	var13.isForSale = p4.isPurchasable
	var13.price = p4.price or 0
	var13.hasResellers = p4.hasResellers
	var13.collectibleItemId = p4.collectibleItemId
	var13.remaining = p4.unitsAvailableForConsumption
	var13.collectibleTotalQuantity = p4.totalQuantity
	var13.collectibleLowestResalePrice = p4.lowestResalePrice
	var13.isOffSale = p4.isOffSale
	var13.saleLocationType = p4.saleLocationType
	var13.numFavorites = p4.favoriteCount
	var13.catalogPriceStatus = p4.priceStatus
	local t_1 = {}
	
	if p4.bundledItems then
		for i, v in p4.bundledItems do
			table.insert(t_1, { id = tostring(v.id), name = v.name })
		end
	end
	var13.assetsInBundle = t_1
	
	return var13
end

function t.fromGetItemDetails(p5) --[[ line: 237 ]]
	-- upvalues: t (ref)
	local var15 = t.new()
	var15.bundleId = tostring(p5.Id)
	var15.owned = p5.Owned
	var15.isForSale = p5.IsPurchasable
	var15.price = p5.Price or 0
	var15.hasResellers = p5.HasResellers
	var15.collectibleItemId = p5.CollectibleItemId
	var15.remaining = p5.UnitsAvailableForConsumption
	var15.collectibleTotalQuantity = p5.TotalQuantity
	var15.collectibleLowestResalePrice = p5.LowestResalePrice
	var15.isOffSale = p5.IsOffSale
	var15.saleLocationType = p5.SaleLocationType
	var15.numFavorites = p5.FavoriteCount
	var15.catalogPriceStatus = p5.PriceStatus
	local t_1 = {}
	
	if p5.BundledItems then
		for i, v in p5.BundledItems do
			table.insert(t_1, { id = tostring(v.Id), name = v.Name })
		end
	end
	var15.assetsInBundle = t_1
	
	return var15
end

function t.fromGetBundleFavoriteCount(p6, p7) --[[ line: 270 ]]
	-- upvalues: t (ref)
	local var17 = t.new()
	var17.bundleId = tostring(p6)
	var17.numFavorites = p7
	
	return var17
end

function t.fromGetEconomyProductInfo(p8, p9, p10, p11) --[[ line: 277 ]]
	-- upvalues: t (ref)
	local var18 = t.new()
	var18.bundleId = tostring(p9)
	var18.owned = p8
	var18.price = p10
	var18.isForSale = p11
	
	return var18
end

function t.fromPurchaseSuccess(p12) --[[ line: 286 ]]
	-- upvalues: t (ref)
	local var19 = t.new()
	var19.bundleId = tostring(p12)
	var19.owned = true
	
	return var19
end

function t.getSaleDetailsForCollectibles(p13) --[[ line: 293 ]]
	-- upvalues: dashModule (ref), constantsModule (ref)
	local var20 = dashModule.joinDeep({}, p13)
	
	if p13.productType == constantsModule.ProductType.CollectibleItem then
		local saleLocation = var20.saleLocation
		local var21 = saleLocation and saleLocation.saleLocationTypeId ~= constantsModule.SaleLocationType.ShopOnly
		local var22 = saleLocation and saleLocation.saleLocationTypeId ~= constantsModule.SaleLocationType.ShopAndExperiencesById
		local var23 = saleLocation and (saleLocation.saleLocationTypeId == constantsModule.SaleLocationType.ShopAndExperiencesById and (type(saleLocation.universeIds) == "table" and table.find(saleLocation.universeIds, game.GameId) ~= nil))
		local var24 = saleLocation and saleLocation.saleLocationTypeId ~= constantsModule.SaleLocationType.ExperiencesDevApiOnly
		local isForSale = var20.isForSale
		
		if isForSale then
			isForSale = var21
			
			if isForSale and not var22 then
				isForSale = var23 and var24
			end
		end
		var20.isForSale = isForSale
		
		if not p13.collectibleIsLimited then
			var20.isForSale = var20.isForSale and not var20.owned
		end
	end
	return var20
end

return t