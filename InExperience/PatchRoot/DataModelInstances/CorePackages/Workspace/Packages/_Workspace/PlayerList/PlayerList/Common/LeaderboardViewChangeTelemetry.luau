local telemetryService = game:GetService("TelemetryService")
local playerListReskinViewChangeTelemetryThrottleHundredthsPercent = game:DefineFastInt("PlayerListReskinViewChangeTelemetryThrottleHundredthsPercent", 10000)
local list = { 2026, 8, 13 }
local t = {
	eventName = "coreui_playerlist_leaderboard_view_change",
	description = "Fired when the leaderboard is shown, hidden, the user switches tabs, a Friends/Global tab fails to load, or the user retries after a load error.",
	backends = { "EventIngest" },
	throttlingPercentage = playerListReskinViewChangeTelemetryThrottleHundredthsPercent,
	lastUpdated = list
}
local t_1 = {
	eventName = "coreui_playerlist_leaderboard_view_change",
	description = "Counter for leaderboard show / hide / tab-switch / load-error / retry-error view changes.",
	backends = { "RobloxTelemetryCounter" },
	throttlingPercentage = playerListReskinViewChangeTelemetryThrottleHundredthsPercent,
	lastUpdated = list
}
local var1 = nil
local var2 = false
local var3 = false

local function log(p1, p2)
	-- upvalues: telemetryService (write), t (ref), t_1 (ref)
	local list = {
		"addPlaceId",
		"addUniverseId",
		"addSessionInfo",
		"addSessionId",
		"addPlaySessionId"
	}
	local t_2 = { action = p1 }
	
	if p2 ~= nil then
		t_2.tab = p2
	end
	local t_3 = { standardizedFields = list, customFields = t_2 }
	telemetryService:LogEvent(t, t_3)
	telemetryService:LogCounter(t_1, t_3, 1)
end

return {
	logSwitchTab = function(p1)
		-- upvalues: var1 (write), var2 (write), log (ref)
		var1 = p1
		var2 = true
		log("switch_tab", p1)
	end,
	logVisibility = function(p1, p2)
		-- upvalues: var2 (write), var3 (write), log (ref), var1 (write)
		if p1 and p2 and not var2 then
			var3 = true
			
			return
		end
		var3 = false
		log(if p1 then "show_leaderboard" else "hide_leaderboard", var1)
	end,
	logLoadError = function(p1)
		-- upvalues: log (ref)
		log("load_error", p1)
	end,
	logRetryError = function(p1)
		-- upvalues: log (ref)
		log("retry_error", p1)
	end,
	setCurrentTab = function(value)
		-- upvalues: var1 (write), var2 (write), var3 (write), log (ref)
		var1 = value
		var2 = true
		
		if var3 then
			var3 = false
			log("show_leaderboard", var1)
		end
	end,
	clearCurrentTab = function()
		-- upvalues: var1 (write), var2 (write)
		var1 = nil
		var2 = false
	end,
	_setServicesForTesting = function(value)
		-- upvalues: telemetryService (write), var1 (write), var2 (write), var3 (write)
		telemetryService = value
		var1 = nil
		var2 = false
		var3 = false
	end
}