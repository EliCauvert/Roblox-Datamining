local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local navigationModule = require(parent.Navigation)
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
local fFlagMomentsFlyoutCreateButtonModule = require(moments.Flags.FFlagMomentsFlyoutCreateButton)
local getFFlagArgusStudioMockFeedModule = require(moments.Flags.GetFFlagArgusStudioMockFeed)
local getFFlagMomentsPushedFeedSafeAreaModule = require(moments.Flags.GetFFlagMomentsPushedFeedSafeArea)
local createSignalTracker = require(moments.SignalTracker).createSignalTracker
local view = foundationModule.View
local useNavigationFocus = navigationModule.useNavigationFocus
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
	-- upvalues: reactModule (ref), createMomentsStoreModule (ref), fFlagEnableArgus (ref), createSignalTracker (ref), fFlagMomentsFlyoutCreateButtonModule (ref), useCreationEntryModule (ref), useUploadHostModule (ref), logCreateIntentModule (ref), funnelEventNames (ref), immersiveFeedKind (ref), getDeepLinkStoreModule (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), createUserMomentsFeedSourceModule (ref), isStudioModule (ref), getFFlagArgusStudioMockFeedModule (ref), createMockFeedSource (ref), createMomentsFeedSourceModule (ref), createRecommendationTelemetry (ref), fireAnalyticsEvent (ref), eventNames (ref), fFlagMomentsRealtimeSessionTelemetry (ref), analytics (ref), fFlagMomentsSessionHeartbeat (ref), useNavigationFocus (ref), useSignalState (ref), feedPlaybackSuspension (ref), getMomentsPreferencesStoreModule (ref), reportModalCovering (ref), fFlagEnableReportingFlowForMomentsFeed (ref), momentsBackHeaderModule (ref), momentsFeedSurfaceModule (ref), getFFlagMomentsPushedFeedSafeAreaModule (ref), PushedFeedSafeAreaProvider (ref), view (ref), constantsModule (ref), creationFlowScreen (ref), FTUXEducationScreenModule (ref), momentsHostShellModule (ref)
	local var1 = reactModule.useRef(nil)
	
	if var1.current == nil then
		var1.current = createMomentsStoreModule()
	end
	local current = var1.current
	local var2 = reactModule.useRef(nil)
	
	if var2.current == nil and fFlagEnableArgus then
		var2.current = createSignalTracker()
	end
	local current_1 = var2.current
	local feedKind = p1.feedKind
	local targetUserId = p1.targetUserId
	local initialIndex = p1.initialIndex
	local var3 = nil
	local var4 = nil
	
	if fFlagMomentsFlyoutCreateButtonModule then
		var3 = useCreationEntryModule({ manageTabBarVisibility = false })
		var4 = useUploadHostModule({
			onExit = var3.onExitCreation,
			captureSource = var3.captureSource
		})
	end
	local var5 = if var3 ~= nil then nil else var3.onCreatePressed
	local var6 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), logCreateIntentModule (copy), funnelEventNames (copy)
		if var5 ~= nil then
			logCreateIntentModule(funnelEventNames.CreationIntentSource.TopBar)
			var5()
		end
	end, { var5 })
	local var7 = fFlagMomentsFlyoutCreateButtonModule and feedKind == immersiveFeedKind.Trending
	local var8 = var7 and (var3 ~= nil and var3.isCreating)
	local var9 = var7 and (var3 ~= nil and var3.showFtux)
	local deepLinkedMomentId = p1.deepLinkedMomentId
	local deepLinkedMomentTargetIdType = p1.deepLinkedMomentTargetIdType
	local var10 = reactModule.useRef(nil)
	
	if deepLinkedMomentId ~= nil then
		local var11 = `{deepLinkedMomentId}:{tostring(deepLinkedMomentTargetIdType)}`
		
		if var10.current ~= var11 then
			local var12 = getDeepLinkStoreModule()
			
			if fFlagMomentsPassFeedItemIdToBackendApis then
				var12.setDeepLinkedMoment(deepLinkedMomentId, deepLinkedMomentTargetIdType)
			else
				var12.setDeepLinkedMomentId(deepLinkedMomentId)
			end
			var10.current = var11
		end
	end
	local var13 = reactModule.useMemo(function()
		-- upvalues: feedKind (ref), immersiveFeedKind (copy), createUserMomentsFeedSourceModule (copy), targetUserId (ref), initialIndex (ref), isStudioModule (copy), getFFlagArgusStudioMockFeedModule (copy), createMockFeedSource (copy), createMomentsFeedSourceModule (copy), current (ref), current_1 (ref)
		return if feedKind == immersiveFeedKind.User then createUserMomentsFeedSourceModule(targetUserId or 0, { initialIndex = initialIndex }) elseif isStudioModule() and getFFlagArgusStudioMockFeedModule() then createMockFeedSource() else createMomentsFeedSourceModule(current.getMomentsSessionId, { signalTracker = current_1 })
	end, {
		feedKind,
		targetUserId,
		initialIndex,
		current,
		current_1
	})
	local var14 = reactModule.useMemo(function()
		-- upvalues: feedKind (ref), immersiveFeedKind (copy), fFlagEnableArgus (copy), createRecommendationTelemetry (copy), current (ref), current_1 (ref)
		return if feedKind == immersiveFeedKind.Trending and fFlagEnableArgus then createRecommendationTelemetry({
			getMomentsSessionId = current.getMomentsSessionId,
			signalTracker = current_1
		}) else nil
	end, { feedKind, current, current_1 })
	local sessionSource = p1.sessionSource
	reactModule.useEffect(function()
		-- upvalues: current (ref), sessionSource (ref), fireAnalyticsEvent (copy), eventNames (copy), fFlagMomentsRealtimeSessionTelemetry (copy), analytics (copy), fFlagMomentsSessionHeartbeat (copy)
		current.setSessionSource(sessionSource)
		fireAnalyticsEvent(eventNames.TapMomentsTab, {
			moments_session_id = current.getMomentsSessionId(false),
			source = sessionSource
		})
		
		if fFlagMomentsRealtimeSessionTelemetry then
			analytics.reportMomentsSessionStarted(sessionSource)
		end
		local var15 = if fFlagMomentsSessionHeartbeat then analytics.createMomentsSessionHeartbeat() else nil
		
		if var15 ~= nil then
			var15.start(sessionSource)
		end
		return function()
			-- upvalues: var15 (ref), current (copy), fireAnalyticsEvent (copy), eventNames (copy), sessionSource (copy), fFlagMomentsRealtimeSessionTelemetry (copy), analytics (copy)
			if var15 ~= nil then
				var15.stop()
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
	local var15 = useNavigationFocus()
	local var16 = useSignalState(feedPlaybackSuspension.getSuspended)
	local var17 = useSignalState(getMomentsPreferencesStoreModule(false).getIsTeleporting)
	local getCovering = fFlagEnableReportingFlowForMomentsFeed and useSignalState(reportModalCovering.getCovering)
	local onBack = p1.onBack
	local var18 = reactModule.createElement(momentsFeedSurfaceModule, {
		source = var13,
		telemetry = var14,
		active = var15 and (not getCovering and not var8),
		playbackActive = var15 and (not var16 and (not var17 and (not getCovering and not var8))),
		initialIndex = initialIndex,
		header = reactModule.useMemo(function()
			-- upvalues: reactModule (copy), momentsBackHeaderModule (copy), onBack (ref), var7 (ref), var6 (ref)
			return reactModule.createElement(momentsBackHeaderModule, {
				onBack = onBack,
				onCreatePressed = if var7 then var6 else nil
			})
		end, { onBack, var7, var6 })
	})
	local var19 = if getFFlagMomentsPushedFeedSafeAreaModule() then reactModule.createElement(PushedFeedSafeAreaProvider, nil, var18) else var18
	
	return reactModule.createElement(momentsHostShellModule, {
		sessionStore = current,
		openProfile = p1.openProfile,
		openOwnMoments = p1.openOwnMoments,
		openMomentsFeedReport = p1.openMomentsFeedReport
	}, if var7 then reactModule.createElement(view, { tag = "size-full bg-surface-0" }, {
		Feed = var19,
		CreationFlowOverlay = if var8 then reactModule.createElement(view, {
			tag = "size-full",
			ZIndex = constantsModule.DisplayOrder.Modals
		}, {
			Screen = reactModule.createElement(creationFlowScreen, { host = var4 })
		}) else nil,
		FtuxOverlay = if var9 then reactModule.createElement(view, {
			tag = "size-full",
			ZIndex = constantsModule.DisplayOrder.Modals
		}, {
			Screen = reactModule.createElement(FTUXEducationScreenModule, { onClose = var3.onExitFtux })
		}) else nil
	}) else var19)
end)