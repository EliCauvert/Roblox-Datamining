local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local telemetryService = game:GetService("TelemetryService")
local telemetryServicePlaySessionInfoEnabledEngineFeature = game:GetEngineFeature("TelemetryServicePlaySessionInfoEnabled")

return {
	sendEventToTelemetryV2 = function(p1)
		-- upvalues: telemetryServicePlaySessionInfoEnabledEngineFeature (ref), rbxAnalyticsService (ref), telemetryService (ref)
		local t = {
			eventName = "coreui_vr_bottom_bar_action",
			description = "Event fired from the client every time VRBottomBar buttons are clicked",
			links = "https://github.rbx.com/Roblox/proto-schemas/pull/5803",
			backends = { "EventIngest" },
			throttlingPercentage = game:DefineFastInt("VRBottomBarActionEventThrottleHunderedthsPercent", 0),
			lastUpdated = { 2025, 5, 12 }
		}
		local list = { "addPlaceId", "addUniverseId", "addSessionInfo" }
		local t_1 = {
			integration_id = p1.integrationId,
			is_toggle_on = tostring(p1.isToggleOn),
			source = p1.source
		}
		
		if telemetryServicePlaySessionInfoEnabledEngineFeature then
			table.insert(list, "addPlaySessionId")
		else
			t_1.playsessionid = rbxAnalyticsService:GetPlaySessionId()
		end
		telemetryService:LogEvent(t, { standardizedFields = list, customFields = t_1 })
	end
}