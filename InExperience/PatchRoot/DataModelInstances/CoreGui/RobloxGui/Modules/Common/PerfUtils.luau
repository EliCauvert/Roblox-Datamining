local HttpService = game:GetService("HttpService")
local CorePackages = game:GetService("CorePackages")
local StatsService = game:GetService("Stats")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local InGameMenu = RobloxGui.Modules.InGameMenu
local Default = require(CorePackages.Workspace.Packages.LoggingProtocol).default
local IsNewInGameMenuEnabledModule = require(RobloxGui.Modules.isNewInGameMenuEnabled)
local SendAnalyticsModule = require(InGameMenu.Utility.SendAnalytics)
local Constants = require(CorePackages.Workspace.Packages.CoreScriptsCommon).Constants
local ConstantsModule = require(InGameMenu.Resources.Constants)
local v1 = require(script.Parent.Flags.GetFFlagEnableInGameMenuDurationLogger)()
local FrameRateManager = if StatsService then StatsService:FindFirstChild("FrameRateManager") else nil
local RenderAverage = if FrameRateManager then FrameRateManager:FindFirstChild("RenderAverage") else nil

local function _(): number --[[ Line: 26 | Named "getCurrentMenuVersion" ]]
	-- upvalues: IsNewInGameMenuEnabledModule (copy)
	return if IsNewInGameMenuEnabledModule() then 2 else 1
end

local _ = function(p1) --[[ Line: 33 | Named "getMenuAnimationTime" ]]
	-- upvalues: ConstantsModule (copy)
	return if p1 then ConstantsModule.ShieldOpenAnimationTweenTime else ConstantsModule.ShieldCloseAnimationTweenTime
end

local _ = function(): number --[[ Line: 40 | Named "getMonoTimeSec" ]]
	return os.clock()
end

local Guid = HttpService:GenerateGUID()
local ClockTime = os.clock()
local ClockTime1 = os.clock()
local Guid1 = nil
local Menu_session = nil
local Flag = false
local Interrupted_opening = false
local Count = 0

local function sendEvent(AnalyticsGameMenuCloseStart: string, p1) --[[ Line: 63 ]]
	-- upvalues: RenderAverage (copy), IsNewInGameMenuEnabledModule (copy), v1 (copy), Default (copy), SendAnalyticsModule (copy), Constants (copy)
	p1.fps = if RenderAverage then 1000 / RenderAverage:GetValue() else nil
	p1.menu_version = if IsNewInGameMenuEnabledModule() then 2 else 1
	
	if v1 then
		AnalyticsGameMenuCloseStart ..= "_v" .. p1.menu_version
	end
	if p1.menu_session then
		if v1 then
			Default:logEvent(AnalyticsGameMenuCloseStart, p1)
			
			return
		end
		SendAnalyticsModule(Constants.AnalyticsInGameMenuName, AnalyticsGameMenuCloseStart, p1)
	end
end

local function sendMenuOpening() --[[ Line: 89 ]]
	-- upvalues: v1 (copy), Constants (copy), Guid1 (ref), Guid (copy), Count (ref), Flag (ref), sendEvent (copy)
	local AnalyticsGameMenuOpenStart = if v1 then Constants.AnalyticsGameMenuOpenStart else Constants.AnalyticsPerfMenuOpening
	local config = {
		menu_session = Guid1,
		game_session = Guid,
		count = Count,
		interrupted_closing = Flag
	}
	
	if v1 then
		sendEvent(Constants.AnalyticsGameMenuFlowStart, config)
	end
	sendEvent(AnalyticsGameMenuOpenStart, config)
end

local _ = function(Transition_time_total, Transition_time_normalized) --[[ Line: 105 | Named "sendMenuStarted" ]]
	-- upvalues: v1 (copy), Constants (copy), sendEvent (copy), Guid1 (ref)
	sendEvent(if v1 then Constants.AnalyticsGameMenuOpenEnd else Constants.AnalyticsPerfMenuStarted, {
		menu_session = Guid1,
		transition_time_total = Transition_time_total,
		transition_time_normalized = Transition_time_normalized
	})
end

local function sendMenuClosed(Transition_time_total, Transition_time_normalized) --[[ Line: 114 ]]
	-- upvalues: v1 (copy), Constants (copy), Menu_session (ref), sendEvent (copy)
	local config = {
		menu_session = Menu_session,
		transition_time_total = Transition_time_total,
		transition_time_normalized = Transition_time_normalized
	}
	sendEvent(if v1 then Constants.AnalyticsGameMenuCloseEnd else Constants.AnalyticsPerfMenuClosed, config)
	
	if v1 then
		sendEvent(Constants.AnalyticsGameMenuFlowEnd, config)
	end
end

local _ = function(Session_time, p1) --[[ Line: 128 | Named "sendMenuEnding" ]]
	-- upvalues: v1 (copy), Constants (copy), sendEvent (copy), Guid1 (ref), Interrupted_opening (ref)
	sendEvent(if v1 then Constants.AnalyticsGameMenuCloseStart else Constants.AnalyticsPerfMenuEnding, {
		menu_session = Guid1,
		session_time = Session_time,
		reason = if p1 then "leaving" else "resume",
		interrupted_opening = Interrupted_opening
	})
end

return {
	menuOpenBegin = function() --[[ Line: 140 ]]
		-- upvalues: Guid1 (ref), Count (ref), ClockTime (ref), HttpService (copy), sendMenuOpening (copy), Interrupted_opening (ref), Flag (ref)
		if not Guid1 then
			Count += 1
			ClockTime = os.clock()
			Guid1 = HttpService:GenerateGUID()
			sendMenuOpening()
			Interrupted_opening = true
			Flag = false
			
			return
		end
	end,
	menuOpenComplete = function() --[[ Line: 152 ]]
		-- upvalues: ClockTime (ref), ConstantsModule (copy), v1 (copy), Constants (copy), sendEvent (copy), Guid1 (ref), Interrupted_opening (ref)
		local Elapsed = os.clock() - ClockTime
		sendEvent(if v1 then Constants.AnalyticsGameMenuOpenEnd else Constants.AnalyticsPerfMenuStarted, {
			menu_session = Guid1,
			transition_time_total = Elapsed,
			transition_time_normalized = Elapsed - ConstantsModule.ShieldOpenAnimationTweenTime
		})
		Interrupted_opening = false
	end,
	menuClose = function() --[[ Line: 159 ]]
		-- upvalues: ClockTime1 (ref), ClockTime (ref), v1 (copy), Constants (copy), sendEvent (copy), Guid1 (ref), Interrupted_opening (ref), Menu_session (ref), Flag (ref)
		ClockTime1 = os.clock()
		sendEvent(if v1 then Constants.AnalyticsGameMenuCloseStart else Constants.AnalyticsPerfMenuEnding, {
			reason = "resume",
			menu_session = Guid1,
			session_time = ClockTime1 - ClockTime,
			interrupted_opening = Interrupted_opening
		})
		Menu_session = Guid1
		Guid1 = nil
		Interrupted_opening = false
		Flag = true
	end,
	menuCloseComplete = function() --[[ Line: 168 ]]
		-- upvalues: ClockTime1 (ref), ConstantsModule (copy), sendMenuClosed (copy), Menu_session (ref), Flag (ref)
		local Elapsed = os.clock() - ClockTime1
		sendMenuClosed(Elapsed, Elapsed - ConstantsModule.ShieldCloseAnimationTweenTime)
		Menu_session = nil
		Flag = false
	end,
	leavingGame = function() --[[ Line: 176 ]]
		-- upvalues: ClockTime (ref), v1 (copy), Constants (copy), sendEvent (copy), Guid1 (ref), Interrupted_opening (ref)
		sendEvent(if v1 then Constants.AnalyticsGameMenuCloseStart else Constants.AnalyticsPerfMenuEnding, {
			reason = "leaving",
			menu_session = Guid1,
			session_time = os.clock() - ClockTime,
			interrupted_opening = Interrupted_opening
		})
		Guid1 = nil
	end,
	getFps = function() --[[ Line: 44 ]]
		-- upvalues: RenderAverage (copy)
		return if RenderAverage then 1000 / RenderAverage:GetValue() else nil
	end
}