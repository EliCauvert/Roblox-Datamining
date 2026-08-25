local telemetryService = game:GetService("TelemetryService")
local list = {
	"addPlaceId",
	"addUniverseId",
	"addSessionId",
	"addOSInfo",
	"addSessionInfo"
}
local list_1 = { "addPlaceId", "addUniverseId", "addOSInfo" }
local t = {
	eventName = "InExperienceClickoutToggled",
	description = "        This is fired when the in-experience clickout webview is opened or closed.\n\t\thttps://github.rbx.com/Roblox/proto-schemas/pull/9488\n    ",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("InExperienceClickoutToggledTelemetryThrottleHundredthsPercent", 0),
	lastUpdated = { 26, 1, 28 }
}
local t_1 = {
	eventName = "InExperienceClickoutToggledCounter",
	description = "\t\tCounter for InExperienceClickoutToggled events.\n\t",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 26, 1, 28 }
}

return {
	logWebviewToggled = function(p0, p1, p2)
		-- upvalues: telemetryService (ref), t (ref), list (ref), t_1 (ref), list_1 (ref)
		telemetryService:LogEvent(t, {
			standardizedFields = list,
			customFields = { is_opened = tostring(p0), flow_id = p1, target_url = p2 }
		})
		telemetryService:LogCounter(t_1, {
			standardizedFields = list_1,
			customFields = { is_opened = tostring(p0) }
		}, 1)
	end
}