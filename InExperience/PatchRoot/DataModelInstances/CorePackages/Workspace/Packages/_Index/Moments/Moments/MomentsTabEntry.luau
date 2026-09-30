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
local logMomentsLayerExposure = momentsCommonModule.Utils.logMomentsLayerExposure
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
local fFlagMomentsRealtimeObservability = momentsCommonModule.Flags.FFlagMomentsRealtimeObservability
local fFlagMomentsRealtimeSessionTelemetry = momentsCommonModule.Flags.FFlagMomentsRealtimeSessionTelemetry
local fFlagMomentsSessionHeartbeat = momentsCommonModule.Flags.FFlagMomentsSessionHeartbeat
local t = {}
local fFlagMomentsPassFeedItemIdToBackendApis = sharedFlagsModule.FFlagMomentsPassFeedItemIdToBackendApis
local shareLinkTargetIdType = momentsTypesModule.Enums.ShareLinkTargetIdType
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
		local var1 = if type(postId) == "string" and postId ~= "" then postId elseif type(postId) == "number" then tostring(postId) else nil
		
		if var1 ~= nil then
			return var1
		end
		local var2 = getMomentIdFromLaunchData(extraProps.launchData)
		
		if var2 ~= nil then
			return var2
		end
	end
	postId = p1.postId
	local var3 = if type(postId) == "string" and postId ~= "" then postId elseif type(postId) == "number" then tostring(postId) else nil
	
	return if var3 == nil then getMomentIdFromLaunchData(p1.launchData) else var3
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
	local var1 = getDeepLinkedMomentIdFromParams(t)
	
	if var1 == nil then
		return nil
	end
	local var2 = getDeepLinkedMomentTargetIdTypeFromParams(t)
	
	return {
		momentId = var1,
		targetIdType = var2,
		key = if fFlagMomentsPassFeedItemIdToBackendApis then `{p2}:params:{tostring(t.extraProps)}:{tostring(t.postId)}:{tostring(t.launchData)}:{var1}:{tostring(var2)}` else `{p2}:params:{tostring(t.extraProps)}:{tostring(t.postId)}:{tostring(t.launchData)}:{var1}`
	}
end

local function getDeepLinkRequestFromNavigationState(p1, p2)
	-- upvalues: getActiveRoutes (ref), getDeepLinkedMomentIdFromParams (ref), getDeepLinkedMomentTargetIdTypeFromParams (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref)
	local var1 = getActiveRoutes(p1)
	
	for i = #var1, 1, -1 do
		local var2 = var1[i]
		local var3 = getDeepLinkedMomentIdFromParams(var2.params)
		
		if var3 == nil then
			continue
		end
		local var4 = getDeepLinkedMomentTargetIdTypeFromParams(var2.params)
		
		return {
			momentId = var3,
			targetIdType = var4,
			key = if fFlagMomentsPassFeedItemIdToBackendApis then `{p2}:state:{tostring(var2.key)}:{tostring(var2.params)}:{var3}:{tostring(var4)}` else `{p2}:state:{tostring(var2.key)}:{tostring(var2.params)}:{var3}`
		}
	end
	return nil
end

local function getDeepLinkRequest(p3)
	-- upvalues: getDeepLinkRequestFromNavigationParams (ref), getDeepLinkRequestFromNavigationState (ref)
	local var5 = p3
	local var6 = 0
	while var5 ~= nil do
		local var7 = tostring(var6)
		local var8 = getDeepLinkRequestFromNavigationParams(var5, var7) or getDeepLinkRequestFromNavigationState(var5.state, var7)
		
		if var8 == nil then
			if not var5._dangerouslyGetParent then break end
			var5 = var5._dangerouslyGetParent()
			var6 += 1
		end
		return var8
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
	-- upvalues: reactModule (ref), createMomentsStoreModule (ref), useResetTeleportingOnGameLeaveModule (ref), getFFlagMomentsFixDeeplinkRefocusModule (ref), getDeepLinkRequest (ref), getDeepLinkStoreModule (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), robloxAppEventsModule (ref), appPage (ref), consumeEntrySourceModule (ref), logMomentsLayerExposure (ref), fStringMomentsExperienceJoinActionTextIxpLayerModule (ref), fFlagMomentsEmojiSetsApiModule (ref), momentsGetMomentsReactionsStoreModule (ref), fireAnalyticsEvent (ref), eventNames (ref), fFlagMomentsRealtimeSessionTelemetry (ref), analytics (ref), fFlagMomentsSessionHeartbeat (ref), t (ref), sessionManager (ref), funnelEventNames (ref), fireFunnelAnalyticsEvent (ref), momentsSurfaceLoadManager (ref), fFlagMomentsRealtimeObservability (ref), getExperienceDetailsSheetStoreModule (ref), getImmersiveChromeStoreModule (ref), roactNavigationModule (ref), useMomentsTabIsVisibleModule (ref), getFFlagMomentsFixPeekReturnChromeModule (ref), useMomentsGating (ref), canRenderNativeMoments (ref), momentsHostShellModule (ref), innerNavigatorModule (ref)
	local var9 = reactModule.useRef(p4)
	var9.current = p4
	local var10 = reactModule.useRef(false)
	local var11 = reactModule.useRef(false)
	local var12 = reactModule.useRef(nil)
	
	if var12.current == nil then
		var12.current = createMomentsStoreModule()
	end
	useResetTeleportingOnGameLeaveModule()
	local var13 = getFFlagMomentsFixDeeplinkRefocusModule()
	local var14 = reactModule.useRef(nil)
	local var15 = reactModule.useRef({})
	local var16 = getDeepLinkRequest(p4.navigation)
	local var17 = if var16 ~= nil then nil else var16.momentId
	local var18 = if var16 ~= nil then nil else var16.key
	
	if var17 ~= nil and var14.current ~= var18 then
		local var19 = getDeepLinkStoreModule()
		local var20 = if var16 ~= nil then nil else var16.targetIdType
		
		if fFlagMomentsPassFeedItemIdToBackendApis then
			var19.setDeepLinkedMoment(var17, var20)
		else
			var19.setDeepLinkedMomentId(var17)
		end
		var14.current = var18
	end
	reactModule.useEffect(function()
		-- upvalues: var17 (ref), var11 (ref), robloxAppEventsModule (copy), appPage (copy)
		if var17 ~= nil and var11.current then
			robloxAppEventsModule.ReloadPage:fire(appPage.Moments)
		end
		var11.current = true
	end, { var18, var17, p4.navigation })
	local var21 = reactModule.useCallback(function()
		-- upvalues: var10 (ref), var12 (ref), var13 (ref), var15 (ref), consumeEntrySourceModule (copy), var9 (ref), logMomentsLayerExposure (copy), fStringMomentsExperienceJoinActionTextIxpLayerModule (copy), fFlagMomentsEmojiSetsApiModule (copy), momentsGetMomentsReactionsStoreModule (copy), fireAnalyticsEvent (copy), eventNames (copy), fFlagMomentsRealtimeSessionTelemetry (copy), analytics (copy), fFlagMomentsSessionHeartbeat (copy), t (copy), sessionManager (copy), funnelEventNames (copy), fireFunnelAnalyticsEvent (copy)
		if var10.current then return end
		local navigation, var22
		var10.current = true
		local current = var12.current
		
		if var13 and var15 ~= nil then
			var22 = consumeEntrySourceModule(var9.current.navigation, var15.current)
		else
			navigation = var9.current.navigation
			
			if navigation and navigation.getParam then
				local extraProps = navigation.getParam("extraProps")
				var22 = if type(extraProps) == "table" and type(extraProps.source) == "string" then extraProps.source else navigation.getParam("source", "watch_tab")
			else
				var22 = "watch_tab"
			end
		end
		current.resetSession()
		current.setSessionSource(var22)
		logMomentsLayerExposure(fStringMomentsExperienceJoinActionTextIxpLayerModule)
		
		if fFlagMomentsEmojiSetsApiModule then
			navigation = momentsGetMomentsReactionsStoreModule(false).getAndFetchEmojiSets
			assert(navigation ~= nil, "expected getAndFetchEmojiSets when FFlagMomentsEmojiSetsApi is on")
			navigation()
		end
		fireAnalyticsEvent(eventNames.TapMomentsTab, {
			moments_session_id = current.getMomentsSessionId(false),
			source = var22
		})
		
		if fFlagMomentsRealtimeSessionTelemetry then
			analytics.reportMomentsSessionStarted(var22)
		end
		if fFlagMomentsSessionHeartbeat then
			navigation = analytics.createMomentsSessionHeartbeat()
			t[current.getMomentsSessionId(false)] = navigation
			navigation.start(var22)
		end
		fireFunnelAnalyticsEvent(funnelEventNames.FunnelTypes.AppNavigation, funnelEventNames.AppNavigationSteps.AppLaunched, sessionManager.startSession(funnelEventNames.FunnelTypes.AppNavigation))
	end, { var13 })
	local var22 = reactModule.useCallback(function()
		-- upvalues: var10 (ref), momentsSurfaceLoadManager (copy), fFlagMomentsRealtimeObservability (copy), getExperienceDetailsSheetStoreModule (copy), var12 (ref), fireAnalyticsEvent (copy), eventNames (copy), fFlagMomentsSessionHeartbeat (copy), t (copy), fFlagMomentsRealtimeSessionTelemetry (copy), analytics (copy), sessionManager (copy), funnelEventNames (copy)
		if not var10.current then return end
		var10.current = false
		momentsSurfaceLoadManager.abort(if fFlagMomentsRealtimeObservability then "blur" else nil)
		getExperienceDetailsSheetStoreModule(false).close()
		local current = var12.current
		fireAnalyticsEvent(eventNames.MomentsSessionEnded, {
			moments_session_id = current.getMomentsSessionId(false),
			source = current.getSessionSource(false),
			duration_seconds = tostring(math.floor(os.clock() - current.getSessionStartTime(false)))
		})
		
		if fFlagMomentsSessionHeartbeat then
			local momentsSessionId = current.getMomentsSessionId(false)
			local var23 = t[momentsSessionId]
			
			if var23 then
				var23.stop()
				t[momentsSessionId] = nil
			end
		end
		if fFlagMomentsRealtimeSessionTelemetry then
			analytics.reportMomentsSessionEnded(current.getSessionSource(false))
		end
		sessionManager.endSession(funnelEventNames.FunnelTypes.AppNavigation)
	end, {})
	local var23 = reactModule.useCallback(function()
		-- upvalues: getImmersiveChromeStoreModule (copy), var9 (ref)
		getImmersiveChromeStoreModule(false).setOverlayCovering(false)
		local onTabFocused = var9.current.onTabFocused
		
		if onTabFocused then
			onTabFocused()
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: p4 (ref), var21 (ref), var23 (ref), var22 (ref), roactNavigationModule (copy), getDeepLinkRequest (copy), var13 (ref), var14 (ref), getDeepLinkStoreModule (copy), fFlagMomentsPassFeedItemIdToBackendApis (copy), robloxAppEventsModule (copy), appPage (copy)
		local navigation = p4.navigation
		
		if navigation and navigation.addListener then
			var21()
			var23()
			local var24 = navigation.addListener(roactNavigationModule.Events.DidFocus, function()
				-- upvalues: getDeepLinkRequest (copy), navigation (ref), var13 (copy), var14 (copy), getDeepLinkStoreModule (copy), fFlagMomentsPassFeedItemIdToBackendApis (copy), robloxAppEventsModule (copy), appPage (copy), var21 (copy), var23 (copy)
				local var25 = getDeepLinkRequest(navigation)
				
				if var25 ~= nil and not (var13 and (var25 ~= nil and var14.current == var25.key)) then
					local var26 = getDeepLinkStoreModule()
					local momentId = var25.momentId
					local targetIdType = var25.targetIdType
					
					if fFlagMomentsPassFeedItemIdToBackendApis then
						var26.setDeepLinkedMoment(momentId, targetIdType)
					else
						var26.setDeepLinkedMomentId(momentId)
					end
					var14.current = var25.key
					robloxAppEventsModule.ReloadPage:fire(appPage.Moments)
				end
				var21()
				var23()
			end)
			local var25 = navigation.addListener(roactNavigationModule.Events.WillBlur, function()
				-- upvalues: var22 (copy)
				var22()
			end)
			
			return function()
				-- upvalues: var22 (copy), var24 (ref), var25 (ref)
				var22()
				var24.remove()
				var25.remove()
			end
		end
		var21()
		var23()
		
		return function()
			-- upvalues: var22 (copy)
			var22()
		end
	end, { var21, var22, var23 })
	local var24 = useMomentsTabIsVisibleModule()
	reactModule.useEffect(function()
		-- upvalues: getFFlagMomentsFixPeekReturnChromeModule (copy), var24 (ref), var23 (ref)
		if getFFlagMomentsFixPeekReturnChromeModule() and var24 then
			var23()
		end
	end, { var24, var23 })
	local var25 = reactModule.useMemo(function()
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
			openMomentsFeedReport = p4.openMomentsFeedReport,
			openMomentCommentReport = p4.openMomentCommentReport
		}
	end, {
		p4.openProfile,
		p4.openOwnMoments,
		p4.openMomentsFeedReport,
		p4.openMomentCommentReport
	})
	
	return if canRenderNativeMoments(useMomentsGating()) then reactModule.createElement(momentsHostShellModule, {
		sessionStore = var12.current,
		openProfile = var25.openProfile,
		openOwnMoments = var25.openOwnMoments,
		openMomentsFeedReport = var25.openMomentsFeedReport,
		openMomentCommentReport = var25.openMomentCommentReport
	}, reactModule.createElement(innerNavigatorModule, { navigation = p4.navigation })) else nil
end

local momentsTabEntryScreen = reactModule.Component:extend("MomentsTabEntryScreen")

function momentsTabEntryScreen.render(p4)
	-- upvalues: reactModule (ref), MomentsTabEntry (ref)
	return reactModule.createElement(MomentsTabEntry, p4.props)
end

momentsTabEntryScreen.router = innerNavigatorModule.router

return momentsTabEntryScreen