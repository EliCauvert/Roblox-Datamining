local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local httpService = game:GetService("HttpService")
local momentsCommonModule = require(parent.MomentsCommon)
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
local innerNavigatorModule = require(moments.Navigation.InnerNavigator)
local momentsHostShellModule = require(moments.Components.MomentsHostShell)
local useResetTeleportingOnGameLeaveModule = require(moments.Hooks.useResetTeleportingOnGameLeave)
local getExperienceDetailsSheetStoreModule = require(moments.ExperienceDetailsSheet.Sheet.getExperienceDetailsSheetStore)
local analytics = momentsCommonModule.Analytics
local eventNames = analytics.EventNames
local funnelEventNames = analytics.FunnelEventNames
local sessionManager = analytics.SessionManager
local fireAnalyticsEvent = analytics.fireAnalyticsEvent
local fireFunnelAnalyticsEvent = analytics.fireFunnelAnalyticsEvent
local momentsSurfaceLoadManager = momentsCommonModule.Performance.MomentsSurfaceLoadManager
local useMomentsGating = momentsCommonModule.Hooks.useMomentsGating
local fFlagMomentsWatchSessionalization = sharedFlagsModule.FFlagMomentsWatchSessionalization
local fFlagMomentsSurfaceLoadTTI = sharedFlagsModule.FFlagMomentsSurfaceLoadTTI
local var16 = roactNavigationModule.createAppContainer(innerNavigatorModule)
local getActiveRoutes = navigationModule.getActiveRoutes
local var17 = getFFlagMomentsFixShareDeeplinkModule()

local function _(p0) --[[ line: 67 | named "normalizeDeepLinkedMomentId" ]]
	return if type(p0) == "string" and p0 ~= "" then p0 elseif type(p0) == "number" then tostring(p0) else nil
end

local function getMomentIdFromLaunchData(p1) --[[ line: 76 ]]
	-- upvalues: httpService (ref)
	if type(p1) ~= "string" or p1 == "" then
		return nil
	end
	local ok, status = pcall(function() --[[ line: 81 ]]
		-- upvalues: httpService (copy), p1 (ref)
		return httpService:JSONDecode(p1)
	end)
	
	if not ok or type(status) ~= "table" then
		return nil
	end
	local postId = status.postId
	
	return if type(postId) == "string" and postId ~= "" then postId elseif type(postId) == "number" then tostring(postId) else nil
end

local function getDeepLinkedMomentIdFromParams(p2) --[[ line: 91 ]]
	-- upvalues: getMomentIdFromLaunchData (ref)
	if type(p2) ~= "table" then
		return nil
	end
	local postId
	local extraProps = p2.extraProps
	
	if type(extraProps) == "table" then
		postId = extraProps.postId
		local var26 = if type(postId) == "string" and postId ~= "" then postId elseif type(postId) == "number" then tostring(postId) else nil
		
		if var26 ~= nil then
			return var26
		end
		local var27 = getMomentIdFromLaunchData(extraProps.launchData)
		
		if var27 ~= nil then
			return var27
		end
	end
	postId = p2.postId
	local var28 = if type(postId) == "string" and postId ~= "" then postId elseif type(postId) == "number" then tostring(postId) else nil
	
	return if var28 == nil then getMomentIdFromLaunchData(p2.launchData) else var28
end

local function getDeepLinkRequestFromNavigationParams(p3, p4) --[[ line: 122 ]]
	-- upvalues: getDeepLinkedMomentIdFromParams (ref)
	if not p3 or not p3.getParam then
		return nil
	end
	local t = {
		extraProps = p3.getParam("extraProps"),
		postId = p3.getParam("postId"),
		launchData = p3.getParam("launchData")
	}
	local var30 = getDeepLinkedMomentIdFromParams(t)
	
	return if var30 == nil then nil else {
		momentId = var30,
		key = `{p4}:params:{tostring(t.extraProps)}:{tostring(t.postId)}:{tostring(t.launchData)}:{var30}`
	}
end

local function getDeepLinkRequestFromNavigationState(p5, p6) --[[ line: 143 ]]
	-- upvalues: getActiveRoutes (ref), getDeepLinkedMomentIdFromParams (ref)
	local var31 = getActiveRoutes(p5)
	
	for i = #var31, 1, -1 do
		local var32 = var31[i]
		local var33 = getDeepLinkedMomentIdFromParams(var32.params)
		
		if var33 == nil then
			continue
		end
		return {
			momentId = var33,
			key = `{p6}:state:{tostring(var32.key)}:{tostring(var32.params)}:{var33}`
		}
	end
	return nil
end

local function getDeepLinkRequest(p7) --[[ line: 159 ]]
	-- upvalues: getDeepLinkRequestFromNavigationParams (ref), getDeepLinkRequestFromNavigationState (ref)
	local var34 = p7
	local var35 = 0
	while var34 ~= nil do
		local var36 = tostring(var35)
		local var37 = getDeepLinkRequestFromNavigationParams(var34, var36) or getDeepLinkRequestFromNavigationState(var34.state, var36)
		
		if var37 == nil then
			if not var34._dangerouslyGetParent then break end
			var34 = var34._dangerouslyGetParent()
			var35 += 1
		end
		return var37
	end
	return nil
end

local _ = function(p8) --[[ line: 180 | named "getEntrySource" ]]
	if not p8 or not p8.getParam then
		return "watch_tab"
	end
	local extraProps = p8.getParam("extraProps")
	
	return if type(extraProps) == "table" and type(extraProps.source) == "string" then extraProps.source else p8.getParam("source", "watch_tab")
end

local function MomentsTabEntry(p9) --[[ line: 191 ]]
	-- upvalues: reactModule (ref), createMomentsStoreModule (ref), useResetTeleportingOnGameLeaveModule (ref), var17 (ref), getDeepLinkRequest (ref), getDeepLinkStoreModule (ref), robloxAppEventsModule (ref), appPage (ref), fireAnalyticsEvent (ref), eventNames (ref), sessionManager (ref), funnelEventNames (ref), fireFunnelAnalyticsEvent (ref), fFlagMomentsSurfaceLoadTTI (ref), momentsSurfaceLoadManager (ref), getExperienceDetailsSheetStoreModule (ref), getImmersiveChromeStoreModule (ref), roactNavigationModule (ref), useMomentsGating (ref), innerNavigatorModule (ref), var16 (ref), momentsHostShellModule (ref)
	local var39 = reactModule.useRef(p9)
	var39.current = p9
	local var40 = reactModule.useRef(false)
	local var41 = reactModule.useRef(false)
	local var42 = reactModule.useRef(nil)
	
	if var42.current == nil then
		var42.current = createMomentsStoreModule()
	end
	useResetTeleportingOnGameLeaveModule()
	local var43 = nil
	
	if var17 then
		local var44 = getDeepLinkRequest(p9.navigation)
		local var45 = if var44 ~= nil then nil else var44.momentId
		local var46 = if var44 ~= nil then nil else var44.key
		var43 = reactModule.useRef(nil)
		
		if var45 ~= nil and var43.current ~= var46 then
			getDeepLinkStoreModule().setDeepLinkedMomentId(var45)
			var43.current = var46
		end
		reactModule.useEffect(function() --[[ line: 227 ]]
			-- upvalues: var45 (ref), var41 (ref), robloxAppEventsModule (copy), appPage (copy)
			if var45 ~= nil and var41.current then
				robloxAppEventsModule.ReloadPage:fire(appPage.Moments)
			end
			var41.current = true
		end, { var46, var45, p9.navigation })
	else
		reactModule.useEffect(function() --[[ line: 238 ]]
			-- upvalues: p9 (ref), getDeepLinkStoreModule (copy), var41 (ref), robloxAppEventsModule (copy), appPage (copy)
			local navigation = p9.navigation
			
			if not navigation or not navigation.getParam then return end
			local extraProps = navigation.getParam("extraProps")
			
			if type(extraProps) == "table" and type(extraProps.postId) == "string" then
				getDeepLinkStoreModule().setDeepLinkedMomentId(extraProps.postId)
				
				if var41.current then
					robloxAppEventsModule.ReloadPage:fire(appPage.Moments)
				end
			end
			var41.current = true
		end, { p9.navigation })
	end
	local var47 = reactModule.useCallback(function() --[[ line: 255 ]]
		-- upvalues: var40 (ref), var42 (ref), var39 (ref), fireAnalyticsEvent (copy), eventNames (copy), sessionManager (copy), funnelEventNames (copy), fireFunnelAnalyticsEvent (copy)
		if var40.current then return end
		local var53
		var40.current = true
		local current = var42.current
		local navigation = var39.current.navigation
		
		if navigation and navigation.getParam then
			local extraProps = navigation.getParam("extraProps")
			var53 = if type(extraProps) == "table" and type(extraProps.source) == "string" then extraProps.source else navigation.getParam("source", "watch_tab")
		else
			var53 = "watch_tab"
		end
		current.resetSession()
		current.setSessionSource(var53)
		fireAnalyticsEvent(eventNames.TapMomentsTab, {
			moments_session_id = current.getMomentsSessionId(false),
			source = var53
		})
		fireFunnelAnalyticsEvent(funnelEventNames.FunnelTypes.AppNavigation, funnelEventNames.AppNavigationSteps.AppLaunched, sessionManager.startSession(funnelEventNames.FunnelTypes.AppNavigation))
	end, {})
	local var48 = reactModule.useCallback(function() --[[ line: 280 ]]
		-- upvalues: var40 (ref), fFlagMomentsSurfaceLoadTTI (copy), momentsSurfaceLoadManager (copy), getExperienceDetailsSheetStoreModule (copy), var42 (ref), fireAnalyticsEvent (copy), eventNames (copy), sessionManager (copy), funnelEventNames (copy)
		if not var40.current then return end
		var40.current = false
		
		if fFlagMomentsSurfaceLoadTTI then
			momentsSurfaceLoadManager.abort()
		end
		getExperienceDetailsSheetStoreModule(false).close()
		local current = var42.current
		fireAnalyticsEvent(eventNames.MomentsSessionEnded, {
			moments_session_id = current.getMomentsSessionId(false),
			source = current.getSessionSource(false),
			duration_seconds = tostring(math.floor(os.clock() - current.getSessionStartTime(false)))
		})
		sessionManager.endSession(funnelEventNames.FunnelTypes.AppNavigation)
	end, {})
	local var49 = reactModule.useCallback(function() --[[ line: 310 ]]
		-- upvalues: getImmersiveChromeStoreModule (copy), var39 (ref)
		getImmersiveChromeStoreModule(false).setOverlayCovering(false)
		local onTabFocused = var39.current.onTabFocused
		
		if onTabFocused then
			onTabFocused()
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 323 ]]
		-- upvalues: p9 (ref), var47 (ref), var49 (ref), var48 (ref), roactNavigationModule (copy), var17 (copy), getDeepLinkRequest (copy), getDeepLinkStoreModule (copy), var43 (write), robloxAppEventsModule (copy), appPage (copy)
		local navigation = p9.navigation
		
		if navigation and navigation.addListener then
			var47()
			var49()
			local var55 = navigation.addListener(roactNavigationModule.Events.DidFocus, function() --[[ line: 336 ]]
				-- upvalues: var17 (copy), getDeepLinkRequest (copy), navigation (ref), getDeepLinkStoreModule (copy), var43 (copy), robloxAppEventsModule (copy), appPage (copy), var47 (copy), var49 (copy)
				if var17 then
					local var57 = getDeepLinkRequest(navigation)
					
					if var57 ~= nil then
						getDeepLinkStoreModule().setDeepLinkedMomentId(var57.momentId)
						var43.current = var57.key
						robloxAppEventsModule.ReloadPage:fire(appPage.Moments)
					end
				else
					local extraProps = navigation.getParam("extraProps")
					
					if type(extraProps) == "table" and type(extraProps.postId) == "string" then
						getDeepLinkStoreModule().setDeepLinkedMomentId(extraProps.postId)
						robloxAppEventsModule.ReloadPage:fire(appPage.Moments)
					end
				end
				var47()
				var49()
			end)
			local var56 = navigation.addListener(roactNavigationModule.Events.WillBlur, function() --[[ line: 355 ]]
				-- upvalues: var48 (copy)
				var48()
			end)
			
			return function() --[[ line: 359 ]]
				-- upvalues: var48 (copy), var55 (ref), var56 (ref)
				var48()
				var55.remove()
				var56.remove()
			end
		end
		var47()
		var49()
		
		return function() --[[ line: 328 ]]
			-- upvalues: var48 (copy)
			var48()
		end
	end, { var47, var48, var49 })
	local var50 = reactModule.useMemo(function() --[[ line: 370 ]]
		-- upvalues: p9 (ref), getImmersiveChromeStoreModule (copy)
		local openProfile = p9.openProfile
		local openOwnMoments = p9.openOwnMoments
		
		return {
			openProfile = if openProfile then function(p10) --[[ line: 375 ]]
				-- upvalues: getImmersiveChromeStoreModule (copy), openProfile (ref)
				getImmersiveChromeStoreModule(false).setOverlayCovering(true)
				openProfile(p10)
			end else nil,
			openOwnMoments = if openOwnMoments then function() --[[ line: 381 ]]
				-- upvalues: getImmersiveChromeStoreModule (copy), openOwnMoments (ref)
				getImmersiveChromeStoreModule(false).setOverlayCovering(true)
				openOwnMoments()
			end else nil
		}
	end, { p9.openProfile, p9.openOwnMoments })
	local var51 = useMomentsGating()
	
	return if var51.isTabEnabled or var51.isFlyoutEntryEnabled and var51.platformIntegrationEnabled then reactModule.createElement(momentsHostShellModule, {
		sessionStore = var42.current,
		openProfile = var50.openProfile,
		openOwnMoments = var50.openOwnMoments
	}, if p9.useRootOwnedNavigation then reactModule.createElement(innerNavigatorModule, { navigation = p9.navigation }) else reactModule.createElement(var16)) else nil
end

local function MomentsTabEntrySessionized(p11) --[[ line: 417 ]]
	-- upvalues: reactModule (ref), MomentsTabEntry (ref)
	return reactModule.createElement(MomentsTabEntry, {
		useRootOwnedNavigation = true,
		navigation = p11.navigation,
		openProfile = p11.openProfile,
		openOwnMoments = p11.openOwnMoments,
		onTabFocused = p11.onTabFocused
	})
end

local momentsTabEntryScreen = reactModule.Component:extend("MomentsTabEntryScreen")

function momentsTabEntryScreen.render(p12) --[[ line: 432 ]]
	-- upvalues: reactModule (ref), MomentsTabEntrySessionized (ref)
	return reactModule.createElement(MomentsTabEntrySessionized, p12.props)
end

momentsTabEntryScreen.router = innerNavigatorModule.router

return if fFlagMomentsWatchSessionalization then momentsTabEntryScreen else MomentsTabEntry