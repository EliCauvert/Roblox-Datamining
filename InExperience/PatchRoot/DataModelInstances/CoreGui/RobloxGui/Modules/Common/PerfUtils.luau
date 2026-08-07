local httpService = game:GetService("HttpService")
local corePackagesService = game:GetService("CorePackages")
local statsService = game:GetService("Stats")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local inGameMenu = robloxGui.Modules.InGameMenu
local default = require(corePackagesService.Workspace.Packages.LoggingProtocol).default
local isNewInGameMenuEnabledModule = require(robloxGui.Modules.isNewInGameMenuEnabled)
local sendAnalyticsModule = require(inGameMenu.Utility.SendAnalytics)
local constants = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).Constants
local constantsModule = require(inGameMenu.Resources.Constants)
local var7 = require(script.Parent.Flags.GetFFlagEnableInGameMenuDurationLogger)()
local var8 = if statsService then statsService:FindFirstChild("FrameRateManager") else nil
local var9 = if var8 then var8:FindFirstChild("RenderAverage") else nil

local function _() --[[ line: 26 | named "getCurrentMenuVersion" ]]
	-- upvalues: isNewInGameMenuEnabledModule (ref)
	return if isNewInGameMenuEnabledModule() then 2 else 1
end

local _ = function(p0) --[[ line: 33 | named "getMenuAnimationTime" ]]
	-- upvalues: constantsModule (ref)
	return if p0 then constantsModule.ShieldOpenAnimationTweenTime else constantsModule.ShieldCloseAnimationTweenTime
end

local _ = function() --[[ line: 40 | named "getMonoTimeSec" ]]
	return os.clock()
end

local function getFps() --[[ line: 44 ]]
	-- upvalues: var9 (ref)
	return if var9 then 1000 / var9:GetValue() else nil
end

local var11 = httpService:GenerateGUID()
local processTime = os.clock()
local processTime_1 = os.clock()
local var14 = nil
local var15 = nil
local var16 = false
local var17 = false
local var18 = 0

local function sendEvent(p1, p2) --[[ line: 63 ]]
	-- upvalues: var9 (ref), isNewInGameMenuEnabledModule (ref), var7 (ref), default (ref), sendAnalyticsModule (ref), constants (ref)
	p2.fps = if var9 then 1000 / var9:GetValue() else nil
	p2.menu_version = if isNewInGameMenuEnabledModule() then 2 else 1
	
	if var7 then
		p1 ..= "_v" .. p2.menu_version
	end
	if p2.menu_session then
		if var7 then
			default:logEvent(p1, p2)
			
			return
		end
		sendAnalyticsModule(constants.AnalyticsInGameMenuName, p1, p2)
	end
end

local function sendMenuOpening() --[[ line: 89 ]]
	-- upvalues: var7 (ref), constants (ref), var14 (write), var11 (ref), var18 (write), var16 (write), sendEvent (ref)
	local var22 = if var7 then constants.AnalyticsGameMenuOpenStart else constants.AnalyticsPerfMenuOpening
	local t = {
		menu_session = var14,
		game_session = var11,
		count = var18,
		interrupted_closing = var16
	}
	
	if var7 then
		sendEvent(constants.AnalyticsGameMenuFlowStart, t)
	end
	sendEvent(var22, t)
end

local _ = function(p3, p4) --[[ line: 105 | named "sendMenuStarted" ]]
	-- upvalues: var7 (ref), constants (ref), sendEvent (ref), var14 (write)
	sendEvent(if var7 then constants.AnalyticsGameMenuOpenEnd else constants.AnalyticsPerfMenuStarted, {
		menu_session = var14,
		transition_time_total = p3,
		transition_time_normalized = p4
	})
end

local function sendMenuClosed(p5, p6) --[[ line: 114 ]]
	-- upvalues: var7 (ref), constants (ref), var15 (write), sendEvent (ref)
	local t = {
		menu_session = var15,
		transition_time_total = p5,
		transition_time_normalized = p6
	}
	sendEvent(if var7 then constants.AnalyticsGameMenuCloseEnd else constants.AnalyticsPerfMenuClosed, t)
	
	if var7 then
		sendEvent(constants.AnalyticsGameMenuFlowEnd, t)
	end
end

local _ = function(p7, p8) --[[ line: 128 | named "sendMenuEnding" ]]
	-- upvalues: var7 (ref), constants (ref), sendEvent (ref), var14 (write), var17 (write)
	sendEvent(if var7 then constants.AnalyticsGameMenuCloseStart else constants.AnalyticsPerfMenuEnding, {
		menu_session = var14,
		session_time = p7,
		reason = if p8 then "leaving" else "resume",
		interrupted_opening = var17
	})
end

return {
	menuOpenBegin = function() --[[ line: 140 ]]
		-- upvalues: var14 (write), var18 (write), processTime (write), httpService (ref), sendMenuOpening (ref), var17 (write), var16 (write)
		if var14 then
			return
		end
		var18 += 1
		processTime = os.clock()
		var14 = httpService:GenerateGUID()
		sendMenuOpening()
		var17 = true
		var16 = false
	end,
	menuOpenComplete = function() --[[ line: 152 ]]
		-- upvalues: processTime (write), constantsModule (ref), var7 (ref), constants (ref), sendEvent (ref), var14 (write), var17 (write)
		local var25 = os.clock() - processTime
		sendEvent(if var7 then constants.AnalyticsGameMenuOpenEnd else constants.AnalyticsPerfMenuStarted, {
			menu_session = var14,
			transition_time_total = var25,
			transition_time_normalized = var25 - constantsModule.ShieldOpenAnimationTweenTime
		})
		var17 = false
	end,
	menuClose = function() --[[ line: 159 ]]
		-- upvalues: processTime_1 (write), processTime (write), var7 (ref), constants (ref), sendEvent (ref), var14 (write), var17 (write), var15 (write), var16 (write)
		processTime_1 = os.clock()
		sendEvent(if var7 then constants.AnalyticsGameMenuCloseStart else constants.AnalyticsPerfMenuEnding, {
			reason = "resume",
			menu_session = var14,
			session_time = processTime_1 - processTime,
			interrupted_opening = var17
		})
		var15 = var14
		var14 = nil
		var17 = false
		var16 = true
	end,
	menuCloseComplete = function() --[[ line: 168 ]]
		-- upvalues: processTime_1 (write), constantsModule (ref), sendMenuClosed (ref), var15 (write), var16 (write)
		local var26 = os.clock() - processTime_1
		sendMenuClosed(var26, var26 - constantsModule.ShieldCloseAnimationTweenTime)
		var15 = nil
		var16 = false
	end,
	leavingGame = function() --[[ line: 176 ]]
		-- upvalues: processTime (write), var7 (ref), constants (ref), sendEvent (ref), var14 (write), var17 (write)
		sendEvent(if var7 then constants.AnalyticsGameMenuCloseStart else constants.AnalyticsPerfMenuEnding, {
			reason = "leaving",
			menu_session = var14,
			session_time = os.clock() - processTime,
			interrupted_opening = var17
		})
		var14 = nil
	end,
	getFps = getFps
}