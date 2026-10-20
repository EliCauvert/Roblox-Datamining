local GamePlayButton = script:FindFirstAncestor("GamePlayButton")
local _ = require(GamePlayButton.PlayButtonTypes)
local Parent = GamePlayButton.Parent
local ReactModule = require(Parent.React)
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactServiceTagsModule = require(Parent.RoactServiceTags)
local RoactAnalytics = RoactServiceTagsModule.RoactAnalytics
local AppEventIngestService = RoactServiceTagsModule.AppEventIngestService
local AppGame = RoactServiceTagsModule.AppGame
local RoactUtilsModule = require(Parent.RoactUtils)
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local DiscoveryAnalyticsModule = require(Parent.DiscoveryAnalytics)
local GamePlayIntentFunction = DiscoveryAnalyticsModule.Events.gamePlayIntent
local JoinGamePlayButtonFunction = DiscoveryAnalyticsModule.Points.joinGamePlayButton
local GameVotesRoduxModule = require(Parent.GameVotesRodux)
local ReasonForNotVoteable = GameVotesRoduxModule.Enums.ReasonForNotVoteable
local ClearUserGameVotesFunction = GameVotesRoduxModule.UserGameVotes.ClearUserGameVotes
local IsVRAppBuildFunction = require(Parent.AppCommonLib).IsVRAppBuild
local SplashScreenManager = require(Parent.SplashScreenManager).SplashScreenManager
local LaunchGameFunction = require(Parent.GameLaunch).LaunchGame
local FFlagDeferInExperienceRbxmDownload = require(Parent.SharedFlags).FFlagDeferInExperienceRbxmDownload
local DashModule = require(Parent.Dash)
local GetFFlagLuaAppEnableVirtualEventPlaceIdFunction = require(Parent.SharedFlags).GetFFlagLuaAppEnableVirtualEventPlaceId
local FFlagLuaAppEnableStratusStreamingTestOnly = require(Parent.SharedFlags).FFlagLuaAppEnableStratusStreamingTestOnly
local NavigateToRouteFunction = require(Parent.NavigationRodux).Thunks.NavigateToRoute
local AppPage = require(Parent.RobloxAppEnums).AppPage
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local FFlagLuaAppEnablePlayButtonThrottle = require(Parent.SharedFlags).FFlagLuaAppEnablePlayButtonThrottle
local FIntLuaAppPlayButtonThrottleTimeSeconds = require(Parent.SharedFlags).FIntLuaAppPlayButtonThrottleTimeSeconds
local FFlagLuaAppFixLaunchGameSourceParam = require(Parent.SharedFlags).FFlagLuaAppFixLaunchGameSourceParam
local FFlagLuaAppEnableStratusStreamingCheck = require(Parent.SharedFlags).FFlagLuaAppEnableStratusStreamingCheck
local FFlagLuaAppDemoModePlayButtonTelemetry = require(Parent.SharedFlags).FFlagLuaAppDemoModePlayButtonTelemetry
local VideoService = game:GetService("VideoService")

return function(UniverseId, p1, p2, ReferralSource, Ctx, LaunchSource, ExtraParams)
	-- upvalues: UseRoactServiceFunction (copy), RoactAnalytics (copy), AppEventIngestService (copy), AppGame (copy), UseSelectorFunction (copy), UseDispatchFunction (copy), FFlagLuaAppEnablePlayButtonThrottle (copy), ReactModule (copy), FIntLuaAppPlayButtonThrottleTimeSeconds (copy), GetFFlagLuaAppEnableVirtualEventPlaceIdFunction (copy), FFlagLuaAppDemoModePlayButtonTelemetry (copy), GamePlayIntentFunction (copy), JoinGamePlayButtonFunction (copy), FFlagLuaAppEnableStratusStreamingTestOnly (copy), FFlagLuaAppEnableStratusStreamingCheck (copy), VideoService (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateToRouteFunction (copy), IsVRAppBuildFunction (copy), SplashScreenManager (copy), FFlagDeferInExperienceRbxmDownload (copy), DashModule (copy), FFlagLuaAppFixLaunchGameSourceParam (copy), LaunchGameFunction (copy), ReasonForNotVoteable (copy), ClearUserGameVotesFunction (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactAnalytics)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AppEventIngestService)
	local UseRoactServiceResult2 = UseRoactServiceFunction(AppGame)
	local UseSelectorResult = UseSelectorFunction(function(p3)
		-- upvalues: UniverseId (copy)
		return p3.UserGameVotes[UniverseId]
	end)
	local UseDispatchResult = UseDispatchFunction()
	local UseRefResult = if FFlagLuaAppEnablePlayButtonThrottle then ReactModule.useRef(0) else nil
	
	return (ReactModule.useCallback(function(Callback: (any) -> (), p3)
		-- upvalues: FFlagLuaAppEnablePlayButtonThrottle (upval), UseRefResult (copy), FIntLuaAppPlayButtonThrottleTimeSeconds (upval), GetFFlagLuaAppEnableVirtualEventPlaceIdFunction (upval), p1 (copy), p2 (copy), FFlagLuaAppDemoModePlayButtonTelemetry (upval), GamePlayIntentFunction (upval), UseRoactServiceResult1 (copy), ReferralSource (copy), UniverseId (copy), ExtraParams (ref), JoinGamePlayButtonFunction (upval), UseRoactServiceResult (copy), Ctx (copy), FFlagLuaAppEnableStratusStreamingTestOnly (upval), FFlagLuaAppEnableStratusStreamingCheck (upval), VideoService (upval), AppPage (upval), LaunchSource (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateToRouteFunction (upval), IsVRAppBuildFunction (upval), SplashScreenManager (upval), FFlagDeferInExperienceRbxmDownload (upval), DashModule (upval), FFlagLuaAppFixLaunchGameSourceParam (upval), LaunchGameFunction (upval), UseRoactServiceResult2 (copy), UseSelectorResult (copy), ReasonForNotVoteable (upval), ClearUserGameVotesFunction (upval)
		if FFlagLuaAppEnablePlayButtonThrottle then
			local CurrentTime = tick()
			
			if CurrentTime - UseRefResult.current < FIntLuaAppPlayButtonThrottleTimeSeconds then return end
			UseRefResult.current = CurrentTime
		end
		if GetFFlagLuaAppEnableVirtualEventPlaceIdFunction() and (not p1 or not p2) or not GetFFlagLuaAppEnableVirtualEventPlaceIdFunction() and not p2 then return end
		if Callback == nil then
			GamePlayIntentFunction(UseRoactServiceResult1, "PlayButton", {
				placeId = if GetFFlagLuaAppEnableVirtualEventPlaceIdFunction() then p1 else p2,
				rootPlaceId = tonumber(p2),
				referralSource = ReferralSource,
				universeId = UniverseId,
				launchData = if ExtraParams and ExtraParams.launchData then ExtraParams.launchData else nil,
				tileType = if ExtraParams then ExtraParams.tileType else nil,
				nativeAdData = if ExtraParams then ExtraParams.nativeAdData else nil,
				actionType = if FFlagLuaAppDemoModePlayButtonTelemetry then p3 else nil
			})
		elseif FFlagLuaAppDemoModePlayButtonTelemetry then
			Callback(p3)
		else
			Callback()
		end
		JoinGamePlayButtonFunction(UseRoactServiceResult.InfluxDb, "gamePlayIntent", {
			isUniversalApp = true,
			referralSource = ReferralSource,
			placeId = if GetFFlagLuaAppEnableVirtualEventPlaceIdFunction() then p1 else p2,
			ctx = Ctx,
			actionType = if FFlagLuaAppDemoModePlayButtonTelemetry then p3 else nil
		})
		
		if FFlagLuaAppEnableStratusStreamingTestOnly then
			if FFlagLuaAppEnableStratusStreamingCheck then
				if VideoService:GameStreamingEnabled() then
					local list1 = {
						{
							name = AppPage.VideoServer,
							placeId = if GetFFlagLuaAppEnableVirtualEventPlaceIdFunction() then p1 else p2,
							launchSource = LaunchSource,
							extraParams = ExtraParams
						}
					}
					
					if FFlagSignalsNavP3Dispatch then
						NavigationCommands.to(NavigationCommands.fromLegacyPage(list1[#list1]))
						
						return
					else
						UseDispatchResult(NavigateToRouteFunction(list1))
						
						return
					end
				end
			else
				local list = {
					{
						name = AppPage.VideoServer,
						placeId = if GetFFlagLuaAppEnableVirtualEventPlaceIdFunction() then p1 else p2,
						launchSource = LaunchSource,
						extraParams = ExtraParams
					}
				}
				
				if FFlagSignalsNavP3Dispatch then
					NavigationCommands.to(NavigationCommands.fromLegacyPage(list[#list]))
					
					return
				else
					UseDispatchResult(NavigateToRouteFunction(list))
					
					return
				end
			end
		end
		if IsVRAppBuildFunction() then
			SplashScreenManager.initialize(36)
			wait(0.3)
		end
		if FFlagDeferInExperienceRbxmDownload then
			ExtraParams = DashModule.join(ExtraParams or {}, { universeId = UniverseId })
		end
		if FFlagLuaAppFixLaunchGameSourceParam then
			LaunchGameFunction(if GetFFlagLuaAppEnableVirtualEventPlaceIdFunction() then p1 else p2, ReferralSource, ExtraParams, UseRoactServiceResult2, LaunchSource)
		else
			LaunchGameFunction(if GetFFlagLuaAppEnableVirtualEventPlaceIdFunction() then p1 else p2, LaunchSource, ExtraParams, UseRoactServiceResult2)
		end
		if UseSelectorResult and UseSelectorResult.reasonForNotVoteable == ReasonForNotVoteable.PlayGame then
			UseDispatchResult(ClearUserGameVotesFunction(UniverseId))
		end
	end, {
		UseRoactServiceResult1, UseRoactServiceResult, UseRoactServiceResult2,
		UseSelectorResult, UniverseId,
		if GetFFlagLuaAppEnableVirtualEventPlaceIdFunction() then p1 else nil, p2,
		ReferralSource, Ctx, ExtraParams,
		if FFlagLuaAppDemoModePlayButtonTelemetry then UseDispatchResult else nil,
		if FFlagLuaAppDemoModePlayButtonTelemetry then LaunchSource else nil
	}))
end