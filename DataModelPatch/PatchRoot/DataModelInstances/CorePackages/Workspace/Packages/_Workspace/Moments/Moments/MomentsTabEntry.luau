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
local GetFFlagMomentsFixPeekReturnChromeModule = require(Moments.Flags.GetFFlagMomentsFixPeekReturnChrome)
local UseMomentsTabIsVisibleModule = require(Moments.Hooks.useMomentsTabIsVisible)
local InnerNavigatorModule = require(Moments.Navigation.InnerNavigator)
local MomentsHostShellModule = require(Moments.Components.MomentsHostShell)
local UseResetTeleportingOnGameLeaveModule = require(Moments.Hooks.useResetTeleportingOnGameLeave)
local GetExperienceDetailsSheetStoreModule = require(Moments.ExperienceDetailsSheet.Sheet.getExperienceDetailsSheetStore)
local Analytics = MomentsCommonModule.Analytics
local EventNames = Analytics.EventNames
local FunnelEventNames = Analytics.FunnelEventNames
local SessionManager = Analytics.SessionManager
local FireAnalyticsEventFunction = Analytics.fireAnalyticsEvent
local FireFunnelAnalyticsEventFunction = Analytics.fireFunnelAnalyticsEvent
local MomentsSurfaceLoadManager = MomentsCommonModule.Performance.MomentsSurfaceLoadManager
local UseMomentsGatingFunction = MomentsCommonModule.Hooks.useMomentsGating
local FFlagMomentsWatchSessionalization = SharedFlagsModule.FFlagMomentsWatchSessionalization
local FFlagMomentsSurfaceLoadTTI = SharedFlagsModule.FFlagMomentsSurfaceLoadTTI
local AppContainer = RoactNavigationModule.createAppContainer(InnerNavigatorModule)
local GetActiveRoutesFunction = require(Parent.Navigation).getActiveRoutes
local v1 = require(Moments.Flags.GetFFlagMomentsFixShareDeeplink)()

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

local function getDeepLinkRequestFromNavigationParams(DangerouslyGetParentResult, p1)
	-- upvalues: getDeepLinkedMomentIdFromParams (copy)
	if DangerouslyGetParentResult and DangerouslyGetParentResult.getParam then
		local config = {
			extraProps = DangerouslyGetParentResult.getParam("extraProps"),
			postId = DangerouslyGetParentResult.getParam("postId"),
			launchData = DangerouslyGetParentResult.getParam("launchData")
		}
		local DeepLinkedMomentIdFromParams = getDeepLinkedMomentIdFromParams(config)
		
		return if DeepLinkedMomentIdFromParams == nil then nil else {
			momentId = DeepLinkedMomentIdFromParams,
			key = `{p1}:params:{tostring(config.extraProps)}:{tostring(config.postId)}:{tostring(config.launchData)}:{DeepLinkedMomentIdFromParams}`
		}
	else
		return nil
	end
end

local function getDeepLinkRequestFromNavigationState(State, p1)
	-- upvalues: GetActiveRoutesFunction (copy), getDeepLinkedMomentIdFromParams (copy)
	local ActiveRoutes = GetActiveRoutesFunction(State)
	local ActiveRoute = nil
	local DeepLinkedMomentIdFromParams = nil
	
	for i = #ActiveRoutes, 1, -1 do
		ActiveRoute = ActiveRoutes[i]
		DeepLinkedMomentIdFromParams = getDeepLinkedMomentIdFromParams(ActiveRoute.params)
		
		if DeepLinkedMomentIdFromParams ~= nil then
			return {
				momentId = DeepLinkedMomentIdFromParams,
				key = `{p1}:state:{tostring(ActiveRoute.key)}:{tostring(ActiveRoute.params)}:{DeepLinkedMomentIdFromParams}`
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

local function MomentsTabEntry(Current)
	-- upvalues: ReactModule (copy), CreateMomentsStoreModule (copy), UseResetTeleportingOnGameLeaveModule (copy), v1 (copy), getDeepLinkRequest (copy), GetDeepLinkStoreModule (copy), RobloxAppEventsModule (copy), AppPage (copy), FireAnalyticsEventFunction (copy), EventNames (copy), SessionManager (copy), FunnelEventNames (copy), FireFunnelAnalyticsEventFunction (copy), FFlagMomentsSurfaceLoadTTI (copy), MomentsSurfaceLoadManager (copy), GetExperienceDetailsSheetStoreModule (copy), GetImmersiveChromeStoreModule (copy), RoactNavigationModule (copy), UseMomentsTabIsVisibleModule (copy), GetFFlagMomentsFixPeekReturnChromeModule (copy), UseMomentsGatingFunction (copy), InnerNavigatorModule (copy), AppContainer (copy), MomentsHostShellModule (copy)
	local UseRefResult = ReactModule.useRef(Current)
	UseRefResult.current = Current
	local UseRefResult1 = ReactModule.useRef(false)
	local UseRefResult2 = ReactModule.useRef(false)
	local UseRefResult3 = ReactModule.useRef(nil)
	
	if UseRefResult3.current == nil then
		UseRefResult3.current = CreateMomentsStoreModule()
	end
	UseResetTeleportingOnGameLeaveModule()
	local UseRefResult4 = nil
	
	if v1 then
		local DeepLinkRequest = getDeepLinkRequest(Current.navigation)
		local MomentId = if DeepLinkRequest == nil then nil else DeepLinkRequest.momentId
		local Key = if DeepLinkRequest == nil then nil else DeepLinkRequest.key
		UseRefResult4 = ReactModule.useRef(nil)
		
		if MomentId ~= nil and UseRefResult4.current ~= Key then
			GetDeepLinkStoreModule().setDeepLinkedMomentId(MomentId)
			UseRefResult4.current = Key
		end
		ReactModule.useEffect(function()
			-- upvalues: MomentId (copy), UseRefResult2 (copy), RobloxAppEventsModule (upval), AppPage (upval)
			if MomentId ~= nil and UseRefResult2.current then
				RobloxAppEventsModule.ReloadPage:fire(AppPage.Moments)
			end
			UseRefResult2.current = true
		end, { Key, MomentId, Current.navigation })
	else
		ReactModule.useEffect(function()
			-- upvalues: Current (copy), GetDeepLinkStoreModule (upval), UseRefResult2 (copy), RobloxAppEventsModule (upval), AppPage (upval)
			local Navigation = Current.navigation
			
			if not Navigation or not Navigation.getParam then return end
			local ExtraPropsParam = Navigation.getParam("extraProps")
			
			if type(ExtraPropsParam) == "table" and type(ExtraPropsParam.postId) == "string" then
				GetDeepLinkStoreModule().setDeepLinkedMomentId(ExtraPropsParam.postId)
				
				if UseRefResult2.current then
					RobloxAppEventsModule.ReloadPage:fire(AppPage.Moments)
				end
			end
			UseRefResult2.current = true
		end, { Current.navigation })
	end
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult1 (copy), UseRefResult3 (copy), UseRefResult (copy), FireAnalyticsEventFunction (upval), EventNames (upval), SessionManager (upval), FunnelEventNames (upval), FireFunnelAnalyticsEventFunction (upval)
		if UseRefResult1.current then return end
		UseRefResult1.current = true
		local Current = UseRefResult3.current
		local Navigation = UseRefResult.current.navigation
		local Source = nil
		
		if Navigation and Navigation.getParam then
			local ExtraPropsParam = Navigation.getParam("extraProps")
			Source = if type(ExtraPropsParam) == "table" and type(ExtraPropsParam.source) == "string" then ExtraPropsParam.source else Navigation.getParam("source", "watch_tab")
		else
			Source = "watch_tab"
		end
		Current.resetSession()
		Current.setSessionSource(Source)
		FireAnalyticsEventFunction(EventNames.TapMomentsTab, {
			moments_session_id = Current.getMomentsSessionId(false),
			source = Source
		})
		FireFunnelAnalyticsEventFunction(FunnelEventNames.FunnelTypes.AppNavigation, FunnelEventNames.AppNavigationSteps.AppLaunched, (SessionManager.startSession(FunnelEventNames.FunnelTypes.AppNavigation)))
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult1 (copy), FFlagMomentsSurfaceLoadTTI (upval), MomentsSurfaceLoadManager (upval), GetExperienceDetailsSheetStoreModule (upval), UseRefResult3 (copy), FireAnalyticsEventFunction (upval), EventNames (upval), SessionManager (upval), FunnelEventNames (upval)
		if not UseRefResult1.current then return end
		UseRefResult1.current = false
		
		if FFlagMomentsSurfaceLoadTTI then
			MomentsSurfaceLoadManager.abort()
		end
		GetExperienceDetailsSheetStoreModule(false).close()
		local Current = UseRefResult3.current
		FireAnalyticsEventFunction(EventNames.MomentsSessionEnded, {
			moments_session_id = Current.getMomentsSessionId(false),
			source = Current.getSessionSource(false),
			duration_seconds = tostring((math.floor(os.clock() - Current.getSessionStartTime(false))))
		})
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
		-- upvalues: Current (copy), UseResult (copy), UseResult2 (copy), UseResult1 (copy), RoactNavigationModule (upval), v1 (upval), getDeepLinkRequest (upval), GetDeepLinkStoreModule (upval), UseRefResult4 (ref), RobloxAppEventsModule (upval), AppPage (upval)
		local Navigation = Current.navigation
		
		if Navigation and Navigation.addListener then
			UseResult()
			UseResult2()
			local AddListenerResult = Navigation.addListener(RoactNavigationModule.Events.DidFocus, function()
				-- upvalues: v1 (upval), getDeepLinkRequest (upval), Navigation (copy), GetDeepLinkStoreModule (upval), UseRefResult4 (upval), RobloxAppEventsModule (upval), AppPage (upval), UseResult (upval), UseResult2 (upval)
				if v1 then
					local DeepLinkRequest = getDeepLinkRequest(Navigation)
					
					if DeepLinkRequest ~= nil then
						GetDeepLinkStoreModule().setDeepLinkedMomentId(DeepLinkRequest.momentId)
						UseRefResult4.current = DeepLinkRequest.key
						RobloxAppEventsModule.ReloadPage:fire(AppPage.Moments)
					end
				else
					local ExtraPropsParam = Navigation.getParam("extraProps")
					
					if type(ExtraPropsParam) == "table" and type(ExtraPropsParam.postId) == "string" then
						GetDeepLinkStoreModule().setDeepLinkedMomentId(ExtraPropsParam.postId)
						RobloxAppEventsModule.ReloadPage:fire(AppPage.Moments)
					end
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
		-- upvalues: GetFFlagMomentsFixPeekReturnChromeModule (upval), UseMomentsTabIsVisibleModuleResult (copy), UseResult2 (copy)
		if GetFFlagMomentsFixPeekReturnChromeModule() and UseMomentsTabIsVisibleModuleResult then
			UseResult2()
		end
	end, { UseMomentsTabIsVisibleModuleResult, UseResult2 })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Current (copy), GetImmersiveChromeStoreModule (upval)
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
			end else nil
		}
	end, { Current.openProfile, Current.openOwnMoments })
	local UseMomentsGatingResult = UseMomentsGatingFunction()
	local IsTabEnabled = UseMomentsGatingResult.isTabEnabled or UseMomentsGatingResult.isFlyoutEntryEnabled and UseMomentsGatingResult.platformIntegrationEnabled
	
	return if IsTabEnabled then ReactModule.createElement(MomentsHostShellModule, {
		sessionStore = UseRefResult3.current,
		openProfile = UseMemoResult.openProfile,
		openOwnMoments = UseMemoResult.openOwnMoments
	}, if Current.useRootOwnedNavigation then ReactModule.createElement(InnerNavigatorModule, { navigation = Current.navigation }) else ReactModule.createElement(AppContainer)) else nil
end

local function MomentsTabEntrySessionized(p2)
	-- upvalues: ReactModule (copy), MomentsTabEntry (copy)
	return ReactModule.createElement(MomentsTabEntry, {
		useRootOwnedNavigation = true,
		navigation = p2.navigation,
		openProfile = p2.openProfile,
		openOwnMoments = p2.openOwnMoments,
		onTabFocused = p2.onTabFocused
	})
end

local MomentsTabEntryScreen = ReactModule.Component:extend("MomentsTabEntryScreen")

function MomentsTabEntryScreen.render(p2)
	-- upvalues: ReactModule (copy), MomentsTabEntrySessionized (copy)
	return ReactModule.createElement(MomentsTabEntrySessionized, p2.props)
end

MomentsTabEntryScreen.router = InnerNavigatorModule.router

return if FFlagMomentsWatchSessionalization then MomentsTabEntryScreen else MomentsTabEntry