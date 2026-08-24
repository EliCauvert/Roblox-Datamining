local telemetryService = game:GetService("TelemetryService")
local switchServerTelemetryThrottleHundrethsPercent = game:DefineFastInt("SwitchServerTelemetryThrottleHundrethsPercent", 10000)
local t = {
	SwitchServerButtonActions = {
		eventName = "coreui_switch_server_button_actions",
		description = "Event fired every time the User engages with the People tab switch server button",
		links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/4906123766/Switch+Server+Tech+Spec",
		backends = { "EventIngest" },
		throttlingPercentage = switchServerTelemetryThrottleHundrethsPercent,
		lastUpdated = { 7, 15, 26 }
	},
	SwitchServerConfirmationActions = {
		eventName = "coreui_switch_server_confirmation_actions",
		description = "Event fired every time the User engages with the switch server confirmation screen",
		links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/4906123766/Switch+Server+Tech+Spec",
		backends = { "EventIngest" },
		throttlingPercentage = switchServerTelemetryThrottleHundrethsPercent,
		lastUpdated = { 7, 15, 26 }
	}
}
local _ = {
	placeId = "addPlaceId",
	universeId = "addUniverseId",
	playsessionId = "addPlaySessionId",
	sessionInfo = "addSessionInfo"
}
local t_1 = {}
t_1.__index = t_1

function t_1.sendSwitchServerButtonActions(p0)
	-- upvalues: telemetryService (ref), t (ref)
	telemetryService:LogEvent(t.SwitchServerButtonActions, {
		standardizedFields = {
			"addPlaceId",
			"addUniverseId",
			"addPlaySessionId",
			"addSessionInfo"
		},
		customFields = p0
	})
end

function t_1.sendSwitchServerConfirmationActions(p1)
	-- upvalues: telemetryService (ref), t (ref)
	telemetryService:LogEvent(t.SwitchServerConfirmationActions, {
		standardizedFields = {
			"addPlaceId",
			"addUniverseId",
			"addPlaySessionId",
			"addSessionInfo"
		},
		customFields = p1
	})
end

return t_1