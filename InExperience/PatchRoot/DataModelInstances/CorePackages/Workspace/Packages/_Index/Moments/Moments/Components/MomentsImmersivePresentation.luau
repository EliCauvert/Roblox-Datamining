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
local createUserMomentsFeedSourceModule = require(moments.Stores.GetMomentsStore.createUserMomentsFeedSource)
local getMomentsPreferencesStoreModule = require(moments.Stores.GetMomentsPreferencesStore)
local getFFlagArgusStudioMockFeedModule = require(moments.Flags.GetFFlagArgusStudioMockFeed)
local getFFlagMomentsPushedFeedSafeAreaModule = require(moments.Flags.GetFFlagMomentsPushedFeedSafeArea)
local createSignalTracker = require(moments.SignalTracker).createSignalTracker
local useNavigationFocus = navigationModule.useNavigationFocus
local useSignalState = signalsReactModule.useSignalState
local fFlagEnableArgus = sharedFlagsModule.FFlagEnableArgus
local analytics = momentsCommonModule.Analytics
local eventNames = analytics.EventNames
local fireAnalyticsEvent = analytics.fireAnalyticsEvent
local feedPlaybackSuspension = momentsCommonModule.Media.feedPlaybackSuspension
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local createRecommendationTelemetry = feedModule.createRecommendationTelemetry
local createMockFeedSource = feedModule.createMockFeedSource

local function PushedFeedSafeAreaProvider(p0) --[[ line: 75 ]]
	-- upvalues: useDeviceInsets (ref), reactModule (ref), momentPushedFeedSafeAreaContextModule (ref)
	return reactModule.createElement(momentPushedFeedSafeAreaContextModule.Context.Provider, { value = useDeviceInsets() }, { Content = p0.children })
end

return reactModule.memo(function(p1) --[[ line: 85 | named "MomentsImmersivePresentation" ]]
	-- upvalues: reactModule (ref), createMomentsStoreModule (ref), fFlagEnableArgus (ref), createSignalTracker (ref), createUserMomentsFeedSourceModule (ref), isStudioModule (ref), getFFlagArgusStudioMockFeedModule (ref), createMockFeedSource (ref), createMomentsFeedSourceModule (ref), createRecommendationTelemetry (ref), fireAnalyticsEvent (ref), eventNames (ref), useNavigationFocus (ref), useSignalState (ref), feedPlaybackSuspension (ref), getMomentsPreferencesStoreModule (ref), momentsBackHeaderModule (ref), momentsFeedSurfaceModule (ref), getFFlagMomentsPushedFeedSafeAreaModule (ref), PushedFeedSafeAreaProvider (ref), momentsHostShellModule (ref)
	local var19 = reactModule.useRef(nil)
	
	if var19.current == nil then
		var19.current = createMomentsStoreModule()
	end
	local current = var19.current
	local var20 = reactModule.useRef(nil)
	
	if var20.current == nil and fFlagEnableArgus then
		var20.current = createSignalTracker()
	end
	local current_1 = var20.current
	local feedKind = p1.feedKind
	local targetUserId = p1.targetUserId
	local initialIndex = p1.initialIndex
	local var21 = reactModule.useMemo(function() --[[ line: 104 ]]
		-- upvalues: feedKind (ref), createUserMomentsFeedSourceModule (copy), targetUserId (ref), initialIndex (ref), isStudioModule (copy), getFFlagArgusStudioMockFeedModule (copy), createMockFeedSource (copy), createMomentsFeedSourceModule (copy), current (ref), current_1 (ref)
		return if feedKind == "user" then createUserMomentsFeedSourceModule(targetUserId or 0, { initialIndex = initialIndex }) elseif isStudioModule() and getFFlagArgusStudioMockFeedModule() then createMockFeedSource() else createMomentsFeedSourceModule(current.getMomentsSessionId, { signalTracker = current_1 })
	end, {
		feedKind,
		targetUserId,
		initialIndex,
		current,
		current_1
	})
	local var22 = reactModule.useMemo(function() --[[ line: 118 ]]
		-- upvalues: feedKind (ref), fFlagEnableArgus (copy), createRecommendationTelemetry (copy), current (ref), current_1 (ref)
		return if feedKind == "trending" and fFlagEnableArgus then createRecommendationTelemetry({
			getMomentsSessionId = current.getMomentsSessionId,
			signalTracker = current_1
		}) else nil
	end, { feedKind, current, current_1 })
	local sessionSource = p1.sessionSource
	reactModule.useEffect(function() --[[ line: 134 ]]
		-- upvalues: current (ref), sessionSource (ref), fireAnalyticsEvent (copy), eventNames (copy)
		current.setSessionSource(sessionSource)
		fireAnalyticsEvent(eventNames.TapMomentsTab, {
			moments_session_id = current.getMomentsSessionId(false),
			source = sessionSource
		})
		
		return function() --[[ line: 141 ]]
			-- upvalues: current (copy), fireAnalyticsEvent (copy), eventNames (copy), sessionSource (copy)
			fireAnalyticsEvent(eventNames.MomentsSessionEnded, {
				moments_session_id = current.getMomentsSessionId(false),
				source = sessionSource,
				duration_seconds = tostring(math.floor(os.clock() - current.getSessionStartTime(false)))
			})
		end
	end, { sessionSource, current })
	local var23 = useNavigationFocus()
	local onBack = p1.onBack
	local var24 = reactModule.createElement(momentsFeedSurfaceModule, {
		source = var21,
		telemetry = var22,
		active = var23,
		playbackActive = var23 and (not useSignalState(feedPlaybackSuspension.getSuspended) and not useSignalState(getMomentsPreferencesStoreModule(false).getIsTeleporting)),
		initialIndex = initialIndex,
		header = reactModule.useMemo(function() --[[ line: 165 ]]
			-- upvalues: reactModule (copy), momentsBackHeaderModule (copy), onBack (ref)
			return reactModule.createElement(momentsBackHeaderModule, { onBack = onBack })
		end, { onBack })
	})
	
	return reactModule.createElement(momentsHostShellModule, {
		sessionStore = current,
		openProfile = p1.openProfile,
		openOwnMoments = p1.openOwnMoments,
		openMomentsFeedReport = p1.openMomentsFeedReport
	}, if getFFlagMomentsPushedFeedSafeAreaModule() then reactModule.createElement(PushedFeedSafeAreaProvider, nil, var24) else var24)
end)