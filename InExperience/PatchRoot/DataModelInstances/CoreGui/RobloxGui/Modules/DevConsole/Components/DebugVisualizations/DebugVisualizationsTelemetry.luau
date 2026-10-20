local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local RunService = game:GetService("RunService")
local TelemetryService = game:GetService("TelemetryService")
local config = {
	eventName = "SlimTintModeSelected",
	throttlingPercentage = 10000,
	description = "\t\tSLIM tint mode selected by a user. Shared by the Developer Console Debug Visualizations tab\n\t\t(ui = \"DevConsole\") and the Studio Visualization Modes plugin (ui = \"VisualizationModes\").\n\t\tThe app field is \"Studio\" or \"Player\", since the Developer Console runs in both.\n\t",
	backends = { "Points", "EventIngest" },
	lastUpdated = { 2026, 10, 13 }
}

return {
	logSlimTintModeSelected = function(p1)
		-- upvalues: RunService (copy), RbxAnalyticsService (copy), TelemetryService (copy), config (copy)
		if p1.Name ~= "None" then
			TelemetryService:LogEvent(config, {
				customFields = {
					ui = "DevConsole",
					tintMode = p1.Name,
					app = if RunService:IsStudio() then "Studio" else "Player",
					clientId = RbxAnalyticsService:GetClientId()
				}
			})
			
			return
		end
	end
}