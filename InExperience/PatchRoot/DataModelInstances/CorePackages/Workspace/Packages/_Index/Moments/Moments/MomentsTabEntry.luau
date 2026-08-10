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
local fFlagMomentsPassFeedItemIdToBackendApis = sharedFlagsModule.FFlagMomentsPassFeedItemIdToBackendApis
local shareLinkTargetIdType = momentsTypesModule.Enums.ShareLinkTargetIdType
local var24 = roactNavigationModule.createAppContainer(innerNavigatorModule)
local getActiveRoutes = navigationModule.getActiveRoutes
local var25 = getFFlagMomentsFixShareDeeplinkModule()

local function _(p0) --[[ line: 89 | named "normalizeDeepLinkedMomentId" ]]
	return if type(p0) == "string" and p0 ~= "" then p0 elseif type(p0) == "number" then tostring(p0) else nil
end

local function getMomentIdFromLaunchData(p1) --[[ line: 98 ]]
	-- upvalues: httpService (ref)
	if type(p1) ~= "string" or p1 == "" then
		return nil
	end
	local ok, status = pcall(function() --[[ line: 103 ]]
		-- upvalues: httpService (copy), p1 (ref)
		return httpService:JSONDecode(p1)
	end)
	
	if not ok or type(status) ~= "table" then
		return nil
	end
	local postId = status.postId
	
	return if type(postId) == "string" and postId ~= "" then postId elseif type(postId) == "number" then tostring(postId) else nil
end

local _ = function(p2) --[[ line: 113 | named "normalizeTargetIdType" ]]
	-- upvalues: shareLinkTargetIdType (ref)
	return if p2 == shareLinkTargetIdType.FeedItemId then shareLinkTargetIdType.FeedItemId else nil
end

local function getTargetIdTypeFromLaunchData(p3) --[[ line: 117 ]]
	-- upvalues: httpService (ref), shareLinkTargetIdType (ref)
	if type(p3) ~= "string" or p3 == "" then
		return nil
	end
	local ok, status = pcall(function() --[[ line: 122 ]]
		-- upvalues: httpService (copy), p3 (ref)
		return httpService:JSONDecode(p3)
	end)
	
	return if not (not ok or type(status) ~= "table") then if status.targetIdType == shareLinkTargetIdType.FeedItemId then shareLinkTargetIdType.FeedItemId else nil else nil
end

local function getDeepLinkedMomentIdFromParams(p4) --[[ line: 132 ]]
	-- upvalues: getMomentIdFromLaunchData (ref)
	if type(p4) ~= "table" then
		return nil
	end
	local postId
	local extraProps = p4.extraProps
	
	if type(extraProps) == "table" then
		postId = extraProps.postId
		local var36 = if type(postId) == "string" and postId ~= "" then postId elseif type(postId) == "number" then tostring(postId) else nil
		
		if var36 ~= nil then
			return var36
		end
		local var37 = getMomentIdFromLaunchData(extraProps.launchData)
		
		if var37 ~= nil then
			return var37
		end
	end
	postId = p4.postId
	local var38 = if type(postId) == "string" and postId ~= "" then postId elseif type(postId) == "number" then tostring(postId) else nil
	
	return if var38 == nil then getMomentIdFromLaunchData(p4.launchData) else var38
end

local function getDeepLinkedMomentTargetIdTypeFromParams(p5) --[[ line: 158 ]]
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

local function getDeepLinkRequestFromNavigationParams(p6, p7) --[[ line: 187 ]]
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
	local var40 = getDeepLinkedMomentIdFromParams(t)
	
	if var40 == nil then
		return nil
	end
	local var41 = getDeepLinkedMomentTargetIdTypeFromParams(t)
	
	return {
		momentId = var40,
		targetIdType = var41,
		key = if fFlagMomentsPassFeedItemIdToBackendApis then `{p7}:params:{tostring(t.extraProps)}:{tostring(t.postId)}:{tostring(t.launchData)}:{var40}:{tostring(var41)}` else `{p7}:params:{tostring(t.extraProps)}:{tostring(t.postId)}:{tostring(t.launchData)}:{var40}`
	}
end

local function getDeepLinkRequestFromNavigationState(p8, p9) --[[ line: 217 ]]
	-- upvalues: getActiveRoutes (ref), getDeepLinkedMomentIdFromParams (ref), getDeepLinkedMomentTargetIdTypeFromParams (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref)
	local var42 = getActiveRoutes(p8)
	
	for i = #var42, 1, -1 do
		local var43 = var42[i]
		local var44 = getDeepLinkedMomentIdFromParams(var43.params)
		
		if var44 == nil then
			continue
		end
		local var45 = getDeepLinkedMomentTargetIdTypeFromParams(var43.params)
		
		return {
			momentId = var44,
			targetIdType = var45,
			key = if fFlagMomentsPassFeedItemIdToBackendApis then `{p9}:state:{tostring(var43.key)}:{tostring(var43.params)}:{var44}:{tostring(var45)}` else `{p9}:state:{tostring(var43.key)}:{tostring(var43.params)}:{var44}`
		}
	end
	return nil
end

local function getDeepLinkRequest(p10) --[[ line: 239 ]]
	-- upvalues: getDeepLinkRequestFromNavigationParams (ref), getDeepLinkRequestFromNavigationState (ref)
	local var46 = p10
	local var47 = 0
	while var46 ~= nil do
		local var48 = tostring(var47)
		local var49 = getDeepLinkRequestFromNavigationParams(var46, var48) or getDeepLinkRequestFromNavigationState(var46.state, var48)
		
		if var49 == nil then
			if not var46._dangerouslyGetParent then break end
			var46 = var46._dangerouslyGetParent()
			var47 += 1
		end
		return var49
	end
	return nil
end

local _ = function(p11) --[[ line: 260 | named "getEntrySource" ]]
	if not p11 or not p11.getParam then
		return "watch_tab"
	end
	local extraProps = p11.getParam("extraProps")
	
	return if type(extraProps) == "table" and type(extraProps.source) == "string" then extraProps.source else p11.getParam("source", "watch_tab")
end

local _ = function(p12, p13, p14) --[[ line: 271 | named "seedDeepLinkedMoment" ]]
	-- upvalues: fFlagMomentsPassFeedItemIdToBackendApis (ref)
	if fFlagMomentsPassFeedItemIdToBackendApis then
		p12.setDeepLinkedMoment(p13, p14)
		
		return
	end
	p12.setDeepLinkedMomentId(p13)
end

local function MomentsTabEntry(p15) --[[ line: 279 ]]
	-- upvalues: reactModule (ref), createMomentsStoreModule (ref), useResetTeleportingOnGameLeaveModule (ref), var25 (ref), getFFlagMomentsShareDeeplinkReliableOpenModule (ref), getFFlagMomentsFixDeeplinkRefocusModule (ref), getDeepLinkRequest (ref), getDeepLinkStoreModule (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), robloxAppEventsModule (ref), appPage (ref), shareLinkTargetIdType (ref), consumeEntrySourceModule (ref), fFlagMomentsEmojiSetsApiModule (ref), momentsGetMomentsReactionsStoreModule (ref), fireAnalyticsEvent (ref), eventNames (ref), sessionManager (ref), funnelEventNames (ref), fireFunnelAnalyticsEvent (ref), fFlagMomentsSurfaceLoadTTI (ref), momentsSurfaceLoadManager (ref), fFlagMomentsRealtimeObservability (ref), getExperienceDetailsSheetStoreModule (ref), getImmersiveChromeStoreModule (ref), roactNavigationModule (ref), useMomentsTabIsVisibleModule (ref), getFFlagMomentsFixPeekReturnChromeModule (ref), useMomentsGating (ref), canRenderNativeMoments (ref), innerNavigatorModule (ref), var24 (ref), momentsHostShellModule (ref)
	local var51 = reactModule.useRef(p15)
	var51.current = p15
	local var52 = reactModule.useRef(false)
	local var53 = reactModule.useRef(false)
	local var54 = reactModule.useRef(nil)
	
	if var54.current == nil then
		var54.current = createMomentsStoreModule()
	end
	useResetTeleportingOnGameLeaveModule()
	local var25_1 = var25 or getFFlagMomentsShareDeeplinkReliableOpenModule()
	local var56 = getFFlagMomentsFixDeeplinkRefocusModule()
	local var57 = nil
	local var58 = nil
	
	if var25_1 then
		local var59 = getDeepLinkRequest(p15.navigation)
		local var60 = if var59 ~= nil then nil else var59.momentId
		local var61 = if var59 ~= nil then nil else var59.key
		var57 = reactModule.useRef(nil)
		var58 = reactModule.useRef({})
		
		if var60 ~= nil and var57.current ~= var61 then
			local var62 = getDeepLinkStoreModule()
			local var63 = if var59 ~= nil then nil else var59.targetIdType
			
			if fFlagMomentsPassFeedItemIdToBackendApis then
				var62.setDeepLinkedMoment(var60, var63)
			else
				var62.setDeepLinkedMomentId(var60)
			end
			var57.current = var61
		end
		reactModule.useEffect(function() --[[ line: 327 ]]
			-- upvalues: var60 (ref), var53 (ref), robloxAppEventsModule (copy), appPage (copy)
			if var60 ~= nil and var53.current then
				robloxAppEventsModule.ReloadPage:fire(appPage.Moments)
			end
			var53.current = true
		end, { var61, var60, p15.navigation })
	else
		reactModule.useEffect(function() --[[ line: 338 ]]
			-- upvalues: p15 (ref), getDeepLinkStoreModule (copy), fFlagMomentsPassFeedItemIdToBackendApis (copy), shareLinkTargetIdType (copy), var53 (ref), robloxAppEventsModule (copy), appPage (copy)
			local navigation = p15.navigation
			
			if not navigation or not navigation.getParam then return end
			local extraProps = navigation.getParam("extraProps")
			
			if type(extraProps) == "table" and type(extraProps.postId) == "string" then
				local var70 = getDeepLinkStoreModule()
				local postId = extraProps.postId
				local var71 = if fFlagMomentsPassFeedItemIdToBackendApis then if extraProps.targetIdType == shareLinkTargetIdType.FeedItemId then shareLinkTargetIdType.FeedItemId else nil else nil
				
				if fFlagMomentsPassFeedItemIdToBackendApis then
					var70.setDeepLinkedMoment(postId, var71)
				else
					var70.setDeepLinkedMomentId(postId)
				end
				if var53.current then
					robloxAppEventsModule.ReloadPage:fire(appPage.Moments)
				end
			end
			var53.current = true
		end, { p15.navigation })
	end
	local var64 = reactModule.useCallback(function() --[[ line: 361 ]]
		-- upvalues: var52 (ref), var54 (ref), var56 (ref), var58 (write), consumeEntrySourceModule (copy), var51 (ref), fFlagMomentsEmojiSetsApiModule (copy), momentsGetMomentsReactionsStoreModule (copy), fireAnalyticsEvent (copy), eventNames (copy), sessionManager (copy), funnelEventNames (copy), fireFunnelAnalyticsEvent (copy)
		if var52.current then return end
		local navigation, var72
		var52.current = true
		local current = var54.current
		
		if var56 and var58 ~= nil then
			var72 = consumeEntrySourceModule(var51.current.navigation, var58.current)
		else
			navigation = var51.current.navigation
			
			if navigation and navigation.getParam then
				local extraProps = navigation.getParam("extraProps")
				var72 = if type(extraProps) == "table" and type(extraProps.source) == "string" then extraProps.source else navigation.getParam("source", "watch_tab")
			else
				var72 = "watch_tab"
			end
		end
		current.resetSession()
		current.setSessionSource(var72)
		
		if fFlagMomentsEmojiSetsApiModule then
			navigation = momentsGetMomentsReactionsStoreModule(false).getAndFetchEmojiSets
			assert(navigation ~= nil, "expected getAndFetchEmojiSets when FFlagMomentsEmojiSetsApi is on")
			navigation()
		end
		fireAnalyticsEvent(eventNames.TapMomentsTab, {
			moments_session_id = current.getMomentsSessionId(false),
			source = var72
		})
		fireFunnelAnalyticsEvent(funnelEventNames.FunnelTypes.AppNavigation, funnelEventNames.AppNavigationSteps.AppLaunched, sessionManager.startSession(funnelEventNames.FunnelTypes.AppNavigation))
	end, { var56 })
	local var65 = reactModule.useCallback(function() --[[ line: 398 ]]
		-- upvalues: var52 (ref), fFlagMomentsSurfaceLoadTTI (copy), momentsSurfaceLoadManager (copy), fFlagMomentsRealtimeObservability (copy), getExperienceDetailsSheetStoreModule (copy), var54 (ref), fireAnalyticsEvent (copy), eventNames (copy), sessionManager (copy), funnelEventNames (copy)
		if not var52.current then return end
		var52.current = false
		
		if fFlagMomentsSurfaceLoadTTI then
			momentsSurfaceLoadManager.abort(if fFlagMomentsRealtimeObservability then "blur" else nil)
		end
		getExperienceDetailsSheetStoreModule(false).close()
		local current = var54.current
		fireAnalyticsEvent(eventNames.MomentsSessionEnded, {
			moments_session_id = current.getMomentsSessionId(false),
			source = current.getSessionSource(false),
			duration_seconds = tostring(math.floor(os.clock() - current.getSessionStartTime(false)))
		})
		sessionManager.endSession(funnelEventNames.FunnelTypes.AppNavigation)
	end, {})
	local var66 = reactModule.useCallback(function() --[[ line: 428 ]]
		-- upvalues: getImmersiveChromeStoreModule (copy), var51 (ref)
		getImmersiveChromeStoreModule(false).setOverlayCovering(false)
		local onTabFocused = var51.current.onTabFocused
		
		if onTabFocused then
			onTabFocused()
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 441 ]]
		-- upvalues: p15 (ref), var64 (ref), var66 (ref), var65 (ref), roactNavigationModule (copy), var25_1 (ref), getDeepLinkRequest (copy), var56 (ref), var57 (write), getDeepLinkStoreModule (copy), fFlagMomentsPassFeedItemIdToBackendApis (copy), robloxAppEventsModule (copy), appPage (copy), shareLinkTargetIdType (copy)
		local navigation = p15.navigation
		
		if navigation and navigation.addListener then
			var64()
			var66()
			local var74 = navigation.addListener(roactNavigationModule.Events.DidFocus, function() --[[ line: 454 ]]
				-- upvalues: var25_1 (copy), getDeepLinkRequest (copy), navigation (ref), var56 (copy), var57 (copy), getDeepLinkStoreModule (copy), fFlagMomentsPassFeedItemIdToBackendApis (copy), robloxAppEventsModule (copy), appPage (copy), shareLinkTargetIdType (copy), var64 (copy), var66 (copy)
				if var25_1 then
					local var76 = getDeepLinkRequest(navigation)
					
					if var76 ~= nil and not (var56 and (var76 ~= nil and var57.current == var76.key)) then
						local var77 = getDeepLinkStoreModule()
						local momentId = var76.momentId
						local targetIdType = var76.targetIdType
						
						if fFlagMomentsPassFeedItemIdToBackendApis then
							var77.setDeepLinkedMoment(momentId, targetIdType)
						else
							var77.setDeepLinkedMomentId(momentId)
						end
						var57.current = var76.key
						robloxAppEventsModule.ReloadPage:fire(appPage.Moments)
					end
				else
					local extraProps = navigation.getParam("extraProps")
					
					if type(extraProps) == "table" and type(extraProps.postId) == "string" then
						local var79 = getDeepLinkStoreModule()
						local postId = extraProps.postId
						local var80 = if fFlagMomentsPassFeedItemIdToBackendApis then if extraProps.targetIdType == shareLinkTargetIdType.FeedItemId then shareLinkTargetIdType.FeedItemId else nil else nil
						
						if fFlagMomentsPassFeedItemIdToBackendApis then
							var79.setDeepLinkedMoment(postId, var80)
						else
							var79.setDeepLinkedMomentId(postId)
						end
						robloxAppEventsModule.ReloadPage:fire(appPage.Moments)
					end
				end
				var64()
				var66()
			end)
			local var75 = navigation.addListener(roactNavigationModule.Events.WillBlur, function() --[[ line: 488 ]]
				-- upvalues: var65 (copy)
				var65()
			end)
			
			return function() --[[ line: 492 ]]
				-- upvalues: var65 (copy), var74 (ref), var75 (ref)
				var65()
				var74.remove()
				var75.remove()
			end
		end
		var64()
		var66()
		
		return function() --[[ line: 446 ]]
			-- upvalues: var65 (copy)
			var65()
		end
	end, { var64, var65, var66 })
	local var67 = useMomentsTabIsVisibleModule()
	reactModule.useEffect(function() --[[ line: 507 ]]
		-- upvalues: getFFlagMomentsFixPeekReturnChromeModule (copy), var67 (ref), var66 (ref)
		if getFFlagMomentsFixPeekReturnChromeModule() and var67 then
			var66()
		end
	end, { var67, var66 })
	local var68 = reactModule.useMemo(function() --[[ line: 516 ]]
		-- upvalues: p15 (ref), getImmersiveChromeStoreModule (copy)
		local openProfile = p15.openProfile
		local openOwnMoments = p15.openOwnMoments
		
		return {
			openProfile = if openProfile then function(p16) --[[ line: 521 ]]
				-- upvalues: getImmersiveChromeStoreModule (copy), openProfile (ref)
				getImmersiveChromeStoreModule(false).setOverlayCovering(true)
				openProfile(p16)
			end else nil,
			openOwnMoments = if openOwnMoments then function() --[[ line: 527 ]]
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
		sessionStore = var54.current,
		openProfile = var68.openProfile,
		openOwnMoments = var68.openOwnMoments,
		openMomentsFeedReport = var68.openMomentsFeedReport
	}, if p15.useRootOwnedNavigation then reactModule.createElement(innerNavigatorModule, { navigation = p15.navigation }) else reactModule.createElement(var24)) else nil
end

local function MomentsTabEntrySessionized(p17) --[[ line: 564 ]]
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

function momentsTabEntryScreen.render(p18) --[[ line: 580 ]]
	-- upvalues: reactModule (ref), MomentsTabEntrySessionized (ref)
	return reactModule.createElement(MomentsTabEntrySessionized, p18.props)
end

momentsTabEntryScreen.router = innerNavigatorModule.router

return if fFlagMomentsWatchSessionalization then momentsTabEntryScreen else MomentsTabEntry