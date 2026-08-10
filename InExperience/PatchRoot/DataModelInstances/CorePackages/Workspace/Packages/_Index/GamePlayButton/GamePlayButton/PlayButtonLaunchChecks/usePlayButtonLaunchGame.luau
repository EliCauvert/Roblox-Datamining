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
local var7 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local fFlagLuaAppEnablePlayButtonThrottle = require(parent.SharedFlags).FFlagLuaAppEnablePlayButtonThrottle
local fIntLuaAppPlayButtonThrottleTimeSeconds = require(parent.SharedFlags).FIntLuaAppPlayButtonThrottleTimeSeconds
local fFlagLuaAppFixLaunchGameSourceParam = require(parent.SharedFlags).FFlagLuaAppFixLaunchGameSourceParam
local fFlagLuaAppEnableStratusStreamingCheck = require(parent.SharedFlags).FFlagLuaAppEnableStratusStreamingCheck
local fFlagLuaAppDemoModePlayButtonTelemetry = require(parent.SharedFlags).FFlagLuaAppDemoModePlayButtonTelemetry
local videoService = game:GetService("VideoService")

return function(p0, p1, p2, p3, p4, p5, p6) --[[ line: 45 ]]
	-- upvalues: useRoactService (ref), roactAnalytics (ref), appEventIngestService (ref), appGame (ref), useSelector (ref), useDispatch (ref), fFlagLuaAppEnablePlayButtonThrottle (ref), reactModule (ref), fIntLuaAppPlayButtonThrottleTimeSeconds (ref), getFFlagLuaAppEnableVirtualEventPlaceId (ref), fFlagLuaAppDemoModePlayButtonTelemetry (ref), gamePlayIntent (ref), joinGamePlayButton (ref), fFlagLuaAppEnableStratusStreamingTestOnly (ref), fFlagLuaAppEnableStratusStreamingCheck (ref), videoService (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var7 (ref), navigateToRoute (ref), isVRAppBuild (ref), splashScreenManager (ref), fFlagDeferInExperienceRbxmDownload (ref), dashModule (ref), fFlagLuaAppFixLaunchGameSourceParam (ref), launchGame (ref), reasonForNotVoteable (ref), clearUserGameVotes (ref)
	local var9 = useRoactService(roactAnalytics)
	local var10 = useRoactService(appEventIngestService)
	local var11 = useRoactService(appGame)
	local var12 = useSelector(function(p7) --[[ line: 58 ]]
		-- upvalues: p0 (ref)
		return p7.UserGameVotes[p0]
	end)
	local var13 = useDispatch()
	local var14 = if fFlagLuaAppEnablePlayButtonThrottle then reactModule.useRef(0) else nil
	
	return reactModule.useCallback(function(p8, p9) --[[ line: 66 ]]
		-- upvalues: fFlagLuaAppEnablePlayButtonThrottle (copy), var14 (ref), fIntLuaAppPlayButtonThrottleTimeSeconds (copy), getFFlagLuaAppEnableVirtualEventPlaceId (copy), p1 (ref), p2 (ref), fFlagLuaAppDemoModePlayButtonTelemetry (copy), gamePlayIntent (copy), var10 (ref), p3 (ref), p0 (ref), p6 (write), joinGamePlayButton (copy), var9 (ref), p4 (ref), fFlagLuaAppEnableStratusStreamingTestOnly (copy), fFlagLuaAppEnableStratusStreamingCheck (copy), videoService (copy), appPage (copy), p5 (ref), fFlagSignalsNavP3Dispatch (copy), var7 (copy), var13 (ref), navigateToRoute (copy), isVRAppBuild (copy), splashScreenManager (copy), fFlagDeferInExperienceRbxmDownload (copy), dashModule (copy), fFlagLuaAppFixLaunchGameSourceParam (copy), launchGame (copy), var11 (ref), var12 (ref), reasonForNotVoteable (copy), clearUserGameVotes (copy)
		if fFlagLuaAppEnablePlayButtonThrottle then
			local currentTime = tick()
			
			if currentTime - var14.current < fIntLuaAppPlayButtonThrottleTimeSeconds then return end
			var14.current = currentTime
		end
		if getFFlagLuaAppEnableVirtualEventPlaceId() and (not p1 or not p2) or not getFFlagLuaAppEnableVirtualEventPlaceId() and not p2 then return end
		if p8 == nil then
			gamePlayIntent(var10, "PlayButton", {
				placeId = if getFFlagLuaAppEnableVirtualEventPlaceId() then p1 else p2,
				rootPlaceId = tonumber(p2),
				referralSource = p3,
				universeId = p0,
				launchData = if p6 and p6.launchData then p6.launchData else nil,
				tileType = if p6 then p6.tileType else nil,
				nativeAdData = if p6 then p6.nativeAdData else nil,
				actionType = if fFlagLuaAppDemoModePlayButtonTelemetry then p9 else nil
			})
		elseif fFlagLuaAppDemoModePlayButtonTelemetry then
			p8(p9)
		else
			p8()
		end
		joinGamePlayButton(var9.InfluxDb, "gamePlayIntent", {
			isUniversalApp = true,
			referralSource = p3,
			placeId = if getFFlagLuaAppEnableVirtualEventPlaceId() then p1 else p2,
			ctx = p4,
			actionType = if fFlagLuaAppDemoModePlayButtonTelemetry then p9 else nil
		})
		
		if fFlagLuaAppEnableStratusStreamingTestOnly then
			if fFlagLuaAppEnableStratusStreamingCheck then
				if videoService:GameStreamingEnabled() then
					local list = {
						{
							name = appPage.VideoServer,
							placeId = if getFFlagLuaAppEnableVirtualEventPlaceId() then p1 else p2,
							launchSource = p5,
							extraParams = p6
						}
					}
					
					if fFlagSignalsNavP3Dispatch then
						var7.to(var7.fromLegacyPage(list[#list]))
						
						return
					end
					var13(navigateToRoute(list))
					
					return
				elseif isVRAppBuild() then
					splashScreenManager.initialize(36)
					wait(0.3)
				end
				if fFlagDeferInExperienceRbxmDownload then
					p6 = dashModule.join(p6 or {}, { universeId = p0 })
				end
				if fFlagLuaAppFixLaunchGameSourceParam then
					launchGame(if getFFlagLuaAppEnableVirtualEventPlaceId() then p1 else p2, p3, p6, var11, p5)
				else
					launchGame(if getFFlagLuaAppEnableVirtualEventPlaceId() then p1 else p2, p5, p6, var11)
				end
				if var12 and var12.reasonForNotVoteable == reasonForNotVoteable.PlayGame then
					var13(clearUserGameVotes(p0))
				end
				return
			else
				local list = {
					{
						name = appPage.VideoServer,
						placeId = if getFFlagLuaAppEnableVirtualEventPlaceId() then p1 else p2,
						launchSource = p5,
						extraParams = p6
					}
				}
				
				if fFlagSignalsNavP3Dispatch then
					var7.to(var7.fromLegacyPage(list[#list]))
					
					return
				end
				var13(navigateToRoute(list))
			end
		end
	end, {
		var10, var9, var11, var12, p0,
		if getFFlagLuaAppEnableVirtualEventPlaceId() then p1 else nil, p2, p3, p4, p6,
		if fFlagLuaAppDemoModePlayButtonTelemetry then var13 else nil,
		if fFlagLuaAppDemoModePlayButtonTelemetry then p5 else nil
	})
end