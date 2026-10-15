local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local runService = game:GetService("RunService")
local telemetryService = game:GetService("TelemetryService")
local t = {
	eventName = "SlimTintModeSelected",
	throttlingPercentage = 10000,
	description = "\t\tSLIM tint mode selected by a user. Shared by the Developer Console Debug Visualizations tab\n\t\t(ui = \"DevConsole\") and the Studio Visualization Modes plugin (ui = \"VisualizationModes\").\n\t\tThe app field is \"Studio\" or \"Player\", since the Developer Console runs in both.\n\t",
	backends = { "Points", "EventIngest" },
	lastUpdated = { 2026, 10, 13 }
}

return {
	logSlimTintModeSelected = function(p1)
		-- upvalues: runService (ref), rbxAnalyticsService (ref), telemetryService (ref), t (ref)
		if p1.Name == "None" then
			return
		end
		telemetryService:LogEvent(t, {
			customFields = {
				ui = "DevConsole",
				tintMode = p1.Name,
				app = if runService:IsStudio() then "Studio" else "Player",
				clientId = rbxAnalyticsService:GetClientId()
			}
		})
	end
}