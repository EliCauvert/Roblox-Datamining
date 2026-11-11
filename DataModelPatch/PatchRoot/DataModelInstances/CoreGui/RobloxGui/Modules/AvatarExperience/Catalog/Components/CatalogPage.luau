local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local Focusable = RoactGamepadModule.Focusable
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactUtilsModule = require(CorePackages.Workspace.Packages.RoactUtils)
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local ExternalEventConnection = RoactUtilsModule.ExternalEventConnection
local IsGamepadInputFunction = RoactUtilsModule.isGamepadInput
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local Images = require(CorePackages.Packages.UIBlox).App.ImageSet.Images
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local AvatarExperienceCatalogModule = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog)
local GetHeadShapeInventoryStoreModule = require(Modules.AvatarExperience.AvatarRefinement.HeadRefinement.Stores.GetHeadShapeInventoryStore)
local AppPageModule = require(Modules.LuaApp.AppPage)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local AvatarScreenProperties = AvatarExperienceNavigationModule.AvatarRoute.AvatarScreenProperties
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local AnalyticsModule = require(Modules.AvatarExperience.Common.Services.Analytics)
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local NavigationEventsLoggerModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.Debug.NavigationEventsLogger)
local WithStackVisibilityWrapperModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper)
local WithMappedNavigationParamsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local FocusNavigationEventNameEnum = require(CorePackages.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum
local UseFocusOnMountFunction = require(CorePackages.Workspace.Packages.FocusNavigationUtils).useFocusOnMount
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local WithNamedRefsModule = require(Modules.AvatarExperience.Common.Context.withNamedRefs)
local UseTopBarSearchSignalModule = require(Modules.LuaApp.Context.useTopBarSearchSignal)
local MakeTitleDropDownModule = require(Modules.AvatarExperience.Common.Components.TopBar.makeTitleDropDown)
local AXTransitionSegmentedMenuModule = if require(Modules.AvatarExperience.Flags.GetFFlagAXTransitionMenuV2)() then require(Modules.AvatarExperience.Common.Components.AXTransitionSegmentedMenu) else require(Modules.AvatarExperience.Common.Components.AXTransitionSegmentedMenu_DEPRECATED)
local MakeAvatarBackButtonModule = require(Modules.AvatarExperience.Common.Components.TopBar.makeAvatarBackButton)
local AvatarExperienceViewModule = require(Modules.AvatarExperience.Common.Components.AvatarExperienceView)
local NavigationItemsViewModule = require(Modules.AvatarExperience.Catalog.Components.NavigationItemsView)
local TopBarModule = require(Modules.LuaApp.Components.TopBar.TopBar)
local GamepadFocusHandlerForPageModule = require(Modules.AvatarExperience.Common.Components.GamepadFocusHandlerForPage)
local BoundInputsUpdaterModule = require(Modules.AvatarExperience.Common.Components.BoundInputsUpdater)
local AnalyticsModule1 = require(Modules.AvatarExperience.AvatarEditor.Services.Analytics)
local AnalyticsModule2 = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local PeekViewState = require(CorePackages.Workspace.Packages.PeekView).PeekViewState
local AvatarExperienceRoduxModule = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local SetItemDetailsPeekViewStateFunction = AvatarExperienceRoduxModule.Actions.SetItemDetailsPeekViewState
local SetTryOnManagerPeekViewStateFunction = AvatarExperienceRoduxModule.Actions.SetTryOnManagerPeekViewState
local OpenItemPromptModule = require(Modules.AvatarExperience.Common.Thunks.OpenItemPrompt)
local SetFullViewModule = require(Modules.AvatarExperience.Common.Thunks.SetFullView)
local FullView = AvatarExperienceCommonModule.Enums.FullView
local OpenQuickMenuModule = require(Modules.AvatarExperience.Common.Thunks.OpenQuickMenu)
local RobloxAppEnumsModule = require(CorePackages.Workspace.Packages.RobloxAppEnums)
local AndroidBackButtonConnectionModule = require(Modules.LuaApp.Navigation.AndroidBackButtonConnection)
local IsAvatarRouteVisibleModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.Utils.isAvatarRouteVisible)
local SelectIsPortraitModule = require(Modules.AvatarExperience.Common.Selectors.selectIsPortrait)
local SelectIsFullViewModule = require(Modules.AvatarExperience.Common.Selectors.selectIsFullView)
local ResetNavigationHistoryModule = require(Modules.LuaApp.Thunks.ResetNavigationHistory)
local InstantResetNavigationHistoryModule = require(Modules.LuaApp.Thunks.InstantResetNavigationHistory)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local OnFocusExposureLoggerModule = require(Modules.AvatarExperience.Catalog.Components.OnFocusExposureLogger)
local OnFocusExperimentExposureLoggerModule = require(Modules.AvatarExperience.Catalog.Components.OnFocusExperimentExposureLogger)
local UseAvatarExperienceFocusNavigationBindingsModule = require(Modules.AvatarExperience.Common.Hooks.useAvatarExperienceFocusNavigationBindings)
local UseOpenQuickMenuCallbackModule = require(Modules.AvatarExperience.Common.Hooks.useOpenQuickMenuCallback)
local UseQuickMenuAvailableModule = require(Modules.AvatarExperience.Common.Hooks.useQuickMenuAvailable)
local UseOverlayClosedCallbackModule = require(Modules.AvatarExperience.Common.Hooks.useOverlayClosedCallback)
local UseUiModeInfoFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useUiModeInfo
local UiMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).UiMode
local SendAXCounterV2Function = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local IsVRAppBuildFunction = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local GetFFlagAvatarAutocompleteEnabledForAllModule = require(Modules.AvatarExperience.Flags.GetFFlagAvatarAutocompleteEnabledForAll)
local GetFFlagLooksIXPLoggingModule = require(Modules.AvatarExperience.Flags.GetFFlagLooksIXPLogging)
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local IXPServiceWrapper = require(CorePackages.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagDynamicHeadsMigration = AvatarExperienceFlagsModule.FFlagDynamicHeadsMigration
local AvatarMarketplaceBackendIXPTestsModule = require(Modules.AvatarExperience.Flags.AvatarMarketplaceBackendIXPTests)
local UniversalAppCameraIXPTestModule = require(Modules.AvatarExperience.Flags.UniversalAppCameraIXPTest)
local AXDisableAlwaysRenderedScreensIXPModule = require(Modules.AvatarExperience.Experiments.AXDisableAlwaysRenderedScreensIXP)
local AXCatalogPerfReduxReductionIXPModule = require(Modules.AvatarExperience.Experiments.AXCatalogPerfReduxReductionIXP)
local AXAvatarsTabIXP = AvatarExperienceCommonModule.Experiments.AXAvatarsTabIXP
local GetBackendLayerNamesForCatalogFunction = AvatarExperienceCommonModule.Utils.getBackendLayerNamesForCatalog
local GetFFlagAXDisableRelevanceRecommendationsLayerExposureModule = require(Modules.AvatarExperience.Flags.GetFFlagAXDisableRelevanceRecommendationsLayerExposure)
local GetFFlagAXDisableSortsLayerExposureModule = require(Modules.AvatarExperience.Flags.GetFFlagAXDisableSortsLayerExposure)
local GetFFlagAXDisableRecommendationsAndSearchLayerExposureModule = require(Modules.AvatarExperience.Flags.GetFFlagAXDisableRecommendationsAndSearchLayerExposure)
local GetFlagAXEnableInitialTopLevelPageCounterModule = require(Modules.AvatarExperience.Flags.GetFlagAXEnableInitialTopLevelPageCounter)
local FFlagAXMigrateCatalogPageInputBindings = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateCatalogPageInputBindings
local GetFStringAXCatalogAndEditorExposureLayerNameModule = require(Modules.AvatarExperience.Flags.GetFStringAXCatalogAndEditorExposureLayerName)
local FFlagAXAvatarTimeoutFlow = AvatarExperienceFlagsModule.FFlagAXAvatarTimeoutFlow
local FFlagAXRefetchAvatarOnTimeout = AvatarExperienceFlagsModule.FFlagAXRefetchAvatarOnTimeout
local FFlagAXMISEnableMultiShopping = AvatarExperienceFlagsModule.FFlagAXMISEnableMultiShopping
local FFlagAXMakeupReleaseFTUX = AvatarExperienceFlagsModule.FFlagAXMakeupReleaseFTUX
local FFlagAXOpaqueMarketplaceTopbar = AvatarExperienceFlagsModule.FFlagAXOpaqueMarketplaceTopbar
local FFlagAXBackendDrivenCatalogLayers = AvatarExperienceFlagsModule.FFlagAXBackendDrivenCatalogLayers
local AXItemCardComponentsMemoExposure = game:DefineFastFlag("AXItemCardComponentsMemoExposure", false)
local AXItemCardComponentsMemoLayerName = game:DefineFastString("AXItemCardComponentsMemoLayerName", "AvatarExperience.UA.MarketplaceView")
local AXEnableIXPCounters2 = game:DefineFastFlag("AXEnableIXPCounters2", false)
local AXCustomizeOverhaulCatalogExposure2 = game:DefineFastFlag("AXCustomizeOverhaulCatalogExposure2", false)
local FFlagAXCatalogAndEditorExposureUseFStringLayerModule = require(Modules.AvatarExperience.Flags.FFlagAXCatalogAndEditorExposureUseFStringLayer)
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local GetCatalogCategoriesStoreModule = require(Modules.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore)
local AXMISExperimentLayerName = game:DefineFastString("AXMISExperimentLayerName", AppUserLayers.AvatarExperienceUAMarketplaceView)
local AXMISExposureLogging = game:DefineFastFlag("AXMISExposureLogging", false)
local AXTaxonomyM20ExperimentLayerName = game:DefineFastString("AXTaxonomyM20ExperimentLayerName", AppUserLayers.AvatarExperienceUAMarketplaceView)
local FFlagAXExpandPeekViewOnFirstScroll = AvatarExperienceFlagsModule.FFlagAXExpandPeekViewOnFirstScroll
local FFlagAXEnableCategoryPillsExposureLogging = AvatarExperienceFlagsModule.FFlagAXEnableCategoryPillsExposureLogging
local FFlagAXHideMenuOnScroll = AvatarExperienceFlagsModule.FFlagAXHideMenuOnScroll
local FFlagAXFixCatalogRefreshRendering = AvatarExperienceFlagsModule.FFlagAXFixCatalogRefreshRendering
local FFlagBasedExposureLoggingCatalogPage = AvatarExperienceFlagsModule.FFlagBasedExposureLoggingCatalogPage
local FFlagAXEnableTaxonomyM20ExposureLoggingCatalog = AvatarExperienceFlagsModule.FFlagAXEnableTaxonomyM20ExposureLoggingCatalog
local FFlagAXMoveCatalogFilterToL1NavigationExposureLogging = AvatarExperienceFlagsModule.FFlagAXMoveCatalogFilterToL1NavigationExposureLogging
local FFlagEnableLeftNavOnConsole = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole
local FFlagFlyoutNavigationInMarketplace = require(CorePackages.Workspace.Packages.SharedFlags).FFlagFlyoutNavigationInMarketplace
local FFlagEnableFlyoutSidePanelModule = require(Modules.LuaApp.Flags.FFlagEnableFlyoutSidePanel)
local MeTabFlyoutLeftItemModule = if FFlagFlyoutNavigationInMarketplace and FFlagEnableFlyoutSidePanelModule then require(Modules.AvatarExperience.Common.Components.TopBar.MeTabFlyoutLeftItem) else nil
local FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup = AvatarExperienceFlagsModule.FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup
local FFlagAXHideCatalogShortcutsInFullView = AvatarExperienceFlagsModule.FFlagAXHideCatalogShortcutsInFullView
local FFlagAXCatalogCategoriesSDUIExposureLogging = game:DefineFastFlag("FFlagAXCatalogCategoriesSDUIExposureLogging", false)
local FStringAXCatalogCategoriesSDUIExposureLayer = game:DefineFastString("FStringAXCatalogCategoriesSDUIExposureLayer", AppUserLayers.AvatarExperienceUAMarketplaceView)
local AXTestSkeletonInCatalogExposureLogging = game:DefineFastFlag("AXTestSkeletonInCatalogExposureLogging", false)
local AXTestSkeletonInCatalogLayerName = game:DefineFastString("AXTestSkeletonInCatalogLayerName", "AvatarExperience.UA.MarketplaceView")
local UseTTINavigationTrackingFunction = require(CorePackages.Workspace.Packages.TTINavigationTracking).useTTINavigationTracking
local FFlagAXCatalogM41CategoriesExposureLogging = AvatarExperienceFlagsModule.FFlagAXCatalogM41CategoriesExposureLogging
local WidgetsPercievedTTIManager = require(CorePackages.Workspace.Packages.AvatarExperienceTTIPerformance).WidgetsPercievedTTIManager
local FFlagAXHideMenuOnScrollExposureLogging = AvatarExperienceFlagsModule.FFlagAXHideMenuOnScrollExposureLogging
local FFlagAXMakeupCategoryPositionExperimentExposureLogging = AvatarExperienceFlagsModule.FFlagAXMakeupCategoryPositionExperimentExposureLogging
local AXVirtualizedListConfigExposureLogging = game:DefineFastFlag("AXVirtualizedListConfigExposureLogging", false)
local FFlagAXCatalogItemCardDarkerBackgroundLogExposure = AvatarExperienceFlagsModule.FFlagAXCatalogItemCardDarkerBackgroundLogExposure
local UseCatalogPageFocusNavigationBindingsModule = require(script.Parent.useCatalogPageFocusNavigationBindings)
local UseCatalogPageRevertToLastEquippedStateHookModule = require(script.Parent.useCatalogPageRevertToLastEquippedStateHook)
local UseCatalogPageTimeoutPromptFunction = AvatarExperienceCatalogModule.Hooks.useCatalogPageTimeoutPrompt
local UseCatalogPageMakeupReleaseFtuxFunction = AvatarExperienceCatalogModule.Hooks.useCatalogPageMakeupReleaseFtux
local FFlagLuaAppsDefaultSelection = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppsDefaultSelection
local RefetchAvatarDataModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.RefetchAvatarData)
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local IconsActionsTruncationExpand = Images["icons/actions/truncationExpand"]
local CatalogCategories = AvatarExperienceCommonModule.Enums.CatalogCategories

local function selectTryOnManagerViewState(p1)
	return p1.AvatarExperience.Common.ItemDetailsPeekView.tryOnManagerViewState
end

local function selectIsTryOnButtonShowing(p1): boolean
	-- upvalues: CryoModule (copy)
	return #CryoModule.Dictionary.values(p1.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems) > 1
end

local CatalogPage = RoactModule.PureComponent:extend("CatalogPage")
CatalogPage.validateProps = TModule.strictInterface({
	fullView = TModule.optional(TModule.userdata),
	isPortrait = TModule.optional(TModule.boolean),
	itemDetailsExpanded = TModule.optional(TModule.boolean),
	tryOnManagerPeekViewState = TModule.optional(TModule.valueOf(PeekViewState)),
	tryOnItems = TModule.optional(TModule.table),
	openItemPrompt = TModule.callback,
	setItemDetailsPeekViewState = TModule.callback,
	navigateIntoQuickMenu = TModule.optional(TModule.callback),
	setFullView = TModule.callback,
	resetNavigationHistory = TModule.callback,
	instantResetNavigationHistory = TModule.callback,
	setTryOnManagerPeekViewState = TModule.callback,
	resetSearchCategoryAndSubcategory = TModule.callback,
	namedRefs = TModule.table,
	prevNavPage = TModule.optional(TModule.string),
	prevNavHistory = TModule.optional(TModule.table),
	navigation = TModule.optional(TModule.table),
	avatarRoute = TModule.optional(TModule.table),
	avatarExperienceAnalytics = TModule.optional(TModule.table),
	networking = TModule.optional(TModule.callback),
	appAnalytics = TModule.optional(TModule.table),
	avatarEditorAnalytics = TModule.optional(TModule.table),
	catalogAnalytics = TModule.optional(TModule.table),
	show3dView = TModule.optional(TModule.boolean),
	itemId = TModule.optional(TModule.string),
	itemType = TModule.optional(TModule.string),
	isFirstItemDetails = TModule.optional(TModule.boolean),
	is10ftUI = TModule.boolean,
	focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else TModule.table,
	androidBackButtonConnection = TModule.table,
	overlayClosedCallback = TModule.callback,
	defaultFocusRef = if FFlagLuaAppsDefaultSelection then TModule.optional(TModule.callback) else nil,
	fetchItemFailed = if FFlagAXFixCatalogRefreshRendering then TModule.optional(TModule.boolean) else nil,
	wasItemEquipped = if FFlagAXFixCatalogRefreshRendering then TModule.optional(TModule.boolean) else nil,
	category = TModule.optional(TModule.string),
	subcategory = TModule.optional(TModule.string),
	taxonomy = TModule.optional(TModule.string)
})

function CatalogPage.init(p1)
	-- upvalues: RoactModule (copy), RoactGamepadModule (copy), UserInputService (copy), IsGamepadInputFunction (copy), UtilsModule (copy), AvatarScreen (copy), FullView (copy), FFlagAXExpandPeekViewOnFirstScroll (copy), AppPageModule (copy), MakeTitleDropDownModule (copy), MakeAvatarBackButtonModule (copy), GetFFlagAvatarAutocompleteEnabledForAllModule (copy), GetFlagAXEnableInitialTopLevelPageCounterModule (copy), SendAXCounterV2Function (copy), ConstantsModule (copy), FFlagAXEnableCategoryPillsExposureLogging (copy), IXPServiceWrapper (copy), AppUserLayers (copy), FFlagAXEnableTaxonomyM20ExposureLoggingCatalog (copy), AXTaxonomyM20ExperimentLayerName (copy), AXTestSkeletonInCatalogExposureLogging (copy), AXTestSkeletonInCatalogLayerName (copy)
	p1.topBarRef = RoactModule.createRef()
	p1.sceneUIContainerRef = RoactModule.createRef()
	p1.titleDropDownRef = RoactModule.createRef()
	p1.topBarRenderRightRef = RoactModule.createRef()
	p1.refinementButtonsRef = RoactModule.createRef()
	p1.multiTryOnBottomBarRef = RoactModule.createRef()
	p1.quickButtonsRef = RoactModule.createRef()
	p1.itemDetailsPeekViewRefs = RoactGamepadModule.createRefCache()
	p1:setState({
		lastInputIsGamepad = IsGamepadInputFunction((UserInputService:GetLastInputType()))
	})
	
	function p1.setDefaultRefOverride(p2)
		-- upvalues: p1 (copy), RoactModule (upval)
		p1:setState({ defaultRefOverride = p2 or RoactModule.None })
	end
	
	function p1.changeView()
		-- upvalues: p1 (copy), UtilsModule (upval)
		p1.props.setFullView(p1.props.avatarExperienceAnalytics, p1.props.avatarRoute.opaque.name, (UtilsModule.getNewFullViewEnum(p1.props.fullView)))
	end
	
	function p1.setUIFullView()
		-- upvalues: p1 (copy), AvatarScreen (upval), FullView (upval)
		local AvatarExperienceAnalytics = p1.props.avatarExperienceAnalytics
		
		if p1.props.isPortrait then
			p1.props.setFullView(AvatarExperienceAnalytics, AvatarScreen.CatalogSearch, FullView.UIFullView)
		end
	end
	
	function p1.isAvatarScreen(PrevNavPage)
		-- upvalues: AvatarScreen (upval)
		return (rawget(AvatarScreen, PrevNavPage))
	end
	
	function p1.topBarBackButtonActivated()
		-- upvalues: FFlagAXExpandPeekViewOnFirstScroll (upval), p1 (copy), FullView (upval), AvatarScreen (upval), AppPageModule (upval)
		if FFlagAXExpandPeekViewOnFirstScroll and p1.props.fullView == FullView.UIFullView then
			p1.props.setFullView(p1.props.avatarExperienceAnalytics, p1.props.avatarRoute.opaque.name, FullView.None)
			
			return
		end
		local Navigation = p1.props.navigation
		local AvatarEditorAnalytics = p1.props.avatarEditorAnalytics
		local PrevNavPage = p1.props.prevNavPage
		local PrevNavHistory = p1.props.prevNavHistory
		
		if PrevNavPage and PrevNavHistory then
			if p1.isAvatarScreen(PrevNavPage) then
				p1.props.navigation.navigate(PrevNavPage)
			else
				p1.props.resetNavigationHistory(PrevNavHistory)
			end
		else
			Navigation.navigate(if p1.props.is10ftUI then AvatarScreen.AvatarExperienceLandingPage else AppPageModule.Home)
		end
		AvatarEditorAnalytics.catalogToAvatarBackButton()
	end
	
	p1.defaultChildRef = RoactModule.createRef()
	
	function p1.lastInputTypeChangedCallback(p2)
		-- upvalues: IsGamepadInputFunction (upval), p1 (copy)
		local IsGamepadInput = IsGamepadInputFunction(p2)
		
		if IsGamepadInput ~= p1.state.lastInputIsGamepad then
			p1:setState({ lastInputIsGamepad = IsGamepadInput })
		end
	end
	
	p1.titleDropDown = MakeTitleDropDownModule("Feature.Avatar.Action.Marketplace", p1.props.overlayClosedCallback)
	p1.backButton = MakeAvatarBackButtonModule(p1.topBarBackButtonActivated)
	
	function p1.onConfirmSearchCallback()
		-- upvalues: p1 (copy), GetFFlagAvatarAutocompleteEnabledForAllModule (upval)
		p1.props.resetSearchCategoryAndSubcategory()
		
		if GetFFlagAvatarAutocompleteEnabledForAllModule() and p1.setUIFullView then
			p1.setUIFullView()
		end
	end
	
	if GetFlagAXEnableInitialTopLevelPageCounterModule() then
		SendAXCounterV2Function(ConstantsModule.Counter.TopLevelPageInitialView.Catalog)
	end
	if FFlagAXEnableCategoryPillsExposureLogging then
		IXPServiceWrapper:LogFlagLinkedUserLayerExposure(AppUserLayers.AvatarExperienceUAAllViews)
	end
	if FFlagAXEnableTaxonomyM20ExposureLoggingCatalog then
		IXPServiceWrapper:LogFlagLinkedUserLayerExposure(AXTaxonomyM20ExperimentLayerName)
	end
	if AXTestSkeletonInCatalogExposureLogging then
		IXPServiceWrapper:LogFlagLinkedUserLayerExposure(AXTestSkeletonInCatalogLayerName)
	end
end

function CatalogPage.getBestDefaultRefForPage(p1)
	return if p1.state.defaultRefOverride then p1.state.defaultRefOverride else p1.defaultChildRef
end

if not FFlagAXMigrateCatalogPageInputBindings then
	function CatalogPage.getInputBindings(p1)
		-- upvalues: AvatarScreenProperties (copy), CryoModule (copy), AvatarScreen (copy), FFlagAXMISEnableMultiShopping (copy), RoactGamepadModule (copy), NavigationUtilsModule (copy), PeekViewState (copy)
		local AvatarRoute = p1.props.avatarRoute
		local Name = AvatarRoute.current.name
		local IsMultiTryOn = AvatarScreenProperties[AvatarRoute.opaque.name].isMultiTryOn
		local v1 = #CryoModule.Dictionary.values(p1.props.tryOnItems) > 1
		local JoinResult = {
			OpenTryOnManager = if Name == AvatarScreen.TryOnManager or not IsMultiTryOn and not FFlagAXMISEnableMultiShopping then nil elseif v1 then RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonY, function()
				-- upvalues: NavigationUtilsModule (upval), p1 (copy), AvatarScreen (upval)
				NavigationUtilsModule.closeFiltersAndItemDetails(p1.props.navigation)
				p1.props.navigation.navigate(AvatarScreen.TryOnManager)
			end, { key = "Feature.Catalog.Label.TryOns" }) else nil
		}
		
		if Name == AvatarScreen.ItemDetails then
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
			
			return JoinResult
		end
		if Name == AvatarScreen.TryOnManager then
			JoinResult = CryoModule.Dictionary.join(JoinResult, {
				OpenCloseTryOnManager = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonY, function()
					-- upvalues: p1 (copy), PeekViewState (upval)
					local TryOnManagerPeekViewState = p1.props.tryOnManagerPeekViewState
					
					if TryOnManagerPeekViewState == PeekViewState.Full or TryOnManagerPeekViewState == PeekViewState.Extended then
						p1.props.setTryOnManagerPeekViewState(PeekViewState.Brief)
						
						return
					else
						p1.props.setTryOnManagerPeekViewState(PeekViewState.Full)
					end
				end, { key = "Feature.Catalog.Label.TryOns" })
			})
			
			return JoinResult
		end
		if Name == AvatarScreen.LookDetails then
			JoinResult = CryoModule.Dictionary.join(JoinResult, {
				OpenCloseTryOnManager = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonY, function()
					-- upvalues: p1 (copy), PeekViewState (upval)
					local TryOnManagerPeekViewState = p1.props.tryOnManagerPeekViewState
					
					if TryOnManagerPeekViewState == PeekViewState.Full or TryOnManagerPeekViewState == PeekViewState.Extended then
						p1.props.setTryOnManagerPeekViewState(PeekViewState.Brief)
						
						return
					else
						p1.props.setTryOnManagerPeekViewState(PeekViewState.Full)
					end
				end, { key = "Feature.Catalog.Label.TryOns" })
			})
		end
		return JoinResult
	end
end
if AXEnableIXPCounters2 then
	function CatalogPage:sendExperimentCountersOnce() end
end
function CatalogPage.didMount(p1)
	-- upvalues: IsAvatarRouteVisibleModule (copy), AXEnableIXPCounters2 (copy), AXCustomizeOverhaulCatalogExposure2 (copy), IxpUtilsModule (copy), FFlagAXCatalogAndEditorExposureUseFStringLayerModule (copy), GetFStringAXCatalogAndEditorExposureLayerNameModule (copy), AppUserLayers (copy), AXMISExposureLogging (copy), IXPServiceWrapper (copy), AXMISExperimentLayerName (copy), AXItemCardComponentsMemoExposure (copy), AXItemCardComponentsMemoLayerName (copy)
	if not p1.props.is10ftUI and IsAvatarRouteVisibleModule(p1.props) then
		p1.props.androidBackButtonConnection.connect(p1.topBarBackButtonActivated)
	end
	if AXEnableIXPCounters2 then
		p1:sendExperimentCountersOnce()
	end
	if AXCustomizeOverhaulCatalogExposure2 then
		IxpUtilsModule.logLayerExposure(if FFlagAXCatalogAndEditorExposureUseFStringLayerModule then GetFStringAXCatalogAndEditorExposureLayerNameModule() else AppUserLayers.AvatarExperienceUAAllViews)
	end
	if AXMISExposureLogging then
		IXPServiceWrapper:LogFlagLinkedUserLayerExposure(AXMISExperimentLayerName)
	end
	if AXItemCardComponentsMemoExposure then
		IXPServiceWrapper:LogFlagLinkedUserLayerExposure(AXItemCardComponentsMemoLayerName)
	end
end

function CatalogPage.willUnmount(p1)
	p1.props.androidBackButtonConnection.disconnect()
end

function CatalogPage.didUpdate(p1, p2)
	-- upvalues: IsAvatarRouteVisibleModule (copy)
	if not p1.props.is10ftUI then
		if not IsAvatarRouteVisibleModule(p2) and IsAvatarRouteVisibleModule(p1.props) then
			p1.props.androidBackButtonConnection.connect(p1.topBarBackButtonActivated)
			
			return
		end
		if IsAvatarRouteVisibleModule(p2) and not IsAvatarRouteVisibleModule(p1.props) then
			p1.props.androidBackButtonConnection.disconnect()
		end
	end
end

function CatalogPage.willUpdate(p1, p2)
	-- upvalues: FFlagAXExpandPeekViewOnFirstScroll (copy), MakeAvatarBackButtonModule (copy)
	if FFlagAXExpandPeekViewOnFirstScroll and p2.fullView ~= p1.props.fullView then
		p1.backButton = MakeAvatarBackButtonModule(p1.topBarBackButtonActivated, p1:getBackButtonIcon(p2.fullView))
	end
end

if FFlagAXExpandPeekViewOnFirstScroll then
	function CatalogPage.getBackButtonIcon(p1, FullView1)
		-- upvalues: FullView (copy), IconsActionsTruncationExpand (copy)
		if not FullView1 then
			FullView1 = p1.props.fullView
		end
		return if FullView1 == FullView.UIFullView then IconsActionsTruncationExpand else nil
	end
end
function CatalogPage.renderTopBar(p1)
	-- upvalues: WithLocalizationFunction (copy), GetFFlagAvatarAutocompleteEnabledForAllModule (copy), IsVRAppBuildFunction (copy), FFlagFlyoutNavigationInMarketplace (copy), FFlagEnableFlyoutSidePanelModule (copy), MeTabFlyoutLeftItemModule (copy), AXTransitionSegmentedMenuModule (copy), TopBarModule (copy), RoactModule (copy), RobloxAppEnumsModule (copy), FFlagAXOpaqueMarketplaceTopbar (copy), FFlagEnableLeftNavOnConsole (copy)
	local IsPortrait = p1.props.isPortrait
	local Show3dView = p1.props.show3dView
	
	return WithLocalizationFunction({ title = "Feature.Avatar.Action.Marketplace" })(function(p2)
		-- upvalues: GetFFlagAvatarAutocompleteEnabledForAllModule (upval), IsVRAppBuildFunction (upval), FFlagFlyoutNavigationInMarketplace (upval), FFlagEnableFlyoutSidePanelModule (upval), MeTabFlyoutLeftItemModule (upval), p1 (copy), AXTransitionSegmentedMenuModule (upval), TopBarModule (upval), RoactModule (upval), RobloxAppEnumsModule (upval), FFlagAXOpaqueMarketplaceTopbar (upval), FFlagEnableLeftNavOnConsole (upval), IsPortrait (copy), Show3dView (copy)
		local ZIndex: number = if GetFFlagAvatarAutocompleteEnabledForAllModule() then 3 else 2
		local BackButton = nil
		local TitleDropDown = nil
		local RightItems = nil
		
		if IsVRAppBuildFunction() then
			TitleDropDown = nil
			BackButton = nil
			RightItems = nil
		else
			BackButton = if FFlagFlyoutNavigationInMarketplace and FFlagEnableFlyoutSidePanelModule then MeTabFlyoutLeftItemModule else p1.backButton
			TitleDropDown = if p1.props.is10ftUI then p1.titleDropDown else AXTransitionSegmentedMenuModule
			RightItems = { TopBarModule.SearchButton }
		end
		return RoactModule.createElement(TopBarModule.Container, {
			forceCompactMode = true,
			searchType = RobloxAppEnumsModule.SearchTypes.Catalog,
			titleText = p2.title,
			ZIndex = ZIndex,
			transparentBackground = if FFlagAXOpaqueMarketplaceTopbar or FFlagEnableLeftNavOnConsole then if IsPortrait then Show3dView else false else Show3dView,
			hideSiteMessageBanner = IsPortrait,
			[RoactModule.Ref] = p1.topBarRef,
			setDefaultRefOverride = p1.setDefaultRefOverride,
			NextSelectionDown = p1.defaultChildRef,
			NextSelectionRight = p1.sceneUIContainerRef,
			onConfirmSearchCallback = p1.onConfirmSearchCallback,
			leftItem = BackButton,
			centerItem = TitleDropDown,
			rightItems = RightItems,
			useParentSizeForCenterItem = true,
			shouldNavigateToSearchLandingPage = true
		})
	end)
end

function CatalogPage.render(p1)
	-- upvalues: FullView (copy), AvatarScreen (copy), RoactModule (copy), Focusable (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), FFlagAXMigrateCatalogPageInputBindings (copy), BoundInputsUpdaterModule (copy), ExternalEventConnection (copy), UserInputService (copy), NavigationEventsLoggerModule (copy), OnFocusExposureLoggerModule (copy), UniversalAppCameraIXPTestModule (copy), GetFFlagAXDisableRelevanceRecommendationsLayerExposureModule (copy), AvatarMarketplaceBackendIXPTestsModule (copy), GetFFlagAXDisableRecommendationsAndSearchLayerExposureModule (copy), GetFFlagLooksIXPLoggingModule (copy), GetFFlagAXDisableSortsLayerExposureModule (copy), OnFocusExperimentExposureLoggerModule (copy), AXDisableAlwaysRenderedScreensIXPModule (copy), AXCatalogPerfReduxReductionIXPModule (copy), AXAvatarsTabIXP (copy), FFlagAXBackendDrivenCatalogLayers (copy), GetBackendLayerNamesForCatalogFunction (copy), FFlagBasedExposureLoggingCatalogPage (copy), FFlagAXMoveCatalogFilterToL1NavigationExposureLogging (copy), AppUserLayers (copy), FFlagAXCatalogCategoriesSDUIExposureLogging (copy), FStringAXCatalogCategoriesSDUIExposureLayer (copy), FFlagAXCatalogM41CategoriesExposureLogging (copy), FFlagAXHideMenuOnScrollExposureLogging (copy), AXVirtualizedListConfigExposureLogging (copy), FFlagAXMakeupCategoryPositionExperimentExposureLogging (copy), FFlagAXCatalogItemCardDarkerBackgroundLogExposure (copy), AvatarExperienceViewModule (copy), FFlagAXHideMenuOnScroll (copy), FFlagAXExpandPeekViewOnFirstScroll (copy), GamepadFocusHandlerForPageModule (copy), NavigationItemsViewModule (copy), FFlagLuaAppsDefaultSelection (copy)
	local NamedRefs = p1.props.namedRefs
	local IsNameMatch = p1.props.avatarRoute.current.name == AvatarScreen.SortAndFilters
	
	return RoactModule.createElement(Focusable.Frame, {
		BackgroundTransparency = 1,
		restorePreviousChildFocus = false,
		Size = UDim2.new(1, 0, 1, 0),
		focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.props.focusController,
		defaultChild = p1:getBestDefaultRefForPage(),
		inputBindings = if FFlagAXMigrateCatalogPageInputBindings then nil else p1:getInputBindings(),
		ref = NamedRefs[AvatarScreen.Catalog]
	}, {
		BoundInputsUpdater = if FFlagAXMigrateAXToGlobalAutofocus then nil else RoactModule.createElement(BoundInputsUpdaterModule),
		LastInputTypeChangedConnection = RoactModule.createElement(ExternalEventConnection, {
			event = UserInputService.LastInputTypeChanged,
			callback = p1.lastInputTypeChangedCallback
		}),
		NavigationEventsLogger = RoactModule.createElement(NavigationEventsLoggerModule, { pageName = "Catalog" }),
		UniversalAppCameraExposure = RoactModule.createElement(OnFocusExposureLoggerModule, { ixpTest = UniversalAppCameraIXPTestModule }),
		RelevanceRecommendationsExposure = if GetFFlagAXDisableRelevanceRecommendationsLayerExposureModule() then nil else RoactModule.createElement(OnFocusExposureLoggerModule, {
			ixpTest = AvatarMarketplaceBackendIXPTestsModule.RelevanceRecommendations
		}),
		RecommendationsAndSearchExposure = if GetFFlagAXDisableRecommendationsAndSearchLayerExposureModule() then nil else RoactModule.createElement(OnFocusExposureLoggerModule, {
			ixpTest = AvatarMarketplaceBackendIXPTestsModule.RecommendationsAndSearch
		}),
		SortsExposure = if GetFFlagLooksIXPLoggingModule() then RoactModule.createElement(OnFocusExposureLoggerModule, { ixpTest = AvatarMarketplaceBackendIXPTestsModule.Sorts }) else not GetFFlagAXDisableSortsLayerExposureModule() and RoactModule.createElement(OnFocusExposureLoggerModule, { ixpTest = AvatarMarketplaceBackendIXPTestsModule.Sorts }),
		SearchWidgetsExposure = GetFFlagLooksIXPLoggingModule() and RoactModule.createElement(OnFocusExposureLoggerModule, {
			ixpTest = AvatarMarketplaceBackendIXPTestsModule.SearchWidgets
		}),
		OnFocusExperimentExposureLogger = RoactModule.createElement(OnFocusExperimentExposureLoggerModule, {
			ixpTests = {
				if AXDisableAlwaysRenderedScreensIXPModule.isEnabled() then AXDisableAlwaysRenderedScreensIXPModule else nil,
				if AXCatalogPerfReduxReductionIXPModule.isEnabled() then AXCatalogPerfReduxReductionIXPModule else nil,
				if AXAvatarsTabIXP.isEnabled() then AXAvatarsTabIXP else nil
			},
			layers = if FFlagAXBackendDrivenCatalogLayers then GetBackendLayerNamesForCatalogFunction() else nil,
			flagIXPTestLayers = if FFlagBasedExposureLoggingCatalogPage then {
				if FFlagAXMoveCatalogFilterToL1NavigationExposureLogging then AppUserLayers.AvatarExperienceUAAllViews else nil,
				if FFlagAXCatalogCategoriesSDUIExposureLogging then FStringAXCatalogCategoriesSDUIExposureLayer else nil,
				if FFlagAXCatalogM41CategoriesExposureLogging then AppUserLayers.AvatarExperienceUAMarketplaceView else nil,
				if FFlagAXHideMenuOnScrollExposureLogging then AppUserLayers.AvatarExperienceUAMarketplaceView else nil,
				if AXVirtualizedListConfigExposureLogging then AppUserLayers.AvatarExperienceUAMarketplaceView else nil,
				if FFlagAXMakeupCategoryPositionExperimentExposureLogging then AppUserLayers.AvatarExperienceUAMarketplaceView else nil,
				if FFlagAXCatalogItemCardDarkerBackgroundLogExposure then AppUserLayers.AvatarExperienceUAAllViews else nil
			} else nil
		}),
		AvatarExperienceView = RoactModule.createElement(AvatarExperienceViewModule, {
			changeViewFunction = p1.changeView,
			allowAdaptiveScrolling = true,
			adaptiveScrollingProps = if FFlagAXHideMenuOnScroll or FFlagAXExpandPeekViewOnFirstScroll then {
				enableExpandPeekViewOnUpwardScroll = if FFlagAXExpandPeekViewOnFirstScroll then true else nil,
				enableAnimatedVisibility = if FFlagAXHideMenuOnScroll then true else nil
			} else nil,
			isDisabled = not p1.props.show3dView,
			isSceneFullView = p1.props.fullView == FullView.SceneFullView,
			isUIFullView = p1.props.fullView == FullView.UIFullView,
			topBar = p1:renderTopBar(),
			refinementButtonsRef = p1.refinementButtonsRef,
			quickButtonsRef = p1.quickButtonsRef,
			[RoactModule.Ref] = p1.sceneUIContainerRef,
			NextSelectionDown = p1.defaultChildRef,
			NextSelectionLeft = p1.topBarRef,
			defaultChildRef = p1.defaultChildRef,
			multiTryOnBottomBarRef = p1.multiTryOnBottomBarRef,
			itemDetailsPeekViewRefs = p1.itemDetailsPeekViewRefs,
			showUndoRedo = true,
			showSaveButton = false
		}, {
			GamepadFocusHandlerForPage = if FFlagAXMigrateAXToGlobalAutofocus then nil else RoactModule.createElement(GamepadFocusHandlerForPageModule, {
				captureFocusOnMount = true,
				focusController = p1.props.focusController
			}),
			NavigationAndItemsList = RoactModule.createElement(NavigationItemsViewModule, {
				defaultChildRef = p1.defaultChildRef,
				defaultFocusRef = if FFlagLuaAppsDefaultSelection then p1.props.defaultFocusRef else nil,
				NextSelectionUp = p1.topBarRef,
				NextSelectionRight = if p1.props.avatarRoute.current.name == AvatarScreen.TryOnManager then NamedRefs[AvatarScreen.TryOnManager] elseif p1.props.avatarRoute.current.name == AvatarScreen.LookDetails then NamedRefs[AvatarScreen.LookDetails] elseif IsNameMatch then NamedRefs[AvatarScreen.SortAndFilters] else p1.quickButtonsRef,
				multiTryOnBottomBarRef = p1.multiTryOnBottomBarRef,
				itemDetailsPeekViewRefs = p1.itemDetailsPeekViewRefs
			})
		})
	})
end

local WithNamedRefsModuleResult = WithNamedRefsModule((WithMappedNavigationParamsModule(WithStackVisibilityWrapperModule((RoactAppPolicy.connect(function(p2, _)
	return { show3dView = p2.getCatalogShow3dView() }
end)((RoactServices.connect({
	avatarExperienceAnalytics = AnalyticsModule,
	networking = RoactNetworkingModule,
	appAnalytics = RoactAnalyticsModule,
	avatarEditorAnalytics = AnalyticsModule1,
	catalogAnalytics = AnalyticsModule2
})((RoactRoduxModule.connect(function(p2)
	-- upvalues: SelectIsFullViewModule (copy), AvatarScreen (copy), SelectIsPortraitModule (copy), FFlagAXMigrateCatalogPageInputBindings (copy)
	return {
		fullView = SelectIsFullViewModule(p2, AvatarScreen.Catalog),
		isPortrait = SelectIsPortraitModule(p2),
		itemDetailsExpanded = p2.AvatarExperience.Common.ItemDetailsExpanded,
		tryOnManagerPeekViewState = p2.AvatarExperience.Common.ItemDetailsPeekView.tryOnManagerViewState,
		tryOnItems = if FFlagAXMigrateCatalogPageInputBindings then nil else p2.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
	}
end, function(Callback)
	-- upvalues: OpenItemPromptModule (copy), SetItemDetailsPeekViewStateFunction (copy), OpenQuickMenuModule (copy), SetFullViewModule (copy), ResetNavigationHistoryModule (copy), InstantResetNavigationHistoryModule (copy), SetTryOnManagerPeekViewStateFunction (copy), GetCatalogCategoriesStoreModule (copy), ConstantsModule (copy), MutedErrorModule (copy)
	return {
		openItemPrompt = function(p2, p3, p4, p5, p6)
			-- upvalues: Callback (copy), OpenItemPromptModule (upval)
			Callback(OpenItemPromptModule(p2, p3, p4, p5, p6))
		end,
		setItemDetailsPeekViewState = function(p2)
			-- upvalues: Callback (copy), SetItemDetailsPeekViewStateFunction (upval)
			Callback(SetItemDetailsPeekViewStateFunction(p2))
		end,
		navigateIntoQuickMenu = function(p2, p3)
			-- upvalues: Callback (copy), OpenQuickMenuModule (upval)
			Callback(OpenQuickMenuModule(p2, p3))
		end,
		setFullView = function(p2, p3, p4)
			-- upvalues: Callback (copy), SetFullViewModule (upval)
			Callback(SetFullViewModule(p2, p3, p4))
		end,
		resetNavigationHistory = function(p2)
			-- upvalues: Callback (copy), ResetNavigationHistoryModule (upval)
			return Callback(ResetNavigationHistoryModule(nil, p2))
		end,
		instantResetNavigationHistory = function(p2)
			-- upvalues: Callback (copy), InstantResetNavigationHistoryModule (upval)
			return Callback(InstantResetNavigationHistoryModule(nil, p2))
		end,
		setTryOnManagerPeekViewState = function(p2)
			-- upvalues: Callback (copy), SetTryOnManagerPeekViewStateFunction (upval)
			Callback(SetTryOnManagerPeekViewStateFunction(p2))
		end,
		resetSearchCategoryAndSubcategory = function()
			-- upvalues: GetCatalogCategoriesStoreModule (upval), ConstantsModule (upval), MutedErrorModule (upval)
			if not GetCatalogCategoriesStoreModule.getCatalogSearchSelectionStore().changeCategory(ConstantsModule.DefaultCatalogCategoryId, nil) then
				MutedErrorModule("Failed to select subcategory in ResetSearchCategoryAndSubcategory thunk")
			end
		end
	}
end)(CatalogPage))))))), nil)))

return function(p2)
	-- upvalues: SharedFlagsModule (copy), UseTTINavigationTrackingFunction (copy), FFlagAXRefetchAvatarOnTimeout (copy), UseRoactServiceFunction (copy), RoactNetworkingModule (copy), UseDispatchFunction (copy), FFlagDynamicHeadsMigration (copy), ReactModule (copy), GetHeadShapeInventoryStoreModule (copy), WidgetsPercievedTTIManager (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), RoactGamepadModule (copy), AndroidBackButtonConnectionModule (copy), UseOverlayClosedCallbackModule (copy), FFlagAXMigrateCatalogPageInputBindings (copy), AnalyticsModule2 (copy), UseTopBarSearchSignalModule (copy), UseQuickMenuAvailableModule (copy), UseAvatarRouteFunction (copy), AvatarScreen (copy), AvatarScreenProperties (copy), UseSelectorFunction (copy), selectIsTryOnButtonShowing (copy), UseOpenQuickMenuCallbackModule (copy), NavigationUtilsModule (copy), OpenItemPromptModule (copy), selectTryOnManagerViewState (copy), PeekViewState (copy), SetTryOnManagerPeekViewStateFunction (copy), FocusNavigationEventNameEnum (copy), FFlagAXHideCatalogShortcutsInFullView (copy), SelectIsFullViewModule (copy), FullView (copy), UseCatalogPageFocusNavigationBindingsModule (copy), UseAvatarExperienceFocusNavigationBindingsModule (copy), FFlagAXAvatarTimeoutFlow (copy), RefetchAvatarDataModule (copy), UseCatalogPageTimeoutPromptFunction (copy), FFlagAXMakeupReleaseFTUX (copy), GetCatalogCategoriesStoreModule (copy), CatalogCategories (copy), UseCatalogPageMakeupReleaseFtuxFunction (copy), FFlagLuaAppsDefaultSelection (copy), ReactFocusNavigationModule (copy), UseFocusOnMountFunction (copy), CryoModule (copy), UseUiModeInfoFunction (copy), UiMode (copy), FFlagEnableLeftNavOnConsole (copy), FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup (copy), UseCatalogPageRevertToLastEquippedStateHookModule (copy), WithNamedRefsModuleResult (ref)
	if SharedFlagsModule.FFlagLuaAppNavigationTTITracking then
		UseTTINavigationTrackingFunction("NavigateTo_Catalog")
	end
	local v1 = nil
	local Callback = nil
	
	if FFlagAXRefetchAvatarOnTimeout then
		v1 = UseRoactServiceFunction(RoactNetworkingModule)
		Callback = UseDispatchFunction()
	end
	if FFlagDynamicHeadsMigration then
		ReactModule.useEffect(function()
			-- upvalues: GetHeadShapeInventoryStoreModule (upval)
			local HeadShapeInventoryStoreModule = GetHeadShapeInventoryStoreModule(false)
			
			if HeadShapeInventoryStoreModule then
				HeadShapeInventoryStoreModule.getInventory(false)
			end
		end, {})
	end
	WidgetsPercievedTTIManager.Hooks.useRenderAndMountedTracking()
	local Current = if FFlagAXMigrateAXToGlobalAutofocus then nil else ReactModule.useRef(RoactGamepadModule.createFocusController()).current
	local Current1 = ReactModule.useRef(AndroidBackButtonConnectionModule()).current
	local UseOverlayClosedCallbackModuleResult = UseOverlayClosedCallbackModule(if FFlagAXMigrateAXToGlobalAutofocus then nil else Current)
	local UseAvatarExperienceFocusNavigationBindingsModuleResult = nil
	
	if FFlagAXMigrateCatalogPageInputBindings then
		if not FFlagAXRefetchAvatarOnTimeout then
			v1 = UseRoactServiceFunction(RoactNetworkingModule)
			Callback = UseDispatchFunction()
		end
		local UseRoactServiceResult = UseRoactServiceFunction(AnalyticsModule2)
		local UseTopBarSearchSignalModuleResult = UseTopBarSearchSignalModule()
		local UseQuickMenuAvailableModuleResult = UseQuickMenuAvailableModule()
		local UseAvatarRouteResult = UseAvatarRouteFunction()
		local IsNameMatch = UseAvatarRouteResult.current.name == AvatarScreen.ItemDetails
		local IsNameMatch1: boolean = UseAvatarRouteResult.current.name == AvatarScreen.LookDetails or UseAvatarRouteResult.current.name == AvatarScreen.TryOnManager
		local IsMultiTryOn = AvatarScreenProperties[UseAvatarRouteResult.opaque.name].isMultiTryOn
		local UseSelectorResult = UseSelectorFunction(selectIsTryOnButtonShowing)
		local UseSelectorResult1 = UseAvatarRouteResult.current.name ~= AvatarScreen.TryOnManager and (IsMultiTryOn and UseSelectorResult)
		local UseOpenQuickMenuCallbackModuleResult = UseOpenQuickMenuCallbackModule(UseOverlayClosedCallbackModuleResult)
		local UseResult = ReactModule.useCallback(function(p3)
			-- upvalues: NavigationUtilsModule (upval), p2 (copy)
			p3.cancelled = true
			NavigationUtilsModule.closeFocusedScreen(p2.navigation)
		end, { p2.navigation })
		local UseResult1 = ReactModule.useCallback(function()
			-- upvalues: Callback (ref), OpenItemPromptModule (upval), v1 (ref), UseRoactServiceResult (copy), UseOverlayClosedCallbackModuleResult (copy), p2 (copy), UseAvatarRouteResult (copy)
			Callback(OpenItemPromptModule(v1, UseRoactServiceResult, UseOverlayClosedCallbackModuleResult, p2.navigation, UseAvatarRouteResult))
		end, {
			Callback, v1, UseRoactServiceResult, UseOverlayClosedCallbackModuleResult,
			p2.navigation, UseAvatarRouteResult
		})
		local UseResult2 = ReactModule.useCallback(function()
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
		local UseSelectorResult2 = UseSelectorFunction(selectTryOnManagerViewState)
		local UseResult3 = ReactModule.useCallback(function()
			-- upvalues: UseSelectorResult2 (copy), PeekViewState (upval), Callback (ref), SetTryOnManagerPeekViewStateFunction (upval)
			Callback(SetTryOnManagerPeekViewStateFunction(if UseSelectorResult2 == PeekViewState.Full or UseSelectorResult2 == PeekViewState.Extended then PeekViewState.Brief else PeekViewState.Full))
		end, { UseSelectorResult2, Callback })
		local UseResult4 = ReactModule.useCallback(function()
			-- upvalues: NavigationUtilsModule (upval), p2 (copy), AvatarScreen (upval)
			NavigationUtilsModule.closeFiltersAndItemDetails(p2.navigation)
			p2.navigation.navigate(AvatarScreen.TryOnManager)
		end, { p2.navigation })
		local UseResult5 = ReactModule.useCallback(function()
			-- upvalues: UseTopBarSearchSignalModuleResult (copy), AvatarScreen (upval)
			UseTopBarSearchSignalModuleResult:fire(AvatarScreen.Catalog)
		end, { UseTopBarSearchSignalModuleResult })
		local UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: FocusNavigationEventNameEnum (upval), IsNameMatch1 (copy), UseSelectorResult1 (copy)
			return {
				[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
				[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack,
				[Enum.KeyCode.ButtonStart] = FocusNavigationEventNameEnum.OpenQuickMenu,
				[Enum.KeyCode.ButtonX] = FocusNavigationEventNameEnum.OpenBuyCatalogItemPrompt,
				[Enum.KeyCode.ButtonL3] = FocusNavigationEventNameEnum.OpenCatalogContextMenu,
				[Enum.KeyCode.ButtonY] = if IsNameMatch1 or UseSelectorResult1 then FocusNavigationEventNameEnum.ToggleTryOnManager else FocusNavigationEventNameEnum.Search
			}
		end, { IsNameMatch1, UseSelectorResult1 })
		
		if FFlagAXHideCatalogShortcutsInFullView then
			local Inverted = not UseSelectorFunction((ReactModule.useCallback(function(p3): boolean
				-- upvalues: SelectIsFullViewModule (upval), UseAvatarRouteResult (copy), FullView (upval)
				return SelectIsFullViewModule(p3, UseAvatarRouteResult.opaque.name) == FullView.SceneFullView
			end, { UseAvatarRouteResult.opaque.name })))
			UseAvatarExperienceFocusNavigationBindingsModuleResult = UseCatalogPageFocusNavigationBindingsModule(UseMemoResult, {
				onNavigateBack = if Inverted and IsNameMatch then UseResult else nil,
				onOpenQuickMenu = if Inverted and UseQuickMenuAvailableModuleResult then UseOpenQuickMenuCallbackModuleResult else nil,
				onOpenBuyItemPrompt = if Inverted and IsNameMatch then UseResult1 else nil,
				onOpenContextMenu = if Inverted and IsNameMatch then UseResult2 else nil,
				onToggleSearch = if Inverted then UseResult5 else nil,
				onToggleTryOnManager = if Inverted and IsNameMatch1 then UseResult3 elseif UseSelectorResult1 then UseResult4 else nil
			})
		else
			UseAvatarExperienceFocusNavigationBindingsModuleResult = UseCatalogPageFocusNavigationBindingsModule(UseMemoResult, {
				onNavigateBack = if IsNameMatch then UseResult else nil,
				onOpenQuickMenu = if UseQuickMenuAvailableModuleResult then UseOpenQuickMenuCallbackModuleResult else nil,
				onOpenBuyItemPrompt = if IsNameMatch then UseResult1 else nil,
				onOpenContextMenu = if IsNameMatch then UseResult2 else nil,
				onToggleSearch = UseResult5,
				onToggleTryOnManager = if IsNameMatch1 then UseResult3 elseif UseSelectorResult1 then UseResult4 else nil
			})
		end
	else
		UseAvatarExperienceFocusNavigationBindingsModuleResult = UseAvatarExperienceFocusNavigationBindingsModule({
			overlayClosedCallback = UseOverlayClosedCallbackModuleResult
		})
	end
	if FFlagAXAvatarTimeoutFlow then
		local UseAvatarRouteResult1 = UseAvatarRouteFunction()
		local UseResult = if FFlagAXRefetchAvatarOnTimeout then ReactModule.useCallback(function()
			-- upvalues: Callback (ref), RefetchAvatarDataModule (upval), v1 (ref)
			Callback(RefetchAvatarDataModule(v1, true))
		end, { Callback, v1 }) else nil
		UseCatalogPageTimeoutPromptFunction(p2.navigation, if FFlagAXRefetchAvatarOnTimeout and UseAvatarRouteResult1.opaque.name == AvatarScreen.Catalog then UseResult else nil)
	end
	if FFlagAXMakeupReleaseFTUX then
		UseCatalogPageMakeupReleaseFtuxFunction(UseAvatarRouteFunction(), p2.navigation, (ReactModule.useCallback(function()
			-- upvalues: GetCatalogCategoriesStoreModule (upval), CatalogCategories (upval)
			GetCatalogCategoriesStoreModule.getCatalogSelectionStore().changeCategory(CatalogCategories.Makeup:rawValue(), nil)
		end, {})))
	end
	local v2 = nil
	local v3 = nil
	
	if FFlagLuaAppsDefaultSelection then
		local UseMostRecentOrDefaultFocusBehaviorResult
		UseMostRecentOrDefaultFocusBehaviorResult, v183 = ReactFocusNavigationModule.useMostRecentOrDefaultFocusBehavior(UseAvatarExperienceFocusNavigationBindingsModuleResult)
		v2 = UseFocusOnMountFunction(UseMostRecentOrDefaultFocusBehaviorResult)
	end
	local JoinResult = CryoModule.Dictionary.join(p2, {
		focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else Current,
		overlayClosedCallback = UseOverlayClosedCallbackModuleResult,
		androidBackButtonConnection = Current1,
		is10ftUI = UseUiModeInfoFunction().uiMode == UiMode.TenFoot and not FFlagEnableLeftNavOnConsole,
		defaultFocusRef = if FFlagLuaAppsDefaultSelection then v2 else nil
	})
	
	if FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup then
		UseCatalogPageRevertToLastEquippedStateHookModule()
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		ref = if FFlagLuaAppsDefaultSelection then v3 else UseAvatarExperienceFocusNavigationBindingsModuleResult
	}, ReactModule.createElement(WithNamedRefsModuleResult, JoinResult))
end