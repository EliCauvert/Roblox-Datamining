local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local navigationModule = require(parent.Navigation)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsReactModule = require(parent.SignalsReact)
local momentsCommonModule = require(parent.MomentsCommon)
local isStudioModule = require(parent.MomentsCommon.isStudio)
local momentsHostShellModule = require(moments.Components.MomentsHostShell)
local momentsFeedSurfaceModule = require(moments.Components.MomentsFeedSurface)
local momentsBackHeaderModule = require(moments.Components.MomentsBackHeader)
local feedModule = require(moments.Components.Feed)
local momentPushedFeedSafeAreaContextModule = require(moments.Components.Feed.Items.Moment.MomentPushedFeedSafeAreaContext)
local createMomentsStoreModule = require(moments.Stores.GetMomentsStore.createMomentsStore)
local createMomentsFeedSourceModule = require(moments.Stores.GetMomentsStore.createMomentsFeedSource)
local getDeepLinkStoreModule = require(moments.Stores.GetDeepLinkStore)
local createUserMomentsFeedSourceModule = require(moments.Stores.GetMomentsStore.createUserMomentsFeedSource)
local getMomentsPreferencesStoreModule = require(moments.Stores.GetMomentsPreferencesStore)
local getFFlagArgusStudioMockFeedModule = require(moments.Flags.GetFFlagArgusStudioMockFeed)
local getFFlagMomentsPushedFeedSafeAreaModule = require(moments.Flags.GetFFlagMomentsPushedFeedSafeArea)
local createSignalTracker = require(moments.SignalTracker).createSignalTracker
local useNavigationFocus = navigationModule.useNavigationFocus
local useSignalState = signalsReactModule.useSignalState
local fFlagEnableArgus = sharedFlagsModule.FFlagEnableArgus
local fFlagEnableReportingFlowForMomentsFeed = sharedFlagsModule.FFlagEnableReportingFlowForMomentsFeed
local fFlagMomentsPassFeedItemIdToBackendApis = sharedFlagsModule.FFlagMomentsPassFeedItemIdToBackendApis
local fFlagMomentsRealtimeSessionTelemetry = momentsCommonModule.Flags.FFlagMomentsRealtimeSessionTelemetry
local fFlagMomentsSessionHeartbeat = momentsCommonModule.Flags.FFlagMomentsSessionHeartbeat
local analytics = momentsCommonModule.Analytics
local eventNames = analytics.EventNames
local fireAnalyticsEvent = analytics.fireAnalyticsEvent
local feedPlaybackSuspension = momentsCommonModule.Media.feedPlaybackSuspension
local reportModalCovering = momentsCommonModule.Media.reportModalCovering
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local createRecommendationTelemetry = feedModule.createRecommendationTelemetry
local createMockFeedSource = feedModule.createMockFeedSource

local function PushedFeedSafeAreaProvider(p0) --[[ line: 94 ]]
	-- upvalues: useDeviceInsets (ref), reactModule (ref), momentPushedFeedSafeAreaContextModule (ref)
	return reactModule.createElement(momentPushedFeedSafeAreaContextModule.Context.Provider, { value = useDeviceInsets() }, { Content = p0.children })
end

return reactModule.memo(function(p1) --[[ line: 104 | named "MomentsImmersivePresentation" ]]
	-- upvalues: reactModule (ref), createMomentsStoreModule (ref), fFlagEnableArgus (ref), createSignalTracker (ref), getDeepLinkStoreModule (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), createUserMomentsFeedSourceModule (ref), isStudioModule (ref), getFFlagArgusStudioMockFeedModule (ref), createMockFeedSource (ref), createMomentsFeedSourceModule (ref), createRecommendationTelemetry (ref), fireAnalyticsEvent (ref), eventNames (ref), fFlagMomentsRealtimeSessionTelemetry (ref), analytics (ref), fFlagMomentsSessionHeartbeat (ref), useNavigationFocus (ref), useSignalState (ref), feedPlaybackSuspension (ref), getMomentsPreferencesStoreModule (ref), reportModalCovering (ref), fFlagEnableReportingFlowForMomentsFeed (ref), momentsBackHeaderModule (ref), momentsFeedSurfaceModule (ref), getFFlagMomentsPushedFeedSafeAreaModule (ref), PushedFeedSafeAreaProvider (ref), momentsHostShellModule (ref)
	local var20 = reactModule.useRef(nil)
	
	if var20.current == nil then
		var20.current = createMomentsStoreModule()
	end
	local current = var20.current
	local var21 = reactModule.useRef(nil)
	
	if var21.current == nil and fFlagEnableArgus then
		var21.current = createSignalTracker()
	end
	local current_1 = var21.current
	local feedKind = p1.feedKind
	local targetUserId = p1.targetUserId
	local initialIndex = p1.initialIndex
	local deepLinkedMomentId = p1.deepLinkedMomentId
	local deepLinkedMomentTargetIdType = p1.deepLinkedMomentTargetIdType
	local var22 = reactModule.useRef(nil)
	
	if deepLinkedMomentId ~= nil then
		local var23 = `{deepLinkedMomentId}:{tostring(deepLinkedMomentTargetIdType)}`
		
		if var22.current ~= var23 then
			local var24 = getDeepLinkStoreModule()
			
			if fFlagMomentsPassFeedItemIdToBackendApis then
				var24.setDeepLinkedMoment(deepLinkedMomentId, deepLinkedMomentTargetIdType)
			else
				var24.setDeepLinkedMomentId(deepLinkedMomentId)
			end
			var22.current = var23
		end
	end
	local var25 = reactModule.useMemo(function() --[[ line: 143 ]]
		-- upvalues: feedKind (ref), createUserMomentsFeedSourceModule (copy), targetUserId (ref), initialIndex (ref), isStudioModule (copy), getFFlagArgusStudioMockFeedModule (copy), createMockFeedSource (copy), createMomentsFeedSourceModule (copy), current (ref), current_1 (ref)
		return if feedKind == "user" then createUserMomentsFeedSourceModule(targetUserId or 0, { initialIndex = initialIndex }) elseif isStudioModule() and getFFlagArgusStudioMockFeedModule() then createMockFeedSource() else createMomentsFeedSourceModule(current.getMomentsSessionId, { signalTracker = current_1 })
	end, {
		feedKind,
		targetUserId,
		initialIndex,
		current,
		current_1
	})
	local var26 = reactModule.useMemo(function() --[[ line: 157 ]]
		-- upvalues: feedKind (ref), fFlagEnableArgus (copy), createRecommendationTelemetry (copy), current (ref), current_1 (ref)
		return if feedKind == "trending" and fFlagEnableArgus then createRecommendationTelemetry({
			getMomentsSessionId = current.getMomentsSessionId,
			signalTracker = current_1
		}) else nil
	end, { feedKind, current, current_1 })
	local sessionSource = p1.sessionSource
	reactModule.useEffect(function() --[[ line: 173 ]]
		-- upvalues: current (ref), sessionSource (ref), fireAnalyticsEvent (copy), eventNames (copy), fFlagMomentsRealtimeSessionTelemetry (copy), analytics (copy), fFlagMomentsSessionHeartbeat (copy)
		current.setSessionSource(sessionSource)
		fireAnalyticsEvent(eventNames.TapMomentsTab, {
			moments_session_id = current.getMomentsSessionId(false),
			source = sessionSource
		})
		
		if fFlagMomentsRealtimeSessionTelemetry then
			analytics.reportMomentsSessionStarted(sessionSource)
		end
		local var32 = if fFlagMomentsSessionHeartbeat then analytics.createMomentsSessionHeartbeat() else nil
		
		if var32 ~= nil then
			var32.start(sessionSource)
		end
		return function() --[[ line: 191 ]]
			-- upvalues: var32 (ref), current (copy), fireAnalyticsEvent (copy), eventNames (copy), sessionSource (copy), fFlagMomentsRealtimeSessionTelemetry (copy), analytics (copy)
			if var32 ~= nil then
				var32.stop()
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
	local var27 = useNavigationFocus()
	local var28 = useSignalState(feedPlaybackSuspension.getSuspended)
	local var29 = useSignalState(getMomentsPreferencesStoreModule(false).getIsTeleporting)
	local getCovering = fFlagEnableReportingFlowForMomentsFeed and useSignalState(reportModalCovering.getCovering)
	local onBack = p1.onBack
	local var31 = reactModule.createElement(momentsFeedSurfaceModule, {
		source = var25,
		telemetry = var26,
		active = var27 and not getCovering,
		playbackActive = var27 and (not var28 and (not var29 and not getCovering)),
		initialIndex = initialIndex,
		header = reactModule.useMemo(function() --[[ line: 225 ]]
			-- upvalues: reactModule (copy), momentsBackHeaderModule (copy), onBack (ref)
			return reactModule.createElement(momentsBackHeaderModule, { onBack = onBack })
		end, { onBack })
	})
	
	return reactModule.createElement(momentsHostShellModule, {
		sessionStore = current,
		openProfile = p1.openProfile,
		openOwnMoments = p1.openOwnMoments,
		openMomentsFeedReport = p1.openMomentsFeedReport
	}, if getFFlagMomentsPushedFeedSafeAreaModule() then reactModule.createElement(PushedFeedSafeAreaProvider, nil, var31) else var31)
end)