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
local createMomentsStoreModule = require(moments.Stores.GetMomentsStore.createMomentsStore)
local createMomentsFeedSourceModule = require(moments.Stores.GetMomentsStore.createMomentsFeedSource)
local createUserMomentsFeedSourceModule = require(moments.Stores.GetMomentsStore.createUserMomentsFeedSource)
local getMomentsPreferencesStoreModule = require(moments.Stores.GetMomentsPreferencesStore)
local getFFlagArgusStudioMockFeedModule = require(moments.Flags.GetFFlagArgusStudioMockFeed)
local createSignalTracker = require(moments.SignalTracker).createSignalTracker
local useNavigationFocus = navigationModule.useNavigationFocus
local useSignalState = signalsReactModule.useSignalState
local fFlagEnableArgus = sharedFlagsModule.FFlagEnableArgus
local analytics = momentsCommonModule.Analytics
local eventNames = analytics.EventNames
local fireAnalyticsEvent = analytics.fireAnalyticsEvent
local feedPlaybackSuspension = momentsCommonModule.Media.feedPlaybackSuspension
local createRecommendationTelemetry = feedModule.createRecommendationTelemetry
local createMockFeedSource = feedModule.createMockFeedSource

return reactModule.memo(function(p0) --[[ line: 67 | named "MomentsImmersivePresentation" ]]
	-- upvalues: reactModule (ref), createMomentsStoreModule (ref), fFlagEnableArgus (ref), createSignalTracker (ref), createUserMomentsFeedSourceModule (ref), isStudioModule (ref), getFFlagArgusStudioMockFeedModule (ref), createMockFeedSource (ref), createMomentsFeedSourceModule (ref), createRecommendationTelemetry (ref), fireAnalyticsEvent (ref), eventNames (ref), useNavigationFocus (ref), useSignalState (ref), feedPlaybackSuspension (ref), getMomentsPreferencesStoreModule (ref), momentsBackHeaderModule (ref), momentsHostShellModule (ref), momentsFeedSurfaceModule (ref)
	local var16 = reactModule.useRef(nil)
	
	if var16.current == nil then
		var16.current = createMomentsStoreModule()
	end
	local current = var16.current
	local var17 = reactModule.useRef(nil)
	
	if var17.current == nil and fFlagEnableArgus then
		var17.current = createSignalTracker()
	end
	local current_1 = var17.current
	local feedKind = p0.feedKind
	local targetUserId = p0.targetUserId
	local initialIndex = p0.initialIndex
	local var18 = reactModule.useMemo(function() --[[ line: 86 ]]
		-- upvalues: feedKind (ref), createUserMomentsFeedSourceModule (copy), targetUserId (ref), initialIndex (ref), isStudioModule (copy), getFFlagArgusStudioMockFeedModule (copy), createMockFeedSource (copy), createMomentsFeedSourceModule (copy), current (ref), current_1 (ref)
		return if feedKind == "user" then createUserMomentsFeedSourceModule(targetUserId or 0, { initialIndex = initialIndex }) elseif isStudioModule() and getFFlagArgusStudioMockFeedModule() then createMockFeedSource() else createMomentsFeedSourceModule(current.getMomentsSessionId, { signalTracker = current_1 })
	end, {
		feedKind,
		targetUserId,
		initialIndex,
		current,
		current_1
	})
	local var19 = reactModule.useMemo(function() --[[ line: 100 ]]
		-- upvalues: feedKind (ref), fFlagEnableArgus (copy), createRecommendationTelemetry (copy), current (ref), current_1 (ref)
		return if feedKind == "trending" and fFlagEnableArgus then createRecommendationTelemetry({
			getMomentsSessionId = current.getMomentsSessionId,
			signalTracker = current_1
		}) else nil
	end, { feedKind, current, current_1 })
	local sessionSource = p0.sessionSource
	reactModule.useEffect(function() --[[ line: 116 ]]
		-- upvalues: current (ref), sessionSource (ref), fireAnalyticsEvent (copy), eventNames (copy)
		current.setSessionSource(sessionSource)
		fireAnalyticsEvent(eventNames.TapMomentsTab, {
			moments_session_id = current.getMomentsSessionId(false),
			source = sessionSource
		})
		
		return function() --[[ line: 123 ]]
			-- upvalues: current (copy), fireAnalyticsEvent (copy), eventNames (copy), sessionSource (copy)
			fireAnalyticsEvent(eventNames.MomentsSessionEnded, {
				moments_session_id = current.getMomentsSessionId(false),
				source = sessionSource,
				duration_seconds = tostring(math.floor(os.clock() - current.getSessionStartTime(false)))
			})
		end
	end, { sessionSource, current })
	local var20 = useNavigationFocus()
	local onBack = p0.onBack
	
	return reactModule.createElement(momentsHostShellModule, {
		sessionStore = current,
		openProfile = p0.openProfile,
		openOwnMoments = p0.openOwnMoments
	}, reactModule.createElement(momentsFeedSurfaceModule, {
		source = var18,
		telemetry = var19,
		active = var20,
		playbackActive = var20 and (not useSignalState(feedPlaybackSuspension.getSuspended) and not useSignalState(getMomentsPreferencesStoreModule(false).getIsTeleporting)),
		initialIndex = initialIndex,
		header = reactModule.useMemo(function() --[[ line: 147 ]]
			-- upvalues: reactModule (copy), momentsBackHeaderModule (copy), onBack (ref)
			return reactModule.createElement(momentsBackHeaderModule, { onBack = onBack })
		end, { onBack })
	}))
end)