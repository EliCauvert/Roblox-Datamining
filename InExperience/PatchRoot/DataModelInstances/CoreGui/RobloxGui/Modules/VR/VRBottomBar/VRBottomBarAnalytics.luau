local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local TelemetryService = game:GetService("TelemetryService")
local TelemetryServicePlaySessionInfoEnabledEngineFeature = game:GetEngineFeature("TelemetryServicePlaySessionInfoEnabled")

return {
	sendEventToTelemetryV2 = function(p1) --[[ Line: 12 ]]
		-- upvalues: TelemetryServicePlaySessionInfoEnabledEngineFeature (copy), RbxAnalyticsService (copy), TelemetryService (copy)
		local config = {
			eventName = "coreui_vr_bottom_bar_action",
			description = "Event fired from the client every time VRBottomBar buttons are clicked",
			links = "https://github.rbx.com/Roblox/proto-schemas/pull/5803",
			backends = { "EventIngest" },
			throttlingPercentage = game:DefineFastInt("VRBottomBarActionEventThrottleHunderedthsPercent", 0),
			lastUpdated = { 2025, 5, 12 }
		}
		local StandardizedFields = { "addPlaceId", "addUniverseId", "addSessionInfo" }
		local CustomFields = {
			integration_id = p1.integrationId,
			is_toggle_on = tostring(p1.isToggleOn),
			source = p1.source
		}
		
		if TelemetryServicePlaySessionInfoEnabledEngineFeature then
			table.insert(StandardizedFields, "addPlaySessionId")
		else
			CustomFields.playsessionid = RbxAnalyticsService:GetPlaySessionId()
		end
		TelemetryService:LogEvent(config, {
			standardizedFields = StandardizedFields,
			customFields = CustomFields
		})
	end
}