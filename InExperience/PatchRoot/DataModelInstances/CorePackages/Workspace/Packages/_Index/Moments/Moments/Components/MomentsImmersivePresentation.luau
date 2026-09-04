local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local navigationModule = require(parent.Navigation)
local roactNavigationModule = require(parent.RoactNavigation)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsReactModule = require(parent.SignalsReact)
local momentsCommonModule = require(parent.MomentsCommon)
local isStudioModule = require(parent.MomentsCommon.isStudio)
local constantsModule = require(moments.Constants)
local immersiveFeedKind = constantsModule.ImmersiveFeedKind
local momentsHostShellModule = require(moments.Components.MomentsHostShell)
local momentsFeedSurfaceModule = require(moments.Components.MomentsFeedSurface)
local momentsBackHeaderModule = require(moments.Components.MomentsBackHeader)
local creationFlowScreen = require(parent.MomentsCreation).CreationFlowScreen
local FTUXEducationScreenModule = require(moments.Components.FTUXEducationScreen)
local feedModule = require(moments.Components.Feed)
local momentPushedFeedSafeAreaContextModule = require(moments.Components.Feed.Items.Moment.MomentPushedFeedSafeAreaContext)
local createMomentsStoreModule = require(moments.Stores.GetMomentsStore.createMomentsStore)
local createMomentsFeedSourceModule = require(moments.Stores.GetMomentsStore.createMomentsFeedSource)
local getDeepLinkStoreModule = require(moments.Stores.GetDeepLinkStore)
local createUserMomentsFeedSourceModule = require(moments.Stores.GetMomentsStore.createUserMomentsFeedSource)
local getMomentsPreferencesStoreModule = require(moments.Stores.GetMomentsPreferencesStore)
local useCreationEntryModule = require(moments.Hooks.useCreationEntry)
local useUploadHostModule = require(moments.Hooks.useUploadHost)
local logCreateIntentModule = require(moments.Analytics.logCreateIntent)
local logMomentsLayerExposureModule = require(moments.Utils.logMomentsLayerExposure)
local fFlagMomentsFlushDwellBeforeNavigationModule = require(moments.Flags.FFlagMomentsFlushDwellBeforeNavigation)
local fFlagMomentsFlyoutCreateButtonModule = require(moments.Flags.FFlagMomentsFlyoutCreateButton)
local fStringMomentsExperienceJoinActionTextIxpLayerModule = require(moments.Flags.FStringMomentsExperienceJoinActionTextIxpLayer)
local getFFlagArgusStudioMockFeedModule = require(moments.Flags.GetFFlagArgusStudioMockFeed)
local getFFlagMomentsPushedFeedSafeAreaModule = require(moments.Flags.GetFFlagMomentsPushedFeedSafeArea)
local createSignalTracker = require(moments.SignalTracker).createSignalTracker
local view = foundationModule.View
local useNavigationFocus = navigationModule.useNavigationFocus
local useNavigation = navigationModule.useNavigation
local useSignalState = signalsReactModule.useSignalState
local fFlagEnableArgus = sharedFlagsModule.FFlagEnableArgus
local fFlagEnableReportingFlowForMomentsFeed = sharedFlagsModule.FFlagEnableReportingFlowForMomentsFeed
local fFlagMomentsPassFeedItemIdToBackendApis = sharedFlagsModule.FFlagMomentsPassFeedItemIdToBackendApis
local fFlagMomentsRealtimeSessionTelemetry = momentsCommonModule.Flags.FFlagMomentsRealtimeSessionTelemetry
local fFlagMomentsSessionHeartbeat = momentsCommonModule.Flags.FFlagMomentsSessionHeartbeat
local analytics = momentsCommonModule.Analytics
local eventNames = analytics.EventNames
local funnelEventNames = analytics.FunnelEventNames
local fireAnalyticsEvent = analytics.fireAnalyticsEvent
local feedPlaybackSuspension = momentsCommonModule.Media.feedPlaybackSuspension
local reportModalCovering = momentsCommonModule.Media.reportModalCovering
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local createRecommendationTelemetry = feedModule.createRecommendationTelemetry
local createMockFeedSource = feedModule.createMockFeedSource

local function PushedFeedSafeAreaProvider(p1)
	-- upvalues: useDeviceInsets (ref), reactModule (ref), momentPushedFeedSafeAreaContextModule (ref)
	return reactModule.createElement(momentPushedFeedSafeAreaContextModule.Context.Provider, { value = useDeviceInsets() }, { Content = p1.children })
end

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), createMomentsStoreModule (ref), fFlagEnableArgus (ref), createSignalTracker (ref), fFlagMomentsFlyoutCreateButtonModule (ref), useCreationEntryModule (ref), useUploadHostModule (ref), logCreateIntentModule (ref), funnelEventNames (ref), immersiveFeedKind (ref), getDeepLinkStoreModule (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), createUserMomentsFeedSourceModule (ref), isStudioModule (ref), getFFlagArgusStudioMockFeedModule (ref), createMockFeedSource (ref), createMomentsFeedSourceModule (ref), createRecommendationTelemetry (ref), logMomentsLayerExposureModule (ref), fStringMomentsExperienceJoinActionTextIxpLayerModule (ref), fireAnalyticsEvent (ref), eventNames (ref), fFlagMomentsRealtimeSessionTelemetry (ref), analytics (ref), fFlagMomentsSessionHeartbeat (ref), useNavigationFocus (ref), useSignalState (ref), feedPlaybackSuspension (ref), getMomentsPreferencesStoreModule (ref), reportModalCovering (ref), fFlagEnableReportingFlowForMomentsFeed (ref), fFlagMomentsFlushDwellBeforeNavigationModule (ref), useNavigation (ref), roactNavigationModule (ref), momentsBackHeaderModule (ref), momentsFeedSurfaceModule (ref), getFFlagMomentsPushedFeedSafeAreaModule (ref), PushedFeedSafeAreaProvider (ref), view (ref), constantsModule (ref), creationFlowScreen (ref), FTUXEducationScreenModule (ref), momentsHostShellModule (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useRef(nil)
	
	if var2.current == nil then
		var2.current = createMomentsStoreModule()
	end
	local current = var2.current
	local var3 = reactModule.useRef(nil)
	
	if var3.current == nil and fFlagEnableArgus then
		var3.current = createSignalTracker()
	end
	local current_1 = var3.current
	local feedKind = p1.feedKind
	local targetUserId = p1.targetUserId
	local initialIndex = p1.initialIndex
	local var4 = nil
	local var5 = nil
	
	if fFlagMomentsFlyoutCreateButtonModule then
		var4 = useCreationEntryModule({ manageTabBarVisibility = false })
		var5 = useUploadHostModule({
			onExit = var4.onExitCreation,
			captureSource = var4.captureSource
		})
	end
	local var6 = if var4 ~= nil then nil else var4.onCreatePressed
	local var7 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), logCreateIntentModule (copy), funnelEventNames (copy)
		if var6 ~= nil then
			logCreateIntentModule(funnelEventNames.CreationIntentSource.TopBar)
			var6()
		end
	end, { var6 })
	local var8 = fFlagMomentsFlyoutCreateButtonModule and feedKind == immersiveFeedKind.Trending
	local var9 = var8 and (var4 ~= nil and var4.isCreating)
	local var10 = var8 and (var4 ~= nil and var4.showFtux)
	local deepLinkedMomentId = p1.deepLinkedMomentId
	local deepLinkedMomentTargetIdType = p1.deepLinkedMomentTargetIdType
	local var11 = reactModule.useRef(nil)
	
	if deepLinkedMomentId ~= nil then
		local var12 = `{deepLinkedMomentId}:{tostring(deepLinkedMomentTargetIdType)}`
		
		if var11.current ~= var12 then
			local var13 = getDeepLinkStoreModule()
			
			if fFlagMomentsPassFeedItemIdToBackendApis then
				var13.setDeepLinkedMoment(deepLinkedMomentId, deepLinkedMomentTargetIdType)
			else
				var13.setDeepLinkedMomentId(deepLinkedMomentId)
			end
			var11.current = var12
		end
	end
	local var14 = reactModule.useMemo(function()
		-- upvalues: feedKind (ref), immersiveFeedKind (copy), createUserMomentsFeedSourceModule (copy), targetUserId (ref), initialIndex (ref), isStudioModule (copy), getFFlagArgusStudioMockFeedModule (copy), createMockFeedSource (copy), createMomentsFeedSourceModule (copy), current (ref), current_1 (ref)
		return if feedKind == immersiveFeedKind.User then createUserMomentsFeedSourceModule(targetUserId or 0, { initialIndex = initialIndex }) elseif isStudioModule() and getFFlagArgusStudioMockFeedModule() then createMockFeedSource() else createMomentsFeedSourceModule(current.getMomentsSessionId, { signalTracker = current_1 })
	end, {
		feedKind,
		targetUserId,
		initialIndex,
		current,
		current_1
	})
	local var15 = reactModule.useMemo(function()
		-- upvalues: feedKind (ref), immersiveFeedKind (copy), fFlagEnableArgus (copy), createRecommendationTelemetry (copy), current (ref), current_1 (ref)
		return if feedKind == immersiveFeedKind.Trending and fFlagEnableArgus then createRecommendationTelemetry({
			getMomentsSessionId = current.getMomentsSessionId,
			signalTracker = current_1
		}) else nil
	end, { feedKind, current, current_1 })
	local sessionSource = p1.sessionSource
	reactModule.useEffect(function()
		-- upvalues: current (ref), sessionSource (ref), logMomentsLayerExposureModule (copy), fStringMomentsExperienceJoinActionTextIxpLayerModule (copy), fireAnalyticsEvent (copy), eventNames (copy), fFlagMomentsRealtimeSessionTelemetry (copy), analytics (copy), fFlagMomentsSessionHeartbeat (copy)
		current.setSessionSource(sessionSource)
		logMomentsLayerExposureModule(fStringMomentsExperienceJoinActionTextIxpLayerModule)
		fireAnalyticsEvent(eventNames.TapMomentsTab, {
			moments_session_id = current.getMomentsSessionId(false),
			source = sessionSource
		})
		
		if fFlagMomentsRealtimeSessionTelemetry then
			analytics.reportMomentsSessionStarted(sessionSource)
		end
		local var16 = if fFlagMomentsSessionHeartbeat then analytics.createMomentsSessionHeartbeat() else nil
		
		if var16 ~= nil then
			var16.start(sessionSource)
		end
		return function()
			-- upvalues: var16 (ref), current (copy), fireAnalyticsEvent (copy), eventNames (copy), sessionSource (copy), fFlagMomentsRealtimeSessionTelemetry (copy), analytics (copy)
			if var16 ~= nil then
				var16.stop()
			end
			fireAnalyticsEvent(eventNames.MomentsSessionEnded, {
				moments_session_id = current.getMomentsSessionId(false),
				source = sessionSource,
				duration_seconds = tostring(math.floor(os.clock() - current.getSessionStartTime(false)))
			})
			
			if fFlagMomentsRealtimeSessionTelemetry then
				analytics.reportMomentsSessionEnded(sessionSource)
			end
		end
	end, { sessionSource, current })
	local var16 = useNavigationFocus()
	local getCovering = fFlagEnableReportingFlowForMomentsFeed and useSignalState(reportModalCovering.getCovering)
	local var17 = var16 and (not useSignalState(feedPlaybackSuspension.getSuspended) and (not useSignalState(getMomentsPreferencesStoreModule(false).getIsTeleporting) and (not getCovering and not var9)))
	local var18 = reactModule.useCallback(function()
		-- upvalues: var1 (ref)
		local current = var1.current
		
		if current ~= nil then
			current.flushView()
		end
	end, {})
	local var19 = if fFlagMomentsFlushDwellBeforeNavigationModule then useNavigation() else nil
	reactModule.useEffect(function()
		-- upvalues: fFlagMomentsFlushDwellBeforeNavigationModule (copy), var19 (write), roactNavigationModule (copy), var18 (ref)
		if fFlagMomentsFlushDwellBeforeNavigationModule and var19 ~= nil and var19.addListener ~= nil then
			local var20 = var19.addListener(roactNavigationModule.Events.WillBlur, function()
				-- upvalues: var18 (copy)
				var18()
			end)
			
			return function()
				-- upvalues: var20 (ref)
				var20.remove()
			end
		end
		return nil
	end, { var19, var18 })
	local onBack = p1.onBack
	local var20 = reactModule.useCallback(function()
		-- upvalues: fFlagMomentsFlushDwellBeforeNavigationModule (copy), var18 (ref), onBack (ref)
		if fFlagMomentsFlushDwellBeforeNavigationModule then
			var18()
		end
		onBack()
	end, { onBack, var18 })
	local var21 = reactModule.createElement(momentsFeedSurfaceModule, {
		source = var14,
		telemetry = var15,
		active = var16 and (not getCovering and not var9),
		playbackActive = var17,
		initialIndex = initialIndex,
		header = reactModule.useMemo(function()
			-- upvalues: reactModule (copy), momentsBackHeaderModule (copy), var20 (ref), var8 (ref), var7 (ref)
			return reactModule.createElement(momentsBackHeaderModule, {
				onBack = var20,
				onCreatePressed = if var8 then var7 else nil
			})
		end, { var20, var8, var7 }),
		controllerRef = var1
	})
	local var22 = if getFFlagMomentsPushedFeedSafeAreaModule() then reactModule.createElement(PushedFeedSafeAreaProvider, nil, var21) else var21
	
	return reactModule.createElement(momentsHostShellModule, {
		sessionStore = current,
		openProfile = p1.openProfile,
		openOwnMoments = p1.openOwnMoments,
		openMomentsFeedReport = p1.openMomentsFeedReport
	}, if var8 then reactModule.createElement(view, { tag = "size-full bg-surface-0" }, {
		Feed = var22,
		CreationFlowOverlay = if var9 then reactModule.createElement(view, {
			tag = "size-full",
			ZIndex = constantsModule.DisplayOrder.Modals
		}, {
			Screen = reactModule.createElement(creationFlowScreen, { host = var5 })
		}) else nil,
		FtuxOverlay = if var10 then reactModule.createElement(view, {
			tag = "size-full",
			ZIndex = constantsModule.DisplayOrder.Modals
		}, {
			Screen = reactModule.createElement(FTUXEducationScreenModule, { onClose = var4.onExitFtux })
		}) else nil
	}) else var22)
end)