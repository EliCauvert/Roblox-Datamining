local corePackagesService = game:GetService("CorePackages")
local dashModule = require(corePackagesService.Packages.Dash)
local constantsModule = require(script.Parent.Parent.Constants)
local _ = require(corePackagesService.Workspace.Packages.AvatarExperienceInspectAndBuy)
local itemRestrictions = require(corePackagesService.Workspace.Packages.AvatarExperienceCommon).Enums.ItemRestrictions
local mockIdModule = require(script.Parent.Parent.MockId)
local t = {
	new = function()
		return {}
	end
}

function t.mock()
	-- upvalues: t (ref), mockIdModule (ref)
	local var1 = t.new()
	var1.name = ""
	var1.bundleId = mockIdModule()
	var1.description = ""
	var1.bundleType = ""
	var1.creatorId = ""
	var1.creatorName = ""
	var1.productId = ""
	var1.isForSale = false
	var1.price = ""
	var1.assetIds = {}
	var1.numFavorites = 0
	var1.costumeId = ""
	var1.owned = false
	var1.isForSale = false
	var1.collectibleItemId = ""
	var1.collectibleIsLimited = nil
	var1.collectibleProductId = ""
	var1.collectibleLowestResalePrice = 0
	var1.collectibleLowestAvailableResaleProductId = ""
	var1.collectibleLowestAvailableResaleItemInstanceId = ""
	var1.collectibleQuantityLimitPerUser = 0
	var1.remaining = 0
	var1.productType = ""
	
	return var1
end

function t.fromBulkPurchaseResult(p1, p2)
	-- upvalues: t (ref), itemRestrictions (ref)
	local var1 = t.new()
	local var2 = if p2 and p2.itemRestrictions then p2.itemRestrictions else {}
	var1.resellableCount = if p2 and p2.resellableCount then p2.resellableCount else 0
	
	if p1.status == Enum.MarketplaceItemPurchaseStatus.Success and p1.type == Enum.MarketplaceProductType.AvatarBundle then
		var1.owned = true
		
		if var2[itemRestrictions.Collectible] or var2[itemRestrictions.Limited] or var2[itemRestrictions.LimitedUnique] then
			var1.resellableCount += 1
		end
	end
	return var1
end

function t.fromGetFavoriteForAsset(value, p1)
	-- upvalues: t (ref)
	local var1 = t.new()
	var1.bundleId = tostring(value)
	var1.isFavorited = p1
	
	return var1
end

function t.fromAvatarPreviewItem(p1)
	-- upvalues: t (ref)
	local var1 = t.new()
	var1.name = p1.name
	var1.description = p1.description
	var1.price = p1.priceInRobux
	var1.isForSale = p1.isPurchasable
	var1.productId = tostring(p1.productId)
	var1.collectibleItemId = p1.collectibleItemId
	var1.collectibleProductId = p1.collectibleProductId
	var1.owned = p1.quantityOwned > 0
	var1.resellableCount = p1.quantityOwned
	var1.creatorId = tostring(p1.creator.id)
	var1.creatorName = p1.creator.name
	var1.creatorHasVerifiedBadge = p1.creator.hasVerifiedBadge
	var1.bundleId = tostring(p1.id)
	var1.bundleType = tostring(p1.bundleType)
	var1.noPriceStatus = p1.noPriceStatus
	local t_1 = {}
	
	if p1.assetsInBundle then
		for i, v in p1.assetsInBundle do
			table.insert(t_1, {
				id = tostring(v.id),
				assetType = tostring(v.assetType),
				isIncluded = v.isIncluded,
				meta = v.meta
			})
		end
	end
	var1.assetsInBundle = t_1
	
	if p1.itemRestrictions then
		local t_2 = {}
		
		for i, v in p1.itemRestrictions do
			t_2[v] = true
		end
		var1.itemRestrictions = t_2
	end
	return var1
end

function t.fromGetAssetBundles(value)
	-- upvalues: t (ref), constantsModule (ref)
	local var2 = t.new()
	var2.name = value.name
	var2.bundleId = tostring(value.id)
	var2.description = value.description
	var2.bundleType = value.bundleType
	var2.creatorId = tostring(value.creator.id)
	var2.creatorName = value.creator.name
	var2.productId = tostring(value.product.id)
	
	if value.collectibleItemDetail then
		var2.isForSale = value.collectibleItemDetail.saleStatus == constantsModule.SaleStatus.OnSale
		var2.collectibleItemId = value.collectibleItemDetail.collectibleItemId or ""
		var2.collectibleProductId = value.collectibleItemDetail.collectibleProductId or ""
		var2.collectibleLowestResalePrice = value.collectibleItemDetail.lowestResalePrice or 0
		var2.collectibleLowestAvailableResaleProductId = value.collectibleItemDetail.lowestAvailableResaleProductId or ""
		var2.collectibleLowestAvailableResaleItemInstanceId = value.collectibleItemDetail.lowestAvailableResaleItemInstanceId or ""
		var2.collectibleQuantityLimitPerUser = value.collectibleItemDetail.quantityLimitPerUser or 0
		var2.productType = constantsModule.ProductType.CollectibleItem
		var2.price = value.collectibleItemDetail.price
		var2.remaining = value.collectibleItemDetail.unitsAvailable or 0
		var2.collectibleIsLimited = value.collectibleItemDetail.collectibleItemType == "Limited"
		var2.saleLocation = value.collectibleItemDetail.saleLocation
	end
	var2.assetIds = {}
	
	for i, v in pairs(value.items) do
		if v.type == "UserOutfit" then
			var2.costumeId = tostring(v.id)
		else
			table.insert(var2.assetIds, tostring(v.id))
		end
	end
	return var2
end

function t.fromGetItemDetailsV2(p2)
	-- upvalues: t (ref)
	local var3 = t.new()
	var3.bundleId = tostring(p2.id)
	var3.isForSale = p2.isPurchasable
	var3.price = p2.price or 0
	var3.hasResellers = p2.hasResellers
	var3.collectibleItemId = p2.collectibleItemId
	var3.remaining = p2.unitsAvailableForConsumption
	var3.collectibleTotalQuantity = p2.totalQuantity
	var3.collectibleLowestResalePrice = p2.lowestResalePrice
	var3.isOffSale = p2.isOffSale
	var3.saleLocationType = p2.saleLocationType
	var3.numFavorites = p2.favoriteCount
	var3.catalogPriceStatus = p2.priceStatus
	local t_1 = {}
	
	if p2.bundledItems then
		for i, v in p2.bundledItems do
			table.insert(t_1, { id = tostring(v.id), name = v.name })
		end
	end
	var3.assetsInBundle = t_1
	
	return var3
end

function t.fromGetItemDetails(p3)
	-- upvalues: t (ref)
	local var4 = t.new()
	var4.bundleId = tostring(p3.Id)
	var4.owned = p3.Owned
	var4.isForSale = p3.IsPurchasable
	var4.price = p3.Price or 0
	var4.hasResellers = p3.HasResellers
	var4.collectibleItemId = p3.CollectibleItemId
	var4.remaining = p3.UnitsAvailableForConsumption
	var4.collectibleTotalQuantity = p3.TotalQuantity
	var4.collectibleLowestResalePrice = p3.LowestResalePrice
	var4.isOffSale = p3.IsOffSale
	var4.saleLocationType = p3.SaleLocationType
	var4.numFavorites = p3.FavoriteCount
	var4.catalogPriceStatus = p3.PriceStatus
	local t_1 = {}
	
	if p3.BundledItems then
		for i, v in p3.BundledItems do
			table.insert(t_1, { id = tostring(v.Id), name = v.Name })
		end
	end
	var4.assetsInBundle = t_1
	
	return var4
end

function t.fromGetBundleFavoriteCount(p4, p5)
	-- upvalues: t (ref)
	local var5 = t.new()
	var5.bundleId = tostring(p4)
	var5.numFavorites = p5
	
	return var5
end

function t.fromGetEconomyProductInfo(p4, p5, p6, p7)
	-- upvalues: t (ref)
	local var5 = t.new()
	var5.bundleId = tostring(p5)
	var5.owned = p4
	var5.price = p6
	var5.isForSale = p7
	
	return var5
end

function t.fromPurchaseSuccess(p4)
	-- upvalues: t (ref)
	local var5 = t.new()
	var5.bundleId = tostring(p4)
	var5.owned = true
	
	return var5
end

function t.getSaleDetailsForCollectibles(p4)
	-- upvalues: dashModule (ref), constantsModule (ref)
	local var5 = dashModule.joinDeep({}, p4)
	
	if p4.productType == constantsModule.ProductType.CollectibleItem then
		local saleLocation = var5.saleLocation
		local var6 = saleLocation and saleLocation.saleLocationTypeId ~= constantsModule.SaleLocationType.ShopOnly
		local var7 = saleLocation and saleLocation.saleLocationTypeId ~= constantsModule.SaleLocationType.ShopAndExperiencesById
		local var8 = saleLocation and (saleLocation.saleLocationTypeId == constantsModule.SaleLocationType.ShopAndExperiencesById and (type(saleLocation.universeIds) == "table" and table.find(saleLocation.universeIds, game.GameId) ~= nil))
		local var9 = saleLocation and saleLocation.saleLocationTypeId ~= constantsModule.SaleLocationType.ExperiencesDevApiOnly
		local isForSale = var5.isForSale
		
		if isForSale then
			isForSale = var6
			
			if isForSale and not var7 then
				isForSale = var8 and var9
			end
		end
		var5.isForSale = isForSale
		
		if not p4.collectibleIsLimited then
			var5.isForSale = var5.isForSale and not var5.owned
		end
	end
	return var5
end

return t