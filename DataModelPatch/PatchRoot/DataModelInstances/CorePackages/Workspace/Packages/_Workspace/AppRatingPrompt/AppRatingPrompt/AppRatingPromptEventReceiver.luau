local MessageBusService = game:GetService("MessageBusService")
local TelemetryService = game:GetService("TelemetryService")
local Parent = script.Parent
local DependenciesModule = require(Parent.dependencies)
local AppRatingPromptFeatureModule = require(Parent.AppRatingPromptFeature)
local RoactRodux = DependenciesModule.RoactRodux
local React = DependenciesModule.React
local ConfigResult = DependenciesModule.LuaSocialLibrariesDeps.SocialLibraries.config({})
local LoggingProtocol = DependenciesModule.LoggingProtocol
local CallOnceFunction = DependenciesModule.AppCommonLib.callOnce
local AppLifecycleObserverService = nil
pcall(function()
	-- upvalues: AppLifecycleObserverService (ref)
	AppLifecycleObserverService = game:GetService("AppLifecycleObserverService")
end)
local AppRatingPromptService = AppRatingPromptFeatureModule.GetAppRatingPromptService()
local AppRatingPromptMessageId = MessageBusService:GetMessageId("AppRatingPrompt", "leftGame")
local RatingPromptEventThrottleHundredthsPercent = game:DefineFastInt("RatingPromptEventThrottleHundredthsPercent", 10000)
local ShowRatingPromptOnGameLeave2 = game:DefineFastFlag("ShowRatingPromptOnGameLeave2", false)
local UseGameEngineEventForGameLeave = game:DefineFastFlag("UseGameEngineEventForGameLeave", false)
local ShowPromptOnAppStart = game:DefineFastFlag("ShowPromptOnAppStart", false)
local EnableStickyParamForGameEndMessage = game:DefineFastFlag("EnableStickyParamForGameEndMessage", false)
local _ = game:DefineFastFlag("EnableAppRatingPromptLua2", false)
local config = {
	recentPlayTimeSeconds = 0,
	friendCount = 0,
	numberOfLaunches = 0,
	daysSinceLastAttempt = 0,
	launchesSinceAttempt = 0,
	timeSinceFirstUseSecs = 0,
	eventTriggeredBy = "unknown"
}
local v1 = RoactRodux.connect(function(p1)
	-- upvalues: ConfigResult (copy)
	return {
		friendCount = ConfigResult.Dictionary.getDeepValue(p1, string.format("FriendsCarousel.Friends.countsByUserId.%s", p1.LocalUserId)) or 0
	}
end)(function(p1)
	-- upvalues: AppRatingPromptService (copy), AppRatingPromptFeatureModule (copy), React (copy), config (copy), LoggingProtocol (copy), RatingPromptEventThrottleHundredthsPercent (copy), TelemetryService (copy), ShowPromptOnAppStart (copy), CallOnceFunction (copy), ShowRatingPromptOnGameLeave2 (copy), UseGameEngineEventForGameLeave (copy), MessageBusService (copy), AppRatingPromptMessageId (copy), EnableStickyParamForGameEndMessage (copy), AppLifecycleObserverService (ref)
	local FriendCount = p1.friendCount
	local UseRefResult = React.useRef(FriendCount)
	local UseRefResult1 = React.useRef(config)
	React.useEffect(function()
		-- upvalues: FriendCount (copy), UseRefResult (copy), AppRatingPromptFeatureModule (copy)
		if FriendCount == nil then return end
		UseRefResult.current = FriendCount
		
		if AppRatingPromptFeatureModule.GetMinimumNumFriends() <= FriendCount and not AppRatingPromptFeatureModule.GetAppRatingPromptStats()[AppRatingPromptFeatureModule.kPassedFriendsCheck] then
			AppRatingPromptFeatureModule.SetAppRatingPromptStat({
				[AppRatingPromptFeatureModule.kPassedFriendsCheck] = true
			})
		end
	end, { FriendCount })
	React.useEffect(function()
		-- upvalues: AppRatingPromptService (copy), LoggingProtocol (upval), RatingPromptEventThrottleHundredthsPercent (upval), AppRatingPromptFeatureModule (copy), TelemetryService (upval), UseRefResult1 (copy), UseRefResult (copy), ShowPromptOnAppStart (upval), CallOnceFunction (upval), ShowRatingPromptOnGameLeave2 (upval), UseGameEngineEventForGameLeave (upval), MessageBusService (upval), AppRatingPromptMessageId (upval), EnableStickyParamForGameEndMessage (upval), AppLifecycleObserverService (upval)
		local function launchPrompt()
			-- upvalues: AppRatingPromptService (upval), LoggingProtocol (upval), RatingPromptEventThrottleHundredthsPercent (upval), AppRatingPromptFeatureModule (upval), TelemetryService (upval), UseRefResult1 (upval)
			if AppRatingPromptService ~= nil then
				local config = {
					eventName = "ShowNativeRatingPromptAttempted",
					description = "Event sent when attemping to show a native rating prompt",
					links = "",
					backends = { LoggingProtocol.TelemetryBackends.EventIngest },
					throttlingPercentage = RatingPromptEventThrottleHundredthsPercent,
					lastUpdated = { 2025, 8, 6 }
				}
				AppRatingPromptService:showAppRatingPrompt()
				AppRatingPromptFeatureModule.PromptTriggered()
				TelemetryService:LogEvent(config, { customFields = UseRefResult1.current })
			end
		end
		
		local function considerRatingPrompt()
			-- upvalues: AppRatingPromptFeatureModule (upval), UseRefResult1 (upval), UseRefResult (upval), launchPrompt (copy)
			local AppRatingPromptStats = AppRatingPromptFeatureModule.GetAppRatingPromptStats()
			local UnixTimestamp = DateTime.now().UnixTimestamp
			
			if not AppRatingPromptStats[AppRatingPromptFeatureModule.kFirstUseDay] or type(AppRatingPromptStats[AppRatingPromptFeatureModule.kFirstUseDay]) ~= "number" or UnixTimestamp - AppRatingPromptStats[AppRatingPromptFeatureModule.kFirstUseDay] < AppRatingPromptFeatureModule.GetMinDaysSinceFirstUse() * 86400 then return end
			if not AppRatingPromptStats[AppRatingPromptFeatureModule.kLastTriggerTimestamp] or type(AppRatingPromptStats[AppRatingPromptFeatureModule.kLastTriggerTimestamp]) ~= "number" or AppRatingPromptStats[AppRatingPromptFeatureModule.kLastTriggerTimestamp] ~= -1 and UnixTimestamp - AppRatingPromptStats[AppRatingPromptFeatureModule.kLastTriggerTimestamp] < AppRatingPromptFeatureModule.GetMinNumDaysSinceLastPrompt() * 86400 then return end
			if not AppRatingPromptStats[AppRatingPromptFeatureModule.kLaunchesSinceLastPrompt] or type(AppRatingPromptStats[AppRatingPromptFeatureModule.kLaunchesSinceLastPrompt]) ~= "number" or AppRatingPromptStats[AppRatingPromptFeatureModule.kLastTriggerTimestamp] ~= -1 and AppRatingPromptStats[AppRatingPromptFeatureModule.kLaunchesSinceLastPrompt] < AppRatingPromptFeatureModule.GetMinNumLaunchesSinceLastPrompt() then return end
			if not AppRatingPromptStats[AppRatingPromptFeatureModule.kNumGamesPlayed] or type(AppRatingPromptStats[AppRatingPromptFeatureModule.kNumGamesPlayed]) ~= "number" or AppRatingPromptStats[AppRatingPromptFeatureModule.kNumGamesPlayed] < AppRatingPromptFeatureModule.GetMinNumGamesPlayed() then return end
			if not AppRatingPromptStats[AppRatingPromptFeatureModule.kNumLaunches] or type(AppRatingPromptStats[AppRatingPromptFeatureModule.kNumLaunches]) ~= "number" or AppRatingPromptStats[AppRatingPromptFeatureModule.kNumLaunches] < AppRatingPromptFeatureModule.GetMinNumLaunches() then return end
			if AppRatingPromptStats[AppRatingPromptFeatureModule.kVersionAlreadyRated] == nil or AppRatingPromptStats[AppRatingPromptFeatureModule.kVersionAlreadyRated] and AppRatingPromptFeatureModule.GetCheckVersionRated() then return end
			if AppRatingPromptStats[AppRatingPromptFeatureModule.kPassedFriendsCheck] then
				UseRefResult1.current.daysSinceLastAttempt = if AppRatingPromptStats[AppRatingPromptFeatureModule.kLastTriggerTimestamp] == -1 then -1 else math.floor((UnixTimestamp - AppRatingPromptStats[AppRatingPromptFeatureModule.kLastTriggerTimestamp]) / 86400)
				UseRefResult1.current.launchesSinceAttempt = AppRatingPromptStats[AppRatingPromptFeatureModule.kLaunchesSinceLastPrompt]
				UseRefResult1.current.numberOfLaunches = AppRatingPromptStats[AppRatingPromptFeatureModule.kNumLaunches]
				UseRefResult1.current.friendCount = UseRefResult.current
				UseRefResult1.current.timeSinceFirstUseSecs = UnixTimestamp - AppRatingPromptStats[AppRatingPromptFeatureModule.kFirstUseDay]
				UseRefResult1.current.eventTriggeredBy = "gameLeave"
				launchPrompt()
				
				return
			end
		end
		
		AppRatingPromptFeatureModule.onLaunch()
		
		if ShowPromptOnAppStart then
			CallOnceFunction("AppRatingPromptOnAppStart", function()
				-- upvalues: considerRatingPrompt (copy)
				considerRatingPrompt()
			end)
		end
		local function onGameLeft(GameTime)
			-- upvalues: AppRatingPromptFeatureModule (upval), ShowRatingPromptOnGameLeave2 (upval), UseRefResult1 (upval), considerRatingPrompt (copy)
			if GameTime < AppRatingPromptFeatureModule.GetMinGameDurationSec() then return end
			AppRatingPromptFeatureModule.IncrementValues({ AppRatingPromptFeatureModule.kNumGamesPlayed })
			
			if ShowRatingPromptOnGameLeave2 then
				UseRefResult1.current.recentPlayTimeSeconds = GameTime
				considerRatingPrompt()
			end
		end
		
		local t = {}
		
		if UseGameEngineEventForGameLeave and AppRatingPromptService ~= nil then
			t.gameEngineEvent = AppRatingPromptService.OnGameLeft:Connect(onGameLeft)
		else
			t.messageBusEvent = MessageBusService:Subscribe(AppRatingPromptMessageId, function(p2)
				-- upvalues: onGameLeft (copy)
				onGameLeft(p2.gameTime)
			end, false, EnableStickyParamForGameEndMessage)
		end
		if AppLifecycleObserverService then
			t.enteredForegroundEvent = AppLifecycleObserverService.OnUnhide:Connect(function()
				-- upvalues: AppRatingPromptFeatureModule (upval), ShowPromptOnAppStart (upval), considerRatingPrompt (copy)
				AppRatingPromptFeatureModule.IncrementValues({
					AppRatingPromptFeatureModule.kNumLaunches,
					AppRatingPromptFeatureModule.kLaunchesSinceLastPrompt
				})
				
				if ShowPromptOnAppStart then
					considerRatingPrompt()
				end
			end)
		end
		return function()
			-- upvalues: t (copy)
			for _, value in pairs(t) do
				value:disconnect()
			end
		end
	end, {})
	
	return nil
end)

return function(p2)
	-- upvalues: AppRatingPromptFeatureModule (copy), React (copy), v1 (copy)
	return if AppRatingPromptFeatureModule.GetAppRatingPromptEnabled() then React.createElement(v1, p2) else React.createElement(React.Fragment)
end