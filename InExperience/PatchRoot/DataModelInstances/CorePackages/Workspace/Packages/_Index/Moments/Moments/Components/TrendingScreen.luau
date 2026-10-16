local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local RobloxAppEventsModule = require(Parent.RobloxAppEvents)
local RoactNavigationModule = require(Parent.RoactNavigation)
local View = require(Parent.Foundation).View
local TopBarModule = require(Moments.Components.TopBar)
local MomentsFeedSurfaceModule = require(Moments.Components.MomentsFeedSurface)
local FeedModule = require(Moments.Components.Feed)
local CreationFlowScreen = require(Parent.MomentsCreation).CreationFlowScreen
local FTUXEducationScreenModule = require(Moments.Components.FTUXEducationScreen)
local UseMomentsHostFunction = require(Moments.MomentsHostContext).useMomentsHost
local ConstantsModule = require(Moments.Constants)
local UseScreenBottomInsetModule = require(Moments.Hooks.useScreenBottomInset)
local UseFeedPlaybackActiveModule = require(Moments.Hooks.useFeedPlaybackActive)
local UseMomentsTabIsVisibleModule = require(Moments.Hooks.useMomentsTabIsVisible)
local GetMomentsPreferencesStoreModule = require(Moments.Stores.GetMomentsPreferencesStore)
local NavigationDestinationTypeModule = require(Moments.Enums.NavigationDestinationType)
local FFlagMomentsNavigationEventModule = require(Moments.Flags.FFlagMomentsNavigationEvent)
local FFlagMomentsFixRecommendationImpressionLifecycleModule = require(Moments.Flags.FFlagMomentsFixRecommendationImpressionLifecycle)
local FFlagMomentsFlushDwellBeforeNavigationModule = require(Moments.Flags.FFlagMomentsFlushDwellBeforeNavigation)
local UseCreationEntryModule = require(Moments.Hooks.useCreationEntry)
local UseUploadHostModule = require(Moments.Hooks.useUploadHost)
local LogCreateIntentModule = require(Moments.Analytics.logCreateIntent)
local GetUploadStoreModule = require(Moments.Stores.GetUploadStore)
local SignalsReactModule = require(Parent.SignalsReact)
local MomentOverlayInsetContextModule = require(Moments.Components.Feed.Items.Moment.MomentOverlayInsetContext)
local FFlagMomentsFeedAboveNavBarModule = require(Moments.Flags.FFlagMomentsFeedAboveNavBar)
local GetImmersiveChromeStoreModule = require(Moments.Stores.GetImmersiveChromeStore)
local MomentsLocalStorageModule = require(Parent.MomentsCommon.MomentsLocalStorage)
local MomentsLocalStorageKeysModule = require(Parent.MomentsCommon.MomentsLocalStorageKeys)
local UseMomentsSessionFunction = require(Moments.Stores.GetMomentsStore.MomentsSessionContext).useMomentsSession
local CreateMomentsFeedSourceModule = require(Moments.Stores.GetMomentsStore.createMomentsFeedSource)
local CreateSignalTrackerFunction = require(Moments.SignalTracker).createSignalTracker
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagEnableArgus = SharedFlagsModule.FFlagEnableArgus
local FFlagMomentsCreationFeatureGate = SharedFlagsModule.FFlagMomentsCreationFeatureGate
local IsStudioModule = require(Parent.MomentsCommon.isStudio)
local ReportModalCovering = require(Parent.MomentsCommon).Media.reportModalCovering
local GetFFlagArgusStudioMockFeedModule = require(Moments.Flags.GetFFlagArgusStudioMockFeed)
local CreateMockFeedSourceFunction = FeedModule.createMockFeedSource
local SignalTracker = if FFlagEnableArgus then CreateSignalTrackerFunction() else nil
local MomentUnavailableDialogModule = require(Moments.Components.MomentUnavailableDialog)
local CreateRecommendationTelemetryFunction = FeedModule.createRecommendationTelemetry
local MomentsCommonModule = require(Parent.MomentsCommon)
local Analytics = MomentsCommonModule.Analytics
local EventNames = Analytics.EventNames
local SessionManager = Analytics.SessionManager
local FunnelEventNames = Analytics.FunnelEventNames
local FireAnalyticsEventFunction = Analytics.fireAnalyticsEvent
local FireFunnelAnalyticsEventFunction = Analytics.fireFunnelAnalyticsEvent
local UseMomentsGatingFunction = MomentsCommonModule.Hooks.useMomentsGating
local MomentsUpload = nil

local function _() --[[ Line: 88 | Named "getUploadLogger" ]]
	-- upvalues: MomentsUpload (ref), Parent (copy)
	if MomentsUpload == nil then
		MomentsUpload = require(Parent.Loggers).Logger:new("Moments.Upload")
	end
	return MomentsUpload
end

return function(p1) --[[ Line: 106 | Named "TrendingScreen" ]]
	-- upvalues: ReactModule (copy), MomentsLocalStorageModule (copy), MomentsLocalStorageKeysModule (copy), UseScreenBottomInsetModule (copy), UseFeedPlaybackActiveModule (copy), FFlagMomentsNavigationEventModule (copy), UseMomentsTabIsVisibleModule (copy), SignalsReactModule (copy), GetMomentsPreferencesStoreModule (copy), UseMomentsSessionFunction (copy), UseMomentsHostFunction (copy), UseMomentsGatingFunction (copy), FFlagMomentsCreationFeatureGate (copy), UseCreationEntryModule (copy), UseUploadHostModule (copy), SessionManager (copy), FunnelEventNames (copy), FireFunnelAnalyticsEventFunction (copy), IsStudioModule (copy), GetFFlagArgusStudioMockFeedModule (copy), CreateMockFeedSourceFunction (copy), CreateMomentsFeedSourceModule (copy), SignalTracker (copy), FFlagEnableArgus (copy), CreateRecommendationTelemetryFunction (copy), GetImmersiveChromeStoreModule (copy), ReportModalCovering (copy), FFlagMomentsFixRecommendationImpressionLifecycleModule (copy), NavigationDestinationTypeModule (copy), FFlagMomentsFlushDwellBeforeNavigationModule (copy), RoactNavigationModule (copy), RobloxAppEventsModule (copy), AppPage (copy), GetUploadStoreModule (copy), MomentsUpload (ref), Parent (copy), LogCreateIntentModule (copy), FireAnalyticsEventFunction (copy), EventNames (copy), TopBarModule (copy), MomentOverlayInsetContextModule (copy), FFlagMomentsFeedAboveNavBarModule (copy), View (copy), ConstantsModule (copy), MomentsFeedSurfaceModule (copy), MomentUnavailableDialogModule (copy), CreationFlowScreen (copy), FTUXEducationScreenModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(function(): boolean --[[ Line: 107 ]]
		-- upvalues: MomentsLocalStorageModule (upval), MomentsLocalStorageKeysModule (upval)
		return not MomentsLocalStorageModule.getField(MomentsLocalStorageKeysModule.CreateTooltipSeen)
	end)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseScreenBottomInsetModuleResult = UseScreenBottomInsetModule()
	local UseFeedPlaybackActiveModuleResult = UseFeedPlaybackActiveModule()
	local v1 = true
	local UseSignalStateResult = false
	
	if FFlagMomentsNavigationEventModule then
		v1 = UseMomentsTabIsVisibleModule()
		UseSignalStateResult = SignalsReactModule.useSignalState(GetMomentsPreferencesStoreModule(false).getIsTeleporting)
	end
	local UseMomentsSessionResult = UseMomentsSessionFunction()
	local OpenOwnMomentsFunction = UseMomentsHostFunction().openOwnMoments
	local UseMomentsGatingResult = UseMomentsGatingFunction()
	local PlatformIntegrationEnabled = UseMomentsGatingResult.isFlyoutEntryEnabled and UseMomentsGatingResult.platformIntegrationEnabled
	local IsCreationEnabled = if FFlagMomentsCreationFeatureGate then UseMomentsGatingResult ~= nil and UseMomentsGatingResult.isCreationEnabled else nil
	local UseCreationEntryModuleResult = UseCreationEntryModule()
	local UseUploadHostModuleResult = UseUploadHostModule({
		onExit = UseCreationEntryModuleResult.onExitCreation,
		captureSource = UseCreationEntryModuleResult.captureSource
	})
	ReactModule.useEffect(function() --[[ Line: 150 ]]
		-- upvalues: SessionManager (upval), FunnelEventNames (upval), FireFunnelAnalyticsEventFunction (upval)
		FireFunnelAnalyticsEventFunction(FunnelEventNames.FunnelTypes.AppNavigation, FunnelEventNames.AppNavigationSteps.TrendingScreenView, SessionManager.getSessionId(FunnelEventNames.FunnelTypes.AppNavigation) or SessionManager.startSession(FunnelEventNames.FunnelTypes.AppNavigation))
	end, {})
	local UseResult = ReactModule.useCallback(function() --[[ Line: 160 ]]
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(true)
	end, {})
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 164 ]]
		-- upvalues: IsStudioModule (upval), GetFFlagArgusStudioMockFeedModule (upval), CreateMockFeedSourceFunction (upval), CreateMomentsFeedSourceModule (upval), UseMomentsSessionResult (copy), SignalTracker (upval), UseResult (copy)
		return if IsStudioModule() and GetFFlagArgusStudioMockFeedModule() then CreateMockFeedSourceFunction() else CreateMomentsFeedSourceModule(UseMomentsSessionResult.getMomentsSessionId, {
			signalTracker = SignalTracker,
			onDeepLinkedMomentUnavailable = UseResult
		})
	end, { UseMomentsSessionResult, UseResult })
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 174 ]]
		-- upvalues: FFlagEnableArgus (upval), CreateRecommendationTelemetryFunction (upval), UseMomentsSessionResult (copy), SignalTracker (upval)
		return if FFlagEnableArgus then CreateRecommendationTelemetryFunction({
			getMomentsSessionId = UseMomentsSessionResult.getMomentsSessionId,
			signalTracker = SignalTracker
		}) else nil
	end, { UseMomentsSessionResult })
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(GetImmersiveChromeStoreModule(false).getOverlayCovering)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(ReportModalCovering.getCovering)
	local NoUseSignalStateResult2 = not UseCreationEntryModuleResult.isCreating and (not UseSignalStateResult1 and (not UseStateResult1 and not UseSignalStateResult2))
	
	if FFlagMomentsFixRecommendationImpressionLifecycleModule then
		NoUseSignalStateResult2 = NoUseSignalStateResult2 and UseFeedPlaybackActiveModuleResult
	end
	local NoUseSignalStateResult2_1: boolean = UseFeedPlaybackActiveModuleResult and (not UseCreationEntryModuleResult.isCreating and (not UseStateResult1 and not UseSignalStateResult2))
	local ExperienceJoin = if FFlagMomentsNavigationEventModule then if UseSignalStateResult then NavigationDestinationTypeModule.ExperienceJoin elseif UseCreationEntryModuleResult.isCreating then NavigationDestinationTypeModule.Create elseif UseSignalStateResult2 then NavigationDestinationTypeModule.Report elseif v1 then nil else NavigationDestinationTypeModule.Exit else nil
	local UseResult1 = ReactModule.useCallback(function(p2) --[[ Line: 226 ]]
		-- upvalues: UseRefResult (copy)
		local Current = UseRefResult.current
		
		if Current ~= nil then
			Current.refresh(p2)
		end
	end, {})
	local UseResult2 = ReactModule.useCallback(function(p2) --[[ Line: 233 ]]
		-- upvalues: UseRefResult (copy)
		local Current = UseRefResult.current
		
		if Current ~= nil then
			Current.flushView(p2)
		end
	end, {})
	ReactModule.useEffect(function() --[[ Line: 240 ]]
		-- upvalues: FFlagMomentsFlushDwellBeforeNavigationModule (upval), p1 (copy), RoactNavigationModule (upval), UseResult2 (copy)
		if FFlagMomentsFlushDwellBeforeNavigationModule and p1.navigation.addListener ~= nil then
			local AddListenerResult = p1.navigation.addListener(RoactNavigationModule.Events.WillBlur, function() --[[ Line: 245 ]]
				-- upvalues: UseResult2 (upval)
				UseResult2()
			end)
			
			return function() --[[ Line: 248 ]]
				-- upvalues: AddListenerResult (copy)
				AddListenerResult.remove()
			end
		else
			return nil
		end
	end, { p1.navigation, UseResult2 })
	ReactModule.useEffect(function() --[[ Line: 253 ]]
		-- upvalues: RobloxAppEventsModule (upval), AppPage (upval), UseResult1 (copy)
		local ReloadPageConnection = RobloxAppEventsModule.ReloadPage:connect(function(Moments) --[[ Line: 254 ]]
			-- upvalues: AppPage (upval), UseResult1 (upval)
			if Moments == AppPage.Moments then
				UseResult1()
			end
		end)
		
		return function() --[[ Line: 260 ]]
			-- upvalues: ReloadPageConnection (copy)
			ReloadPageConnection:disconnect()
		end
	end, { UseResult1 })
	local UploadStoreModule = GetUploadStoreModule(false)
	local UseSignalStateResult3 = SignalsReactModule.useSignalState(UploadStoreModule.getState)
	local UseSignalStateResult31 = SignalsReactModule.useSignalState(UploadStoreModule.getUploadedMoment)
	ReactModule.useEffect(function() --[[ Line: 269 ]]
		-- upvalues: UseSignalStateResult3 (copy), UseRefResult1 (copy), UseRefResult (copy), UseSignalStateResult31 (copy), MomentsUpload (upval), Parent (upval), UseResult1 (copy)
		if UseSignalStateResult3 ~= "Success" then
			UseRefResult1.current = UseSignalStateResult3
			
			return
		end
		if UseRefResult1.current ~= "Success" then
			UseRefResult1.current = UseSignalStateResult3
			local Current = UseRefResult.current
			
			if type(UseSignalStateResult31) == "table" and UseSignalStateResult31.momentId ~= nil and Current ~= nil then
				if MomentsUpload == nil then
					MomentsUpload = require(Parent.Loggers).Logger:new("Moments.Upload")
				end
				MomentsUpload:debug("event=feed_prepend_uploaded momentId={} assetId={}", UseSignalStateResult31.momentId, (tostring(UseSignalStateResult31.assetId)))
				Current.prependMoment(UseSignalStateResult31)
				
				return
			else
				if MomentsUpload == nil then
					MomentsUpload = require(Parent.Loggers).Logger:new("Moments.Upload")
				end
				MomentsUpload:debug("event=feed_refresh_after_upload uploadedMoment={} hasController={}", tostring(UseSignalStateResult31), (tostring(Current ~= nil)))
				UseResult1()
			end
		end
	end, {
		UseSignalStateResult3,
		UseSignalStateResult31,
		UseResult1
	})
	local UseResult3 = ReactModule.useCallback(function() --[[ Line: 295 ]]
		-- upvalues: UseStateResult2 (copy), MomentsLocalStorageModule (upval), MomentsLocalStorageKeysModule (upval)
		UseStateResult2(false)
		MomentsLocalStorageModule.setField(MomentsLocalStorageKeysModule.CreateTooltipSeen, true)
	end, {})
	local UseResult4 = ReactModule.useCallback(function() --[[ Line: 300 ]]
		-- upvalues: LogCreateIntentModule (upval), FunnelEventNames (upval), UseCreationEntryModuleResult (copy)
		LogCreateIntentModule(FunnelEventNames.CreationIntentSource.TopBar)
		UseCreationEntryModuleResult.onCreatePressed()
	end, { UseCreationEntryModuleResult.onCreatePressed })
	local UseResult5 = ReactModule.useCallback(function() --[[ Line: 308 ]]
		-- upvalues: FireAnalyticsEventFunction (upval), EventNames (upval), UseResult1 (copy), FFlagMomentsNavigationEventModule (upval), NavigationDestinationTypeModule (upval)
		FireAnalyticsEventFunction(EventNames.FeedHomeButtonPressed)
		UseResult1(if FFlagMomentsNavigationEventModule then NavigationDestinationTypeModule.Trending else nil)
	end, { UseResult1 })
	local UseResult6 = ReactModule.useCallback(function() --[[ Line: 313 ]]
		-- upvalues: FireAnalyticsEventFunction (upval), EventNames (upval), OpenOwnMomentsFunction (copy), FFlagMomentsFlushDwellBeforeNavigationModule (upval), UseResult2 (copy), FFlagMomentsNavigationEventModule (upval), NavigationDestinationTypeModule (upval)
		FireAnalyticsEventFunction(EventNames.MyCreationButtonPressed)
		
		if OpenOwnMomentsFunction ~= nil then
			if FFlagMomentsFlushDwellBeforeNavigationModule then
				UseResult2(if FFlagMomentsNavigationEventModule then NavigationDestinationTypeModule.MyMoments else nil)
			end
			OpenOwnMomentsFunction()
		end
	end, { OpenOwnMomentsFunction, UseResult2 })
	
	return ReactModule.createElement(View, { tag = "size-full bg-surface-0" }, {
		Surface = ReactModule.createElement(MomentsFeedSurfaceModule, {
			trackSurfaceLoad = true,
			source = UseMemoResult,
			active = NoUseSignalStateResult2,
			playbackActive = NoUseSignalStateResult2_1,
			telemetry = UseMemoResult1,
			inactiveDestination = ExperienceJoin,
			controllerRef = UseRefResult,
			header = ReactModule.useMemo(function() --[[ Line: 324 ]]
				-- upvalues: ReactModule (upval), TopBarModule (upval), UseStateResult (copy), UseFeedPlaybackActiveModuleResult (copy), FFlagMomentsCreationFeatureGate (upval), IsCreationEnabled (copy), PlatformIntegrationEnabled (copy), UseResult3 (copy), UseResult4 (copy), UseResult5 (copy), UseResult6 (copy)
				return ReactModule.createElement(TopBarModule, {
					isBaseScreen = true,
					showTopScrim = true,
					showFtuxTooltip = UseStateResult and (UseFeedPlaybackActiveModuleResult and (not FFlagMomentsCreationFeatureGate or IsCreationEnabled)),
					showHamburger = PlatformIntegrationEnabled,
					onFtuxTooltipDismissed = UseResult3,
					onCreatePressed = if FFlagMomentsCreationFeatureGate and not IsCreationEnabled then nil else UseResult4,
					onNavigateToTrending = UseResult5,
					onNavigateToMyMoments = UseResult6
				})
			end, {
				UseStateResult, UseFeedPlaybackActiveModuleResult,
				if FFlagMomentsCreationFeatureGate then IsCreationEnabled else false,
				PlatformIntegrationEnabled, UseResult3, UseResult4, UseResult5, UseResult6
			}),
			renderFeedContainer = ReactModule.useCallback(function(Feed) --[[ Line: 356 ]]
				-- upvalues: ReactModule (upval), MomentOverlayInsetContextModule (upval), UseScreenBottomInsetModuleResult (copy), FFlagMomentsFeedAboveNavBarModule (upval), View (upval), ConstantsModule (upval)
				return ReactModule.createElement(View, {
					tag = "size-full",
					testId = "--moments-feed-container-full-bleed",
					padding = if FFlagMomentsFeedAboveNavBarModule then { bottom = UDim.new(0, UseScreenBottomInsetModuleResult) } else nil,
					ZIndex = ConstantsModule.DisplayOrder.Feed
				}, {
					Feed = ReactModule.createElement(MomentOverlayInsetContextModule.Context.Provider, { value = UseScreenBottomInsetModuleResult }, { Feed = Feed })
				})
			end, { UseScreenBottomInsetModuleResult })
		}),
		MomentUnavailableDialog = if UseFeedPlaybackActiveModuleResult and UseStateResult1 then ReactModule.createElement(MomentUnavailableDialogModule, {
			onDismiss = function() --[[ Line: 403 ]]
				-- upvalues: UseStateResult2_1 (copy)
				UseStateResult2_1(false)
			end
		}) else nil,
		CreationFlowOverlay = if UseCreationEntryModuleResult.isCreating then ReactModule.createElement(View, {
			tag = "size-full",
			ZIndex = ConstantsModule.DisplayOrder.Modals
		}, {
			Screen = ReactModule.createElement(CreationFlowScreen, { host = UseUploadHostModuleResult })
		}) else nil,
		FtuxOverlay = if UseCreationEntryModuleResult.showFtux then ReactModule.createElement(View, {
			tag = "size-full",
			ZIndex = ConstantsModule.DisplayOrder.Modals
		}, {
			Screen = ReactModule.createElement(FTUXEducationScreenModule, { onClose = UseCreationEntryModuleResult.onExitFtux })
		}) else nil
	})
end