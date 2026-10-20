local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local PromiseModule = require(CorePackages.Packages.Promise)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local CryoModule = require(CorePackages.Packages.Cryo)
local TutilsModule = require(CorePackages.Packages.tutils)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local AvatarExperienceAnalyticsModule = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics)
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local AvatarExperienceRoduxModule = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local WebApiModule = require(Modules.AvatarExperience.Catalog.Http.WebApi)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local WidgetConstants = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).WidgetConstants
local ApiFetchEconomyCurrencyModule = require(Modules.LuaApp.Thunks.ApiFetchEconomyCurrency)
local SetNetworkingErrorToastModule = require(Modules.LuaApp.Thunks.SetNetworkingErrorToast)
local SetPurchaseErrorToastModule = require(Modules.LuaApp.Thunks.SetPurchaseErrorToast)
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local ItemDataModule = require(Modules.AvatarExperience.Common.Selectors.ItemData)
local SetAssetOwnedModule = require(Modules.AvatarExperience.Common.Actions.SetAssetOwned)
local SetBundleOwnedModule = require(Modules.AvatarExperience.Common.Actions.SetBundleOwned)
local CloseAllItemDetailsModule = require(Modules.AvatarExperience.Common.Thunks.CloseAllItemDetails)
local FetchAssetResellersModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchAssetResellers)
local FetchSellPageDataModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchSellPageData)
local FetchCollectibResellersInstancesModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchCollectibResellersInstances)
local FetchCollectibleResellableInstancesModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchCollectibleResellableInstances)
local FetchAssetOrBundleInfoModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo)
local ToggleEquipAssetModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.ToggleEquipAsset)
local ApplyProfileConfigurationFunction = AvatarExperienceRoduxModule.Actions.ApplyProfileConfiguration
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local RemoveFromTryOnFunction = AvatarExperienceRoduxModule.Actions.RemoveFromTryOn
local _ = require(Modules.AvatarExperience.Common.Reducers.OutfitTryOn)
local AccessoryAdjustmentUtilsModule = require(Modules.AvatarExperience.AccessoryAdjustment.AccessoryAdjustmentUtils)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local SelectSearchKeywordFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).State.Selectors.selectSearchKeyword
local FindItemInTryOnItemsFunction = AvatarExperienceCommonModule.Utils.findItemInTryOnItems
local GetTryOnItemReducerKeyFunction = AvatarExperienceCommonModule.Utils.getTryOnItemReducerKey
local AvatarLastEquippedStateStore = AvatarExperienceCommonModule.Stores.AvatarLastEquippedStateStore.avatarLastEquippedStateStore
local UnifiedEventLogEnums = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums
local SendUnifiedEventForDeferredActionFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).sendUnifiedEventForDeferredAction
local AvatarScreenProperties = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties
local CartIdService = AvatarExperienceAnalyticsModule.Lib.CartIdService
local UnifiedSelectionListStore = AvatarExperienceAnalyticsModule.Store.UnifiedSelectionListStore
local GetFFlagAXItemDetailsAnalyticsV2Module = require(Modules.AvatarExperience.Flags.GetFFlagAXItemDetailsAnalyticsV2)
local IsEconomicRestrictionResponseFunction = require(CorePackages.Workspace.Packages.IAPExperience).Utility.isEconomicRestrictionResponse
local FFlagAXMISEnableMultiShopping = AvatarExperienceFlagsModule.FFlagAXMISEnableMultiShopping
local FFlagAXFixPurchaseSurfaceLogging = SharedFlagsModule.FFlagAXFixPurchaseSurfaceLogging
local FFlagAXInventoryDurablesSupport = AvatarExperienceFlagsModule.FFlagAXInventoryDurablesSupport
local FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup = AvatarExperienceFlagsModule.FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup
local FFlagUseNavigationSelectors = SharedFlagsModule.FFlagUseNavigationSelectors
local FFlagSignalsNavP3gAvatarExperience = SharedFlagsModule.FFlagSignalsNavP3gAvatarExperience
local GetLegacyNavigationStoreFunction = require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore
local FFlagAXMISEnableMultiShoppingUnifiedEvents = AvatarExperienceFlagsModule.FFlagAXMISEnableMultiShoppingUnifiedEvents
local FFlagAXBackgroundsCustomizeHydration = AvatarExperienceFlagsModule.FFlagAXBackgroundsCustomizeHydration
local config = { HttpError = Enum.HttpError.OK }
local config1 = {
	toastMessage = "Feature.Catalog.Label.Purchased",
	isLocalized = false,
	toastType = require(Modules.LuaApp.Enum.ToastType).SuccessConfirmation
}

local function _(p1, p2)
	-- upvalues: ArgCheckModule (copy), ApiFetchEconomyCurrencyModule (copy)
	local LocalUserId = p2:getState().LocalUserId
	ArgCheckModule.isNonEmptyString(LocalUserId, "Thunk.PurchaseProduct.updateRobux.localUserId")
	
	if typeof(LocalUserId) == "string" and LocalUserId ~= "" then
		p2:dispatch(ApiFetchEconomyCurrencyModule(p1, LocalUserId, true))
	end
end

local function removeFromTryOn(p1, JoinResult)
	-- upvalues: ConstantsModule (copy), FindItemInTryOnItemsFunction (copy), RemoveFromTryOnFunction (copy)
	local State = p1:getState()
	local TryOnItems = State.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
	local AssetId = JoinResult.assetId
	
	if not AssetId and JoinResult.productId then
		for i, tryOnItem in TryOnItems do
			if tryOnItem.itemType ~= ConstantsModule.ItemType.Asset then
				local BundleInfo = State.AvatarExperience.Common.BundleInfos[i]
				local Id = BundleInfo and BundleInfo.product.id
				
				if Id and Id == tostring(JoinResult.productId) then
					AssetId = tryOnItem.itemId
				end
			end
		end
	end
	local v1 = nil
	
	if AssetId then
		v1 = FindItemInTryOnItemsFunction(TryOnItems, AssetId)
		p1:dispatch(RemoveFromTryOnFunction((tostring(AssetId))))
	end
	return v1
end

local _ = function(p2): string
	-- upvalues: CatalogConstantsModule (copy)
	return CatalogConstantsModule.PurchaseProductKey .. tostring(p2)
end

return function(p2, p3, TotalRobux, p4, p5, Asset, ItemSubType, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, Callback, p18)
	-- upvalues: PerformFetch (copy), CatalogConstantsModule (copy), ItemDataModule (copy), CatalogUtilsModule (copy), HttpService (copy), PromiseModule (copy), WebApiModule (copy), IsEconomicRestrictionResponseFunction (copy), FetchCollectibResellersInstancesModule (copy), FetchCollectibleResellableInstancesModule (copy), FetchAssetResellersModule (copy), FetchSellPageDataModule (copy), ConstantsModule (copy), SetAssetOwnedModule (copy), FFlagAXInventoryDurablesSupport (copy), FetchAssetOrBundleInfoModule (copy), SetBundleOwnedModule (copy), ArgCheckModule (copy), ApiFetchEconomyCurrencyModule (copy), FFlagSignalsNavP3gAvatarExperience (copy), GetLegacyNavigationStoreFunction (copy), FFlagUseNavigationSelectors (copy), Selectors (copy), AvatarScreenProperties (copy), UnifiedEventLogEnums (copy), FFlagAXMISEnableMultiShoppingUnifiedEvents (copy), SendUnifiedEventForDeferredActionFunction (copy), CryoModule (copy), CartIdService (copy), SelectSearchKeywordFunction (copy), UnifiedSelectionListStore (copy), AccessoryAdjustmentUtilsModule (copy), WidgetConstants (copy), GetFFlagAXItemDetailsAnalyticsV2Module (copy), AvatarScreen (copy), FFlagAXFixPurchaseSurfaceLogging (copy), SetCurrentToastMessageModule (copy), config1 (copy), removeFromTryOn (copy), CloseAllItemDetailsModule (copy), FFlagAXBackgroundsCustomizeHydration (copy), ApplyProfileConfigurationFunction (copy), FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup (copy), AvatarLastEquippedStateStore (copy), GetTryOnItemReducerKeyFunction (copy), FFlagAXMISEnableMultiShopping (copy), TutilsModule (copy), ToggleEquipAssetModule (copy), SetPurchaseErrorToastModule (copy), config (copy), Logging (copy), SetNetworkingErrorToastModule (copy)
	return PerformFetch.Single(CatalogConstantsModule.PurchaseProductKey .. tostring(p3), function(p19)
		-- upvalues: ItemDataModule (upval), p5 (copy), Asset (copy), CatalogUtilsModule (upval), p13 (copy), HttpService (upval), p14 (copy), PromiseModule (upval), WebApiModule (upval), p2 (copy), TotalRobux (copy), p4 (copy), p15 (copy), p18 (copy), p3 (copy), p7 (copy), IsEconomicRestrictionResponseFunction (upval), Callback (copy), FetchCollectibResellersInstancesModule (upval), CatalogConstantsModule (upval), FetchCollectibleResellableInstancesModule (upval), FetchAssetResellersModule (upval), FetchSellPageDataModule (upval), ConstantsModule (upval), SetAssetOwnedModule (upval), FFlagAXInventoryDurablesSupport (upval), FetchAssetOrBundleInfoModule (upval), p8 (copy), SetBundleOwnedModule (upval), ArgCheckModule (upval), ApiFetchEconomyCurrencyModule (upval), FFlagSignalsNavP3gAvatarExperience (upval), GetLegacyNavigationStoreFunction (upval), FFlagUseNavigationSelectors (upval), Selectors (upval), AvatarScreenProperties (upval), UnifiedEventLogEnums (upval), FFlagAXMISEnableMultiShoppingUnifiedEvents (upval), SendUnifiedEventForDeferredActionFunction (upval), CryoModule (upval), CartIdService (upval), SelectSearchKeywordFunction (upval), p16 (copy), UnifiedSelectionListStore (upval), ItemSubType (copy), p10 (copy), AccessoryAdjustmentUtilsModule (upval), p17 (copy), WidgetConstants (upval), p11 (copy), GetFFlagAXItemDetailsAnalyticsV2Module (upval), AvatarScreen (upval), p12 (copy), FFlagAXFixPurchaseSurfaceLogging (upval), p9 (copy), SetCurrentToastMessageModule (upval), config1 (upval), removeFromTryOn (upval), CloseAllItemDetailsModule (upval), p6 (copy), FFlagAXBackgroundsCustomizeHydration (upval), ApplyProfileConfigurationFunction (upval), FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup (upval), AvatarLastEquippedStateStore (upval), GetTryOnItemReducerKeyFunction (upval), FFlagAXMISEnableMultiShopping (upval), TutilsModule (upval), ToggleEquipAssetModule (upval), SetPurchaseErrorToastModule (upval), config (upval), Logging (upval), SetNetworkingErrorToastModule (upval)
		local IsResellable = nil
		IsResellable = CatalogUtilsModule.IsResellable((ItemDataModule(p19:getState().AvatarExperience.Common, p5, Asset)))
		local Collectibles = p19:getState().AvatarExperience.Common.Collectibles
		local CollectiblesItemInfo = Collectibles.CollectiblesItemInfo
		local PurchaseProductResult = nil
		
		if p13 and CollectiblesItemInfo[p13] then
			local LocalUserId = p19:getState().LocalUserId
			local Guid = HttpService:GenerateGUID(false)
			
			if p14 == nil then
				PurchaseProductResult = WebApiModule.PurchaseCollectibleItem(p2, p13, CollectiblesItemInfo[p13].collectibleProductId, TotalRobux, p4, p15, LocalUserId, Guid, p18)
			else
				local CollectiblesResellersInstance = Collectibles.CollectiblesResellersInstances[p13]
				local InstancesEntry = CollectiblesResellersInstance and CollectiblesResellersInstance.Instances[p14]
				local CollectibleProductId = InstancesEntry and InstancesEntry.collectibleProductId
				PurchaseProductResult = if CollectibleProductId then WebApiModule.PurchaseCollectibleItemResale(p2, p13, p14, CollectibleProductId, TotalRobux, p4, p15, LocalUserId, Guid) else PromiseModule.reject({
					reason = "CollectibleProductIdNotFound",
					HttpError = Enum.HttpError.OK
				})
			end
		else
			PurchaseProductResult = WebApiModule.PurchaseProduct(p2, p3, TotalRobux, p4, p7)
		end
		return PurchaseProductResult:andThen(function(Result)
			-- upvalues: IsEconomicRestrictionResponseFunction (upval), Callback (upval), PromiseModule (upval), IsResellable (ref), p13 (upval), p19 (copy), FetchCollectibResellersInstancesModule (upval), p2 (upval), CatalogConstantsModule (upval), FetchCollectibleResellableInstancesModule (upval), FetchAssetResellersModule (upval), p5 (upval), FetchSellPageDataModule (upval), Asset (upval), ConstantsModule (upval), SetAssetOwnedModule (upval), FFlagAXInventoryDurablesSupport (upval), FetchAssetOrBundleInfoModule (upval), p8 (upval), SetBundleOwnedModule (upval), ArgCheckModule (upval), ApiFetchEconomyCurrencyModule (upval), FFlagSignalsNavP3gAvatarExperience (upval), GetLegacyNavigationStoreFunction (upval), FFlagUseNavigationSelectors (upval), Selectors (upval), AvatarScreenProperties (upval), p18 (upval), UnifiedEventLogEnums (upval), FFlagAXMISEnableMultiShoppingUnifiedEvents (upval), SendUnifiedEventForDeferredActionFunction (upval), CryoModule (upval), CartIdService (upval), SelectSearchKeywordFunction (upval), p16 (upval), UnifiedSelectionListStore (upval), ItemSubType (upval), TotalRobux (upval), p10 (upval), AccessoryAdjustmentUtilsModule (upval), p17 (upval), WidgetConstants (upval), p11 (upval), GetFFlagAXItemDetailsAnalyticsV2Module (upval), CatalogUtilsModule (upval), AvatarScreen (upval), p12 (upval), FFlagAXFixPurchaseSurfaceLogging (upval), p9 (upval), SetCurrentToastMessageModule (upval), config1 (upval), removeFromTryOn (upval), CloseAllItemDetailsModule (upval), p6 (upval), FFlagAXBackgroundsCustomizeHydration (upval), ApplyProfileConfigurationFunction (upval), FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup (upval), AvatarLastEquippedStateStore (upval), GetTryOnItemReducerKeyFunction (upval), FFlagAXMISEnableMultiShopping (upval), TutilsModule (upval), ToggleEquipAssetModule (upval), SetPurchaseErrorToastModule (upval), config (upval), Logging (upval), SetNetworkingErrorToastModule (upval)
			local ResponseBody = Result.responseBody
			
			if type(ResponseBody) == "table" then
				if IsEconomicRestrictionResponseFunction(ResponseBody) and Callback then
					Callback(ResponseBody)
					
					return PromiseModule.resolve(ResponseBody)
				end
				local JoinResult = ResponseBody
				
				if IsResellable then
					if p13 then
						p19:dispatch(FetchCollectibResellersInstancesModule(p2, p13, nil, CatalogConstantsModule.MaxResellersPerPage))
						p19:dispatch(FetchCollectibleResellableInstancesModule(p2, p13, p19:getState().LocalUserId))
					else
						p19:dispatch(FetchAssetResellersModule(p2, p5, nil, CatalogConstantsModule.MaxResellersPerPage, true))
						p19:dispatch(FetchSellPageDataModule(p2, p5, p19:getState().LocalUserId))
					end
				end
				if JoinResult.purchased then
					if Asset == ConstantsModule.ItemType.Asset then
						p19:dispatch(SetAssetOwnedModule(p5, true))
						
						if FFlagAXInventoryDurablesSupport then
							p19:dispatch(FetchAssetOrBundleInfoModule(p2, p8, p5, Asset, true))
						end
					else
						p19:dispatch(SetBundleOwnedModule(p5, true))
					end
					local v2 = p2
					local LocalUserId = p19:getState().LocalUserId
					ArgCheckModule.isNonEmptyString(LocalUserId, "Thunk.PurchaseProduct.updateRobux.localUserId")
					
					if typeof(LocalUserId) == "string" and LocalUserId ~= "" then
						p19:dispatch(ApiFetchEconomyCurrencyModule(v2, LocalUserId, true))
					end
					local CurrentRoute = nil
					pcall(function()
						-- upvalues: CurrentRoute (ref), FFlagSignalsNavP3gAvatarExperience (upval), GetLegacyNavigationStoreFunction (upval), FFlagUseNavigationSelectors (upval), Selectors (upval), p19 (upval), AvatarScreenProperties (upval), p18 (upval), CatalogConstantsModule (upval), UnifiedEventLogEnums (upval), FFlagAXMISEnableMultiShoppingUnifiedEvents (upval), Asset (upval), SendUnifiedEventForDeferredActionFunction (upval), CryoModule (upval), CartIdService (upval), p5 (upval), SelectSearchKeywordFunction (upval), p16 (upval)
						CurrentRoute = if FFlagSignalsNavP3gAvatarExperience then GetLegacyNavigationStoreFunction(false).getCurrentRoute(false) elseif FFlagUseNavigationSelectors then Selectors.selectCurrentRoactNavigationRoute(p19:getState()) else p19:getState().Navigation and p19:getState().Navigation.currentRoute
						local AvatarScreenProperty = if CurrentRoute and CurrentRoute.params and CurrentRoute.params.fromAvatarRoute and CurrentRoute.params.fromAvatarRoute.opaque then AvatarScreenProperties[CurrentRoute.params.fromAvatarRoute.opaque.name] else nil
						local TimedOptions = if p18 then CatalogConstantsModule.TimedOptionsMap[p18] else UnifiedEventLogEnums.MarketplaceTimedOption.PERMANENT
						local ASSET = nil
						
						if FFlagAXMISEnableMultiShoppingUnifiedEvents then
							if Asset == "Asset" then
								ASSET = UnifiedEventLogEnums.MarketplaceUnifiedItemType.ASSET
							elseif Asset == "Bundle" then
								ASSET = UnifiedEventLogEnums.MarketplaceUnifiedItemType.BUNDLE
							end
						end
						SendUnifiedEventForDeferredActionFunction(CryoModule.Dictionary.join(p19:getState().AvatarExperience.AnalyticsMetadata, {
							action = UnifiedEventLogEnums.MarketplaceUnifiedAction.PURCHASE_SUCCESS,
							cartId = if FFlagAXMISEnableMultiShoppingUnifiedEvents then CartIdService.getCartId() else nil,
							itemId = if FFlagAXMISEnableMultiShoppingUnifiedEvents then p5 else nil,
							itemType = if FFlagAXMISEnableMultiShoppingUnifiedEvents then ASSET else nil,
							keyword = SelectSearchKeywordFunction(p19:getState()),
							surface = if AvatarScreenProperty and AvatarScreenProperty.analyticsData then AvatarScreenProperty.analyticsData.unifiedLoggingSurface else nil,
							widgetTimedOption = if p16 then TimedOptions else nil,
							organicTimedOption = if p16 then nil else TimedOptions
						}))
					end)
					
					if FFlagAXMISEnableMultiShoppingUnifiedEvents then
						CartIdService.refreshCartId()
						UnifiedSelectionListStore.clearSelectionList()
					end
					local TryOnItems = p19:getState().AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
					
					if Asset == ConstantsModule.ItemType.Asset then
						p8.purchaseAsset(p5, ItemSubType, TotalRobux, p10, AccessoryAdjustmentUtilsModule.checkTryOnHasAdjustments(TryOnItems, (tostring(p5))), p17)
					elseif Asset == ConstantsModule.ItemType.Bundle then
						p8.purchaseBundle(p5, ItemSubType, TotalRobux, p10, p17)
					end
					if p16 then
						p8.widgetInteractionV2(CryoModule.Dictionary.join(p16, { totalRobux = TotalRobux }), WidgetConstants.ActionType.PURCHASE_SUCCESS)
					end
					if not p11 then
						local RequestId = p19:getState().AvatarExperience.Common.Widgets.WidgetInfo.RequestId
						local Keyword = nil
						local CatalogCategory = nil
						local CatalogSearchSubcategory = nil
						local State = p19:getState()
						
						if GetFFlagAXItemDetailsAnalyticsV2Module() then
							Keyword = SelectSearchKeywordFunction(State)
							CatalogCategory, CatalogSearchSubcategory = CatalogUtilsModule.getCategoryAndSubcategory(State)
						else
							local FromAvatarRoute = CurrentRoute and (CurrentRoute.params and CurrentRoute.params.fromAvatarRoute)
							local Current = FromAvatarRoute and FromAvatarRoute.current
							
							if Current and Current.name == AvatarScreen.CatalogSearch then
								local Key = Current.key
								Keyword = State.Search and (State.Search.SearchesInCatalog[Key] and State.Search.SearchesInCatalog[Key].keyword)
							end
							local CurrentCategoryNames = CatalogUtilsModule.getCurrentCategoryNames(State)
							local IsNameMatch: boolean = Current and Current.name == AvatarScreen.CatalogSearch
							
							if CurrentCategoryNames then
								if IsNameMatch then
									CatalogCategory = CurrentCategoryNames.catalogSearchCategory or CatalogCategory
									CatalogSearchSubcategory = CurrentCategoryNames.catalogSearchSubcategory or CatalogSearchSubcategory
								else
									CatalogCategory = CurrentCategoryNames.catalogCategory or CatalogCategory
									CatalogSearchSubcategory = CurrentCategoryNames.catalogSubcategory or CatalogSearchSubcategory
								end
							end
						end
						p8.avatarShopBuyItem(p5, Asset, TotalRobux, p12, RequestId, Keyword, CatalogCategory, CatalogSearchSubcategory, p19:getState().AvatarExperience.AnalyticsMetadata, if FFlagAXFixPurchaseSurfaceLogging and p9 then p9.getParam(ConstantsModule.NavigationParams.fromSurface) else nil)
						p19:dispatch(SetCurrentToastMessageModule(config1))
					end
					if p11 then
						local RemoveFromTryOnResult = removeFromTryOn(p19, JoinResult)
						
						if RemoveFromTryOnResult then
							if JoinResult.assetIsWearable == false and RemoveFromTryOnResult.itemId ~= nil then
								JoinResult = CryoModule.Dictionary.join(JoinResult, {
									bundleId = RemoveFromTryOnResult.itemId,
									tryOnBundleInfo = RemoveFromTryOnResult.bundleInfo
								})
							end
							JoinResult = CryoModule.Dictionary.join(JoinResult, {
								itemSubType = ItemSubType,
								overrideOrder = RemoveFromTryOnResult.order
							})
						end
					end
					p19:dispatch(CloseAllItemDetailsModule(p9))
					
					if p6 then
						if FFlagAXBackgroundsCustomizeHydration and Asset == ConstantsModule.ItemType.Asset and ItemSubType == ConstantsModule.AssetTypeIdStrings.AvatarBackground then
							p19:dispatch(ApplyProfileConfigurationFunction({ BackgroundAssetId = tonumber(p5) }))
						elseif Asset == ConstantsModule.ItemType.Asset and ItemSubType ~= ConstantsModule.AssetTypeIdStrings.EmoteAnimation then
							if FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup then
								AvatarLastEquippedStateStore.setShouldRevertLastEquippedState(false)
							end
							local EquippedAssets = p19:getState().AvatarExperience.AvatarEditor.Character.EquippedAssets
							
							if not EquippedAssets or (not EquippedAssets[ItemSubType] or EquippedAssets[ItemSubType][p5] == nil) then
								local TryOnItemReducerKey = GetTryOnItemReducerKeyFunction(p5, Asset)
								p19:dispatch(ToggleEquipAssetModule(ItemSubType, p5, p9, if FFlagAXMISEnableMultiShopping then TutilsModule.fieldCount(TryOnItems) > 1 else false, TryOnItems[TryOnItemReducerKey] and TryOnItems[TryOnItemReducerKey].order, TryOnItems[TryOnItemReducerKey] and {
									position = TryOnItems[TryOnItemReducerKey].position,
									rotation = TryOnItems[TryOnItemReducerKey].rotation,
									scale = TryOnItems[TryOnItemReducerKey].scale
								}))
							end
						end
					end
					return PromiseModule.resolve(JoinResult)
				else
					local CurrentRoute = p11
					
					if not CurrentRoute then
						CurrentRoute = p19
						CurrentRoute:dispatch(SetPurchaseErrorToastModule(JoinResult))
					end
					CurrentRoute = PromiseModule
					CurrentRoute = CurrentRoute.reject
					
					return CurrentRoute(JoinResult)
				end
			else
				local CurrentRoute = Logging
				CurrentRoute = CurrentRoute.warn
				CurrentRoute("Response from PurchaseProduct is malformed!")
				CurrentRoute = p11
				
				if not CurrentRoute then
					CurrentRoute = p19
					CurrentRoute:dispatch(SetNetworkingErrorToastModule(config))
				end
				CurrentRoute = PromiseModule
				CurrentRoute = CurrentRoute.reject
				
				return CurrentRoute(config)
			end
		end, function(p20)
			-- upvalues: config (upval), p11 (upval), p19 (copy), SetNetworkingErrorToastModule (upval), PromiseModule (upval)
			if type(p20) ~= "table" or p20.HttpError == nil then
				p20 = config
			end
			if not p11 then
				p19:dispatch(SetNetworkingErrorToastModule(p20))
			end
			return PromiseModule.reject(p20)
		end)
	end)
end