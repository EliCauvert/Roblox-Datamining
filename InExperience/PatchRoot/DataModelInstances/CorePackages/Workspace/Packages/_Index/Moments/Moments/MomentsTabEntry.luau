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
local getFFlagMomentsFixPeekReturnChromeModule = require(moments.Flags.GetFFlagMomentsFixPeekReturnChrome)
local fFlagMomentsEmojiSetsApiModule = require(moments.Flags.FFlagMomentsEmojiSetsApi)
local useMomentsTabIsVisibleModule = require(moments.Hooks.useMomentsTabIsVisible)
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
local fFlagMomentsPassFeedItemIdToBackendApis = sharedFlagsModule.FFlagMomentsPassFeedItemIdToBackendApis
local shareLinkTargetIdType = momentsTypesModule.Enums.ShareLinkTargetIdType
local var22 = roactNavigationModule.createAppContainer(innerNavigatorModule)
local getActiveRoutes = navigationModule.getActiveRoutes
local var23 = getFFlagMomentsFixShareDeeplinkModule()

local function _(p0) --[[ line: 78 | named "normalizeDeepLinkedMomentId" ]]
	return if type(p0) == "string" and p0 ~= "" then p0 elseif type(p0) == "number" then tostring(p0) else nil
end

local function getMomentIdFromLaunchData(p1) --[[ line: 87 ]]
	-- upvalues: httpService (ref)
	if type(p1) ~= "string" or p1 == "" then
		return nil
	end
	local ok, status = pcall(function() --[[ line: 92 ]]
		-- upvalues: httpService (copy), p1 (ref)
		return httpService:JSONDecode(p1)
	end)
	
	if not ok or type(status) ~= "table" then
		return nil
	end
	local postId = status.postId
	
	return if type(postId) == "string" and postId ~= "" then postId elseif type(postId) == "number" then tostring(postId) else nil
end

local _ = function(p2) --[[ line: 102 | named "normalizeTargetIdType" ]]
	-- upvalues: shareLinkTargetIdType (ref)
	return if p2 == shareLinkTargetIdType.FeedItemId then shareLinkTargetIdType.FeedItemId else nil
end

local function getTargetIdTypeFromLaunchData(p3) --[[ line: 106 ]]
	-- upvalues: httpService (ref), shareLinkTargetIdType (ref)
	if type(p3) ~= "string" or p3 == "" then
		return nil
	end
	local ok, status = pcall(function() --[[ line: 111 ]]
		-- upvalues: httpService (copy), p3 (ref)
		return httpService:JSONDecode(p3)
	end)
	
	return if not (not ok or type(status) ~= "table") then if status.targetIdType == shareLinkTargetIdType.FeedItemId then shareLinkTargetIdType.FeedItemId else nil else nil
end

local function getDeepLinkedMomentIdFromParams(p4) --[[ line: 121 ]]
	-- upvalues: getMomentIdFromLaunchData (ref)
	if type(p4) ~= "table" then
		return nil
	end
	local postId
	local extraProps = p4.extraProps
	
	if type(extraProps) == "table" then
		postId = extraProps.postId
		local var34 = if type(postId) == "string" and postId ~= "" then postId elseif type(postId) == "number" then tostring(postId) else nil
		
		if var34 ~= nil then
			return var34
		end
		local var35 = getMomentIdFromLaunchData(extraProps.launchData)
		
		if var35 ~= nil then
			return var35
		end
	end
	postId = p4.postId
	local var36 = if type(postId) == "string" and postId ~= "" then postId elseif type(postId) == "number" then tostring(postId) else nil
	
	return if var36 == nil then getMomentIdFromLaunchData(p4.launchData) else var36
end

local function getDeepLinkedMomentTargetIdTypeFromParams(p5) --[[ line: 147 ]]
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

local function getDeepLinkRequestFromNavigationParams(p6, p7) --[[ line: 176 ]]
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
	local var38 = getDeepLinkedMomentIdFromParams(t)
	
	if var38 == nil then
		return nil
	end
	local var39 = getDeepLinkedMomentTargetIdTypeFromParams(t)
	
	return {
		momentId = var38,
		targetIdType = var39,
		key = if fFlagMomentsPassFeedItemIdToBackendApis then `{p7}:params:{tostring(t.extraProps)}:{tostring(t.postId)}:{tostring(t.launchData)}:{var38}:{tostring(var39)}` else `{p7}:params:{tostring(t.extraProps)}:{tostring(t.postId)}:{tostring(t.launchData)}:{var38}`
	}
end

local function getDeepLinkRequestFromNavigationState(p8, p9) --[[ line: 206 ]]
	-- upvalues: getActiveRoutes (ref), getDeepLinkedMomentIdFromParams (ref), getDeepLinkedMomentTargetIdTypeFromParams (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref)
	local var40 = getActiveRoutes(p8)
	
	for i = #var40, 1, -1 do
		local var41 = var40[i]
		local var42 = getDeepLinkedMomentIdFromParams(var41.params)
		
		if var42 == nil then
			continue
		end
		local var43 = getDeepLinkedMomentTargetIdTypeFromParams(var41.params)
		
		return {
			momentId = var42,
			targetIdType = var43,
			key = if fFlagMomentsPassFeedItemIdToBackendApis then `{p9}:state:{tostring(var41.key)}:{tostring(var41.params)}:{var42}:{tostring(var43)}` else `{p9}:state:{tostring(var41.key)}:{tostring(var41.params)}:{var42}`
		}
	end
	return nil
end

local function getDeepLinkRequest(p10) --[[ line: 228 ]]
	-- upvalues: getDeepLinkRequestFromNavigationParams (ref), getDeepLinkRequestFromNavigationState (ref)
	local var44 = p10
	local var45 = 0
	while var44 ~= nil do
		local var46 = tostring(var45)
		local var47 = getDeepLinkRequestFromNavigationParams(var44, var46) or getDeepLinkRequestFromNavigationState(var44.state, var46)
		
		if var47 == nil then
			if not var44._dangerouslyGetParent then break end
			var44 = var44._dangerouslyGetParent()
			var45 += 1
		end
		return var47
	end
	return nil
end

local _ = function(p11) --[[ line: 249 | named "getEntrySource" ]]
	if not p11 or not p11.getParam then
		return "watch_tab"
	end
	local extraProps = p11.getParam("extraProps")
	
	return if type(extraProps) == "table" and type(extraProps.source) == "string" then extraProps.source else p11.getParam("source", "watch_tab")
end

local _ = function(p12, p13, p14) --[[ line: 260 | named "seedDeepLinkedMoment" ]]
	-- upvalues: fFlagMomentsPassFeedItemIdToBackendApis (ref)
	if fFlagMomentsPassFeedItemIdToBackendApis then
		p12.setDeepLinkedMoment(p13, p14)
		
		return
	end
	p12.setDeepLinkedMomentId(p13)
end

local function MomentsTabEntry(p15) --[[ line: 268 ]]
	-- upvalues: reactModule (ref), createMomentsStoreModule (ref), useResetTeleportingOnGameLeaveModule (ref), var23 (ref), getFFlagMomentsShareDeeplinkReliableOpenModule (ref), getDeepLinkRequest (ref), getDeepLinkStoreModule (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), robloxAppEventsModule (ref), appPage (ref), shareLinkTargetIdType (ref), fFlagMomentsEmojiSetsApiModule (ref), momentsGetMomentsReactionsStoreModule (ref), fireAnalyticsEvent (ref), eventNames (ref), sessionManager (ref), funnelEventNames (ref), fireFunnelAnalyticsEvent (ref), fFlagMomentsSurfaceLoadTTI (ref), momentsSurfaceLoadManager (ref), getExperienceDetailsSheetStoreModule (ref), getImmersiveChromeStoreModule (ref), roactNavigationModule (ref), useMomentsTabIsVisibleModule (ref), getFFlagMomentsFixPeekReturnChromeModule (ref), useMomentsGating (ref), canRenderNativeMoments (ref), innerNavigatorModule (ref), var22 (ref), momentsHostShellModule (ref)
	local var49 = reactModule.useRef(p15)
	var49.current = p15
	local var50 = reactModule.useRef(false)
	local var51 = reactModule.useRef(false)
	local var52 = reactModule.useRef(nil)
	
	if var52.current == nil then
		var52.current = createMomentsStoreModule()
	end
	useResetTeleportingOnGameLeaveModule()
	local var23_1 = var23 or getFFlagMomentsShareDeeplinkReliableOpenModule()
	local var54 = nil
	
	if var23_1 then
		local var55 = getDeepLinkRequest(p15.navigation)
		local var56 = if var55 ~= nil then nil else var55.momentId
		local var57 = if var55 ~= nil then nil else var55.key
		var54 = reactModule.useRef(nil)
		
		if var56 ~= nil and var54.current ~= var57 then
			local var58 = getDeepLinkStoreModule()
			local var59 = if var55 ~= nil then nil else var55.targetIdType
			
			if fFlagMomentsPassFeedItemIdToBackendApis then
				var58.setDeepLinkedMoment(var56, var59)
			else
				var58.setDeepLinkedMomentId(var56)
			end
			var54.current = var57
		end
		reactModule.useEffect(function() --[[ line: 313 ]]
			-- upvalues: var56 (ref), var51 (ref), robloxAppEventsModule (copy), appPage (copy)
			if var56 ~= nil and var51.current then
				robloxAppEventsModule.ReloadPage:fire(appPage.Moments)
			end
			var51.current = true
		end, { var57, var56, p15.navigation })
	else
		reactModule.useEffect(function() --[[ line: 324 ]]
			-- upvalues: p15 (ref), getDeepLinkStoreModule (copy), fFlagMomentsPassFeedItemIdToBackendApis (copy), shareLinkTargetIdType (copy), var51 (ref), robloxAppEventsModule (copy), appPage (copy)
			local navigation = p15.navigation
			
			if not navigation or not navigation.getParam then return end
			local extraProps = navigation.getParam("extraProps")
			
			if type(extraProps) == "table" and type(extraProps.postId) == "string" then
				local var66 = getDeepLinkStoreModule()
				local postId = extraProps.postId
				local var67 = if fFlagMomentsPassFeedItemIdToBackendApis then if extraProps.targetIdType == shareLinkTargetIdType.FeedItemId then shareLinkTargetIdType.FeedItemId else nil else nil
				
				if fFlagMomentsPassFeedItemIdToBackendApis then
					var66.setDeepLinkedMoment(postId, var67)
				else
					var66.setDeepLinkedMomentId(postId)
				end
				if var51.current then
					robloxAppEventsModule.ReloadPage:fire(appPage.Moments)
				end
			end
			var51.current = true
		end, { p15.navigation })
	end
	local var60 = reactModule.useCallback(function() --[[ line: 347 ]]
		-- upvalues: var50 (ref), var52 (ref), var49 (ref), fFlagMomentsEmojiSetsApiModule (copy), momentsGetMomentsReactionsStoreModule (copy), fireAnalyticsEvent (copy), eventNames (copy), sessionManager (copy), funnelEventNames (copy), fireFunnelAnalyticsEvent (copy)
		if var50.current then return end
		local var68
		var50.current = true
		local current = var52.current
		local navigation = var49.current.navigation
		
		if navigation and navigation.getParam then
			local extraProps = navigation.getParam("extraProps")
			var68 = if type(extraProps) == "table" and type(extraProps.source) == "string" then extraProps.source else navigation.getParam("source", "watch_tab")
		else
			var68 = "watch_tab"
		end
		current.resetSession()
		current.setSessionSource(var68)
		
		if fFlagMomentsEmojiSetsApiModule then
			navigation = momentsGetMomentsReactionsStoreModule(false).getAndFetchEmojiSets
			assert(navigation ~= nil, "expected getAndFetchEmojiSets when FFlagMomentsEmojiSetsApi is on")
			navigation()
		end
		fireAnalyticsEvent(eventNames.TapMomentsTab, {
			moments_session_id = current.getMomentsSessionId(false),
			source = var68
		})
		fireFunnelAnalyticsEvent(funnelEventNames.FunnelTypes.AppNavigation, funnelEventNames.AppNavigationSteps.AppLaunched, sessionManager.startSession(funnelEventNames.FunnelTypes.AppNavigation))
	end, {})
	local var61 = reactModule.useCallback(function() --[[ line: 380 ]]
		-- upvalues: var50 (ref), fFlagMomentsSurfaceLoadTTI (copy), momentsSurfaceLoadManager (copy), getExperienceDetailsSheetStoreModule (copy), var52 (ref), fireAnalyticsEvent (copy), eventNames (copy), sessionManager (copy), funnelEventNames (copy)
		if not var50.current then return end
		var50.current = false
		
		if fFlagMomentsSurfaceLoadTTI then
			momentsSurfaceLoadManager.abort()
		end
		getExperienceDetailsSheetStoreModule(false).close()
		local current = var52.current
		fireAnalyticsEvent(eventNames.MomentsSessionEnded, {
			moments_session_id = current.getMomentsSessionId(false),
			source = current.getSessionSource(false),
			duration_seconds = tostring(math.floor(os.clock() - current.getSessionStartTime(false)))
		})
		sessionManager.endSession(funnelEventNames.FunnelTypes.AppNavigation)
	end, {})
	local var62 = reactModule.useCallback(function() --[[ line: 410 ]]
		-- upvalues: getImmersiveChromeStoreModule (copy), var49 (ref)
		getImmersiveChromeStoreModule(false).setOverlayCovering(false)
		local onTabFocused = var49.current.onTabFocused
		
		if onTabFocused then
			onTabFocused()
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 423 ]]
		-- upvalues: p15 (ref), var60 (ref), var62 (ref), var61 (ref), roactNavigationModule (copy), var23_1 (ref), getDeepLinkRequest (copy), getDeepLinkStoreModule (copy), fFlagMomentsPassFeedItemIdToBackendApis (copy), var54 (write), robloxAppEventsModule (copy), appPage (copy), shareLinkTargetIdType (copy)
		local navigation = p15.navigation
		
		if navigation and navigation.addListener then
			var60()
			var62()
			local var70 = navigation.addListener(roactNavigationModule.Events.DidFocus, function() --[[ line: 436 ]]
				-- upvalues: var23_1 (copy), getDeepLinkRequest (copy), navigation (ref), getDeepLinkStoreModule (copy), fFlagMomentsPassFeedItemIdToBackendApis (copy), var54 (copy), robloxAppEventsModule (copy), appPage (copy), shareLinkTargetIdType (copy), var60 (copy), var62 (copy)
				if var23_1 then
					local var72 = getDeepLinkRequest(navigation)
					
					if var72 ~= nil then
						local var73 = getDeepLinkStoreModule()
						local momentId = var72.momentId
						local targetIdType = var72.targetIdType
						
						if fFlagMomentsPassFeedItemIdToBackendApis then
							var73.setDeepLinkedMoment(momentId, targetIdType)
						else
							var73.setDeepLinkedMomentId(momentId)
						end
						var54.current = var72.key
						robloxAppEventsModule.ReloadPage:fire(appPage.Moments)
					end
				else
					local extraProps = navigation.getParam("extraProps")
					
					if type(extraProps) == "table" and type(extraProps.postId) == "string" then
						local var75 = getDeepLinkStoreModule()
						local postId = extraProps.postId
						local var76 = if fFlagMomentsPassFeedItemIdToBackendApis then if extraProps.targetIdType == shareLinkTargetIdType.FeedItemId then shareLinkTargetIdType.FeedItemId else nil else nil
						
						if fFlagMomentsPassFeedItemIdToBackendApis then
							var75.setDeepLinkedMoment(postId, var76)
						else
							var75.setDeepLinkedMomentId(postId)
						end
						robloxAppEventsModule.ReloadPage:fire(appPage.Moments)
					end
				end
				var60()
				var62()
			end)
			local var71 = navigation.addListener(roactNavigationModule.Events.WillBlur, function() --[[ line: 465 ]]
				-- upvalues: var61 (copy)
				var61()
			end)
			
			return function() --[[ line: 469 ]]
				-- upvalues: var61 (copy), var70 (ref), var71 (ref)
				var61()
				var70.remove()
				var71.remove()
			end
		end
		var60()
		var62()
		
		return function() --[[ line: 428 ]]
			-- upvalues: var61 (copy)
			var61()
		end
	end, { var60, var61, var62 })
	local var63 = useMomentsTabIsVisibleModule()
	reactModule.useEffect(function() --[[ line: 484 ]]
		-- upvalues: getFFlagMomentsFixPeekReturnChromeModule (copy), var63 (ref), var62 (ref)
		if getFFlagMomentsFixPeekReturnChromeModule() and var63 then
			var62()
		end
	end, { var63, var62 })
	local var64 = reactModule.useMemo(function() --[[ line: 493 ]]
		-- upvalues: p15 (ref), getImmersiveChromeStoreModule (copy)
		local openProfile = p15.openProfile
		local openOwnMoments = p15.openOwnMoments
		
		return {
			openProfile = if openProfile then function(p16) --[[ line: 498 ]]
				-- upvalues: getImmersiveChromeStoreModule (copy), openProfile (ref)
				getImmersiveChromeStoreModule(false).setOverlayCovering(true)
				openProfile(p16)
			end else nil,
			openOwnMoments = if openOwnMoments then function() --[[ line: 504 ]]
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
		sessionStore = var52.current,
		openProfile = var64.openProfile,
		openOwnMoments = var64.openOwnMoments,
		openMomentsFeedReport = var64.openMomentsFeedReport
	}, if p15.useRootOwnedNavigation then reactModule.createElement(innerNavigatorModule, { navigation = p15.navigation }) else reactModule.createElement(var22)) else nil
end

local function MomentsTabEntrySessionized(p17) --[[ line: 541 ]]
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

function momentsTabEntryScreen.render(p18) --[[ line: 557 ]]
	-- upvalues: reactModule (ref), MomentsTabEntrySessionized (ref)
	return reactModule.createElement(MomentsTabEntrySessionized, p18.props)
end

momentsTabEntryScreen.router = innerNavigatorModule.router

return if fFlagMomentsWatchSessionalization then momentsTabEntryScreen else MomentsTabEntry