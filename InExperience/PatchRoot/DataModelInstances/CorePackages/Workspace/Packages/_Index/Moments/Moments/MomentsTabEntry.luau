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
local getFFlagMomentsFixShareDeeplinkModule = require(moments.Flags.GetFFlagMomentsFixShareDeeplink)
local getFFlagMomentsShareDeeplinkReliableOpenModule = require(moments.Flags.GetFFlagMomentsShareDeeplinkReliableOpen)
local getFFlagMomentsFixDeeplinkRefocusModule = require(moments.Flags.GetFFlagMomentsFixDeeplinkRefocus)
local getFFlagMomentsFixPeekReturnChromeModule = require(moments.Flags.GetFFlagMomentsFixPeekReturnChrome)
local fFlagMomentsEmojiSetsApiModule = require(moments.Flags.FFlagMomentsEmojiSetsApi)
local useMomentsTabIsVisibleModule = require(moments.Hooks.useMomentsTabIsVisible)
local consumeEntrySourceModule = require(moments.Utils.consumeEntrySource)
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
local var25 = roactNavigationModule.createAppContainer(innerNavigatorModule)
local getActiveRoutes = navigationModule.getActiveRoutes
local var26 = getFFlagMomentsFixShareDeeplinkModule()

local function _(p0)
	return if type(p0) == "string" and p0 ~= "" then p0 elseif type(p0) == "number" then tostring(p0) else nil
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

local _ = function(p2)
	-- upvalues: shareLinkTargetIdType (ref)
	return if p2 == shareLinkTargetIdType.FeedItemId then shareLinkTargetIdType.FeedItemId else nil
end

local function getTargetIdTypeFromLaunchData(p3)
	-- upvalues: httpService (ref), shareLinkTargetIdType (ref)
	if type(p3) ~= "string" or p3 == "" then
		return nil
	end
	local ok, status = pcall(function()
		-- upvalues: httpService (copy), p3 (ref)
		return httpService:JSONDecode(p3)
	end)
	
	return if not (not ok or type(status) ~= "table") then if status.targetIdType == shareLinkTargetIdType.FeedItemId then shareLinkTargetIdType.FeedItemId else nil else nil
end

local function getDeepLinkedMomentIdFromParams(p4)
	-- upvalues: getMomentIdFromLaunchData (ref)
	if type(p4) ~= "table" then
		return nil
	end
	local postId
	local extraProps = p4.extraProps
	
	if type(extraProps) == "table" then
		postId = extraProps.postId
		local var37 = if type(postId) == "string" and postId ~= "" then postId elseif type(postId) == "number" then tostring(postId) else nil
		
		if var37 ~= nil then
			return var37
		end
		local var38 = getMomentIdFromLaunchData(extraProps.launchData)
		
		if var38 ~= nil then
			return var38
		end
	end
	postId = p4.postId
	local var39 = if type(postId) == "string" and postId ~= "" then postId elseif type(postId) == "number" then tostring(postId) else nil
	
	return if var39 == nil then getMomentIdFromLaunchData(p4.launchData) else var39
end

local function getDeepLinkedMomentTargetIdTypeFromParams(p5)
	-- upvalues: fFlagMomentsPassFeedItemIdToBackendApis (ref), shareLinkTargetIdType (ref), getMomentIdFromLaunchData (ref), getTargetIdTypeFromLaunchData (ref)
	if not fFlagMomentsPassFeedItemIdToBackendApis or type(p5) ~= "table" then
		return nil
	end
	local postId
	local extraProps = p5.extraProps
	
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
	postId = p5.postId
	
	return if (if type(postId) == "string" and postId ~= "" then postId elseif type(postId) == "number" then tostring(postId) else nil) == nil then getTargetIdTypeFromLaunchData(p5.launchData) elseif p5.targetIdType == shareLinkTargetIdType.FeedItemId then shareLinkTargetIdType.FeedItemId else nil
end

local function getDeepLinkRequestFromNavigationParams(p6, p7)
	-- upvalues: fFlagMomentsPassFeedItemIdToBackendApis (ref), getDeepLinkedMomentIdFromParams (ref), getDeepLinkedMomentTargetIdTypeFromParams (ref)
	if not p6 or not p6.getParam then
		return nil
	end
	local t = {
		extraProps = p6.getParam("extraProps"),
		postId = p6.getParam("postId"),
		targetIdType = if fFlagMomentsPassFeedItemIdToBackendApis then p6.getParam("targetIdType") else nil,
		launchData = p6.getParam("launchData")
	}
	local var41 = getDeepLinkedMomentIdFromParams(t)
	
	if var41 == nil then
		return nil
	end
	local var42 = getDeepLinkedMomentTargetIdTypeFromParams(t)
	
	return {
		momentId = var41,
		targetIdType = var42,
		key = if fFlagMomentsPassFeedItemIdToBackendApis then `{p7}:params:{tostring(t.extraProps)}:{tostring(t.postId)}:{tostring(t.launchData)}:{var41}:{tostring(var42)}` else `{p7}:params:{tostring(t.extraProps)}:{tostring(t.postId)}:{tostring(t.launchData)}:{var41}`
	}
end

local function getDeepLinkRequestFromNavigationState(p8, p9)
	-- upvalues: getActiveRoutes (ref), getDeepLinkedMomentIdFromParams (ref), getDeepLinkedMomentTargetIdTypeFromParams (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref)
	local var43 = getActiveRoutes(p8)
	
	for i = #var43, 1, -1 do
		local var44 = var43[i]
		local var45 = getDeepLinkedMomentIdFromParams(var44.params)
		
		if var45 == nil then
			continue
		end
		local var46 = getDeepLinkedMomentTargetIdTypeFromParams(var44.params)
		
		return {
			momentId = var45,
			targetIdType = var46,
			key = if fFlagMomentsPassFeedItemIdToBackendApis then `{p9}:state:{tostring(var44.key)}:{tostring(var44.params)}:{var45}:{tostring(var46)}` else `{p9}:state:{tostring(var44.key)}:{tostring(var44.params)}:{var45}`
		}
	end
	return nil
end

local function getDeepLinkRequest(p10)
	-- upvalues: getDeepLinkRequestFromNavigationParams (ref), getDeepLinkRequestFromNavigationState (ref)
	local var47 = p10
	local var48 = 0
	while var47 ~= nil do
		local var49 = tostring(var48)
		local var50 = getDeepLinkRequestFromNavigationParams(var47, var49) or getDeepLinkRequestFromNavigationState(var47.state, var49)
		
		if var50 == nil then
			if not var47._dangerouslyGetParent then break end
			var47 = var47._dangerouslyGetParent()
			var48 += 1
		end
		return var50
	end
	return nil
end

local _ = function(p11)
	if not p11 or not p11.getParam then
		return "watch_tab"
	end
	local extraProps = p11.getParam("extraProps")
	
	return if type(extraProps) == "table" and type(extraProps.source) == "string" then extraProps.source else p11.getParam("source", "watch_tab")
end

local _ = function(p12, p13, p14)
	-- upvalues: fFlagMomentsPassFeedItemIdToBackendApis (ref)
	if fFlagMomentsPassFeedItemIdToBackendApis then
		p12.setDeepLinkedMoment(p13, p14)
		
		return
	end
	p12.setDeepLinkedMomentId(p13)
end

local function MomentsTabEntry(p15)
	-- upvalues: reactModule (ref), createMomentsStoreModule (ref), useResetTeleportingOnGameLeaveModule (ref), var26 (ref), getFFlagMomentsShareDeeplinkReliableOpenModule (ref), getFFlagMomentsFixDeeplinkRefocusModule (ref), getDeepLinkRequest (ref), getDeepLinkStoreModule (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), robloxAppEventsModule (ref), appPage (ref), shareLinkTargetIdType (ref), consumeEntrySourceModule (ref), fFlagMomentsEmojiSetsApiModule (ref), momentsGetMomentsReactionsStoreModule (ref), fireAnalyticsEvent (ref), eventNames (ref), fFlagMomentsRealtimeSessionTelemetry (ref), analytics (ref), fFlagMomentsSessionHeartbeat (ref), t (ref), sessionManager (ref), funnelEventNames (ref), fireFunnelAnalyticsEvent (ref), fFlagMomentsSurfaceLoadTTI (ref), momentsSurfaceLoadManager (ref), fFlagMomentsRealtimeObservability (ref), getExperienceDetailsSheetStoreModule (ref), getImmersiveChromeStoreModule (ref), roactNavigationModule (ref), useMomentsTabIsVisibleModule (ref), getFFlagMomentsFixPeekReturnChromeModule (ref), useMomentsGating (ref), canRenderNativeMoments (ref), innerNavigatorModule (ref), var25 (ref), momentsHostShellModule (ref)
	local var52 = reactModule.useRef(p15)
	var52.current = p15
	local var53 = reactModule.useRef(false)
	local var54 = reactModule.useRef(false)
	local var55 = reactModule.useRef(nil)
	
	if var55.current == nil then
		var55.current = createMomentsStoreModule()
	end
	useResetTeleportingOnGameLeaveModule()
	local var26_1 = var26 or getFFlagMomentsShareDeeplinkReliableOpenModule()
	local var57 = getFFlagMomentsFixDeeplinkRefocusModule()
	local var58 = nil
	local var59 = nil
	
	if var26_1 then
		local var60 = getDeepLinkRequest(p15.navigation)
		local var61 = if var60 ~= nil then nil else var60.momentId
		local var62 = if var60 ~= nil then nil else var60.key
		var58 = reactModule.useRef(nil)
		var59 = reactModule.useRef({})
		
		if var61 ~= nil and var58.current ~= var62 then
			local var63 = getDeepLinkStoreModule()
			local var64 = if var60 ~= nil then nil else var60.targetIdType
			
			if fFlagMomentsPassFeedItemIdToBackendApis then
				var63.setDeepLinkedMoment(var61, var64)
			else
				var63.setDeepLinkedMomentId(var61)
			end
			var58.current = var62
		end
		reactModule.useEffect(function()
			-- upvalues: var61 (ref), var54 (ref), robloxAppEventsModule (copy), appPage (copy)
			if var61 ~= nil and var54.current then
				robloxAppEventsModule.ReloadPage:fire(appPage.Moments)
			end
			var54.current = true
		end, { var62, var61, p15.navigation })
	else
		reactModule.useEffect(function()
			-- upvalues: p15 (ref), getDeepLinkStoreModule (copy), fFlagMomentsPassFeedItemIdToBackendApis (copy), shareLinkTargetIdType (copy), var54 (ref), robloxAppEventsModule (copy), appPage (copy)
			local navigation = p15.navigation
			
			if not navigation or not navigation.getParam then return end
			local extraProps = navigation.getParam("extraProps")
			
			if type(extraProps) == "table" and type(extraProps.postId) == "string" then
				local var71 = getDeepLinkStoreModule()
				local postId = extraProps.postId
				local var72 = if fFlagMomentsPassFeedItemIdToBackendApis then if extraProps.targetIdType == shareLinkTargetIdType.FeedItemId then shareLinkTargetIdType.FeedItemId else nil else nil
				
				if fFlagMomentsPassFeedItemIdToBackendApis then
					var71.setDeepLinkedMoment(postId, var72)
				else
					var71.setDeepLinkedMomentId(postId)
				end
				if var54.current then
					robloxAppEventsModule.ReloadPage:fire(appPage.Moments)
				end
			end
			var54.current = true
		end, { p15.navigation })
	end
	local var65 = reactModule.useCallback(function()
		-- upvalues: var53 (ref), var55 (ref), var57 (ref), var59 (write), consumeEntrySourceModule (copy), var52 (ref), fFlagMomentsEmojiSetsApiModule (copy), momentsGetMomentsReactionsStoreModule (copy), fireAnalyticsEvent (copy), eventNames (copy), fFlagMomentsRealtimeSessionTelemetry (copy), analytics (copy), fFlagMomentsSessionHeartbeat (copy), t (copy), sessionManager (copy), funnelEventNames (copy), fireFunnelAnalyticsEvent (copy)
		if var53.current then return end
		local navigation, var73
		var53.current = true
		local current = var55.current
		
		if var57 and var59 ~= nil then
			var73 = consumeEntrySourceModule(var52.current.navigation, var59.current)
		else
			navigation = var52.current.navigation
			
			if navigation and navigation.getParam then
				local extraProps = navigation.getParam("extraProps")
				var73 = if type(extraProps) == "table" and type(extraProps.source) == "string" then extraProps.source else navigation.getParam("source", "watch_tab")
			else
				var73 = "watch_tab"
			end
		end
		current.resetSession()
		current.setSessionSource(var73)
		
		if fFlagMomentsEmojiSetsApiModule then
			navigation = momentsGetMomentsReactionsStoreModule(false).getAndFetchEmojiSets
			assert(navigation ~= nil, "expected getAndFetchEmojiSets when FFlagMomentsEmojiSetsApi is on")
			navigation()
		end
		fireAnalyticsEvent(eventNames.TapMomentsTab, {
			moments_session_id = current.getMomentsSessionId(false),
			source = var73
		})
		
		if fFlagMomentsRealtimeSessionTelemetry then
			analytics.reportMomentsSessionStarted(var73)
		end
		if fFlagMomentsSessionHeartbeat then
			navigation = analytics.createMomentsSessionHeartbeat()
			t[current.getMomentsSessionId(false)] = navigation
			navigation.start(var73)
		end
		fireFunnelAnalyticsEvent(funnelEventNames.FunnelTypes.AppNavigation, funnelEventNames.AppNavigationSteps.AppLaunched, sessionManager.startSession(funnelEventNames.FunnelTypes.AppNavigation))
	end, { var57 })
	local var66 = reactModule.useCallback(function()
		-- upvalues: var53 (ref), fFlagMomentsSurfaceLoadTTI (copy), momentsSurfaceLoadManager (copy), fFlagMomentsRealtimeObservability (copy), getExperienceDetailsSheetStoreModule (copy), var55 (ref), fireAnalyticsEvent (copy), eventNames (copy), fFlagMomentsSessionHeartbeat (copy), t (copy), fFlagMomentsRealtimeSessionTelemetry (copy), analytics (copy), sessionManager (copy), funnelEventNames (copy)
		if not var53.current then return end
		var53.current = false
		
		if fFlagMomentsSurfaceLoadTTI then
			momentsSurfaceLoadManager.abort(if fFlagMomentsRealtimeObservability then "blur" else nil)
		end
		getExperienceDetailsSheetStoreModule(false).close()
		local current = var55.current
		fireAnalyticsEvent(eventNames.MomentsSessionEnded, {
			moments_session_id = current.getMomentsSessionId(false),
			source = current.getSessionSource(false),
			duration_seconds = tostring(math.floor(os.clock() - current.getSessionStartTime(false)))
		})
		
		if fFlagMomentsSessionHeartbeat then
			local momentsSessionId = current.getMomentsSessionId(false)
			local var76 = t[momentsSessionId]
			
			if var76 then
				var76.stop()
				t[momentsSessionId] = nil
			end
		end
		if fFlagMomentsRealtimeSessionTelemetry then
			analytics.reportMomentsSessionEnded(current.getSessionSource(false))
		end
		sessionManager.endSession(funnelEventNames.FunnelTypes.AppNavigation)
	end, {})
	local var67 = reactModule.useCallback(function()
		-- upvalues: getImmersiveChromeStoreModule (copy), var52 (ref)
		getImmersiveChromeStoreModule(false).setOverlayCovering(false)
		local onTabFocused = var52.current.onTabFocused
		
		if onTabFocused then
			onTabFocused()
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: p15 (ref), var65 (ref), var67 (ref), var66 (ref), roactNavigationModule (copy), var26_1 (ref), getDeepLinkRequest (copy), var57 (ref), var58 (write), getDeepLinkStoreModule (copy), fFlagMomentsPassFeedItemIdToBackendApis (copy), robloxAppEventsModule (copy), appPage (copy), shareLinkTargetIdType (copy)
		local navigation = p15.navigation
		
		if navigation and navigation.addListener then
			var65()
			var67()
			local var77 = navigation.addListener(roactNavigationModule.Events.DidFocus, function()
				-- upvalues: var26_1 (copy), getDeepLinkRequest (copy), navigation (ref), var57 (copy), var58 (copy), getDeepLinkStoreModule (copy), fFlagMomentsPassFeedItemIdToBackendApis (copy), robloxAppEventsModule (copy), appPage (copy), shareLinkTargetIdType (copy), var65 (copy), var67 (copy)
				if var26_1 then
					local var79 = getDeepLinkRequest(navigation)
					
					if var79 ~= nil and not (var57 and (var79 ~= nil and var58.current == var79.key)) then
						local var80 = getDeepLinkStoreModule()
						local momentId = var79.momentId
						local targetIdType = var79.targetIdType
						
						if fFlagMomentsPassFeedItemIdToBackendApis then
							var80.setDeepLinkedMoment(momentId, targetIdType)
						else
							var80.setDeepLinkedMomentId(momentId)
						end
						var58.current = var79.key
						robloxAppEventsModule.ReloadPage:fire(appPage.Moments)
					end
				else
					local extraProps = navigation.getParam("extraProps")
					
					if type(extraProps) == "table" and type(extraProps.postId) == "string" then
						local var82 = getDeepLinkStoreModule()
						local postId = extraProps.postId
						local var83 = if fFlagMomentsPassFeedItemIdToBackendApis then if extraProps.targetIdType == shareLinkTargetIdType.FeedItemId then shareLinkTargetIdType.FeedItemId else nil else nil
						
						if fFlagMomentsPassFeedItemIdToBackendApis then
							var82.setDeepLinkedMoment(postId, var83)
						else
							var82.setDeepLinkedMomentId(postId)
						end
						robloxAppEventsModule.ReloadPage:fire(appPage.Moments)
					end
				end
				var65()
				var67()
			end)
			local var78 = navigation.addListener(roactNavigationModule.Events.WillBlur, function()
				-- upvalues: var66 (copy)
				var66()
			end)
			
			return function()
				-- upvalues: var66 (copy), var77 (ref), var78 (ref)
				var66()
				var77.remove()
				var78.remove()
			end
		end
		var65()
		var67()
		
		return function()
			-- upvalues: var66 (copy)
			var66()
		end
	end, { var65, var66, var67 })
	local var68 = useMomentsTabIsVisibleModule()
	reactModule.useEffect(function()
		-- upvalues: getFFlagMomentsFixPeekReturnChromeModule (copy), var68 (ref), var67 (ref)
		if getFFlagMomentsFixPeekReturnChromeModule() and var68 then
			var67()
		end
	end, { var68, var67 })
	local var69 = reactModule.useMemo(function()
		-- upvalues: p15 (ref), getImmersiveChromeStoreModule (copy)
		local openProfile = p15.openProfile
		local openOwnMoments = p15.openOwnMoments
		
		return {
			openProfile = if openProfile then function(p16)
				-- upvalues: getImmersiveChromeStoreModule (copy), openProfile (ref)
				getImmersiveChromeStoreModule(false).setOverlayCovering(true)
				openProfile(p16)
			end else nil,
			openOwnMoments = if openOwnMoments then function()
				-- upvalues: getImmersiveChromeStoreModule (copy), openOwnMoments (ref)
				getImmersiveChromeStoreModule(false).setOverlayCovering(true)
				openOwnMoments()
			end else nil,
			openMomentsFeedReport = p15.openMomentsFeedReport
		}
	end, {
		p15.openProfile,
		p15.openOwnMoments,
		p15.openMomentsFeedReport
	})
	
	return if canRenderNativeMoments(useMomentsGating()) then reactModule.createElement(momentsHostShellModule, {
		sessionStore = var55.current,
		openProfile = var69.openProfile,
		openOwnMoments = var69.openOwnMoments,
		openMomentsFeedReport = var69.openMomentsFeedReport
	}, if p15.useRootOwnedNavigation then reactModule.createElement(innerNavigatorModule, { navigation = p15.navigation }) else reactModule.createElement(var25)) else nil
end

local function MomentsTabEntrySessionized(p17)
	-- upvalues: reactModule (ref), MomentsTabEntry (ref)
	return reactModule.createElement(MomentsTabEntry, {
		useRootOwnedNavigation = true,
		navigation = p17.navigation,
		openProfile = p17.openProfile,
		openOwnMoments = p17.openOwnMoments,
		openMomentsFeedReport = p17.openMomentsFeedReport,
		onTabFocused = p17.onTabFocused
	})
end

local momentsTabEntryScreen = reactModule.Component:extend("MomentsTabEntryScreen")

function momentsTabEntryScreen.render(p18)
	-- upvalues: reactModule (ref), MomentsTabEntrySessionized (ref)
	return reactModule.createElement(MomentsTabEntrySessionized, p18.props)
end

momentsTabEntryScreen.router = innerNavigatorModule.router

return if fFlagMomentsWatchSessionalization then momentsTabEntryScreen else MomentsTabEntry