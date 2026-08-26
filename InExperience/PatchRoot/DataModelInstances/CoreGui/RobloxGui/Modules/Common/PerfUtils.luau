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
local var1 = require(script.Parent.Flags.GetFFlagEnableInGameMenuDurationLogger)()
local var2 = if statsService then statsService:FindFirstChild("FrameRateManager") else nil
local var3 = if var2 then var2:FindFirstChild("RenderAverage") else nil

local function _()
	-- upvalues: isNewInGameMenuEnabledModule (ref)
	return if isNewInGameMenuEnabledModule() then 2 else 1
end

local _ = function(p1)
	-- upvalues: constantsModule (ref)
	return if p1 then constantsModule.ShieldOpenAnimationTweenTime else constantsModule.ShieldCloseAnimationTweenTime
end

local _ = function()
	return os.clock()
end

local function getFps()
	-- upvalues: var3 (ref)
	return if var3 then 1000 / var3:GetValue() else nil
end

local var4 = httpService:GenerateGUID()
local processTime = os.clock()
local processTime_1 = os.clock()
local var5 = nil
local var6 = nil
local var7 = false
local var8 = false
local var9 = 0

local function sendEvent(p1, p2)
	-- upvalues: var3 (ref), isNewInGameMenuEnabledModule (ref), var1 (ref), default (ref), sendAnalyticsModule (ref), constants (ref)
	p2.fps = if var3 then 1000 / var3:GetValue() else nil
	p2.menu_version = if isNewInGameMenuEnabledModule() then 2 else 1
	
	if var1 then
		p1 ..= "_v" .. p2.menu_version
	end
	if p2.menu_session then
		if var1 then
			default:logEvent(p1, p2)
			
			return
		end
		sendAnalyticsModule(constants.AnalyticsInGameMenuName, p1, p2)
	end
end

local function sendMenuOpening()
	-- upvalues: var1 (ref), constants (ref), var5 (write), var4 (ref), var9 (write), var7 (write), sendEvent (ref)
	local var10 = if var1 then constants.AnalyticsGameMenuOpenStart else constants.AnalyticsPerfMenuOpening
	local t = {
		menu_session = var5,
		game_session = var4,
		count = var9,
		interrupted_closing = var7
	}
	
	if var1 then
		sendEvent(constants.AnalyticsGameMenuFlowStart, t)
	end
	sendEvent(var10, t)
end

local _ = function(p1, p2)
	-- upvalues: var1 (ref), constants (ref), sendEvent (ref), var5 (write)
	sendEvent(if var1 then constants.AnalyticsGameMenuOpenEnd else constants.AnalyticsPerfMenuStarted, {
		menu_session = var5,
		transition_time_total = p1,
		transition_time_normalized = p2
	})
end

local function sendMenuClosed(p1, p2)
	-- upvalues: var1 (ref), constants (ref), var6 (write), sendEvent (ref)
	local t = {
		menu_session = var6,
		transition_time_total = p1,
		transition_time_normalized = p2
	}
	sendEvent(if var1 then constants.AnalyticsGameMenuCloseEnd else constants.AnalyticsPerfMenuClosed, t)
	
	if var1 then
		sendEvent(constants.AnalyticsGameMenuFlowEnd, t)
	end
end

local _ = function(p1, p2)
	-- upvalues: var1 (ref), constants (ref), sendEvent (ref), var5 (write), var8 (write)
	sendEvent(if var1 then constants.AnalyticsGameMenuCloseStart else constants.AnalyticsPerfMenuEnding, {
		menu_session = var5,
		session_time = p1,
		reason = if p2 then "leaving" else "resume",
		interrupted_opening = var8
	})
end

return {
	menuOpenBegin = function()
		-- upvalues: var5 (write), var9 (write), processTime (write), httpService (ref), sendMenuOpening (ref), var8 (write), var7 (write)
		if var5 then
			return
		end
		var9 += 1
		processTime = os.clock()
		var5 = httpService:GenerateGUID()
		sendMenuOpening()
		var8 = true
		var7 = false
	end,
	menuOpenComplete = function()
		-- upvalues: processTime (write), constantsModule (ref), var1 (ref), constants (ref), sendEvent (ref), var5 (write), var8 (write)
		local var10 = os.clock() - processTime
		sendEvent(if var1 then constants.AnalyticsGameMenuOpenEnd else constants.AnalyticsPerfMenuStarted, {
			menu_session = var5,
			transition_time_total = var10,
			transition_time_normalized = var10 - constantsModule.ShieldOpenAnimationTweenTime
		})
		var8 = false
	end,
	menuClose = function()
		-- upvalues: processTime_1 (write), processTime (write), var1 (ref), constants (ref), sendEvent (ref), var5 (write), var8 (write), var6 (write), var7 (write)
		processTime_1 = os.clock()
		sendEvent(if var1 then constants.AnalyticsGameMenuCloseStart else constants.AnalyticsPerfMenuEnding, {
			reason = "resume",
			menu_session = var5,
			session_time = processTime_1 - processTime,
			interrupted_opening = var8
		})
		var6 = var5
		var5 = nil
		var8 = false
		var7 = true
	end,
	menuCloseComplete = function()
		-- upvalues: processTime_1 (write), constantsModule (ref), sendMenuClosed (ref), var6 (write), var7 (write)
		local var10 = os.clock() - processTime_1
		sendMenuClosed(var10, var10 - constantsModule.ShieldCloseAnimationTweenTime)
		var6 = nil
		var7 = false
	end,
	leavingGame = function()
		-- upvalues: processTime (write), var1 (ref), constants (ref), sendEvent (ref), var5 (write), var8 (write)
		sendEvent(if var1 then constants.AnalyticsGameMenuCloseStart else constants.AnalyticsPerfMenuEnding, {
			reason = "leaving",
			menu_session = var5,
			session_time = os.clock() - processTime,
			interrupted_opening = var8
		})
		var5 = nil
	end,
	getFps = getFps
}