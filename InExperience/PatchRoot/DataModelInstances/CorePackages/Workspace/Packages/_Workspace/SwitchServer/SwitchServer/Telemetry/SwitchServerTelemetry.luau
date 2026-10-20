local TelemetryService = game:GetService("TelemetryService")
local SwitchServerTelemetryThrottleHundrethsPercent = game:DefineFastInt("SwitchServerTelemetryThrottleHundrethsPercent", 10000)
local config = {
	SwitchServerButtonActions = {
		eventName = "coreui_switch_server_button_actions",
		description = "Event fired every time the User engages with the People tab switch server button",
		links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/4906123766/Switch+Server+Tech+Spec",
		backends = { "EventIngest" },
		throttlingPercentage = SwitchServerTelemetryThrottleHundrethsPercent,
		lastUpdated = { 7, 15, 26 }
	},
	SwitchServerConfirmationActions = {
		eventName = "coreui_switch_server_confirmation_actions",
		description = "Event fired every time the User engages with the switch server confirmation screen",
		links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/4906123766/Switch+Server+Tech+Spec",
		backends = { "EventIngest" },
		throttlingPercentage = SwitchServerTelemetryThrottleHundrethsPercent,
		lastUpdated = { 7, 15, 26 }
	}
}
local SwitchServerTelemetryModule = {}
SwitchServerTelemetryModule.__index = SwitchServerTelemetryModule

function SwitchServerTelemetryModule.sendSwitchServerButtonActions(CustomFields)
	-- upvalues: TelemetryService (copy), config (copy)
	TelemetryService:LogEvent(config.SwitchServerButtonActions, {
		standardizedFields = {
			"addPlaceId",
			"addUniverseId",
			"addPlaySessionId",
			"addSessionInfo"
		},
		customFields = CustomFields
	})
end

function SwitchServerTelemetryModule.sendSwitchServerConfirmationActions(CustomFields)
	-- upvalues: TelemetryService (copy), config (copy)
	TelemetryService:LogEvent(config.SwitchServerConfirmationActions, {
		standardizedFields = {
			"addPlaceId",
			"addUniverseId",
			"addPlaySessionId",
			"addSessionInfo"
		},
		customFields = CustomFields
	})
end

return SwitchServerTelemetryModule