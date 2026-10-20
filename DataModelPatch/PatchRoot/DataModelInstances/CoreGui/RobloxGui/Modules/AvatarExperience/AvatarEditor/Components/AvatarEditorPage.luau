local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local ReactModule = require(CorePackages.Packages.React)
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local AnalyticsModule = require(Modules.AvatarExperience.Common.Services.Analytics)
local AnalyticsModule1 = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local AvatarExperienceViewModule = require(Modules.AvatarExperience.Common.Components.AvatarExperienceView)
local AvatarNavigationItemsViewModule = require(Modules.AvatarExperience.AvatarEditor.Components.AvatarNavigationItemsView)
local NavigationEventsLoggerModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.Debug.NavigationEventsLogger)
local WithStackVisibilityWrapperModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local SetItemDetailsPeekViewStateFunction = require(CorePackages.Workspace.Packages.AvatarExperienceRodux).Actions.SetItemDetailsPeekViewState
local OpenItemPromptModule = require(Modules.AvatarExperience.Common.Thunks.OpenItemPrompt)
local SetFullViewModule = require(Modules.AvatarExperience.Common.Thunks.SetFullView)
local FullView = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Enums.FullView
local OpenQuickMenuModule = require(Modules.AvatarExperience.Common.Thunks.OpenQuickMenu)
local RoactUtilsModule = require(CorePackages.Workspace.Packages.RoactUtils)
local ExternalEventConnection = RoactUtilsModule.ExternalEventConnection
local IsGamepadInputFunction = RoactUtilsModule.isGamepadInput
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local SelectIsPortraitModule = require(Modules.AvatarExperience.Common.Selectors.selectIsPortrait)
local SelectIsFullViewModule = require(Modules.AvatarExperience.Common.Selectors.selectIsFullView)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local AXDisableAlwaysRenderedScreensIXPModule = require(Modules.AvatarExperience.Experiments.AXDisableAlwaysRenderedScreensIXP)
local AXCombineGetOutfitDispatchesIXPModule = require(Modules.AvatarExperience.Experiments.AXCombineGetOutfitDispatchesIXP)
local OnFocusExposureLoggerModule = require(Modules.AvatarExperience.Catalog.Components.OnFocusExposureLogger)
local OnFocusExperimentExposureLoggerModule = require(Modules.AvatarExperience.Catalog.Components.OnFocusExperimentExposureLogger)
local UseAvatarExperienceFocusNavigationBindingsModule = require(Modules.AvatarExperience.Common.Hooks.useAvatarExperienceFocusNavigationBindings)
local UseAvatarEditorPageFocusNavigationBindingsModule = require(script.Parent.useAvatarEditorPageFocusNavigationBindings)
local UseOpenQuickMenuCallbackModule = require(Modules.AvatarExperience.Common.Hooks.useOpenQuickMenuCallback)
local UseQuickMenuAvailableModule = require(Modules.AvatarExperience.Common.Hooks.useQuickMenuAvailable)
local UseOverlayClosedCallbackModule = require(Modules.AvatarExperience.Common.Hooks.useOverlayClosedCallback)
local RobloxAppHooksModule = require(CorePackages.Workspace.Packages.RobloxAppHooks)
local UseUiModeInfoFunction = RobloxAppHooksModule.useUiModeInfo
local UseRoactServiceFunction = RobloxAppHooksModule.useRoactService
local UiMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).UiMode
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local AvatarEditorTopBarModule = require(Modules.AvatarExperience.AvatarEditor.Components.AvatarEditorTopBar)
local UniversalAppCameraIXPTestModule = require(Modules.AvatarExperience.Flags.UniversalAppCameraIXPTest)
local AvatarMarketplaceBackendIXPTestsModule = require(Modules.AvatarExperience.Flags.AvatarMarketplaceBackendIXPTests)
local SendAXCounterV2Function = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local GetFFlagAXDisableEditorLayerExposureModule = require(Modules.AvatarExperience.Flags.GetFFlagAXDisableEditorLayerExposure)
local GetFlagAXEnableInitialTopLevelPageCounterModule = require(Modules.AvatarExperience.Flags.GetFlagAXEnableInitialTopLevelPageCounter)
local FFlagAXCustomizeOverhaulEditorExposureModule = require(Modules.AvatarExperience.Flags.FFlagAXCustomizeOverhaulEditorExposure)
local FFlagAXCatalogAndEditorExposureUseFStringLayerModule = require(Modules.AvatarExperience.Flags.FFlagAXCatalogAndEditorExposureUseFStringLayer)
local GetFStringAXCatalogAndEditorExposureLayerNameModule = require(Modules.AvatarExperience.Flags.GetFStringAXCatalogAndEditorExposureLayerName)
local FFlagAXMigrateAvatarEditorPageInputBindings = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAvatarEditorPageInputBindings
local FFlagDynamicHeadsMigration = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagDynamicHeadsMigration
local GetHeadShapeInventoryStoreModule = require(Modules.AvatarExperience.AvatarRefinement.HeadRefinement.Stores.GetHeadShapeInventoryStore)
local AvatarEditorPage = RoactModule.PureComponent:extend("AvatarEditorPage")

function AvatarEditorPage.init(p1)
	-- upvalues: RoactModule (copy), UserInputService (copy), IsGamepadInputFunction (copy), UtilsModule (copy), GetFlagAXEnableInitialTopLevelPageCounterModule (copy), SendAXCounterV2Function (copy), ConstantsModule (copy)
	p1.topBarRef = RoactModule.createRef()
	p1.sceneUIContainerRef = RoactModule.createRef()
	p1.refinementButtonsRef = RoactModule.createRef()
	p1.quickButtonsRef = RoactModule.createRef()
	p1:setState({
		lastInputIsGamepad = IsGamepadInputFunction((UserInputService:GetLastInputType()))
	})
	
	function p1.changeView()
		-- upvalues: p1 (copy), UtilsModule (upval)
		p1.props.setFullView(p1.props.avatarExperienceAnalytics, p1.props.avatarRoute.opaque.name, (UtilsModule.getNewFullViewEnum(p1.props.fullView)))
	end
	
	p1.defaultChildRef = RoactModule.createRef()
	
	function p1.lastInputTypeChangedCallback(p2)
		-- upvalues: IsGamepadInputFunction (upval), p1 (copy)
		local IsGamepadInput = IsGamepadInputFunction(p2)
		
		if IsGamepadInput ~= p1.state.lastInputIsGamepad then
			p1:setState({ lastInputIsGamepad = IsGamepadInput })
		end
	end
	
	if GetFlagAXEnableInitialTopLevelPageCounterModule() then
		SendAXCounterV2Function(ConstantsModule.Counter.TopLevelPageInitialView.Editor)
	end
end

if FFlagAXCustomizeOverhaulEditorExposureModule then
	function AvatarEditorPage:didMount()
		-- upvalues: IxpUtilsModule (copy), FFlagAXCatalogAndEditorExposureUseFStringLayerModule (copy), GetFStringAXCatalogAndEditorExposureLayerNameModule (copy), AppUserLayers (copy)
		IxpUtilsModule.logLayerExposure(if FFlagAXCatalogAndEditorExposureUseFStringLayerModule then GetFStringAXCatalogAndEditorExposureLayerNameModule() else AppUserLayers.AvatarExperienceUAAllViews)
	end
end
if not FFlagAXMigrateAvatarEditorPageInputBindings then
	function AvatarEditorPage.getInputBindings(p1)
		-- upvalues: AvatarScreen (copy), CryoModule (copy), RoactGamepadModule (copy), NavigationUtilsModule (copy)
		local AvatarRoute = p1.props.avatarRoute
		local JoinResult = {}
		
		if AvatarRoute.current.name == AvatarScreen.ItemDetails then
			JoinResult = CryoModule.Dictionary.join(JoinResult, {
				NavigateBack = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonB, function()
					-- upvalues: NavigationUtilsModule (upval), p1 (copy)
					NavigationUtilsModule.closeFocusedScreen(p1.props.navigation)
				end),
				OpenItemPrompt = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonX, function()
					-- upvalues: p1 (copy), AvatarRoute (copy)
					p1.props.openItemPrompt(p1.props.networking, p1.props.catalogAnalytics, p1.props.overlayClosedCallback, p1.props.navigation, AvatarRoute)
				end, { key = "Feature.Catalog.Action.Buy" }),
				OpenCatalogContextMenu = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonL3, function()
					-- upvalues: p1 (copy), AvatarScreen (upval), AvatarRoute (copy)
					p1.props.navigation.navigate(AvatarScreen.CatalogContextMenu, {
						itemId = AvatarRoute.current.params.itemId,
						itemType = AvatarRoute.current.params.itemType,
						onOverlayClosed = p1.props.overlayClosedCallback
					})
				end, { key = "Feature.Catalog.Action.ItemOptions" })
			})
		end
		return JoinResult
	end
end
function AvatarEditorPage.render(p1)
	-- upvalues: FullView (copy), RoactModule (copy), OnFocusExposureLoggerModule (copy), UniversalAppCameraIXPTestModule (copy), OnFocusExperimentExposureLoggerModule (copy), AXDisableAlwaysRenderedScreensIXPModule (copy), AXCombineGetOutfitDispatchesIXPModule (copy), GetFFlagAXDisableEditorLayerExposureModule (copy), AvatarMarketplaceBackendIXPTestsModule (copy), ExternalEventConnection (copy), UserInputService (copy), NavigationEventsLoggerModule (copy), AvatarExperienceViewModule (copy), ReactModule (copy), AvatarEditorTopBarModule (copy), AvatarNavigationItemsViewModule (copy)
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		[RoactModule.Ref] = p1.ref
	}, {
		UniversalAppCameraExposure = RoactModule.createElement(OnFocusExposureLoggerModule, { ixpTest = UniversalAppCameraIXPTestModule }),
		OnFocusExperimentExposureLogger = RoactModule.createElement(OnFocusExperimentExposureLoggerModule, {
			ixpTests = {
				if AXDisableAlwaysRenderedScreensIXPModule.isEnabled() then AXDisableAlwaysRenderedScreensIXPModule else nil,
				if AXCombineGetOutfitDispatchesIXPModule.isEnabled() then AXCombineGetOutfitDispatchesIXPModule else nil
			}
		}),
		EditorExposure = if GetFFlagAXDisableEditorLayerExposureModule() then nil else RoactModule.createElement(OnFocusExposureLoggerModule, { ixpTest = AvatarMarketplaceBackendIXPTestsModule.Editor }),
		LastInputTypeChangedConnection = RoactModule.createElement(ExternalEventConnection, {
			event = UserInputService.LastInputTypeChanged,
			callback = p1.lastInputTypeChangedCallback
		}),
		NavigationEventsLogger = RoactModule.createElement(NavigationEventsLoggerModule, { pageName = "AvatarEditor" }),
		AvatarExperienceView = RoactModule.createElement(AvatarExperienceViewModule, {
			allowAdaptiveScrolling = true,
			bottomBarEnabled = false,
			changeViewFunction = p1.changeView,
			isSceneFullView = p1.props.fullView == FullView.SceneFullView,
			isUIFullView = p1.props.fullView == FullView.UIFullView,
			topBar = ReactModule.createElement(AvatarEditorTopBarModule, {
				showManageOutfitButton = p1.props.showManageOutfitButton,
				overlayClosedCallback = p1.props.overlayClosedCallback,
				topBarRef = p1.topBarRef,
				NextSelectionDown = p1.defaultChildRef,
				NextSelectionRight = p1.sceneUIContainerRef,
				navigation = p1.props.navigation,
				avatarRoute = p1.props.avatarRoute
			}),
			refinementButtonsRef = p1.refinementButtonsRef,
			quickButtonsRef = p1.quickButtonsRef,
			ref = p1.sceneUIContainerRef,
			NextSelectionDown = p1.defaultChildRef,
			NextSelectionLeft = p1.topBarRef,
			defaultChildRef = p1.defaultChildRef
		}, {
			AvatarNavigationItemsView = RoactModule.createElement(AvatarNavigationItemsViewModule, {
				defaultChildRef = p1.defaultChildRef,
				NextSelectionUp = p1.topBarRef,
				NextSelectionRight = p1.quickButtonsRef
			})
		})
	})
end

local WithStackVisibilityWrapperModuleResult = WithStackVisibilityWrapperModule((RoactRoduxModule.connect(function(p2, _)
	-- upvalues: UtilsModule (copy), SelectIsFullViewModule (copy), AvatarScreen (copy), SelectIsPortraitModule (copy)
	return {
		fullView = SelectIsFullViewModule(p2, AvatarScreen.AvatarEditor),
		isPortrait = SelectIsPortraitModule(p2),
		itemDetailsExpanded = p2.AvatarExperience.Common.ItemDetailsExpanded,
		showManageOutfitButton = UtilsModule.getAvatarEditorCategoryInfoFromState(p2).ManageOutfitsEnabled == true,
		isCurrentUserAllowedToCreateShares = p2.AvatarExperience.Catalog.Metadata.isCurrentUserAllowedToCreateShares
	}
end, function(Callback)
	-- upvalues: FFlagAXMigrateAvatarEditorPageInputBindings (copy), OpenItemPromptModule (copy), SetItemDetailsPeekViewStateFunction (copy), OpenQuickMenuModule (copy), SetFullViewModule (copy)
	return {
		openItemPrompt = if FFlagAXMigrateAvatarEditorPageInputBindings then nil else function(p2, p3, p4, p5, p6)
			-- upvalues: Callback (copy), OpenItemPromptModule (upval)
			Callback(OpenItemPromptModule(p2, p3, p4, p5, p6))
		end,
		setItemDetailsPeekViewState = if FFlagAXMigrateAvatarEditorPageInputBindings then nil else function(p2)
			-- upvalues: Callback (copy), SetItemDetailsPeekViewStateFunction (upval)
			Callback(SetItemDetailsPeekViewStateFunction(p2))
		end,
		navigateIntoQuickMenu = if FFlagAXMigrateAvatarEditorPageInputBindings then nil else function(p2, p3)
			-- upvalues: Callback (copy), OpenQuickMenuModule (upval)
			Callback(OpenQuickMenuModule(p2, p3))
		end,
		setFullView = function(p2, p3, p4)
			-- upvalues: Callback (copy), SetFullViewModule (upval)
			Callback(SetFullViewModule(p2, p3, p4))
		end
	}
end)((RoactServices.connect({
	avatarExperienceAnalytics = AnalyticsModule,
	catalogAnalytics = if FFlagAXMigrateAvatarEditorPageInputBindings then nil else AnalyticsModule1,
	networking = if FFlagAXMigrateAvatarEditorPageInputBindings then nil else RoactNetworkingModule
})(AvatarEditorPage)))))

return function(p2)
	-- upvalues: FFlagDynamicHeadsMigration (copy), ReactModule (copy), GetHeadShapeInventoryStoreModule (copy), UseOverlayClosedCallbackModule (copy), FFlagAXMigrateAvatarEditorPageInputBindings (copy), UseDispatchFunction (copy), UseRoactServiceFunction (copy), AnalyticsModule1 (copy), RoactNetworkingModule (copy), UseQuickMenuAvailableModule (copy), UseAvatarRouteFunction (copy), AvatarScreen (copy), UseOpenQuickMenuCallbackModule (copy), NavigationUtilsModule (copy), OpenItemPromptModule (copy), UseAvatarEditorPageFocusNavigationBindingsModule (copy), UseAvatarExperienceFocusNavigationBindingsModule (copy), CryoModule (copy), UseUiModeInfoFunction (copy), UiMode (copy), WithStackVisibilityWrapperModuleResult (ref)
	if FFlagDynamicHeadsMigration then
		ReactModule.useEffect(function()
			-- upvalues: GetHeadShapeInventoryStoreModule (upval)
			local HeadShapeInventoryStoreModule = GetHeadShapeInventoryStoreModule(false)
			
			if HeadShapeInventoryStoreModule then
				HeadShapeInventoryStoreModule.getInventory(false)
			end
		end, {})
	end
	local UseOverlayClosedCallbackModuleResult = UseOverlayClosedCallbackModule()
	local UseAvatarEditorPageFocusNavigationBindingsModuleResult = nil
	
	if FFlagAXMigrateAvatarEditorPageInputBindings then
		local UseDispatchResult = UseDispatchFunction()
		local UseRoactServiceResult = UseRoactServiceFunction(AnalyticsModule1)
		local UseRoactServiceResult1 = UseRoactServiceFunction(RoactNetworkingModule)
		local UseQuickMenuAvailableModuleResult = UseQuickMenuAvailableModule()
		local UseAvatarRouteResult = UseAvatarRouteFunction()
		local IsNameMatch = UseAvatarRouteResult.current.name == AvatarScreen.ItemDetails
		local UseOpenQuickMenuCallbackModuleResult = UseOpenQuickMenuCallbackModule(UseOverlayClosedCallbackModuleResult)
		local UseResult = ReactModule.useCallback(function()
			-- upvalues: UseDispatchResult (copy), OpenItemPromptModule (upval), UseRoactServiceResult1 (copy), UseRoactServiceResult (copy), UseOverlayClosedCallbackModuleResult (copy), p2 (copy), UseAvatarRouteResult (copy)
			UseDispatchResult(OpenItemPromptModule(UseRoactServiceResult1, UseRoactServiceResult, UseOverlayClosedCallbackModuleResult, p2.navigation, UseAvatarRouteResult))
		end, {
			UseDispatchResult, UseRoactServiceResult1, UseRoactServiceResult,
			UseOverlayClosedCallbackModuleResult, p2.navigation, UseAvatarRouteResult
		})
		local UseResult1 = ReactModule.useCallback(function()
			-- upvalues: p2 (copy), AvatarScreen (upval), UseAvatarRouteResult (copy), UseOverlayClosedCallbackModuleResult (copy)
			p2.navigation.navigate(AvatarScreen.CatalogContextMenu, {
				itemId = UseAvatarRouteResult.current.params.itemId,
				itemType = UseAvatarRouteResult.current.params.itemType,
				onOverlayClosed = UseOverlayClosedCallbackModuleResult
			})
		end, {
			p2.navigation,
			UseAvatarRouteResult,
			UseOverlayClosedCallbackModuleResult
		})
		UseAvatarEditorPageFocusNavigationBindingsModuleResult = UseAvatarEditorPageFocusNavigationBindingsModule({
			onNavigateBack = ReactModule.useCallback(function(p3)
				-- upvalues: NavigationUtilsModule (upval), p2 (copy)
				p3.cancelled = true
				NavigationUtilsModule.closeFocusedScreen(p2.navigation)
			end, { p2.navigation }),
			onOpenQuickMenu = if UseQuickMenuAvailableModuleResult then UseOpenQuickMenuCallbackModuleResult else nil,
			onOpenBuyItemPrompt = if IsNameMatch then UseResult else nil,
			onOpenContextMenu = if IsNameMatch then UseResult1 else nil
		})
	else
		UseAvatarEditorPageFocusNavigationBindingsModuleResult = UseAvatarExperienceFocusNavigationBindingsModule({
			overlayClosedCallback = UseOverlayClosedCallbackModuleResult
		})
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		ref = UseAvatarEditorPageFocusNavigationBindingsModuleResult
	}, ReactModule.createElement(WithStackVisibilityWrapperModuleResult, (CryoModule.Dictionary.join(p2, {
		overlayClosedCallback = UseOverlayClosedCallbackModuleResult,
		is10ftUI = UseUiModeInfoFunction().uiMode == UiMode.TenFoot
	}))))
end