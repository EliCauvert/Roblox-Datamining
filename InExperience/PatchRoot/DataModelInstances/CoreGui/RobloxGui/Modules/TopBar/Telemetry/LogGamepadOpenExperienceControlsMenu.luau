local telemetryService = game:GetService("TelemetryService")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local fFlagLoggingGamepadOpenExpControlsMenuModule = require(script.Parent.Parent.Flags.FFlagLoggingGamepadOpenExpControlsMenu)
local telemetryServicePlaySessionInfoEnabledEngineFeature = game:GetEngineFeature("TelemetryServicePlaySessionInfoEnabled")
local t = {
	eventName = "coreui_gamepad_toggle_exp_controls",
	description = "Event fired from the client every time Experience Controls Menu is toggled open/closed",
	links = "https://github.rbx.com/Roblox/proto-schemas/pull/5750",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("GamepadOpenExperienceControlsMenuThrottleHundrethsPercent", 0),
	lastUpdated = { 25, 4, 25 }
}

return function(p0)
	-- upvalues: fFlagLoggingGamepadOpenExpControlsMenuModule (ref), telemetryServicePlaySessionInfoEnabledEngineFeature (ref), rbxAnalyticsService (ref), telemetryService (ref), t (ref)
	if not fFlagLoggingGamepadOpenExpControlsMenuModule then return end
	local list, t_1
	local _ = nil
	local _ = nil
	
	if telemetryServicePlaySessionInfoEnabledEngineFeature then
		list = {
			"addPlaceId",
			"addUniverseId",
			"addPlaySessionId",
			"addSessionInfo"
		}
		t_1 = { is_toggle_open = tostring(p0) }
	else
		list = { "addPlaceId", "addUniverseId", "addSessionInfo" }
		t_1 = {
			is_toggle_open = tostring(p0),
			playsessionid = rbxAnalyticsService:GetPlaySessionId()
		}
	end
	telemetryService:LogEvent(t, { standardizedFields = list, customFields = t_1 })
end