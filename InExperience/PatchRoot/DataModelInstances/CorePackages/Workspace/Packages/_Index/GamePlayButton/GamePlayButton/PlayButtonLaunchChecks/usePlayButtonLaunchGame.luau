local gamePlayButton = script:FindFirstAncestor("GamePlayButton")
local _ = require(gamePlayButton.PlayButtonTypes)
local parent = gamePlayButton.Parent
local reactModule = require(parent.React)
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local roactServiceTagsModule = require(parent.RoactServiceTags)
local roactAnalytics = roactServiceTagsModule.RoactAnalytics
local appEventIngestService = roactServiceTagsModule.AppEventIngestService
local appGame = roactServiceTagsModule.AppGame
local roactUtilsModule = require(parent.RoactUtils)
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local discoveryAnalyticsModule = require(parent.DiscoveryAnalytics)
local gamePlayIntent = discoveryAnalyticsModule.Events.gamePlayIntent
local joinGamePlayButton = discoveryAnalyticsModule.Points.joinGamePlayButton
local gameVotesRoduxModule = require(parent.GameVotesRodux)
local reasonForNotVoteable = gameVotesRoduxModule.Enums.ReasonForNotVoteable
local clearUserGameVotes = gameVotesRoduxModule.UserGameVotes.ClearUserGameVotes
local isVRAppBuild = require(parent.AppCommonLib).IsVRAppBuild
local splashScreenManager = require(parent.SplashScreenManager).SplashScreenManager
local launchGame = require(parent.GameLaunch).LaunchGame
local fFlagDeferInExperienceRbxmDownload = require(parent.SharedFlags).FFlagDeferInExperienceRbxmDownload
local dashModule = require(parent.Dash)
local getFFlagLuaAppEnableVirtualEventPlaceId = require(parent.SharedFlags).GetFFlagLuaAppEnableVirtualEventPlaceId
local fFlagLuaAppEnableStratusStreamingTestOnly = require(parent.SharedFlags).FFlagLuaAppEnableStratusStreamingTestOnly
local navigateToRoute = require(parent.NavigationRodux).Thunks.NavigateToRoute
local appPage = require(parent.RobloxAppEnums).AppPage
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local fFlagLuaAppEnablePlayButtonThrottle = require(parent.SharedFlags).FFlagLuaAppEnablePlayButtonThrottle
local fIntLuaAppPlayButtonThrottleTimeSeconds = require(parent.SharedFlags).FIntLuaAppPlayButtonThrottleTimeSeconds
local fFlagLuaAppFixLaunchGameSourceParam = require(parent.SharedFlags).FFlagLuaAppFixLaunchGameSourceParam
local fFlagLuaAppEnableStratusStreamingCheck = require(parent.SharedFlags).FFlagLuaAppEnableStratusStreamingCheck
local fFlagLuaAppDemoModePlayButtonTelemetry = require(parent.SharedFlags).FFlagLuaAppDemoModePlayButtonTelemetry
local videoService = game:GetService("VideoService")

return function(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: useRoactService (ref), roactAnalytics (ref), appEventIngestService (ref), appGame (ref), useSelector (ref), useDispatch (ref), fFlagLuaAppEnablePlayButtonThrottle (ref), reactModule (ref), fIntLuaAppPlayButtonThrottleTimeSeconds (ref), getFFlagLuaAppEnableVirtualEventPlaceId (ref), fFlagLuaAppDemoModePlayButtonTelemetry (ref), gamePlayIntent (ref), joinGamePlayButton (ref), fFlagLuaAppEnableStratusStreamingTestOnly (ref), fFlagLuaAppEnableStratusStreamingCheck (ref), videoService (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateToRoute (ref), isVRAppBuild (ref), splashScreenManager (ref), fFlagDeferInExperienceRbxmDownload (ref), dashModule (ref), fFlagLuaAppFixLaunchGameSourceParam (ref), launchGame (ref), reasonForNotVoteable (ref), clearUserGameVotes (ref)
	local var2 = useRoactService(roactAnalytics)
	local var3 = useRoactService(appEventIngestService)
	local var4 = useRoactService(appGame)
	local var5 = useSelector(function(p8)
		-- upvalues: p1 (ref)
		return p8.UserGameVotes[p1]
	end)
	local var6 = useDispatch()
	local var7 = if fFlagLuaAppEnablePlayButtonThrottle then reactModule.useRef(0) else nil
	
	return reactModule.useCallback(function(p8, p9)
		-- upvalues: fFlagLuaAppEnablePlayButtonThrottle (copy), var7 (ref), fIntLuaAppPlayButtonThrottleTimeSeconds (copy), getFFlagLuaAppEnableVirtualEventPlaceId (copy), p2 (ref), p3 (ref), fFlagLuaAppDemoModePlayButtonTelemetry (copy), gamePlayIntent (copy), var3 (ref), p4 (ref), p1 (ref), p7 (write), joinGamePlayButton (copy), var2 (ref), p5 (ref), fFlagLuaAppEnableStratusStreamingTestOnly (copy), fFlagLuaAppEnableStratusStreamingCheck (copy), videoService (copy), appPage (copy), p6 (ref), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var6 (ref), navigateToRoute (copy), isVRAppBuild (copy), splashScreenManager (copy), fFlagDeferInExperienceRbxmDownload (copy), dashModule (copy), fFlagLuaAppFixLaunchGameSourceParam (copy), launchGame (copy), var4 (ref), var5 (ref), reasonForNotVoteable (copy), clearUserGameVotes (copy)
		if fFlagLuaAppEnablePlayButtonThrottle then
			local currentTime = tick()
			
			if currentTime - var7.current < fIntLuaAppPlayButtonThrottleTimeSeconds then return end
			var7.current = currentTime
		end
		if getFFlagLuaAppEnableVirtualEventPlaceId() and (not p2 or not p3) or not getFFlagLuaAppEnableVirtualEventPlaceId() and not p3 then return end
		if p8 == nil then
			gamePlayIntent(var3, "PlayButton", {
				placeId = if getFFlagLuaAppEnableVirtualEventPlaceId() then p2 else p3,
				rootPlaceId = tonumber(p3),
				referralSource = p4,
				universeId = p1,
				launchData = if p7 and p7.launchData then p7.launchData else nil,
				tileType = if p7 then p7.tileType else nil,
				nativeAdData = if p7 then p7.nativeAdData else nil,
				actionType = if fFlagLuaAppDemoModePlayButtonTelemetry then p9 else nil
			})
		elseif fFlagLuaAppDemoModePlayButtonTelemetry then
			p8(p9)
		else
			p8()
		end
		joinGamePlayButton(var2.InfluxDb, "gamePlayIntent", {
			isUniversalApp = true,
			referralSource = p4,
			placeId = if getFFlagLuaAppEnableVirtualEventPlaceId() then p2 else p3,
			ctx = p5,
			actionType = if fFlagLuaAppDemoModePlayButtonTelemetry then p9 else nil
		})
		
		if fFlagLuaAppEnableStratusStreamingTestOnly then
			if fFlagLuaAppEnableStratusStreamingCheck then
				if videoService:GameStreamingEnabled() then
					local list = {
						{
							name = appPage.VideoServer,
							placeId = if getFFlagLuaAppEnableVirtualEventPlaceId() then p2 else p3,
							launchSource = p6,
							extraParams = p7
						}
					}
					
					if fFlagSignalsNavP3Dispatch then
						var1.to(var1.fromLegacyPage(list[#list]))
						
						return
					end
					var6(navigateToRoute(list))
					
					return
				elseif isVRAppBuild() then
					splashScreenManager.initialize(36)
					wait(0.3)
				end
				if fFlagDeferInExperienceRbxmDownload then
					p7 = dashModule.join(p7 or {}, { universeId = p1 })
				end
				if fFlagLuaAppFixLaunchGameSourceParam then
					launchGame(if getFFlagLuaAppEnableVirtualEventPlaceId() then p2 else p3, p4, p7, var4, p6)
				else
					launchGame(if getFFlagLuaAppEnableVirtualEventPlaceId() then p2 else p3, p6, p7, var4)
				end
				if var5 and var5.reasonForNotVoteable == reasonForNotVoteable.PlayGame then
					var6(clearUserGameVotes(p1))
				end
				return
			else
				local list = {
					{
						name = appPage.VideoServer,
						placeId = if getFFlagLuaAppEnableVirtualEventPlaceId() then p2 else p3,
						launchSource = p6,
						extraParams = p7
					}
				}
				
				if fFlagSignalsNavP3Dispatch then
					var1.to(var1.fromLegacyPage(list[#list]))
					
					return
				end
				var6(navigateToRoute(list))
			end
		end
	end, {
		var3, var2, var4, var5, p1,
		if getFFlagLuaAppEnableVirtualEventPlaceId() then p2 else nil, p3, p4, p5, p7,
		if fFlagLuaAppDemoModePlayButtonTelemetry then var6 else nil,
		if fFlagLuaAppDemoModePlayButtonTelemetry then p6 else nil
	})
end