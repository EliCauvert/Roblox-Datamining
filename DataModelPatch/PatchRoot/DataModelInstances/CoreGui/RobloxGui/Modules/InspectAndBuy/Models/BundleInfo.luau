local CorePackages = game:GetService("CorePackages")
local DashModule = require(CorePackages.Packages.Dash)
local Parent = script.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceInspectAndBuy)
local ItemRestrictions = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Enums.ItemRestrictions
local FFlagAXParseAdditionalItemDetailsFromCatalogModule = require(Parent.Flags.FFlagAXParseAdditionalItemDetailsFromCatalog)
local MockIdModule = require(script.Parent.Parent.MockId)
local BundleInfoModule = {
	new = function()
		return {}
	end
}

function BundleInfoModule.mock()
	-- upvalues: BundleInfoModule (copy), MockIdModule (copy)
	local NewBundleInfo = BundleInfoModule.new()
	NewBundleInfo.name = ""
	NewBundleInfo.bundleId = MockIdModule()
	NewBundleInfo.description = ""
	NewBundleInfo.bundleType = ""
	NewBundleInfo.creatorId = ""
	NewBundleInfo.creatorName = ""
	NewBundleInfo.productId = ""
	NewBundleInfo.isForSale = false
	NewBundleInfo.price = ""
	NewBundleInfo.assetIds = {}
	NewBundleInfo.numFavorites = 0
	NewBundleInfo.costumeId = ""
	NewBundleInfo.owned = false
	NewBundleInfo.isForSale = false
	NewBundleInfo.collectibleItemId = ""
	NewBundleInfo.collectibleIsLimited = nil
	NewBundleInfo.collectibleProductId = ""
	NewBundleInfo.collectibleLowestResalePrice = 0
	NewBundleInfo.collectibleLowestAvailableResaleProductId = ""
	NewBundleInfo.collectibleLowestAvailableResaleItemInstanceId = ""
	NewBundleInfo.collectibleQuantityLimitPerUser = 0
	NewBundleInfo.remaining = 0
	NewBundleInfo.productType = ""
	
	return NewBundleInfo
end

function BundleInfoModule.fromBulkPurchaseResult(p1, p2)
	-- upvalues: BundleInfoModule (copy), ItemRestrictions (copy)
	local NewBundleInfo = BundleInfoModule.new()
	local ItemRestrictions1 = if p2 and p2.itemRestrictions then p2.itemRestrictions else {}
	NewBundleInfo.resellableCount = if p2 and p2.resellableCount then p2.resellableCount else 0
	
	if p1.status == Enum.MarketplaceItemPurchaseStatus.Success and p1.type == Enum.MarketplaceProductType.AvatarBundle then
		NewBundleInfo.owned = true
		
		if ItemRestrictions1[ItemRestrictions.Collectible] or ItemRestrictions1[ItemRestrictions.Limited] or ItemRestrictions1[ItemRestrictions.LimitedUnique] then
			NewBundleInfo.resellableCount += 1
		end
	end
	return NewBundleInfo
end

function BundleInfoModule.fromGetFavoriteForAsset(p1, IsFavorited)
	-- upvalues: BundleInfoModule (copy)
	local NewBundleInfo = BundleInfoModule.new()
	NewBundleInfo.bundleId = tostring(p1)
	NewBundleInfo.isFavorited = IsFavorited
	
	return NewBundleInfo
end

function BundleInfoModule.fromAvatarPreviewItem(p1)
	-- upvalues: BundleInfoModule (copy)
	local NewBundleInfo = BundleInfoModule.new()
	NewBundleInfo.name = p1.name
	NewBundleInfo.description = p1.description
	NewBundleInfo.price = p1.priceInRobux
	NewBundleInfo.isForSale = p1.isPurchasable
	NewBundleInfo.productId = tostring(p1.productId)
	NewBundleInfo.collectibleItemId = p1.collectibleItemId
	NewBundleInfo.collectibleProductId = p1.collectibleProductId
	NewBundleInfo.owned = p1.quantityOwned > 0
	NewBundleInfo.resellableCount = p1.quantityOwned
	NewBundleInfo.creatorId = tostring(p1.creator.id)
	NewBundleInfo.creatorName = p1.creator.name
	NewBundleInfo.creatorHasVerifiedBadge = p1.creator.hasVerifiedBadge
	NewBundleInfo.bundleId = tostring(p1.id)
	NewBundleInfo.bundleType = tostring(p1.bundleType)
	NewBundleInfo.noPriceStatus = p1.noPriceStatus
	local AssetsInBundle = {}
	
	if p1.assetsInBundle then
		for _, value in p1.assetsInBundle do
			table.insert(AssetsInBundle, {
				id = tostring(value.id),
				assetType = tostring(value.assetType),
				isIncluded = value.isIncluded,
				meta = value.meta
			})
		end
	end
	NewBundleInfo.assetsInBundle = AssetsInBundle
	
	if p1.itemRestrictions then
		local ItemRestrictions = {}
		
		for _, itemRestriction in p1.itemRestrictions do
			ItemRestrictions[itemRestriction] = true
		end
		NewBundleInfo.itemRestrictions = ItemRestrictions
	end
	return NewBundleInfo
end

function BundleInfoModule.fromGetAssetBundles(p2)
	-- upvalues: BundleInfoModule (copy), ConstantsModule (copy)
	local NewBundleInfo = BundleInfoModule.new()
	NewBundleInfo.name = p2.name
	NewBundleInfo.bundleId = tostring(p2.id)
	NewBundleInfo.description = p2.description
	NewBundleInfo.bundleType = p2.bundleType
	NewBundleInfo.creatorId = tostring(p2.creator.id)
	NewBundleInfo.creatorName = p2.creator.name
	NewBundleInfo.productId = tostring(p2.product.id)
	
	if p2.collectibleItemDetail then
		NewBundleInfo.isForSale = p2.collectibleItemDetail.saleStatus == ConstantsModule.SaleStatus.OnSale
		NewBundleInfo.collectibleItemId = p2.collectibleItemDetail.collectibleItemId or ""
		NewBundleInfo.collectibleProductId = p2.collectibleItemDetail.collectibleProductId or ""
		NewBundleInfo.collectibleLowestResalePrice = p2.collectibleItemDetail.lowestResalePrice or 0
		NewBundleInfo.collectibleLowestAvailableResaleProductId = p2.collectibleItemDetail.lowestAvailableResaleProductId or ""
		NewBundleInfo.collectibleLowestAvailableResaleItemInstanceId = p2.collectibleItemDetail.lowestAvailableResaleItemInstanceId or ""
		NewBundleInfo.collectibleQuantityLimitPerUser = p2.collectibleItemDetail.quantityLimitPerUser or 0
		NewBundleInfo.productType = ConstantsModule.ProductType.CollectibleItem
		NewBundleInfo.price = p2.collectibleItemDetail.price
		NewBundleInfo.remaining = p2.collectibleItemDetail.unitsAvailable or 0
		NewBundleInfo.collectibleIsLimited = p2.collectibleItemDetail.collectibleItemType == "Limited"
		NewBundleInfo.saleLocation = p2.collectibleItemDetail.saleLocation
	end
	NewBundleInfo.assetIds = {}
	
	for _, item in pairs(p2.items) do
		if item.type == "UserOutfit" then
			NewBundleInfo.costumeId = tostring(item.id)
		else
			table.insert(NewBundleInfo.assetIds, (tostring(item.id)))
		end
	end
	return NewBundleInfo
end

function BundleInfoModule.fromGetItemDetailsV2(p3)
	-- upvalues: BundleInfoModule (copy)
	local NewBundleInfo = BundleInfoModule.new()
	NewBundleInfo.bundleId = tostring(p3.id)
	NewBundleInfo.isForSale = p3.isPurchasable
	NewBundleInfo.price = p3.price or 0
	NewBundleInfo.hasResellers = p3.hasResellers
	NewBundleInfo.collectibleItemId = p3.collectibleItemId
	NewBundleInfo.remaining = p3.unitsAvailableForConsumption
	NewBundleInfo.collectibleTotalQuantity = p3.totalQuantity
	NewBundleInfo.collectibleLowestResalePrice = p3.lowestResalePrice
	NewBundleInfo.isOffSale = p3.isOffSale
	NewBundleInfo.saleLocationType = p3.saleLocationType
	NewBundleInfo.numFavorites = p3.favoriteCount
	NewBundleInfo.catalogPriceStatus = p3.priceStatus
	local AssetsInBundle = {}
	
	if p3.bundledItems then
		for _, bundledItem in p3.bundledItems do
			table.insert(AssetsInBundle, { id = tostring(bundledItem.id), name = bundledItem.name })
		end
	end
	NewBundleInfo.assetsInBundle = AssetsInBundle
	
	return NewBundleInfo
end

function BundleInfoModule.fromGetItemDetails(p4)
	-- upvalues: BundleInfoModule (copy), FFlagAXParseAdditionalItemDetailsFromCatalogModule (copy)
	local NewBundleInfo = BundleInfoModule.new()
	NewBundleInfo.bundleId = tostring(p4.Id)
	NewBundleInfo.owned = p4.Owned
	NewBundleInfo.isForSale = p4.IsPurchasable
	NewBundleInfo.price = p4.Price or 0
	NewBundleInfo.hasResellers = p4.HasResellers
	NewBundleInfo.collectibleItemId = p4.CollectibleItemId
	
	if FFlagAXParseAdditionalItemDetailsFromCatalogModule then
		NewBundleInfo.remaining = p4.UnitsAvailableForConsumption
		NewBundleInfo.collectibleTotalQuantity = p4.TotalQuantity
		NewBundleInfo.collectibleLowestResalePrice = p4.LowestResalePrice
		NewBundleInfo.isOffSale = p4.IsOffSale
		NewBundleInfo.saleLocationType = p4.SaleLocationType
		NewBundleInfo.numFavorites = p4.FavoriteCount
		NewBundleInfo.catalogPriceStatus = p4.PriceStatus
		local AssetsInBundle = {}
		
		for _, bundledItem in p4.BundledItems do
			table.insert(AssetsInBundle, { id = tostring(bundledItem.Id), name = bundledItem.Name })
		end
		NewBundleInfo.assetsInBundle = AssetsInBundle
	end
	return NewBundleInfo
end

function BundleInfoModule.fromGetBundleFavoriteCount(p5, NumFavorites)
	-- upvalues: BundleInfoModule (copy)
	local NewBundleInfo = BundleInfoModule.new()
	NewBundleInfo.bundleId = tostring(p5)
	NewBundleInfo.numFavorites = NumFavorites
	
	return NewBundleInfo
end

function BundleInfoModule.fromGetEconomyProductInfo(Owned, p5, Price, IsForSale)
	-- upvalues: BundleInfoModule (copy)
	local NewBundleInfo = BundleInfoModule.new()
	NewBundleInfo.bundleId = tostring(p5)
	NewBundleInfo.owned = Owned
	NewBundleInfo.price = Price
	NewBundleInfo.isForSale = IsForSale
	
	return NewBundleInfo
end

function BundleInfoModule.fromPurchaseSuccess(p5)
	-- upvalues: BundleInfoModule (copy)
	local NewBundleInfo = BundleInfoModule.new()
	NewBundleInfo.bundleId = tostring(p5)
	NewBundleInfo.owned = true
	
	return NewBundleInfo
end

function BundleInfoModule.getSaleDetailsForCollectibles(p5)
	-- upvalues: DashModule (copy), ConstantsModule (copy)
	local JoinDeepResult = DashModule.joinDeep({}, p5)
	
	if p5.productType == ConstantsModule.ProductType.CollectibleItem then
		local SaleLocation = JoinDeepResult.saleLocation
		local IsNotSaleLocationTypeIdMatch: boolean = SaleLocation and SaleLocation.saleLocationTypeId ~= ConstantsModule.SaleLocationType.ShopOnly
		local IsNotSaleLocationTypeIdMatch1: boolean = SaleLocation and SaleLocation.saleLocationTypeId ~= ConstantsModule.SaleLocationType.ShopAndExperiencesById
		local HasFoundIndex: boolean = SaleLocation and (SaleLocation.saleLocationTypeId == ConstantsModule.SaleLocationType.ShopAndExperiencesById and type(SaleLocation.universeIds) == "table" and table.find(SaleLocation.universeIds, game.GameId) ~= nil)
		local IsNotSaleLocationTypeIdMatch2: boolean = SaleLocation and SaleLocation.saleLocationTypeId ~= ConstantsModule.SaleLocationType.ExperiencesDevApiOnly
		JoinDeepResult.isForSale = JoinDeepResult.isForSale and (IsNotSaleLocationTypeIdMatch and (if IsNotSaleLocationTypeIdMatch1 then IsNotSaleLocationTypeIdMatch2 else HasFoundIndex and IsNotSaleLocationTypeIdMatch2))
		
		if not p5.collectibleIsLimited then
			JoinDeepResult.isForSale = JoinDeepResult.isForSale and not JoinDeepResult.owned
		end
	end
	return JoinDeepResult
end

return BundleInfoModule