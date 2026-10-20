local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local HttpService = game:GetService("HttpService")
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local RoactNavigationModule = require(Parent.RoactNavigation)
local SharedFlagsModule = require(Parent.SharedFlags)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local RobloxAppEventsModule = require(Parent.RobloxAppEvents)
local GetDeepLinkStoreModule = require(Moments.Stores.GetDeepLinkStore)
local CreateMomentsStoreModule = require(Moments.Stores.GetMomentsStore.createMomentsStore)
local GetImmersiveChromeStoreModule = require(Moments.Stores.GetImmersiveChromeStore)
local GetFFlagMomentsFixDeeplinkRefocusModule = require(Moments.Flags.GetFFlagMomentsFixDeeplinkRefocus)
local FFlagMomentsEmojiSetsApiModule = require(Moments.Flags.FFlagMomentsEmojiSetsApi)
local FStringMomentsExperienceJoinActionTextIxpLayerModule = require(Moments.Flags.FStringMomentsExperienceJoinActionTextIxpLayer)
local UseMomentsTabIsVisibleModule = require(Moments.Hooks.useMomentsTabIsVisible)
local ConsumeEntrySourceModule = require(Moments.Utils.consumeEntrySource)
local LogMomentsLayerExposureFunction = MomentsCommonModule.Utils.logMomentsLayerExposure
local InnerNavigatorModule = require(Moments.Navigation.InnerNavigator)
local MomentsHostShellModule = require(Moments.Components.MomentsHostShell)
local _ = require(Moments.MomentsHostContext)
local UseResetTeleportingOnGameLeaveModule = require(Moments.Hooks.useResetTeleportingOnGameLeave)
local GetExperienceDetailsSheetStoreModule = require(Moments.ExperienceDetailsSheet.Sheet.getExperienceDetailsSheetStore)
local MomentsGetMomentsReactionsStoreModule = require(Parent.DataHydration.MomentsGetMomentsReactionsStore)
local Analytics = MomentsCommonModule.Analytics
local EventNames = Analytics.EventNames
local FunnelEventNames = Analytics.FunnelEventNames
local SessionManager = Analytics.SessionManager
local FireAnalyticsEventFunction = Analytics.fireAnalyticsEvent
local FireFunnelAnalyticsEventFunction = Analytics.fireFunnelAnalyticsEvent
local MomentsSurfaceLoadManager = MomentsCommonModule.Performance.MomentsSurfaceLoadManager
local UseMomentsGatingFunction = MomentsCommonModule.Hooks.useMomentsGating
local CanRenderNativeMomentsFunction = MomentsCommonModule.canRenderNativeMoments
local MomentsSessionHeartbeats = {}
local FFlagMomentsPassFeedItemIdToBackendApis = SharedFlagsModule.FFlagMomentsPassFeedItemIdToBackendApis
local FFlagMomentsAvatarLookTryOn = SharedFlagsModule.FFlagMomentsAvatarLookTryOn
local ShareLinkTargetIdType = require(Parent.MomentsTypes).Enums.ShareLinkTargetIdType
local GetActiveRoutesFunction = require(Parent.Navigation).getActiveRoutes

local function _(p1)
	return if type(p1) == "string" and p1 ~= "" then p1 elseif type(p1) == "number" then tostring(p1) else nil
end

local function getMomentIdFromLaunchData(LaunchData)
	-- upvalues: HttpService (copy)
	if type(LaunchData) ~= "string" or LaunchData == "" then
		return nil
	end
	local Success, Result = pcall(function()
		-- upvalues: HttpService (upval), LaunchData (copy)
		return HttpService:JSONDecode(LaunchData)
	end)
	
	if Success and type(Result) == "table" then
		local PostId = Result.postId
		
		return if type(PostId) == "string" and PostId ~= "" then PostId elseif type(PostId) == "number" then tostring(PostId) else nil
	else
		return nil
	end
end

local _ = function(FeedItemId)
	-- upvalues: ShareLinkTargetIdType (copy)
	return if FeedItemId == ShareLinkTargetIdType.FeedItemId then ShareLinkTargetIdType.FeedItemId else nil
end

local function getTargetIdTypeFromLaunchData(LaunchData)
	-- upvalues: HttpService (copy), ShareLinkTargetIdType (copy)
	if type(LaunchData) == "string" and LaunchData ~= "" then
		local Success, Result = pcall(function()
			-- upvalues: HttpService (upval), LaunchData (copy)
			return HttpService:JSONDecode(LaunchData)
		end)
		
		return if Success and type(Result) == "table" and Result.targetIdType == ShareLinkTargetIdType.FeedItemId then ShareLinkTargetIdType.FeedItemId else nil
	else
		return nil
	end
end

local function getDeepLinkedMomentIdFromParams(Params)
	-- upvalues: getMomentIdFromLaunchData (copy)
	if type(Params) ~= "table" then
		return nil
	end
	local ExtraProps = Params.extraProps
	
	if type(ExtraProps) == "table" then
		local PostId = ExtraProps.postId
		local PostId1 = if type(PostId) == "string" and PostId ~= "" then PostId elseif type(PostId) == "number" then tostring(PostId) else nil
		
		if PostId1 ~= nil then
			return PostId1
		end
		local MomentIdFromLaunchData = getMomentIdFromLaunchData(ExtraProps.launchData)
		
		if MomentIdFromLaunchData ~= nil then
			return MomentIdFromLaunchData
		end
	end
	local PostId = Params.postId
	local PostId2 = if type(PostId) == "string" and PostId ~= "" then PostId elseif type(PostId) == "number" then tostring(PostId) else nil
	
	return if PostId2 == nil then getMomentIdFromLaunchData(Params.launchData) else PostId2
end

local function getDeepLinkedMomentTargetIdTypeFromParams(Params)
	-- upvalues: FFlagMomentsPassFeedItemIdToBackendApis (copy), ShareLinkTargetIdType (copy), getMomentIdFromLaunchData (copy), getTargetIdTypeFromLaunchData (copy)
	if not FFlagMomentsPassFeedItemIdToBackendApis or type(Params) ~= "table" then
		return nil
	end
	local ExtraProps = Params.extraProps
	
	if type(ExtraProps) == "table" then
		local PostId = ExtraProps.postId
		
		if (if type(PostId) == "string" and PostId ~= "" then PostId elseif type(PostId) == "number" then tostring(PostId) else nil) ~= nil then
			return if ExtraProps.targetIdType == ShareLinkTargetIdType.FeedItemId then ShareLinkTargetIdType.FeedItemId else nil
		elseif getMomentIdFromLaunchData(ExtraProps.launchData) ~= nil then
			return (getTargetIdTypeFromLaunchData(ExtraProps.launchData))
		end
	end
	local PostId = Params.postId
	local PostId1 = if type(PostId) == "string" and PostId ~= "" then PostId elseif type(PostId) == "number" then tostring(PostId) else nil
	
	return if PostId1 == nil then getTargetIdTypeFromLaunchData(Params.launchData) elseif Params.targetIdType == ShareLinkTargetIdType.FeedItemId then ShareLinkTargetIdType.FeedItemId else nil
end

local function getDeepLinkRequestFromNavigationParams(DangerouslyGetParentResult, p1)
	-- upvalues: FFlagMomentsPassFeedItemIdToBackendApis (copy), getDeepLinkedMomentIdFromParams (copy), getDeepLinkedMomentTargetIdTypeFromParams (copy)
	if not DangerouslyGetParentResult or not DangerouslyGetParentResult.getParam then
		return nil
	end
	local config = {
		extraProps = DangerouslyGetParentResult.getParam("extraProps"),
		postId = DangerouslyGetParentResult.getParam("postId"),
		targetIdType = if FFlagMomentsPassFeedItemIdToBackendApis then DangerouslyGetParentResult.getParam("targetIdType") else nil,
		launchData = DangerouslyGetParentResult.getParam("launchData")
	}
	local DeepLinkedMomentIdFromParams = getDeepLinkedMomentIdFromParams(config)
	
	if DeepLinkedMomentIdFromParams == nil then
		return nil
	else
		local DeepLinkedMomentTargetIdTypeFromParams = getDeepLinkedMomentTargetIdTypeFromParams(config)
		
		return {
			momentId = DeepLinkedMomentIdFromParams,
			targetIdType = DeepLinkedMomentTargetIdTypeFromParams,
			key = if FFlagMomentsPassFeedItemIdToBackendApis then `{p1}:params:{tostring(config.extraProps)}:{tostring(config.postId)}:{tostring(config.launchData)}:{DeepLinkedMomentIdFromParams}:{tostring(DeepLinkedMomentTargetIdTypeFromParams)}` else `{p1}:params:{tostring(config.extraProps)}:{tostring(config.postId)}:{tostring(config.launchData)}:{DeepLinkedMomentIdFromParams}`
		}
	end
end

local function getDeepLinkRequestFromNavigationState(State, p1)
	-- upvalues: GetActiveRoutesFunction (copy), getDeepLinkedMomentIdFromParams (copy), getDeepLinkedMomentTargetIdTypeFromParams (copy), FFlagMomentsPassFeedItemIdToBackendApis (copy)
	local ActiveRoutes = GetActiveRoutesFunction(State)
	local ActiveRoute = nil
	local DeepLinkedMomentIdFromParams = nil
	
	for i = #ActiveRoutes, 1, -1 do
		ActiveRoute = ActiveRoutes[i]
		DeepLinkedMomentIdFromParams = getDeepLinkedMomentIdFromParams(ActiveRoute.params)
		
		if DeepLinkedMomentIdFromParams ~= nil then
			local DeepLinkedMomentTargetIdTypeFromParams = getDeepLinkedMomentTargetIdTypeFromParams(ActiveRoute.params)
			
			return {
				momentId = DeepLinkedMomentIdFromParams,
				targetIdType = DeepLinkedMomentTargetIdTypeFromParams,
				key = if FFlagMomentsPassFeedItemIdToBackendApis then `{p1}:state:{tostring(ActiveRoute.key)}:{tostring(ActiveRoute.params)}:{DeepLinkedMomentIdFromParams}:{tostring(DeepLinkedMomentTargetIdTypeFromParams)}` else `{p1}:state:{tostring(ActiveRoute.key)}:{tostring(ActiveRoute.params)}:{DeepLinkedMomentIdFromParams}`
			}
		end
	end
	return nil
end

local function getDeepLinkRequest(Navigation)
	-- upvalues: getDeepLinkRequestFromNavigationParams (copy), getDeepLinkRequestFromNavigationState (copy)
	local DangerouslyGetParentResult = Navigation
	local Count = 0
	local DeepLinkRequestFromNavigationParams = nil
	while DangerouslyGetParentResult ~= nil do
		local Text = tostring(Count)
		DeepLinkRequestFromNavigationParams = getDeepLinkRequestFromNavigationParams(DangerouslyGetParentResult, Text) or getDeepLinkRequestFromNavigationState(DangerouslyGetParentResult.state, Text)
		
		if DeepLinkRequestFromNavigationParams ~= nil then
			return DeepLinkRequestFromNavigationParams
		end
		if not DangerouslyGetParentResult._dangerouslyGetParent then break end
		DangerouslyGetParentResult = DangerouslyGetParentResult._dangerouslyGetParent()
		Count += 1
	end
	return nil
end

local _ = function(p2)
	if p2 and p2.getParam then
		local ExtraPropsParam = p2.getParam("extraProps")
		
		return if type(ExtraPropsParam) == "table" and type(ExtraPropsParam.source) == "string" then ExtraPropsParam.source else p2.getParam("source", "watch_tab")
	else
		return "watch_tab"
	end
end

local _ = function(p2, p3, p4)
	-- upvalues: FFlagMomentsPassFeedItemIdToBackendApis (copy)
	if FFlagMomentsPassFeedItemIdToBackendApis then
		p2.setDeepLinkedMoment(p3, p4)
		
		return
	else
		p2.setDeepLinkedMomentId(p3)
	end
end

local function MomentsTabEntry(Current)
	-- upvalues: ReactModule (copy), CreateMomentsStoreModule (copy), UseResetTeleportingOnGameLeaveModule (copy), GetFFlagMomentsFixDeeplinkRefocusModule (copy), getDeepLinkRequest (copy), GetDeepLinkStoreModule (copy), FFlagMomentsPassFeedItemIdToBackendApis (copy), RobloxAppEventsModule (copy), AppPage (copy), ConsumeEntrySourceModule (copy), LogMomentsLayerExposureFunction (copy), FStringMomentsExperienceJoinActionTextIxpLayerModule (copy), Moments (copy), FFlagMomentsEmojiSetsApiModule (copy), MomentsGetMomentsReactionsStoreModule (copy), FireAnalyticsEventFunction (copy), EventNames (copy), Analytics (copy), MomentsSessionHeartbeats (copy), SessionManager (copy), FunnelEventNames (copy), FireFunnelAnalyticsEventFunction (copy), MomentsSurfaceLoadManager (copy), GetExperienceDetailsSheetStoreModule (copy), GetImmersiveChromeStoreModule (copy), RoactNavigationModule (copy), UseMomentsTabIsVisibleModule (copy), FFlagMomentsAvatarLookTryOn (copy), UseMomentsGatingFunction (copy), CanRenderNativeMomentsFunction (copy), MomentsHostShellModule (copy), InnerNavigatorModule (copy)
	local UseRefResult = ReactModule.useRef(Current)
	UseRefResult.current = Current
	local UseRefResult1 = ReactModule.useRef(false)
	local UseRefResult2 = ReactModule.useRef(false)
	local UseRefResult3 = ReactModule.useRef(nil)
	
	if UseRefResult3.current == nil then
		UseRefResult3.current = CreateMomentsStoreModule()
	end
	UseResetTeleportingOnGameLeaveModule()
	local FFlagMomentsFixDeeplinkRefocusModule = GetFFlagMomentsFixDeeplinkRefocusModule()
	local UseRefResult4 = ReactModule.useRef(nil)
	local UseRefResult5 = ReactModule.useRef({})
	local DeepLinkRequest = getDeepLinkRequest(Current.navigation)
	local MomentId = if DeepLinkRequest == nil then nil else DeepLinkRequest.momentId
	local Key = if DeepLinkRequest == nil then nil else DeepLinkRequest.key
	
	if MomentId ~= nil and UseRefResult4.current ~= Key then
		local DeepLinkStoreModule = GetDeepLinkStoreModule()
		local TargetIdType = if DeepLinkRequest == nil then nil else DeepLinkRequest.targetIdType
		
		if FFlagMomentsPassFeedItemIdToBackendApis then
			DeepLinkStoreModule.setDeepLinkedMoment(MomentId, TargetIdType)
		else
			DeepLinkStoreModule.setDeepLinkedMomentId(MomentId)
		end
		UseRefResult4.current = Key
	end
	ReactModule.useEffect(function()
		-- upvalues: MomentId (copy), UseRefResult2 (copy), RobloxAppEventsModule (upval), AppPage (upval)
		if MomentId ~= nil and UseRefResult2.current then
			RobloxAppEventsModule.ReloadPage:fire(AppPage.Moments)
		end
		UseRefResult2.current = true
	end, { Key, MomentId, Current.navigation })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult1 (copy), UseRefResult3 (copy), FFlagMomentsFixDeeplinkRefocusModule (copy), UseRefResult5 (copy), ConsumeEntrySourceModule (upval), UseRefResult (copy), LogMomentsLayerExposureFunction (upval), FStringMomentsExperienceJoinActionTextIxpLayerModule (upval), Moments (upval), FFlagMomentsEmojiSetsApiModule (upval), MomentsGetMomentsReactionsStoreModule (upval), FireAnalyticsEventFunction (upval), EventNames (upval), Analytics (upval), MomentsSessionHeartbeats (upval), SessionManager (upval), FunnelEventNames (upval), FireFunnelAnalyticsEventFunction (upval)
		if UseRefResult1.current then return end
		UseRefResult1.current = true
		local Current = UseRefResult3.current
		local ConsumeEntrySourceModuleResult = nil
		
		if FFlagMomentsFixDeeplinkRefocusModule and UseRefResult5 ~= nil then
			ConsumeEntrySourceModuleResult = ConsumeEntrySourceModule(UseRefResult.current.navigation, UseRefResult5.current)
		else
			local Navigation = UseRefResult.current.navigation
			
			if Navigation and Navigation.getParam then
				local ExtraPropsParam = Navigation.getParam("extraProps")
				ConsumeEntrySourceModuleResult = if type(ExtraPropsParam) == "table" and type(ExtraPropsParam.source) == "string" then ExtraPropsParam.source else Navigation.getParam("source", "watch_tab")
			else
				ConsumeEntrySourceModuleResult = "watch_tab"
			end
		end
		Current.resetSession()
		Current.setSessionSource(ConsumeEntrySourceModuleResult)
		LogMomentsLayerExposureFunction(FStringMomentsExperienceJoinActionTextIxpLayerModule)
		
		if require(Moments.Flags.FFlagMomentsFeedIxpEnabled) then
			LogMomentsLayerExposureFunction(require(Moments.Flags.FStringMomentsFeedIxpLayer))
		end
		if FFlagMomentsEmojiSetsApiModule then
			local GetAndFetchEmojiSetsFunction: () -> () = MomentsGetMomentsReactionsStoreModule(false).getAndFetchEmojiSets
			assert(GetAndFetchEmojiSetsFunction ~= nil, "expected getAndFetchEmojiSets when FFlagMomentsEmojiSetsApi is on")
			GetAndFetchEmojiSetsFunction()
		end
		FireAnalyticsEventFunction(EventNames.TapMomentsTab, {
			moments_session_id = Current.getMomentsSessionId(false),
			source = ConsumeEntrySourceModuleResult
		})
		Analytics.reportMomentsSessionStarted(ConsumeEntrySourceModuleResult)
		local MomentsSessionHeartbeat = Analytics.createMomentsSessionHeartbeat()
		MomentsSessionHeartbeats[Current.getMomentsSessionId(false)] = MomentsSessionHeartbeat
		MomentsSessionHeartbeat.start(ConsumeEntrySourceModuleResult)
		FireFunnelAnalyticsEventFunction(FunnelEventNames.FunnelTypes.AppNavigation, FunnelEventNames.AppNavigationSteps.AppLaunched, (SessionManager.startSession(FunnelEventNames.FunnelTypes.AppNavigation)))
	end, { FFlagMomentsFixDeeplinkRefocusModule })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult1 (copy), MomentsSurfaceLoadManager (upval), GetExperienceDetailsSheetStoreModule (upval), UseRefResult3 (copy), FireAnalyticsEventFunction (upval), EventNames (upval), MomentsSessionHeartbeats (upval), Analytics (upval), SessionManager (upval), FunnelEventNames (upval)
		if not UseRefResult1.current then return end
		UseRefResult1.current = false
		MomentsSurfaceLoadManager.abort("blur")
		GetExperienceDetailsSheetStoreModule(false).close()
		local Current = UseRefResult3.current
		FireAnalyticsEventFunction(EventNames.MomentsSessionEnded, {
			moments_session_id = Current.getMomentsSessionId(false),
			source = Current.getSessionSource(false),
			duration_seconds = tostring((math.floor(os.clock() - Current.getSessionStartTime(false))))
		})
		local MomentsSessionId = Current.getMomentsSessionId(false)
		local MomentsSessionHeartbeat = MomentsSessionHeartbeats[MomentsSessionId]
		
		if MomentsSessionHeartbeat then
			MomentsSessionHeartbeat.stop()
			MomentsSessionHeartbeats[MomentsSessionId] = nil
		end
		Analytics.reportMomentsSessionEnded(Current.getSessionSource(false))
		SessionManager.endSession(FunnelEventNames.FunnelTypes.AppNavigation)
	end, {})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: GetImmersiveChromeStoreModule (upval), UseRefResult (copy)
		GetImmersiveChromeStoreModule(false).setOverlayCovering(false)
		local OnTabFocusedFunction: () -> () = UseRefResult.current.onTabFocused
		
		if OnTabFocusedFunction then
			OnTabFocusedFunction()
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: Current (copy), UseResult (copy), UseResult2 (copy), UseResult1 (copy), RoactNavigationModule (upval), getDeepLinkRequest (upval), FFlagMomentsFixDeeplinkRefocusModule (copy), UseRefResult4 (copy), GetDeepLinkStoreModule (upval), FFlagMomentsPassFeedItemIdToBackendApis (upval), RobloxAppEventsModule (upval), AppPage (upval)
		local Navigation = Current.navigation
		
		if Navigation and Navigation.addListener then
			UseResult()
			UseResult2()
			local AddListenerResult = Navigation.addListener(RoactNavigationModule.Events.DidFocus, function()
				-- upvalues: getDeepLinkRequest (upval), Navigation (copy), FFlagMomentsFixDeeplinkRefocusModule (upval), UseRefResult4 (upval), GetDeepLinkStoreModule (upval), FFlagMomentsPassFeedItemIdToBackendApis (upval), RobloxAppEventsModule (upval), AppPage (upval), UseResult (upval), UseResult2 (upval)
				local DeepLinkRequest = getDeepLinkRequest(Navigation)
				local IsCurrentMatch: boolean = FFlagMomentsFixDeeplinkRefocusModule and (DeepLinkRequest ~= nil and UseRefResult4.current == DeepLinkRequest.key)
				
				if DeepLinkRequest ~= nil and not IsCurrentMatch then
					local DeepLinkStoreModule = GetDeepLinkStoreModule()
					local MomentId = DeepLinkRequest.momentId
					local TargetIdType = DeepLinkRequest.targetIdType
					
					if FFlagMomentsPassFeedItemIdToBackendApis then
						DeepLinkStoreModule.setDeepLinkedMoment(MomentId, TargetIdType)
					else
						DeepLinkStoreModule.setDeepLinkedMomentId(MomentId)
					end
					UseRefResult4.current = DeepLinkRequest.key
					RobloxAppEventsModule.ReloadPage:fire(AppPage.Moments)
				end
				UseResult()
				UseResult2()
			end)
			local AddListenerResult1 = Navigation.addListener(RoactNavigationModule.Events.WillBlur, function()
				-- upvalues: UseResult1 (upval)
				UseResult1()
			end)
			
			return function()
				-- upvalues: UseResult1 (upval), AddListenerResult (copy), AddListenerResult1 (copy)
				UseResult1()
				AddListenerResult.remove()
				AddListenerResult1.remove()
			end
		else
			UseResult()
			UseResult2()
			
			return function()
				-- upvalues: UseResult1 (upval)
				UseResult1()
			end
		end
	end, { UseResult, UseResult1, UseResult2 })
	local UseMomentsTabIsVisibleModuleResult = UseMomentsTabIsVisibleModule()
	ReactModule.useEffect(function()
		-- upvalues: UseMomentsTabIsVisibleModuleResult (copy), UseResult2 (copy)
		if UseMomentsTabIsVisibleModuleResult then
			UseResult2()
		end
	end, { UseMomentsTabIsVisibleModuleResult, UseResult2 })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Current (copy), GetImmersiveChromeStoreModule (upval), FFlagMomentsAvatarLookTryOn (upval)
		local OpenProfileFunction = Current.openProfile
		local OpenOwnMomentsFunction = Current.openOwnMoments
		
		return {
			openProfile = if OpenProfileFunction then function(p2)
				-- upvalues: GetImmersiveChromeStoreModule (upval), OpenProfileFunction (copy)
				GetImmersiveChromeStoreModule(false).setOverlayCovering(true)
				OpenProfileFunction(p2)
			end else nil,
			openOwnMoments = if OpenOwnMomentsFunction then function()
				-- upvalues: GetImmersiveChromeStoreModule (upval), OpenOwnMomentsFunction (copy)
				GetImmersiveChromeStoreModule(false).setOverlayCovering(true)
				OpenOwnMomentsFunction()
			end else nil,
			openMomentsFeedReport = Current.openMomentsFeedReport,
			openAvatarLookTryOn = if FFlagMomentsAvatarLookTryOn then Current.openAvatarLookTryOn else nil,
			openMomentCommentReport = Current.openMomentCommentReport,
			openBlockUser = Current.openBlockUser
		}
	end, {
		Current.openProfile, Current.openOwnMoments, Current.openMomentsFeedReport,
		Current.openMomentCommentReport, Current.openBlockUser,
		if FFlagMomentsAvatarLookTryOn then Current.openAvatarLookTryOn else nil
	})
	
	return if CanRenderNativeMomentsFunction((UseMomentsGatingFunction())) then ReactModule.createElement(MomentsHostShellModule, {
		sessionStore = UseRefResult3.current,
		openProfile = UseMemoResult.openProfile,
		openOwnMoments = UseMemoResult.openOwnMoments,
		openMomentsFeedReport = UseMemoResult.openMomentsFeedReport,
		openAvatarLookTryOn = if FFlagMomentsAvatarLookTryOn then UseMemoResult.openAvatarLookTryOn else nil,
		openMomentCommentReport = UseMemoResult.openMomentCommentReport,
		openBlockUser = UseMemoResult.openBlockUser
	}, ReactModule.createElement(InnerNavigatorModule, { navigation = Current.navigation })) else nil
end

local MomentsTabEntryScreen = ReactModule.Component:extend("MomentsTabEntryScreen")

function MomentsTabEntryScreen.render(p2)
	-- upvalues: ReactModule (copy), MomentsTabEntry (copy)
	return ReactModule.createElement(MomentsTabEntry, p2.props)
end

MomentsTabEntryScreen.router = InnerNavigatorModule.router

return MomentsTabEntryScreen