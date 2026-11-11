local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local PromiseModule = require(CorePackages.Packages.Promise)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local CryoModule = require(CorePackages.Packages.Cryo)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local AvatarExperienceAnalyticsModule = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local WidgetConstants = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).WidgetConstants
local ApiFetchEconomyCurrencyModule = require(Modules.LuaApp.Thunks.ApiFetchEconomyCurrency)
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
local ApplyProfileConfigurationFunction = require(CorePackages.Workspace.Packages.AvatarExperienceRodux).Actions.ApplyProfileConfiguration
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local AccessoryAdjustmentUtilsModule = require(Modules.AvatarExperience.AccessoryAdjustment.AccessoryAdjustmentUtils)
local SelectSearchKeywordFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).State.Selectors.selectSearchKeyword
local GetTryOnItemReducerKeyFunction = AvatarExperienceCommonModule.Utils.getTryOnItemReducerKey
local AvatarLastEquippedStateStore = AvatarExperienceCommonModule.Stores.AvatarLastEquippedStateStore.avatarLastEquippedStateStore
local UnifiedEventLogEnums = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums
local SendUnifiedEventForDeferredActionFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).sendUnifiedEventForDeferredAction
local AvatarScreenProperties = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties
local MutedErrorFunction = require(CorePackages.Workspace.Packages.Loggers).mutedError
local CartIdService = AvatarExperienceAnalyticsModule.Lib.CartIdService
local UnifiedSelectionListStore = AvatarExperienceAnalyticsModule.Store.UnifiedSelectionListStore
local FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup = AvatarExperienceFlagsModule.FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup
local FFlagAXFixPurchaseSurfaceLogging = SharedFlagsModule.FFlagAXFixPurchaseSurfaceLogging
local FFlagAXUnifiedPurchaseExtendRentalsFix = AvatarExperienceFlagsModule.FFlagAXUnifiedPurchaseExtendRentalsFix
local FFlagAXMISEnableMultiShoppingUnifiedEvents = AvatarExperienceFlagsModule.FFlagAXMISEnableMultiShoppingUnifiedEvents
local FFlagAXBackgroundsCustomizeHydration = AvatarExperienceFlagsModule.FFlagAXBackgroundsCustomizeHydration
local FFlagAXHideUnifiedPurchaseFlowSuccessToastMarketplace = AvatarExperienceFlagsModule.FFlagAXHideUnifiedPurchaseFlowSuccessToastMarketplace
local FFlagSkipCompletionModalForMarketplace = SharedFlagsModule.FFlagSkipCompletionModalForMarketplace

local function _(p1, p2)
	-- upvalues: ArgCheckModule (copy), ApiFetchEconomyCurrencyModule (copy)
	local LocalUserId = p2:getState().LocalUserId
	ArgCheckModule.isNonEmptyString(LocalUserId, "Thunk.PurchaseProduct.updateRobux.localUserId")
	
	if typeof(LocalUserId) == "string" and LocalUserId ~= "" then
		p2:dispatch(ApiFetchEconomyCurrencyModule(p1, LocalUserId, true))
	end
end

local config = {
	toastMessage = "Feature.Catalog.Label.Purchased",
	isLocalized = false,
	toastType = require(Modules.LuaApp.Enum.ToastType).SuccessConfirmation
}

return function(p1, p2, p3, p4, Asset, p5, p6, p7, p8, p9, p10, p11, TotalRobux, AvatarBackground, p12)
	-- upvalues: ItemDataModule (copy), CatalogUtilsModule (copy), FetchCollectibResellersInstancesModule (copy), CatalogConstantsModule (copy), FetchCollectibleResellableInstancesModule (copy), FetchAssetResellersModule (copy), FetchSellPageDataModule (copy), ConstantsModule (copy), SetAssetOwnedModule (copy), FFlagAXUnifiedPurchaseExtendRentalsFix (copy), FetchAssetOrBundleInfoModule (copy), SetBundleOwnedModule (copy), ArgCheckModule (copy), ApiFetchEconomyCurrencyModule (copy), AvatarScreenProperties (copy), FFlagAXMISEnableMultiShoppingUnifiedEvents (copy), UnifiedEventLogEnums (copy), SendUnifiedEventForDeferredActionFunction (copy), CryoModule (copy), CartIdService (copy), SelectSearchKeywordFunction (copy), MutedErrorFunction (copy), UnifiedSelectionListStore (copy), AccessoryAdjustmentUtilsModule (copy), WidgetConstants (copy), FFlagAXFixPurchaseSurfaceLogging (copy), FFlagAXHideUnifiedPurchaseFlowSuccessToastMarketplace (copy), FFlagSkipCompletionModalForMarketplace (copy), SetCurrentToastMessageModule (copy), config (copy), CloseAllItemDetailsModule (copy), FFlagAXBackgroundsCustomizeHydration (copy), ApplyProfileConfigurationFunction (copy), FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup (copy), AvatarLastEquippedStateStore (copy), GetTryOnItemReducerKeyFunction (copy), ToggleEquipAssetModule (copy), PromiseModule (copy), SetPurchaseErrorToastModule (copy)
	return function(p13)
		-- upvalues: ItemDataModule (upval), p4 (copy), Asset (copy), CatalogUtilsModule (upval), p1 (copy), p5 (copy), FetchCollectibResellersInstancesModule (upval), p3 (copy), CatalogConstantsModule (upval), FetchCollectibleResellableInstancesModule (upval), FetchAssetResellersModule (upval), FetchSellPageDataModule (upval), ConstantsModule (upval), SetAssetOwnedModule (upval), FFlagAXUnifiedPurchaseExtendRentalsFix (upval), FetchAssetOrBundleInfoModule (upval), p6 (copy), SetBundleOwnedModule (upval), ArgCheckModule (upval), ApiFetchEconomyCurrencyModule (upval), p2 (copy), p9 (copy), AvatarScreenProperties (upval), FFlagAXMISEnableMultiShoppingUnifiedEvents (upval), UnifiedEventLogEnums (upval), p11 (copy), SendUnifiedEventForDeferredActionFunction (upval), CryoModule (upval), CartIdService (upval), SelectSearchKeywordFunction (upval), MutedErrorFunction (upval), UnifiedSelectionListStore (upval), AvatarBackground (copy), TotalRobux (copy), p7 (copy), AccessoryAdjustmentUtilsModule (upval), p8 (copy), WidgetConstants (upval), p10 (copy), FFlagAXFixPurchaseSurfaceLogging (upval), p12 (copy), FFlagAXHideUnifiedPurchaseFlowSuccessToastMarketplace (upval), FFlagSkipCompletionModalForMarketplace (upval), SetCurrentToastMessageModule (upval), config (upval), CloseAllItemDetailsModule (upval), FFlagAXBackgroundsCustomizeHydration (upval), ApplyProfileConfigurationFunction (upval), FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup (upval), AvatarLastEquippedStateStore (upval), GetTryOnItemReducerKeyFunction (upval), ToggleEquipAssetModule (upval), PromiseModule (upval), SetPurchaseErrorToastModule (upval)
		local IsResellable = CatalogUtilsModule.IsResellable((ItemDataModule(p13:getState().AvatarExperience.Common, p4, Asset)))
		
		if type(p1) ~= "table" then return end
		if IsResellable then
			if p5 then
				p13:dispatch(FetchCollectibResellersInstancesModule(p3, p5, nil, CatalogConstantsModule.MaxResellersPerPage))
				p13:dispatch(FetchCollectibleResellableInstancesModule(p3, p5, p13:getState().LocalUserId))
			else
				p13:dispatch(FetchAssetResellersModule(p3, p4, nil, CatalogConstantsModule.MaxResellersPerPage, true))
				p13:dispatch(FetchSellPageDataModule(p3, p4, p13:getState().LocalUserId))
			end
		end
		if not p1.purchased then
			p13:dispatch(SetPurchaseErrorToastModule(p1))
			
			return PromiseModule.reject(p1)
		end
		if Asset == ConstantsModule.ItemType.Asset then
			p13:dispatch(SetAssetOwnedModule(p4, true))
			
			if FFlagAXUnifiedPurchaseExtendRentalsFix then
				p13:dispatch(FetchAssetOrBundleInfoModule(p3, p6, p4, Asset, true))
			end
		else
			p13:dispatch(SetBundleOwnedModule(p4, true))
		end
		local LocalUserId = p13:getState().LocalUserId
		ArgCheckModule.isNonEmptyString(LocalUserId, "Thunk.PurchaseProduct.updateRobux.localUserId")
		
		if typeof(LocalUserId) == "string" and LocalUserId ~= "" then
			p13:dispatch(ApiFetchEconomyCurrencyModule(p3, LocalUserId, true))
		end
		local Success, Result = pcall(function()
			-- upvalues: p2 (upval), ConstantsModule (upval), p9 (upval), AvatarScreenProperties (upval), FFlagAXMISEnableMultiShoppingUnifiedEvents (upval), Asset (upval), UnifiedEventLogEnums (upval), p11 (upval), SendUnifiedEventForDeferredActionFunction (upval), CryoModule (upval), p13 (copy), CartIdService (upval), SelectSearchKeywordFunction (upval), p4 (upval)
			local v1 = if p2[ConstantsModule.WearAfterPurchasePostPurchaseActionKey] then p2[ConstantsModule.WearAfterPurchasePostPurchaseActionKey] else false
			local AvatarScreenProperty = if p9 and p9.current and p9.opaque then AvatarScreenProperties[p9.opaque.name] else nil
			local ASSET = nil
			
			if FFlagAXMISEnableMultiShoppingUnifiedEvents then
				if Asset == "Asset" then
					ASSET = UnifiedEventLogEnums.MarketplaceUnifiedItemType.ASSET
				elseif Asset == "Bundle" then
					ASSET = UnifiedEventLogEnums.MarketplaceUnifiedItemType.BUNDLE
				end
			end
			local P13 = p11 or { widgetType = nil }
			SendUnifiedEventForDeferredActionFunction(CryoModule.Dictionary.join(p13:getState().AvatarExperience.AnalyticsMetadata, {
				action = UnifiedEventLogEnums.MarketplaceUnifiedAction.PURCHASE_SUCCESS,
				cartId = if FFlagAXMISEnableMultiShoppingUnifiedEvents then CartIdService.getCartId() else nil,
				keyword = SelectSearchKeywordFunction(p13:getState()),
				itemId = if FFlagAXMISEnableMultiShoppingUnifiedEvents then p4 else nil,
				itemType = if FFlagAXMISEnableMultiShoppingUnifiedEvents then ASSET else nil,
				surface = if AvatarScreenProperty and AvatarScreenProperty.analyticsData then AvatarScreenProperty.analyticsData.unifiedLoggingSurface else nil,
				widgetItemWearAfterPurchase = if P13.widgetType then v1 else nil,
				organicItemWearAfterPurchase = if P13.widgetType then nil else v1
			}))
		end)
		
		if not Success then
			MutedErrorFunction(Result)
		end
		if FFlagAXMISEnableMultiShoppingUnifiedEvents then
			CartIdService.refreshCartId()
			UnifiedSelectionListStore.clearSelectionList()
		end
		local TryOnItems = p13:getState().AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
		
		if Asset == ConstantsModule.ItemType.Asset then
			p6.purchaseAsset(p4, AvatarBackground, TotalRobux, p7, AccessoryAdjustmentUtilsModule.checkTryOnHasAdjustments(TryOnItems, (tostring(p4))), p8)
		elseif Asset == ConstantsModule.ItemType.Bundle then
			p6.purchaseBundle(p4, AvatarBackground, TotalRobux, p7, p8)
		end
		if p11 then
			p6.widgetInteractionV2(CryoModule.Dictionary.join(p11, { totalRobux = TotalRobux }), WidgetConstants.ActionType.PURCHASE_SUCCESS)
		end
		local RequestId = p13:getState().AvatarExperience.Common.Widgets.WidgetInfo.RequestId
		local State = p13:getState()
		local SelectSearchKeywordResult = SelectSearchKeywordFunction(State)
		local CategoryAndSubcategory, CategoryAndSubcategory2 = CatalogUtilsModule.getCategoryAndSubcategory(State)
		p6.avatarShopBuyItem(p4, Asset, TotalRobux, p10, RequestId, SelectSearchKeywordResult, CategoryAndSubcategory, CategoryAndSubcategory2, p13:getState().AvatarExperience.AnalyticsMetadata, if FFlagAXFixPurchaseSurfaceLogging and p12 then p12.getParam(ConstantsModule.NavigationParams.fromSurface) else nil)
		
		if not FFlagAXHideUnifiedPurchaseFlowSuccessToastMarketplace or FFlagSkipCompletionModalForMarketplace then
			p13:dispatch(SetCurrentToastMessageModule(config))
		end
		p13:dispatch(CloseAllItemDetailsModule(p12))
		
		if p2[ConstantsModule.WearAfterPurchasePostPurchaseActionKey] then
			if FFlagAXBackgroundsCustomizeHydration and Asset == ConstantsModule.ItemType.Asset and AvatarBackground == ConstantsModule.AssetTypeIdStrings.AvatarBackground then
				p13:dispatch(ApplyProfileConfigurationFunction({ BackgroundAssetId = tonumber(p4) }))
			elseif Asset == ConstantsModule.ItemType.Asset and AvatarBackground ~= ConstantsModule.AssetTypeIdStrings.EmoteAnimation then
				if FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup then
					AvatarLastEquippedStateStore.setShouldRevertLastEquippedState(false)
				end
				local EquippedAssets = p13:getState().AvatarExperience.AvatarEditor.Character.EquippedAssets
				
				if not EquippedAssets or (not EquippedAssets[AvatarBackground] or EquippedAssets[AvatarBackground][p4] == nil) then
					local TryOnItemReducerKey = GetTryOnItemReducerKeyFunction(p4, Asset)
					p13:dispatch(ToggleEquipAssetModule(AvatarBackground, p4, p12, false, TryOnItems[TryOnItemReducerKey] and TryOnItems[TryOnItemReducerKey].order, TryOnItems[TryOnItemReducerKey] and {
						position = TryOnItems[TryOnItemReducerKey].position,
						rotation = TryOnItems[TryOnItemReducerKey].rotation,
						scale = TryOnItems[TryOnItemReducerKey].scale
					}))
				end
			end
		end
		return PromiseModule.resolve(p1)
	end
end