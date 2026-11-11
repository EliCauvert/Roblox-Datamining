local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local MomentsCommonModule = require(Parent.MomentsCommon)
local IsStudioModule = require(Parent.MomentsCommon.isStudio)
local MomentsHostShellModule = require(Moments.Components.MomentsHostShell)
local MomentsFeedSurfaceModule = require(Moments.Components.MomentsFeedSurface)
local MomentsBackHeaderModule = require(Moments.Components.MomentsBackHeader)
local FeedModule = require(Moments.Components.Feed)
local CreateMomentsStoreModule = require(Moments.Stores.GetMomentsStore.createMomentsStore)
local CreateMomentsFeedSourceModule = require(Moments.Stores.GetMomentsStore.createMomentsFeedSource)
local CreateUserMomentsFeedSourceModule = require(Moments.Stores.GetMomentsStore.createUserMomentsFeedSource)
local GetMomentsPreferencesStoreModule = require(Moments.Stores.GetMomentsPreferencesStore)
local GetFFlagArgusStudioMockFeedModule = require(Moments.Flags.GetFFlagArgusStudioMockFeed)
local CreateSignalTrackerFunction = require(Moments.SignalTracker).createSignalTracker
local UseNavigationFocusFunction = require(Parent.Navigation).useNavigationFocus
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local FFlagEnableArgus = require(Parent.SharedFlags).FFlagEnableArgus
local Analytics = MomentsCommonModule.Analytics
local EventNames = Analytics.EventNames
local FireAnalyticsEventFunction = Analytics.fireAnalyticsEvent
local FeedPlaybackSuspension = MomentsCommonModule.Media.feedPlaybackSuspension
local CreateRecommendationTelemetryFunction = FeedModule.createRecommendationTelemetry
local CreateMockFeedSourceFunction = FeedModule.createMockFeedSource

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), CreateMomentsStoreModule (copy), FFlagEnableArgus (copy), CreateSignalTrackerFunction (copy), CreateUserMomentsFeedSourceModule (copy), IsStudioModule (copy), GetFFlagArgusStudioMockFeedModule (copy), CreateMockFeedSourceFunction (copy), CreateMomentsFeedSourceModule (copy), CreateRecommendationTelemetryFunction (copy), FireAnalyticsEventFunction (copy), EventNames (copy), UseNavigationFocusFunction (copy), UseSignalStateFunction (copy), FeedPlaybackSuspension (copy), GetMomentsPreferencesStoreModule (copy), MomentsBackHeaderModule (copy), MomentsHostShellModule (copy), MomentsFeedSurfaceModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	
	if UseRefResult.current == nil then
		UseRefResult.current = CreateMomentsStoreModule()
	end
	local Current = UseRefResult.current
	local UseRefResult1 = ReactModule.useRef(nil)
	
	if UseRefResult1.current == nil and FFlagEnableArgus then
		UseRefResult1.current = CreateSignalTrackerFunction()
	end
	local Current1 = UseRefResult1.current
	local FeedKind = p1.feedKind
	local TargetUserId = p1.targetUserId
	local InitialIndex = p1.initialIndex
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: FeedKind (copy), CreateUserMomentsFeedSourceModule (upval), TargetUserId (copy), InitialIndex (copy), IsStudioModule (upval), GetFFlagArgusStudioMockFeedModule (upval), CreateMockFeedSourceFunction (upval), CreateMomentsFeedSourceModule (upval), Current (copy), Current1 (copy)
		return if FeedKind == "user" then CreateUserMomentsFeedSourceModule(TargetUserId or 0, { initialIndex = InitialIndex }) elseif IsStudioModule() and GetFFlagArgusStudioMockFeedModule() then CreateMockFeedSourceFunction() else CreateMomentsFeedSourceModule(Current.getMomentsSessionId, { signalTracker = Current1 })
	end, {
		FeedKind,
		TargetUserId,
		InitialIndex,
		Current,
		Current1
	})
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: FeedKind (copy), FFlagEnableArgus (upval), CreateRecommendationTelemetryFunction (upval), Current (copy), Current1 (copy)
		return if FeedKind == "trending" and FFlagEnableArgus then CreateRecommendationTelemetryFunction({
			getMomentsSessionId = Current.getMomentsSessionId,
			signalTracker = Current1
		}) else nil
	end, { FeedKind, Current, Current1 })
	local SessionSource = p1.sessionSource
	ReactModule.useEffect(function()
		-- upvalues: Current (copy), SessionSource (copy), FireAnalyticsEventFunction (upval), EventNames (upval)
		Current.setSessionSource(SessionSource)
		FireAnalyticsEventFunction(EventNames.TapMomentsTab, {
			moments_session_id = Current.getMomentsSessionId(false),
			source = SessionSource
		})
		
		return function()
			-- upvalues: Current (upval), FireAnalyticsEventFunction (upval), EventNames (upval), SessionSource (upval)
			FireAnalyticsEventFunction(EventNames.MomentsSessionEnded, {
				moments_session_id = Current.getMomentsSessionId(false),
				source = SessionSource,
				duration_seconds = tostring((math.floor(os.clock() - Current.getSessionStartTime(false))))
			})
		end
	end, { SessionSource, Current })
	local UseNavigationFocusResult = UseNavigationFocusFunction()
	local UseSignalStateResult = UseSignalStateFunction(FeedPlaybackSuspension.getSuspended)
	local UseSignalStateResult1 = UseSignalStateFunction(GetMomentsPreferencesStoreModule(false).getIsTeleporting)
	local OnBack = p1.onBack
	
	return ReactModule.createElement(MomentsHostShellModule, {
		sessionStore = Current,
		openProfile = p1.openProfile,
		openOwnMoments = p1.openOwnMoments
	}, ReactModule.createElement(MomentsFeedSurfaceModule, {
		source = UseMemoResult,
		telemetry = UseMemoResult1,
		active = UseNavigationFocusResult,
		playbackActive = UseNavigationFocusResult and (not UseSignalStateResult and not UseSignalStateResult1),
		initialIndex = InitialIndex,
		header = ReactModule.useMemo(function()
			-- upvalues: ReactModule (upval), MomentsBackHeaderModule (upval), OnBack (copy)
			return ReactModule.createElement(MomentsBackHeaderModule, { onBack = OnBack })
		end, { OnBack })
	}))
end)