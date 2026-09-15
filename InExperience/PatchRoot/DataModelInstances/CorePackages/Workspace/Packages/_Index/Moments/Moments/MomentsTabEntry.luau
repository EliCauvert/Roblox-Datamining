local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local httpService = game:GetService("HttpService")
local momentsCommonModule = require(parent.MomentsCommon)
local momentsTypesModule = require(parent.MomentsTypes)
local navigationModule = require(parent.Navigation)
local reactModule = require(parent.React)
local roactNavigationModule = require(parent.RoactNavigation)
local sharedFlagsModule = require(parent.SharedFlags)
local appPage = require(parent.RobloxAppEnums).AppPage
local robloxAppEventsModule = require(parent.RobloxAppEvents)
local getDeepLinkStoreModule = require(moments.Stores.GetDeepLinkStore)
local createMomentsStoreModule = require(moments.Stores.GetMomentsStore.createMomentsStore)
local getImmersiveChromeStoreModule = require(moments.Stores.GetImmersiveChromeStore)
local getFFlagMomentsFixDeeplinkRefocusModule = require(moments.Flags.GetFFlagMomentsFixDeeplinkRefocus)
local getFFlagMomentsFixPeekReturnChromeModule = require(moments.Flags.GetFFlagMomentsFixPeekReturnChrome)
local fFlagMomentsEmojiSetsApiModule = require(moments.Flags.FFlagMomentsEmojiSetsApi)
local fStringMomentsExperienceJoinActionTextIxpLayerModule = require(moments.Flags.FStringMomentsExperienceJoinActionTextIxpLayer)
local useMomentsTabIsVisibleModule = require(moments.Hooks.useMomentsTabIsVisible)
local consumeEntrySourceModule = require(moments.Utils.consumeEntrySource)
local logMomentsLayerExposureModule = require(moments.Utils.logMomentsLayerExposure)
local innerNavigatorModule = require(moments.Navigation.InnerNavigator)
local momentsHostShellModule = require(moments.Components.MomentsHostShell)
local useResetTeleportingOnGameLeaveModule = require(moments.Hooks.useResetTeleportingOnGameLeave)
local getExperienceDetailsSheetStoreModule = require(moments.ExperienceDetailsSheet.Sheet.getExperienceDetailsSheetStore)
local momentsGetMomentsReactionsStoreModule = require(parent.DataHydration.MomentsGetMomentsReactionsStore)
local analytics = momentsCommonModule.Analytics
local eventNames = analytics.EventNames
local funnelEventNames = analytics.FunnelEventNames
local sessionManager = analytics.SessionManager
local fireAnalyticsEvent = analytics.fireAnalyticsEvent
local fireFunnelAnalyticsEvent = analytics.fireFunnelAnalyticsEvent
local momentsSurfaceLoadManager = momentsCommonModule.Performance.MomentsSurfaceLoadManager
local useMomentsGating = momentsCommonModule.Hooks.useMomentsGating
local canRenderNativeMoments = momentsCommonModule.canRenderNativeMoments
local fFlagMomentsWatchSessionalization = sharedFlagsModule.FFlagMomentsWatchSessionalization
local fFlagMomentsSurfaceLoadTTI = sharedFlagsModule.FFlagMomentsSurfaceLoadTTI
local fFlagMomentsRealtimeObservability = momentsCommonModule.Flags.FFlagMomentsRealtimeObservability
local fFlagMomentsRealtimeSessionTelemetry = momentsCommonModule.Flags.FFlagMomentsRealtimeSessionTelemetry
local fFlagMomentsSessionHeartbeat = momentsCommonModule.Flags.FFlagMomentsSessionHeartbeat
local t = {}
local fFlagMomentsPassFeedItemIdToBackendApis = sharedFlagsModule.FFlagMomentsPassFeedItemIdToBackendApis
local shareLinkTargetIdType = momentsTypesModule.Enums.ShareLinkTargetIdType
local var1 = roactNavigationModule.createAppContainer(innerNavigatorModule)
local getActiveRoutes = navigationModule.getActiveRoutes

local function _(p1)
	return if type(p1) == "string" and p1 ~= "" then p1 elseif type(p1) == "number" then tostring(p1) else nil
end

local function getMomentIdFromLaunchData(p1)
	-- upvalues: httpService (ref)
	if type(p1) ~= "string" or p1 == "" then
		return nil
	end
	local ok, status = pcall(function()
		-- upvalues: httpService (copy), p1 (ref)
		return httpService:JSONDecode(p1)
	end)
	
	if not ok or type(status) ~= "table" then
		return nil
	end
	local postId = status.postId
	
	return if type(postId) == "string" and postId ~= "" then postId elseif type(postId) == "number" then tostring(postId) else nil
end

local _ = function(p1)
	-- upvalues: shareLinkTargetIdType (ref)
	return if p1 == shareLinkTargetIdType.FeedItemId then shareLinkTargetIdType.FeedItemId else nil
end

local function getTargetIdTypeFromLaunchData(p1)
	-- upvalues: httpService (ref), shareLinkTargetIdType (ref)
	if type(p1) ~= "string" or p1 == "" then
		return nil
	end
	local ok, status = pcall(function()
		-- upvalues: httpService (copy), p1 (ref)
		return httpService:JSONDecode(p1)
	end)
	
	return if not (not ok or type(status) ~= "table") then if status.targetIdType == shareLinkTargetIdType.FeedItemId then shareLinkTargetIdType.FeedItemId else nil else nil
end

local function getDeepLinkedMomentIdFromParams(p1)
	-- upvalues: getMomentIdFromLaunchData (ref)
	if type(p1) ~= "table" then
		return nil
	end
	local postId
	local extraProps = p1.extraProps
	
	if type(extraProps) == "table" then
		postId = extraProps.postId
		local var2 = if type(postId) == "string" and postId ~= "" then postId elseif type(postId) == "number" then tostring(postId) else nil
		
		if var2 ~= nil then
			return var2
		end
		local var3 = getMomentIdFromLaunchData(extraProps.launchData)
		
		if var3 ~= nil then
			return var3
		end
	end
	postId = p1.postId
	local var4 = if type(postId) == "string" and postId ~= "" then postId elseif type(postId) == "number" then tostring(postId) else nil
	
	return if var4 == nil then getMomentIdFromLaunchData(p1.launchData) else var4
end

local function getDeepLinkedMomentTargetIdTypeFromParams(p1)
	-- upvalues: fFlagMomentsPassFeedItemIdToBackendApis (ref), shareLinkTargetIdType (ref), getMomentIdFromLaunchData (ref), getTargetIdTypeFromLaunchData (ref)
	if not fFlagMomentsPassFeedItemIdToBackendApis or type(p1) ~= "table" then
		return nil
	end
	local postId
	local extraProps = p1.extraProps
	
	if type(extraProps) == "table" then
		postId = extraProps.postId
		
		if (if type(postId) == "string" and postId ~= "" then postId elseif type(postId) == "number" then tostring(postId) else nil) == nil then
			if getMomentIdFromLaunchData(extraProps.launchData) ~= nil then
				return getTargetIdTypeFromLaunchData(extraProps.launchData)
			end
		else
			return if extraProps.targetIdType == shareLinkTargetIdType.FeedItemId then shareLinkTargetIdType.FeedItemId else nil
		end
	end
	postId = p1.postId
	
	return if (if type(postId) == "string" and postId ~= "" then postId elseif type(postId) == "number" then tostring(postId) else nil) == nil then getTargetIdTypeFromLaunchData(p1.launchData) elseif p1.targetIdType == shareLinkTargetIdType.FeedItemId then shareLinkTargetIdType.FeedItemId else nil
end

local function getDeepLinkRequestFromNavigationParams(p1, p2)
	-- upvalues: fFlagMomentsPassFeedItemIdToBackendApis (ref), getDeepLinkedMomentIdFromParams (ref), getDeepLinkedMomentTargetIdTypeFromParams (ref)
	if not p1 or not p1.getParam then
		return nil
	end
	local t = {
		extraProps = p1.getParam("extraProps"),
		postId = p1.getParam("postId"),
		targetIdType = if fFlagMomentsPassFeedItemIdToBackendApis then p1.getParam("targetIdType") else nil,
		launchData = p1.getParam("launchData")
	}
	local var2 = getDeepLinkedMomentIdFromParams(t)
	
	if var2 == nil then
		return nil
	end
	local var3 = getDeepLinkedMomentTargetIdTypeFromParams(t)
	
	return {
		momentId = var2,
		targetIdType = var3,
		key = if fFlagMomentsPassFeedItemIdToBackendApis then `{p2}:params:{tostring(t.extraProps)}:{tostring(t.postId)}:{tostring(t.launchData)}:{var2}:{tostring(var3)}` else `{p2}:params:{tostring(t.extraProps)}:{tostring(t.postId)}:{tostring(t.launchData)}:{var2}`
	}
end

local function getDeepLinkRequestFromNavigationState(p1, p2)
	-- upvalues: getActiveRoutes (ref), getDeepLinkedMomentIdFromParams (ref), getDeepLinkedMomentTargetIdTypeFromParams (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref)
	local var2 = getActiveRoutes(p1)
	
	for i = #var2, 1, -1 do
		local var3 = var2[i]
		local var4 = getDeepLinkedMomentIdFromParams(var3.params)
		
		if var4 == nil then
			continue
		end
		local var5 = getDeepLinkedMomentTargetIdTypeFromParams(var3.params)
		
		return {
			momentId = var4,
			targetIdType = var5,
			key = if fFlagMomentsPassFeedItemIdToBackendApis then `{p2}:state:{tostring(var3.key)}:{tostring(var3.params)}:{var4}:{tostring(var5)}` else `{p2}:state:{tostring(var3.key)}:{tostring(var3.params)}:{var4}`
		}
	end
	return nil
end

local function getDeepLinkRequest(p3)
	-- upvalues: getDeepLinkRequestFromNavigationParams (ref), getDeepLinkRequestFromNavigationState (ref)
	local var6 = p3
	local var7 = 0
	while var6 ~= nil do
		local var8 = tostring(var7)
		local var9 = getDeepLinkRequestFromNavigationParams(var6, var8) or getDeepLinkRequestFromNavigationState(var6.state, var8)
		
		if var9 == nil then
			if not var6._dangerouslyGetParent then break end
			var6 = var6._dangerouslyGetParent()
			var7 += 1
		end
		return var9
	end
	return nil
end

local _ = function(p4)
	if not p4 or not p4.getParam then
		return "watch_tab"
	end
	local extraProps = p4.getParam("extraProps")
	
	return if type(extraProps) == "table" and type(extraProps.source) == "string" then extraProps.source else p4.getParam("source", "watch_tab")
end

local _ = function(p4, p5, p6)
	-- upvalues: fFlagMomentsPassFeedItemIdToBackendApis (ref)
	if fFlagMomentsPassFeedItemIdToBackendApis then
		p4.setDeepLinkedMoment(p5, p6)
		
		return
	end
	p4.setDeepLinkedMomentId(p5)
end

local function MomentsTabEntry(p4)
	-- upvalues: reactModule (ref), createMomentsStoreModule (ref), useResetTeleportingOnGameLeaveModule (ref), getFFlagMomentsFixDeeplinkRefocusModule (ref), getDeepLinkRequest (ref), getDeepLinkStoreModule (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), robloxAppEventsModule (ref), appPage (ref), consumeEntrySourceModule (ref), logMomentsLayerExposureModule (ref), fStringMomentsExperienceJoinActionTextIxpLayerModule (ref), fFlagMomentsEmojiSetsApiModule (ref), momentsGetMomentsReactionsStoreModule (ref), fireAnalyticsEvent (ref), eventNames (ref), fFlagMomentsRealtimeSessionTelemetry (ref), analytics (ref), fFlagMomentsSessionHeartbeat (ref), t (ref), sessionManager (ref), funnelEventNames (ref), fireFunnelAnalyticsEvent (ref), fFlagMomentsSurfaceLoadTTI (ref), momentsSurfaceLoadManager (ref), fFlagMomentsRealtimeObservability (ref), getExperienceDetailsSheetStoreModule (ref), getImmersiveChromeStoreModule (ref), roactNavigationModule (ref), useMomentsTabIsVisibleModule (ref), getFFlagMomentsFixPeekReturnChromeModule (ref), useMomentsGating (ref), canRenderNativeMoments (ref), innerNavigatorModule (ref), var1 (ref), momentsHostShellModule (ref)
	local var10 = reactModule.useRef(p4)
	var10.current = p4
	local var11 = reactModule.useRef(false)
	local var12 = reactModule.useRef(false)
	local var13 = reactModule.useRef(nil)
	
	if var13.current == nil then
		var13.current = createMomentsStoreModule()
	end
	useResetTeleportingOnGameLeaveModule()
	local var14 = getFFlagMomentsFixDeeplinkRefocusModule()
	local var15 = reactModule.useRef(nil)
	local var16 = reactModule.useRef({})
	local var17 = getDeepLinkRequest(p4.navigation)
	local var18 = if var17 ~= nil then nil else var17.momentId
	local var19 = if var17 ~= nil then nil else var17.key
	
	if var18 ~= nil and var15.current ~= var19 then
		local var20 = getDeepLinkStoreModule()
		local var21 = if var17 ~= nil then nil else var17.targetIdType
		
		if fFlagMomentsPassFeedItemIdToBackendApis then
			var20.setDeepLinkedMoment(var18, var21)
		else
			var20.setDeepLinkedMomentId(var18)
		end
		var15.current = var19
	end
	reactModule.useEffect(function()
		-- upvalues: var18 (ref), var12 (ref), robloxAppEventsModule (copy), appPage (copy)
		if var18 ~= nil and var12.current then
			robloxAppEventsModule.ReloadPage:fire(appPage.Moments)
		end
		var12.current = true
	end, { var19, var18, p4.navigation })
	local var22 = reactModule.useCallback(function()
		-- upvalues: var11 (ref), var13 (ref), var14 (ref), var16 (ref), consumeEntrySourceModule (copy), var10 (ref), logMomentsLayerExposureModule (copy), fStringMomentsExperienceJoinActionTextIxpLayerModule (copy), fFlagMomentsEmojiSetsApiModule (copy), momentsGetMomentsReactionsStoreModule (copy), fireAnalyticsEvent (copy), eventNames (copy), fFlagMomentsRealtimeSessionTelemetry (copy), analytics (copy), fFlagMomentsSessionHeartbeat (copy), t (copy), sessionManager (copy), funnelEventNames (copy), fireFunnelAnalyticsEvent (copy)
		if var11.current then return end
		local navigation, var23
		var11.current = true
		local current = var13.current
		
		if var14 and var16 ~= nil then
			var23 = consumeEntrySourceModule(var10.current.navigation, var16.current)
		else
			navigation = var10.current.navigation
			
			if navigation and navigation.getParam then
				local extraProps = navigation.getParam("extraProps")
				var23 = if type(extraProps) == "table" and type(extraProps.source) == "string" then extraProps.source else navigation.getParam("source", "watch_tab")
			else
				var23 = "watch_tab"
			end
		end
		current.resetSession()
		current.setSessionSource(var23)
		logMomentsLayerExposureModule(fStringMomentsExperienceJoinActionTextIxpLayerModule)
		
		if fFlagMomentsEmojiSetsApiModule then
			navigation = momentsGetMomentsReactionsStoreModule(false).getAndFetchEmojiSets
			assert(navigation ~= nil, "expected getAndFetchEmojiSets when FFlagMomentsEmojiSetsApi is on")
			navigation()
		end
		fireAnalyticsEvent(eventNames.TapMomentsTab, {
			moments_session_id = current.getMomentsSessionId(false),
			source = var23
		})
		
		if fFlagMomentsRealtimeSessionTelemetry then
			analytics.reportMomentsSessionStarted(var23)
		end
		if fFlagMomentsSessionHeartbeat then
			navigation = analytics.createMomentsSessionHeartbeat()
			t[current.getMomentsSessionId(false)] = navigation
			navigation.start(var23)
		end
		fireFunnelAnalyticsEvent(funnelEventNames.FunnelTypes.AppNavigation, funnelEventNames.AppNavigationSteps.AppLaunched, sessionManager.startSession(funnelEventNames.FunnelTypes.AppNavigation))
	end, { var14 })
	local var23 = reactModule.useCallback(function()
		-- upvalues: var11 (ref), fFlagMomentsSurfaceLoadTTI (copy), momentsSurfaceLoadManager (copy), fFlagMomentsRealtimeObservability (copy), getExperienceDetailsSheetStoreModule (copy), var13 (ref), fireAnalyticsEvent (copy), eventNames (copy), fFlagMomentsSessionHeartbeat (copy), t (copy), fFlagMomentsRealtimeSessionTelemetry (copy), analytics (copy), sessionManager (copy), funnelEventNames (copy)
		if not var11.current then return end
		var11.current = false
		
		if fFlagMomentsSurfaceLoadTTI then
			momentsSurfaceLoadManager.abort(if fFlagMomentsRealtimeObservability then "blur" else nil)
		end
		getExperienceDetailsSheetStoreModule(false).close()
		local current = var13.current
		fireAnalyticsEvent(eventNames.MomentsSessionEnded, {
			moments_session_id = current.getMomentsSessionId(false),
			source = current.getSessionSource(false),
			duration_seconds = tostring(math.floor(os.clock() - current.getSessionStartTime(false)))
		})
		
		if fFlagMomentsSessionHeartbeat then
			local momentsSessionId = current.getMomentsSessionId(false)
			local var24 = t[momentsSessionId]
			
			if var24 then
				var24.stop()
				t[momentsSessionId] = nil
			end
		end
		if fFlagMomentsRealtimeSessionTelemetry then
			analytics.reportMomentsSessionEnded(current.getSessionSource(false))
		end
		sessionManager.endSession(funnelEventNames.FunnelTypes.AppNavigation)
	end, {})
	local var24 = reactModule.useCallback(function()
		-- upvalues: getImmersiveChromeStoreModule (copy), var10 (ref)
		getImmersiveChromeStoreModule(false).setOverlayCovering(false)
		local onTabFocused = var10.current.onTabFocused
		
		if onTabFocused then
			onTabFocused()
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: p4 (ref), var22 (ref), var24 (ref), var23 (ref), roactNavigationModule (copy), getDeepLinkRequest (copy), var14 (ref), var15 (ref), getDeepLinkStoreModule (copy), fFlagMomentsPassFeedItemIdToBackendApis (copy), robloxAppEventsModule (copy), appPage (copy)
		local navigation = p4.navigation
		
		if navigation and navigation.addListener then
			var22()
			var24()
			local var25 = navigation.addListener(roactNavigationModule.Events.DidFocus, function()
				-- upvalues: getDeepLinkRequest (copy), navigation (ref), var14 (copy), var15 (copy), getDeepLinkStoreModule (copy), fFlagMomentsPassFeedItemIdToBackendApis (copy), robloxAppEventsModule (copy), appPage (copy), var22 (copy), var24 (copy)
				local var26 = getDeepLinkRequest(navigation)
				
				if var26 ~= nil and not (var14 and (var26 ~= nil and var15.current == var26.key)) then
					local var27 = getDeepLinkStoreModule()
					local momentId = var26.momentId
					local targetIdType = var26.targetIdType
					
					if fFlagMomentsPassFeedItemIdToBackendApis then
						var27.setDeepLinkedMoment(momentId, targetIdType)
					else
						var27.setDeepLinkedMomentId(momentId)
					end
					var15.current = var26.key
					robloxAppEventsModule.ReloadPage:fire(appPage.Moments)
				end
				var22()
				var24()
			end)
			local var26 = navigation.addListener(roactNavigationModule.Events.WillBlur, function()
				-- upvalues: var23 (copy)
				var23()
			end)
			
			return function()
				-- upvalues: var23 (copy), var25 (ref), var26 (ref)
				var23()
				var25.remove()
				var26.remove()
			end
		end
		var22()
		var24()
		
		return function()
			-- upvalues: var23 (copy)
			var23()
		end
	end, { var22, var23, var24 })
	local var25 = useMomentsTabIsVisibleModule()
	reactModule.useEffect(function()
		-- upvalues: getFFlagMomentsFixPeekReturnChromeModule (copy), var25 (ref), var24 (ref)
		if getFFlagMomentsFixPeekReturnChromeModule() and var25 then
			var24()
		end
	end, { var25, var24 })
	local var26 = reactModule.useMemo(function()
		-- upvalues: p4 (ref), getImmersiveChromeStoreModule (copy)
		local openProfile = p4.openProfile
		local openOwnMoments = p4.openOwnMoments
		
		return {
			openProfile = if openProfile then function(p5)
				-- upvalues: getImmersiveChromeStoreModule (copy), openProfile (ref)
				getImmersiveChromeStoreModule(false).setOverlayCovering(true)
				openProfile(p5)
			end else nil,
			openOwnMoments = if openOwnMoments then function()
				-- upvalues: getImmersiveChromeStoreModule (copy), openOwnMoments (ref)
				getImmersiveChromeStoreModule(false).setOverlayCovering(true)
				openOwnMoments()
			end else nil,
			openMomentsFeedReport = p4.openMomentsFeedReport
		}
	end, {
		p4.openProfile,
		p4.openOwnMoments,
		p4.openMomentsFeedReport
	})
	
	return if canRenderNativeMoments(useMomentsGating()) then reactModule.createElement(momentsHostShellModule, {
		sessionStore = var13.current,
		openProfile = var26.openProfile,
		openOwnMoments = var26.openOwnMoments,
		openMomentsFeedReport = var26.openMomentsFeedReport
	}, if p4.useRootOwnedNavigation then reactModule.createElement(innerNavigatorModule, { navigation = p4.navigation }) else reactModule.createElement(var1)) else nil
end

local function MomentsTabEntrySessionized(p4)
	-- upvalues: reactModule (ref), MomentsTabEntry (ref)
	return reactModule.createElement(MomentsTabEntry, {
		useRootOwnedNavigation = true,
		navigation = p4.navigation,
		openProfile = p4.openProfile,
		openOwnMoments = p4.openOwnMoments,
		openMomentsFeedReport = p4.openMomentsFeedReport,
		onTabFocused = p4.onTabFocused
	})
end

local momentsTabEntryScreen = reactModule.Component:extend("MomentsTabEntryScreen")

function momentsTabEntryScreen.render(p4)
	-- upvalues: reactModule (ref), MomentsTabEntrySessionized (ref)
	return reactModule.createElement(MomentsTabEntrySessionized, p4.props)
end

momentsTabEntryScreen.router = innerNavigatorModule.router

return if fFlagMomentsWatchSessionalization then momentsTabEntryScreen else MomentsTabEntry