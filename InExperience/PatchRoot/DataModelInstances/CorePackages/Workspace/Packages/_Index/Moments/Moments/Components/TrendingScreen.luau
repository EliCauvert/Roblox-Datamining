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
local fFlagMomentsFeedAboveNavBarModule = require(moments.Flags.FFlagMomentsFeedAboveNavBar)
local fFlagMomentsImmersiveChromeModule = require(moments.Flags.FFlagMomentsImmersiveChrome)
local fFlagMomentsUseCompositionLibraryModule = require(moments.Flags.FFlagMomentsUseCompositionLibrary)
local fFlagMomentsUseFoundationHeaderBarModule = require(moments.Flags.FFlagMomentsUseFoundationHeaderBar)
local getImmersiveChromeStoreModule = require(moments.Stores.GetImmersiveChromeStore)
local momentsLocalStorageModule = require(parent.MomentsCommon.MomentsLocalStorage)
local momentsLocalStorageKeysModule = require(parent.MomentsCommon.MomentsLocalStorageKeys)
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
local momentUnavailableDialogModule = require(moments.Components.MomentUnavailableDialog)
local createRecommendationTelemetry = feedModule.createRecommendationTelemetry
local momentsCommonModule = require(parent.MomentsCommon)
local analytics = momentsCommonModule.Analytics
local eventNames = analytics.EventNames
local sessionManager = analytics.SessionManager
local funnelEventNames = analytics.FunnelEventNames
local fireAnalyticsEvent = analytics.fireAnalyticsEvent
local fireFunnelAnalyticsEvent = analytics.fireFunnelAnalyticsEvent
local useMomentsGating = momentsCommonModule.Hooks.useMomentsGating
local var2 = nil

local function _()
	-- upvalues: var2 (write), parent (ref)
	if var2 == nil then
		var2 = require(parent.Loggers).Logger:new("Moments.Upload")
	end
	return var2
end

return function(p1)
	-- upvalues: reactModule (ref), momentsLocalStorageModule (ref), momentsLocalStorageKeysModule (ref), useScreenBottomInsetModule (ref), useFeedPlaybackActiveModule (ref), useMomentsSession (ref), useMomentsHost (ref), fFlagMomentsUseFoundationHeaderBarModule (ref), useMomentsGating (ref), useCreationEntryModule (ref), useUploadHostModule (ref), sessionManager (ref), funnelEventNames (ref), fireFunnelAnalyticsEvent (ref), isStudioModule (ref), getFFlagArgusStudioMockFeedModule (ref), createMockFeedSource (ref), createMomentsFeedSourceModule (ref), var1 (ref), fFlagEnableArgus (ref), createRecommendationTelemetry (ref), fFlagMomentsImmersiveChromeModule (ref), signalsReactModule (ref), getImmersiveChromeStoreModule (ref), reportModalCovering (ref), fFlagEnableReportingFlowForMomentsFeed (ref), fFlagMomentsFixRecommendationImpressionLifecycleModule (ref), fFlagMomentsFlushDwellBeforeNavigationModule (ref), roactNavigationModule (ref), robloxAppEventsModule (ref), appPage (ref), getUploadStoreModule (ref), var2 (write), parent (ref), logCreateIntentModule (ref), fireAnalyticsEvent (ref), eventNames (ref), topBarModule (ref), momentOverlayInsetContextModule (ref), fFlagMomentsFeedAboveNavBarModule (ref), view (ref), constantsModule (ref), fFlagMomentsUseCompositionLibraryModule (ref), momentsFeedSurfaceModule (ref), momentUnavailableDialogModule (ref), creationFlowScreen (ref), FTUXEducationScreenModule (ref)
	local var3, var4 = reactModule.useState(function()
		-- upvalues: momentsLocalStorageModule (copy), momentsLocalStorageKeysModule (copy)
		return not momentsLocalStorageModule.getField(momentsLocalStorageKeysModule.CreateTooltipSeen)
	end)
	local var5, var6 = reactModule.useState(false)
	local var7 = reactModule.useRef(nil)
	local var8 = reactModule.useRef(nil)
	local var9 = useScreenBottomInsetModule()
	local var10 = useFeedPlaybackActiveModule()
	local var11 = useMomentsSession()
	local openOwnMoments = useMomentsHost().openOwnMoments
	local var12 = if fFlagMomentsUseFoundationHeaderBarModule then useMomentsGating() else nil
	local var13 = var12 ~= nil or var12.isFlyoutEntryEnabled and var12.platformIntegrationEnabled
	local var14 = useCreationEntryModule()
	local var15 = useUploadHostModule({
		onExit = var14.onExitCreation,
		captureSource = var14.captureSource
	})
	reactModule.useEffect(function()
		-- upvalues: sessionManager (copy), funnelEventNames (copy), fireFunnelAnalyticsEvent (copy)
		fireFunnelAnalyticsEvent(funnelEventNames.FunnelTypes.AppNavigation, funnelEventNames.AppNavigationSteps.TrendingScreenView, sessionManager.getSessionId(funnelEventNames.FunnelTypes.AppNavigation) or sessionManager.startSession(funnelEventNames.FunnelTypes.AppNavigation))
	end, {})
	local var16 = reactModule.useCallback(function()
		-- upvalues: var6 (ref)
		var6(true)
	end, {})
	local var17 = reactModule.useMemo(function()
		-- upvalues: isStudioModule (copy), getFFlagArgusStudioMockFeedModule (copy), createMockFeedSource (copy), createMomentsFeedSourceModule (copy), var11 (ref), var1 (copy), var16 (ref)
		return if isStudioModule() and getFFlagArgusStudioMockFeedModule() then createMockFeedSource() else createMomentsFeedSourceModule(var11.getMomentsSessionId, {
			signalTracker = var1,
			onDeepLinkedMomentUnavailable = var16
		})
	end, { var11, var16 })
	local var18 = reactModule.useMemo(function()
		-- upvalues: fFlagEnableArgus (copy), createRecommendationTelemetry (copy), var11 (ref), var1 (copy)
		return if fFlagEnableArgus then createRecommendationTelemetry({
			getMomentsSessionId = var11.getMomentsSessionId,
			signalTracker = var1
		}) else nil
	end, { var11 })
	local getCovering = fFlagEnableReportingFlowForMomentsFeed and signalsReactModule.useSignalState(reportModalCovering.getCovering)
	local var19 = not var14.isCreating and (not signalsReactModule.useSignalState(getImmersiveChromeStoreModule(false).getOverlayCovering) and (not var5 and not getCovering))
	
	if fFlagMomentsFixRecommendationImpressionLifecycleModule then
		var19 = var19 and var10
	end
	local var20 = var10 and (not var14.isCreating and (not var5 and not getCovering))
	local var21 = reactModule.useCallback(function()
		-- upvalues: var7 (ref)
		local current = var7.current
		
		if current ~= nil then
			current.refresh()
		end
	end, {})
	local var22 = reactModule.useCallback(function()
		-- upvalues: var7 (ref)
		local current = var7.current
		
		if current ~= nil then
			current.flushView()
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: fFlagMomentsFlushDwellBeforeNavigationModule (copy), p1 (ref), roactNavigationModule (copy), var22 (ref)
		if fFlagMomentsFlushDwellBeforeNavigationModule and p1.navigation.addListener ~= nil then
			local var23 = p1.navigation.addListener(roactNavigationModule.Events.WillBlur, function()
				-- upvalues: var22 (copy)
				var22()
			end)
			
			return function()
				-- upvalues: var23 (ref)
				var23.remove()
			end
		end
		return nil
	end, { p1.navigation, var22 })
	reactModule.useEffect(function()
		-- upvalues: robloxAppEventsModule (copy), appPage (copy), var21 (ref)
		local reloadPageConnection = robloxAppEventsModule.ReloadPage:connect(function(p2)
			-- upvalues: appPage (copy), var21 (copy)
			if p2 == appPage.Moments then
				var21()
			end
		end)
		
		return function()
			-- upvalues: reloadPageConnection (ref)
			reloadPageConnection:disconnect()
		end
	end, { var21 })
	local var23 = getUploadStoreModule(false)
	local var24 = signalsReactModule.useSignalState(var23.getState)
	local var25 = signalsReactModule.useSignalState(var23.getUploadedMoment)
	reactModule.useEffect(function()
		-- upvalues: var24 (ref), var8 (ref), var7 (ref), var25 (ref), var2 (copy), parent (copy), var21 (ref)
		if var24 ~= "Success" then
			var8.current = var24
			
			return
		elseif var8.current ~= "Success" then
			var8.current = var24
			local current = var7.current
			
			if type(var25) == "table" and var25.momentId ~= nil and current ~= nil then
				if var2 == nil then
					var2 = require(parent.Loggers).Logger:new("Moments.Upload")
				end
				var2:debug("event=feed_prepend_uploaded momentId={} assetId={}", var25.momentId, tostring(var25.assetId))
				current.prependMoment(var25)
				
				return
			elseif var2 == nil then
				var2 = require(parent.Loggers).Logger:new("Moments.Upload")
			end
			var2:debug("event=feed_refresh_after_upload uploadedMoment={} hasController={}", tostring(var25), tostring(current ~= nil))
			var21()
		end
	end, { var24, var25, var21 })
	local var26 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), momentsLocalStorageModule (copy), momentsLocalStorageKeysModule (copy)
		var4(false)
		momentsLocalStorageModule.setField(momentsLocalStorageKeysModule.CreateTooltipSeen, true)
	end, {})
	local var27 = reactModule.useCallback(function()
		-- upvalues: logCreateIntentModule (copy), funnelEventNames (copy), var14 (ref)
		logCreateIntentModule(funnelEventNames.CreationIntentSource.TopBar)
		var14.onCreatePressed()
	end, { var14.onCreatePressed })
	local var28 = reactModule.useCallback(function()
		-- upvalues: fireAnalyticsEvent (copy), eventNames (copy), var21 (ref)
		fireAnalyticsEvent(eventNames.FeedHomeButtonPressed)
		var21()
	end, { var21 })
	local var29 = reactModule.useCallback(function()
		-- upvalues: fireAnalyticsEvent (copy), eventNames (copy), openOwnMoments (ref), fFlagMomentsFlushDwellBeforeNavigationModule (copy), var22 (ref)
		fireAnalyticsEvent(eventNames.MyCreationButtonPressed)
		
		if openOwnMoments ~= nil then
			if fFlagMomentsFlushDwellBeforeNavigationModule then
				var22()
			end
			openOwnMoments()
		end
	end, { openOwnMoments, var22 })
	
	return reactModule.createElement(view, { tag = "size-full bg-surface-0" }, {
		Surface = reactModule.createElement(momentsFeedSurfaceModule, {
			trackSurfaceLoad = true,
			source = var17,
			active = var19,
			playbackActive = var20,
			telemetry = var18,
			controllerRef = var7,
			header = reactModule.useMemo(function()
				-- upvalues: reactModule (copy), topBarModule (copy), var3 (ref), var10 (ref), var13 (ref), var26 (ref), var27 (ref), var28 (ref), var29 (ref)
				return reactModule.createElement(topBarModule, {
					isBaseScreen = true,
					showTopScrim = true,
					showFtuxTooltip = var3 and var10,
					showHamburger = var13,
					onFtuxTooltipDismissed = var26,
					onCreatePressed = var27,
					onNavigateToTrending = var28,
					onNavigateToMyMoments = var29
				})
			end, {
				var3, var10, var13, var26, var27, var28, var29
			}),
			renderFeedContainer = reactModule.useCallback(function(p2)
				-- upvalues: fFlagMomentsImmersiveChromeModule (ref), reactModule (copy), momentOverlayInsetContextModule (copy), var9 (ref), fFlagMomentsFeedAboveNavBarModule (copy), view (copy), constantsModule (copy)
				return reactModule.createElement(view, {
					tag = "size-full",
					testId = if fFlagMomentsImmersiveChromeModule then "--moments-feed-container-full-bleed" else "--moments-feed-container-inset",
					padding = if fFlagMomentsFeedAboveNavBarModule then { bottom = UDim.new(0, var9) } elseif fFlagMomentsImmersiveChromeModule then nil else { bottom = UDim.new(0, var9) },
					ZIndex = constantsModule.DisplayOrder.Feed
				}, {
					Feed = if fFlagMomentsImmersiveChromeModule then reactModule.createElement(momentOverlayInsetContextModule.Context.Provider, { value = var9 }, { Feed = p2 }) else p2
				})
			end, { var9, fFlagMomentsImmersiveChromeModule })
		}),
		NavBarBackfill = if not (fFlagMomentsUseCompositionLibraryModule or var9 <= 0) then reactModule.createElement(view, {
			tag = "position-bottom-center anchor-bottom-center bg-surface-0",
			testId = "--moments-nav-bar-backfill",
			Size = UDim2.new(1, 0, 0, var9),
			ZIndex = constantsModule.DisplayOrder.FeedTopBar
		}) else nil,
		MomentUnavailableDialog = if var10 and var5 then reactModule.createElement(momentUnavailableDialogModule, {
			onDismiss = function()
				-- upvalues: var6 (ref)
				var6(false)
			end
		}) else nil,
		CreationFlowOverlay = if var14.isCreating then reactModule.createElement(view, {
			tag = "size-full",
			ZIndex = constantsModule.DisplayOrder.Modals
		}, {
			Screen = reactModule.createElement(creationFlowScreen, { host = var15 })
		}) else nil,
		FtuxOverlay = if var14.showFtux then reactModule.createElement(view, {
			tag = "size-full",
			ZIndex = constantsModule.DisplayOrder.Modals
		}, {
			Screen = reactModule.createElement(FTUXEducationScreenModule, { onClose = var14.onExitFtux })
		}) else nil
	})
end