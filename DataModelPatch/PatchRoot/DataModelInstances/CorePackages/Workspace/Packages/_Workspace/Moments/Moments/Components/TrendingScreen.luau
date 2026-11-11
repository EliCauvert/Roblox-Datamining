local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local RobloxAppEventsModule = require(Parent.RobloxAppEvents)
local View = FoundationModule.View
local TopBarModule = require(Moments.Components.TopBar)
local FeedModule = require(Moments.Components.Feed)
local CreationFlowScreen = require(Parent.MomentsCreation).CreationFlowScreen
local FTUXEducationScreenModule = require(Moments.Components.FTUXEducationScreen)
local UseMomentsHostFunction = require(Moments.MomentsHostContext).useMomentsHost
local ConstantsModule = require(Moments.Constants)
local UseScreenBottomInsetModule = require(Moments.Hooks.useScreenBottomInset)
local UseFeedPlaybackActiveModule = require(Moments.Hooks.useFeedPlaybackActive)
local UseChromeRatioModule = require(Moments.Hooks.useChromeRatio)
local UseCreationEntryModule = require(Moments.Hooks.useCreationEntry)
local UseUploadHostModule = require(Moments.Hooks.useUploadHost)
local LogCreateIntentModule = require(Moments.Analytics.logCreateIntent)
local GetUploadStoreModule = require(Moments.Stores.GetUploadStore)
local SignalsReactModule = require(Parent.SignalsReact)
local MomentOverlayInsetContextModule = require(Moments.Components.Feed.Items.Moment.MomentOverlayInsetContext)
local GetFFlagMomentsImmersiveChromeModule = require(Moments.Flags.GetFFlagMomentsImmersiveChrome)
local GetFFlagMomentsImmersiveResizeViewportModule = require(Moments.Flags.GetFFlagMomentsImmersiveResizeViewport)
local GetFFlagMomentsRefreshFromTopAfterUploadModule = require(Moments.Flags.GetFFlagMomentsRefreshFromTopAfterUpload)
local GetFFlagMomentsFixBackgroundFeedInputModule = require(Moments.Flags.GetFFlagMomentsFixBackgroundFeedInput)
local GetImmersiveChromeStoreModule = require(Moments.Stores.GetImmersiveChromeStore)
local MomentsLocalStorageModule = require(Moments.Storage.MomentsLocalStorage)
local MomentsLocalStorageKeysModule = require(Moments.Storage.MomentsLocalStorageKeys)
local UseMomentsSessionFunction = require(Moments.Stores.GetMomentsStore.MomentsSessionContext).useMomentsSession
local CreateMomentsFeedSourceModule = require(Moments.Stores.GetMomentsStore.createMomentsFeedSource)
local CreateSignalTrackerFunction = require(Moments.SignalTracker).createSignalTracker
local FFlagEnableArgus = require(Parent.SharedFlags).FFlagEnableArgus
local IsStudioModule = require(Parent.MomentsCommon.isStudio)
local GetFFlagArgusStudioMockFeedModule = require(Moments.Flags.GetFFlagArgusStudioMockFeed)
local CreateMockFeedSourceFunction = FeedModule.createMockFeedSource
local SignalTracker = if FFlagEnableArgus then CreateSignalTrackerFunction() else nil
local Feed = FeedModule.Feed
local CreateRecommendationTelemetryFunction = FeedModule.createRecommendationTelemetry
local Analytics = require(Parent.MomentsCommon).Analytics
local EventNames = Analytics.EventNames
local SessionManager = Analytics.SessionManager
local FunnelEventNames = Analytics.FunnelEventNames
local FireAnalyticsEventFunction = Analytics.fireAnalyticsEvent
local FireFunnelAnalyticsEventFunction = Analytics.fireFunnelAnalyticsEvent

local function ResizeFeedContainer(p1)
	-- upvalues: UseChromeRatioModule (copy), ReactModule (copy), ConstantsModule (copy), Feed (copy)
	local BottomInset = p1.bottomInset
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UseChromeRatioModule():map(function(p2): UDim2
			-- upvalues: BottomInset (copy)
			return UDim2.new(1, 0, 1, -math.round(BottomInset * p2))
		end),
		ZIndex = ConstantsModule.DisplayOrder.Feed
	}, {
		Feed = ReactModule.createElement(Feed, {
			trackSurfaceLoad = true,
			source = p1.source,
			active = p1.active,
			playbackActive = p1.playbackActive,
			telemetry = p1.telemetry,
			controllerRef = p1.controllerRef
		})
	})
end

local function ImmersiveNavBarBackfill(p1)
	-- upvalues: UseChromeRatioModule (copy), ReactModule (copy), View (copy), ConstantsModule (copy)
	local UseChromeRatioModuleResult = UseChromeRatioModule()
	local BottomInset = p1.bottomInset
	
	return if p1.resizeViewport then ReactModule.createElement(View, {
		tag = "position-bottom-center anchor-bottom-center bg-surface-0",
		Size = UseChromeRatioModuleResult:map(function(p2): UDim2
			-- upvalues: BottomInset (copy)
			return UDim2.new(1, 0, 0, (math.round(BottomInset * p2)))
		end),
		ZIndex = ConstantsModule.DisplayOrder.FeedTopBar
	}) else ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AnchorPoint = Vector2.new(0.5, 1),
		Size = UDim2.new(1, 0, 0, BottomInset),
		Position = UseChromeRatioModuleResult:map(function(p2: number): UDim2
			-- upvalues: BottomInset (copy)
			return UDim2.new(0.5, 0, 1, (math.round((1 - p2) * BottomInset)))
		end),
		ZIndex = ConstantsModule.DisplayOrder.FeedTopBar
	}, {
		Fill = ReactModule.createElement(View, { tag = "size-full bg-surface-0" })
	})
end

return function(_)
	-- upvalues: ReactModule (copy), MomentsLocalStorageModule (copy), MomentsLocalStorageKeysModule (copy), UseScreenBottomInsetModule (copy), UseFeedPlaybackActiveModule (copy), UseMomentsSessionFunction (copy), UseMomentsHostFunction (copy), UseCreationEntryModule (copy), UseUploadHostModule (copy), SessionManager (copy), FunnelEventNames (copy), FireFunnelAnalyticsEventFunction (copy), IsStudioModule (copy), GetFFlagArgusStudioMockFeedModule (copy), CreateMockFeedSourceFunction (copy), CreateMomentsFeedSourceModule (copy), SignalTracker (copy), FFlagEnableArgus (copy), CreateRecommendationTelemetryFunction (copy), GetFFlagMomentsImmersiveChromeModule (copy), GetFFlagMomentsImmersiveResizeViewportModule (copy), SignalsReactModule (copy), GetImmersiveChromeStoreModule (copy), GetFFlagMomentsFixBackgroundFeedInputModule (copy), RobloxAppEventsModule (copy), AppPage (copy), GetUploadStoreModule (copy), GetFFlagMomentsRefreshFromTopAfterUploadModule (copy), Feed (copy), MomentOverlayInsetContextModule (copy), ResizeFeedContainer (copy), View (copy), ConstantsModule (copy), ImmersiveNavBarBackfill (copy), FoundationModule (copy), TopBarModule (copy), LogCreateIntentModule (copy), FireAnalyticsEventFunction (copy), EventNames (copy), CreationFlowScreen (copy), FTUXEducationScreenModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(function(): boolean
		-- upvalues: MomentsLocalStorageModule (upval), MomentsLocalStorageKeysModule (upval)
		return not MomentsLocalStorageModule.getField(MomentsLocalStorageKeysModule.CreateTooltipSeen)
	end)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseScreenBottomInsetModuleResult: number = UseScreenBottomInsetModule()
	local UseFeedPlaybackActiveModuleResult = UseFeedPlaybackActiveModule()
	local UseMomentsSessionResult = UseMomentsSessionFunction()
	local OpenOwnMomentsFunction = UseMomentsHostFunction().openOwnMoments
	local UseCreationEntryModuleResult = UseCreationEntryModule()
	local UseUploadHostModuleResult = UseUploadHostModule({
		onExit = UseCreationEntryModuleResult.onExitCreation,
		captureSource = UseCreationEntryModuleResult.captureSource
	})
	ReactModule.useEffect(function()
		-- upvalues: SessionManager (upval), FunnelEventNames (upval), FireFunnelAnalyticsEventFunction (upval)
		FireFunnelAnalyticsEventFunction(FunnelEventNames.FunnelTypes.AppNavigation, FunnelEventNames.AppNavigationSteps.TrendingScreenView, SessionManager.getSessionId(FunnelEventNames.FunnelTypes.AppNavigation) or SessionManager.startSession(FunnelEventNames.FunnelTypes.AppNavigation))
	end, {})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: IsStudioModule (upval), GetFFlagArgusStudioMockFeedModule (upval), CreateMockFeedSourceFunction (upval), CreateMomentsFeedSourceModule (upval), UseMomentsSessionResult (copy), SignalTracker (upval)
		return if IsStudioModule() and GetFFlagArgusStudioMockFeedModule() then CreateMockFeedSourceFunction() else CreateMomentsFeedSourceModule(UseMomentsSessionResult.getMomentsSessionId, { signalTracker = SignalTracker })
	end, { UseMomentsSessionResult })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: FFlagEnableArgus (upval), CreateRecommendationTelemetryFunction (upval), UseMomentsSessionResult (copy), SignalTracker (upval)
		return if FFlagEnableArgus then CreateRecommendationTelemetryFunction({
			getMomentsSessionId = UseMomentsSessionResult.getMomentsSessionId,
			signalTracker = SignalTracker
		}) else nil
	end, { UseMomentsSessionResult })
	local FFlagMomentsImmersiveChromeModule = GetFFlagMomentsImmersiveChromeModule()
	local FFlagMomentsImmersiveResizeViewportModule = FFlagMomentsImmersiveChromeModule and GetFFlagMomentsImmersiveResizeViewportModule()
	local NoFFlagMomentsImmersiveResizeViewportModule: boolean = FFlagMomentsImmersiveChromeModule and not FFlagMomentsImmersiveResizeViewportModule
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetImmersiveChromeStoreModule(false).getOverlayCovering)
	local UseSignalStateResult1 = GetFFlagMomentsFixBackgroundFeedInputModule() and UseSignalStateResult
	local NoUseSignalStateResult1: boolean = not UseCreationEntryModuleResult.isCreating and not UseSignalStateResult1
	local NoIsCreating: boolean = UseFeedPlaybackActiveModuleResult and not UseCreationEntryModuleResult.isCreating
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy)
		local Current = UseRefResult.current
		
		if Current ~= nil then
			Current.refresh()
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: RobloxAppEventsModule (upval), AppPage (upval), UseResult (copy)
		local ReloadPageConnection = RobloxAppEventsModule.ReloadPage:connect(function(Moments)
			-- upvalues: AppPage (upval), UseResult (upval)
			if Moments == AppPage.Moments then
				UseResult()
			end
		end)
		
		return function()
			-- upvalues: ReloadPageConnection (copy)
			ReloadPageConnection:disconnect()
		end
	end, { UseResult })
	local UploadStoreModule = GetUploadStoreModule(false)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(UploadStoreModule.getState)
	local UseSignalStateResult21 = SignalsReactModule.useSignalState(UploadStoreModule.getUploadedMoment)
	ReactModule.useEffect(function()
		-- upvalues: GetFFlagMomentsRefreshFromTopAfterUploadModule (upval), UseSignalStateResult2 (copy), UseRefResult1 (copy), UseRefResult (copy), UseSignalStateResult21 (copy), UseResult (copy)
		if GetFFlagMomentsRefreshFromTopAfterUploadModule() then
			if UseSignalStateResult2 ~= "Success" then
				UseRefResult1.current = UseSignalStateResult2
				
				return
			end
			if UseRefResult1.current ~= "Success" then
				UseRefResult1.current = UseSignalStateResult2
				local Current = UseRefResult.current
				
				if type(UseSignalStateResult21) == "table" and UseSignalStateResult21.momentId ~= nil and Current ~= nil then
					Current.prependMoment(UseSignalStateResult21)
					
					return
				end
				UseResult()
			end
			return
		elseif UseSignalStateResult2 == "Success" then
			UseResult()
		end
	end, { UseSignalStateResult2, UseSignalStateResult21, UseResult })
	local Element = ReactModule.createElement(Feed, {
		trackSurfaceLoad = true,
		source = UseMemoResult,
		active = NoUseSignalStateResult1,
		playbackActive = NoIsCreating,
		telemetry = UseMemoResult1,
		controllerRef = UseRefResult
	})
	local Element1 = if NoFFlagMomentsImmersiveResizeViewportModule then ReactModule.createElement(MomentOverlayInsetContextModule.Context.Provider, { value = UseScreenBottomInsetModuleResult }, { Feed = Element }) else Element
	
	return ReactModule.createElement(View, { tag = "size-full bg-surface-0" }, {
		FoundationContainer = ReactModule.createElement(View, { tag = "size-full" }, {
			OnVideoUI = ReactModule.createElement(FoundationModule.FoundationProvider, { theme = FoundationModule.Enums.Theme.Dark }, {
				FeedContainer = if FFlagMomentsImmersiveResizeViewportModule then ReactModule.createElement(ResizeFeedContainer, {
					active = NoUseSignalStateResult1,
					bottomInset = UseScreenBottomInsetModuleResult,
					source = UseMemoResult,
					playbackActive = NoIsCreating,
					telemetry = UseMemoResult1,
					controllerRef = UseRefResult
				}) else ReactModule.createElement(View, {
					tag = "size-full",
					padding = if NoFFlagMomentsImmersiveResizeViewportModule then nil else { bottom = UDim.new(0, UseScreenBottomInsetModuleResult) },
					ZIndex = ConstantsModule.DisplayOrder.Feed
				}, { Feed = Element1 }),
				TopBar = ReactModule.createElement(TopBarModule, {
					isBaseScreen = true,
					showTopScrim = true,
					showFtuxTooltip = UseStateResult and UseFeedPlaybackActiveModuleResult,
					onFtuxTooltipDismissed = function()
						-- upvalues: UseStateResult2 (copy), MomentsLocalStorageModule (upval), MomentsLocalStorageKeysModule (upval)
						UseStateResult2(false)
						MomentsLocalStorageModule.setField(MomentsLocalStorageKeysModule.CreateTooltipSeen, true)
					end,
					onCreatePressed = function()
						-- upvalues: LogCreateIntentModule (upval), FunnelEventNames (upval), UseCreationEntryModuleResult (copy)
						LogCreateIntentModule(FunnelEventNames.CreationIntentSource.TopBar)
						UseCreationEntryModuleResult.onCreatePressed()
					end,
					onNavigateToTrending = function()
						-- upvalues: FireAnalyticsEventFunction (upval), EventNames (upval), UseResult (copy)
						FireAnalyticsEventFunction(EventNames.FeedHomeButtonPressed)
						UseResult()
					end,
					onNavigateToMyMoments = function()
						-- upvalues: FireAnalyticsEventFunction (upval), EventNames (upval), OpenOwnMomentsFunction (copy)
						FireAnalyticsEventFunction(EventNames.MyCreationButtonPressed)
						
						if OpenOwnMomentsFunction ~= nil then
							OpenOwnMomentsFunction()
						end
					end
				})
			})
		}),
		NavBarBackfill = if UseScreenBottomInsetModuleResult > 0 then if FFlagMomentsImmersiveChromeModule then ReactModule.createElement(ImmersiveNavBarBackfill, {
			bottomInset = UseScreenBottomInsetModuleResult,
			resizeViewport = FFlagMomentsImmersiveResizeViewportModule
		}) else ReactModule.createElement(View, {
			tag = "position-bottom-center anchor-bottom-center bg-surface-0",
			Size = UDim2.new(1, 0, 0, UseScreenBottomInsetModuleResult),
			ZIndex = ConstantsModule.DisplayOrder.FeedTopBar
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