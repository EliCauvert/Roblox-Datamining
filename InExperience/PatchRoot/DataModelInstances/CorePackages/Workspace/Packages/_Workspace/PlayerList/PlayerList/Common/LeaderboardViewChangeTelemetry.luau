local TelemetryService = game:GetService("TelemetryService")
local PlayerListReskinViewChangeTelemetryThrottleHundredthsPercent = game:DefineFastInt("PlayerListReskinViewChangeTelemetryThrottleHundredthsPercent", 10000)
local LastUpdated = { 2026, 8, 13 }
local config = {
	eventName = "coreui_playerlist_leaderboard_view_change",
	description = "Fired when the leaderboard is shown, hidden, the user switches tabs, a Friends/Global tab fails to load, or the user retries after a load error.",
	backends = { "EventIngest" },
	throttlingPercentage = PlayerListReskinViewChangeTelemetryThrottleHundredthsPercent,
	lastUpdated = LastUpdated
}
local config1 = {
	eventName = "coreui_playerlist_leaderboard_view_change",
	description = "Counter for leaderboard show / hide / tab-switch / load-error / retry-error view changes.",
	backends = { "RobloxTelemetryCounter" },
	throttlingPercentage = PlayerListReskinViewChangeTelemetryThrottleHundredthsPercent,
	lastUpdated = LastUpdated
}
local CurrentTab = nil
local Flag = false
local Flag1 = false

local function log(Action, Tab) --[[ Line: 39 ]]
	-- upvalues: TelemetryService (ref), config (copy), config1 (copy)
	local StandardizedFields = {
		"addPlaceId",
		"addUniverseId",
		"addSessionInfo",
		"addSessionId",
		"addPlaySessionId"
	}
	local CustomFields = { action = Action }
	
	if Tab ~= nil then
		CustomFields.tab = Tab
	end
	local config2 = {
		standardizedFields = StandardizedFields,
		customFields = CustomFields
	}
	TelemetryService:LogEvent(config, config2)
	TelemetryService:LogCounter(config1, config2, 1)
end

return {
	logSwitchTab = function(Tab) --[[ Line: 53 ]]
		-- upvalues: CurrentTab (ref), Flag (ref), log (copy)
		CurrentTab = Tab
		Flag = true
		log("switch_tab", Tab)
	end,
	logVisibility = function(p1, p2) --[[ Line: 59 ]]
		-- upvalues: Flag (ref), Flag1 (ref), log (copy), CurrentTab (ref)
		if p1 and p2 and not Flag then
			Flag1 = true
			
			return
		else
			Flag1 = false
			log(if p1 then "show_leaderboard" else "hide_leaderboard", CurrentTab)
		end
	end,
	logLoadError = function(Tab) --[[ Line: 69 ]]
		-- upvalues: log (copy)
		log("load_error", Tab)
	end,
	logRetryError = function(Tab) --[[ Line: 73 ]]
		-- upvalues: log (copy)
		log("retry_error", Tab)
	end,
	setCurrentTab = function(Value) --[[ Line: 77 ]]
		-- upvalues: CurrentTab (ref), Flag (ref), Flag1 (ref), log (copy)
		CurrentTab = Value
		Flag = true
		
		if Flag1 then
			Flag1 = false
			log("show_leaderboard", CurrentTab)
		end
	end,
	clearCurrentTab = function() --[[ Line: 88 ]]
		-- upvalues: CurrentTab (ref), Flag (ref)
		CurrentTab = nil
		Flag = false
	end,
	_setServicesForTesting = function(p1) --[[ Line: 101 ]]
		-- upvalues: TelemetryService (ref), CurrentTab (ref), Flag (ref), Flag1 (ref)
		TelemetryService = p1
		CurrentTab = nil
		Flag = false
		Flag1 = false
	end
}