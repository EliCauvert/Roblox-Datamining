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
local _ = require(moments.MomentsHostContext)
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
local logMomentsLayerExposure = momentsCommonModule.Utils.logMomentsLayerExposure
local fFlagMomentsFlushDwellBeforeNavigationModule = require(moments.Flags.FFlagMomentsFlushDwellBeforeNavigation)
local fFlagMomentsFlyoutCreateButtonModule = require(moments.Flags.FFlagMomentsFlyoutCreateButton)
local momentsImmersiveNavigationMenu = game:DefineFastFlag("MomentsImmersiveNavigationMenu", false)
local fStringMomentsExperienceJoinActionTextIxpLayerModule = require(moments.Flags.FStringMomentsExperienceJoinActionTextIxpLayer)
local getFFlagArgusStudioMockFeedModule = require(moments.Flags.GetFFlagArgusStudioMockFeed)
local createSignalTracker = require(moments.SignalTracker).createSignalTracker
local view = foundationModule.View
local useNavigationFocus = navigationModule.useNavigationFocus
local useNavigation = navigationModule.useNavigation
local useSignalState = signalsReactModule.useSignalState
local fFlagEnableArgus = sharedFlagsModule.FFlagEnableArgus
local fFlagMomentsOptimisticProfilePending = sharedFlagsModule.FFlagMomentsOptimisticProfilePending
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
	-- upvalues: reactModule (ref), createMomentsStoreModule (ref), fFlagEnableArgus (ref), createSignalTracker (ref), fFlagMomentsOptimisticProfilePending (ref), fFlagMomentsFlyoutCreateButtonModule (ref), useCreationEntryModule (ref), useUploadHostModule (ref), logCreateIntentModule (ref), funnelEventNames (ref), immersiveFeedKind (ref), getDeepLinkStoreModule (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), createUserMomentsFeedSourceModule (ref), isStudioModule (ref), getFFlagArgusStudioMockFeedModule (ref), createMockFeedSource (ref), createMomentsFeedSourceModule (ref), createRecommendationTelemetry (ref), logMomentsLayerExposure (ref), fStringMomentsExperienceJoinActionTextIxpLayerModule (ref), fireAnalyticsEvent (ref), eventNames (ref), fFlagMomentsRealtimeSessionTelemetry (ref), analytics (ref), fFlagMomentsSessionHeartbeat (ref), useNavigationFocus (ref), useSignalState (ref), feedPlaybackSuspension (ref), getMomentsPreferencesStoreModule (ref), reportModalCovering (ref), fFlagEnableReportingFlowForMomentsFeed (ref), fFlagMomentsFlushDwellBeforeNavigationModule (ref), useNavigation (ref), roactNavigationModule (ref), momentsImmersiveNavigationMenu (ref), momentsBackHeaderModule (ref), momentsFeedSurfaceModule (ref), PushedFeedSafeAreaProvider (ref), view (ref), constantsModule (ref), creationFlowScreen (ref), FTUXEducationScreenModule (ref), momentsHostShellModule (ref)
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
	local var4 = if fFlagMomentsOptimisticProfilePending then p1.initialMomentId else nil
	local var5 = nil
	local var6 = nil
	
	if fFlagMomentsFlyoutCreateButtonModule then
		var5 = useCreationEntryModule({ manageTabBarVisibility = false })
		var6 = useUploadHostModule({
			onExit = var5.onExitCreation,
			captureSource = var5.captureSource
		})
	end
	local var7 = if var5 ~= nil then nil else var5.onCreatePressed
	local var8 = reactModule.useCallback(function()
		-- upvalues: var7 (ref), logCreateIntentModule (copy), funnelEventNames (copy)
		if var7 ~= nil then
			logCreateIntentModule(funnelEventNames.CreationIntentSource.TopBar)
			var7()
		end
	end, { var7 })
	local var9 = fFlagMomentsFlyoutCreateButtonModule and feedKind == immersiveFeedKind.Trending
	local var10 = var9 and (var5 ~= nil and var5.isCreating)
	local var11 = var9 and (var5 ~= nil and var5.showFtux)
	local deepLinkedMomentId = p1.deepLinkedMomentId
	local deepLinkedMomentTargetIdType = p1.deepLinkedMomentTargetIdType
	local var12 = reactModule.useRef(nil)
	
	if deepLinkedMomentId ~= nil then
		local var13 = `{deepLinkedMomentId}:{tostring(deepLinkedMomentTargetIdType)}`
		
		if var12.current ~= var13 then
			local var14 = getDeepLinkStoreModule()
			
			if fFlagMomentsPassFeedItemIdToBackendApis then
				var14.setDeepLinkedMoment(deepLinkedMomentId, deepLinkedMomentTargetIdType)
			else
				var14.setDeepLinkedMomentId(deepLinkedMomentId)
			end
			var12.current = var13
		end
	end
	local var15 = reactModule.useMemo(function()
		-- upvalues: feedKind (ref), immersiveFeedKind (copy), createUserMomentsFeedSourceModule (copy), targetUserId (ref), initialIndex (ref), var4 (ref), isStudioModule (copy), getFFlagArgusStudioMockFeedModule (copy), createMockFeedSource (copy), createMomentsFeedSourceModule (copy), current (ref), current_1 (ref)
		return if feedKind == immersiveFeedKind.User then createUserMomentsFeedSourceModule(targetUserId or 0, { initialIndex = initialIndex, initialMomentId = var4 }) elseif isStudioModule() and getFFlagArgusStudioMockFeedModule() then createMockFeedSource() else createMomentsFeedSourceModule(current.getMomentsSessionId, { signalTracker = current_1 })
	end, {
		feedKind, targetUserId, initialIndex, var4, current, current_1
	})
	local var16 = reactModule.useMemo(function()
		-- upvalues: feedKind (ref), immersiveFeedKind (copy), fFlagEnableArgus (copy), createRecommendationTelemetry (copy), current (ref), current_1 (ref)
		return if feedKind == immersiveFeedKind.Trending and fFlagEnableArgus then createRecommendationTelemetry({
			getMomentsSessionId = current.getMomentsSessionId,
			signalTracker = current_1
		}) else nil
	end, { feedKind, current, current_1 })
	local sessionSource = p1.sessionSource
	reactModule.useEffect(function()
		-- upvalues: current (ref), sessionSource (ref), logMomentsLayerExposure (copy), fStringMomentsExperienceJoinActionTextIxpLayerModule (copy), fireAnalyticsEvent (copy), eventNames (copy), fFlagMomentsRealtimeSessionTelemetry (copy), analytics (copy), fFlagMomentsSessionHeartbeat (copy)
		current.setSessionSource(sessionSource)
		logMomentsLayerExposure(fStringMomentsExperienceJoinActionTextIxpLayerModule)
		fireAnalyticsEvent(eventNames.TapMomentsTab, {
			moments_session_id = current.getMomentsSessionId(false),
			source = sessionSource
		})
		
		if fFlagMomentsRealtimeSessionTelemetry then
			analytics.reportMomentsSessionStarted(sessionSource)
		end
		local var17 = if fFlagMomentsSessionHeartbeat then analytics.createMomentsSessionHeartbeat() else nil
		
		if var17 ~= nil then
			var17.start(sessionSource)
		end
		return function()
			-- upvalues: var17 (ref), current (copy), fireAnalyticsEvent (copy), eventNames (copy), sessionSource (copy), fFlagMomentsRealtimeSessionTelemetry (copy), analytics (copy)
			if var17 ~= nil then
				var17.stop()
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
	local var17 = useNavigationFocus()
	local getCovering = fFlagEnableReportingFlowForMomentsFeed and useSignalState(reportModalCovering.getCovering)
	local var18 = var17 and (not useSignalState(feedPlaybackSuspension.getSuspended) and (not useSignalState(getMomentsPreferencesStoreModule(false).getIsTeleporting) and (not getCovering and not var10)))
	local var19 = reactModule.useCallback(function()
		-- upvalues: var1 (ref)
		local current = var1.current
		
		if current ~= nil then
			current.flushView()
		end
	end, {})
	local var20 = reactModule.useCallback(function()
		-- upvalues: var1 (ref)
		local current = var1.current
		
		if current ~= nil then
			current.refresh()
		end
	end, {})
	local var21 = if fFlagMomentsFlushDwellBeforeNavigationModule then useNavigation() else nil
	reactModule.useEffect(function()
		-- upvalues: fFlagMomentsFlushDwellBeforeNavigationModule (copy), var21 (write), roactNavigationModule (copy), var19 (ref)
		if fFlagMomentsFlushDwellBeforeNavigationModule and var21 ~= nil and var21.addListener ~= nil then
			local var22 = var21.addListener(roactNavigationModule.Events.WillBlur, function()
				-- upvalues: var19 (copy)
				var19()
			end)
			
			return function()
				-- upvalues: var22 (ref)
				var22.remove()
			end
		end
		return nil
	end, { var21, var19 })
	local onBack = p1.onBack
	local var22 = reactModule.useCallback(function()
		-- upvalues: fFlagMomentsFlushDwellBeforeNavigationModule (copy), var19 (ref), onBack (ref)
		if fFlagMomentsFlushDwellBeforeNavigationModule then
			var19()
		end
		onBack()
	end, { onBack, var19 })
	local var23 = reactModule.useCallback(function()
		-- upvalues: fireAnalyticsEvent (copy), eventNames (copy), var20 (ref)
		fireAnalyticsEvent(eventNames.FeedHomeButtonPressed)
		var20()
	end, { var20 })
	local openOwnMoments = p1.openOwnMoments
	local var24 = reactModule.useCallback(function()
		-- upvalues: fireAnalyticsEvent (copy), eventNames (copy), openOwnMoments (ref), fFlagMomentsFlushDwellBeforeNavigationModule (copy), var19 (ref)
		fireAnalyticsEvent(eventNames.MyCreationButtonPressed)
		
		if openOwnMoments ~= nil then
			if fFlagMomentsFlushDwellBeforeNavigationModule then
				var19()
			end
			openOwnMoments()
		end
	end, { openOwnMoments, var19 })
	local var25 = momentsImmersiveNavigationMenu and feedKind == immersiveFeedKind.Trending
	local var26 = reactModule.createElement(PushedFeedSafeAreaProvider, nil, reactModule.createElement(momentsFeedSurfaceModule, {
		source = var15,
		telemetry = var16,
		active = var17 and (not getCovering and not var10),
		playbackActive = var18,
		initialIndex = initialIndex,
		header = reactModule.useMemo(function()
			-- upvalues: reactModule (copy), momentsBackHeaderModule (copy), var22 (ref), var9 (ref), var8 (ref), var25 (ref), var23 (ref), var24 (ref)
			return reactModule.createElement(momentsBackHeaderModule, {
				onBack = var22,
				onCreatePressed = if var9 then var8 else nil,
				onNavigateToTrending = if var25 then var23 else nil,
				onNavigateToMyMoments = if var25 then var24 else nil
			})
		end, {
			var22, var9, var8, var25, var23, var24
		}),
		controllerRef = var1
	}))
	
	return reactModule.createElement(momentsHostShellModule, {
		sessionStore = current,
		openProfile = p1.openProfile,
		openOwnMoments = p1.openOwnMoments,
		openMomentsFeedReport = p1.openMomentsFeedReport,
		openMomentCommentReport = p1.openMomentCommentReport,
		openBlockUser = p1.openBlockUser
	}, if var9 then reactModule.createElement(view, { tag = "size-full bg-surface-0" }, {
		Feed = var26,
		CreationFlowOverlay = if var10 then reactModule.createElement(view, {
			tag = "size-full",
			ZIndex = constantsModule.DisplayOrder.Modals
		}, {
			Screen = reactModule.createElement(creationFlowScreen, { host = var6 })
		}) else nil,
		FtuxOverlay = if var11 then reactModule.createElement(view, {
			tag = "size-full",
			ZIndex = constantsModule.DisplayOrder.Modals
		}, {
			Screen = reactModule.createElement(FTUXEducationScreenModule, { onClose = var5.onExitFtux })
		}) else nil
	}) else var26)
end)