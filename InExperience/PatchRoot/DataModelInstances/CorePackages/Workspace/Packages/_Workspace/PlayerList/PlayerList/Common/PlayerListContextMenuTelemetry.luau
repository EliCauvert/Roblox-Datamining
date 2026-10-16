local TelemetryService = game:GetService("TelemetryService")
local PlayerListContextMenuTelemetryThrottleHundredthsPercent = game:DefineFastInt("PlayerListContextMenuTelemetryThrottleHundredthsPercent", 10000)
local _ = require(script.Parent.PlayerListContextMenuTelemetryAction)
local LastUpdated = { 2026, 8, 4 }
local config = {
	eventName = "coreui_playerlist_context_menu_action",
	description = "Fired when the PlayerList contextual menu is opened, closed, or an action row is activated.",
	backends = { "EventIngest" },
	throttlingPercentage = PlayerListContextMenuTelemetryThrottleHundredthsPercent,
	lastUpdated = LastUpdated
}
local config1 = {
	eventName = "coreui_playerlist_context_menu_action",
	description = "Counter for PlayerList contextual menu open / close / action activations.",
	backends = { "RobloxTelemetryCounter" },
	throttlingPercentage = PlayerListContextMenuTelemetryThrottleHundredthsPercent,
	lastUpdated = LastUpdated
}

return {
	logAction = function(Action, p1) --[[ Line: 43 ]]
		-- upvalues: TelemetryService (ref), config (copy), config1 (copy)
		local StandardizedFields = {
			"addPlaceId",
			"addUniverseId",
			"addSessionInfo",
			"addSessionId",
			"addPlaySessionId"
		}
		local CustomFields = { action = Action }
		
		if p1 ~= nil then
			if p1.isSelf ~= nil then
				CustomFields.is_self = tostring(p1.isSelf)
			end
			if p1.friendStatus ~= nil then
				CustomFields.friend_status = p1.friendStatus
			end
		end
		local config2 = {
			standardizedFields = StandardizedFields,
			customFields = CustomFields
		}
		TelemetryService:LogEvent(config, config2)
		TelemetryService:LogCounter(config1, config2, 1)
	end,
	_setServicesForTesting = function(p1) --[[ Line: 65 ]]
		-- upvalues: TelemetryService (ref)
		TelemetryService = p1
	end
}