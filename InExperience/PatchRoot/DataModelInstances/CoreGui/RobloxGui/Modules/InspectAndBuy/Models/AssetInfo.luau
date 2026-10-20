local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local DashModule = require(CorePackages.Packages.Dash)
local FFlagAXMarketplaceLicensing = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXMarketplaceLicensing
local Parent = script.Parent.Parent
local MockIdModule = require(Parent.MockId)
local ConstantsModule = require(Parent.Constants)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceInspectAndBuy)
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local ItemRestrictions = AvatarExperienceCommonModule.Enums.ItemRestrictions
local GetRawItemLicensingInfoFunction = AvatarExperienceCommonModule.Utils.getRawItemLicensingInfo
local ParseItemLicensingFunction = AvatarExperienceCommonModule.Utils.parseItemLicensing
local GetFFlagIBEnableCollectiblesSystemSupportModule = require(Parent.Flags.GetFFlagIBEnableCollectiblesSystemSupport)

local function _(p1: number): number
	return math.round(p1 * 100) / 100
end

local AssetInfoModule = {
	new = function()
		return {}
	end
}

function AssetInfoModule.mock()
	-- upvalues: AssetInfoModule (copy), MockIdModule (copy), GetFFlagIBEnableCollectiblesSystemSupportModule (copy)
	local NewAssetInfo = AssetInfoModule.new()
	NewAssetInfo.name = ""
	NewAssetInfo.assetId = MockIdModule()
	NewAssetInfo.assetTypeId = ""
	NewAssetInfo.creatorId = ""
	NewAssetInfo.creatorName = ""
	NewAssetInfo.creatorHasVerifiedBadge = false
	NewAssetInfo.owned = false
	NewAssetInfo.isForSale = false
	NewAssetInfo.description = ""
	NewAssetInfo.price = ""
	NewAssetInfo.productId = ""
	NewAssetInfo.isLimited = false
	NewAssetInfo.isLimitedUnique = not GetFFlagIBEnableCollectiblesSystemSupportModule() and nil
	NewAssetInfo.collectibleIsLimited = not GetFFlagIBEnableCollectiblesSystemSupportModule() and nil
	NewAssetInfo.bundlesAssetIsIn = {}
	NewAssetInfo.parentBundleId = nil
	NewAssetInfo.numFavorites = 0
	NewAssetInfo.minimumMembershipLevel = 0
	NewAssetInfo.collectibleItemId = ""
	NewAssetInfo.collectibleProductId = ""
	NewAssetInfo.collectibleLowestResalePrice = 0
	NewAssetInfo.collectibleLowestAvailableResaleProductId = ""
	NewAssetInfo.collectibleLowestAvailableResaleItemInstanceId = ""
	NewAssetInfo.collectibleQuantityLimitPerUser = 0
	NewAssetInfo.remaining = 0
	NewAssetInfo.creatingUniverseId = nil
	
	return NewAssetInfo
end

function AssetInfoModule.fromBulkPurchaseResult(p1, p2)
	-- upvalues: AssetInfoModule (copy), ItemRestrictions (copy)
	local NewAssetInfo = AssetInfoModule.new()
	local ItemRestrictions1 = if p2 and p2.itemRestrictions then p2.itemRestrictions else {}
	NewAssetInfo.resellableCount = if p2 and p2.resellableCount then p2.resellableCount else 0
	
	if p1.status == Enum.MarketplaceItemPurchaseStatus.Success and p1.type == Enum.MarketplaceProductType.AvatarAsset then
		NewAssetInfo.owned = true
		
		if ItemRestrictions1[ItemRestrictions.Collectible] or ItemRestrictions1[ItemRestrictions.Limited] or ItemRestrictions1[ItemRestrictions.LimitedUnique] then
			NewAssetInfo.resellableCount += 1
		end
	end
	return NewAssetInfo
end

function AssetInfoModule.fromAvatarPreviewItem(p1)
	-- upvalues: AssetInfoModule (copy), FFlagAXMarketplaceLicensing (copy), ParseItemLicensingFunction (copy), GetRawItemLicensingInfoFunction (copy)
	local NewAssetInfo = AssetInfoModule.new()
	NewAssetInfo.name = p1.name
	NewAssetInfo.description = p1.description
	NewAssetInfo.price = p1.priceInRobux
	NewAssetInfo.productId = tostring(p1.productId)
	NewAssetInfo.collectibleItemId = p1.collectibleItemId
	NewAssetInfo.owned = p1.quantityOwned > 0
	NewAssetInfo.resellableCount = p1.quantityOwned
	NewAssetInfo.creatorId = tostring(p1.creator.id)
	NewAssetInfo.creatorName = p1.creator.name
	NewAssetInfo.creatorHasVerifiedBadge = p1.creator.hasVerifiedBadge
	NewAssetInfo.assetId = tostring(p1.id)
	NewAssetInfo.assetTypeId = tostring(p1.assetType)
	NewAssetInfo.productId = tostring(p1.productId)
	NewAssetInfo.isForSale = p1.isPurchasable
	NewAssetInfo.noPriceStatus = p1.noPriceStatus
	NewAssetInfo.meta = p1.meta
	
	if FFlagAXMarketplaceLicensing then
		NewAssetInfo.itemLicensingInfo = ParseItemLicensingFunction(GetRawItemLicensingInfoFunction(p1))
	end
	if p1.itemRestrictions then
		local ItemRestrictions = {}
		
		for _, itemRestriction in p1.itemRestrictions do
			ItemRestrictions[itemRestriction] = true
		end
		NewAssetInfo.itemRestrictions = ItemRestrictions
	end
	return NewAssetInfo
end

function AssetInfoModule.fromGetProductInfo(p2)
	-- upvalues: AssetInfoModule (copy), ConstantsModule (copy), GetFFlagIBEnableCollectiblesSystemSupportModule (copy)
	local NewAssetInfo = AssetInfoModule.new()
	NewAssetInfo.name = p2.Name
	NewAssetInfo.description = p2.Description
	NewAssetInfo.price = p2.PriceInRobux
	NewAssetInfo.productType = p2.ProductType
	NewAssetInfo.remaining = p2.Remaining
	NewAssetInfo.creatorId = tostring(p2.Creator.Id)
	NewAssetInfo.creatorName = p2.Creator.Name
	NewAssetInfo.assetId = tostring(p2.AssetId)
	NewAssetInfo.assetTypeId = tostring(p2.AssetTypeId)
	NewAssetInfo.productId = tostring(p2.ProductId)
	NewAssetInfo.isForSale = p2.IsForSale
	NewAssetInfo.canBeSoldInThisGame = p2.CanBeSoldInThisGame
	NewAssetInfo.saleLocation = p2.SaleLocation
	NewAssetInfo.remaining = p2.Remaining or 0
	
	if NewAssetInfo.productType == ConstantsModule.ProductType.CollectibleItem then
		NewAssetInfo.collectibleItemId = p2.CollectibleItemId or ""
		NewAssetInfo.collectibleProductId = p2.CollectibleProductId or ""
		
		if p2.CollectiblesItemDetails then
			NewAssetInfo.collectibleLowestResalePrice = p2.CollectiblesItemDetails.CollectibleLowestResalePrice or 0
			NewAssetInfo.collectibleLowestAvailableResaleProductId = p2.CollectiblesItemDetails.CollectibleLowestAvailableResaleProductId or ""
			NewAssetInfo.collectibleLowestAvailableResaleItemInstanceId = p2.CollectiblesItemDetails.CollectibleLowestAvailableResaleItemInstanceId or ""
			NewAssetInfo.collectibleQuantityLimitPerUser = p2.CollectiblesItemDetails.CollectibleQuantityLimitPerUser or 0
			NewAssetInfo.collectibleIsLimited = p2.CollectiblesItemDetails.IsLimited
		end
	end
	NewAssetInfo.creatorHasVerifiedBadge = p2.Creator.HasVerifiedBadge
	
	if GetFFlagIBEnableCollectiblesSystemSupportModule() then
		NewAssetInfo.isLimited = p2.IsLimited
		NewAssetInfo.isLimitedUnique = p2.IsLimitedUnique
		
		return NewAssetInfo
	else
		NewAssetInfo.isLimited = p2.IsLimited or p2.IsLimitedUnique
		
		return NewAssetInfo
	end
end

function AssetInfoModule.fromHumanoidDescription(p2)
	-- upvalues: AssetInfoModule (copy)
	local NewAssetInfo = AssetInfoModule.new()
	NewAssetInfo.assetId = tostring(p2)
	
	return NewAssetInfo
end

function AssetInfoModule.fromHumanoidDescriptionAccessory(p2)
	-- upvalues: AssetInfoModule (copy)
	local NewAssetInfo = AssetInfoModule.new()
	NewAssetInfo.assetId = tostring(p2.AssetId)
	NewAssetInfo.meta = {}
	NewAssetInfo.meta.position = {
		x = math.round(p2.Position.X * 100) / 100,
		y = math.round(p2.Position.Y * 100) / 100,
		z = math.round(p2.Position.Z * 100) / 100
	}
	NewAssetInfo.meta.rotation = {
		x = math.round(p2.Rotation.X * 100) / 100,
		y = math.round(p2.Rotation.Y * 100) / 100,
		z = math.round(p2.Rotation.Z * 100) / 100
	}
	NewAssetInfo.meta.scale = {
		x = math.round(p2.Scale.X * 100) / 100,
		y = math.round(p2.Scale.Y * 100) / 100,
		z = math.round(p2.Scale.Z * 100) / 100
	}
	
	if p2.IsLayered then
		NewAssetInfo.meta.order = p2.Order
	end
	return NewAssetInfo
end

function AssetInfoModule.fromGetAssetBundles(p2, BundlesAssetIsIn)
	-- upvalues: AssetInfoModule (copy)
	local NewAssetInfo = AssetInfoModule.new()
	NewAssetInfo.assetId = tostring(p2)
	NewAssetInfo.bundlesAssetIsIn = BundlesAssetIsIn
	
	return NewAssetInfo
end

function AssetInfoModule.fromGetFavoriteForAsset(p2, IsFavorited)
	-- upvalues: AssetInfoModule (copy)
	local NewAssetInfo = AssetInfoModule.new()
	NewAssetInfo.assetId = tostring(p2)
	NewAssetInfo.isFavorited = IsFavorited
	
	return NewAssetInfo
end

function AssetInfoModule.fromBundleInfo(p2, p3)
	-- upvalues: AssetInfoModule (copy), ConstantsModule (copy)
	local NewAssetInfo = AssetInfoModule.new()
	NewAssetInfo.assetId = tostring(p2)
	NewAssetInfo.parentBundleId = p3.bundleId
	NewAssetInfo.bundlesAssetIsIn = { p3.bundleId }
	NewAssetInfo.collectibleItemId = p3.collectibleItemId
	NewAssetInfo.collectibleProductId = p3.collectibleProductId
	NewAssetInfo.collectibleLowestResalePrice = p3.collectibleLowestResalePrice
	NewAssetInfo.collectibleLowestAvailableResaleProductId = p3.collectibleLowestAvailableResaleProductId
	NewAssetInfo.collectibleLowestAvailableResaleItemInstanceId = p3.collectibleLowestAvailableResaleItemInstanceId
	NewAssetInfo.collectibleQuantityLimitPerUser = p3.collectibleQuantityLimitPerUser
	NewAssetInfo.collectibleIsLimited = p3.collectibleIsLimited
	NewAssetInfo.isForSale = p3.isForSale
	NewAssetInfo.remaining = p3.remaining
	NewAssetInfo.owned = p3.owned
	
	if not NewAssetInfo.collectibleIsLimited then
		NewAssetInfo.isForSale = NewAssetInfo.isForSale and not NewAssetInfo.owned
	end
	NewAssetInfo.description = p3.description or ""
	NewAssetInfo.productType = ConstantsModule.ProductType.CollectibleItem
	
	if p3.price then
		NewAssetInfo.price = p3.price
	end
	return NewAssetInfo
end

function AssetInfoModule.fromGetAssetFavoriteCount(p2, NumFavorites)
	-- upvalues: AssetInfoModule (copy)
	local NewAssetInfo = AssetInfoModule.new()
	NewAssetInfo.assetId = tostring(p2)
	NewAssetInfo.numFavorites = NumFavorites
	
	return NewAssetInfo
end

function AssetInfoModule.fromGetEconomyProductInfo(p2, Owned, Price, IsForSale, PremiumPricing)
	-- upvalues: AssetInfoModule (copy)
	local NewAssetInfo = AssetInfoModule.new()
	NewAssetInfo.assetId = tostring(p2.assetId)
	NewAssetInfo.owned = Owned
	
	if Price then
		NewAssetInfo.price = Price
	end
	NewAssetInfo.isForSale = IsForSale
	NewAssetInfo.premiumPricing = PremiumPricing
	
	return NewAssetInfo
end

function AssetInfoModule.fromGetItemDetailsV2(p2)
	-- upvalues: AssetInfoModule (copy), GetRawItemLicensingInfoFunction (copy), FFlagAXMarketplaceLicensing (copy), ParseItemLicensingFunction (copy), CryoModule (copy)
	local NewAssetInfo = AssetInfoModule.new()
	NewAssetInfo.assetId = tostring(p2.id)
	NewAssetInfo.isForSale = p2.isPurchasable
	NewAssetInfo.price = p2.price or 0
	NewAssetInfo.hasResellers = p2.hasResellers
	NewAssetInfo.collectibleItemId = p2.collectibleItemId
	local ItemRestrictions = {}
	
	if p2.itemRestrictions then
		for _, itemRestriction in p2.itemRestrictions do
			ItemRestrictions[itemRestriction] = true
		end
		NewAssetInfo.itemRestrictions = ItemRestrictions
	end
	NewAssetInfo.saleLocationType = p2.saleLocationType
	NewAssetInfo.remaining = p2.unitsAvailableForConsumption
	NewAssetInfo.collectibleTotalQuantity = p2.totalQuantity
	NewAssetInfo.collectibleLowestResalePrice = p2.lowestResalePrice
	NewAssetInfo.isOffSale = p2.isOffSale
	NewAssetInfo.saleLocationType = p2.saleLocationType
	NewAssetInfo.numFavorites = p2.favoriteCount
	NewAssetInfo.catalogPriceStatus = p2.priceStatus
	NewAssetInfo.timedOptions = p2.timedOptions
	local RawItemLicensingInfo = GetRawItemLicensingInfoFunction(p2)
	
	if FFlagAXMarketplaceLicensing and RawItemLicensingInfo ~= nil then
		NewAssetInfo.itemLicensingInfo = ParseItemLicensingFunction(RawItemLicensingInfo) or CryoModule.None
	end
	return NewAssetInfo
end

function AssetInfoModule.fromGetItemDetails(p3)
	-- upvalues: AssetInfoModule (copy)
	local NewAssetInfo = AssetInfoModule.new()
	NewAssetInfo.assetId = tostring(p3.Id)
	NewAssetInfo.owned = p3.Owned
	NewAssetInfo.isForSale = p3.IsPurchasable
	NewAssetInfo.price = p3.Price or 0
	NewAssetInfo.hasResellers = p3.HasResellers
	NewAssetInfo.collectibleItemId = p3.CollectibleItemId
	local ItemRestrictions = {}
	
	if p3.ItemRestrictions then
		for _, itemRestriction in p3.ItemRestrictions do
			ItemRestrictions[itemRestriction] = true
		end
		NewAssetInfo.itemRestrictions = ItemRestrictions
	end
	NewAssetInfo.saleLocationType = p3.SaleLocationType
	NewAssetInfo.remaining = p3.UnitsAvailableForConsumption
	NewAssetInfo.collectibleTotalQuantity = p3.TotalQuantity
	NewAssetInfo.collectibleLowestResalePrice = p3.LowestResalePrice
	NewAssetInfo.isOffSale = p3.IsOffSale
	NewAssetInfo.saleLocationType = p3.SaleLocationType
	NewAssetInfo.numFavorites = p3.FavoriteCount
	NewAssetInfo.catalogPriceStatus = p3.PriceStatus
	NewAssetInfo.creatingUniverseId = p3.CreatingUniverseId
	
	return NewAssetInfo
end

function AssetInfoModule.fromPurchaseSuccess(p4)
	-- upvalues: AssetInfoModule (copy)
	local NewAssetInfo = AssetInfoModule.new()
	NewAssetInfo.assetId = tostring(p4)
	NewAssetInfo.owned = true
	
	return NewAssetInfo
end

function AssetInfoModule.fromGetVersionInfo(p4, p5)
	-- upvalues: AssetInfoModule (copy)
	local NewAssetInfo = AssetInfoModule.new()
	NewAssetInfo.assetId = tostring(p4)
	NewAssetInfo.creatingUniverseId = if p5.creatingUniverseId then tostring(p5.creatingUniverseId) else nil
	
	return NewAssetInfo
end

function AssetInfoModule.getSaleDetailsForCollectibles(p4)
	-- upvalues: DashModule (copy), ConstantsModule (copy)
	local JoinDeepResult = DashModule.joinDeep({}, p4)
	local SaleLocation = p4.saleLocation
	
	if p4.productType == ConstantsModule.ProductType.CollectibleItem then
		local IsNotSaleLocationTypeMatch: boolean = SaleLocation and SaleLocation.SaleLocationType ~= ConstantsModule.SaleLocationType.ShopOnly
		local IsNotSaleLocationTypeMatch1: boolean = SaleLocation and SaleLocation.SaleLocationType ~= ConstantsModule.SaleLocationType.ShopAndExperiencesById
		local HasFoundIndex: boolean = SaleLocation and (SaleLocation.SaleLocationType == ConstantsModule.SaleLocationType.ShopAndExperiencesById and type(SaleLocation.UniverseIds) == "table" and table.find(SaleLocation.UniverseIds, game.GameId) ~= nil)
		local IsNotSaleLocationTypeMatch2: boolean = SaleLocation and SaleLocation.SaleLocationType ~= ConstantsModule.SaleLocationType.ExperiencesDevApiOnly
		JoinDeepResult.isForSale = p4.isForSale and (p4.canBeSoldInThisGame and (IsNotSaleLocationTypeMatch and (if IsNotSaleLocationTypeMatch1 then IsNotSaleLocationTypeMatch2 else HasFoundIndex and IsNotSaleLocationTypeMatch2)))
		
		if not p4.collectibleIsLimited then
			JoinDeepResult.isForSale = JoinDeepResult.isForSale and not JoinDeepResult.owned
			
			return JoinDeepResult
		end
	else
		JoinDeepResult.isForSale = p4.isForSale and p4.canBeSoldInThisGame
		
		if p4.canBeSoldInThisGame == nil then
			JoinDeepResult.isForSale = p4.isForSale
		end
	end
	return JoinDeepResult
end

return AssetInfoModule