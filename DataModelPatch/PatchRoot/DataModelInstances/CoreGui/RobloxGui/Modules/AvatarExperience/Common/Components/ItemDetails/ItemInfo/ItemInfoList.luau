local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagDynamicHeadsMigration = AvatarExperienceFlagsModule.FFlagDynamicHeadsMigration
local ReactModule = require(CorePackages.Packages.React)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local NumberLocalization = require(CorePackages.Workspace.Packages.Localization).NumberLocalization
local ProfileTypes = require(CorePackages.Workspace.Packages.ProfilePlatform.Enums).ProfileTypes
local EnableCommunityProfilePageIXPModule = require(CorePackages.Workspace.Packages.ProfilePlatform.EnableCommunityProfilePageIXP)
local ItemDataModule = require(Modules.AvatarExperience.Common.Selectors.ItemData)
local AttributionItemInfoRowModule = require(Modules.AvatarExperience.Common.Components.ItemDetails.ItemInfo.AttributionItemInfoRow)
local ItemInfoRowModule = require(Modules.AvatarExperience.Common.Components.ItemDetails.ItemInfo.ItemInfoRow)
local UseItemDataDigestModule = require(Modules.AvatarExperience.Catalog.Hooks.useItemDataDigest)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local FetchAssetResaleDataModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchAssetResaleData)
local FetchAssetVersionDataModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchAssetVersionData)
local _ = require(Modules.AvatarExperience.Common.Models.CollectibleInfo)
local UrlBuilderModule = require(Modules.LuaApp.Http.UrlBuilder)
local AppPageModule = require(Modules.LuaApp.AppPage)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local RoactLocalizationModule = require(Modules.LuaApp.Services.RoactLocalization)
local UseLocalizationModule = require(Modules.LuaApp.Hooks.useLocalization)
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local UseAppPolicyModule = require(Modules.LuaApp.Hooks.useAppPolicy)
local UseItemDataHookRefactor = game:DefineFastFlag("UseItemDataHookRefactor", false)
local _ = require(Modules.AvatarExperience.Common.Types)
local GetUseSelectorDeepEqualsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals
local FixNavigationToCreatorProfileWebviewFromProfile = game:DefineFastFlag("FixNavigationToCreatorProfileWebviewFromProfile", false)
local FFlagAXAddHDRowInItemDetailsPage = AvatarExperienceFlagsModule.FFlagAXAddHDRowInItemDetailsPage
local FFlagAXFixCollectibleOriginalPriceModule = require(Modules.AvatarExperience.Flags.FFlagAXFixCollectibleOriginalPrice)
local AXFixMissingResalePrice = game:DefineFastFlag("AXFixMissingResalePrice", false)
local FFlagAXDurables2Option = AvatarExperienceFlagsModule.FFlagAXDurables2Option
local GetTaxonomyNameModule = require(Modules.AvatarExperience.Common.Selectors.getTaxonomyName)
local GetEquipSlotForAssetTypeModule = require(Modules.AvatarExperience.Common.Selectors.getEquipSlotForAssetType)

local function _(p1, p2)
	-- upvalues: NumberLocalization (copy)
	return if p1 then NumberLocalization.localize(p1, p2:GetLocale()) else nil
end

local _ = function(p1, p2)
	local CollectibleProductId = if p1 then p1.collectibleProductId elseif p2 and p2.product then p2.product.id else nil
	
	if p1 then
		return CollectibleProductId, p1.creator
	elseif p2 then
		return CollectibleProductId, p2.creator
	else
		return CollectibleProductId, nil
	end
end

local _ = function(p1, p2)
	return if p2 then p2.creatingUniverseId elseif p1 then p1.creatingUniverseId else nil
end

local function getGameJoinContext(ItemType, AssetId, ItemSubType, OutfitInfo)
	-- upvalues: ConstantsModule (copy), UtilsModule (copy)
	return if OutfitInfo then {
		outfitId = OutfitInfo.outfitId,
		itemType = Enum.AvatarItemType.Bundle,
		joinSource = Enum.JoinSource.CreatedItemAttribution
	} else {
		assetId = AssetId,
		itemType = if ItemType then Enum.AvatarItemType[ItemType] else nil,
		assetType = if ItemType == ConstantsModule.ItemType.Asset and ItemSubType then UtilsModule.AssetTypeIdStringToEnumValue(ItemSubType) else nil,
		joinSource = Enum.JoinSource.CreatedItemAttribution
	}
end

local _ = function()
	-- upvalues: Players (copy)
	local LocalPlayer = Players.LocalPlayer
	
	return LocalPlayer and LocalPlayer.Name or ""
end

return (ReactModule.forwardRef(function(Frame, _)
	-- upvalues: UseSelectorFunction (copy), ItemDataModule (copy), GetUseSelectorDeepEqualsFunction (copy), CatalogUtilsModule (copy), AXFixMissingResalePrice (copy), UseAppPolicyModule (copy), ReactModule (copy), CatalogConstantsModule (copy), UseItemDataHookRefactor (copy), UseDispatchFunction (copy), UseNavigationFunction (copy), UseRoactServiceModule (copy), RoactNetworkingModule (copy), EnableCommunityProfilePageIXPModule (copy), AppPageModule (copy), ProfileTypes (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy), UrlBuilderModule (copy), FixNavigationToCreatorProfileWebviewFromProfile (copy), AvatarScreen (copy), ConstantsModule (copy), GetTaxonomyNameModule (copy), GetEquipSlotForAssetTypeModule (copy), RoactLocalizationModule (copy), NumberLocalization (copy), UseLocalizationModule (copy), FFlagAXDurables2Option (copy), FFlagAXFixCollectibleOriginalPriceModule (copy), UseItemDataDigestModule (copy), FFlagAXAddHDRowInItemDetailsPage (copy), FetchAssetResaleDataModule (copy), FetchAssetVersionDataModule (copy), getGameJoinContext (copy), Players (copy), FFlagDynamicHeadsMigration (copy), AttributionItemInfoRowModule (copy), ItemInfoRowModule (copy), Focusable (copy)
	local CollectibleItemId = nil
	local v1 = nil
	local IsLimitedCollectible = nil
	local IsResellable = nil
	local Id = nil
	local Type = nil
	local ItemSubType = nil
	local UseSelectorResult = UseSelectorFunction(function(p1)
		-- upvalues: ItemDataModule (upval), Frame (copy)
		return ItemDataModule(p1.AvatarExperience.Common, Frame.itemId, Frame.itemType)
	end, GetUseSelectorDeepEqualsFunction())
	;(function()
		-- upvalues: UseSelectorResult (copy), CollectibleItemId (ref), v1 (ref), Id (ref), Type (ref), ItemSubType (ref), CatalogUtilsModule (upval), Frame (copy), IsLimitedCollectible (ref), AXFixMissingResalePrice (upval), IsResellable (ref)
		if UseSelectorResult then
			CollectibleItemId = UseSelectorResult.collectibleItemId
			local ResellerUserAssetIds = UseSelectorResult.resellerUserAssetIds
			v1 = ResellerUserAssetIds and (#ResellerUserAssetIds > 0 and ResellerUserAssetIds[1])
			Id = if UseSelectorResult.creator then UseSelectorResult.creator.id else nil
			Type = if UseSelectorResult.creator then UseSelectorResult.creator.type else nil
			ItemSubType = CatalogUtilsModule.GetItemSubType(Frame.itemType, UseSelectorResult)
			IsLimitedCollectible = if AXFixMissingResalePrice then nil else CatalogUtilsModule.isLimitedCollectible(UseSelectorResult)
			IsResellable = if AXFixMissingResalePrice then CatalogUtilsModule.IsResellable(UseSelectorResult) else nil
		end
	end)()
	local UseAppPolicyModuleResult = UseAppPolicyModule(function(p1)
		return p1.getWebViewSupport()
	end)
	local UseSelectorResult1 = UseSelectorFunction((ReactModule.useCallback(function(p1)
		-- upvalues: CollectibleItemId (ref)
		return if CollectibleItemId then p1.AvatarExperience.Common.Collectibles.CollectiblesItemInfo[CollectibleItemId] else nil
	end, { CollectibleItemId })))
	
	if UseAppPolicyModule(function(p1)
		return p1.getDisableResellingCollectiblesForCompliance()
	end) and UseSelectorResult1 then
		UseSelectorResult1.resaleRestriction = CatalogConstantsModule.ResaleRestriction.Disabled
	end
	local UseResult = ReactModule.useCallback(function(p1)
		-- upvalues: AXFixMissingResalePrice (upval), IsResellable (ref), IsLimitedCollectible (ref), CollectibleItemId (ref)
		return if (if AXFixMissingResalePrice then IsResellable else IsLimitedCollectible) and CollectibleItemId then p1.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances[CollectibleItemId] else nil
	end, {
		CollectibleItemId,
		if AXFixMissingResalePrice then IsResellable else IsLimitedCollectible
	})
	local UseSelectorResult2 = if UseItemDataHookRefactor then nil else UseSelectorFunction(UseResult, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult3 = UseSelectorFunction(function(p1)
		return p1.UserRobux[p1.LocalUserId]
	end, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult4 = UseSelectorFunction(function(p1)
		-- upvalues: CollectibleItemId (ref), AXFixMissingResalePrice (upval), IsResellable (ref), IsLimitedCollectible (ref), v1 (ref)
		if CollectibleItemId then
			if if AXFixMissingResalePrice then IsResellable else IsLimitedCollectible then
				local CollectiblesResellersInstance = p1.AvatarExperience.Common.Collectibles.CollectiblesResellersInstances[CollectibleItemId]
				local InstanceIds = CollectiblesResellersInstance and (#CollectiblesResellersInstance.InstanceIdsList > 0 and CollectiblesResellersInstance.InstanceIdsList[1])
				local InstancesEntry = if InstanceIds then CollectiblesResellersInstance.Instances[InstanceIds] else nil
				
				return if InstancesEntry then InstancesEntry.price else nil
			else
				return nil
			end
		elseif v1 then
			local UserAsset = p1.AvatarExperience.Catalog.UserAssets[v1]
			
			return if UserAsset then UserAsset.priceInRobux else nil
		else
			return nil
		end
	end, GetUseSelectorDeepEqualsFunction())
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(RoactNetworkingModule)
	local UseIsFeatureActiveResult = if EnableCommunityProfilePageIXPModule.FFlagIsSetupEnabled then EnableCommunityProfilePageIXPModule.useIsFeatureActive({ isExposureEnabled = false }) else nil
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: Id (ref), EnableCommunityProfilePageIXPModule (upval), Type (ref), CatalogConstantsModule (upval), UseIsFeatureActiveResult (copy), AppPageModule (upval), ProfileTypes (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownModule (upval), UrlBuilderModule (upval), FixNavigationToCreatorProfileWebviewFromProfile (upval), UseNavigationResult (copy)
		if Id then
			if EnableCommunityProfilePageIXPModule.FFlagIsSetupEnabled and Type == CatalogConstantsModule.CreatorType.Group then
				EnableCommunityProfilePageIXPModule.logExposure()
			end
			if not EnableCommunityProfilePageIXPModule.FFlagIsSetupEnabled or not UseIsFeatureActiveResult then
				local GroupResult = if Type == CatalogConstantsModule.CreatorType.Group then UrlBuilderModule.user.group({ groupId = Id }) else UrlBuilderModule.user.profile({ userId = Id })
				
				if FixNavigationToCreatorProfileWebviewFromProfile then
					local config = {
						name = AppPageModule.GenericWebPage,
						detail = GroupResult,
						extraProps = { titleKey = "CommonUI.Features.Label.Profile" }
					}
					
					if FFlagSignalsNavP3Dispatch then
						NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
						
						return
					else
						UseDispatchResult(NavigateDownModule(config))
						
						return
					end
				else
					UseNavigationResult.navigate(AppPageModule.GenericWebPage, {
						detail = GroupResult,
						extraProps = { titleKey = "CommonUI.Features.Label.Profile" }
					})
				end
			elseif Type == CatalogConstantsModule.CreatorType.Group then
				local config = {
					name = AppPageModule.ProfilePlatform,
					detail = Id,
					extraProps = {
						source = "ItemDetailsPage",
						profileType = ProfileTypes.Community
					}
				}
				
				if FFlagSignalsNavP3Dispatch then
					NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
					
					return
				else
					UseDispatchResult(NavigateDownModule(config))
					
					return
				end
			elseif Type == CatalogConstantsModule.CreatorType.User then
				local config = {
					name = AppPageModule.ProfilePlatform,
					detail = Id,
					extraProps = {
						source = "ItemDetailsPage",
						profileType = ProfileTypes.User
					}
				}
				
				if FFlagSignalsNavP3Dispatch then
					NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
					
					return
				else
					UseDispatchResult(NavigateDownModule(config))
					
					return
				end
			else
				local config1 = {
					name = AppPageModule.GenericWebPage,
					detail = UrlBuilderModule.user.profile({ userId = Id }),
					extraProps = { titleKey = "CommonUI.Features.Label.Profile" }
				}
				
				if FFlagSignalsNavP3Dispatch then
					NavigationCommands.down(NavigationCommands.fromLegacyPage(config1))
					
					return
				else
					UseDispatchResult(NavigateDownModule(config1))
					
					return
				end
			end
		end
	end, {
		Id,
		Type,
		if EnableCommunityProfilePageIXPModule.FFlagIsSetupEnabled then UseIsFeatureActiveResult else nil
	})
	local UseResult11 = ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy), AvatarScreen (upval), Frame (copy), CollectibleItemId (ref)
		UseNavigationResult.navigate(AvatarScreen.ResellersPage, {
			itemId = Frame.itemId,
			collectibleItemId = CollectibleItemId,
			itemType = Frame.itemType,
			fromContentFeed = UseNavigationResult.getParam("fromContentFeed"),
			fromProfile = UseNavigationResult.getParam("fromProfile")
		})
	end, {
		UseNavigationResult, Frame.itemId, UseSelectorResult, Frame.itemType,
		UseNavigationResult.getParam("fromContentFeed"),
		UseNavigationResult.getParam("fromProfile")
	})
	local AssetCategoriesLocalizedEntry = nil
	local AssetTypeLocalizedEntry = nil
	
	if Frame.itemType == ConstantsModule.ItemType.Asset then
		AssetCategoriesLocalizedEntry = ConstantsModule.AssetCategoriesLocalized[ConstantsModule.AssetTypeIdToCategory[ItemSubType]]
		AssetTypeLocalizedEntry = ConstantsModule.AssetTypeLocalized[ItemSubType]
	end
	local TaxonomyNameModule = if UseSelectorResult then GetTaxonomyNameModule(UseSelectorResult.taxonomy) else nil
	local EquipSlotForAssetTypeModule = if ItemSubType then GetEquipSlotForAssetTypeModule(Frame.itemType, ItemSubType) else nil
	local UseRoactServiceModuleResult1 = UseRoactServiceModule(RoactLocalizationModule)
	local UseLocalizationModuleResult = UseLocalizationModule({
		bundle = "Feature.Catalog.Label.Bundle",
		yesText = "Feature.Catalog.Label.Yes",
		noText = "Feature.Catalog.Label.No",
		isPBR = "Feature.Catalog.Label.PBR.true",
		notPBR = "Feature.Catalog.Label.PBR.false",
		noneText = "Feature.Catalog.Label.None",
		category = AssetCategoriesLocalizedEntry,
		subType = AssetTypeLocalizedEntry,
		threeDays = if FFlagAXDurables2Option then {
			"Feature.Durables.ItemDetails.WearTimeOptions.Button.XDays",
			num = 3
		} else nil,
		fromResalePrice = {
			"Feature.Catalog.Label.FromPrice",
			itemPrice = CatalogConstantsModule.RobloxEmoji.Robux .. (if UseSelectorResult4 then NumberLocalization.localize(UseSelectorResult4, UseRoactServiceModuleResult1:GetLocale()) else "")
		},
		priceUnavailableText = if FFlagAXFixCollectibleOriginalPriceModule then "Feature.Catalog.Label.NA" else nil,
		placementCategory = if EquipSlotForAssetTypeModule then EquipSlotForAssetTypeModule.categoryKey else nil,
		placementSlot = if EquipSlotForAssetTypeModule then EquipSlotForAssetTypeModule.slotKey else nil
	})
	local PlacementCategory = nil
	
	if EquipSlotForAssetTypeModule then
		if UseLocalizationModuleResult.placementCategory and UseLocalizationModuleResult.placementSlot then
			PlacementCategory = `{UseLocalizationModuleResult.placementCategory} | {UseLocalizationModuleResult.placementSlot}`
		elseif UseLocalizationModuleResult.placementCategory then
			PlacementCategory = UseLocalizationModuleResult.placementCategory
		end
	end
	local _ = nil
	local TaxonomyNameModule1 = if TaxonomyNameModule then TaxonomyNameModule elseif Frame.itemType == ConstantsModule.ItemType.Asset and UseLocalizationModuleResult.category and UseLocalizationModuleResult.subType then `{UseLocalizationModuleResult.category} | {UseLocalizationModuleResult.subType}` elseif Frame.itemType == ConstantsModule.ItemType.Bundle then UseLocalizationModuleResult.bundle else ""
	local IsTradable = nil
	local HasAttribution: boolean? = nil
	local ShouldShowQuantityLimit = nil
	local ReachQuantityLimitResult = nil
	local HasResellers = nil
	local IsOriginalStockSellableInShop = nil
	local SoldCount = nil
	local AssetStock = nil
	local Price = nil
	local RecentAveragePrice = nil
	local QuantityLimitPerUser = nil
	local ResaleRestriction = nil
	local Flag = false
	local IsHighDefinition = nil
	local IsPBR = nil;
	(function()
		-- upvalues: UseItemDataHookRefactor (upval), UseItemDataDigestModule (upval), Frame (copy), IsResellable (ref), IsTradable (ref), HasAttribution (ref), ShouldShowQuantityLimit (ref), ReachQuantityLimitResult (ref), HasResellers (ref), SoldCount (ref), AssetStock (ref), Price (ref), RecentAveragePrice (ref), QuantityLimitPerUser (ref), IsOriginalStockSellableInShop (ref), ResaleRestriction (ref), IsHighDefinition (ref), FFlagAXAddHDRowInItemDetailsPage (upval), IsPBR (ref), AXFixMissingResalePrice (upval), CatalogUtilsModule (upval), UseSelectorResult (copy), UseSelectorResult1 (copy), CatalogConstantsModule (upval), FFlagAXFixCollectibleOriginalPriceModule (upval), UseSelectorResult2 (copy), CollectibleItemId (ref), Flag (ref)
		if UseItemDataHookRefactor then
			local UseItemDataDigestModuleResult = UseItemDataDigestModule(Frame.itemId, Frame.itemType)
			IsResellable = UseItemDataDigestModuleResult.isResellable
			IsTradable = UseItemDataDigestModuleResult.isTradable
			HasAttribution = UseItemDataDigestModuleResult.hasAttribution
			ShouldShowQuantityLimit = UseItemDataDigestModuleResult.shouldShowQuantityLimit
			ReachQuantityLimitResult = UseItemDataDigestModuleResult.reachedQuantityLimit
			HasResellers = UseItemDataDigestModuleResult.hasResellers
			SoldCount = UseItemDataDigestModuleResult.soldCount
			AssetStock = UseItemDataDigestModuleResult.itemStock
			Price = UseItemDataDigestModuleResult.originalPrice
			RecentAveragePrice = UseItemDataDigestModuleResult.averagePrice
			QuantityLimitPerUser = UseItemDataDigestModuleResult.quantityLimit
			IsOriginalStockSellableInShop = UseItemDataDigestModuleResult.isStockAvailable
			ResaleRestriction = UseItemDataDigestModuleResult.collectiblesResaleRestriction
			IsHighDefinition = if FFlagAXAddHDRowInItemDetailsPage then UseItemDataDigestModuleResult.isHighDefinition else nil
			IsPBR = UseItemDataDigestModuleResult.isPBR
		else
			if not AXFixMissingResalePrice then
				IsResellable = CatalogUtilsModule.IsResellable(UseSelectorResult)
			end
			IsTradable = CatalogUtilsModule.getIsTradable(UseSelectorResult)
			HasAttribution = CatalogUtilsModule.HasAttribution(UseSelectorResult)
			QuantityLimitPerUser = 0
			ShouldShowQuantityLimit = false
			ReachQuantityLimitResult = false
			HasResellers = if UseSelectorResult and UseSelectorResult.resellerUserAssetIds then #UseSelectorResult.resellerUserAssetIds > 0 else false
			SoldCount = if UseSelectorResult and UseSelectorResult.soldCount then UseSelectorResult.soldCount else 0
			AssetStock = if UseSelectorResult and UseSelectorResult.totalQuantity then UseSelectorResult.totalQuantity else 0
			Price = if UseSelectorResult and UseSelectorResult.originalPrice then UseSelectorResult.originalPrice else 0
			RecentAveragePrice = if UseSelectorResult and UseSelectorResult.averagePrice then UseSelectorResult.averagePrice else 0
			IsHighDefinition = if FFlagAXAddHDRowInItemDetailsPage and UseSelectorResult then UseSelectorResult.isHighDefinition else nil
			IsPBR = if UseSelectorResult then UseSelectorResult.isPBR else nil
			
			if UseSelectorResult1 then
				ResaleRestriction = if UseSelectorResult1.resaleRestriction then UseSelectorResult1.resaleRestriction else CatalogConstantsModule.ResaleRestriction.None
				HasResellers = if UseSelectorResult1.hasResellers then UseSelectorResult1.hasResellers else false
				local AssetStock1 = UseSelectorResult1.assetStock or 0
				local UnitsAvailableForConsumption = UseSelectorResult1.unitsAvailableForConsumption or 0
				SoldCount = if AssetStock1 and UnitsAvailableForConsumption then AssetStock1 - UnitsAvailableForConsumption else 0
				Price = if FFlagAXFixCollectibleOriginalPriceModule then UseSelectorResult1.price else UseSelectorResult1.price or 0
				RecentAveragePrice = UseSelectorResult1.recentAveragePrice or 0
				AssetStock = UseSelectorResult1.assetStock or 0
				QuantityLimitPerUser = UseSelectorResult1.quantityLimitPerUser or 0
				ReachQuantityLimitResult = CatalogUtilsModule.reachQuantityLimit(UseSelectorResult1, UseSelectorResult2)
				ShouldShowQuantityLimit = CatalogUtilsModule.shouldShowQuantityLimit(QuantityLimitPerUser)
			end
			IsOriginalStockSellableInShop = SoldCount < AssetStock
			IsOriginalStockSellableInShop = IsOriginalStockSellableInShop and CatalogUtilsModule.isOriginalStockSellableInShop(UseSelectorResult1)
		end
		if IsResellable and UseSelectorResult and not CollectibleItemId then
			Flag = true
		end
	end)()
	
	if Frame.outfitInfo then
		HasAttribution = Frame.outfitInfo.creatingUniverseId ~= nil
	end
	local SoldCount1 = SoldCount
	local LocalizeResult = if SoldCount1 then NumberLocalization.localize(SoldCount1, UseRoactServiceModuleResult1:GetLocale()) else nil
	local AssetStock1 = AssetStock
	local LocalizeResult1 = if AssetStock1 then NumberLocalization.localize(AssetStock1, UseRoactServiceModuleResult1:GetLocale()) else nil
	local OriginalPrice = Price
	local LocalizeResult2 = if OriginalPrice then NumberLocalization.localize(OriginalPrice, UseRoactServiceModuleResult1:GetLocale()) else nil
	local CollectibleProductId = if UseSelectorResult1 then UseSelectorResult1.collectibleProductId elseif UseSelectorResult and UseSelectorResult.product then UseSelectorResult.product.id else nil
	local Creator = if UseSelectorResult1 then UseSelectorResult1.creator elseif UseSelectorResult then UseSelectorResult.creator else nil
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: Creator (copy), UseNavigationResult (copy), Price (ref), UseSelectorResult3 (copy), AvatarScreen (upval), Frame (copy), CollectibleProductId (copy)
		local Id = if Creator then Creator.id else nil
		local Name = if Creator then Creator.name else nil
		local FromContentFeedParam = UseNavigationResult.getParam("fromContentFeed")
		local FromProfileParam = UseNavigationResult.getParam("fromProfile")
		
		if Price and UseSelectorResult3 and Price <= UseSelectorResult3 then
			UseNavigationResult.navigate(AvatarScreen.PurchaseCatalogItem, {
				userAssetId = nil,
				collectibleInstanceId = nil,
				itemId = Frame.itemId,
				itemType = Frame.itemType,
				productId = CollectibleProductId,
				priceInRobux = Price,
				sellerId = Id,
				sellerName = Name,
				fromProfile = FromProfileParam,
				fromContentFeed = FromContentFeedParam
			})
			
			return
		else
			UseNavigationResult.navigate(AvatarScreen.InsufficientRobuxPrompt, {})
		end
	end, {
		CollectibleProductId, Creator, UseSelectorResult1, UseNavigationResult,
		Frame.itemId, Frame.itemType, Price
	})
	ReactModule.useEffect(function()
		-- upvalues: Flag (ref), UseDispatchResult (copy), FetchAssetResaleDataModule (upval), UseRoactServiceModuleResult (copy), Frame (copy), ConstantsModule (upval), FetchAssetVersionDataModule (upval)
		if Flag then
			UseDispatchResult(FetchAssetResaleDataModule(UseRoactServiceModuleResult, Frame.itemId))
		end
		if Frame.itemType == ConstantsModule.ItemType.Asset then
			UseDispatchResult(FetchAssetVersionDataModule(UseRoactServiceModuleResult, Frame.itemId))
		end
	end, { Flag, UseRoactServiceModuleResult, Frame.itemId })
	local OutfitInfo = Frame.outfitInfo
	local CreatingUniverseId = if OutfitInfo then OutfitInfo.creatingUniverseId elseif UseSelectorResult then UseSelectorResult.creatingUniverseId else nil
	local GameJoinContext = getGameJoinContext(Frame.itemType, Frame.itemId, ItemSubType, Frame.outfitInfo)
	local Name = nil
	
	if Creator then
		Name = Creator.name
	elseif CreatingUniverseId then
		local LocalPlayer = Players.LocalPlayer
		Name = LocalPlayer and LocalPlayer.Name or ""
	else
		Name = ""
	end
	local UseResult3 = if UseAppPolicyModuleResult and Id then UseResult1 else nil
	local config = {
		UIListLayout = ReactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder })
	}
	
	for _, value in (function()
		-- upvalues: Name (copy), UseResult3 (copy), Creator (copy), FFlagAXDurables2Option (upval), UseSelectorResult (copy), UseLocalizationModuleResult (copy), HasAttribution (ref), CreatingUniverseId (copy), GameJoinContext (copy), Frame (copy), IsResellable (ref), TaxonomyNameModule1 (ref), TaxonomyNameModule (copy), PlacementCategory (ref), FFlagAXAddHDRowInItemDetailsPage (upval), IsHighDefinition (ref), IsPBR (ref), IsTradable (ref), ShouldShowQuantityLimit (ref), QuantityLimitPerUser (ref), ResaleRestriction (ref), CatalogConstantsModule (upval), HasResellers (ref), UseSelectorResult4 (copy), UseResult11 (copy), RecentAveragePrice (ref), AssetStock (ref), LocalizeResult (copy), LocalizeResult1 (copy), LocalizeResult2 (copy), FFlagAXFixCollectibleOriginalPriceModule (upval), IsOriginalStockSellableInShop (ref), ReachQuantityLimitResult (ref), UseResult2 (copy), FFlagDynamicHeadsMigration (upval)
		local List = {}
		table.insert(List, {
			key = "Creator",
			infoName = "Feature.Catalog.Label.Filter.Creator",
			LayoutOrder = 2,
			infoData = Name,
			onActivate = UseResult3,
			hasVerifiedBadge = if Creator then Creator.hasVerifiedBadge else false
		})
		
		if FFlagAXDurables2Option and UseSelectorResult and UseSelectorResult.timedOptions then
			table.insert(List, {
				key = "RentOption",
				infoName = "Feature.Catalog.Label.RentOption",
				infoNameDetails = "Feature.Catalog.Label.RentOptionInfo",
				LayoutOrder = 2,
				infoData = UseLocalizationModuleResult.threeDays
			})
		end
		if HasAttribution then
			table.insert(List, {
				key = "Attribution",
				isAttribution = true,
				infoName = "Feature.Catalog.Label.Attribution",
				LayoutOrder = 3,
				creatingUniverseId = CreatingUniverseId,
				gameJoinContext = GameJoinContext,
				attributionRef = Frame.attributionRef,
				NextSelectionUp = if IsResellable then Frame.resellerRef else Frame.NextSelectionUp,
				NextSelectionDown = Frame.NextSelectionDown
			})
		end
		if TaxonomyNameModule1 and TaxonomyNameModule1 ~= "" then
			table.insert(List, {
				key = "CategoryType",
				infoName = "Feature.Catalog.Label.CategoryType",
				LayoutOrder = 4,
				infoData = TaxonomyNameModule1,
				infoNameDetails = if TaxonomyNameModule then "Feature.Catalog.Message.PriceCouldBeDifferent" else nil
			})
		end
		if PlacementCategory then
			table.insert(List, {
				key = "Placement",
				infoName = "Feature.Catalog.Label.Placement",
				LayoutOrder = 5,
				infoData = PlacementCategory
			})
		end
		if FFlagAXAddHDRowInItemDetailsPage and IsHighDefinition then
			table.insert(List, {
				key = "HighDefinition",
				infoName = "Feature.Catalog.Label.HD",
				infoNameDetails = "Feature.Catalog.Label.HighDefinitionInfo",
				LayoutOrder = 6,
				infoData = UseLocalizationModuleResult.yesText
			})
		end
		if IsPBR ~= nil then
			table.insert(List, {
				key = "PBR",
				infoName = "Feature.Catalog.Label.PBR",
				infoNameDetails = "Feature.Catalog.Label.PBRInfo",
				infoData = if IsPBR then UseLocalizationModuleResult.isPBR else UseLocalizationModuleResult.notPBR,
				LayoutOrder = (if FFlagAXAddHDRowInItemDetailsPage then 1 else 0) + 6
			})
		end
		if IsTradable ~= nil then
			table.insert(List, {
				key = "Tradeability",
				infoName = "Feature.Catalog.Label.Tradable",
				infoData = if IsTradable then UseLocalizationModuleResult.yesText else UseLocalizationModuleResult.noText,
				LayoutOrder = (if FFlagAXAddHDRowInItemDetailsPage then 1 else 0) + 7
			})
		end
		if ShouldShowQuantityLimit then
			table.insert(List, {
				key = "QuantityLimit",
				infoName = "Feature.Catalog.Label.MaxPerUser",
				infoData = QuantityLimitPerUser,
				LayoutOrder = (if FFlagAXAddHDRowInItemDetailsPage then 1 else 0) + 9
			})
		end
		if IsResellable then
			if ResaleRestriction == CatalogConstantsModule.ResaleRestriction.Disabled then
				table.insert(List, {
					key = "Resellability",
					infoName = "Feature.Catalog.Label.Resellable",
					infoData = UseLocalizationModuleResult.noText,
					LayoutOrder = (if FFlagAXAddHDRowInItemDetailsPage then 1 else 0) + 8
				})
			else
				table.insert(List, {
					key = "Sellers",
					infoName = "Feature.Catalog.Heading.Resellers",
					TextScaled = true,
					LayoutOrder = 1,
					infoData = if HasResellers then if UseSelectorResult4 then UseLocalizationModuleResult.fromResalePrice else "" else UseLocalizationModuleResult.noneText,
					onActivate = if HasResellers then UseResult11 else nil,
					ref = Frame.resellerRef,
					NextSelectionUp = Frame.NextSelectionUp,
					NextSelectionDown = if HasAttribution then Frame.attributionRef else Frame.NextSelectionDown
				})
				table.insert(List, {
					key = "AveragePrice",
					infoName = "Feature.Catalog.Label.AveragePrice",
					infoData = tostring(RecentAveragePrice),
					LayoutOrder = (if FFlagAXAddHDRowInItemDetailsPage then 1 else 0) + 12
				})
			end
			table.insert(List, {
				key = "SoldCount",
				infoName = "Feature.Catalog.Label.QuantitySold",
				TextScaled = true,
				infoData = if AssetStock == 0 then LocalizeResult else `{LocalizeResult}/{LocalizeResult1}`,
				LayoutOrder = (if FFlagAXAddHDRowInItemDetailsPage then 1 else 0) + 10
			})
			table.insert(List, {
				key = "Price",
				infoName = if ResaleRestriction == CatalogConstantsModule.ResaleRestriction.Disabled then "Feature.Catalog.Label.Price" else "Feature.Catalog.Label.OriginalPrice",
				infoData = if FFlagAXFixCollectibleOriginalPriceModule then if LocalizeResult2 then CatalogConstantsModule.RobloxEmoji.Robux .. LocalizeResult2 else UseLocalizationModuleResult.priceUnavailableText elseif LocalizeResult2 then CatalogConstantsModule.RobloxEmoji.Robux .. LocalizeResult2 else "",
				onActivate = if IsOriginalStockSellableInShop and not ReachQuantityLimitResult then UseResult2 else nil,
				LayoutOrder = if IsOriginalStockSellableInShop or ResaleRestriction == CatalogConstantsModule.ResaleRestriction.Disabled then 0 else (if FFlagAXAddHDRowInItemDetailsPage then 1 else 0) + 11
			})
		end
		table.sort(List, function(A, B): boolean
			return A.LayoutOrder < B.LayoutOrder
		end)
		
		if FFlagDynamicHeadsMigration and #List > 0 then
			List[#List].hideDivider = true
		end
		return List
	end)() do
		config[value.key] = ReactModule.createElement(if value.isAttribution then AttributionItemInfoRowModule else ItemInfoRowModule, value)
	end
	return ReactModule.createElement(Focusable.Frame, {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = Frame.LayoutOrder
	}, config)
end))