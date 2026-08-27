local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local appPage = require(parent.RobloxAppEnums).AppPage
local robloxAppEventsModule = require(parent.RobloxAppEvents)
local roactNavigationModule = require(parent.RoactNavigation)
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
local fFlagMomentsFlushDwellBeforeNavigationModule = require(moments.Flags.FFlagMomentsFlushDwellBeforeNavigation)
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
local var1 = if fFlagEnableArgus then createSignalTracker() else nil
local var2 = getFFlagMomentsFixUnavailableDeeplinkModule()
local var3 = if var2 then require(moments.Components.MomentUnavailableDialog) else nil
local createRecommendationTelemetry = feedModule.createRecommendationTelemetry
local momentsCommonModule = require(parent.MomentsCommon)
local analytics = momentsCommonModule.Analytics
local eventNames = analytics.EventNames
local sessionManager = analytics.SessionManager
local funnelEventNames = analytics.FunnelEventNames
local fireAnalyticsEvent = analytics.fireAnalyticsEvent
local fireFunnelAnalyticsEvent = analytics.fireFunnelAnalyticsEvent
local useMomentsGating = momentsCommonModule.Hooks.useMomentsGating

return function(p1)
	-- upvalues: reactModule (ref), momentsLocalStorageModule (ref), momentsLocalStorageKeysModule (ref), useScreenBottomInsetModule (ref), useFeedPlaybackActiveModule (ref), useMomentsSession (ref), useMomentsHost (ref), fFlagMomentsUseFoundationHeaderBarModule (ref), useMomentsGating (ref), useCreationEntryModule (ref), useUploadHostModule (ref), sessionManager (ref), funnelEventNames (ref), fireFunnelAnalyticsEvent (ref), var2 (ref), isStudioModule (ref), getFFlagArgusStudioMockFeedModule (ref), createMockFeedSource (ref), createMomentsFeedSourceModule (ref), var1 (ref), fFlagEnableArgus (ref), createRecommendationTelemetry (ref), fFlagMomentsImmersiveChromeModule (ref), signalsReactModule (ref), getImmersiveChromeStoreModule (ref), getFFlagMomentsFixBackgroundFeedInputModule (ref), reportModalCovering (ref), fFlagEnableReportingFlowForMomentsFeed (ref), fFlagMomentsFixRecommendationImpressionLifecycleModule (ref), fFlagMomentsFlushDwellBeforeNavigationModule (ref), roactNavigationModule (ref), robloxAppEventsModule (ref), appPage (ref), getUploadStoreModule (ref), getFFlagMomentsRefreshFromTopAfterUploadModule (ref), logCreateIntentModule (ref), fireAnalyticsEvent (ref), eventNames (ref), topBarModule (ref), momentOverlayInsetContextModule (ref), view (ref), constantsModule (ref), fFlagMomentsUseCompositionLibraryModule (ref), momentsFeedSurfaceModule (ref), var3 (ref), creationFlowScreen (ref), FTUXEducationScreenModule (ref)
	local var4, var5 = reactModule.useState(function()
		-- upvalues: momentsLocalStorageModule (copy), momentsLocalStorageKeysModule (copy)
		return not momentsLocalStorageModule.getField(momentsLocalStorageKeysModule.CreateTooltipSeen)
	end)
	local var6, var7 = reactModule.useState(false)
	local var8 = reactModule.useRef(nil)
	local var9 = reactModule.useRef(nil)
	local var10 = useScreenBottomInsetModule()
	local var11 = useFeedPlaybackActiveModule()
	local var12 = useMomentsSession()
	local openOwnMoments = useMomentsHost().openOwnMoments
	local var13 = if fFlagMomentsUseFoundationHeaderBarModule then useMomentsGating() else nil
	local var14 = var13 ~= nil or var13.isFlyoutEntryEnabled and var13.platformIntegrationEnabled
	local var15 = useCreationEntryModule()
	local var16 = useUploadHostModule({
		onExit = var15.onExitCreation,
		captureSource = var15.captureSource
	})
	reactModule.useEffect(function()
		-- upvalues: sessionManager (copy), funnelEventNames (copy), fireFunnelAnalyticsEvent (copy)
		fireFunnelAnalyticsEvent(funnelEventNames.FunnelTypes.AppNavigation, funnelEventNames.AppNavigationSteps.TrendingScreenView, sessionManager.getSessionId(funnelEventNames.FunnelTypes.AppNavigation) or sessionManager.startSession(funnelEventNames.FunnelTypes.AppNavigation))
	end, {})
	local var17 = reactModule.useCallback(function()
		-- upvalues: var2 (copy), var7 (ref)
		if var2 then
			var7(true)
		end
	end, {})
	local var18 = reactModule.useMemo(function()
		-- upvalues: isStudioModule (copy), getFFlagArgusStudioMockFeedModule (copy), createMockFeedSource (copy), createMomentsFeedSourceModule (copy), var12 (ref), var1 (copy), var2 (copy), var17 (ref)
		return if isStudioModule() and getFFlagArgusStudioMockFeedModule() then createMockFeedSource() else createMomentsFeedSourceModule(var12.getMomentsSessionId, {
			signalTracker = var1,
			onDeepLinkedMomentUnavailable = if var2 then var17 else nil
		})
	end, { var12, var17 })
	local var19 = reactModule.useMemo(function()
		-- upvalues: fFlagEnableArgus (copy), createRecommendationTelemetry (copy), var12 (ref), var1 (copy)
		return if fFlagEnableArgus then createRecommendationTelemetry({
			getMomentsSessionId = var12.getMomentsSessionId,
			signalTracker = var1
		}) else nil
	end, { var12 })
	local getOverlayCovering = getFFlagMomentsFixBackgroundFeedInputModule() and signalsReactModule.useSignalState(getImmersiveChromeStoreModule(false).getOverlayCovering)
	local var20 = var2 and var6
	local getCovering = fFlagEnableReportingFlowForMomentsFeed and signalsReactModule.useSignalState(reportModalCovering.getCovering)
	local var21 = not var15.isCreating and (not getOverlayCovering and (not var20 and not getCovering))
	
	if fFlagMomentsFixRecommendationImpressionLifecycleModule then
		var21 = var21 and var11
	end
	local var22 = var11 and (not var15.isCreating and (not var20 and not getCovering))
	local var23 = reactModule.useCallback(function()
		-- upvalues: var8 (ref)
		local current = var8.current
		
		if current ~= nil then
			current.refresh()
		end
	end, {})
	local var24 = reactModule.useCallback(function()
		-- upvalues: var8 (ref)
		local current = var8.current
		
		if current ~= nil then
			current.flushView()
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: fFlagMomentsFlushDwellBeforeNavigationModule (copy), p1 (ref), roactNavigationModule (copy), var24 (ref)
		if fFlagMomentsFlushDwellBeforeNavigationModule and p1.navigation.addListener ~= nil then
			local var25 = p1.navigation.addListener(roactNavigationModule.Events.WillBlur, function()
				-- upvalues: var24 (copy)
				var24()
			end)
			
			return function()
				-- upvalues: var25 (ref)
				var25.remove()
			end
		end
		return nil
	end, { p1.navigation, var24 })
	reactModule.useEffect(function()
		-- upvalues: robloxAppEventsModule (copy), appPage (copy), var23 (ref)
		local reloadPageConnection = robloxAppEventsModule.ReloadPage:connect(function(p2)
			-- upvalues: appPage (copy), var23 (copy)
			if p2 == appPage.Moments then
				var23()
			end
		end)
		
		return function()
			-- upvalues: reloadPageConnection (ref)
			reloadPageConnection:disconnect()
		end
	end, { var23 })
	local var25 = getUploadStoreModule(false)
	local var26 = signalsReactModule.useSignalState(var25.getState)
	local var27 = signalsReactModule.useSignalState(var25.getUploadedMoment)
	reactModule.useEffect(function()
		-- upvalues: getFFlagMomentsRefreshFromTopAfterUploadModule (copy), var26 (ref), var9 (ref), var8 (ref), var27 (ref), var23 (ref)
		if getFFlagMomentsRefreshFromTopAfterUploadModule() then
			if var26 ~= "Success" then
				var9.current = var26
				
				return
			elseif var9.current ~= "Success" then
				var9.current = var26
				local current = var8.current
				
				if type(var27) == "table" and var27.momentId ~= nil and current ~= nil then
					current.prependMoment(var27)
					
					return
				end
				var23()
			end
			return
		elseif var26 == "Success" then
			var23()
		end
	end, { var26, var27, var23 })
	local var28 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), momentsLocalStorageModule (copy), momentsLocalStorageKeysModule (copy)
		var5(false)
		momentsLocalStorageModule.setField(momentsLocalStorageKeysModule.CreateTooltipSeen, true)
	end, {})
	local var29 = reactModule.useCallback(function()
		-- upvalues: logCreateIntentModule (copy), funnelEventNames (copy), var15 (ref)
		logCreateIntentModule(funnelEventNames.CreationIntentSource.TopBar)
		var15.onCreatePressed()
	end, { var15.onCreatePressed })
	local var30 = reactModule.useCallback(function()
		-- upvalues: fireAnalyticsEvent (copy), eventNames (copy), var23 (ref)
		fireAnalyticsEvent(eventNames.FeedHomeButtonPressed)
		var23()
	end, { var23 })
	local var31 = reactModule.useCallback(function()
		-- upvalues: fireAnalyticsEvent (copy), eventNames (copy), openOwnMoments (ref), fFlagMomentsFlushDwellBeforeNavigationModule (copy), var24 (ref)
		fireAnalyticsEvent(eventNames.MyCreationButtonPressed)
		
		if openOwnMoments ~= nil then
			if fFlagMomentsFlushDwellBeforeNavigationModule then
				var24()
			end
			openOwnMoments()
		end
	end, { openOwnMoments, var24 })
	
	return reactModule.createElement(view, { tag = "size-full bg-surface-0" }, {
		Surface = reactModule.createElement(momentsFeedSurfaceModule, {
			trackSurfaceLoad = true,
			source = var18,
			active = var21,
			playbackActive = var22,
			telemetry = var19,
			controllerRef = var8,
			header = reactModule.useMemo(function()
				-- upvalues: reactModule (copy), topBarModule (copy), var4 (ref), var11 (ref), var14 (ref), var28 (ref), var29 (ref), var30 (ref), var31 (ref)
				return reactModule.createElement(topBarModule, {
					isBaseScreen = true,
					showTopScrim = true,
					showFtuxTooltip = var4 and var11,
					showHamburger = var14,
					onFtuxTooltipDismissed = var28,
					onCreatePressed = var29,
					onNavigateToTrending = var30,
					onNavigateToMyMoments = var31
				})
			end, {
				var4, var11, var14, var28, var29, var30, var31
			}),
			renderFeedContainer = reactModule.useCallback(function(p2)
				-- upvalues: fFlagMomentsImmersiveChromeModule (ref), reactModule (copy), momentOverlayInsetContextModule (copy), var10 (ref), view (copy), constantsModule (copy)
				return reactModule.createElement(view, {
					tag = "size-full",
					testId = if fFlagMomentsImmersiveChromeModule then "--moments-feed-container-full-bleed" else "--moments-feed-container-inset",
					padding = if fFlagMomentsImmersiveChromeModule then nil else { bottom = UDim.new(0, var10) },
					ZIndex = constantsModule.DisplayOrder.Feed
				}, {
					Feed = if fFlagMomentsImmersiveChromeModule then reactModule.createElement(momentOverlayInsetContextModule.Context.Provider, { value = var10 }, { Feed = p2 }) else p2
				})
			end, { var10, fFlagMomentsImmersiveChromeModule })
		}),
		NavBarBackfill = if not (fFlagMomentsUseCompositionLibraryModule or var10 <= 0) then reactModule.createElement(view, {
			tag = "position-bottom-center anchor-bottom-center bg-surface-0",
			testId = "--moments-nav-bar-backfill",
			Size = UDim2.new(1, 0, 0, var10),
			ZIndex = constantsModule.DisplayOrder.FeedTopBar
		}) else nil,
		MomentUnavailableDialog = if var2 and var11 and var6 then reactModule.createElement(var3, {
			onDismiss = function()
				-- upvalues: var7 (ref)
				var7(false)
			end
		}) else nil,
		CreationFlowOverlay = if var15.isCreating then reactModule.createElement(view, {
			tag = "size-full",
			ZIndex = constantsModule.DisplayOrder.Modals
		}, {
			Screen = reactModule.createElement(creationFlowScreen, { host = var16 })
		}) else nil,
		FtuxOverlay = if var15.showFtux then reactModule.createElement(view, {
			tag = "size-full",
			ZIndex = constantsModule.DisplayOrder.Modals
		}, {
			Screen = reactModule.createElement(FTUXEducationScreenModule, { onClose = var15.onExitFtux })
		}) else nil
	})
end