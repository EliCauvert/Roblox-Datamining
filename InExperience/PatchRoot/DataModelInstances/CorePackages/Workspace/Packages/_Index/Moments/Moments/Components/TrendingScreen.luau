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
local useMomentsTabIsVisibleModule = require(moments.Hooks.useMomentsTabIsVisible)
local getMomentsPreferencesStoreModule = require(moments.Stores.GetMomentsPreferencesStore)
local navigationDestinationTypeModule = require(moments.Enums.NavigationDestinationType)
local fFlagMomentsNavigationEventModule = require(moments.Flags.FFlagMomentsNavigationEvent)
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
	-- upvalues: reactModule (ref), momentsLocalStorageModule (ref), momentsLocalStorageKeysModule (ref), useScreenBottomInsetModule (ref), useFeedPlaybackActiveModule (ref), fFlagMomentsNavigationEventModule (ref), useMomentsTabIsVisibleModule (ref), signalsReactModule (ref), getMomentsPreferencesStoreModule (ref), useMomentsSession (ref), useMomentsHost (ref), fFlagMomentsUseFoundationHeaderBarModule (ref), useMomentsGating (ref), useCreationEntryModule (ref), useUploadHostModule (ref), sessionManager (ref), funnelEventNames (ref), fireFunnelAnalyticsEvent (ref), isStudioModule (ref), getFFlagArgusStudioMockFeedModule (ref), createMockFeedSource (ref), createMomentsFeedSourceModule (ref), var1 (ref), fFlagEnableArgus (ref), createRecommendationTelemetry (ref), fFlagMomentsImmersiveChromeModule (ref), getImmersiveChromeStoreModule (ref), reportModalCovering (ref), fFlagEnableReportingFlowForMomentsFeed (ref), fFlagMomentsFixRecommendationImpressionLifecycleModule (ref), navigationDestinationTypeModule (ref), fFlagMomentsFlushDwellBeforeNavigationModule (ref), roactNavigationModule (ref), robloxAppEventsModule (ref), appPage (ref), getUploadStoreModule (ref), var2 (write), parent (ref), logCreateIntentModule (ref), fireAnalyticsEvent (ref), eventNames (ref), topBarModule (ref), momentOverlayInsetContextModule (ref), fFlagMomentsFeedAboveNavBarModule (ref), view (ref), constantsModule (ref), fFlagMomentsUseCompositionLibraryModule (ref), momentsFeedSurfaceModule (ref), momentUnavailableDialogModule (ref), creationFlowScreen (ref), FTUXEducationScreenModule (ref)
	local var3, var4 = reactModule.useState(function()
		-- upvalues: momentsLocalStorageModule (copy), momentsLocalStorageKeysModule (copy)
		return not momentsLocalStorageModule.getField(momentsLocalStorageKeysModule.CreateTooltipSeen)
	end)
	local var5, var6 = reactModule.useState(false)
	local var7 = reactModule.useRef(nil)
	local var8 = reactModule.useRef(nil)
	local var9 = useScreenBottomInsetModule()
	local var10 = useFeedPlaybackActiveModule()
	local var11 = true
	local var12 = false
	
	if fFlagMomentsNavigationEventModule then
		var11 = useMomentsTabIsVisibleModule()
		var12 = signalsReactModule.useSignalState(getMomentsPreferencesStoreModule(false).getIsTeleporting)
	end
	local var13 = useMomentsSession()
	local openOwnMoments = useMomentsHost().openOwnMoments
	local var14 = if fFlagMomentsUseFoundationHeaderBarModule then useMomentsGating() else nil
	local var15 = var14 ~= nil or var14.isFlyoutEntryEnabled and var14.platformIntegrationEnabled
	local var16 = useCreationEntryModule()
	local var17 = useUploadHostModule({
		onExit = var16.onExitCreation,
		captureSource = var16.captureSource
	})
	reactModule.useEffect(function()
		-- upvalues: sessionManager (copy), funnelEventNames (copy), fireFunnelAnalyticsEvent (copy)
		fireFunnelAnalyticsEvent(funnelEventNames.FunnelTypes.AppNavigation, funnelEventNames.AppNavigationSteps.TrendingScreenView, sessionManager.getSessionId(funnelEventNames.FunnelTypes.AppNavigation) or sessionManager.startSession(funnelEventNames.FunnelTypes.AppNavigation))
	end, {})
	local var18 = reactModule.useCallback(function()
		-- upvalues: var6 (ref)
		var6(true)
	end, {})
	local var19 = reactModule.useMemo(function()
		-- upvalues: isStudioModule (copy), getFFlagArgusStudioMockFeedModule (copy), createMockFeedSource (copy), createMomentsFeedSourceModule (copy), var13 (ref), var1 (copy), var18 (ref)
		return if isStudioModule() and getFFlagArgusStudioMockFeedModule() then createMockFeedSource() else createMomentsFeedSourceModule(var13.getMomentsSessionId, {
			signalTracker = var1,
			onDeepLinkedMomentUnavailable = var18
		})
	end, { var13, var18 })
	local var20 = reactModule.useMemo(function()
		-- upvalues: fFlagEnableArgus (copy), createRecommendationTelemetry (copy), var13 (ref), var1 (copy)
		return if fFlagEnableArgus then createRecommendationTelemetry({
			getMomentsSessionId = var13.getMomentsSessionId,
			signalTracker = var1
		}) else nil
	end, { var13 })
	local getCovering = fFlagEnableReportingFlowForMomentsFeed and signalsReactModule.useSignalState(reportModalCovering.getCovering)
	local var21 = not var16.isCreating and (not signalsReactModule.useSignalState(getImmersiveChromeStoreModule(false).getOverlayCovering) and (not var5 and not getCovering))
	
	if fFlagMomentsFixRecommendationImpressionLifecycleModule then
		var21 = var21 and var10
	end
	local var22 = var10 and (not var16.isCreating and (not var5 and not getCovering))
	local var23 = if fFlagMomentsNavigationEventModule then if var12 then navigationDestinationTypeModule.ExperienceJoin elseif var16.isCreating then navigationDestinationTypeModule.Create elseif getCovering then navigationDestinationTypeModule.Report elseif not var11 then navigationDestinationTypeModule.Exit else nil else nil
	local var24 = reactModule.useCallback(function(p2)
		-- upvalues: var7 (ref)
		local current = var7.current
		
		if current ~= nil then
			current.refresh(p2)
		end
	end, {})
	local var25 = reactModule.useCallback(function(p2)
		-- upvalues: var7 (ref)
		local current = var7.current
		
		if current ~= nil then
			current.flushView(p2)
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: fFlagMomentsFlushDwellBeforeNavigationModule (copy), p1 (ref), roactNavigationModule (copy), var25 (ref)
		if fFlagMomentsFlushDwellBeforeNavigationModule and p1.navigation.addListener ~= nil then
			local var26 = p1.navigation.addListener(roactNavigationModule.Events.WillBlur, function()
				-- upvalues: var25 (copy)
				var25()
			end)
			
			return function()
				-- upvalues: var26 (ref)
				var26.remove()
			end
		end
		return nil
	end, { p1.navigation, var25 })
	reactModule.useEffect(function()
		-- upvalues: robloxAppEventsModule (copy), appPage (copy), var24 (ref)
		local reloadPageConnection = robloxAppEventsModule.ReloadPage:connect(function(p2)
			-- upvalues: appPage (copy), var24 (copy)
			if p2 == appPage.Moments then
				var24()
			end
		end)
		
		return function()
			-- upvalues: reloadPageConnection (ref)
			reloadPageConnection:disconnect()
		end
	end, { var24 })
	local var26 = getUploadStoreModule(false)
	local var27 = signalsReactModule.useSignalState(var26.getState)
	local var28 = signalsReactModule.useSignalState(var26.getUploadedMoment)
	reactModule.useEffect(function()
		-- upvalues: var27 (ref), var8 (ref), var7 (ref), var28 (ref), var2 (copy), parent (copy), var24 (ref)
		if var27 ~= "Success" then
			var8.current = var27
			
			return
		elseif var8.current ~= "Success" then
			var8.current = var27
			local current = var7.current
			
			if type(var28) == "table" and var28.momentId ~= nil and current ~= nil then
				if var2 == nil then
					var2 = require(parent.Loggers).Logger:new("Moments.Upload")
				end
				var2:debug("event=feed_prepend_uploaded momentId={} assetId={}", var28.momentId, tostring(var28.assetId))
				current.prependMoment(var28)
				
				return
			elseif var2 == nil then
				var2 = require(parent.Loggers).Logger:new("Moments.Upload")
			end
			var2:debug("event=feed_refresh_after_upload uploadedMoment={} hasController={}", tostring(var28), tostring(current ~= nil))
			var24()
		end
	end, { var27, var28, var24 })
	local var29 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), momentsLocalStorageModule (copy), momentsLocalStorageKeysModule (copy)
		var4(false)
		momentsLocalStorageModule.setField(momentsLocalStorageKeysModule.CreateTooltipSeen, true)
	end, {})
	local var30 = reactModule.useCallback(function()
		-- upvalues: logCreateIntentModule (copy), funnelEventNames (copy), var16 (ref)
		logCreateIntentModule(funnelEventNames.CreationIntentSource.TopBar)
		var16.onCreatePressed()
	end, { var16.onCreatePressed })
	local var31 = reactModule.useCallback(function()
		-- upvalues: fireAnalyticsEvent (copy), eventNames (copy), var24 (ref), fFlagMomentsNavigationEventModule (copy), navigationDestinationTypeModule (copy)
		fireAnalyticsEvent(eventNames.FeedHomeButtonPressed)
		var24(if fFlagMomentsNavigationEventModule then navigationDestinationTypeModule.Trending else nil)
	end, { var24 })
	local var32 = reactModule.useCallback(function()
		-- upvalues: fireAnalyticsEvent (copy), eventNames (copy), openOwnMoments (ref), fFlagMomentsFlushDwellBeforeNavigationModule (copy), var25 (ref), fFlagMomentsNavigationEventModule (copy), navigationDestinationTypeModule (copy)
		fireAnalyticsEvent(eventNames.MyCreationButtonPressed)
		
		if openOwnMoments ~= nil then
			if fFlagMomentsFlushDwellBeforeNavigationModule then
				var25(if fFlagMomentsNavigationEventModule then navigationDestinationTypeModule.MyMoments else nil)
			end
			openOwnMoments()
		end
	end, { openOwnMoments, var25 })
	
	return reactModule.createElement(view, { tag = "size-full bg-surface-0" }, {
		Surface = reactModule.createElement(momentsFeedSurfaceModule, {
			trackSurfaceLoad = true,
			source = var19,
			active = var21,
			playbackActive = var22,
			telemetry = var20,
			inactiveDestination = var23,
			controllerRef = var7,
			header = reactModule.useMemo(function()
				-- upvalues: reactModule (copy), topBarModule (copy), var3 (ref), var10 (ref), var15 (ref), var29 (ref), var30 (ref), var31 (ref), var32 (ref)
				return reactModule.createElement(topBarModule, {
					isBaseScreen = true,
					showTopScrim = true,
					showFtuxTooltip = var3 and var10,
					showHamburger = var15,
					onFtuxTooltipDismissed = var29,
					onCreatePressed = var30,
					onNavigateToTrending = var31,
					onNavigateToMyMoments = var32
				})
			end, {
				var3, var10, var15, var29, var30, var31, var32
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
		CreationFlowOverlay = if var16.isCreating then reactModule.createElement(view, {
			tag = "size-full",
			ZIndex = constantsModule.DisplayOrder.Modals
		}, {
			Screen = reactModule.createElement(creationFlowScreen, { host = var17 })
		}) else nil,
		FtuxOverlay = if var16.showFtux then reactModule.createElement(view, {
			tag = "size-full",
			ZIndex = constantsModule.DisplayOrder.Modals
		}, {
			Screen = reactModule.createElement(FTUXEducationScreenModule, { onClose = var16.onExitFtux })
		}) else nil
	})
end