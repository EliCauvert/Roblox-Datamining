local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)
local dashModule = require(corePackagesService.Packages.Dash)
local fFlagAXMarketplaceLicensing = require(corePackagesService.Workspace.Packages.AvatarExperienceFlags).FFlagAXMarketplaceLicensing
local parent = script.Parent.Parent
local mockIdModule = require(parent.MockId)
local constantsModule = require(parent.Constants)
local _ = require(corePackagesService.Workspace.Packages.AvatarExperienceInspectAndBuy)
local avatarExperienceCommonModule = require(corePackagesService.Workspace.Packages.AvatarExperienceCommon)
local itemRestrictions = avatarExperienceCommonModule.Enums.ItemRestrictions
local getRawItemLicensingInfo = avatarExperienceCommonModule.Utils.getRawItemLicensingInfo
local parseItemLicensing = avatarExperienceCommonModule.Utils.parseItemLicensing
local getFFlagIBEnableCollectiblesSystemSupportModule = require(parent.Flags.GetFFlagIBEnableCollectiblesSystemSupport)
local t = {
	new = function()
		return {}
	end
}

local _ = function(p1)
	return math.round(p1 * 100) / 100
end

function t.mock()
	-- upvalues: t (ref), mockIdModule (ref), getFFlagIBEnableCollectiblesSystemSupportModule (ref)
	local var1 = t.new()
	var1.name = ""
	var1.assetId = mockIdModule()
	var1.assetTypeId = ""
	var1.creatorId = ""
	var1.creatorName = ""
	var1.creatorHasVerifiedBadge = false
	var1.owned = false
	var1.isForSale = false
	var1.description = ""
	var1.price = ""
	var1.productId = ""
	var1.isLimited = false
	var1.isLimitedUnique = if getFFlagIBEnableCollectiblesSystemSupportModule() then false else nil
	var1.collectibleIsLimited = if getFFlagIBEnableCollectiblesSystemSupportModule() then false else nil
	var1.bundlesAssetIsIn = {}
	var1.parentBundleId = nil
	var1.numFavorites = 0
	var1.minimumMembershipLevel = 0
	var1.collectibleItemId = ""
	var1.collectibleProductId = ""
	var1.collectibleLowestResalePrice = 0
	var1.collectibleLowestAvailableResaleProductId = ""
	var1.collectibleLowestAvailableResaleItemInstanceId = ""
	var1.collectibleQuantityLimitPerUser = 0
	var1.remaining = 0
	var1.creatingUniverseId = nil
	
	return var1
end

function t.fromBulkPurchaseResult(p1, p2)
	-- upvalues: t (ref), itemRestrictions (ref)
	local var1 = t.new()
	local var2 = if p2 and p2.itemRestrictions then p2.itemRestrictions else {}
	var1.resellableCount = if p2 and p2.resellableCount then p2.resellableCount else 0
	
	if p1.status == Enum.MarketplaceItemPurchaseStatus.Success and p1.type == Enum.MarketplaceProductType.AvatarAsset then
		var1.owned = true
		
		if var2[itemRestrictions.Collectible] or var2[itemRestrictions.Limited] or var2[itemRestrictions.LimitedUnique] then
			var1.resellableCount += 1
		end
	end
	return var1
end

function t.fromAvatarPreviewItem(p1)
	-- upvalues: t (ref), fFlagAXMarketplaceLicensing (ref), parseItemLicensing (ref), getRawItemLicensingInfo (ref)
	local var1 = t.new()
	var1.name = p1.name
	var1.description = p1.description
	var1.price = p1.priceInRobux
	var1.productId = tostring(p1.productId)
	var1.collectibleItemId = p1.collectibleItemId
	var1.owned = p1.quantityOwned > 0
	var1.resellableCount = p1.quantityOwned
	var1.creatorId = tostring(p1.creator.id)
	var1.creatorName = p1.creator.name
	var1.creatorHasVerifiedBadge = p1.creator.hasVerifiedBadge
	var1.assetId = tostring(p1.id)
	var1.assetTypeId = tostring(p1.assetType)
	var1.productId = tostring(p1.productId)
	var1.isForSale = p1.isPurchasable
	var1.noPriceStatus = p1.noPriceStatus
	var1.meta = p1.meta
	
	if fFlagAXMarketplaceLicensing then
		var1.itemLicensingInfo = parseItemLicensing(getRawItemLicensingInfo(p1))
	end
	if p1.itemRestrictions then
		local t_1 = {}
		
		for i, v in p1.itemRestrictions do
			t_1[v] = true
		end
		var1.itemRestrictions = t_1
	end
	return var1
end

function t.fromGetProductInfo(p2)
	-- upvalues: t (ref), constantsModule (ref), getFFlagIBEnableCollectiblesSystemSupportModule (ref)
	local var2 = t.new()
	var2.name = p2.Name
	var2.description = p2.Description
	var2.price = p2.PriceInRobux
	var2.productType = p2.ProductType
	var2.remaining = p2.Remaining
	var2.creatorId = tostring(p2.Creator.Id)
	var2.creatorName = p2.Creator.Name
	var2.assetId = tostring(p2.AssetId)
	var2.assetTypeId = tostring(p2.AssetTypeId)
	var2.productId = tostring(p2.ProductId)
	var2.isForSale = p2.IsForSale
	var2.canBeSoldInThisGame = p2.CanBeSoldInThisGame
	var2.saleLocation = p2.SaleLocation
	var2.remaining = p2.Remaining or 0
	
	if var2.productType == constantsModule.ProductType.CollectibleItem then
		var2.collectibleItemId = p2.CollectibleItemId or ""
		var2.collectibleProductId = p2.CollectibleProductId or ""
		
		if p2.CollectiblesItemDetails then
			var2.collectibleLowestResalePrice = p2.CollectiblesItemDetails.CollectibleLowestResalePrice or 0
			var2.collectibleLowestAvailableResaleProductId = p2.CollectiblesItemDetails.CollectibleLowestAvailableResaleProductId or ""
			var2.collectibleLowestAvailableResaleItemInstanceId = p2.CollectiblesItemDetails.CollectibleLowestAvailableResaleItemInstanceId or ""
			var2.collectibleQuantityLimitPerUser = p2.CollectiblesItemDetails.CollectibleQuantityLimitPerUser or 0
			var2.collectibleIsLimited = p2.CollectiblesItemDetails.IsLimited
		end
	end
	var2.creatorHasVerifiedBadge = p2.Creator.HasVerifiedBadge
	
	if getFFlagIBEnableCollectiblesSystemSupportModule() then
		var2.isLimited = p2.IsLimited
		var2.isLimitedUnique = p2.IsLimitedUnique
		
		return var2
	end
	var2.isLimited = p2.IsLimited or p2.IsLimitedUnique
	
	return var2
end

function t.fromHumanoidDescription(p2)
	-- upvalues: t (ref)
	local var2 = t.new()
	var2.assetId = tostring(p2)
	
	return var2
end

function t.fromHumanoidDescriptionAccessory(p2)
	-- upvalues: t (ref)
	local var2 = t.new()
	var2.assetId = tostring(p2.AssetId)
	var2.meta = {}
	var2.meta.position = {
		x = math.round(p2.Position.X * 100) / 100,
		y = math.round(p2.Position.Y * 100) / 100,
		z = math.round(p2.Position.Z * 100) / 100
	}
	var2.meta.rotation = {
		x = math.round(p2.Rotation.X * 100) / 100,
		y = math.round(p2.Rotation.Y * 100) / 100,
		z = math.round(p2.Rotation.Z * 100) / 100
	}
	var2.meta.scale = {
		x = math.round(p2.Scale.X * 100) / 100,
		y = math.round(p2.Scale.Y * 100) / 100,
		z = math.round(p2.Scale.Z * 100) / 100
	}
	
	if p2.IsLayered then
		var2.meta.order = p2.Order
	end
	return var2
end

function t.fromGetAssetBundles(value, p2)
	-- upvalues: t (ref)
	local var2 = t.new()
	var2.assetId = tostring(value)
	var2.bundlesAssetIsIn = p2
	
	return var2
end

function t.fromGetFavoriteForAsset(value, p2)
	-- upvalues: t (ref)
	local var2 = t.new()
	var2.assetId = tostring(value)
	var2.isFavorited = p2
	
	return var2
end

function t.fromBundleInfo(p2, p3)
	-- upvalues: t (ref), constantsModule (ref)
	local var2 = t.new()
	var2.assetId = tostring(p2)
	var2.parentBundleId = p3.bundleId
	var2.bundlesAssetIsIn = { p3.bundleId }
	var2.collectibleItemId = p3.collectibleItemId
	var2.collectibleProductId = p3.collectibleProductId
	var2.collectibleLowestResalePrice = p3.collectibleLowestResalePrice
	var2.collectibleLowestAvailableResaleProductId = p3.collectibleLowestAvailableResaleProductId
	var2.collectibleLowestAvailableResaleItemInstanceId = p3.collectibleLowestAvailableResaleItemInstanceId
	var2.collectibleQuantityLimitPerUser = p3.collectibleQuantityLimitPerUser
	var2.collectibleIsLimited = p3.collectibleIsLimited
	var2.isForSale = p3.isForSale
	var2.remaining = p3.remaining
	var2.owned = p3.owned
	
	if not var2.collectibleIsLimited then
		var2.isForSale = var2.isForSale and not var2.owned
	end
	var2.description = p3.description or ""
	var2.productType = constantsModule.ProductType.CollectibleItem
	
	if p3.price then
		var2.price = p3.price
	end
	return var2
end

function t.fromGetAssetFavoriteCount(value, p2)
	-- upvalues: t (ref)
	local var2 = t.new()
	var2.assetId = tostring(value)
	var2.numFavorites = p2
	
	return var2
end

function t.fromGetEconomyProductInfo(p2, p3, p4, p5, p6)
	-- upvalues: t (ref)
	local var2 = t.new()
	var2.assetId = tostring(p2.assetId)
	var2.owned = p3
	
	if p4 then
		var2.price = p4
	end
	var2.isForSale = p5
	var2.premiumPricing = p6
	
	return var2
end

function t.fromGetItemDetailsV2(p2)
	-- upvalues: t (ref), getRawItemLicensingInfo (ref), fFlagAXMarketplaceLicensing (ref), parseItemLicensing (ref), cryoModule (ref)
	local var2 = t.new()
	var2.assetId = tostring(p2.id)
	var2.isForSale = p2.isPurchasable
	var2.price = p2.price or 0
	var2.hasResellers = p2.hasResellers
	var2.collectibleItemId = p2.collectibleItemId
	local t_1 = {}
	
	if p2.itemRestrictions then
		for i, v in p2.itemRestrictions do
			t_1[v] = true
		end
		var2.itemRestrictions = t_1
	end
	var2.saleLocationType = p2.saleLocationType
	var2.remaining = p2.unitsAvailableForConsumption
	var2.collectibleTotalQuantity = p2.totalQuantity
	var2.collectibleLowestResalePrice = p2.lowestResalePrice
	var2.isOffSale = p2.isOffSale
	var2.saleLocationType = p2.saleLocationType
	var2.numFavorites = p2.favoriteCount
	var2.catalogPriceStatus = p2.priceStatus
	var2.timedOptions = p2.timedOptions
	local var3 = getRawItemLicensingInfo(p2)
	
	if fFlagAXMarketplaceLicensing and var3 ~= nil then
		var2.itemLicensingInfo = parseItemLicensing(var3) or cryoModule.None
	end
	return var2
end

function t.fromGetItemDetails(p3)
	-- upvalues: t (ref)
	local var4 = t.new()
	var4.assetId = tostring(p3.Id)
	var4.owned = p3.Owned
	var4.isForSale = p3.IsPurchasable
	var4.price = p3.Price or 0
	var4.hasResellers = p3.HasResellers
	var4.collectibleItemId = p3.CollectibleItemId
	local t_1 = {}
	
	if p3.ItemRestrictions then
		for i, v in p3.ItemRestrictions do
			t_1[v] = true
		end
		var4.itemRestrictions = t_1
	end
	var4.saleLocationType = p3.SaleLocationType
	var4.remaining = p3.UnitsAvailableForConsumption
	var4.collectibleTotalQuantity = p3.TotalQuantity
	var4.collectibleLowestResalePrice = p3.LowestResalePrice
	var4.isOffSale = p3.IsOffSale
	var4.saleLocationType = p3.SaleLocationType
	var4.numFavorites = p3.FavoriteCount
	var4.catalogPriceStatus = p3.PriceStatus
	var4.creatingUniverseId = p3.CreatingUniverseId
	
	return var4
end

function t.fromPurchaseSuccess(p4)
	-- upvalues: t (ref)
	local var5 = t.new()
	var5.assetId = tostring(p4)
	var5.owned = true
	
	return var5
end

function t.fromGetVersionInfo(p4, p5)
	-- upvalues: t (ref)
	local var5 = t.new()
	var5.assetId = tostring(p4)
	var5.creatingUniverseId = if p5.creatingUniverseId then tostring(p5.creatingUniverseId) else nil
	
	return var5
end

function t.getSaleDetailsForCollectibles(p4)
	-- upvalues: dashModule (ref), constantsModule (ref)
	local var5 = dashModule.joinDeep({}, p4)
	local saleLocation = p4.saleLocation
	
	if p4.productType == constantsModule.ProductType.CollectibleItem then
		local var6 = saleLocation and saleLocation.SaleLocationType ~= constantsModule.SaleLocationType.ShopOnly
		local var7 = saleLocation and saleLocation.SaleLocationType ~= constantsModule.SaleLocationType.ShopAndExperiencesById
		local var8 = saleLocation and (saleLocation.SaleLocationType == constantsModule.SaleLocationType.ShopAndExperiencesById and (type(saleLocation.UniverseIds) == "table" and table.find(saleLocation.UniverseIds, game.GameId) ~= nil))
		local var9 = saleLocation and saleLocation.SaleLocationType ~= constantsModule.SaleLocationType.ExperiencesDevApiOnly
		local isForSale = p4.isForSale
		
		if isForSale then
			isForSale = p4.canBeSoldInThisGame
			
			if isForSale then
				isForSale = var6
				
				if isForSale and not var7 then
					isForSale = var8 and var9
				end
			end
		end
		var5.isForSale = isForSale
		
		if p4.collectibleIsLimited then
			return var5
		else
			var5.isForSale = var5.isForSale and not var5.owned
			
			return var5
		end
	else
		var5.isForSale = p4.isForSale and p4.canBeSoldInThisGame
		
		if p4.canBeSoldInThisGame == nil then
			var5.isForSale = p4.isForSale
		end
	end
end

return t