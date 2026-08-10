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
local var30 = if fFlagEnableArgus then createSignalTracker() else nil
local var31 = getFFlagMomentsFixUnavailableDeeplinkModule()
local var32 = if var31 then require(moments.Components.MomentUnavailableDialog) else nil
local createRecommendationTelemetry = feedModule.createRecommendationTelemetry
local momentsCommonModule = require(parent.MomentsCommon)
local analytics = momentsCommonModule.Analytics
local eventNames = analytics.EventNames
local sessionManager = analytics.SessionManager
local funnelEventNames = analytics.FunnelEventNames
local fireAnalyticsEvent = analytics.fireAnalyticsEvent
local fireFunnelAnalyticsEvent = analytics.fireFunnelAnalyticsEvent
local useMomentsGating = momentsCommonModule.Hooks.useMomentsGating

return function(_) --[[ line: 97 | named "TrendingScreen" ]]
	-- upvalues: reactModule (ref), momentsLocalStorageModule (ref), momentsLocalStorageKeysModule (ref), useScreenBottomInsetModule (ref), useFeedPlaybackActiveModule (ref), useMomentsSession (ref), useMomentsHost (ref), fFlagMomentsUseFoundationHeaderBarModule (ref), useMomentsGating (ref), useCreationEntryModule (ref), useUploadHostModule (ref), sessionManager (ref), funnelEventNames (ref), fireFunnelAnalyticsEvent (ref), var31 (ref), isStudioModule (ref), getFFlagArgusStudioMockFeedModule (ref), createMockFeedSource (ref), createMomentsFeedSourceModule (ref), var30 (ref), fFlagEnableArgus (ref), createRecommendationTelemetry (ref), fFlagMomentsImmersiveChromeModule (ref), signalsReactModule (ref), getImmersiveChromeStoreModule (ref), getFFlagMomentsFixBackgroundFeedInputModule (ref), reportModalCovering (ref), fFlagEnableReportingFlowForMomentsFeed (ref), robloxAppEventsModule (ref), appPage (ref), getUploadStoreModule (ref), getFFlagMomentsRefreshFromTopAfterUploadModule (ref), logCreateIntentModule (ref), fireAnalyticsEvent (ref), eventNames (ref), topBarModule (ref), momentOverlayInsetContextModule (ref), view (ref), constantsModule (ref), fFlagMomentsUseCompositionLibraryModule (ref), momentsFeedSurfaceModule (ref), var32 (ref), creationFlowScreen (ref), FTUXEducationScreenModule (ref)
	local var34, var35 = reactModule.useState(function() --[[ line: 98 ]]
		-- upvalues: momentsLocalStorageModule (copy), momentsLocalStorageKeysModule (copy)
		return not momentsLocalStorageModule.getField(momentsLocalStorageKeysModule.CreateTooltipSeen)
	end)
	local var36, var37 = reactModule.useState(false)
	local var38 = reactModule.useRef(nil)
	local var39 = reactModule.useRef(nil)
	local var40 = useScreenBottomInsetModule()
	local var41 = useFeedPlaybackActiveModule()
	local var42 = useMomentsSession()
	local openOwnMoments = useMomentsHost().openOwnMoments
	local var43 = if fFlagMomentsUseFoundationHeaderBarModule then useMomentsGating() else nil
	local var44 = var43 ~= nil or var43.isFlyoutEntryEnabled and var43.platformIntegrationEnabled
	local var45 = useCreationEntryModule()
	local var46 = useUploadHostModule({
		onExit = var45.onExitCreation,
		captureSource = var45.captureSource
	})
	reactModule.useEffect(function() --[[ line: 135 ]]
		-- upvalues: sessionManager (copy), funnelEventNames (copy), fireFunnelAnalyticsEvent (copy)
		fireFunnelAnalyticsEvent(funnelEventNames.FunnelTypes.AppNavigation, funnelEventNames.AppNavigationSteps.TrendingScreenView, sessionManager.getSessionId(funnelEventNames.FunnelTypes.AppNavigation) or sessionManager.startSession(funnelEventNames.FunnelTypes.AppNavigation))
	end, {})
	local var47 = reactModule.useCallback(function() --[[ line: 145 ]]
		-- upvalues: var31 (copy), var37 (ref)
		if var31 then
			var37(true)
		end
	end, {})
	local var48 = reactModule.useMemo(function() --[[ line: 151 ]]
		-- upvalues: isStudioModule (copy), getFFlagArgusStudioMockFeedModule (copy), createMockFeedSource (copy), createMomentsFeedSourceModule (copy), var42 (ref), var30 (copy), var31 (copy), var47 (ref)
		return if isStudioModule() and getFFlagArgusStudioMockFeedModule() then createMockFeedSource() else createMomentsFeedSourceModule(var42.getMomentsSessionId, {
			signalTracker = var30,
			onDeepLinkedMomentUnavailable = if var31 then var47 else nil
		})
	end, { var42, var47 })
	local var49 = reactModule.useMemo(function() --[[ line: 163 ]]
		-- upvalues: fFlagEnableArgus (copy), createRecommendationTelemetry (copy), var42 (ref), var30 (copy)
		return if fFlagEnableArgus then createRecommendationTelemetry({
			getMomentsSessionId = var42.getMomentsSessionId,
			signalTracker = var30
		}) else nil
	end, { var42 })
	local getOverlayCovering = getFFlagMomentsFixBackgroundFeedInputModule() and signalsReactModule.useSignalState(getImmersiveChromeStoreModule(false).getOverlayCovering)
	local var36_1 = var31 and var36
	local getCovering = fFlagEnableReportingFlowForMomentsFeed and signalsReactModule.useSignalState(reportModalCovering.getCovering)
	local var53 = not var45.isCreating and (not getOverlayCovering and (not var36_1 and not getCovering))
	local var54 = var41 and (not var45.isCreating and (not var36_1 and not getCovering))
	local var55 = reactModule.useCallback(function() --[[ line: 202 ]]
		-- upvalues: var38 (ref)
		local current = var38.current
		
		if current ~= nil then
			current.refresh()
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 209 ]]
		-- upvalues: robloxAppEventsModule (copy), appPage (copy), var55 (ref)
		local reloadPageConnection = robloxAppEventsModule.ReloadPage:connect(function(p0) --[[ line: 210 ]]
			-- upvalues: appPage (copy), var55 (copy)
			if p0 == appPage.Moments then
				var55()
			end
		end)
		
		return function() --[[ line: 216 ]]
			-- upvalues: reloadPageConnection (ref)
			reloadPageConnection:disconnect()
		end
	end, { var55 })
	local var56 = getUploadStoreModule(false)
	local var57 = signalsReactModule.useSignalState(var56.getState)
	local var58 = signalsReactModule.useSignalState(var56.getUploadedMoment)
	reactModule.useEffect(function() --[[ line: 225 ]]
		-- upvalues: getFFlagMomentsRefreshFromTopAfterUploadModule (copy), var57 (ref), var39 (ref), var38 (ref), var58 (ref), var55 (ref)
		if getFFlagMomentsRefreshFromTopAfterUploadModule() then
			if var57 ~= "Success" then
				var39.current = var57
				
				return
			elseif var39.current ~= "Success" then
				var39.current = var57
				local current = var38.current
				
				if type(var58) == "table" and var58.momentId ~= nil and current ~= nil then
					current.prependMoment(var58)
					
					return
				end
				var55()
			end
			return
		elseif var57 == "Success" then
			var55()
		end
	end, { var57, var58, var55 })
	local var59 = reactModule.useCallback(function() --[[ line: 248 ]]
		-- upvalues: var35 (ref), momentsLocalStorageModule (copy), momentsLocalStorageKeysModule (copy)
		var35(false)
		momentsLocalStorageModule.setField(momentsLocalStorageKeysModule.CreateTooltipSeen, true)
	end, {})
	local var60 = reactModule.useCallback(function() --[[ line: 253 ]]
		-- upvalues: logCreateIntentModule (copy), funnelEventNames (copy), var45 (ref)
		logCreateIntentModule(funnelEventNames.CreationIntentSource.TopBar)
		var45.onCreatePressed()
	end, { var45.onCreatePressed })
	local var61 = reactModule.useCallback(function() --[[ line: 261 ]]
		-- upvalues: fireAnalyticsEvent (copy), eventNames (copy), var55 (ref)
		fireAnalyticsEvent(eventNames.FeedHomeButtonPressed)
		var55()
	end, { var55 })
	local var62 = reactModule.useCallback(function() --[[ line: 266 ]]
		-- upvalues: fireAnalyticsEvent (copy), eventNames (copy), openOwnMoments (ref)
		fireAnalyticsEvent(eventNames.MyCreationButtonPressed)
		
		if openOwnMoments ~= nil then
			openOwnMoments()
		end
	end, { openOwnMoments })
	
	return reactModule.createElement(view, { tag = "size-full bg-surface-0" }, {
		Surface = reactModule.createElement(momentsFeedSurfaceModule, {
			trackSurfaceLoad = true,
			source = var48,
			active = var53,
			playbackActive = var54,
			telemetry = var49,
			controllerRef = var38,
			header = reactModule.useMemo(function() --[[ line: 274 ]]
				-- upvalues: reactModule (copy), topBarModule (copy), var34 (ref), var41 (ref), var44 (ref), var59 (ref), var60 (ref), var61 (ref), var62 (ref)
				return reactModule.createElement(topBarModule, {
					isBaseScreen = true,
					showTopScrim = true,
					showFtuxTooltip = var34 and var41,
					showHamburger = var44,
					onFtuxTooltipDismissed = var59,
					onCreatePressed = var60,
					onNavigateToTrending = var61,
					onNavigateToMyMoments = var62
				})
			end, {
				var34, var41, var44, var59, var60, var61, var62
			}),
			renderFeedContainer = reactModule.useCallback(function(p1) --[[ line: 301 ]]
				-- upvalues: fFlagMomentsImmersiveChromeModule (ref), reactModule (copy), momentOverlayInsetContextModule (copy), var40 (ref), view (copy), constantsModule (copy)
				return reactModule.createElement(view, {
					tag = "size-full",
					testId = if fFlagMomentsImmersiveChromeModule then "--moments-feed-container-full-bleed" else "--moments-feed-container-inset",
					padding = if fFlagMomentsImmersiveChromeModule then nil else { bottom = UDim.new(0, var40) },
					ZIndex = constantsModule.DisplayOrder.Feed
				}, {
					Feed = if fFlagMomentsImmersiveChromeModule then reactModule.createElement(momentOverlayInsetContextModule.Context.Provider, { value = var40 }, { Feed = p1 }) else p1
				})
			end, { var40, fFlagMomentsImmersiveChromeModule })
		}),
		NavBarBackfill = if not (fFlagMomentsUseCompositionLibraryModule or var40 <= 0) then reactModule.createElement(view, {
			tag = "position-bottom-center anchor-bottom-center bg-surface-0",
			testId = "--moments-nav-bar-backfill",
			Size = UDim2.new(1, 0, 0, var40),
			ZIndex = constantsModule.DisplayOrder.FeedTopBar
		}) else nil,
		MomentUnavailableDialog = if var31 and var41 and var36 then reactModule.createElement(var32, {
			onDismiss = function() --[[ line: 364 ]]
				-- upvalues: var37 (ref)
				var37(false)
			end
		}) else nil,
		CreationFlowOverlay = if var45.isCreating then reactModule.createElement(view, {
			tag = "size-full",
			ZIndex = constantsModule.DisplayOrder.Modals
		}, {
			Screen = reactModule.createElement(creationFlowScreen, { host = var46 })
		}) else nil,
		FtuxOverlay = if var45.showFtux then reactModule.createElement(view, {
			tag = "size-full",
			ZIndex = constantsModule.DisplayOrder.Modals
		}, {
			Screen = reactModule.createElement(FTUXEducationScreenModule, { onClose = var45.onExitFtux })
		}) else nil
	})
end