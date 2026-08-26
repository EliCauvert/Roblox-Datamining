local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local telemetryService = game:GetService("TelemetryService")
local telemetryServicePlaySessionInfoEnabledEngineFeature = game:GetEngineFeature("TelemetryServicePlaySessionInfoEnabled")
local t = {
	eventName = "topbar_toggled",
	description = "Event fired every time TopBar is toggled open/close in UI-less mode",
	links = "https://github.rbx.com/Roblox/proto-schemas/pull/6270",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("TopBarToggledThrottleHundredthsPercent", 0),
	lastUpdated = { 25, 6, 10 }
}

return function(p1)
	-- upvalues: telemetryServicePlaySessionInfoEnabledEngineFeature (ref), rbxAnalyticsService (ref), telemetryService (ref), t (ref)
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
		t_1 = { is_toggled_on = tostring(p1) }
	else
		list = { "addPlaceId", "addUniverseId", "addSessionInfo" }
		t_1 = {
			is_toggled_on = tostring(p1),
			playsessionid = rbxAnalyticsService:GetPlaySessionId()
		}
	end
	telemetryService:LogEvent(t, { standardizedFields = list, customFields = t_1 })
end