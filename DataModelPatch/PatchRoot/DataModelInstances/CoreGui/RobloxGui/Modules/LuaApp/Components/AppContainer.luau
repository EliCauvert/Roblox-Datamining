local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local Modules = CoreGui.RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local MemoizeModule = require(Modules.Common.memoize)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local ConstantsModule = require(Modules.LuaApp.Constants)
local LuaAppEventsModule = require(Modules.LuaApp.LuaAppEvents)
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local FocusNavigationUtilsModule = require(CorePackages.Workspace.Packages.FocusNavigationUtils)
local FocusNavigableSurfaceWrapper = FocusNavigationUtilsModule.FocusNavigableSurfaceWrapper
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local NavigationRoduxModule = require(CorePackages.Workspace.Packages.NavigationRodux)
local Selectors = NavigationRoduxModule.Selectors
local UseOverlayFunction = require(CorePackages.Packages.Foundation).Hooks.useOverlay
local Logger = require(CorePackages.Workspace.Packages.Loggers).Logger
local ToastV2Module = require(Modules.LuaApp.Components.ToastV2)
local CentralOverlayModule = require(Modules.LuaApp.Components.CentralOverlay)
local AppNavContainerModule = require(Modules.LuaApp.Components.AppNav.AppNavContainer)
local AppSystemBarModule = require(Modules.LuaApp.Components.AppNav.AppSystemBar)
local AppTopBannerContainerModule = require(Modules.LuaApp.Components.AppTopBannerContainer)
local BadgeVariant = UIBloxModule.App.Indicator.Enum.BadgeVariant
local AppNotificationService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppNotificationService
local AppLogging = require(CorePackages.Workspace.Packages.RoactServiceTags).AppLogging
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local RoactAnalyticsBottomBarModule = require(Modules.LuaApp.Services.RoactAnalyticsBottomBar)
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local PartyTabBadgeImpressionModule = require(Modules.LuaApp.Analytics.Events.partyTabBadgeImpression)
local PartyTabBadgeClickModule = require(Modules.LuaApp.Analytics.Events.partyTabBadgeClick)
local LoginStatusModule = require(Modules.LuaApp.Enum.LoginStatus)
local SystemBarVisibilityModule = require(Modules.LuaApp.Enum.SystemBarVisibility)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local AppPageModule = require(Modules.LuaApp.AppPage)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local AppChatNetworkingModule = require(CorePackages.Workspace.Packages.AppChatNetworking)
local FullscreenTitleBarModule = require(Modules.LuaApp.Components.FullscreenTitleBar)
local GamepadBottomBarModule = require(Modules.AvatarExperience.Common.Components.GamepadBottomBar)
local WithIsGamepadInputFunction = require(CorePackages.Workspace.Packages.RoactUtils).withIsGamepadInput
local RootNavigatorModule = require(Modules.LuaApp.Navigation.RootNavigator)
local VrCompatibilityModule = require(CorePackages.Workspace.Packages.VrCompatibility)
local VRReadyWrapper = VrCompatibilityModule.VRReadyWrapper
local VRConstants = VrCompatibilityModule.VRConstants
local VRPanelWidthIXP = VrCompatibilityModule.VRPanelWidthIXP
local RouterAnalyticsReporterForRoactNavModule = require(Modules.LuaApp.Components.Analytics.RouterAnalyticsReporterForRoactNav)
local AppPagePropertiesModule = require(Modules.LuaApp.AppPageProperties)
local SetTabBarVisibleFunction = require(CorePackages.Workspace.Packages.AppTabBarRodux).Actions.SetTabBarVisible
local UseGamepadBumperNavigationBindingsFunction = require(CorePackages.Workspace.Packages.BumperNavigation).useGamepadBumperNavigationBindings
local EnteredChatFromEntryPointModule = require(CorePackages.Workspace.Packages.AppChat.EnteredChatFromEntryPoint)
local ChatEntryPointNames = require(CorePackages.Workspace.Packages.SocialCommon).Enums.ChatEntryPointNames
local NavigateToRouteModule = require(Modules.LuaApp.Thunks.NavigateToRoute)
local FFlagSignalsNavP3Dispatch = SharedFlagsModule.FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local SetNavigationLockedModule = require(Modules.LuaApp.Thunks.SetNavigationLocked)
local ResetNavigationHistoryModule = require(Modules.LuaApp.Thunks.ResetNavigationHistory)
local SetPlatformModule = require(Modules.LuaApp.Actions.SetPlatform)
local RoactAppExperimentModule = require(CorePackages.Packages.RoactAppExperiment)
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local OverlayTypeModule = require(Modules.LuaApp.Enum.OverlayType)
local SetCentralOverlayModule = require(Modules.LuaApp.Actions.SetCentralOverlay)
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local VRAppPointerModule = require(Modules.LuaApp.Components.CrossPlatformCompatibility.VRAppPointer)
local IsVRAppBuildFunction = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local GetIABottomBarItemsModule = require(Modules.LuaApp.Components.AppNav.GetIABottomBarItems)
local AppToastNotificationContainer = require(CorePackages.Workspace.Packages.ToastNotification).AppToastNotificationContainer
local AppLoadingSplashScreenModule = require(Modules.LuaApp.Components.Common.AppLoadingSplashScreen)
local GameInviteModule = require(CorePackages.Workspace.Packages.GameInvite)
local GameInviteModal = GameInviteModule.GameInviteModal
local GameInviteConstants = GameInviteModule.GameInviteConstants
local ShellEventsContainerModule = require(Modules.LuaApp.Components.Shell.ShellEventsContainer)
local AppShortcutBarModule = require(CorePackages.Workspace.Packages.AppShortcutBar)
local AppShortcutBarContainer = AppShortcutBarModule.AppShortcutBarContainer
local AppShortcutBarContext = AppShortcutBarModule.AppShortcutBarContext
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local UseIsSpatialFunction = ResponsiveModule.useIsSpatial
local HardwareSafeAreaInsets = ResponsiveModule.HardwareSafeAreaInsets
local AppNavBarModule = require(CorePackages.Workspace.Packages.AppNavBar)
local VisibilityControl = AppNavBarModule.VisibilityControl
local UseNavBarSizeFunction = AppNavBarModule.useNavBarSize
local UseNavBarPlacementFunction = AppNavBarModule.useNavBarPlacement
local CatalogTilesLatencyTrackerModule = require(Modules.AvatarExperience.Catalog.Actions.CatalogTilesLatencyTracker)
local AvatarExperienceTTIPerformanceModule = require(CorePackages.Workspace.Packages.AvatarExperienceTTIPerformance)
local TTIPerformanceManager = AvatarExperienceTTIPerformanceModule.TTIPerformanceManager
local WidgetsPercievedTTIManager = AvatarExperienceTTIPerformanceModule.WidgetsPercievedTTIManager
local AppMusicPlayerModule = require(CorePackages.Workspace.Packages.AppMusicPlayer)
local SendBuildExperienceEventModule = require(CorePackages.Workspace.Packages.BuildExperience.sendBuildExperienceEvent)
local NativeCloseEventConnectorModule = require(Modules.LuaApp.Components.NativeCloseEventConnector)
local CheckSystemTrayModalModule = require(Modules.LuaApp.Thunks.CheckSystemTrayModal)
local FFlagEnableLeftNavOnConsole = SharedFlagsModule.FFlagEnableLeftNavOnConsole
local TenFootUiGlobalEffects = if FFlagEnableLeftNavOnConsole then require(CorePackages.Workspace.Packages.TenFootUiShell).TenFootUiGlobalEffects else nil
local FFlagUseNavigationSelectors = SharedFlagsModule.FFlagUseNavigationSelectors
local FFlagLuaAppsDefaultSelection = SharedFlagsModule.FFlagLuaAppsDefaultSelection
local FFlagSignalsNavP3bTopBar = SharedFlagsModule.FFlagSignalsNavP3bTopBar
local FFlagAppNavMyStatsTab = SharedFlagsModule.FFlagAppNavMyStatsTab
local FFlagAppChatRenameGuacPolicyEnabled = SharedFlagsModule.FFlagAppChatRenameGuacPolicyEnabled
local FFlagMomentsTabReactiveIXP = SharedFlagsModule.FFlagMomentsTabReactiveIXP
local FFlagEnableArgus = SharedFlagsModule.FFlagEnableArgus
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3bTopBar then require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore else nil
local EnableProgressLoadingAssetsAppContainer = game:DefineFastFlag("EnableProgressLoadingAssetsAppContainer", false)
local ProgressLoadingAssetsScreenGui = if EnableProgressLoadingAssetsAppContainer then require(CorePackages.Workspace.Packages.ProgressLoading).ProgressLoadingAssetsScreenGui else nil
local SduiDiscoveryDependencyUpdater = require(CorePackages.Workspace.Packages.ServerDrivenUi).SduiDiscoveryDependencyUpdater
local SduiAvatarExperienceRegister = require(CorePackages.Workspace.Packages.AvatarExperienceServerDrivenUi).SduiAvatarExperienceRegister
local SduiSharedRegister = require(CorePackages.Workspace.Packages.SduiSharedContent).SduiSharedRegister
local SduiSocialRegister = require(CorePackages.Workspace.Packages.SocialServerDrivenUi).SduiSocialRegister
local SduiOpenSearchResultsWithQueryReceiverModule = require(Modules.LuaApp.Components.Search.SduiOpenSearchResultsWithQueryReceiver)
local SduiExperienceStoreRegister = require(CorePackages.Workspace.Packages.ExperienceStoreServerDrivenUi).SduiExperienceStoreRegister
local UniversalAppPolicyModule = require(CorePackages.Workspace.Packages.UniversalAppPolicy)
local FFlagEnableFlyoutSidePanelModule = require(Modules.LuaApp.Flags.FFlagEnableFlyoutSidePanel)
local FlyoutSidePanelWrapperModule = nil
local FlyoutScrollAwayControl = nil

if FFlagEnableFlyoutSidePanelModule then
	FlyoutSidePanelWrapperModule = require(Modules.LuaApp.Components.FlyoutSidePanel.FlyoutSidePanelWrapper)
	FlyoutScrollAwayControl = require(CorePackages.Workspace.Packages.FlyoutSidePanel).FlyoutScrollAwayControl
end
local config = {
	GetFFlagUseUpdatedVNGAgreementsWorkflow = SharedFlagsModule.GetFFlagUseUpdatedVNGAgreementsWorkflow,
	GetFFlagEnableAccessBlockAtAppContainerLevel = SharedFlagsModule.GetFFlagEnableAccessBlockAtAppContainerLevel,
	GetFFlagLuaAppFixStudioNotchSupport = require(Modules.LuaApp.Flags.GetFFlagLuaAppFixStudioNotchSupport),
	GetFFlagVRPanelWidthIXPEnabled = SharedFlagsModule.GetFFlagVRPanelWidthIXPEnabled,
	GetFFlagLuaAppEnableTopBanner = SharedFlagsModule.GetFFlagLuaAppEnableTopBanner,
	FFlagAppIaScrollAway = SharedFlagsModule.FFlagAppIaScrollAway,
	GetFFlagLuaAppPersistentMusicPlayer = SharedFlagsModule.GetFFlagLuaAppPersistentMusicPlayer,
	FFlagEnableSystemTrayModals = SharedFlagsModule.FFlagEnableSystemTrayModals,
	FFlagAppIaHomeSubTab = SharedFlagsModule.FFlagAppIaHomeSubTab,
	FFlagEnableAvatarExperienceSdui = SharedFlagsModule.FFlagEnableAvatarExperienceSdui,
	FFlagSduiRequestFriendshipAction = SharedFlagsModule.FFlagSduiRequestFriendshipAction,
	FFlagLuaAppSduiOpenSearchResultsWithQueryAction = SharedFlagsModule.FFlagLuaAppSduiOpenSearchResultsWithQueryAction,
	FFlagSduiDevStoreSeeAllSupport = SharedFlagsModule.FFlagSduiDevStoreSeeAllSupport,
	FFlagLuaAppUseOverlayInAppContainer = SharedFlagsModule.FFlagLuaAppUseOverlayInAppContainer,
	FFlagLuaAppForceVrAppPanelWidthRollout = SharedFlagsModule.FFlagLuaAppForceVrAppPanelWidthRollout,
	FFlagLuaAppChartsAppPage = SharedFlagsModule.FFlagLuaAppChartsAppPage,
	FFlagMomentsWatchSessionalization = SharedFlagsModule.FFlagMomentsWatchSessionalization
}
local LuaAppEnableToastNotifications4 = game:DefineFastFlag("LuaAppEnableToastNotifications4", false)
local AXEnablePercievedTTIForAX = game:DefineFastFlag("AXEnablePercievedTTIForAX", false)
local PartyTabBadgeMaxCount = game:DefineFastInt("PartyTabBadgeMaxCount", 49)
local FFlagLuaAppFixStudioNotchSupport = SharedFlagsModule.FFlagLuaAppUseDeviceSafeInsetsForAppContainer and config.GetFFlagLuaAppFixStudioNotchSupport()
local FFlagFixNavigationInsetsOnHiddenTabBar = SharedFlagsModule.FFlagFixNavigationInsetsOnHiddenTabBar
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXMoveAllTabToWidgetOnly = AvatarExperienceFlagsModule.FFlagAXMoveAllTabToWidgetOnly
local FFlagAXFixTryOnItemVR = AvatarExperienceFlagsModule.FFlagAXFixTryOnItemVR
local FFlagAddGamepadBumperNavigation = SharedFlagsModule.FFlagAddGamepadBumperNavigation
local FFlagLuaAppEdpKeepFullPageOnPortraitRotation = SharedFlagsModule.FFlagLuaAppEdpKeepFullPageOnPortraitRotation
local FFlagAppDebugPanel = SharedFlagsModule.FFlagAppDebugPanel
local FFlagAppDebugTagAnnotation = SharedFlagsModule.FFlagAppDebugTagAnnotation
local FFlagAppIaScrollAwayPinHeader = SharedFlagsModule.FFlagAppIaScrollAwayPinHeader
local FFlagAppIaScopedScrollAway = SharedFlagsModule.FFlagAppIaScopedScrollAway
local DebugPanel = nil
local AppDebugModule = nil

if FFlagAppDebugPanel then
	DebugPanel = require(CorePackages.Workspace.Packages.DebugPanel).DebugPanel
	
	if FFlagAppDebugTagAnnotation then
		AppDebugModule = require(CorePackages.Workspace.Packages.AppDebug)
	end
end
local AppNavAppContainerBottomBarIndexFromNav = game:DefineFastFlag("AppNavAppContainerBottomBarIndexFromNav", false)
local AppNavAppContainerCurrentPageFromNav = game:DefineFastFlag("AppNavAppContainerCurrentPageFromNav", false)
local v1 = (function()
	-- upvalues: UserInputService (copy)
	return if _G.__TESTEZ_RUNNING_TEST__ then Enum.Platform.None else UserInputService:GetPlatform()
end)()
local NoFFlagEnableLeftNavOnConsole: boolean = GuiService:IsTenFootInterface() and not FFlagEnableLeftNavOnConsole
local IABottomBarItemsModule, IABottomBarItemsModule2 = GetIABottomBarItemsModule()
local AppContainer = RoactModule.Component:extend("AppContainer")

function AppContainer.init(p1)
	-- upvalues: Logger (copy), SetPlatformModule (copy), v1 (copy), AppNavAppContainerCurrentPageFromNav (copy), AppNavAppContainerBottomBarIndexFromNav (copy), config (copy), AppPageModule (copy), LuaAppEventsModule (copy), NavigationRoduxModule (copy), FFlagLuaAppsDefaultSelection (copy), NoFFlagEnableLeftNavOnConsole (copy), AvatarScreen (copy), AXEnablePercievedTTIForAX (copy), CatalogTilesLatencyTrackerModule (copy), FFlagAXMoveAllTabToWidgetOnly (copy), WidgetsPercievedTTIManager (copy), TTIPerformanceManager (copy), FFlagAppNavMyStatsTab (copy), SendBuildExperienceEventModule (copy), ChatEntryPointNames (copy), PartyTabBadgeClickModule (copy), AppChatNetworkingModule (copy), AppNavBarModule (copy), MemoizeModule (copy), ConstantsModule (copy)
	p1.props.loggingProtocol:logEventOnce("app_container_init_begin")
	Logger:info("Initializing App Container")
	local Store = p1.props.store
	local BottomBarAnalytics = p1.props.bottomBarAnalytics
	Store:dispatch(SetPlatformModule(v1))
	
	function p1.bottomBarButtonActivated(Page, ActionType)
		-- upvalues: AppNavAppContainerCurrentPageFromNav (upval), p1 (copy), AppNavAppContainerBottomBarIndexFromNav (upval), config (upval), AppPageModule (upval), LuaAppEventsModule (upval), NavigationRoduxModule (upval), FFlagLuaAppsDefaultSelection (upval), NoFFlagEnableLeftNavOnConsole (upval), AvatarScreen (upval), AXEnablePercievedTTIForAX (upval), Store (copy), CatalogTilesLatencyTrackerModule (upval), FFlagAXMoveAllTabToWidgetOnly (upval), WidgetsPercievedTTIManager (upval), TTIPerformanceManager (upval), FFlagAppNavMyStatsTab (upval), SendBuildExperienceEventModule (upval), ChatEntryPointNames (upval), PartyTabBadgeClickModule (upval), AppChatNetworkingModule (upval), Logger (upval), AppNavBarModule (upval), BottomBarAnalytics (copy)
		local CurrentPage = if AppNavAppContainerCurrentPageFromNav then p1:getCurrentPage() else p1.props.currentPage
		local SelectedBottomBarItemIndex = if AppNavAppContainerBottomBarIndexFromNav then p1:getSelectedBottomBarItemIndex() else p1.props.selectedBottomBarItemIndex
		
		if not SelectedBottomBarItemIndex then return end
		local Page1 = p1.props.bottomBarItems[SelectedBottomBarItemIndex].page
		
		if config.FFlagMomentsWatchSessionalization and Page == AppPageModule.Moments then
			if Page ~= Page1 then
				p1.props.navigateToPage(Page)
				
				if ActionType then
					p1.props.notificationService:ActionTaken(ActionType)
				end
			end
		elseif Page == CurrentPage then
			LuaAppEventsModule.ReloadPage:fire(Page)
		elseif config.FFlagAppIaHomeSubTab and Page == NavigationRoduxModule.Constants.HomeContainerName then
			if CurrentPage == AppPageModule.Home then
				LuaAppEventsModule.ReloadPage:fire(AppPageModule.Home)
			else
				p1.props.navigateToPage(AppPageModule.Home)
				
				if ActionType then
					p1.props.notificationService:ActionTaken(ActionType)
				end
			end
		elseif Page == AppPageModule.AvatarExperienceRoot then
			local AvatarExperienceRoot = if FFlagLuaAppsDefaultSelection then AppPageModule.AvatarExperienceRoot elseif NoFFlagEnableLeftNavOnConsole then AppPageModule.AvatarExperienceRoot else AvatarScreen.Catalog
			
			if AXEnablePercievedTTIForAX then
				Store:dispatch(CatalogTilesLatencyTrackerModule.PercievedTrackingStarted())
				
				if FFlagAXMoveAllTabToWidgetOnly then
					WidgetsPercievedTTIManager.startPerceivedTracking()
				else
					TTIPerformanceManager.Surface.Marketplace.Root.startPerceivedTracking()
				end
			end
			p1.props.navigateToPage(AvatarExperienceRoot)
			
			if ActionType then
				p1.props.notificationService:ActionTaken(ActionType)
			end
		elseif FFlagAppNavMyStatsTab and Page == AppPageModule.MyStats then
			SendBuildExperienceEventModule("TAB_CLICK", {})
			p1.props.navigateToPage(Page)
			
			if ActionType then
				p1.props.notificationService:ActionTaken(ActionType)
			end
		elseif Page == AppPageModule.Chat then
			p1.props.enteredChatFromEntryPoint(ChatEntryPointNames.SystemBar)
			PartyTabBadgeClickModule(p1.props.analytics.EventStream, "AppContainer", p1.props.chatBadgeCount)
			Store:dispatch(AppChatNetworkingModule.rodux.ClearGlobalUnreadCount.API()):catch(function(Err)
				-- upvalues: Logger (upval)
				Logger:error("Error in ClearGlobalUnreadCount request. Error: {}", (tostring(Err)))
			end)
			p1.props.navigateToPage(Page)
			
			if ActionType then
				p1.props.notificationService:ActionTaken(ActionType)
			end
		else
			p1.props.navigateToPage(Page)
			
			if ActionType then
				p1.props.notificationService:ActionTaken(ActionType)
			end
		end
		if Page ~= Page1 then
			AppNavBarModule.AppNavTelemetry.logSwitchTabStart(Page1, Page)
		end
		BottomBarAnalytics.ButtonActivated(Page, Page1)
	end
	
	p1.getBottomBarLayoutInfo = MemoizeModule(function(Vector, p2, _)
		-- upvalues: ConstantsModule (upval)
		local Largest = math.max(Vector.X - p2.left - p2.right - 600, 0)
		
		return {
			Background = {
				AnchorPoint = Vector2.new(0, 0),
				Position = UDim2.new(0, -p2.left, 1, 0),
				Size = UDim2.new(0, Vector.X, 0, p2.bottom)
			},
			Padding = {
				PaddingLeft = UDim.new(0, p2.left + Largest / 2),
				PaddingRight = UDim.new(0, p2.right + Largest / 2),
				PaddingBottom = UDim.new(0, (math.max(p2.bottom - ConstantsModule.BOTTOM_BAR_SIZE, 0)))
			}
		}
	end)
	p1.props.loggingProtocol:logEventOnce("app_container_init_end")
end

function AppContainer.didMount(p1)
	-- upvalues: FFlagSignalsNavP3bTopBar (copy), SetNavigationLockedModule (copy), FFlagAppDebugPanel (copy), FFlagAppDebugTagAnnotation (copy), AppDebugModule (ref), config (copy)
	local Store = p1.props.store
	
	if not FFlagSignalsNavP3bTopBar then
		Store:dispatch(SetNavigationLockedModule(false))
	end
	if FFlagAppDebugPanel and FFlagAppDebugTagAnnotation then
		AppDebugModule.register()
	end
	if config.GetFFlagEnableAccessBlockAtAppContainerLevel() and (p1.props.userLoggedIn and p1.props.policyShouldBlockUAppAccess) then
		p1.props.resetNavigationHistoryToBlockPage()
	end
end

function AppContainer.willUpdate_DEPRECATED(p1, p2)
	-- upvalues: AppPagePropertiesModule (copy), FFlagLuaAppEdpKeepFullPageOnPortraitRotation (copy), SystemBarVisibilityModule (copy), config (copy), AppNavBarModule (copy), VisibilityControl (copy), FFlagEnableFlyoutSidePanelModule (copy), FlyoutScrollAwayControl (ref), FFlagAppIaScrollAwayPinHeader (copy), FFlagAppIaScopedScrollAway (copy)
	local AppPagePropertiesModuleEntry = AppPagePropertiesModule[p2.currentPage] or {}
	local TabBarVisibilityFunction = p2.tabBarVisibility
	
	if typeof(TabBarVisibilityFunction) == "function" then
		TabBarVisibilityFunction = TabBarVisibilityFunction({
			formFactor = p2.formFactor,
			screenSize = if FFlagLuaAppEdpKeepFullPageOnPortraitRotation then p2.screenSize else nil,
			deviceOrientation = if FFlagLuaAppEdpKeepFullPageOnPortraitRotation then p2.deviceOrientation else nil
		})
	end
	local ShouldSystemBarUsuallyBePresent = if TabBarVisibilityFunction == SystemBarVisibilityModule.PolicyDependent then p1.props.shouldSystemBarUsuallyBePresent else TabBarVisibilityFunction ~= SystemBarVisibilityModule.Hidden
	
	if not AppPagePropertiesModuleEntry.overridesAppRouterTabBarControl and ShouldSystemBarUsuallyBePresent ~= p2.bottomBarVisible then
		p1.props.setTabBarVisible(ShouldSystemBarUsuallyBePresent)
	end
	if config.FFlagAppIaScrollAway and AppNavBarModule.getScrollAwayEnabled() then
		local BottomBarVisible = if AppPagePropertiesModuleEntry.overridesAppRouterTabBarControl then p2.bottomBarVisible else ShouldSystemBarUsuallyBePresent
		local BottomBarVisible1 = AppPagePropertiesModuleEntry.enableScrollAway and BottomBarVisible
		
		if p2.currentPage == p1.props.currentPage then
			if BottomBarVisible and BottomBarVisible1 ~= VisibilityControl.isEnabled() then
				VisibilityControl.show()
			end
		else
			VisibilityControl.show()
		end
		if FFlagEnableFlyoutSidePanelModule then
			FlyoutScrollAwayControl.setScrollAwayEnabled(BottomBarVisible1)
		else
			VisibilityControl.setEnabled(BottomBarVisible1)
		end
		if FFlagAppIaScrollAwayPinHeader then
			VisibilityControl.setHeaderScrollAwayDisabled(AppPagePropertiesModuleEntry.disableHeaderScrollAway)
		end
		if FFlagAppIaScopedScrollAway then
			VisibilityControl.setGlobalTouchEnabled(not AppPagePropertiesModuleEntry.disableGlobalScrollAwayTouch)
		end
	end
end

if not AppNavAppContainerCurrentPageFromNav then
	function AppContainer.willUpdate(p1, p2)
		p1:willUpdate_DEPRECATED(p2)
	end
end
function AppContainer.didUpdate(p1, p2, _)
	-- upvalues: AppNavAppContainerCurrentPageFromNav (copy), AppPagePropertiesModule (copy), FFlagLuaAppEdpKeepFullPageOnPortraitRotation (copy), SystemBarVisibilityModule (copy), config (copy), AppNavBarModule (copy), VisibilityControl (copy), FFlagEnableFlyoutSidePanelModule (copy), FlyoutScrollAwayControl (ref), FFlagAppIaScrollAwayPinHeader (copy), FFlagAppIaScopedScrollAway (copy), AppPageModule (copy)
	if AppNavAppContainerCurrentPageFromNav then
		local CurrentPage = p1:getCurrentPage()
		local CurrentPage1 = p1:getCurrentPage(p2)
		local AppPagePropertiesModuleEntry = AppPagePropertiesModule[CurrentPage] or {}
		local TabBarVisibilityFunction = p1.props.tabBarVisibility
		
		if typeof(TabBarVisibilityFunction) == "function" then
			TabBarVisibilityFunction = TabBarVisibilityFunction({
				formFactor = p1.props.formFactor,
				screenSize = if FFlagLuaAppEdpKeepFullPageOnPortraitRotation then p1.props.screenSize else nil,
				deviceOrientation = if FFlagLuaAppEdpKeepFullPageOnPortraitRotation then p1.props.deviceOrientation else nil
			})
		end
		local ShouldSystemBarUsuallyBePresent = if TabBarVisibilityFunction == SystemBarVisibilityModule.PolicyDependent then p1.props.shouldSystemBarUsuallyBePresent else TabBarVisibilityFunction ~= SystemBarVisibilityModule.Hidden
		
		if not AppPagePropertiesModuleEntry.overridesAppRouterTabBarControl and ShouldSystemBarUsuallyBePresent ~= p1.props.bottomBarVisible then
			p1.props.setTabBarVisible(ShouldSystemBarUsuallyBePresent)
		end
		if config.FFlagAppIaScrollAway and AppNavBarModule.getScrollAwayEnabled() then
			local BottomBarVisible = if AppPagePropertiesModuleEntry.overridesAppRouterTabBarControl then p1.props.bottomBarVisible else ShouldSystemBarUsuallyBePresent
			local BottomBarVisible1 = AppPagePropertiesModuleEntry.enableScrollAway and BottomBarVisible
			
			if CurrentPage == CurrentPage1 then
				if BottomBarVisible and BottomBarVisible1 ~= VisibilityControl.isEnabled() then
					VisibilityControl.show()
				end
			else
				VisibilityControl.show()
			end
			if FFlagEnableFlyoutSidePanelModule then
				FlyoutScrollAwayControl.setScrollAwayEnabled(BottomBarVisible1)
			else
				VisibilityControl.setEnabled(BottomBarVisible1)
			end
			if FFlagAppIaScrollAwayPinHeader then
				VisibilityControl.setHeaderScrollAwayDisabled(AppPagePropertiesModuleEntry.disableHeaderScrollAway)
			end
			if FFlagAppIaScopedScrollAway then
				VisibilityControl.setGlobalTouchEnabled(not AppPagePropertiesModuleEntry.disableGlobalScrollAwayTouch)
			end
		end
	end
	if p1.props.userLoggedIn and p1.props.appPolicy.getVNGFormRequired() and not config.GetFFlagUseUpdatedVNGAgreementsWorkflow() then
		p1.props.showVngForm()
	end
	if config.GetFFlagEnableAccessBlockAtAppContainerLevel() then
		local IsUAppBlockMatch = (if AppNavAppContainerCurrentPageFromNav then p1:getCurrentPage() else p1.props.currentPage) == AppPageModule.UAppBlock
		
		if p1.props.policyShouldBlockUAppAccess and p1.props.userLoggedIn and not IsUAppBlockMatch then
			p1.props.resetNavigationHistoryToBlockPage()
		end
	end
end

function AppContainer.render(p1)
	-- upvalues: AppNavAppContainerBottomBarIndexFromNav (copy), AppNavAppContainerCurrentPageFromNav (copy), NoFFlagEnableLeftNavOnConsole (copy), RoactModule (copy), VRAppPointerModule (copy), HardwareSafeAreaInsets (copy), WithStyleFunction (copy), FFlagLuaAppFixStudioNotchSupport (copy), config (copy), ResponsiveModule (copy), AppPageModule (copy), FFlagEnableLeftNavOnConsole (copy), AppNavBarModule (copy), FocusNavigableSurfaceWrapper (copy), FocusNavigableSurfaceIdentifierEnum (copy), FFlagAddGamepadBumperNavigation (copy), AppNavContainerModule (copy), FFlagFixNavigationInsetsOnHiddenTabBar (copy), RootNavigatorModule (copy), AppMusicPlayerModule (copy), AppSystemBarModule (copy), ConstantsModule (copy), RouterAnalyticsReporterForRoactNavModule (copy), AppShortcutBarContext (copy), AppShortcutBarContainer (copy), NativeCloseEventConnectorModule (copy), CheckSystemTrayModalModule (copy), TenFootUiGlobalEffects (copy), VRReadyWrapper (copy), VRConstants (copy), IsVRAppBuildFunction (copy), FFlagAXFixTryOnItemVR (copy), CoreGui (copy), ToastV2Module (copy), LuaAppEnableToastNotifications4 (copy), AppToastNotificationContainer (copy), GameInviteModal (copy), GameInviteConstants (copy), CentralOverlayModule (copy), GamepadBottomBarModule (copy), AppTopBannerContainerModule (copy), FFlagEnableFlyoutSidePanelModule (copy), FlyoutSidePanelWrapperModule (ref), FullscreenTitleBarModule (copy), AppLoadingSplashScreenModule (copy), ShellEventsContainerModule (copy), EnableProgressLoadingAssetsAppContainer (copy), ProgressLoadingAssetsScreenGui (ref), SduiDiscoveryDependencyUpdater (copy), SduiAvatarExperienceRegister (copy), SduiSharedRegister (copy), SduiSocialRegister (copy), SduiOpenSearchResultsWithQueryReceiverModule (copy), SduiExperienceStoreRegister (copy), FFlagAppDebugPanel (copy), DebugPanel (ref)
	local ScreenSize = p1.props.screenSize
	local GlobalGuiInset = p1.props.globalGuiInset
	local BottomBarVisible = p1.props.bottomBarVisible
	local SelectedBottomBarItemIndex = if AppNavAppContainerBottomBarIndexFromNav then p1:getSelectedBottomBarItemIndex() else p1.props.selectedBottomBarItemIndex
	local CurrentPage = if AppNavAppContainerCurrentPageFromNav then p1:getCurrentPage() else p1.props.currentPage
	local BottomBarItems = p1.props.bottomBarItems
	local IsGamepadInput = p1.props.isGamepadInput
	local Element = RoactModule.createElement(VRAppPointerModule)
	local DeviceInsetsResult = HardwareSafeAreaInsets.deviceInsets()
	
	return RoactModule.createElement("Folder", {}, {
		Toast = RoactModule.createElement(ToastV2Module, { displayOrder = ConstantsModule.DisplayOrder.Toast }),
		ToastNotification = if LuaAppEnableToastNotifications4 then RoactModule.createElement(AppToastNotificationContainer, { displayOrder = ConstantsModule.DisplayOrder.Toast }) else nil,
		GameInviteModal = RoactModule.createElement(GameInviteModal, {
			displayOrder = ConstantsModule.DisplayOrder.GameInviteModal,
			renderLocation = GameInviteConstants.RenderLocation.UniversalApp
		}),
		CentralOverlay = RoactModule.createElement(CentralOverlayModule, {
			includeStatusBar = BottomBarVisible,
			displayOrder = ConstantsModule.DisplayOrder.CentralOverlay
		}),
		GamepadBottomBar = NoFFlagEnableLeftNavOnConsole and IsGamepadInput and RoactModule.createElement(GamepadBottomBarModule, {
			displayOrder = ConstantsModule.DisplayOrder.GamepadBottomBar
		}),
		RNBypassTree = RoactModule.createElement(RoactModule.Portal, { target = CoreGui }, {
			LuaAppScreenGui = WithStyleFunction(function(p2)
				-- upvalues: FFlagLuaAppFixStudioNotchSupport (upval), config (upval), RoactModule (upval), GlobalGuiInset (copy), DeviceInsetsResult (copy), p1 (copy), ResponsiveModule (upval), AppPageModule (upval), FFlagEnableLeftNavOnConsole (upval), AppNavBarModule (upval), BottomBarVisible (copy), ScreenSize (copy), FocusNavigableSurfaceWrapper (upval), FocusNavigableSurfaceIdentifierEnum (upval), FFlagAddGamepadBumperNavigation (upval), AppNavContainerModule (upval), FFlagFixNavigationInsetsOnHiddenTabBar (upval), RootNavigatorModule (upval), AppMusicPlayerModule (upval), AppSystemBarModule (upval), ConstantsModule (upval), SelectedBottomBarItemIndex (copy), BottomBarItems (copy), RouterAnalyticsReporterForRoactNavModule (upval), AppShortcutBarContext (upval), AppShortcutBarContainer (upval), NativeCloseEventConnectorModule (upval), CheckSystemTrayModalModule (upval), TenFootUiGlobalEffects (upval), VRReadyWrapper (upval), VRConstants (upval), IsVRAppBuildFunction (upval), CurrentPage (copy), FFlagAXFixTryOnItemVR (upval)
				local IsNotCurrentPageMatch: boolean = FFlagLuaAppFixStudioNotchSupport and (if DeviceInsetsResult.top > 0 or DeviceInsetsResult.bottom > 0 or DeviceInsetsResult.left > 0 or DeviceInsetsResult.right > 0 then p1.props.currentPage ~= AppPageModule.AvatarExperienceRoot or FFlagEnableLeftNavOnConsole and p1.props.navBarPlacement == AppNavBarModule.Placement.Left else p1.props.usePreferredInput == ResponsiveModule.Input.Touch and (p1.props.currentPage ~= AppPageModule.AvatarExperienceRoot or FFlagEnableLeftNavOnConsole and p1.props.navBarPlacement == AppNavBarModule.Placement.Left))
				local _UDim2: UDim2 = if FFlagEnableLeftNavOnConsole then if BottomBarVisible then if p1.props.currentPage == AppPageModule.AvatarExperienceRoot then UDim2.fromOffset(DeviceInsetsResult.left + p1.props.navBarSize, ScreenSize.Y + DeviceInsetsResult.top + DeviceInsetsResult.bottom) else UDim2.fromOffset(ScreenSize.X + DeviceInsetsResult.left + DeviceInsetsResult.right, ScreenSize.Y + DeviceInsetsResult.top + DeviceInsetsResult.bottom) else UDim2.fromOffset(0, 0) else UDim2.new(0, ScreenSize.X + DeviceInsetsResult.left + DeviceInsetsResult.right, 0, ScreenSize.Y + DeviceInsetsResult.top + DeviceInsetsResult.bottom)
				
				return RoactModule.createElement(VRReadyWrapper, {
					component = "ScreenGui",
					props = {
						Enabled = true,
						DisplayOrder = 1,
						ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
						ScreenInsets = if config.GetFFlagLuaAppFixStudioNotchSupport() then if FFlagLuaAppFixStudioNotchSupport then Enum.ScreenInsets.DeviceSafeInsets else Enum.ScreenInsets.None else nil,
						ClipToDeviceSafeArea = not FFlagLuaAppFixStudioNotchSupport and nil
					},
					vrProps = {
						panelName = "MainAppScreen",
						partSize = if config.FFlagLuaAppForceVrAppPanelWidthRollout or not p1.props.vrPanelWidthMultiplier then VRConstants.MainScreenSize else Vector2.new(VRConstants.MainScreenSize.X * p1.props.vrPanelWidthMultiplier, VRConstants.MainScreenSize.Y),
						offset = if config.FFlagLuaAppForceVrAppPanelWidthRollout or config.GetFFlagVRPanelWidthIXPEnabled() and p1.props.vrPanelCurvature == 0 then CFrame.new(VRConstants.MainScreenPosition) * CFrame.fromEulerAnglesXYZ(0, -3.141592653589793, 0) else CFrame.lookAt(VRConstants.MainScreenPosition, VRConstants.DefaultCameraPosition),
						virtualScreenSize = if config.FFlagLuaAppForceVrAppPanelWidthRollout or not p1.props.vrPanelWidthMultiplier then VRConstants.MainScreenResolution else Vector2.new(VRConstants.MainScreenResolution.X * p1.props.vrPanelWidthMultiplier, VRConstants.MainScreenResolution.Y),
						curvature = if config.FFlagLuaAppForceVrAppPanelWidthRollout or not p1.props.vrPanelCurvature then VRConstants.MainScreenCurvature else p1.props.vrPanelCurvature,
						hidden = IsVRAppBuildFunction() and (CurrentPage == AppPageModule.AvatarExperienceRoot or FFlagAXFixTryOnItemVR and CurrentPage == AppPageModule.AvatarExperienceWrapper),
						roundedCornersFrameColor = p2.Theme.BackgroundDefault.Color
					}
				}, {
					RNAppContainer = RoactModule.createElement(FocusNavigableSurfaceWrapper, {
						shouldRestoreFocus = false,
						surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.RouterView,
						customEventMap = if FFlagAddGamepadBumperNavigation then p1.props.bumperNavigationEventMap else nil,
						customEventHandlers = if FFlagAddGamepadBumperNavigation then p1.props.bumperNavigationEventHandlerMap else nil
					}, RoactModule.createElement(AppNavContainerModule, if FFlagFixNavigationInsetsOnHiddenTabBar then { isTabBarVisible = BottomBarVisible } else nil, {
						RootNavigator = RoactModule.createElement(RootNavigatorModule, { navigation = p1.props.navigation })
					})),
					MusicPlayer = if config.GetFFlagLuaAppPersistentMusicPlayer() then RoactModule.createElement(AppMusicPlayerModule.AppMusicPlayer) else nil,
					SystemBar = RoactModule.createElement(AppSystemBarModule, {
						isVisible = BottomBarVisible,
						displayOrder = ConstantsModule.DisplayOrder.SystemBar,
						layoutInfo = p1.getBottomBarLayoutInfo(ScreenSize, GlobalGuiInset),
						selectedIndex = SelectedBottomBarItemIndex,
						items = BottomBarItems,
						onActivated = p1.bottomBarButtonActivated,
						customEventMap = if FFlagAddGamepadBumperNavigation then p1.props.bumperNavigationEventMap else nil,
						customEventHandlers = if FFlagAddGamepadBumperNavigation then p1.props.bumperNavigationEventHandlerMap else nil,
						isBumperNavigationEnabled = if FFlagAddGamepadBumperNavigation then p1.props.isBumperNavigationEnabled else nil
					}),
					Reporter = RoactModule.createElement(RouterAnalyticsReporterForRoactNavModule),
					SafePadding = if FFlagLuaAppFixStudioNotchSupport or not config.GetFFlagLuaAppFixStudioNotchSupport() then nil else RoactModule.createElement("UIPadding", {
						PaddingTop = if config.GetFFlagLuaAppEnableTopBanner() then UDim.new(0, GlobalGuiInset.top) else nil,
						PaddingBottom = UDim.new(0, GlobalGuiInset.bottom),
						PaddingLeft = UDim.new(0, GlobalGuiInset.left)
					}),
					AppShortcutBar = RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
						ShortcutBarContext = RoactModule.createElement(AppShortcutBarContext.Provider, {}, {
							ShortcutBar = RoactModule.createElement(AppShortcutBarContainer)
						})
					}),
					NativeCloseEventConnector = if config.FFlagEnableSystemTrayModals then RoactModule.createElement(NativeCloseEventConnectorModule, { onNativeCloseEvent = CheckSystemTrayModalModule }) else nil,
					TenFootUiGlobalEffects = if FFlagEnableLeftNavOnConsole then RoactModule.createElement(TenFootUiGlobalEffects) else nil,
					DeviceInsetBackground = if IsNotCurrentPageMatch then RoactModule.createElement("Frame", {
						BorderSizePixel = 0,
						ZIndex = 0,
						Position = UDim2.new(0, -DeviceInsetsResult.left, 0, -DeviceInsetsResult.top),
						Size = _UDim2,
						BackgroundColor3 = p2.Theme.BackgroundDefault.Color,
						BackgroundTransparency = p2.Theme.BackgroundDefault.Transparency
					}) else nil
				})
			end)
		}),
		TopBanner = if config.GetFFlagLuaAppEnableTopBanner() then RoactModule.createElement(AppTopBannerContainerModule, { displayOrder = ConstantsModule.DisplayOrder.TopBanner }) else nil,
		FlyoutSidePanel = if FFlagEnableFlyoutSidePanelModule then RoactModule.createElement(FlyoutSidePanelWrapperModule, {
			displayOrder = ConstantsModule.DisplayOrder.FlyoutSidePanel
		}) else nil,
		FullscreenTitleBar = RoactModule.createElement(FullscreenTitleBarModule, {
			displayOrder = ConstantsModule.DisplayOrder.FullscreenTitleBar
		}),
		VRPointer = if p1.props.use3DPanels then Element else nil,
		AppLoadingSplashScreen = RoactModule.createElement(AppLoadingSplashScreenModule),
		ShellEventsContainer = RoactModule.createElement(ShellEventsContainerModule, { currentPage = CurrentPage }),
		ProgressLoadingAssetsScreenGui = if EnableProgressLoadingAssetsAppContainer then RoactModule.createElement(ProgressLoadingAssetsScreenGui, {
			displayOrder = ConstantsModule.DisplayOrder.ProgressLoadingAssets
		}) else nil,
		SduiDiscoveryDependencyUpdater = RoactModule.createElement(SduiDiscoveryDependencyUpdater),
		SduiAvatarExperienceRegister = if config.FFlagEnableAvatarExperienceSdui then RoactModule.createElement(SduiAvatarExperienceRegister) else nil,
		SduiSharedRegister = RoactModule.createElement(SduiSharedRegister),
		SduiSocialRegister = if config.FFlagSduiRequestFriendshipAction then RoactModule.createElement(SduiSocialRegister) else nil,
		SduiOpenSearchResultsWithQueryReceiver = if config.FFlagLuaAppSduiOpenSearchResultsWithQueryAction then RoactModule.createElement(SduiOpenSearchResultsWithQueryReceiverModule) else nil,
		SduiExperienceStoreRegister = if config.FFlagSduiDevStoreSeeAllSupport then RoactModule.createElement(SduiExperienceStoreRegister) else nil,
		DebugPanel = if FFlagAppDebugPanel then RoactModule.createElement(DebugPanel) else nil
	})
end

function AppContainer.getSelectedBottomBarItemIndex(p1)
	-- upvalues: AppNavBarModule (copy), IABottomBarItemsModule2 (ref)
	local Navigation = p1.props.navigation
	
	if Navigation and Navigation.state then
		local AppNavRootName = AppNavBarModule.getAppNavRootName(Navigation.state)
		
		if AppNavRootName then
			return IABottomBarItemsModule2[AppNavRootName]
		end
	end
	return nil
end

function AppContainer.getCurrentPage(p1, p2)
	-- upvalues: AppNavBarModule (copy)
	local Navigation = (p2 or p1.props).navigation
	
	return if Navigation and Navigation.state then AppNavBarModule.getAppNavCurrentPage(Navigation.state) else nil
end

local Callback = MemoizeModule(function(BadgeCount: number, _, p1, _, _)
	-- upvalues: IABottomBarItemsModule (ref), IABottomBarItemsModule2 (ref), GetIABottomBarItemsModule (copy), PartyTabBadgeImpressionModule (copy), PartyTabBadgeMaxCount (copy), BadgeVariant (copy), AppPageModule (copy), CryoModule (copy)
	IABottomBarItemsModule, IABottomBarItemsModule2 = GetIABottomBarItemsModule()
	local BadgeCount1 = BadgeCount
	local Alert = nil
	
	if typeof(BadgeCount) == "number" and BadgeCount > 0 then
		if p1 and p1.EventStream then
			PartyTabBadgeImpressionModule(p1.EventStream, "AppContainer", BadgeCount)
		end
		BadgeCount1 = if PartyTabBadgeMaxCount < BadgeCount then tostring(PartyTabBadgeMaxCount) .. "+" else tostring(BadgeCount)
		Alert = BadgeVariant.Alert
	end
	local JoinResult = IABottomBarItemsModule
	local IABottomBarItemsModuleEntry = IABottomBarItemsModule2[AppPageModule.Chat]
	
	if IABottomBarItemsModuleEntry ~= nil then
		JoinResult = CryoModule.List.join(IABottomBarItemsModule)
		JoinResult[IABottomBarItemsModuleEntry].badgeCount = BadgeCount1
		JoinResult[IABottomBarItemsModuleEntry].badgeVariant = Alert
	end
	return JoinResult
end)

local function computeAppContainerNavPropsFromRouteHistory(SelectLegacyHistoryResult)
	-- upvalues: AppPagePropertiesModule (copy), SystemBarVisibilityModule (copy), AppNavAppContainerBottomBarIndexFromNav (copy), IABottomBarItemsModule2 (ref), AppNavAppContainerCurrentPageFromNav (copy)
	local SelectLegacyHistoryResultEntry = SelectLegacyHistoryResult[#SelectLegacyHistoryResult]
	
	return {
		selectedBottomBarItemIndex = if AppNavAppContainerBottomBarIndexFromNav then nil else IABottomBarItemsModule2[SelectLegacyHistoryResultEntry[1].name],
		currentPage = if AppNavAppContainerCurrentPageFromNav then nil else SelectLegacyHistoryResultEntry[#SelectLegacyHistoryResultEntry].name,
		tabBarVisibility = (function(p1)
			-- upvalues: AppPagePropertiesModule (upval), SelectLegacyHistoryResultEntry (copy), SystemBarVisibilityModule (upval)
			local AppPagePropertiesModuleEntry = nil
			for i = #p1, 1, -1 do
				AppPagePropertiesModuleEntry = AppPagePropertiesModule[SelectLegacyHistoryResultEntry[i].name] or {}
				
				if AppPagePropertiesModuleEntry.tabBarHidden then
					return AppPagePropertiesModuleEntry.tabBarHidden
				end
			end
			return SystemBarVisibilityModule.Visible
		end)(SelectLegacyHistoryResultEntry)
	}
end

local v2 = RoactRoduxModule.connect(function(p1, p2)
	-- upvalues: FFlagSignalsNavP3bTopBar (copy), FFlagUseNavigationSelectors (copy), Selectors (copy), computeAppContainerNavPropsFromRouteHistory (copy), CryoModule (copy), Callback (copy), FFlagAppChatRenameGuacPolicyEnabled (copy), FFlagMomentsTabReactiveIXP (copy), FFlagEnableArgus (copy), LoginStatusModule (copy), FFlagLuaAppEdpKeepFullPageOnPortraitRotation (copy)
	local UnreadConversationCount = p1.SocialTab.UnreadConversationCount or 0
	
	return CryoModule.Dictionary.join(if FFlagSignalsNavP3bTopBar then {} else computeAppContainerNavPropsFromRouteHistory(if FFlagUseNavigationSelectors then Selectors.selectLegacyHistory(p1) else p1.Navigation.history), {
		screenSize = p1.ScreenSize,
		globalGuiInset = p1.GlobalGuiInset,
		bottomBarVisible = p1.TabBarVisible,
		bottomBarItems = Callback(UnreadConversationCount, p2.canSeeChatTab, p2.analytics, if FFlagAppChatRenameGuacPolicyEnabled then p2.canSeeChatTerminology else nil, if FFlagMomentsTabReactiveIXP and FFlagEnableArgus then p2.momentsEntryType else nil),
		chatBadgeCount = UnreadConversationCount,
		userLoggedIn = p1.AuthenticationStatus.status == LoginStatusModule.LOGGED_IN,
		formFactor = p1.FormFactor,
		deviceOrientation = if FFlagLuaAppEdpKeepFullPageOnPortraitRotation then p1.DeviceOrientation else nil,
		localUserId = p1.LocalUserId
	})
end, function(Callback)
	-- upvalues: config (copy), AppPageModule (copy), CorePackages (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), CryoModule (copy), NavigateToRouteModule (copy), ResetNavigationHistoryModule (copy), AppNavBarModule (copy), SetTabBarVisibleFunction (copy), SetCentralOverlayModule (copy), OverlayTypeModule (copy), EnteredChatFromEntryPointModule (copy)
	return {
		navigateToPage = function(Name)
			-- upvalues: config (upval), AppPageModule (upval), CorePackages (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), CryoModule (upval), Callback (copy), NavigateToRouteModule (upval)
			if config.FFlagLuaAppChartsAppPage and Name == AppPageModule.Games then
				require(CorePackages.Workspace.Packages.Charts).navigateToChartsPage({
					navigate = function(Name, p1)
						-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), CryoModule (upval), Callback (upval), NavigateToRouteModule (upval)
						if FFlagSignalsNavP3Dispatch then
							NavigationCommands.to(NavigationCommands.fromLegacyPage(CryoModule.Dictionary.join({ name = Name }, p1 or {})))
							
							return
						else
							Callback(NavigateToRouteModule({ CryoModule.Dictionary.join({ name = Name }, p1 or {}) }))
						end
					end
				})
				
				return
			end
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.to(NavigationCommands.fromLegacyPage({ name = Name }))
				
				return
			else
				Callback(NavigateToRouteModule({ { name = Name } }))
			end
		end,
		resetNavigationHistoryToBlockPage = function()
			-- upvalues: Callback (copy), ResetNavigationHistoryModule (upval), AppPageModule (upval)
			Callback(ResetNavigationHistoryModule({ { name = AppPageModule.UAppBlock } }))
		end,
		setTabBarVisible = function(p1)
			-- upvalues: AppNavBarModule (upval), Callback (copy), SetTabBarVisibleFunction (upval)
			AppNavBarModule.AppNavTelemetry.logVisibilityStart(p1)
			Callback(SetTabBarVisibleFunction(p1))
		end,
		showVngForm = function()
			-- upvalues: Callback (copy), SetCentralOverlayModule (upval), OverlayTypeModule (upval)
			Callback(SetCentralOverlayModule(OverlayTypeModule.VngContactInfoFormWebviewPopup, {}, { DisableBackButtonClose = true }))
		end,
		enteredChatFromEntryPoint = function(p1)
			-- upvalues: Callback (copy), EnteredChatFromEntryPointModule (upval)
			Callback(EnteredChatFromEntryPointModule(p1))
		end
	}
end)(AppContainer)

if FFlagSignalsNavP3bTopBar then
	v2 = (function(p1)
		-- upvalues: GetLegacyNavigationStore (copy), UseSignalStateFunction (copy), computeAppContainerNavPropsFromRouteHistory (copy), ReactModule (copy), CryoModule (copy)
		return function(p2)
			-- upvalues: GetLegacyNavigationStore (upval), UseSignalStateFunction (upval), computeAppContainerNavPropsFromRouteHistory (upval), ReactModule (upval), p1 (copy), CryoModule (upval)
			return ReactModule.createElement(p1, CryoModule.Dictionary.union(p2, (computeAppContainerNavPropsFromRouteHistory((UseSignalStateFunction(GetLegacyNavigationStore(false).getHistory))))))
		end
	end)(v2)
end
local v3 = RoactAppExperimentModule.connectUserLayer({
	AppUserLayers.SocialFriendsLayer,
	AppUserLayers.SocialMomentsMigration,
	"PlatformExcellence.QualityImprovement.App"
}, function(p1, _)
	-- upvalues: AppUserLayers (copy), FFlagMomentsTabReactiveIXP (copy), FFlagEnableArgus (copy)
	local v4 = p1[AppUserLayers.SocialMomentsMigration] or {}
	
	return {
		luaAddFriendsPageEnabled = (p1[AppUserLayers.SocialFriendsLayer] or {}).show_lua_add_friends_page == "True",
		momentsEntryType = if FFlagMomentsTabReactiveIXP and FFlagEnableArgus then v4.entryType else nil
	}
end)((RoactNavigationModule.withNavigation((WithIsGamepadInputFunction((RoactAppPolicy.connect(function(AppPolicy)
	-- upvalues: config (copy), UniversalAppPolicyModule (copy), FFlagAppChatRenameGuacPolicyEnabled (copy)
	return {
		appPolicy = AppPolicy,
		policyShouldBlockUAppAccess = if config.GetFFlagEnableAccessBlockAtAppContainerLevel() then AppPolicy.getEnableUAppAccessBlock() or AppPolicy.getEnableHomePageAgeBlock() else nil,
		shouldSystemBarUsuallyBePresent = AppPolicy.getShouldSystemBarUsuallyBePresent(),
		canSeeChatTab = UniversalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTab(),
		canSeeChatTerminology = if FFlagAppChatRenameGuacPolicyEnabled then UniversalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTerminology() else nil
	}
end)((RoactServices.connect({
	notificationService = AppNotificationService,
	networking = RoactNetworkingModule,
	bottomBarAnalytics = RoactAnalyticsBottomBarModule,
	analytics = RoactAnalyticsModule,
	loggingProtocol = AppLogging
})(v2)))))))))

if not config.FFlagLuaAppForceVrAppPanelWidthRollout then
	v3 = IxpUtilsModule.connectTestVariables({
		vrPanelWidthMultiplier = VRPanelWidthIXP.VrAppPanelWidthMultiplier,
		vrPanelCurvature = VRPanelWidthIXP.VrAppPanelCurvature
	})(v3)
end
return function(p1)
	-- upvalues: config (copy), UseOverlayFunction (copy), UseIsSpatialFunction (copy), FFlagAddGamepadBumperNavigation (copy), UseGamepadBumperNavigationBindingsFunction (copy), IABottomBarItemsModule (ref), FFlagEnableLeftNavOnConsole (copy), UseNavBarSizeFunction (copy), UseNavBarPlacementFunction (copy), CryoModule (copy), RoactModule (copy), v3 (ref)
	if config.FFlagLuaAppUseOverlayInAppContainer then
		UseOverlayFunction()
	end
	local UseIsSpatialResult = UseIsSpatialFunction()
	local EventMap = nil
	local EventHandlerMap = nil
	local IsBumperNavigationEnabled = nil
	
	if FFlagAddGamepadBumperNavigation then
		local UseGamepadBumperNavigationBindingsResult = UseGamepadBumperNavigationBindingsFunction(IABottomBarItemsModule)
		EventMap = UseGamepadBumperNavigationBindingsResult.eventMap
		EventHandlerMap = UseGamepadBumperNavigationBindingsResult.eventHandlerMap
		IsBumperNavigationEnabled = UseGamepadBumperNavigationBindingsResult.isBumperNavigationEnabled
	end
	local UseNavBarSizeResult = if FFlagEnableLeftNavOnConsole then UseNavBarSizeFunction() else nil
	local UseNavBarPlacementResult = if FFlagEnableLeftNavOnConsole then UseNavBarPlacementFunction() else nil
	
	return RoactModule.createElement(v3, (CryoModule.Dictionary.join(p1, {
		use3DPanels = UseIsSpatialResult,
		bumperNavigationEventMap = if FFlagAddGamepadBumperNavigation then EventMap else {},
		bumperNavigationEventHandlerMap = if FFlagAddGamepadBumperNavigation then EventHandlerMap else {},
		isBumperNavigationEnabled = if FFlagAddGamepadBumperNavigation then IsBumperNavigationEnabled else nil,
		navBarSize = if FFlagEnableLeftNavOnConsole then UseNavBarSizeResult else nil,
		navBarPlacement = if FFlagEnableLeftNavOnConsole then UseNavBarPlacementResult else nil
	})))
end