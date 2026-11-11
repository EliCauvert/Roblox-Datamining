local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local ItemDataModule = require(Modules.AvatarExperience.Common.Selectors.ItemData)
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local _ = require(Modules.AvatarExperience.Common.Models.CollectibleInfo)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local _ = require(Modules.AvatarExperience.Common.Types)
local GetUseSelectorDeepEqualsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals
local FFlagAXAddHDRowInItemDetailsPage = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXAddHDRowInItemDetailsPage

return function(p1, p2)
	-- upvalues: UseSelectorFunction (copy), ItemDataModule (copy), GetUseSelectorDeepEqualsFunction (copy), CatalogUtilsModule (copy), ReactModule (copy), CatalogConstantsModule (copy), FFlagAXAddHDRowInItemDetailsPage (copy)
	local UseSelectorResult = UseSelectorFunction(function(p3)
		-- upvalues: ItemDataModule (upval), p1 (copy), p2 (copy)
		return ItemDataModule(p3.AvatarExperience.Common, p1, p2)
	end, GetUseSelectorDeepEqualsFunction())
	local CollectibleItemId = if UseSelectorResult then UseSelectorResult.collectibleItemId else nil
	local IsLimitedCollectible = CatalogUtilsModule.isLimitedCollectible(UseSelectorResult)
	local UseSelectorResult1 = UseSelectorFunction(ReactModule.useCallback(function(p3)
		-- upvalues: CollectibleItemId (copy)
		return if CollectibleItemId then p3.AvatarExperience.Common.Collectibles.CollectiblesItemInfo[CollectibleItemId] else nil
	end, { CollectibleItemId }), GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult2 = UseSelectorFunction(ReactModule.useCallback(function(p3)
		-- upvalues: IsLimitedCollectible (copy), CollectibleItemId (copy)
		return if IsLimitedCollectible and CollectibleItemId then p3.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances[CollectibleItemId] else nil
	end, { CollectibleItemId, IsLimitedCollectible }), GetUseSelectorDeepEqualsFunction())
	local IsResellable = CatalogUtilsModule.IsResellable(UseSelectorResult) or false
	local IsTradable = CatalogUtilsModule.getIsTradable(UseSelectorResult)
	local HasAttribution = CatalogUtilsModule.HasAttribution(UseSelectorResult)
	local QuantityLimitPerUser = 0
	local ShouldShowQuantityLimit = false
	local ReachQuantityLimitResult = false
	local HasResellers = if UseSelectorResult and UseSelectorResult.resellerUserAssetIds then #UseSelectorResult.resellerUserAssetIds > 0 else false
	local SoldCount = if UseSelectorResult and UseSelectorResult.soldCount then UseSelectorResult.soldCount else 0
	local TotalQuantity = if UseSelectorResult and UseSelectorResult.totalQuantity then UseSelectorResult.totalQuantity else 0
	local OriginalPrice = if UseSelectorResult and UseSelectorResult.originalPrice then UseSelectorResult.originalPrice else 0
	local AveragePrice = if UseSelectorResult and UseSelectorResult.averagePrice then UseSelectorResult.averagePrice else 0
	local None = CatalogConstantsModule.ResaleRestriction.None
	
	if UseSelectorResult1 then
		None = if UseSelectorResult1.resaleRestriction then UseSelectorResult1.resaleRestriction else CatalogConstantsModule.ResaleRestriction.None
		HasResellers = if UseSelectorResult1.hasResellers then UseSelectorResult1.hasResellers else false
		local AssetStock = UseSelectorResult1.assetStock or 0
		local UnitsAvailableForConsumption = UseSelectorResult1.unitsAvailableForConsumption or 0
		SoldCount = if AssetStock and UnitsAvailableForConsumption then AssetStock - UnitsAvailableForConsumption else 0
		OriginalPrice = UseSelectorResult1.price or 0
		AveragePrice = UseSelectorResult1.recentAveragePrice or 0
		TotalQuantity = UseSelectorResult1.assetStock or 0
		QuantityLimitPerUser = UseSelectorResult1.quantityLimitPerUser or 0
		ReachQuantityLimitResult = CatalogUtilsModule.reachQuantityLimit(UseSelectorResult1, UseSelectorResult2)
		ShouldShowQuantityLimit = CatalogUtilsModule.shouldShowQuantityLimit(QuantityLimitPerUser)
	end
	local IsHighDefinition = if FFlagAXAddHDRowInItemDetailsPage then UseSelectorResult and UseSelectorResult.isHighDefinition else nil
	
	return {
		averagePrice = AveragePrice,
		hasResellers = HasResellers,
		isResellable = IsResellable,
		hasAttribution = HasAttribution,
		isStockAvailable = SoldCount < TotalQuantity and CatalogUtilsModule.isOriginalStockSellableInShop(UseSelectorResult1),
		isTradable = IsTradable,
		itemStock = TotalQuantity,
		originalPrice = OriginalPrice,
		collectiblesResaleRestriction = None,
		quantityLimit = QuantityLimitPerUser,
		reachedQuantityLimit = ReachQuantityLimitResult,
		shouldShowQuantityLimit = ShouldShowQuantityLimit,
		soldCount = SoldCount,
		isHighDefinition = if FFlagAXAddHDRowInItemDetailsPage then IsHighDefinition else nil,
		isPBR = UseSelectorResult and UseSelectorResult.isPBR
	}
end