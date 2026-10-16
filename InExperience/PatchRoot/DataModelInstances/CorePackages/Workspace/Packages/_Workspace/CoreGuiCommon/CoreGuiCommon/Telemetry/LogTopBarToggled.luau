local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local TelemetryService = game:GetService("TelemetryService")
local TelemetryServicePlaySessionInfoEnabledEngineFeature = game:GetEngineFeature("TelemetryServicePlaySessionInfoEnabled")
local config = {
	eventName = "topbar_toggled",
	description = "Event fired every time TopBar is toggled open/close in UI-less mode",
	links = "https://github.rbx.com/Roblox/proto-schemas/pull/6270",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("TopBarToggledThrottleHundredthsPercent", 0),
	lastUpdated = { 25, 6, 10 }
}

return function(p1) --[[ Line: 22 ]]
	-- upvalues: TelemetryServicePlaySessionInfoEnabledEngineFeature (copy), RbxAnalyticsService (copy), TelemetryService (copy), config (copy)
	local StandardizedFields = nil
	local CustomFields = nil
	if TelemetryServicePlaySessionInfoEnabledEngineFeature then
		StandardizedFields = {
			"addPlaceId",
			"addUniverseId",
			"addPlaySessionId",
			"addSessionInfo"
		}
		CustomFields = { is_toggled_on = tostring(p1) }
	else
		StandardizedFields = { "addPlaceId", "addUniverseId", "addSessionInfo" }
		CustomFields = {
			is_toggled_on = tostring(p1),
			playsessionid = RbxAnalyticsService:GetPlaySessionId()
		}
	end
	TelemetryService:LogEvent(config, {
		standardizedFields = StandardizedFields,
		customFields = CustomFields
	})
end