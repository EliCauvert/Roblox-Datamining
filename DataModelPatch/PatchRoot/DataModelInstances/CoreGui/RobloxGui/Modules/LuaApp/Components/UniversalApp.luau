local CorePackages = game:GetService("CorePackages")
local BrowserService = game:GetService("BrowserService")
local HttpService = game:GetService("HttpService")
local NotificationService = game:GetService("NotificationService")
local LocalizationService = game:GetService("LocalizationService")
local GuiService = game:GetService("GuiService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local SessionService = game:GetService("SessionService")
local EventIngestService = game:GetService("EventIngestService")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local AutoUpgradeEngineFeatureOnlyEngineFeature = game:GetEngineFeature("AutoUpgradeEngineFeatureOnly")
local AppUpdateService = AutoUpgradeEngineFeatureOnlyEngineFeature and game:GetService("AppUpdateService") or nil
local IXPService = game:GetService("IXPService")
local AvatarEditorService = game:GetService("AvatarEditorService")
local ContentProvider = game:GetService("ContentProvider")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local StartupMessageService = game:GetService("StartupMessageService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
require(Modules.AvatarExperience.Common.Debug.LogTreeConfig)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local Default = require(CorePackages.Workspace.Packages.PopLatencyOverlay).default
local RoactModule = require(CorePackages.Packages.Roact)
local RoduxModule = require(CorePackages.Packages.Rodux)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local _ = require(Modules.LuaApp.Types.RoduxTypes)
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local SystemInfoProtocol = require(CorePackages.Workspace.Packages.SystemInfoProtocol).SystemInfoProtocol
local LinkingProtocol = require(CorePackages.Workspace.Packages.LinkingProtocol).LinkingProtocol
local LoggingProtocolModule = require(CorePackages.Workspace.Packages.LoggingProtocol)
local GameProtocol = require(CorePackages.Workspace.Packages.ExperienceService).GameProtocol
local PermissionsProtocol = require(CorePackages.Workspace.Packages.PermissionsProtocol).PermissionsProtocol
local PrefetchProtocol = require(CorePackages.Workspace.Packages.PrefetchProtocol).PrefetchProtocol
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local ExternalContentSharingProtocol = require(CorePackages.Workspace.Packages.ExternalContentSharingProtocol).ExternalContentSharingProtocol
local SignalModule = require(Modules.Common.Signal)
local AnalyticsModule = require(Modules.Common.Analytics)
local AppReducerModule = require(Modules.LuaApp.AppReducer)
local UseUserAgreementsFunction = require(CorePackages.Workspace.Packages.UserAgreements).useUserAgreements
local Localization = require(CorePackages.Workspace.Packages.RobloxAppLocales).Localization
local AppConfigurerModule = require(Modules.LuaApp.Components.AppConfigurer)
local AppUiModeStyleProviderModule = require(Modules.LuaApp.Components.AppUiModeStyleProvider)
local DesignFoundationsBridgeModule = require(Modules.LuaApp.Components.DesignFoundationsBridge)
local RoactUtilsModule = require(CorePackages.Workspace.Packages.RoactUtils)
local ProviderContainer = RoactUtilsModule.Components.ProviderContainer
local ReactProfiler = RoactUtilsModule.Profiling.ReactProfiler
local ReactProfilerContext = RoactUtilsModule.Profiling.ReactProfilerContext
local UiShellEventsModule = require(CorePackages.Workspace.Packages.UiShellEvents)
local EventStreamUpdaterModule = require(Modules.LuaApp.Components.EventStreamUpdater)
local PageObjectManagerModule = require(Modules.AvatarExperience.Common.Managers.PageObjectManager)
local MutedErrorReporterModule = require(Modules.LuaApp.Components.MutedErrorReporter)
local MemStorageSubscriberLifecycleAdapterModule = require(Modules.LuaApp.Components.MemStorageSubscriberLifecycleAdapter)
local LocalPlayerManagerModule = require(Modules.LuaApp.Components.LocalPlayerManager)
local ViewportManagerModule = require(Modules.LuaApp.Components.ViewportManager)
local FrameRateManagerModule = require(Modules.LuaApp.Components.FrameRateManager)
local LocaleManagerModule = require(Modules.LuaApp.Components.LocaleManager)
local LocalStorageListenerModule = require(Modules.LuaApp.Components.LocalStorageListener)
local LuaAppBacktraceLoggerModule = require(Modules.LuaApp.LuaAppBacktraceLogger)
local SessionManagerModule = require(Modules.LuaApp.Components.Session.SessionManager)
local UserHeartbeatsManagerModule = require(Modules.LuaApp.Components.Session.UserHeartbeatsManager)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local CreateRoduxErrorReporterModule = require(Modules.LuaApp.Util.createRoduxErrorReporter)
local SiteAlertManagerModule = require(Modules.LuaApp.Components.SiteAlertManager)
local InAppAchievementManager = require(CorePackages.Workspace.Packages.Achievements).InAppAchievementManager
local Provider = require(CorePackages.Workspace.Packages.FocusNavigationUtils).FocusNavigableSurfaceRegistry.Provider
local AppReadyHandler = require(CorePackages.Workspace.Packages.RobloxAppNavigationCore).AppReadyHandler
local RnBypassAdapter = require(CorePackages.Workspace.Packages.RobloxAppNavigationCore).RnBypassAdapter
local FFlagVirtualCursorModularization = require(CorePackages.Workspace.Packages.SharedFlags).FFlagVirtualCursorModularization

if require(CorePackages.Workspace.Packages.SharedFlags).FFlagImportVirtualCursorToUA then
	if FFlagVirtualCursorModularization then
		require(CorePackages.Workspace.Packages.VirtualCursorModular)
	else
		require(CorePackages.Workspace.Packages.VirtualCursor)
	end
end
local LocalizationProviderModule = require(Modules.LuaApp.LocalizationProvider)
local DesignTokenProvider = require(CorePackages.Workspace.Packages.Style).DesignTokenProvider
local TokenMappersModule = require(Modules.LuaApp.DesignTokenMappers.tokenMappers)
local AppGridProviderModule = require(Modules.LuaApp.Components.AppGridProvider)
local SelectionCursorProvider = UIBloxModule.App.SelectionImage.SelectionCursorProvider
local CursorProvider = UIBloxModule.App.SelectionCursor.CursorProvider
local ThemeProviderModule = require(Modules.LuaApp.ThemeProvider)
local DeprecatedDarkThemeModule = require(Modules.LuaApp.Themes.DeprecatedDarkTheme)
local ApolloProvider = require(CorePackages.Packages.ApolloClient).ApolloProvider
local SquadExternalContractProvider = require(CorePackages.Workspace.Packages.SquadsCore.SquadExternalContractProvider).SquadExternalContractProvider
local SquadLocationEnum = require(CorePackages.Workspace.Packages.SquadsCore.Enums).SquadLocationEnum
local UniversalAppEventReceiversModule = require(Modules.LuaApp.Components.UniversalAppEventReceivers)
local VRFoundationOverlayProviderModule = require(Modules.LuaApp.Components.CrossPlatformCompatibility.VRFoundationOverlayProvider)
local LuaAppBacktraceReporterAdaptorModule = require(Modules.LuaApp.Components.LuaAppBacktraceReporterAdaptor)
local AppSquadContractModule = require(Modules.LuaApp.Components.Squad.AppSquadContract)
local AppChatToastManagerUAModule = require(CorePackages.Workspace.Packages.AppChat.AppChatToastManagerUA)
local SignalsMessageIngestionMiddlewareModule = require(CorePackages.Workspace.Packages.AppChat.SignalsMessageIngestionMiddleware)
local FFlagAppChatSignalsMessageStoreModule = require(CorePackages.Workspace.Packages.AppChat.FFlagAppChatSignalsMessageStore)
local GetFFlagEnableUnifiedWebViewsFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableUnifiedWebViews
local FFlagEnableSignalsMiddleware = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableSignalsMiddleware
local FFlagSignalsNavP2NavigationPrimitives = SharedFlagsModule.FFlagSignalsNavP2NavigationPrimitives
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local RoactLocalizationModule = require(Modules.LuaApp.Services.RoactLocalization)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local AppBrowserService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppBrowserService
local AppNotificationService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppNotificationService
local AppGuiService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppGuiService
local AppSystemInfo = require(CorePackages.Workspace.Packages.RoactServiceTags).AppSystemInfo
local AppAppLifecycleObserverService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppAppLifecycleObserverService
local AppLinking = require(CorePackages.Workspace.Packages.RoactServiceTags).AppLinking
local AppLogging = require(CorePackages.Workspace.Packages.RoactServiceTags).AppLogging
local AppGame = require(CorePackages.Workspace.Packages.RoactServiceTags).AppGame
local AppPermissions = require(CorePackages.Workspace.Packages.RoactServiceTags).AppPermissions
local AppPrefetch = require(CorePackages.Workspace.Packages.RoactServiceTags).AppPrefetch
local AppRunService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppRunService
local AppContentProvider = require(CorePackages.Workspace.Packages.RoactServiceTags).AppContentProvider
local AppUserInputService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppUserInputService
local AppSessionService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppSessionService
local SessionServiceWrapperModule = require(Modules.LuaApp.Components.Session.SessionServiceWrapper)
local AppEventIngestServiceModule = require(Modules.LuaApp.Services.AppEventIngestService)
local WrapRequestWithMiddlewareModule = require(Modules.LuaApp.Http.wrapRequestWithMiddleware)
local AppUserGameSettings = require(CorePackages.Workspace.Packages.RoactServiceTags).AppUserGameSettings
local AppUpdateService1 = require(CorePackages.Workspace.Packages.RoactServiceTags).AppUpdateService
local EventIngest = require(CorePackages.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest
local TopBarSearchSignalContextModule = require(Modules.LuaApp.Context.TopBarSearchSignalContext)
local PageObjectManagerContextModule = require(Modules.AvatarExperience.Common.Context.PageObjectManagerContext)
local AppUpdateServiceWrapper = require(CorePackages.Workspace.Packages.RobloxAppUpdate).AppUpdateServiceWrapper
local AppUpdateManagerModule = require(Modules.LuaApp.Components.AppUpdate.AppUpdateManager)
local RoactAppExperimentModule = require(CorePackages.Packages.RoactAppExperiment)
local RequestInternalWrapperFunction = require(CorePackages.Workspace.Packages.Http).NetworkLayers.requestInternalWrapper
local ExperienceMenuIXPPreloadModule = require(Modules.LuaApp.Experiment.ExperienceMenuIXPPreload)
local WidgetStoreIXPModule = require(Modules.LuaApp.Experiment.WidgetStoreIXP)
local AndroidWidgetStoreIXPModule = require(Modules.LuaApp.Experiment.AndroidWidgetStoreIXP)
local IOSUIRefactorIXPModule = require(Modules.LuaApp.Experiment.IOSUIRefactorIXP)
local IosAuthServiceIxpStoreModule = require(Modules.LuaApp.Experiment.IosAuthServiceIxpStore)
local RoactAnalyticsCommonGameEvents = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactAnalyticsCommonGameEvents
local CommonGameEventsModule = require(Modules.LuaApp.Services.CommonGameEvents)
local AppStartupSequenceTag = require(CorePackages.Workspace.Packages.RoactServiceTags).AppStartupSequenceTag
local CreatePerformFetchMiddlewareFunction = require(CorePackages.Workspace.Packages.Http).createPerformFetchMiddleware
local AppStartupMessageService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppStartupMessageService
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local AppFeaturePolicies = require(CorePackages.Workspace.Packages.UniversalAppPolicy).AppFeaturePolicies
local ChatPolicies = require(CorePackages.Workspace.Packages.SocialPolicies).ChatPolicies
local AvatarPolicies = require(CorePackages.Workspace.Packages.AvatarPolicies).AvatarPolicies
local SharePolicies = require(CorePackages.Workspace.Packages.SocialPolicies).SharePolicies
local ShareTargetGamePolicies = require(CorePackages.Workspace.Packages.SocialPolicies).ShareTargetGamePolicies
local Number: number? = tonumber(settings():GetFVariable("LuaAnalyticsReleasePeriod"))
local BackgroundSoundManagerModule = require(Modules.LuaApp.Components.AppSound.BackgroundSoundManager)
local NativeShellEventReceiverModule = require(Modules.LuaApp.Components.EventReceivers.NativeShellEventReceiver)
local RNAdapterThunkModule = require(Modules.LuaApp.Thunks.RNAdapterThunk)
local HomePageLoadTracker = require(CorePackages.Workspace.Packages.HomePageLoadTracker).HomePageLoadTracker
local ApplyRoactNavigationHistoryModule = require(Modules.LuaApp.Actions.ApplyRoactNavigationHistory)
local GetHasBackgroundMusicModule = require(Modules.LuaApp.Util.getHasBackgroundMusic)
local GetLegacyRouteFromRoactNavigationStateFunction = require(CorePackages.Workspace.Packages.NavigationRodux).Utils.getLegacyRouteFromRoactNavigationState
local StartupMessageContainer = require(CorePackages.Workspace.Packages.AppStartup).StartupMessageContainer
local SocialGraphSyncManager = require(CorePackages.Workspace.Packages.SocialGraphSync).SocialGraphSyncManager
local FeedbackManagerInjectionContextProvider = require(CorePackages.Workspace.Packages.InteractionFeedback).FeedbackManagerInjectionContextProvider
local AppInteractionFeedbackProvider = require(CorePackages.Workspace.Packages.RobloxAppInteractionFeedbackConfig).AppInteractionFeedbackProvider
local DiscoveryAppLaunchTracker = require(CorePackages.Workspace.Packages.AppLaunchTracker).DiscoveryAppLaunchTracker
local BugReporterEventReceiver = require(CorePackages.Workspace.Packages.BugReporting).BugReporterEventReceiver
local MouseCursorHandlerModule = require(Modules.LuaApp.Util.MouseCursorHandler)

if require(Modules.LuaApp.Bootcamp.Util.EnableLuaAppBootcamp)() then
	local Success, Result = pcall(require, Modules.LuaApp.Bootcamp.Util.LuaAppBootcampUtil)
	
	if Success then
		Result.runBootcamp()
	else
		warn("Failed to require Bootcamp modules.")
	end
end
local config = {
	FIntLuaAppBatchFetchingStatusDelayMs = require(CorePackages.Workspace.Packages.SharedFlags).FIntLuaAppBatchFetchingStatusDelayMs,
	GetFFlagInjectAnalyticsService = require(Modules.LuaApp.Flags.GetFFlagInjectAnalyticsService),
	GetFFlagIsSquadEnabled = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagIsSquadEnabled,
	FFlagUseSessionServiceWrapper = require(Modules.LuaApp.Flags.FFlagLuaAppUseSessionServiceWrapper),
	FFlagLuaAppLaunchTrackThunks = require(CorePackages.Workspace.Packages.AppLaunchTracker).Flags.FFlagLuaAppLaunchTrackThunks,
	GetFFlagEnableWidgetLUAIXP = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableWidgetLUAIXP,
	GetFFlagEnableAndroidWidgetsLuaIXP = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableAndroidWidgetsLuaIXP,
	GetFFlagEnableIOSUIRefactorLuaIXP = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableIOSUIRefactorLuaIXP,
	FFlagEnableLockScreenWidgetLuaIXP = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLockScreenWidgetLuaIXP,
	GetFFlagEnableInAppBugReporting = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableInAppBugReporting,
	FFlagShareTargetGameCleanup = require(CorePackages.Workspace.Packages.SharedFlags).FFlagShareTargetGameCleanup,
	FFlagEnableReadAloudInUA = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableReadAloudInUA(),
	FFlagLuaAppSupportFoundationOverlayInVR = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppSupportFoundationOverlayInVR,
	FFlagLuaAppUseAppHttpStore = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppUseAppHttpStore,
	GetFFlagEnableIosAuthServiceLuaIXP = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableIosAuthServiceLuaIXP,
	FFlagLuaAppNavigationTTITracking = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppNavigationTTITracking,
	FFlagLuaAppHomePageLoadTracker = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppHomePageLoadTracker,
	FFlagLuaAppDesignFoundationsBridge = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppDesignFoundationsBridge,
	FFlagAppChatConversationStore = require(CorePackages.Workspace.Packages.AppChat.FFlagAppChatConversationStore),
	trackStart = require(CorePackages.Workspace.Packages.TimeToInteractiveTracker).TimeToInteractiveTracker.trackStart
}
local Callback = nil
local HttpStoreModule = nil

if config.FFlagLuaAppUseAppHttpStore then
	Callback = require(Modules.LuaApp.Util.createAppHttpStoreWrapper)
	HttpStoreModule = require(CorePackages.Workspace.Packages.HttpStore)
end
local config1 = {
	AvatarSceneInteractionProvider = require(Modules.AvatarExperience.Common.Context.SceneInteractionProvider),
	BodyDataProvider = require(Modules.AvatarExperience.Common.Context.BodyDataProvider),
	AdjustmentDataProvider = require(Modules.AvatarExperience.Common.Context.AdjustmentData.AdjustmentDataProvider),
	AppliedDescriptionProvider = require(Modules.AvatarExperience.Common.Context.AppliedDescription.AppliedDescriptionProvider),
	AvatarSaveContextProvider = require(CorePackages.Workspace.Packages.AvatarExperienceSave).Context.AvatarSaveContextProvider
}
local PostAppInteractiveLoaderModule = require(Modules.LuaApp.UniversalApp.PostAppInteractiveLoader)
local ApolloClientModule = require(Modules.LuaApp.Components.ApolloClient)
local RootNavigatorModule = require(Modules.LuaApp.Navigation.RootNavigator)
local MakeNavigationStateLoggerModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.Debug.makeNavigationStateLogger)
local MakeOmniFeedServiceModule = require(Modules.Personalization.OmniFeed.makeOmniFeedService)
local NavigationModule = require(CorePackages.Workspace.Packages.Navigation)
local AppNavigationModule = if SharedFlagsModule.FFlagUseSignalsNavigation then require(Modules.LuaApp.Navigation.AppNavigation) else nil

local function getTargetPage(Action)
	-- upvalues: getTargetPage (copy)
	if Action and Action.action and Action.action.routeName then
		return Action.action.routeName
	end
	if Action and Action.routeName then
		return Action.routeName
	end
	if Action and Action.actions and typeof(Action.actions) == "table" and Action.index then
		local Action1 = Action.actions[Action.index]
		
		if Action1 then
			return getTargetPage(Action1)
		end
	end
	return nil
end

local function _(p1)
	-- upvalues: RoactModule (copy), RoactNavigationModule (copy)
	local NavigationAppContainer = RoactModule.PureComponent:extend("NavigationAppContainer")
	NavigationAppContainer.router = p1.router
	
	function NavigationAppContainer.render(p2)
		return p2.props.children
	end
	
	return RoactNavigationModule.createAppContainer(NavigationAppContainer)
end

local function UserAgreementsManager()
	-- upvalues: UseUserAgreementsFunction (copy)
	UseUserAgreementsFunction()
	
	return nil
end

local CreateStore = if SharedFlagsModule.FFlagUseSignalsRoduxStore then require(CorePackages.Workspace.Packages.SignalsRodux).createStore else RoduxModule.Store.new
local UniversalApp = RoactModule.Component:extend("UniversalApp")
UniversalApp.defaultProps = {
	httpService = HttpService,
	rbxAnalyticsService = if config.GetFFlagInjectAnalyticsService() then RbxAnalyticsService else nil,
	ixpService = if config.GetFFlagInjectAnalyticsService() then IXPService else nil
}

function UniversalApp.init(p1)
	-- upvalues: LoggingProtocolModule (copy), PageObjectManagerModule (copy), AvatarEditorService (copy), config (copy), DiscoveryAppLaunchTracker (copy), RoduxModule (copy), FFlagSignalsNavP2NavigationPrimitives (copy), SignalModule (copy), RNAdapterThunkModule (copy), getTargetPage (copy), HomePageLoadTracker (copy), CreatePerformFetchMiddlewareFunction (copy), FFlagAppChatSignalsMessageStoreModule (copy), SignalsMessageIngestionMiddlewareModule (copy), CorePackages (copy), FFlagEnableSignalsMiddleware (copy), Modules (copy), CreateRoduxErrorReporterModule (copy), MutedErrorModule (copy), CreateStore (copy), AppReducerModule (copy), SharedFlagsModule (copy), RootNavigatorModule (copy), RoactModule (copy), RoactNavigationModule (copy), AnalyticsModule (copy), SystemInfoProtocol (copy), LinkingProtocol (copy), GameProtocol (copy), PermissionsProtocol (copy), PrefetchProtocol (copy), ExternalContentSharingProtocol (copy), Localization (copy), LocalizationService (copy), GuiService (copy), Callback (ref), RequestInternalWrapperFunction (copy), SessionServiceWrapperModule (copy), SessionService (copy), StartupMessageService (copy), EventIngest (copy), EventIngestService (copy), AutoUpgradeEngineFeatureOnlyEngineFeature (copy), AppUpdateServiceWrapper (copy), AppUpdateService (copy), CommonGameEventsModule (copy), ReactFocusNavigationModule (copy), GetLegacyRouteFromRoactNavigationStateFunction (copy), LuaAppBacktraceLoggerModule (copy), WrapRequestWithMiddlewareModule (copy), InAppAchievementManager (copy), RoactUtilsModule (copy), UiShellEventsModule (copy), MakeOmniFeedServiceModule (copy)
	LoggingProtocolModule.default:logEventOnce("universal_app_init_begin")
	p1._pageObjectManager = PageObjectManagerModule.new()
	local config1 = {
		avatarEditorService = AvatarEditorService,
		pageObjectManager = p1._pageObjectManager
	}
	local List = {
		if config.FFlagLuaAppLaunchTrackThunks and DiscoveryAppLaunchTracker.isEnabled() and DiscoveryAppLaunchTracker.default then DiscoveryAppLaunchTracker.default.roduxTracker:makeThunkMiddleware(config1) else RoduxModule.makeThunkMiddleware(config1)
	}
	
	if not FFlagSignalsNavP2NavigationPrimitives then
		p1._rnBypassActionSignal = SignalModule.new()
		table.insert(List, (RNAdapterThunkModule.middleware(function(p2)
			-- upvalues: config (upval), getTargetPage (upval), HomePageLoadTracker (upval), p1 (copy)
			if config.FFlagLuaAppNavigationTTITracking or config.FFlagLuaAppHomePageLoadTracker then
				local TargetPage = getTargetPage(p2)
				
				if config.FFlagLuaAppNavigationTTITracking and TargetPage then
					config.trackStart("NavigateTo_" .. TargetPage, true)
				end
				if config.FFlagLuaAppHomePageLoadTracker and TargetPage == "Home" then
					HomePageLoadTracker.beginVisit()
				end
			end
			p1._rnBypassActionSignal:fire(p2)
		end)))
	end
	table.insert(List, CreatePerformFetchMiddlewareFunction(config.FIntLuaAppBatchFetchingStatusDelayMs / 1000))
	
	if FFlagAppChatSignalsMessageStoreModule then
		table.insert(List, SignalsMessageIngestionMiddlewareModule)
	end
	if config.FFlagAppChatConversationStore then
		table.insert(List, require(CorePackages.Workspace.Packages.AppChat.SignalsConversationMiddleware))
	end
	if FFlagEnableSignalsMiddleware then
		table.insert(List, require(CorePackages.Workspace.Packages.SignalsMiddleware).createSignalsMiddleware((require(Modules.LuaApp.AppSignalsActionHandlers))))
	end
	p1._store = CreateStore(AppReducerModule, nil, List, CreateRoduxErrorReporterModule(MutedErrorModule), if DiscoveryAppLaunchTracker.isEnabled() and DiscoveryAppLaunchTracker.default then _G.__RODUX_STORE_DEV_TOOLS__ or DiscoveryAppLaunchTracker.default.roduxTracker else _G.__RODUX_STORE_DEV_TOOLS__)
	local AppContainer = nil
	
	if SharedFlagsModule.FFlagUseSignalsNavigation then
		AppContainer = nil
	else
		local NavigationAppContainer = RoactModule.PureComponent:extend("NavigationAppContainer")
		NavigationAppContainer.router = RootNavigatorModule.router
		
		function NavigationAppContainer.render(p2)
			return p2.props.children
		end
		
		AppContainer = RoactNavigationModule.createAppContainer(NavigationAppContainer)
	end
	p1._appContainer = AppContainer
	p1._analytics = if config.GetFFlagInjectAnalyticsService() then AnalyticsModule.new(p1.props.rbxAnalyticsService) else AnalyticsModule.new()
	p1._systemInfo = SystemInfoProtocol.default
	p1._linking = LinkingProtocol.default
	p1._logging = LoggingProtocolModule.default
	p1._game = GameProtocol.default
	p1._permissions = PermissionsProtocol.default
	p1._prefetch = PrefetchProtocol.default
	p1._externalContentSharing = ExternalContentSharingProtocol.default
	p1._localization = Localization.new(LocalizationService.RobloxLocaleId)
	p1._guiService = GuiService
	
	if config.FFlagLuaAppUseAppHttpStore then
		p1._appHttpStore = Callback(p1._store, RequestInternalWrapperFunction(p1.props.httpService), p1._guiService)
	end
	p1._sessionService = if config.FFlagUseSessionServiceWrapper then SessionServiceWrapperModule else SessionService
	p1._startupMessage = StartupMessageService
	p1._eventIngest = EventIngest.new(EventIngestService)
	p1._appUpdate = AutoUpgradeEngineFeatureOnlyEngineFeature and AppUpdateServiceWrapper.new(AppUpdateService) or nil
	p1._commonGameEvents = CommonGameEventsModule.get(SessionService, p1._analytics, p1._eventIngest)
	p1._appStartupSequence = require(CorePackages.Workspace.Packages.AppStartup).AppStartupSequence.default
	p1._focusNavigationService = ReactFocusNavigationModule.FocusNavigationService.new(ReactFocusNavigationModule.EngineInterface.CoreGui)
	pcall(function()
		-- upvalues: p1 (copy)
		p1._appLifecycleObserverService = game:GetService("AppLifecycleObserverService")
	end)
	p1.routeSignal = SignalModule.new()
	
	function p1._updateRoute(p2)
		-- upvalues: GetLegacyRouteFromRoactNavigationStateFunction (upval), p1 (copy)
		p1.routeSignal:fire((GetLegacyRouteFromRoactNavigationStateFunction(p2)))
	end
	
	function p1._connectRouteSignal(p2)
		-- upvalues: p1 (copy)
		return p1.routeSignal:connect(p2)
	end
	
	LuaAppBacktraceLoggerModule:connectToStore(p1._store)
	p1._appRequestService = WrapRequestWithMiddlewareModule(RequestInternalWrapperFunction(p1.props.httpService), p1._store, p1._guiService)
	p1._achievementManager = InAppAchievementManager.new(p1._store)
	p1._profilerContext = RoactUtilsModule.Profiling.createReactProfilerContext()
	UiShellEventsModule.createAppLaunchReactProfilerLogger(p1._profilerContext, "home_page_interactive")
	MakeOmniFeedServiceModule()
	
	if config.FFlagEnableReadAloudInUA then
		require(CorePackages.Workspace.Packages.ReadAloud).ConnectReadAloudToSettings()
	end
	LoggingProtocolModule.default:logEventOnce("universal_app_init_end")
end

function UniversalApp.appendRoactServiceProviders(p2, List)
	-- upvalues: RoactServices (copy), RoactAnalyticsModule (copy), RoactLocalizationModule (copy), RoactNetworkingModule (copy), AppBrowserService (copy), GetFFlagEnableUnifiedWebViewsFunction (copy), BrowserService (copy), AppNotificationService (copy), NotificationService (copy), AppGuiService (copy), AppSystemInfo (copy), AppLinking (copy), AppLogging (copy), AppGame (copy), AppPermissions (copy), AppPrefetch (copy), AppRunService (copy), RunService (copy), AppContentProvider (copy), ContentProvider (copy), AppUserInputService (copy), UserInputService (copy), AppAppLifecycleObserverService (copy), AppSessionService (copy), AppEventIngestServiceModule (copy), AppUserGameSettings (copy), UserGameSettings (copy), AppUpdateService1 (copy), RoactAnalyticsCommonGameEvents (copy), AppStartupSequenceTag (copy), AppStartupMessageService (copy)
	table.insert(List, {
		class = RoactServices.ServiceProvider,
		props = {
			services = {
				[RoactAnalyticsModule] = p2._analytics,
				[RoactLocalizationModule] = p2._localization,
				[RoactNetworkingModule] = p2._appRequestService,
				[AppBrowserService] = if GetFFlagEnableUnifiedWebViewsFunction() then nil else BrowserService,
				[AppNotificationService] = NotificationService,
				[AppGuiService] = p2._guiService,
				[AppSystemInfo] = p2._systemInfo,
				[AppLinking] = p2._linking,
				[AppLogging] = p2._logging,
				[AppGame] = p2._game,
				[AppPermissions] = p2._permissions,
				[AppPrefetch] = p2._prefetch,
				[AppRunService] = RunService,
				[AppContentProvider] = ContentProvider,
				[AppUserInputService] = UserInputService,
				[AppAppLifecycleObserverService] = p2._appLifecycleObserverService,
				[AppSessionService] = p2._sessionService,
				[AppEventIngestServiceModule] = p2._eventIngest,
				[AppUserGameSettings] = UserGameSettings,
				[AppUpdateService1] = p2._appUpdate,
				[RoactAnalyticsCommonGameEvents] = p2._commonGameEvents,
				[AppStartupSequenceTag] = p2._appStartupSequence,
				[AppStartupMessageService] = p2._startupMessage
			}
		}
	})
end

function UniversalApp.render(p2)
	-- upvalues: DeprecatedDarkThemeModule (copy), ReactProfilerContext (copy), ReactProfiler (copy), SharedFlagsModule (copy), NavigationModule (copy), AppNavigationModule (copy), MakeNavigationStateLoggerModule (copy), RoactAppExperimentModule (copy), config (copy), IXPService (copy), RoactRoduxModule (copy), RoactAppPolicy (copy), AppFeaturePolicies (copy), ChatPolicies (copy), AvatarPolicies (copy), SharePolicies (copy), ShareTargetGamePolicies (copy), AppUiModeStyleProviderModule (copy), DesignFoundationsBridgeModule (copy), DesignTokenProvider (copy), TokenMappersModule (copy), AppGridProviderModule (copy), ThemeProviderModule (copy), LocalizationProviderModule (copy), ReactFocusNavigationModule (copy), Provider (copy), config1 (copy), TopBarSearchSignalContextModule (copy), PageObjectManagerContextModule (copy), ApolloProvider (copy), ApolloClientModule (copy), AppInteractionFeedbackProvider (copy), FeedbackManagerInjectionContextProvider (copy), ResponsiveModule (copy), SquadExternalContractProvider (copy), AppSquadContractModule (copy), SquadLocationEnum (copy), VRFoundationOverlayProviderModule (copy), NativeShellEventReceiverModule (copy), ExperienceMenuIXPPreloadModule (copy), WidgetStoreIXPModule (copy), AndroidWidgetStoreIXPModule (copy), IOSUIRefactorIXPModule (copy), IosAuthServiceIxpStoreModule (copy), RoactModule (copy), UniversalAppEventReceiversModule (copy), MemStorageSubscriberLifecycleAdapterModule (copy), LocalPlayerManagerModule (copy), ViewportManagerModule (copy), FrameRateManagerModule (copy), LocaleManagerModule (copy), EventStreamUpdaterModule (copy), Number (copy), LocalStorageListenerModule (copy), MutedErrorReporterModule (copy), LuaAppBacktraceReporterAdaptorModule (copy), SessionManagerModule (copy), UserHeartbeatsManagerModule (copy), SiteAlertManagerModule (copy), GetHasBackgroundMusicModule (copy), BackgroundSoundManagerModule (copy), AppUpdateManagerModule (copy), UserAgreementsManager (copy), AppReadyHandler (copy), FFlagSignalsNavP2NavigationPrimitives (copy), RnBypassAdapter (copy), ApplyRoactNavigationHistoryModule (copy), AppChatToastManagerUAModule (copy), AppConfigurerModule (copy), StartupMessageContainer (copy), BugReporterEventReceiver (copy), SocialGraphSyncManager (copy), MouseCursorHandlerModule (copy), PostAppInteractiveLoaderModule (copy), Default (copy), ProviderContainer (copy), SelectionCursorProvider (copy), CursorProvider (copy)
	local AppName = p2.props.appName
	local List = {}
	table.insert(List, {
		class = ReactProfilerContext.Provider,
		props = { value = p2._profilerContext }
	})
	table.insert(List, { class = ReactProfiler, props = { id = "UniversalApp" } })
	
	if SharedFlagsModule.FFlagUseSignalsNavigation then
		table.insert(List, {
			class = NavigationModule.SignalsNavigationContainer,
			props = { navigation = AppNavigationModule }
		})
	else
		table.insert(List, {
			class = p2._appContainer,
			props = {
				onNavigationStateChange = MakeNavigationStateLoggerModule("UniversalApp")
			}
		})
	end
	table.insert(List, {
		class = RoactAppExperimentModule.Provider,
		props = {
			value = if config.GetFFlagInjectAnalyticsService() then p2.props.ixpService else IXPService
		}
	})
	table.insert(List, {
		class = RoactRoduxModule.StoreProvider,
		props = { store = p2._store }
	})
	table.insert(List, {
		class = RoactAppPolicy.Provider,
		props = {
			policy = {
				AppFeaturePolicies,
				ChatPolicies,
				AvatarPolicies,
				SharePolicies,
				if config.FFlagShareTargetGameCleanup then nil else ShareTargetGamePolicies
			},
			policyData = if config.GetFFlagInjectAnalyticsService() then p2.props.policyData else nil
		}
	})
	p2:appendRoactServiceProviders(List)
	table.insert(List, {
		class = AppUiModeStyleProviderModule,
		props = { style = { themeName = "dark", fontName = "gotham" } }
	})
	
	if config.FFlagLuaAppDesignFoundationsBridge then
		table.insert(List, { class = DesignFoundationsBridgeModule })
	end
	table.insert(List, {
		class = DesignTokenProvider,
		props = { tokenMappers = TokenMappersModule }
	})
	table.insert(List, { class = AppGridProviderModule })
	table.insert(List, {
		class = ThemeProviderModule,
		props = { themeName = "dark", theme = DeprecatedDarkThemeModule }
	})
	table.insert(List, {
		class = LocalizationProviderModule,
		props = { localization = p2._localization }
	})
	table.insert(List, {
		class = ReactFocusNavigationModule.FocusNavigationContext.Provider,
		props = { value = p2._focusNavigationService }
	})
	table.insert(List, { class = Provider })
	table.insert(List, { class = config1.AvatarSceneInteractionProvider })
	table.insert(List, { class = config1.BodyDataProvider })
	table.insert(List, { class = config1.AdjustmentDataProvider })
	table.insert(List, { class = config1.AppliedDescriptionProvider })
	table.insert(List, { class = config1.AvatarSaveContextProvider })
	table.insert(List, { class = TopBarSearchSignalContextModule.Provider })
	table.insert(List, {
		class = PageObjectManagerContextModule.Provider,
		props = { pageObjectManager = p2._pageObjectManager }
	})
	table.insert(List, {
		class = ApolloProvider,
		props = { client = ApolloClientModule }
	})
	table.insert(List, { class = AppInteractionFeedbackProvider })
	table.insert(List, { class = FeedbackManagerInjectionContextProvider })
	table.insert(List, { class = ResponsiveModule.ResponsiveProvider })
	
	if config.GetFFlagIsSquadEnabled() then
		table.insert(List, {
			class = SquadExternalContractProvider,
			props = {
				contract = AppSquadContractModule,
				squadLocation = SquadLocationEnum.UniversalApp
			}
		})
	end
	if config.FFlagLuaAppSupportFoundationOverlayInVR then
		table.insert(List, { class = VRFoundationOverlayProviderModule })
	end
	local List1 = {}
	table.insert(List1, NativeShellEventReceiverModule)
	table.insert(List1, ExperienceMenuIXPPreloadModule)
	
	if config.GetFFlagEnableWidgetLUAIXP() or config.FFlagEnableLockScreenWidgetLuaIXP then
		table.insert(List1, WidgetStoreIXPModule)
	end
	if config.GetFFlagEnableAndroidWidgetsLuaIXP() then
		table.insert(List1, AndroidWidgetStoreIXPModule)
	end
	if config.GetFFlagEnableIOSUIRefactorLuaIXP() then
		table.insert(List1, IOSUIRefactorIXPModule)
	end
	if config.GetFFlagEnableIosAuthServiceLuaIXP() then
		table.insert(List1, IosAuthServiceIxpStoreModule)
	end
	return RoactModule.createElement(ProviderContainer, { providers = List }, {
		CursorProvider = RoactModule.createElement(SelectionCursorProvider, {}, {
			NewCursorProvider = RoactModule.createElement(CursorProvider, {}, {
				EventReceivers = RoactModule.createElement(UniversalAppEventReceiversModule),
				MemStorageSubscribers = next(List1) and RoactModule.createElement(MemStorageSubscriberLifecycleAdapterModule, { receiverComponents = List1 }) or nil,
				LocalPlayerManager = RoactModule.createElement(LocalPlayerManagerModule),
				ViewportManager = RoactModule.createElement(ViewportManagerModule),
				FrameRateManager = RoactModule.createElement(FrameRateManagerModule),
				LocaleManager = RoactModule.createElement(LocaleManagerModule, { localization = p2._localization }),
				EventStreamUpdater = RoactModule.createElement(EventStreamUpdaterModule, { releasePeriod = Number }),
				LocalStorageListener = RoactModule.createElement(LocalStorageListenerModule),
				MutedErrorReporter = RoactModule.createElement(MutedErrorReporterModule, { appName = AppName }),
				BacktraceReporterAdaptor = RoactModule.createElement(LuaAppBacktraceReporterAdaptorModule),
				SessionManager = RoactModule.createElement(SessionManagerModule, { connectRouteSignal = p2._connectRouteSignal }),
				UserHeartbeatsManager = RoactModule.createElement(UserHeartbeatsManagerModule),
				SiteAlertManager = RoactModule.createElement(SiteAlertManagerModule),
				AppBackgroundSoundManager = if GetHasBackgroundMusicModule() then RoactModule.createElement(BackgroundSoundManagerModule) else nil,
				AppUpdateManager = RoactModule.createElement(AppUpdateManagerModule),
				UserAgreementsManager = RoactModule.createElement(UserAgreementsManager),
				AppReadyHandler = RoactModule.createElement(AppReadyHandler),
				RnBypassAdapter = if FFlagSignalsNavP2NavigationPrimitives then nil else RoactModule.createElement(RnBypassAdapter, {
					rnBypassActionSignal = p2._rnBypassActionSignal,
					ApplyRoactNavigationHistory = ApplyRoactNavigationHistoryModule,
					updateRoute = p2._updateRoute
				}),
				AppChatToastManagerUA = RoactModule.createElement(AppChatToastManagerUAModule),
				AppConfigurer = RoactModule.createElement(AppConfigurerModule, { store = p2._store }),
				StartupMessageContainer = RoactModule.createElement(StartupMessageContainer),
				BugReporterEventReceiver = if config.GetFFlagEnableInAppBugReporting() then RoactModule.createElement(BugReporterEventReceiver) else nil,
				SocialGraphSyncManager = RoactModule.createElement(SocialGraphSyncManager),
				MouseCursorHandler = RoactModule.createElement(MouseCursorHandlerModule),
				PostAppInteractiveLoader = RoactModule.createElement(PostAppInteractiveLoaderModule),
				PopLatencyOverlay = if SharedFlagsModule.FFlagEnablePopLatencyOverlay then RoactModule.createElement(Default) else nil
			})
		})
	})
end

function UniversalApp:willUnmount()
	-- upvalues: config (copy), HttpStoreModule (ref)
	if config.FFlagLuaAppUseAppHttpStore then
		HttpStoreModule.Instance._dispose()
	end
end

return UniversalApp