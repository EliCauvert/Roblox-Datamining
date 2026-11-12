local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local NavigationModule = require(Parent.Navigation)
local RoactNavigationModule = require(Parent.RoactNavigation)
local SharedFlagsModule = require(Parent.SharedFlags)
local MomentsCommonModule = require(Parent.MomentsCommon)
local IsStudioModule = require(Parent.MomentsCommon.isStudio)
local ConstantsModule = require(Moments.Constants)
local ImmersiveFeedKind = ConstantsModule.ImmersiveFeedKind
local MomentsHostShellModule = require(Moments.Components.MomentsHostShell)
local _ = require(Moments.MomentsHostContext)
local MomentsFeedSurfaceModule = require(Moments.Components.MomentsFeedSurface)
local MomentsBackHeaderModule = require(Moments.Components.MomentsBackHeader)
local CreationFlowScreen = require(Parent.MomentsCreation).CreationFlowScreen
local FTUXEducationScreenModule = require(Moments.Components.FTUXEducationScreen)
local FeedModule = require(Moments.Components.Feed)
local MomentPushedFeedSafeAreaContextModule = require(Moments.Components.Feed.Items.Moment.MomentPushedFeedSafeAreaContext)
local CreateMomentsStoreModule = require(Moments.Stores.GetMomentsStore.createMomentsStore)
local CreateMomentsFeedSourceModule = require(Moments.Stores.GetMomentsStore.createMomentsFeedSource)
local GetDeepLinkStoreModule = require(Moments.Stores.GetDeepLinkStore)
local CreateUserMomentsFeedSourceModule = require(Moments.Stores.GetMomentsStore.createUserMomentsFeedSource)
local GetMomentsPreferencesStoreModule = require(Moments.Stores.GetMomentsPreferencesStore)
local UseCreationEntryModule = require(Moments.Hooks.useCreationEntry)
local UseUploadHostModule = require(Moments.Hooks.useUploadHost)
local LogCreateIntentModule = require(Moments.Analytics.logCreateIntent)
local LogMomentsLayerExposureFunction = MomentsCommonModule.Utils.logMomentsLayerExposure
local FFlagMomentsFlushDwellBeforeNavigationModule = require(Moments.Flags.FFlagMomentsFlushDwellBeforeNavigation)
local NavigationDestinationTypeModule = require(Moments.Enums.NavigationDestinationType)
local FFlagMomentsNavigationEventModule = require(Moments.Flags.FFlagMomentsNavigationEvent)
local MomentsImmersiveNavigationMenu = game:DefineFastFlag("MomentsImmersiveNavigationMenu", false)
local FFlagMomentsRenderAvatarPostsInFeed = SharedFlagsModule.FFlagMomentsRenderAvatarPostsInFeed
local FStringMomentsExperienceJoinActionTextIxpLayerModule = require(Moments.Flags.FStringMomentsExperienceJoinActionTextIxpLayer)
local GetFFlagArgusStudioMockFeedModule = require(Moments.Flags.GetFFlagArgusStudioMockFeed)
local CreateSignalTrackerFunction = require(Moments.SignalTracker).createSignalTracker
local View = require(Parent.Foundation).View
local UseNavigationFocusFunction = NavigationModule.useNavigationFocus
local UseNavigationFunction = NavigationModule.useNavigation
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local FFlagEnableArgus = SharedFlagsModule.FFlagEnableArgus
local FFlagMomentsCreationFeatureGate = SharedFlagsModule.FFlagMomentsCreationFeatureGate
local FFlagMomentsOptimisticProfilePending = SharedFlagsModule.FFlagMomentsOptimisticProfilePending
local FFlagMomentsAvatarLookTryOn = SharedFlagsModule.FFlagMomentsAvatarLookTryOn
local Analytics = MomentsCommonModule.Analytics
local EventNames = Analytics.EventNames
local FunnelEventNames = Analytics.FunnelEventNames
local FireAnalyticsEventFunction = Analytics.fireAnalyticsEvent
local FeedPlaybackSuspension = MomentsCommonModule.Media.feedPlaybackSuspension
local ReportModalCovering = MomentsCommonModule.Media.reportModalCovering
local UseDeviceInsetsFunction = MomentsCommonModule.Hooks.useDeviceInsets
local UseMomentsGatingFunction = MomentsCommonModule.Hooks.useMomentsGating
local CreateRecommendationTelemetryFunction = FeedModule.createRecommendationTelemetry
local CreateMockFeedSourceFunction = FeedModule.createMockFeedSource

local function PushedFeedSafeAreaProvider(p1)
	-- upvalues: UseDeviceInsetsFunction (copy), ReactModule (copy), MomentPushedFeedSafeAreaContextModule (copy)
	return ReactModule.createElement(MomentPushedFeedSafeAreaContextModule.Context.Provider, { value = UseDeviceInsetsFunction() }, { Content = p1.children })
end

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), CreateMomentsStoreModule (copy), FFlagEnableArgus (copy), CreateSignalTrackerFunction (copy), FFlagMomentsOptimisticProfilePending (copy), UseCreationEntryModule (copy), UseUploadHostModule (copy), LogCreateIntentModule (copy), FunnelEventNames (copy), FFlagMomentsCreationFeatureGate (copy), UseMomentsGatingFunction (copy), ImmersiveFeedKind (copy), GetDeepLinkStoreModule (copy), CreateUserMomentsFeedSourceModule (copy), IsStudioModule (copy), GetFFlagArgusStudioMockFeedModule (copy), CreateMockFeedSourceFunction (copy), CreateMomentsFeedSourceModule (copy), CreateRecommendationTelemetryFunction (copy), LogMomentsLayerExposureFunction (copy), FStringMomentsExperienceJoinActionTextIxpLayerModule (copy), Moments (copy), FireAnalyticsEventFunction (copy), EventNames (copy), Analytics (copy), UseNavigationFocusFunction (copy), UseSignalStateFunction (copy), FeedPlaybackSuspension (copy), GetMomentsPreferencesStoreModule (copy), ReportModalCovering (copy), FFlagMomentsFlushDwellBeforeNavigationModule (copy), UseNavigationFunction (copy), RoactNavigationModule (copy), FFlagMomentsNavigationEventModule (copy), NavigationDestinationTypeModule (copy), MomentsImmersiveNavigationMenu (copy), MomentsBackHeaderModule (copy), MomentsFeedSurfaceModule (copy), PushedFeedSafeAreaProvider (copy), View (copy), FFlagMomentsRenderAvatarPostsInFeed (copy), ConstantsModule (copy), CreationFlowScreen (copy), FTUXEducationScreenModule (copy), MomentsHostShellModule (copy), FFlagMomentsAvatarLookTryOn (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	
	if UseRefResult1.current == nil then
		UseRefResult1.current = CreateMomentsStoreModule()
	end
	local Current = UseRefResult1.current
	local UseRefResult2 = ReactModule.useRef(nil)
	
	if UseRefResult2.current == nil and FFlagEnableArgus then
		UseRefResult2.current = CreateSignalTrackerFunction()
	end
	local Current1 = UseRefResult2.current
	local FeedKind = p1.feedKind
	local TargetUserId = p1.targetUserId
	local InitialIndex = p1.initialIndex
	local InitialMomentId = if FFlagMomentsOptimisticProfilePending then p1.initialMomentId else nil
	local UseCreationEntryModuleResult = UseCreationEntryModule({ manageTabBarVisibility = false })
	local UseUploadHostModuleResult = UseUploadHostModule({
		onExit = UseCreationEntryModuleResult.onExitCreation,
		captureSource = UseCreationEntryModuleResult.captureSource
	})
	local OnCreatePressed = if UseCreationEntryModuleResult == nil then nil else UseCreationEntryModuleResult.onCreatePressed
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: OnCreatePressed (copy), LogCreateIntentModule (upval), FunnelEventNames (upval)
		if OnCreatePressed ~= nil then
			LogCreateIntentModule(FunnelEventNames.CreationIntentSource.TopBar)
			OnCreatePressed()
		end
	end, { OnCreatePressed })
	local IsCreationEnabled = if FFlagMomentsCreationFeatureGate then UseMomentsGatingFunction().isCreationEnabled else nil
	local NoFFlagMomentsCreationFeatureGate = FeedKind == ImmersiveFeedKind.Trending and (not FFlagMomentsCreationFeatureGate or IsCreationEnabled)
	local IsCreating = NoFFlagMomentsCreationFeatureGate and (UseCreationEntryModuleResult ~= nil and UseCreationEntryModuleResult.isCreating)
	local ShowFtux = NoFFlagMomentsCreationFeatureGate and (UseCreationEntryModuleResult ~= nil and UseCreationEntryModuleResult.showFtux)
	local DeepLinkedMomentId = p1.deepLinkedMomentId
	local DeepLinkedMomentTargetIdType = p1.deepLinkedMomentTargetIdType
	local UseRefResult3 = ReactModule.useRef(nil)
	
	if DeepLinkedMomentId ~= nil then
		local Text: string = `{DeepLinkedMomentId}:{tostring(DeepLinkedMomentTargetIdType)}`
		
		if UseRefResult3.current ~= Text then
			GetDeepLinkStoreModule().setDeepLinkedMoment(DeepLinkedMomentId, DeepLinkedMomentTargetIdType)
			UseRefResult3.current = Text
		end
	end
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: FeedKind (copy), ImmersiveFeedKind (upval), CreateUserMomentsFeedSourceModule (upval), TargetUserId (copy), InitialIndex (copy), InitialMomentId (copy), IsStudioModule (upval), GetFFlagArgusStudioMockFeedModule (upval), CreateMockFeedSourceFunction (upval), CreateMomentsFeedSourceModule (upval), Current (copy), Current1 (copy)
		return if FeedKind == ImmersiveFeedKind.User then CreateUserMomentsFeedSourceModule(TargetUserId or 0, {
			initialIndex = InitialIndex,
			initialMomentId = InitialMomentId
		}) elseif IsStudioModule() and GetFFlagArgusStudioMockFeedModule() then CreateMockFeedSourceFunction() else CreateMomentsFeedSourceModule(Current.getMomentsSessionId, { signalTracker = Current1 })
	end, {
		FeedKind, TargetUserId, InitialIndex, InitialMomentId, Current, Current1
	})
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: FeedKind (copy), ImmersiveFeedKind (upval), FFlagEnableArgus (upval), CreateRecommendationTelemetryFunction (upval), Current (copy), Current1 (copy)
		return if FeedKind == ImmersiveFeedKind.Trending and FFlagEnableArgus then CreateRecommendationTelemetryFunction({
			getMomentsSessionId = Current.getMomentsSessionId,
			signalTracker = Current1
		}) else nil
	end, { FeedKind, Current, Current1 })
	local SessionSource = p1.sessionSource
	ReactModule.useEffect(function()
		-- upvalues: Current (copy), SessionSource (copy), LogMomentsLayerExposureFunction (upval), FStringMomentsExperienceJoinActionTextIxpLayerModule (upval), Moments (upval), FireAnalyticsEventFunction (upval), EventNames (upval), Analytics (upval)
		Current.setSessionSource(SessionSource)
		LogMomentsLayerExposureFunction(FStringMomentsExperienceJoinActionTextIxpLayerModule)
		
		if require(Moments.Flags.FFlagMomentsCreatorAttributionIxpEnabled) then
			LogMomentsLayerExposureFunction(require(Moments.Flags.FStringMomentsCreatorAttributionIxpLayer))
		end
		if require(Moments.Flags.FFlagMomentsFeedIxpEnabled) then
			LogMomentsLayerExposureFunction(require(Moments.Flags.FStringMomentsFeedIxpLayer))
		end
		FireAnalyticsEventFunction(EventNames.TapMomentsTab, {
			moments_session_id = Current.getMomentsSessionId(false),
			source = SessionSource
		})
		Analytics.reportMomentsSessionStarted(SessionSource)
		local MomentsSessionHeartbeat = Analytics.createMomentsSessionHeartbeat()
		
		if MomentsSessionHeartbeat ~= nil then
			MomentsSessionHeartbeat.start(SessionSource)
		end
		return function()
			-- upvalues: MomentsSessionHeartbeat (copy), Current (upval), FireAnalyticsEventFunction (upval), EventNames (upval), SessionSource (upval), Analytics (upval)
			if MomentsSessionHeartbeat ~= nil then
				MomentsSessionHeartbeat.stop()
			end
			FireAnalyticsEventFunction(EventNames.MomentsSessionEnded, {
				moments_session_id = Current.getMomentsSessionId(false),
				source = SessionSource,
				duration_seconds = tostring((math.floor(os.clock() - Current.getSessionStartTime(false))))
			})
			Analytics.reportMomentsSessionEnded(SessionSource)
		end
	end, { SessionSource, Current })
	local UseNavigationFocusResult = UseNavigationFocusFunction()
	local UseSignalStateResult = UseSignalStateFunction(FeedPlaybackSuspension.getSuspended)
	local UseSignalStateResult1 = UseSignalStateFunction(GetMomentsPreferencesStoreModule(false).getIsTeleporting)
	local UseSignalStateResult2 = UseSignalStateFunction(ReportModalCovering.getCovering)
	local NoIsCreating: boolean = UseNavigationFocusResult and (not UseSignalStateResult and (not UseSignalStateResult1 and (not UseSignalStateResult2 and not IsCreating)))
	local UseResult1 = ReactModule.useCallback(function(p2)
		-- upvalues: UseRefResult (copy)
		local Current = UseRefResult.current
		
		if Current ~= nil then
			Current.flushView(p2)
		end
	end, {})
	local UseResult2 = ReactModule.useCallback(function(p2)
		-- upvalues: UseRefResult (copy)
		local Current = UseRefResult.current
		
		if Current ~= nil then
			Current.refresh(p2)
		end
	end, {})
	local UseNavigationResult = if FFlagMomentsFlushDwellBeforeNavigationModule then UseNavigationFunction() else nil
	ReactModule.useEffect(function()
		-- upvalues: FFlagMomentsFlushDwellBeforeNavigationModule (upval), UseNavigationResult (ref), RoactNavigationModule (upval), UseResult1 (copy)
		if FFlagMomentsFlushDwellBeforeNavigationModule and UseNavigationResult ~= nil and UseNavigationResult.addListener ~= nil then
			local AddListenerResult = UseNavigationResult.addListener(RoactNavigationModule.Events.WillBlur, function()
				-- upvalues: UseResult1 (upval)
				UseResult1()
			end)
			
			return function()
				-- upvalues: AddListenerResult (copy)
				AddListenerResult.remove()
			end
		else
			return nil
		end
	end, { UseNavigationResult, UseResult1 })
	local OnBackFunction = p1.onBack
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: FFlagMomentsFlushDwellBeforeNavigationModule (upval), UseResult1 (copy), FFlagMomentsNavigationEventModule (upval), NavigationDestinationTypeModule (upval), OnBackFunction (copy)
		if FFlagMomentsFlushDwellBeforeNavigationModule then
			UseResult1(if FFlagMomentsNavigationEventModule then NavigationDestinationTypeModule.Exit else nil)
		end
		OnBackFunction()
	end, { OnBackFunction, UseResult1 })
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: FireAnalyticsEventFunction (upval), EventNames (upval), UseResult2 (copy), FFlagMomentsNavigationEventModule (upval), NavigationDestinationTypeModule (upval)
		FireAnalyticsEventFunction(EventNames.FeedHomeButtonPressed)
		UseResult2(if FFlagMomentsNavigationEventModule then NavigationDestinationTypeModule.Trending else nil)
	end, { UseResult2 })
	local OpenOwnMomentsFunction = p1.openOwnMoments
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: FireAnalyticsEventFunction (upval), EventNames (upval), OpenOwnMomentsFunction (copy), FFlagMomentsFlushDwellBeforeNavigationModule (upval), UseResult1 (copy), FFlagMomentsNavigationEventModule (upval), NavigationDestinationTypeModule (upval)
		FireAnalyticsEventFunction(EventNames.MyCreationButtonPressed)
		
		if OpenOwnMomentsFunction ~= nil then
			if FFlagMomentsFlushDwellBeforeNavigationModule then
				UseResult1(if FFlagMomentsNavigationEventModule then NavigationDestinationTypeModule.MyMoments else nil)
			end
			OpenOwnMomentsFunction()
		end
	end, { OpenOwnMomentsFunction, UseResult1 })
	local IsFeedKindMatch: boolean = MomentsImmersiveNavigationMenu and FeedKind == ImmersiveFeedKind.Trending
	local Element = ReactModule.createElement(PushedFeedSafeAreaProvider, nil, (ReactModule.createElement(MomentsFeedSurfaceModule, {
		source = UseMemoResult,
		telemetry = UseMemoResult1,
		inactiveDestination = if FFlagMomentsNavigationEventModule then if IsCreating then NavigationDestinationTypeModule.Create elseif UseSignalStateResult2 then NavigationDestinationTypeModule.Report else nil else nil,
		active = UseNavigationFocusResult and (not UseSignalStateResult2 and not IsCreating),
		playbackActive = NoIsCreating,
		initialIndex = InitialIndex,
		header = ReactModule.useMemo(function()
			-- upvalues: ReactModule (upval), MomentsBackHeaderModule (upval), UseResult3 (copy), NoFFlagMomentsCreationFeatureGate (copy), UseResult (copy), IsFeedKindMatch (copy), UseResult4 (copy), UseResult5 (copy)
			return ReactModule.createElement(MomentsBackHeaderModule, {
				onBack = UseResult3,
				onCreatePressed = if NoFFlagMomentsCreationFeatureGate then UseResult else nil,
				onNavigateToTrending = if IsFeedKindMatch then UseResult4 else nil,
				onNavigateToMyMoments = if IsFeedKindMatch then UseResult5 else nil
			})
		end, {
			UseResult3, NoFFlagMomentsCreationFeatureGate, UseResult, IsFeedKindMatch,
			UseResult4, UseResult5
		}),
		controllerRef = UseRefResult
	})))
	
	return ReactModule.createElement(MomentsHostShellModule, {
		sessionStore = Current,
		openProfile = p1.openProfile,
		openOwnMoments = p1.openOwnMoments,
		openMomentsFeedReport = p1.openMomentsFeedReport,
		openAvatarLookTryOn = if FFlagMomentsAvatarLookTryOn then p1.openAvatarLookTryOn else nil,
		openMomentCommentReport = p1.openMomentCommentReport,
		openBlockUser = p1.openBlockUser
	}, if NoFFlagMomentsCreationFeatureGate then ReactModule.createElement(View, {
		backgroundStyle = if FFlagMomentsRenderAvatarPostsInFeed then { Transparency = 1 } else nil,
		tag = {
			["size-full"] = FFlagMomentsRenderAvatarPostsInFeed,
			["size-full bg-surface-0"] = not FFlagMomentsRenderAvatarPostsInFeed
		}
	}, {
		Feed = Element,
		CreationFlowOverlay = if IsCreating then ReactModule.createElement(View, {
			tag = "size-full",
			ZIndex = ConstantsModule.DisplayOrder.Modals
		}, {
			Screen = ReactModule.createElement(CreationFlowScreen, { host = UseUploadHostModuleResult })
		}) else nil,
		FtuxOverlay = if ShowFtux then ReactModule.createElement(View, {
			tag = "size-full",
			ZIndex = ConstantsModule.DisplayOrder.Modals
		}, {
			Screen = ReactModule.createElement(FTUXEducationScreenModule, { onClose = UseCreationEntryModuleResult.onExitFtux })
		}) else nil
	}) else Element)
end)