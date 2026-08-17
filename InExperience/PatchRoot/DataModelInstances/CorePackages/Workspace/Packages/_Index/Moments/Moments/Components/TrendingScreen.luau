local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local appPage = require(parent.RobloxAppEnums).AppPage
local robloxAppEventsModule = require(parent.RobloxAppEvents)
local view = foundationModule.View
local topBarModule = require(moments.Components.TopBar)
local momentsFeedSurfaceModule = require(moments.Components.MomentsFeedSurface)
local feedModule = require(moments.Components.Feed)
local creationFlowScreen = require(parent.MomentsCreation).CreationFlowScreen
local FTUXEducationScreenModule = require(moments.Components.FTUXEducationScreen)
local useMomentsHost = require(moments.MomentsHostContext).useMomentsHost
local constantsModule = require(moments.Constants)
local useScreenBottomInsetModule = require(moments.Hooks.useScreenBottomInset)
local useFeedPlaybackActiveModule = require(moments.Hooks.useFeedPlaybackActive)
local fFlagMomentsFixRecommendationImpressionLifecycleModule = require(moments.Flags.FFlagMomentsFixRecommendationImpressionLifecycle)
local useCreationEntryModule = require(moments.Hooks.useCreationEntry)
local useUploadHostModule = require(moments.Hooks.useUploadHost)
local logCreateIntentModule = require(moments.Analytics.logCreateIntent)
local getUploadStoreModule = require(moments.Stores.GetUploadStore)
local signalsReactModule = require(parent.SignalsReact)
local momentOverlayInsetContextModule = require(moments.Components.Feed.Items.Moment.MomentOverlayInsetContext)
local fFlagMomentsImmersiveChromeModule = require(moments.Flags.FFlagMomentsImmersiveChrome)
local fFlagMomentsUseCompositionLibraryModule = require(moments.Flags.FFlagMomentsUseCompositionLibrary)
local fFlagMomentsUseFoundationHeaderBarModule = require(moments.Flags.FFlagMomentsUseFoundationHeaderBar)
local getFFlagMomentsRefreshFromTopAfterUploadModule = require(moments.Flags.GetFFlagMomentsRefreshFromTopAfterUpload)
local getFFlagMomentsFixBackgroundFeedInputModule = require(moments.Flags.GetFFlagMomentsFixBackgroundFeedInput)
local getFFlagMomentsFixUnavailableDeeplinkModule = require(moments.Flags.GetFFlagMomentsFixUnavailableDeeplink)
local getImmersiveChromeStoreModule = require(moments.Stores.GetImmersiveChromeStore)
local momentsLocalStorageModule = require(moments.Storage.MomentsLocalStorage)
local momentsLocalStorageKeysModule = require(moments.Storage.MomentsLocalStorageKeys)
local useMomentsSession = require(moments.Stores.GetMomentsStore.MomentsSessionContext).useMomentsSession
local createMomentsFeedSourceModule = require(moments.Stores.GetMomentsStore.createMomentsFeedSource)
local createSignalTracker = require(moments.SignalTracker).createSignalTracker
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagEnableArgus = sharedFlagsModule.FFlagEnableArgus
local fFlagEnableReportingFlowForMomentsFeed = sharedFlagsModule.FFlagEnableReportingFlowForMomentsFeed
local isStudioModule = require(parent.MomentsCommon.isStudio)
local reportModalCovering = require(parent.MomentsCommon).Media.reportModalCovering
local getFFlagArgusStudioMockFeedModule = require(moments.Flags.GetFFlagArgusStudioMockFeed)
local createMockFeedSource = feedModule.createMockFeedSource
local var31 = if fFlagEnableArgus then createSignalTracker() else nil
local var32 = getFFlagMomentsFixUnavailableDeeplinkModule()
local var33 = if var32 then require(moments.Components.MomentUnavailableDialog) else nil
local createRecommendationTelemetry = feedModule.createRecommendationTelemetry
local momentsCommonModule = require(parent.MomentsCommon)
local analytics = momentsCommonModule.Analytics
local eventNames = analytics.EventNames
local sessionManager = analytics.SessionManager
local funnelEventNames = analytics.FunnelEventNames
local fireAnalyticsEvent = analytics.fireAnalyticsEvent
local fireFunnelAnalyticsEvent = analytics.fireFunnelAnalyticsEvent
local useMomentsGating = momentsCommonModule.Hooks.useMomentsGating

return function(_) --[[ line: 99 | named "TrendingScreen" ]]
	-- upvalues: reactModule (ref), momentsLocalStorageModule (ref), momentsLocalStorageKeysModule (ref), useScreenBottomInsetModule (ref), useFeedPlaybackActiveModule (ref), useMomentsSession (ref), useMomentsHost (ref), fFlagMomentsUseFoundationHeaderBarModule (ref), useMomentsGating (ref), useCreationEntryModule (ref), useUploadHostModule (ref), sessionManager (ref), funnelEventNames (ref), fireFunnelAnalyticsEvent (ref), var32 (ref), isStudioModule (ref), getFFlagArgusStudioMockFeedModule (ref), createMockFeedSource (ref), createMomentsFeedSourceModule (ref), var31 (ref), fFlagEnableArgus (ref), createRecommendationTelemetry (ref), fFlagMomentsImmersiveChromeModule (ref), signalsReactModule (ref), getImmersiveChromeStoreModule (ref), getFFlagMomentsFixBackgroundFeedInputModule (ref), reportModalCovering (ref), fFlagEnableReportingFlowForMomentsFeed (ref), fFlagMomentsFixRecommendationImpressionLifecycleModule (ref), robloxAppEventsModule (ref), appPage (ref), getUploadStoreModule (ref), getFFlagMomentsRefreshFromTopAfterUploadModule (ref), logCreateIntentModule (ref), fireAnalyticsEvent (ref), eventNames (ref), topBarModule (ref), momentOverlayInsetContextModule (ref), view (ref), constantsModule (ref), fFlagMomentsUseCompositionLibraryModule (ref), momentsFeedSurfaceModule (ref), var33 (ref), creationFlowScreen (ref), FTUXEducationScreenModule (ref)
	local var35, var36 = reactModule.useState(function() --[[ line: 100 ]]
		-- upvalues: momentsLocalStorageModule (copy), momentsLocalStorageKeysModule (copy)
		return not momentsLocalStorageModule.getField(momentsLocalStorageKeysModule.CreateTooltipSeen)
	end)
	local var37, var38 = reactModule.useState(false)
	local var39 = reactModule.useRef(nil)
	local var40 = reactModule.useRef(nil)
	local var41 = useScreenBottomInsetModule()
	local var42 = useFeedPlaybackActiveModule()
	local var43 = useMomentsSession()
	local openOwnMoments = useMomentsHost().openOwnMoments
	local var44 = if fFlagMomentsUseFoundationHeaderBarModule then useMomentsGating() else nil
	local var45 = var44 ~= nil or var44.isFlyoutEntryEnabled and var44.platformIntegrationEnabled
	local var46 = useCreationEntryModule()
	local var47 = useUploadHostModule({
		onExit = var46.onExitCreation,
		captureSource = var46.captureSource
	})
	reactModule.useEffect(function() --[[ line: 137 ]]
		-- upvalues: sessionManager (copy), funnelEventNames (copy), fireFunnelAnalyticsEvent (copy)
		fireFunnelAnalyticsEvent(funnelEventNames.FunnelTypes.AppNavigation, funnelEventNames.AppNavigationSteps.TrendingScreenView, sessionManager.getSessionId(funnelEventNames.FunnelTypes.AppNavigation) or sessionManager.startSession(funnelEventNames.FunnelTypes.AppNavigation))
	end, {})
	local var48 = reactModule.useCallback(function() --[[ line: 147 ]]
		-- upvalues: var32 (copy), var38 (ref)
		if var32 then
			var38(true)
		end
	end, {})
	local var49 = reactModule.useMemo(function() --[[ line: 153 ]]
		-- upvalues: isStudioModule (copy), getFFlagArgusStudioMockFeedModule (copy), createMockFeedSource (copy), createMomentsFeedSourceModule (copy), var43 (ref), var31 (copy), var32 (copy), var48 (ref)
		return if isStudioModule() and getFFlagArgusStudioMockFeedModule() then createMockFeedSource() else createMomentsFeedSourceModule(var43.getMomentsSessionId, {
			signalTracker = var31,
			onDeepLinkedMomentUnavailable = if var32 then var48 else nil
		})
	end, { var43, var48 })
	local var50 = reactModule.useMemo(function() --[[ line: 165 ]]
		-- upvalues: fFlagEnableArgus (copy), createRecommendationTelemetry (copy), var43 (ref), var31 (copy)
		return if fFlagEnableArgus then createRecommendationTelemetry({
			getMomentsSessionId = var43.getMomentsSessionId,
			signalTracker = var31
		}) else nil
	end, { var43 })
	local getOverlayCovering = getFFlagMomentsFixBackgroundFeedInputModule() and signalsReactModule.useSignalState(getImmersiveChromeStoreModule(false).getOverlayCovering)
	local var37_1 = var32 and var37
	local getCovering = fFlagEnableReportingFlowForMomentsFeed and signalsReactModule.useSignalState(reportModalCovering.getCovering)
	local var54 = not var46.isCreating and (not getOverlayCovering and (not var37_1 and not getCovering))
	
	if fFlagMomentsFixRecommendationImpressionLifecycleModule then
		var54 = var54 and var42
	end
	local var55 = var42 and (not var46.isCreating and (not var37_1 and not getCovering))
	local var56 = reactModule.useCallback(function() --[[ line: 208 ]]
		-- upvalues: var39 (ref)
		local current = var39.current
		
		if current ~= nil then
			current.refresh()
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 215 ]]
		-- upvalues: robloxAppEventsModule (copy), appPage (copy), var56 (ref)
		local reloadPageConnection = robloxAppEventsModule.ReloadPage:connect(function(p0) --[[ line: 216 ]]
			-- upvalues: appPage (copy), var56 (copy)
			if p0 == appPage.Moments then
				var56()
			end
		end)
		
		return function() --[[ line: 222 ]]
			-- upvalues: reloadPageConnection (ref)
			reloadPageConnection:disconnect()
		end
	end, { var56 })
	local var57 = getUploadStoreModule(false)
	local var58 = signalsReactModule.useSignalState(var57.getState)
	local var59 = signalsReactModule.useSignalState(var57.getUploadedMoment)
	reactModule.useEffect(function() --[[ line: 231 ]]
		-- upvalues: getFFlagMomentsRefreshFromTopAfterUploadModule (copy), var58 (ref), var40 (ref), var39 (ref), var59 (ref), var56 (ref)
		if getFFlagMomentsRefreshFromTopAfterUploadModule() then
			if var58 ~= "Success" then
				var40.current = var58
				
				return
			elseif var40.current ~= "Success" then
				var40.current = var58
				local current = var39.current
				
				if type(var59) == "table" and var59.momentId ~= nil and current ~= nil then
					current.prependMoment(var59)
					
					return
				end
				var56()
			end
			return
		elseif var58 == "Success" then
			var56()
		end
	end, { var58, var59, var56 })
	local var60 = reactModule.useCallback(function() --[[ line: 254 ]]
		-- upvalues: var36 (ref), momentsLocalStorageModule (copy), momentsLocalStorageKeysModule (copy)
		var36(false)
		momentsLocalStorageModule.setField(momentsLocalStorageKeysModule.CreateTooltipSeen, true)
	end, {})
	local var61 = reactModule.useCallback(function() --[[ line: 259 ]]
		-- upvalues: logCreateIntentModule (copy), funnelEventNames (copy), var46 (ref)
		logCreateIntentModule(funnelEventNames.CreationIntentSource.TopBar)
		var46.onCreatePressed()
	end, { var46.onCreatePressed })
	local var62 = reactModule.useCallback(function() --[[ line: 267 ]]
		-- upvalues: fireAnalyticsEvent (copy), eventNames (copy), var56 (ref)
		fireAnalyticsEvent(eventNames.FeedHomeButtonPressed)
		var56()
	end, { var56 })
	local var63 = reactModule.useCallback(function() --[[ line: 272 ]]
		-- upvalues: fireAnalyticsEvent (copy), eventNames (copy), openOwnMoments (ref)
		fireAnalyticsEvent(eventNames.MyCreationButtonPressed)
		
		if openOwnMoments ~= nil then
			openOwnMoments()
		end
	end, { openOwnMoments })
	
	return reactModule.createElement(view, { tag = "size-full bg-surface-0" }, {
		Surface = reactModule.createElement(momentsFeedSurfaceModule, {
			trackSurfaceLoad = true,
			source = var49,
			active = var54,
			playbackActive = var55,
			telemetry = var50,
			controllerRef = var39,
			header = reactModule.useMemo(function() --[[ line: 280 ]]
				-- upvalues: reactModule (copy), topBarModule (copy), var35 (ref), var42 (ref), var45 (ref), var60 (ref), var61 (ref), var62 (ref), var63 (ref)
				return reactModule.createElement(topBarModule, {
					isBaseScreen = true,
					showTopScrim = true,
					showFtuxTooltip = var35 and var42,
					showHamburger = var45,
					onFtuxTooltipDismissed = var60,
					onCreatePressed = var61,
					onNavigateToTrending = var62,
					onNavigateToMyMoments = var63
				})
			end, {
				var35, var42, var45, var60, var61, var62, var63
			}),
			renderFeedContainer = reactModule.useCallback(function(p1) --[[ line: 307 ]]
				-- upvalues: fFlagMomentsImmersiveChromeModule (ref), reactModule (copy), momentOverlayInsetContextModule (copy), var41 (ref), view (copy), constantsModule (copy)
				return reactModule.createElement(view, {
					tag = "size-full",
					testId = if fFlagMomentsImmersiveChromeModule then "--moments-feed-container-full-bleed" else "--moments-feed-container-inset",
					padding = if fFlagMomentsImmersiveChromeModule then nil else { bottom = UDim.new(0, var41) },
					ZIndex = constantsModule.DisplayOrder.Feed
				}, {
					Feed = if fFlagMomentsImmersiveChromeModule then reactModule.createElement(momentOverlayInsetContextModule.Context.Provider, { value = var41 }, { Feed = p1 }) else p1
				})
			end, { var41, fFlagMomentsImmersiveChromeModule })
		}),
		NavBarBackfill = if not (fFlagMomentsUseCompositionLibraryModule or var41 <= 0) then reactModule.createElement(view, {
			tag = "position-bottom-center anchor-bottom-center bg-surface-0",
			testId = "--moments-nav-bar-backfill",
			Size = UDim2.new(1, 0, 0, var41),
			ZIndex = constantsModule.DisplayOrder.FeedTopBar
		}) else nil,
		MomentUnavailableDialog = if var32 and var42 and var37 then reactModule.createElement(var33, {
			onDismiss = function() --[[ line: 370 ]]
				-- upvalues: var38 (ref)
				var38(false)
			end
		}) else nil,
		CreationFlowOverlay = if var46.isCreating then reactModule.createElement(view, {
			tag = "size-full",
			ZIndex = constantsModule.DisplayOrder.Modals
		}, {
			Screen = reactModule.createElement(creationFlowScreen, { host = var47 })
		}) else nil,
		FtuxOverlay = if var46.showFtux then reactModule.createElement(view, {
			tag = "size-full",
			ZIndex = constantsModule.DisplayOrder.Modals
		}, {
			Screen = reactModule.createElement(FTUXEducationScreenModule, { onClose = var46.onExitFtux })
		}) else nil
	})
end