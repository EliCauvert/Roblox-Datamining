local TelemetryService = game:GetService("TelemetryService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local FFlagLoggingGamepadOpenExpControlsMenuModule = require(script.Parent.Parent.Flags.FFlagLoggingGamepadOpenExpControlsMenu)
local TelemetryServicePlaySessionInfoEnabledEngineFeature = game:GetEngineFeature("TelemetryServicePlaySessionInfoEnabled")
local config = {
	eventName = "coreui_gamepad_toggle_exp_controls",
	description = "Event fired from the client every time Experience Controls Menu is toggled open/closed",
	links = "https://github.rbx.com/Roblox/proto-schemas/pull/5750",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("GamepadOpenExperienceControlsMenuThrottleHundrethsPercent", 0),
	lastUpdated = { 25, 4, 25 }
}

return function(p1)
	-- upvalues: FFlagLoggingGamepadOpenExpControlsMenuModule (copy), TelemetryServicePlaySessionInfoEnabledEngineFeature (copy), RbxAnalyticsService (copy), TelemetryService (copy), config (copy)
	if not FFlagLoggingGamepadOpenExpControlsMenuModule then return end
	local StandardizedFields = nil
	local CustomFields = nil
	if TelemetryServicePlaySessionInfoEnabledEngineFeature then
		StandardizedFields = {
			"addPlaceId",
			"addUniverseId",
			"addPlaySessionId",
			"addSessionInfo"
		}
		CustomFields = { is_toggle_open = tostring(p1) }
	else
		StandardizedFields = { "addPlaceId", "addUniverseId", "addSessionInfo" }
		CustomFields = {
			is_toggle_open = tostring(p1),
			playsessionid = RbxAnalyticsService:GetPlaySessionId()
		}
	end
	TelemetryService:LogEvent(config, {
		standardizedFields = StandardizedFields,
		customFields = CustomFields
	})
end