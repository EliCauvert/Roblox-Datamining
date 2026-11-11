local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseAvatarRouteFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.Hooks.useAvatarRoute
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local UseAdaptiveScrollingFunction = AvatarExperienceCommonModule.Hooks.useAdaptiveScrolling
local FullView = AvatarExperienceCommonModule.Enums.FullView
local WidgetConstants = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).WidgetConstants
local PeekViewState = require(CorePackages.Workspace.Packages.PeekView).PeekViewState
local FFlagAXMISEnableMultiShopping = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXMISEnableMultiShopping
local SetTryOnManagerPeekViewStateFunction = require(CorePackages.Workspace.Packages.AvatarExperienceRodux).Actions.SetTryOnManagerPeekViewState
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local AnalyticsModule = require(Modules.AvatarExperience.Common.Services.Analytics)
local AnalyticsModule1 = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local WebApiModule = require(Modules.AvatarExperience.Catalog.Http.WebApi)
local SetAnimationPreviewModule = require(Modules.AvatarExperience.Common.Actions.SetAnimationPreview)
local SetFullViewModule = require(Modules.AvatarExperience.Common.Thunks.SetFullView)
local ToggleTryOnThunkModule = require(Modules.AvatarExperience.Common.Thunks.ToggleTryOnThunk)
local CloseAllItemDetailsModule = require(Modules.AvatarExperience.Common.Thunks.CloseAllItemDetails)
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local _ = require(Modules.AvatarExperience.Common.Types)
local config = {
	toastMessage = "Feature.Avatar.Label.LayeredClothingR15Warning",
	isLocalized = false,
	toastType = require(Modules.LuaApp.Enum.ToastType).InformationMessage
}

return function(p1)
	-- upvalues: UseNavigationFunction (copy), UseAvatarRouteFunction (copy), UseDispatchFunction (copy), UseRoactServiceFunction (copy), RoactNetworkingModule (copy), AnalyticsModule (copy), AnalyticsModule1 (copy), UseAdaptiveScrollingFunction (copy), ReactModule (copy), CatalogUtilsModule (copy), FFlagAXMISEnableMultiShopping (copy), SetTryOnManagerPeekViewStateFunction (copy), PeekViewState (copy), ToggleTryOnThunkModule (copy), FullView (copy), SetFullViewModule (copy), ConstantsModule (copy), SetCurrentToastMessageModule (copy), config (copy), SetAnimationPreviewModule (copy), WidgetConstants (copy), WebApiModule (copy), CloseAllItemDetailsModule (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworkingModule)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AnalyticsModule)
	local UseRoactServiceResult2 = UseRoactServiceFunction(AnalyticsModule1)
	local UseAdaptiveScrollingResult = UseAdaptiveScrollingFunction()
	local ItemId = p1.itemId
	local ItemType = p1.itemType
	local ItemData = p1.itemData
	local IsSelected = p1.isSelected
	local FullView1 = p1.fullView
	local IsAvatarR6 = p1.isAvatarR6
	local IsItemDetailsViewStateFull = p1.isItemDetailsViewStateFull
	local MaybePromptForR15UpgradeFunction = p1.maybePromptForR15Upgrade
	local WidgetAnalyticsInfo = p1.widgetAnalyticsInfo
	local AdTrackingData = p1.adTrackingData
	local SendCatalogItemClickAnalyticsFunction = p1.sendCatalogItemClickAnalytics
	local TextButtonRef = p1.textButtonRef
	
	return ReactModule.useCallback(function()
		-- upvalues: ItemId (copy), ItemType (copy), MaybePromptForR15UpgradeFunction (copy), CatalogUtilsModule (upval), ItemData (copy), IsSelected (copy), FFlagAXMISEnableMultiShopping (upval), UseDispatchResult (copy), SetTryOnManagerPeekViewStateFunction (upval), PeekViewState (upval), ToggleTryOnThunkModule (upval), UseRoactServiceResult (copy), UseRoactServiceResult2 (copy), UseAvatarRouteResult (copy), UseNavigationResult (copy), WidgetAnalyticsInfo (copy), UseAdaptiveScrollingResult (copy), TextButtonRef (copy), FullView1 (copy), FullView (upval), SetFullViewModule (upval), UseRoactServiceResult1 (copy), IsAvatarR6 (copy), ConstantsModule (upval), SetCurrentToastMessageModule (upval), config (upval), SetAnimationPreviewModule (upval), SendCatalogItemClickAnalyticsFunction (copy), WidgetConstants (upval), AdTrackingData (copy), WebApiModule (upval), IsItemDetailsViewStateFull (copy), CloseAllItemDetailsModule (upval)
		if not ItemId or not ItemType then return end
		if MaybePromptForR15UpgradeFunction() then return end
		local ItemSubType = CatalogUtilsModule.GetItemSubType(ItemType, ItemData)
		
		if FFlagAXMISEnableMultiShopping then
			UseDispatchResult(SetTryOnManagerPeekViewStateFunction(PeekViewState.Closed))
		end
		UseDispatchResult(ToggleTryOnThunkModule(UseRoactServiceResult, UseRoactServiceResult2, ItemType, ItemSubType, ItemId, true, UseAvatarRouteResult, UseNavigationResult, WidgetAnalyticsInfo, nil, not FFlagAXMISEnableMultiShopping and nil))
		
		if not FFlagAXMISEnableMultiShopping and UseAdaptiveScrollingResult then
			UseDispatchResult(SetTryOnManagerPeekViewStateFunction(PeekViewState.Closed))
		end
		if UseAdaptiveScrollingResult and IsSelected then
			UseAdaptiveScrollingResult.setSelectedItemInstance()
		end
		if not IsSelected then
			if UseAdaptiveScrollingResult then
				UseAdaptiveScrollingResult.setSelectedItemInstance(TextButtonRef.current)
			end
			if IsSelected then return end
			if FullView1[UseAvatarRouteResult.opaque.name] == FullView.UIFullView then
				UseDispatchResult(SetFullViewModule(UseRoactServiceResult1, UseAvatarRouteResult.opaque.name, FullView.None))
			end
		end
		if IsSelected then return end
		local AssetType = ItemData and ItemData.assetType
		
		if IsAvatarR6 and AssetType ~= ConstantsModule.AssetTypeIdStrings.HairAccessory and ConstantsModule.LayeredAssetTypes[AssetType] ~= nil then
			UseDispatchResult(SetCurrentToastMessageModule(config))
		end
		if ItemType == ConstantsModule.ItemType.Asset and ConstantsModule.AssetTypeIdToCategory[ItemSubType] == ConstantsModule.AssetCategories.Animation then
			UseDispatchResult(SetAnimationPreviewModule(ItemId, AssetType))
		end
		if SendCatalogItemClickAnalyticsFunction then
			SendCatalogItemClickAnalyticsFunction()
		end
		if WidgetAnalyticsInfo then
			UseRoactServiceResult2.widgetInteractionV2(WidgetAnalyticsInfo, WidgetConstants.ActionType.ITEM_CLICK)
		end
		if AdTrackingData then
			WebApiModule.TrackSponsoredItemClick(UseRoactServiceResult, AdTrackingData)
		end
		if IsItemDetailsViewStateFull then
			UseDispatchResult(CloseAllItemDetailsModule(UseNavigationResult))
		end
	end, {
		UseDispatchResult, ItemId, MaybePromptForR15UpgradeFunction, ItemData,
		UseRoactServiceResult, UseRoactServiceResult2, ItemType, UseAvatarRouteResult,
		UseNavigationResult, WidgetAnalyticsInfo, UseAdaptiveScrollingResult,
		FullView1, IsAvatarR6, IsItemDetailsViewStateFull, UseRoactServiceResult1,
		AdTrackingData, IsSelected, SendCatalogItemClickAnalyticsFunction
	})
end