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

local function PushedFeedSafeAreaProvider(p0) --[[ line: 106 ]]
	-- upvalues: useDeviceInsets (ref), reactModule (ref), momentPushedFeedSafeAreaContextModule (ref)
	return reactModule.createElement(momentPushedFeedSafeAreaContextModule.Context.Provider, { value = useDeviceInsets() }, { Content = p0.children })
end

return reactModule.memo(function(p1) --[[ line: 116 | named "MomentsImmersivePresentation" ]]
	-- upvalues: reactModule (ref), createMomentsStoreModule (ref), fFlagEnableArgus (ref), createSignalTracker (ref), fFlagMomentsFlyoutCreateButtonModule (ref), useCreationEntryModule (ref), useUploadHostModule (ref), logCreateIntentModule (ref), funnelEventNames (ref), immersiveFeedKind (ref), getDeepLinkStoreModule (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), createUserMomentsFeedSourceModule (ref), isStudioModule (ref), getFFlagArgusStudioMockFeedModule (ref), createMockFeedSource (ref), createMomentsFeedSourceModule (ref), createRecommendationTelemetry (ref), fireAnalyticsEvent (ref), eventNames (ref), fFlagMomentsRealtimeSessionTelemetry (ref), analytics (ref), fFlagMomentsSessionHeartbeat (ref), useNavigationFocus (ref), useSignalState (ref), feedPlaybackSuspension (ref), getMomentsPreferencesStoreModule (ref), reportModalCovering (ref), fFlagEnableReportingFlowForMomentsFeed (ref), momentsBackHeaderModule (ref), momentsFeedSurfaceModule (ref), getFFlagMomentsPushedFeedSafeAreaModule (ref), PushedFeedSafeAreaProvider (ref), view (ref), constantsModule (ref), creationFlowScreen (ref), FTUXEducationScreenModule (ref), momentsHostShellModule (ref)
	local var27 = reactModule.useRef(nil)
	
	if var27.current == nil then
		var27.current = createMomentsStoreModule()
	end
	local current = var27.current
	local var28 = reactModule.useRef(nil)
	
	if var28.current == nil and fFlagEnableArgus then
		var28.current = createSignalTracker()
	end
	local current_1 = var28.current
	local feedKind = p1.feedKind
	local targetUserId = p1.targetUserId
	local initialIndex = p1.initialIndex
	local var29 = nil
	local var30 = nil
	
	if fFlagMomentsFlyoutCreateButtonModule then
		var29 = useCreationEntryModule({ manageTabBarVisibility = false })
		var30 = useUploadHostModule({
			onExit = var29.onExitCreation,
			captureSource = var29.captureSource
		})
	end
	local var31 = if var29 ~= nil then nil else var29.onCreatePressed
	local var32 = reactModule.useCallback(function() --[[ line: 150 ]]
		-- upvalues: var31 (ref), logCreateIntentModule (copy), funnelEventNames (copy)
		if var31 ~= nil then
			logCreateIntentModule(funnelEventNames.CreationIntentSource.TopBar)
			var31()
		end
	end, { var31 })
	local var33 = fFlagMomentsFlyoutCreateButtonModule and feedKind == immersiveFeedKind.Trending
	local var34 = var33 and (var29 ~= nil and var29.isCreating)
	local var35 = var33 and (var29 ~= nil and var29.showFtux)
	local deepLinkedMomentId = p1.deepLinkedMomentId
	local deepLinkedMomentTargetIdType = p1.deepLinkedMomentTargetIdType
	local var36 = reactModule.useRef(nil)
	
	if deepLinkedMomentId ~= nil then
		local var37 = `{deepLinkedMomentId}:{tostring(deepLinkedMomentTargetIdType)}`
		
		if var36.current ~= var37 then
			local var38 = getDeepLinkStoreModule()
			
			if fFlagMomentsPassFeedItemIdToBackendApis then
				var38.setDeepLinkedMoment(deepLinkedMomentId, deepLinkedMomentTargetIdType)
			else
				var38.setDeepLinkedMomentId(deepLinkedMomentId)
			end
			var36.current = var37
		end
	end
	local var39 = reactModule.useMemo(function() --[[ line: 180 ]]
		-- upvalues: feedKind (ref), immersiveFeedKind (copy), createUserMomentsFeedSourceModule (copy), targetUserId (ref), initialIndex (ref), isStudioModule (copy), getFFlagArgusStudioMockFeedModule (copy), createMockFeedSource (copy), createMomentsFeedSourceModule (copy), current (ref), current_1 (ref)
		return if feedKind == immersiveFeedKind.User then createUserMomentsFeedSourceModule(targetUserId or 0, { initialIndex = initialIndex }) elseif isStudioModule() and getFFlagArgusStudioMockFeedModule() then createMockFeedSource() else createMomentsFeedSourceModule(current.getMomentsSessionId, { signalTracker = current_1 })
	end, {
		feedKind,
		targetUserId,
		initialIndex,
		current,
		current_1
	})
	local var40 = reactModule.useMemo(function() --[[ line: 194 ]]
		-- upvalues: feedKind (ref), immersiveFeedKind (copy), fFlagEnableArgus (copy), createRecommendationTelemetry (copy), current (ref), current_1 (ref)
		return if feedKind == immersiveFeedKind.Trending and fFlagEnableArgus then createRecommendationTelemetry({
			getMomentsSessionId = current.getMomentsSessionId,
			signalTracker = current_1
		}) else nil
	end, { feedKind, current, current_1 })
	local sessionSource = p1.sessionSource
	reactModule.useEffect(function() --[[ line: 210 ]]
		-- upvalues: current (ref), sessionSource (ref), fireAnalyticsEvent (copy), eventNames (copy), fFlagMomentsRealtimeSessionTelemetry (copy), analytics (copy), fFlagMomentsSessionHeartbeat (copy)
		current.setSessionSource(sessionSource)
		fireAnalyticsEvent(eventNames.TapMomentsTab, {
			moments_session_id = current.getMomentsSessionId(false),
			source = sessionSource
		})
		
		if fFlagMomentsRealtimeSessionTelemetry then
			analytics.reportMomentsSessionStarted(sessionSource)
		end
		local var47 = if fFlagMomentsSessionHeartbeat then analytics.createMomentsSessionHeartbeat() else nil
		
		if var47 ~= nil then
			var47.start(sessionSource)
		end
		return function() --[[ line: 228 ]]
			-- upvalues: var47 (ref), current (copy), fireAnalyticsEvent (copy), eventNames (copy), sessionSource (copy), fFlagMomentsRealtimeSessionTelemetry (copy), analytics (copy)
			if var47 ~= nil then
				var47.stop()
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
	local var41 = useNavigationFocus()
	local var42 = useSignalState(feedPlaybackSuspension.getSuspended)
	local var43 = useSignalState(getMomentsPreferencesStoreModule(false).getIsTeleporting)
	local getCovering = fFlagEnableReportingFlowForMomentsFeed and useSignalState(reportModalCovering.getCovering)
	local onBack = p1.onBack
	local var45 = reactModule.createElement(momentsFeedSurfaceModule, {
		source = var39,
		telemetry = var40,
		active = var41 and (not getCovering and not var34),
		playbackActive = var41 and (not var42 and (not var43 and (not getCovering and not var34))),
		initialIndex = initialIndex,
		header = reactModule.useMemo(function() --[[ line: 262 ]]
			-- upvalues: reactModule (copy), momentsBackHeaderModule (copy), onBack (ref), var33 (ref), var32 (ref)
			return reactModule.createElement(momentsBackHeaderModule, {
				onBack = onBack,
				onCreatePressed = if var33 then var32 else nil
			})
		end, { onBack, var33, var32 })
	})
	local var46 = if getFFlagMomentsPushedFeedSafeAreaModule() then reactModule.createElement(PushedFeedSafeAreaProvider, nil, var45) else var45
	
	return reactModule.createElement(momentsHostShellModule, {
		sessionStore = current,
		openProfile = p1.openProfile,
		openOwnMoments = p1.openOwnMoments,
		openMomentsFeedReport = p1.openMomentsFeedReport
	}, if var33 then reactModule.createElement(view, { tag = "size-full bg-surface-0" }, {
		Feed = var46,
		CreationFlowOverlay = if var34 then reactModule.createElement(view, {
			tag = "size-full",
			ZIndex = constantsModule.DisplayOrder.Modals
		}, {
			Screen = reactModule.createElement(creationFlowScreen, { host = var30 })
		}) else nil,
		FtuxOverlay = if var35 then reactModule.createElement(view, {
			tag = "size-full",
			ZIndex = constantsModule.DisplayOrder.Modals
		}, {
			Screen = reactModule.createElement(FTUXEducationScreenModule, { onClose = var29.onExitFtux })
		}) else nil
	}) else var46)
end)