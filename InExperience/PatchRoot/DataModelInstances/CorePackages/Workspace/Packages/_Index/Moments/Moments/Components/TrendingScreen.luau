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
local fFlagEnableArgus = require(parent.SharedFlags).FFlagEnableArgus
local isStudioModule = require(parent.MomentsCommon.isStudio)
local getFFlagArgusStudioMockFeedModule = require(moments.Flags.GetFFlagArgusStudioMockFeed)
local createMockFeedSource = feedModule.createMockFeedSource
local var29 = if fFlagEnableArgus then createSignalTracker() else nil
local var30 = getFFlagMomentsFixUnavailableDeeplinkModule()
local var31 = if var30 then require(moments.Components.MomentUnavailableDialog) else nil
local createRecommendationTelemetry = feedModule.createRecommendationTelemetry
local momentsCommonModule = require(parent.MomentsCommon)
local analytics = momentsCommonModule.Analytics
local eventNames = analytics.EventNames
local sessionManager = analytics.SessionManager
local funnelEventNames = analytics.FunnelEventNames
local fireAnalyticsEvent = analytics.fireAnalyticsEvent
local fireFunnelAnalyticsEvent = analytics.fireFunnelAnalyticsEvent
local useMomentsGating = momentsCommonModule.Hooks.useMomentsGating

return function(_) --[[ line: 95 | named "TrendingScreen" ]]
	-- upvalues: reactModule (ref), momentsLocalStorageModule (ref), momentsLocalStorageKeysModule (ref), useScreenBottomInsetModule (ref), useFeedPlaybackActiveModule (ref), useMomentsSession (ref), useMomentsHost (ref), fFlagMomentsUseFoundationHeaderBarModule (ref), useMomentsGating (ref), useCreationEntryModule (ref), useUploadHostModule (ref), sessionManager (ref), funnelEventNames (ref), fireFunnelAnalyticsEvent (ref), var30 (ref), isStudioModule (ref), getFFlagArgusStudioMockFeedModule (ref), createMockFeedSource (ref), createMomentsFeedSourceModule (ref), var29 (ref), fFlagEnableArgus (ref), createRecommendationTelemetry (ref), fFlagMomentsImmersiveChromeModule (ref), signalsReactModule (ref), getImmersiveChromeStoreModule (ref), getFFlagMomentsFixBackgroundFeedInputModule (ref), robloxAppEventsModule (ref), appPage (ref), getUploadStoreModule (ref), getFFlagMomentsRefreshFromTopAfterUploadModule (ref), logCreateIntentModule (ref), fireAnalyticsEvent (ref), eventNames (ref), topBarModule (ref), momentOverlayInsetContextModule (ref), view (ref), constantsModule (ref), fFlagMomentsUseCompositionLibraryModule (ref), momentsFeedSurfaceModule (ref), var31 (ref), creationFlowScreen (ref), FTUXEducationScreenModule (ref)
	local var33, var34 = reactModule.useState(function() --[[ line: 96 ]]
		-- upvalues: momentsLocalStorageModule (copy), momentsLocalStorageKeysModule (copy)
		return not momentsLocalStorageModule.getField(momentsLocalStorageKeysModule.CreateTooltipSeen)
	end)
	local var35, var36 = reactModule.useState(false)
	local var37 = reactModule.useRef(nil)
	local var38 = reactModule.useRef(nil)
	local var39 = useScreenBottomInsetModule()
	local var40 = useFeedPlaybackActiveModule()
	local var41 = useMomentsSession()
	local openOwnMoments = useMomentsHost().openOwnMoments
	local var42 = if fFlagMomentsUseFoundationHeaderBarModule then useMomentsGating() else nil
	local var43 = var42 ~= nil or var42.isFlyoutEntryEnabled and var42.platformIntegrationEnabled
	local var44 = useCreationEntryModule()
	local var45 = useUploadHostModule({
		onExit = var44.onExitCreation,
		captureSource = var44.captureSource
	})
	reactModule.useEffect(function() --[[ line: 133 ]]
		-- upvalues: sessionManager (copy), funnelEventNames (copy), fireFunnelAnalyticsEvent (copy)
		fireFunnelAnalyticsEvent(funnelEventNames.FunnelTypes.AppNavigation, funnelEventNames.AppNavigationSteps.TrendingScreenView, sessionManager.getSessionId(funnelEventNames.FunnelTypes.AppNavigation) or sessionManager.startSession(funnelEventNames.FunnelTypes.AppNavigation))
	end, {})
	local var46 = reactModule.useCallback(function() --[[ line: 143 ]]
		-- upvalues: var30 (copy), var36 (ref)
		if var30 then
			var36(true)
		end
	end, {})
	local var47 = reactModule.useMemo(function() --[[ line: 149 ]]
		-- upvalues: isStudioModule (copy), getFFlagArgusStudioMockFeedModule (copy), createMockFeedSource (copy), createMomentsFeedSourceModule (copy), var41 (ref), var29 (copy), var30 (copy), var46 (ref)
		return if isStudioModule() and getFFlagArgusStudioMockFeedModule() then createMockFeedSource() else createMomentsFeedSourceModule(var41.getMomentsSessionId, {
			signalTracker = var29,
			onDeepLinkedMomentUnavailable = if var30 then var46 else nil
		})
	end, { var41, var46 })
	local var48 = reactModule.useMemo(function() --[[ line: 161 ]]
		-- upvalues: fFlagEnableArgus (copy), createRecommendationTelemetry (copy), var41 (ref), var29 (copy)
		return if fFlagEnableArgus then createRecommendationTelemetry({
			getMomentsSessionId = var41.getMomentsSessionId,
			signalTracker = var29
		}) else nil
	end, { var41 })
	local var35_1 = var30 and var35
	local var50 = not var44.isCreating and (not (getFFlagMomentsFixBackgroundFeedInputModule() and signalsReactModule.useSignalState(getImmersiveChromeStoreModule(false).getOverlayCovering)) and not var35_1)
	local var51 = var40 and (not var44.isCreating and not var35_1)
	local var52 = reactModule.useCallback(function() --[[ line: 191 ]]
		-- upvalues: var37 (ref)
		local current = var37.current
		
		if current ~= nil then
			current.refresh()
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 198 ]]
		-- upvalues: robloxAppEventsModule (copy), appPage (copy), var52 (ref)
		local reloadPageConnection = robloxAppEventsModule.ReloadPage:connect(function(p0) --[[ line: 199 ]]
			-- upvalues: appPage (copy), var52 (copy)
			if p0 == appPage.Moments then
				var52()
			end
		end)
		
		return function() --[[ line: 205 ]]
			-- upvalues: reloadPageConnection (ref)
			reloadPageConnection:disconnect()
		end
	end, { var52 })
	local var53 = getUploadStoreModule(false)
	local var54 = signalsReactModule.useSignalState(var53.getState)
	local var55 = signalsReactModule.useSignalState(var53.getUploadedMoment)
	reactModule.useEffect(function() --[[ line: 214 ]]
		-- upvalues: getFFlagMomentsRefreshFromTopAfterUploadModule (copy), var54 (ref), var38 (ref), var37 (ref), var55 (ref), var52 (ref)
		if getFFlagMomentsRefreshFromTopAfterUploadModule() then
			if var54 ~= "Success" then
				var38.current = var54
				
				return
			elseif var38.current ~= "Success" then
				var38.current = var54
				local current = var37.current
				
				if type(var55) == "table" and var55.momentId ~= nil and current ~= nil then
					current.prependMoment(var55)
					
					return
				end
				var52()
			end
			return
		elseif var54 == "Success" then
			var52()
		end
	end, { var54, var55, var52 })
	local var56 = reactModule.useCallback(function() --[[ line: 237 ]]
		-- upvalues: var34 (ref), momentsLocalStorageModule (copy), momentsLocalStorageKeysModule (copy)
		var34(false)
		momentsLocalStorageModule.setField(momentsLocalStorageKeysModule.CreateTooltipSeen, true)
	end, {})
	local var57 = reactModule.useCallback(function() --[[ line: 242 ]]
		-- upvalues: logCreateIntentModule (copy), funnelEventNames (copy), var44 (ref)
		logCreateIntentModule(funnelEventNames.CreationIntentSource.TopBar)
		var44.onCreatePressed()
	end, { var44.onCreatePressed })
	local var58 = reactModule.useCallback(function() --[[ line: 250 ]]
		-- upvalues: fireAnalyticsEvent (copy), eventNames (copy), var52 (ref)
		fireAnalyticsEvent(eventNames.FeedHomeButtonPressed)
		var52()
	end, { var52 })
	local var59 = reactModule.useCallback(function() --[[ line: 255 ]]
		-- upvalues: fireAnalyticsEvent (copy), eventNames (copy), openOwnMoments (ref)
		fireAnalyticsEvent(eventNames.MyCreationButtonPressed)
		
		if openOwnMoments ~= nil then
			openOwnMoments()
		end
	end, { openOwnMoments })
	
	return reactModule.createElement(view, { tag = "size-full bg-surface-0" }, {
		Surface = reactModule.createElement(momentsFeedSurfaceModule, {
			trackSurfaceLoad = true,
			source = var47,
			active = var50,
			playbackActive = var51,
			telemetry = var48,
			controllerRef = var37,
			header = reactModule.useMemo(function() --[[ line: 263 ]]
				-- upvalues: reactModule (copy), topBarModule (copy), var33 (ref), var40 (ref), var43 (ref), var56 (ref), var57 (ref), var58 (ref), var59 (ref)
				return reactModule.createElement(topBarModule, {
					isBaseScreen = true,
					showTopScrim = true,
					showFtuxTooltip = var33 and var40,
					showHamburger = var43,
					onFtuxTooltipDismissed = var56,
					onCreatePressed = var57,
					onNavigateToTrending = var58,
					onNavigateToMyMoments = var59
				})
			end, {
				var33, var40, var43, var56, var57, var58, var59
			}),
			renderFeedContainer = reactModule.useCallback(function(p1) --[[ line: 290 ]]
				-- upvalues: fFlagMomentsImmersiveChromeModule (ref), reactModule (copy), momentOverlayInsetContextModule (copy), var39 (ref), view (copy), constantsModule (copy)
				return reactModule.createElement(view, {
					tag = "size-full",
					testId = if fFlagMomentsImmersiveChromeModule then "--moments-feed-container-full-bleed" else "--moments-feed-container-inset",
					padding = if fFlagMomentsImmersiveChromeModule then nil else { bottom = UDim.new(0, var39) },
					ZIndex = constantsModule.DisplayOrder.Feed
				}, {
					Feed = if fFlagMomentsImmersiveChromeModule then reactModule.createElement(momentOverlayInsetContextModule.Context.Provider, { value = var39 }, { Feed = p1 }) else p1
				})
			end, { var39, fFlagMomentsImmersiveChromeModule })
		}),
		NavBarBackfill = if not (fFlagMomentsUseCompositionLibraryModule or var39 <= 0) then reactModule.createElement(view, {
			tag = "position-bottom-center anchor-bottom-center bg-surface-0",
			testId = "--moments-nav-bar-backfill",
			Size = UDim2.new(1, 0, 0, var39),
			ZIndex = constantsModule.DisplayOrder.FeedTopBar
		}) else nil,
		MomentUnavailableDialog = if var30 and var40 and var35 then reactModule.createElement(var31, {
			onDismiss = function() --[[ line: 353 ]]
				-- upvalues: var36 (ref)
				var36(false)
			end
		}) else nil,
		CreationFlowOverlay = if var44.isCreating then reactModule.createElement(view, {
			tag = "size-full",
			ZIndex = constantsModule.DisplayOrder.Modals
		}, {
			Screen = reactModule.createElement(creationFlowScreen, { host = var45 })
		}) else nil,
		FtuxOverlay = if var44.showFtux then reactModule.createElement(view, {
			tag = "size-full",
			ZIndex = constantsModule.DisplayOrder.Modals
		}, {
			Screen = reactModule.createElement(FTUXEducationScreenModule, { onClose = var44.onExitFtux })
		}) else nil
	})
end