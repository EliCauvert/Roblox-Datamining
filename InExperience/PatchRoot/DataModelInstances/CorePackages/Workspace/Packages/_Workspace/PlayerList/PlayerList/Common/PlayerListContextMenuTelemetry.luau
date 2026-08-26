local telemetryService = game:GetService("TelemetryService")
local playerListContextMenuTelemetryThrottleHundredthsPercent = game:DefineFastInt("PlayerListContextMenuTelemetryThrottleHundredthsPercent", 10000)
local _ = require(script.Parent.PlayerListContextMenuTelemetryAction)
local list = { 2026, 8, 4 }
local t = {
	eventName = "coreui_playerlist_context_menu_action",
	description = "Fired when the PlayerList contextual menu is opened, closed, or an action row is activated.",
	backends = { "EventIngest" },
	throttlingPercentage = playerListContextMenuTelemetryThrottleHundredthsPercent,
	lastUpdated = list
}
local t_1 = {
	eventName = "coreui_playerlist_context_menu_action",
	description = "Counter for PlayerList contextual menu open / close / action activations.",
	backends = { "RobloxTelemetryCounter" },
	throttlingPercentage = playerListContextMenuTelemetryThrottleHundredthsPercent,
	lastUpdated = list
}

return {
	logAction = function(p1, p2)
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
			if p2.isSelf ~= nil then
				t_2.is_self = tostring(p2.isSelf)
			end
			if p2.friendStatus ~= nil then
				t_2.friend_status = p2.friendStatus
			end
		end
		local t_3 = { standardizedFields = list, customFields = t_2 }
		telemetryService:LogEvent(t, t_3)
		telemetryService:LogCounter(t_1, t_3, 1)
	end,
	_setServicesForTesting = function(value)
		-- upvalues: telemetryService (write)
		telemetryService = value
	end
}