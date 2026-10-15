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
local fFlagMomentsUseFoundationHeaderBarModule = require(moments.Flags.FFlagMomentsUseFoundationHeaderBar)
local getImmersiveChromeStoreModule = require(moments.Stores.GetImmersiveChromeStore)
local momentsLocalStorageModule = require(parent.MomentsCommon.MomentsLocalStorage)
local momentsLocalStorageKeysModule = require(parent.MomentsCommon.MomentsLocalStorageKeys)
local useMomentsSession = require(moments.Stores.GetMomentsStore.MomentsSessionContext).useMomentsSession
local createMomentsFeedSourceModule = require(moments.Stores.GetMomentsStore.createMomentsFeedSource)
local createSignalTracker = require(moments.SignalTracker).createSignalTracker
local fFlagEnableArgus = require(parent.SharedFlags).FFlagEnableArgus
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
	-- upvalues: reactModule (ref), momentsLocalStorageModule (ref), momentsLocalStorageKeysModule (ref), useScreenBottomInsetModule (ref), useFeedPlaybackActiveModule (ref), fFlagMomentsNavigationEventModule (ref), useMomentsTabIsVisibleModule (ref), signalsReactModule (ref), getMomentsPreferencesStoreModule (ref), useMomentsSession (ref), useMomentsHost (ref), fFlagMomentsUseFoundationHeaderBarModule (ref), useMomentsGating (ref), useCreationEntryModule (ref), useUploadHostModule (ref), sessionManager (ref), funnelEventNames (ref), fireFunnelAnalyticsEvent (ref), isStudioModule (ref), getFFlagArgusStudioMockFeedModule (ref), createMockFeedSource (ref), createMomentsFeedSourceModule (ref), var1 (ref), fFlagEnableArgus (ref), createRecommendationTelemetry (ref), fFlagMomentsImmersiveChromeModule (ref), getImmersiveChromeStoreModule (ref), reportModalCovering (ref), fFlagMomentsFixRecommendationImpressionLifecycleModule (ref), navigationDestinationTypeModule (ref), fFlagMomentsFlushDwellBeforeNavigationModule (ref), roactNavigationModule (ref), robloxAppEventsModule (ref), appPage (ref), getUploadStoreModule (ref), var2 (write), parent (ref), logCreateIntentModule (ref), fireAnalyticsEvent (ref), eventNames (ref), topBarModule (ref), momentOverlayInsetContextModule (ref), fFlagMomentsFeedAboveNavBarModule (ref), view (ref), constantsModule (ref), momentsFeedSurfaceModule (ref), momentUnavailableDialogModule (ref), creationFlowScreen (ref), FTUXEducationScreenModule (ref)
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
	local var21 = signalsReactModule.useSignalState(reportModalCovering.getCovering)
	local var22 = not var16.isCreating and (not signalsReactModule.useSignalState(getImmersiveChromeStoreModule(false).getOverlayCovering) and (not var5 and not var21))
	
	if fFlagMomentsFixRecommendationImpressionLifecycleModule then
		var22 = var22 and var10
	end
	local var23 = var10 and (not var16.isCreating and (not var5 and not var21))
	local var24 = if fFlagMomentsNavigationEventModule then if var12 then navigationDestinationTypeModule.ExperienceJoin elseif var16.isCreating then navigationDestinationTypeModule.Create elseif var21 then navigationDestinationTypeModule.Report elseif not var11 then navigationDestinationTypeModule.Exit else nil else nil
	local var25 = reactModule.useCallback(function(p2)
		-- upvalues: var7 (ref)
		local current = var7.current
		
		if current ~= nil then
			current.refresh(p2)
		end
	end, {})
	local var26 = reactModule.useCallback(function(p2)
		-- upvalues: var7 (ref)
		local current = var7.current
		
		if current ~= nil then
			current.flushView(p2)
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: fFlagMomentsFlushDwellBeforeNavigationModule (copy), p1 (ref), roactNavigationModule (copy), var26 (ref)
		if fFlagMomentsFlushDwellBeforeNavigationModule and p1.navigation.addListener ~= nil then
			local var27 = p1.navigation.addListener(roactNavigationModule.Events.WillBlur, function()
				-- upvalues: var26 (copy)
				var26()
			end)
			
			return function()
				-- upvalues: var27 (ref)
				var27.remove()
			end
		end
		return nil
	end, { p1.navigation, var26 })
	reactModule.useEffect(function()
		-- upvalues: robloxAppEventsModule (copy), appPage (copy), var25 (ref)
		local reloadPageConnection = robloxAppEventsModule.ReloadPage:connect(function(p2)
			-- upvalues: appPage (copy), var25 (copy)
			if p2 == appPage.Moments then
				var25()
			end
		end)
		
		return function()
			-- upvalues: reloadPageConnection (ref)
			reloadPageConnection:disconnect()
		end
	end, { var25 })
	local var27 = getUploadStoreModule(false)
	local var28 = signalsReactModule.useSignalState(var27.getState)
	local var29 = signalsReactModule.useSignalState(var27.getUploadedMoment)
	reactModule.useEffect(function()
		-- upvalues: var28 (ref), var8 (ref), var7 (ref), var29 (ref), var2 (copy), parent (copy), var25 (ref)
		if var28 ~= "Success" then
			var8.current = var28
			
			return
		elseif var8.current ~= "Success" then
			var8.current = var28
			local current = var7.current
			
			if type(var29) == "table" and var29.momentId ~= nil and current ~= nil then
				if var2 == nil then
					var2 = require(parent.Loggers).Logger:new("Moments.Upload")
				end
				var2:debug("event=feed_prepend_uploaded momentId={} assetId={}", var29.momentId, tostring(var29.assetId))
				current.prependMoment(var29)
				
				return
			elseif var2 == nil then
				var2 = require(parent.Loggers).Logger:new("Moments.Upload")
			end
			var2:debug("event=feed_refresh_after_upload uploadedMoment={} hasController={}", tostring(var29), tostring(current ~= nil))
			var25()
		end
	end, { var28, var29, var25 })
	local var30 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), momentsLocalStorageModule (copy), momentsLocalStorageKeysModule (copy)
		var4(false)
		momentsLocalStorageModule.setField(momentsLocalStorageKeysModule.CreateTooltipSeen, true)
	end, {})
	local var31 = reactModule.useCallback(function()
		-- upvalues: logCreateIntentModule (copy), funnelEventNames (copy), var16 (ref)
		logCreateIntentModule(funnelEventNames.CreationIntentSource.TopBar)
		var16.onCreatePressed()
	end, { var16.onCreatePressed })
	local var32 = reactModule.useCallback(function()
		-- upvalues: fireAnalyticsEvent (copy), eventNames (copy), var25 (ref), fFlagMomentsNavigationEventModule (copy), navigationDestinationTypeModule (copy)
		fireAnalyticsEvent(eventNames.FeedHomeButtonPressed)
		var25(if fFlagMomentsNavigationEventModule then navigationDestinationTypeModule.Trending else nil)
	end, { var25 })
	local var33 = reactModule.useCallback(function()
		-- upvalues: fireAnalyticsEvent (copy), eventNames (copy), openOwnMoments (ref), fFlagMomentsFlushDwellBeforeNavigationModule (copy), var26 (ref), fFlagMomentsNavigationEventModule (copy), navigationDestinationTypeModule (copy)
		fireAnalyticsEvent(eventNames.MyCreationButtonPressed)
		
		if openOwnMoments ~= nil then
			if fFlagMomentsFlushDwellBeforeNavigationModule then
				var26(if fFlagMomentsNavigationEventModule then navigationDestinationTypeModule.MyMoments else nil)
			end
			openOwnMoments()
		end
	end, { openOwnMoments, var26 })
	
	return reactModule.createElement(view, { tag = "size-full bg-surface-0" }, {
		Surface = reactModule.createElement(momentsFeedSurfaceModule, {
			trackSurfaceLoad = true,
			source = var19,
			active = var22,
			playbackActive = var23,
			telemetry = var20,
			inactiveDestination = var24,
			controllerRef = var7,
			header = reactModule.useMemo(function()
				-- upvalues: reactModule (copy), topBarModule (copy), var3 (ref), var10 (ref), var15 (ref), var30 (ref), var31 (ref), var32 (ref), var33 (ref)
				return reactModule.createElement(topBarModule, {
					isBaseScreen = true,
					showTopScrim = true,
					showFtuxTooltip = var3 and var10,
					showHamburger = var15,
					onFtuxTooltipDismissed = var30,
					onCreatePressed = var31,
					onNavigateToTrending = var32,
					onNavigateToMyMoments = var33
				})
			end, {
				var3, var10, var15, var30, var31, var32, var33
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