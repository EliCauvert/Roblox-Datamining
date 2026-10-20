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
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local RemoveLookFromTryOnModule = require(Modules.AvatarExperience.Common.Actions.RemoveLookFromTryOn)
local SetFullViewModule = require(Modules.AvatarExperience.Common.Thunks.SetFullView)
local TryOnLookV2Module = require(Modules.AvatarExperience.Common.Thunks.TryOnLookV2)
local _ = require(Modules.AvatarExperience.Common.Types)

return function(p1)
	-- upvalues: UseNavigationFunction (copy), UseAvatarRouteFunction (copy), UseDispatchFunction (copy), UseRoactServiceFunction (copy), RoactNetworkingModule (copy), AnalyticsModule (copy), UseAdaptiveScrollingFunction (copy), ReactModule (copy), SetFullViewModule (copy), FullView (copy), FFlagAXMISEnableMultiShopping (copy), AvatarScreen (copy), TryOnLookV2Module (copy), PeekViewState (copy), RemoveLookFromTryOnModule (copy), SetTryOnManagerPeekViewStateFunction (copy), WidgetConstants (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworkingModule)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AnalyticsModule)
	local UseAdaptiveScrollingResult = UseAdaptiveScrollingFunction()
	local ItemId = p1.itemId
	local ItemType = p1.itemType
	local IsSelected = p1.isSelected
	local Name = UseAvatarRouteResult and (UseAvatarRouteResult.opaque and UseAvatarRouteResult.opaque.name)
	local IsOrganic = p1.isOrganic
	local WidgetAnalyticsInfo = p1.widgetAnalyticsInfo
	local SendCatalogItemClickAnalyticsFunction = p1.sendCatalogItemClickAnalytics
	local TextButtonRef = p1.textButtonRef
	
	return ReactModule.useCallback(function()
		-- upvalues: ItemId (copy), ItemType (copy), IsSelected (copy), UseAdaptiveScrollingResult (copy), TextButtonRef (copy), Name (copy), UseDispatchResult (copy), SetFullViewModule (upval), UseRoactServiceResult1 (copy), FullView (upval), FFlagAXMISEnableMultiShopping (upval), AvatarScreen (upval), TryOnLookV2Module (upval), UseRoactServiceResult (copy), UseNavigationResult (copy), WidgetAnalyticsInfo (copy), PeekViewState (upval), RemoveLookFromTryOnModule (upval), SetTryOnManagerPeekViewStateFunction (upval), IsOrganic (copy), SendCatalogItemClickAnalyticsFunction (copy), WidgetConstants (upval)
		if not ItemId or not ItemType then return end
		if IsSelected then
			if UseAdaptiveScrollingResult then
				UseAdaptiveScrollingResult.setSelectedItemInstance(nil)
			end
			if FFlagAXMISEnableMultiShopping then
				UseDispatchResult(RemoveLookFromTryOnModule(ItemId))
			end
			UseDispatchResult(SetTryOnManagerPeekViewStateFunction(PeekViewState.Closed))
		else
			if UseAdaptiveScrollingResult then
				local Current = if TextButtonRef then TextButtonRef.current else nil
				
				if Current ~= nil then
					UseAdaptiveScrollingResult.setSelectedItemInstance(Current)
				end
			end
			if Name ~= nil then
				UseDispatchResult(SetFullViewModule(UseRoactServiceResult1, Name, FullView.None))
			end
			UseDispatchResult(TryOnLookV2Module(UseRoactServiceResult, UseNavigationResult, WidgetAnalyticsInfo, ItemId, if FFlagAXMISEnableMultiShopping then PeekViewState.SuperBrief else nil, if FFlagAXMISEnableMultiShopping and Name ~= AvatarScreen.MySharedAvatars then 1 else 2))
		end
		if not IsOrganic then
			UseRoactServiceResult1.widgetInteractionV2(WidgetAnalyticsInfo, if IsSelected then WidgetConstants.ActionType.ITEM_DESELECTED else WidgetConstants.ActionType.ITEM_CLICK)
		elseif not IsSelected and SendCatalogItemClickAnalyticsFunction then
			SendCatalogItemClickAnalyticsFunction()
			
			return
		end
	end, {
		UseDispatchResult, ItemId, p1.itemData, UseRoactServiceResult,
		UseRoactServiceResult1, ItemType, UseNavigationResult, WidgetAnalyticsInfo,
		UseAdaptiveScrollingResult, IsSelected, Name, IsOrganic, TextButtonRef,
		SendCatalogItemClickAnalyticsFunction
	})
end