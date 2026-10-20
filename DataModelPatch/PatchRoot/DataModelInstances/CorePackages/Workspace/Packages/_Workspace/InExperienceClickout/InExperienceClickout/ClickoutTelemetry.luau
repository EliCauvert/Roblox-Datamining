local TelemetryService = game:GetService("TelemetryService")
local StandardizedFields = {
	"addPlaceId",
	"addUniverseId",
	"addSessionId",
	"addOSInfo",
	"addSessionInfo"
}
local StandardizedFields1 = { "addPlaceId", "addUniverseId", "addOSInfo" }
local config = {
	eventName = "InExperienceClickoutToggled",
	description = "        This is fired when the in-experience clickout webview is opened or closed.\n\t\thttps://github.rbx.com/Roblox/proto-schemas/pull/9488\n    ",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("InExperienceClickoutToggledTelemetryThrottleHundredthsPercent", 0),
	lastUpdated = { 26, 1, 28 }
}
local config1 = {
	eventName = "InExperienceClickoutToggledCounter",
	description = "\t\tCounter for InExperienceClickoutToggled events.\n\t",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 26, 1, 28 }
}

return {
	logWebviewToggled = function(p1, Flow_id, Target_url)
		-- upvalues: TelemetryService (copy), config (copy), StandardizedFields (copy), config1 (copy), StandardizedFields1 (copy)
		TelemetryService:LogEvent(config, {
			standardizedFields = StandardizedFields,
			customFields = {
				is_opened = tostring(p1),
				flow_id = Flow_id,
				target_url = Target_url
			}
		})
		TelemetryService:LogCounter(config1, {
			standardizedFields = StandardizedFields1,
			customFields = { is_opened = tostring(p1) }
		}, 1)
	end
}