local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local ClearTryOnsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceRodux).Actions.ClearTryOns
local ToggleTryOnThunkModule = require(Modules.AvatarExperience.Common.Thunks.ToggleTryOnThunk)
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local PeekViewState = require(CorePackages.Workspace.Packages.PeekView).PeekViewState
local DashModule = require(CorePackages.Packages.Dash)
local ItemDetailsModule = require(Modules.AvatarExperience.Common.Components.ItemDetails.ItemDetails)
local ItemDetailsDEPRECATEDModule = require(Modules.AvatarExperience.Common.Components.ItemDetails.ItemDetails_DEPRECATED)
local LookDetailsPeekViewModule = require(Modules.AvatarExperience.Catalog.Components.LookDetails.LookDetailsPeekView)
local SceneInteractionFrameModule = require(Modules.AvatarExperience.Common.Components.Scene.SceneInteractionFrame)
local VRAvatarRotateHandlerModule = require(Modules.AvatarExperience.Common.Components.Scene.VRAvatarRotateHandler)
local AvatarVRPanelWrapperModule = require(Modules.AvatarExperience.Common.Components.AvatarVRPanelWrapper)
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local FocusNavigationUtilsModule = require(CorePackages.Workspace.Packages.FocusNavigationUtils)
local UseFocusNavigableSurfaceRegistryConnectionFunction = FocusNavigationUtilsModule.useFocusNavigableSurfaceRegistryConnection
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local UseAvatarRouteFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.Hooks.useAvatarRoute
local TryOnLookV2Module = require(Modules.AvatarExperience.Common.Thunks.TryOnLookV2)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagAXMigrateItemDetailsInputBindingsToFocusNavigation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateItemDetailsInputBindingsToFocusNavigation
local FFlagAXAvatarSortInDiscoveryUnifiedPurchase = SharedFlagsModule.FFlagAXAvatarSortInDiscoveryUnifiedPurchase
local FFlagAXTryOnScreenImprovements = SharedFlagsModule.FFlagAXTryOnScreenImprovements
local FFlagAXFixTryOnItemVR = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXFixTryOnItemVR
local AXMigrateTryOnItemScreenToAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus and game:DefineFastFlag("AXMigrateTryOnItemScreenToAutofocus", false)
local IsVRAppBuildFunction = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local UseEffectOnMountFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.useEffectOnMount
local UseEffectFunction = ReactModule.useEffect
local UseTryOnAvatarAnimationsModule = require(Modules.AvatarExperience.Catalog.Hooks.useTryOnAvatarAnimations)
local SetTabBarVisibleFunction = require(CorePackages.Workspace.Packages.AppTabBarRodux).Actions.SetTabBarVisible
local UseSelectorSignalFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Hooks.useSelectorSignal
local TutilsModule = require(CorePackages.Packages.tutils)
local AvatarExperienceSaveModule = require(CorePackages.Workspace.Packages.AvatarExperienceSave)
local SelectCharacterData = if FFlagAXTryOnScreenImprovements then AvatarExperienceSaveModule.Selectors.selectCharacterData else nil
local SendAXCounterV2Function = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2

local function useHideTabBarForHomeTryOn(p1)
	-- upvalues: UseDispatchFunction (copy), UseEffectFunction (copy), SetTabBarVisibleFunction (copy)
	local UseDispatchResult = UseDispatchFunction()
	local Params = if p1.navigation and p1.navigation.state and p1.navigation.state.params then p1.navigation.state.params else nil
	UseEffectFunction(function()
		-- upvalues: Params (ref), UseDispatchResult (copy), SetTabBarVisibleFunction (upval)
		if Params and Params.fromHome then
			UseDispatchResult(SetTabBarVisibleFunction(false))
		end
	end, { Params })
end

local function useHideTabBarParam(p1)
	-- upvalues: FFlagAXTryOnScreenImprovements (copy), UseDispatchFunction (copy), UseEffectFunction (copy), SetTabBarVisibleFunction (copy)
	if FFlagAXTryOnScreenImprovements then
		local UseDispatchResult = UseDispatchFunction()
		local Params = if p1.navigation and p1.navigation.state and p1.navigation.state.params then p1.navigation.state.params else nil
		UseEffectFunction(function()
			-- upvalues: Params (ref), UseDispatchResult (copy), SetTabBarVisibleFunction (upval)
			if Params and Params.hideTab then
				UseDispatchResult(SetTabBarVisibleFunction(false))
			end
		end, { Params })
		
		return
	end
end

return require(Modules.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper)(function(p1)
	-- upvalues: UseDispatchFunction (copy), UseRoactServiceModule (copy), AnalyticsModule (copy), FFlagAXTryOnScreenImprovements (copy), UseSelectorSignalFunction (copy), SelectCharacterData (copy), TutilsModule (copy), ReactModule (copy), ClearTryOnsFunction (copy), UseTryOnAvatarAnimationsModule (copy), UseAvatarRouteFunction (copy), RoactNetworkingModule (copy), ToggleTryOnThunkModule (copy), useHideTabBarParam (copy), useHideTabBarForHomeTryOn (copy), PeekViewState (copy), UseEffectOnMountFunction (copy), SendAXCounterV2Function (copy), ConstantsModule (copy), FFlagAXAvatarSortInDiscoveryUnifiedPurchase (copy), TryOnLookV2Module (copy), AXMigrateTryOnItemScreenToAutofocus (copy), UseFocusNavigableSurfaceRegistryConnectionFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), RoactModule (copy), SceneInteractionFrameModule (copy), LookDetailsPeekViewModule (copy), FFlagAXMigrateItemDetailsInputBindingsToFocusNavigation (copy), ItemDetailsModule (copy), ItemDetailsDEPRECATEDModule (copy), DashModule (copy), FFlagAXFixTryOnItemVR (copy), IsVRAppBuildFunction (copy), AvatarVRPanelWrapperModule (copy), VRAvatarRotateHandlerModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(AnalyticsModule)
	local UseSelectorSignalResult = if FFlagAXTryOnScreenImprovements then UseSelectorSignalFunction(SelectCharacterData, TutilsModule.deepEqual) else nil
	
	if not FFlagAXTryOnScreenImprovements then
		ReactModule.useEffect(function()
			-- upvalues: UseDispatchResult (copy), ClearTryOnsFunction (upval)
			return function()
				-- upvalues: UseDispatchResult (upval), ClearTryOnsFunction (upval)
				UseDispatchResult(ClearTryOnsFunction())
			end
		end, {})
	end
	local UseTryOnAvatarAnimationsModuleResult = UseTryOnAvatarAnimationsModule()
	local ItemType = nil
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseRoactServiceModuleResult1 = UseRoactServiceModule(RoactNetworkingModule)
	local Params = nil
	local NoSimpleView = nil
	
	if p1.navigation and p1.navigation.state and p1.navigation.state.params then
		Params = p1.navigation.state.params
		
		if Params and (FFlagAXTryOnScreenImprovements or Params.fromHome) then
			ItemType = Params.itemType
		end
		if FFlagAXTryOnScreenImprovements then
			NoSimpleView = Params.simpleView == nil or Params.simpleView
		end
	end
	if FFlagAXTryOnScreenImprovements then
		ReactModule.useEffect(function()
			-- upvalues: UseSelectorSignalResult (copy), UseDispatchResult (copy), ClearTryOnsFunction (upval), ToggleTryOnThunkModule (upval), UseRoactServiceModuleResult1 (copy), UseRoactServiceModuleResult (copy), p1 (copy), UseTryOnAvatarAnimationsModuleResult (copy)
			local UseSelectorSignalResultResult = UseSelectorSignalResult(false)
			
			return function()
				-- upvalues: UseDispatchResult (upval), ClearTryOnsFunction (upval), UseSelectorSignalResultResult (copy), ToggleTryOnThunkModule (upval), UseRoactServiceModuleResult1 (upval), UseRoactServiceModuleResult (upval), p1 (upval), UseTryOnAvatarAnimationsModuleResult (upval)
				UseDispatchResult(ClearTryOnsFunction())
				
				for _, tryOnItem in UseSelectorSignalResultResult.tryOn.OutfitTryOn.TryOnItems do
					UseDispatchResult(ToggleTryOnThunkModule(UseRoactServiceModuleResult1, UseRoactServiceModuleResult, tryOnItem.itemType, tryOnItem.itemSubType, tryOnItem.itemId, true, nil, p1.navigation))
					
					if UseTryOnAvatarAnimationsModuleResult then
						UseTryOnAvatarAnimationsModuleResult(tryOnItem.itemId, tryOnItem.itemType, tryOnItem.itemSubType)
					end
				end
			end
		end, {})
	end
	if FFlagAXTryOnScreenImprovements then
		useHideTabBarParam(p1)
	else
		useHideTabBarForHomeTryOn(p1)
	end
	local config = {
		isTryOn = true,
		showPeekViewInSuperBrief = true,
		avatarRoute = UseAvatarRouteResult,
		navigation = p1.navigation,
		initialPeekViewState = PeekViewState.SuperBrief
	}
	UseEffectOnMountFunction(function()
		-- upvalues: FFlagAXTryOnScreenImprovements (upval), SendAXCounterV2Function (upval), ConstantsModule (upval), Params (ref), UseRoactServiceModuleResult (copy), ItemType (ref), FFlagAXAvatarSortInDiscoveryUnifiedPurchase (upval), UseDispatchResult (copy), TryOnLookV2Module (upval), UseRoactServiceModuleResult1 (copy), PeekViewState (upval), ToggleTryOnThunkModule (upval), p1 (copy), UseTryOnAvatarAnimationsModuleResult (copy)
		if FFlagAXTryOnScreenImprovements then
			SendAXCounterV2Function(ConstantsModule.Counter.TryOnItemView)
		end
		if not FFlagAXTryOnScreenImprovements and (Params == nil or not Params.fromHome) then return end
		if not FFlagAXTryOnScreenImprovements then
			UseRoactServiceModuleResult.homepageWidgetItemClick(Params.itemId, Params.itemType)
		end
		local ItemId = Params.itemId
		local ItemSubType = Params.itemSubType
		local ItemSubTypeName = Params.itemSubTypeName
		
		if ItemSubType == nil then
			if ItemType == "Asset" then
				ItemSubType = ConstantsModule.AssetTypeIdStrings[ItemSubTypeName]
			elseif ItemType == "Bundle" then
				ItemSubType = ConstantsModule.BundleTypeNameToIdStringForCatalogHydration[ItemSubTypeName]
			end
		end
		if ItemType == "Look" then
			UseDispatchResult(TryOnLookV2Module(UseRoactServiceModuleResult1, nil, {
				itemId = ItemId,
				itemType = ItemType,
				surface = if FFlagAXAvatarSortInDiscoveryUnifiedPurchase then Params.fromSurface else nil
			}, ItemId, PeekViewState.SuperBrief))
			
			return
		end
		if ItemId and ItemType and ItemSubType then
			UseDispatchResult(ToggleTryOnThunkModule(UseRoactServiceModuleResult1, UseRoactServiceModuleResult, ItemType, ItemSubType, ItemId, true, nil, p1.navigation))
			
			if UseTryOnAvatarAnimationsModuleResult then
				UseTryOnAvatarAnimationsModuleResult(ItemId, ItemType, ItemSubType)
			end
		end
	end)
	local UseRefResult = nil
	
	if AXMigrateTryOnItemScreenToAutofocus then
		UseRefResult = ReactModule.useRef(nil)
		UseFocusNavigableSurfaceRegistryConnectionFunction(UseRefResult.current, FocusNavigableSurfaceIdentifierEnum.CentralOverlay, true)
	end
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 1)
	}, {
		SceneInteractionFrame = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 1,
			Size = UDim2.fromScale(1, 1)
		}, RoactModule.createElement(SceneInteractionFrameModule)),
		ItemDetails = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 2,
			Size = UDim2.fromScale(1, 1),
			ref = if AXMigrateTryOnItemScreenToAutofocus then UseRefResult else nil
		}, {
			Content = if ItemType == "Look" then RoactModule.createElement(LookDetailsPeekViewModule, config) else RoactModule.createElement(if FFlagAXMigrateItemDetailsInputBindingsToFocusNavigation then ItemDetailsModule else ItemDetailsDEPRECATEDModule, if FFlagAXTryOnScreenImprovements then DashModule.join(p1, { simpleView = NoSimpleView }) else p1)
		}),
		VRAvatarRotateHandler = if FFlagAXFixTryOnItemVR and IsVRAppBuildFunction() then RoactModule.createElement(AvatarVRPanelWrapperModule, { roundedCornersFrame = false, panelPlacement = "Center" }, {
			VRAvatarRotateHandler = RoactModule.createElement(VRAvatarRotateHandlerModule)
		}) else nil
	})
end)