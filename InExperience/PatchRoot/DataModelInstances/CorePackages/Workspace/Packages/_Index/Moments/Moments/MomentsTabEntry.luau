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
local var2 = getFFlagMomentsFixShareDeeplinkModule()

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
		local var3 = if type(postId) == "string" and postId ~= "" then postId elseif type(postId) == "number" then tostring(postId) else nil
		
		if var3 ~= nil then
			return var3
		end
		local var4 = getMomentIdFromLaunchData(extraProps.launchData)
		
		if var4 ~= nil then
			return var4
		end
	end
	postId = p1.postId
	local var5 = if type(postId) == "string" and postId ~= "" then postId elseif type(postId) == "number" then tostring(postId) else nil
	
	return if var5 == nil then getMomentIdFromLaunchData(p1.launchData) else var5
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
	local var3 = getDeepLinkedMomentIdFromParams(t)
	
	if var3 == nil then
		return nil
	end
	local var4 = getDeepLinkedMomentTargetIdTypeFromParams(t)
	
	return {
		momentId = var3,
		targetIdType = var4,
		key = if fFlagMomentsPassFeedItemIdToBackendApis then `{p2}:params:{tostring(t.extraProps)}:{tostring(t.postId)}:{tostring(t.launchData)}:{var3}:{tostring(var4)}` else `{p2}:params:{tostring(t.extraProps)}:{tostring(t.postId)}:{tostring(t.launchData)}:{var3}`
	}
end

local function getDeepLinkRequestFromNavigationState(p1, p2)
	-- upvalues: getActiveRoutes (ref), getDeepLinkedMomentIdFromParams (ref), getDeepLinkedMomentTargetIdTypeFromParams (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref)
	local var3 = getActiveRoutes(p1)
	
	for i = #var3, 1, -1 do
		local var4 = var3[i]
		local var5 = getDeepLinkedMomentIdFromParams(var4.params)
		
		if var5 == nil then
			continue
		end
		local var6 = getDeepLinkedMomentTargetIdTypeFromParams(var4.params)
		
		return {
			momentId = var5,
			targetIdType = var6,
			key = if fFlagMomentsPassFeedItemIdToBackendApis then `{p2}:state:{tostring(var4.key)}:{tostring(var4.params)}:{var5}:{tostring(var6)}` else `{p2}:state:{tostring(var4.key)}:{tostring(var4.params)}:{var5}`
		}
	end
	return nil
end

local function getDeepLinkRequest(p3)
	-- upvalues: getDeepLinkRequestFromNavigationParams (ref), getDeepLinkRequestFromNavigationState (ref)
	local var7 = p3
	local var8 = 0
	while var7 ~= nil do
		local var9 = tostring(var8)
		local var10 = getDeepLinkRequestFromNavigationParams(var7, var9) or getDeepLinkRequestFromNavigationState(var7.state, var9)
		
		if var10 == nil then
			if not var7._dangerouslyGetParent then break end
			var7 = var7._dangerouslyGetParent()
			var8 += 1
		end
		return var10
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
	-- upvalues: reactModule (ref), createMomentsStoreModule (ref), useResetTeleportingOnGameLeaveModule (ref), var2 (ref), getFFlagMomentsShareDeeplinkReliableOpenModule (ref), getFFlagMomentsFixDeeplinkRefocusModule (ref), getDeepLinkRequest (ref), getDeepLinkStoreModule (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), robloxAppEventsModule (ref), appPage (ref), shareLinkTargetIdType (ref), consumeEntrySourceModule (ref), logMomentsLayerExposureModule (ref), fStringMomentsExperienceJoinActionTextIxpLayerModule (ref), fFlagMomentsEmojiSetsApiModule (ref), momentsGetMomentsReactionsStoreModule (ref), fireAnalyticsEvent (ref), eventNames (ref), fFlagMomentsRealtimeSessionTelemetry (ref), analytics (ref), fFlagMomentsSessionHeartbeat (ref), t (ref), sessionManager (ref), funnelEventNames (ref), fireFunnelAnalyticsEvent (ref), fFlagMomentsSurfaceLoadTTI (ref), momentsSurfaceLoadManager (ref), fFlagMomentsRealtimeObservability (ref), getExperienceDetailsSheetStoreModule (ref), getImmersiveChromeStoreModule (ref), roactNavigationModule (ref), useMomentsTabIsVisibleModule (ref), getFFlagMomentsFixPeekReturnChromeModule (ref), useMomentsGating (ref), canRenderNativeMoments (ref), innerNavigatorModule (ref), var1 (ref), momentsHostShellModule (ref)
	local var11 = reactModule.useRef(p4)
	var11.current = p4
	local var12 = reactModule.useRef(false)
	local var13 = reactModule.useRef(false)
	local var14 = reactModule.useRef(nil)
	
	if var14.current == nil then
		var14.current = createMomentsStoreModule()
	end
	useResetTeleportingOnGameLeaveModule()
	local var15 = var2 or getFFlagMomentsShareDeeplinkReliableOpenModule()
	local var16 = getFFlagMomentsFixDeeplinkRefocusModule()
	local var17 = nil
	local var18 = nil
	
	if var15 then
		local var19 = getDeepLinkRequest(p4.navigation)
		local var20 = if var19 ~= nil then nil else var19.momentId
		local var21 = if var19 ~= nil then nil else var19.key
		var17 = reactModule.useRef(nil)
		var18 = reactModule.useRef({})
		
		if var20 ~= nil and var17.current ~= var21 then
			local var22 = getDeepLinkStoreModule()
			local var23 = if var19 ~= nil then nil else var19.targetIdType
			
			if fFlagMomentsPassFeedItemIdToBackendApis then
				var22.setDeepLinkedMoment(var20, var23)
			else
				var22.setDeepLinkedMomentId(var20)
			end
			var17.current = var21
		end
		reactModule.useEffect(function()
			-- upvalues: var20 (ref), var13 (ref), robloxAppEventsModule (copy), appPage (copy)
			if var20 ~= nil and var13.current then
				robloxAppEventsModule.ReloadPage:fire(appPage.Moments)
			end
			var13.current = true
		end, { var21, var20, p4.navigation })
	else
		reactModule.useEffect(function()
			-- upvalues: p4 (ref), getDeepLinkStoreModule (copy), fFlagMomentsPassFeedItemIdToBackendApis (copy), shareLinkTargetIdType (copy), var13 (ref), robloxAppEventsModule (copy), appPage (copy)
			local navigation = p4.navigation
			
			if not navigation or not navigation.getParam then return end
			local extraProps = navigation.getParam("extraProps")
			
			if type(extraProps) == "table" and type(extraProps.postId) == "string" then
				local var24 = getDeepLinkStoreModule()
				local postId = extraProps.postId
				local var25 = if fFlagMomentsPassFeedItemIdToBackendApis then if extraProps.targetIdType == shareLinkTargetIdType.FeedItemId then shareLinkTargetIdType.FeedItemId else nil else nil
				
				if fFlagMomentsPassFeedItemIdToBackendApis then
					var24.setDeepLinkedMoment(postId, var25)
				else
					var24.setDeepLinkedMomentId(postId)
				end
				if var13.current then
					robloxAppEventsModule.ReloadPage:fire(appPage.Moments)
				end
			end
			var13.current = true
		end, { p4.navigation })
	end
	local var24 = reactModule.useCallback(function()
		-- upvalues: var12 (ref), var14 (ref), var16 (ref), var18 (write), consumeEntrySourceModule (copy), var11 (ref), logMomentsLayerExposureModule (copy), fStringMomentsExperienceJoinActionTextIxpLayerModule (copy), fFlagMomentsEmojiSetsApiModule (copy), momentsGetMomentsReactionsStoreModule (copy), fireAnalyticsEvent (copy), eventNames (copy), fFlagMomentsRealtimeSessionTelemetry (copy), analytics (copy), fFlagMomentsSessionHeartbeat (copy), t (copy), sessionManager (copy), funnelEventNames (copy), fireFunnelAnalyticsEvent (copy)
		if var12.current then return end
		local navigation, var25
		var12.current = true
		local current = var14.current
		
		if var16 and var18 ~= nil then
			var25 = consumeEntrySourceModule(var11.current.navigation, var18.current)
		else
			navigation = var11.current.navigation
			
			if navigation and navigation.getParam then
				local extraProps = navigation.getParam("extraProps")
				var25 = if type(extraProps) == "table" and type(extraProps.source) == "string" then extraProps.source else navigation.getParam("source", "watch_tab")
			else
				var25 = "watch_tab"
			end
		end
		current.resetSession()
		current.setSessionSource(var25)
		logMomentsLayerExposureModule(fStringMomentsExperienceJoinActionTextIxpLayerModule)
		
		if fFlagMomentsEmojiSetsApiModule then
			navigation = momentsGetMomentsReactionsStoreModule(false).getAndFetchEmojiSets
			assert(navigation ~= nil, "expected getAndFetchEmojiSets when FFlagMomentsEmojiSetsApi is on")
			navigation()
		end
		fireAnalyticsEvent(eventNames.TapMomentsTab, {
			moments_session_id = current.getMomentsSessionId(false),
			source = var25
		})
		
		if fFlagMomentsRealtimeSessionTelemetry then
			analytics.reportMomentsSessionStarted(var25)
		end
		if fFlagMomentsSessionHeartbeat then
			navigation = analytics.createMomentsSessionHeartbeat()
			t[current.getMomentsSessionId(false)] = navigation
			navigation.start(var25)
		end
		fireFunnelAnalyticsEvent(funnelEventNames.FunnelTypes.AppNavigation, funnelEventNames.AppNavigationSteps.AppLaunched, sessionManager.startSession(funnelEventNames.FunnelTypes.AppNavigation))
	end, { var16 })
	local var25 = reactModule.useCallback(function()
		-- upvalues: var12 (ref), fFlagMomentsSurfaceLoadTTI (copy), momentsSurfaceLoadManager (copy), fFlagMomentsRealtimeObservability (copy), getExperienceDetailsSheetStoreModule (copy), var14 (ref), fireAnalyticsEvent (copy), eventNames (copy), fFlagMomentsSessionHeartbeat (copy), t (copy), fFlagMomentsRealtimeSessionTelemetry (copy), analytics (copy), sessionManager (copy), funnelEventNames (copy)
		if not var12.current then return end
		var12.current = false
		
		if fFlagMomentsSurfaceLoadTTI then
			momentsSurfaceLoadManager.abort(if fFlagMomentsRealtimeObservability then "blur" else nil)
		end
		getExperienceDetailsSheetStoreModule(false).close()
		local current = var14.current
		fireAnalyticsEvent(eventNames.MomentsSessionEnded, {
			moments_session_id = current.getMomentsSessionId(false),
			source = current.getSessionSource(false),
			duration_seconds = tostring(math.floor(os.clock() - current.getSessionStartTime(false)))
		})
		
		if fFlagMomentsSessionHeartbeat then
			local momentsSessionId = current.getMomentsSessionId(false)
			local var26 = t[momentsSessionId]
			
			if var26 then
				var26.stop()
				t[momentsSessionId] = nil
			end
		end
		if fFlagMomentsRealtimeSessionTelemetry then
			analytics.reportMomentsSessionEnded(current.getSessionSource(false))
		end
		sessionManager.endSession(funnelEventNames.FunnelTypes.AppNavigation)
	end, {})
	local var26 = reactModule.useCallback(function()
		-- upvalues: getImmersiveChromeStoreModule (copy), var11 (ref)
		getImmersiveChromeStoreModule(false).setOverlayCovering(false)
		local onTabFocused = var11.current.onTabFocused
		
		if onTabFocused then
			onTabFocused()
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: p4 (ref), var24 (ref), var26 (ref), var25 (ref), roactNavigationModule (copy), var15 (ref), getDeepLinkRequest (copy), var16 (ref), var17 (write), getDeepLinkStoreModule (copy), fFlagMomentsPassFeedItemIdToBackendApis (copy), robloxAppEventsModule (copy), appPage (copy), shareLinkTargetIdType (copy)
		local navigation = p4.navigation
		
		if navigation and navigation.addListener then
			var24()
			var26()
			local var27 = navigation.addListener(roactNavigationModule.Events.DidFocus, function()
				-- upvalues: var15 (copy), getDeepLinkRequest (copy), navigation (ref), var16 (copy), var17 (copy), getDeepLinkStoreModule (copy), fFlagMomentsPassFeedItemIdToBackendApis (copy), robloxAppEventsModule (copy), appPage (copy), shareLinkTargetIdType (copy), var24 (copy), var26 (copy)
				if var15 then
					local var28 = getDeepLinkRequest(navigation)
					
					if var28 ~= nil and not (var16 and (var28 ~= nil and var17.current == var28.key)) then
						local var29 = getDeepLinkStoreModule()
						local momentId = var28.momentId
						local targetIdType = var28.targetIdType
						
						if fFlagMomentsPassFeedItemIdToBackendApis then
							var29.setDeepLinkedMoment(momentId, targetIdType)
						else
							var29.setDeepLinkedMomentId(momentId)
						end
						var17.current = var28.key
						robloxAppEventsModule.ReloadPage:fire(appPage.Moments)
					end
				else
					local extraProps = navigation.getParam("extraProps")
					
					if type(extraProps) == "table" and type(extraProps.postId) == "string" then
						local var30 = getDeepLinkStoreModule()
						local postId = extraProps.postId
						local var31 = if fFlagMomentsPassFeedItemIdToBackendApis then if extraProps.targetIdType == shareLinkTargetIdType.FeedItemId then shareLinkTargetIdType.FeedItemId else nil else nil
						
						if fFlagMomentsPassFeedItemIdToBackendApis then
							var30.setDeepLinkedMoment(postId, var31)
						else
							var30.setDeepLinkedMomentId(postId)
						end
						robloxAppEventsModule.ReloadPage:fire(appPage.Moments)
					end
				end
				var24()
				var26()
			end)
			local var28 = navigation.addListener(roactNavigationModule.Events.WillBlur, function()
				-- upvalues: var25 (copy)
				var25()
			end)
			
			return function()
				-- upvalues: var25 (copy), var27 (ref), var28 (ref)
				var25()
				var27.remove()
				var28.remove()
			end
		end
		var24()
		var26()
		
		return function()
			-- upvalues: var25 (copy)
			var25()
		end
	end, { var24, var25, var26 })
	local var27 = useMomentsTabIsVisibleModule()
	reactModule.useEffect(function()
		-- upvalues: getFFlagMomentsFixPeekReturnChromeModule (copy), var27 (ref), var26 (ref)
		if getFFlagMomentsFixPeekReturnChromeModule() and var27 then
			var26()
		end
	end, { var27, var26 })
	local var28 = reactModule.useMemo(function()
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
		sessionStore = var14.current,
		openProfile = var28.openProfile,
		openOwnMoments = var28.openOwnMoments,
		openMomentsFeedReport = var28.openMomentsFeedReport
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