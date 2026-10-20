local TelemetryService = game:GetService("TelemetryService")
local StandardizedFields = { "addOSInfo", "addSessionInfo", "addSessionId" }
local config = {
	eventName = "AdDisclosureMenuToggledCounter",
	description = "\t\tCounts the number of times the ad disclosure menu is toggled. \n\t\tCustom field \"isOpened\" indicates whether the menu was opened (true) or closed (false).\n\t",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 26, 1, 13 }
}
local config1 = {
	eventName = "AdDisclosureWhyThisAdToggledCounter",
	description = "\t\tCounts the number of times the \"Why This Ad\" modal is toggled. \n\t\tCustom field \"isOpened\" indicates whether the modal was opened (true) or closed (false).\n\t",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 26, 1, 13 }
}
local config2 = {
	eventName = "AdPreferencesLinkClickedCounter",
	description = "\t\tCounts the number of times the ad preferences link is clicked.\n\t",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 26, 1, 13 }
}

return {
	logAdDisclosureMenuToggled = function(IsOpened)
		-- upvalues: TelemetryService (copy), config (copy), StandardizedFields (copy)
		TelemetryService:LogCounter(config, {
			standardizedFields = StandardizedFields,
			customFields = { isOpened = IsOpened }
		}, 1)
	end,
	logAdDisclosureWhyThisAdToggled = function(IsOpened)
		-- upvalues: TelemetryService (copy), config1 (copy), StandardizedFields (copy)
		TelemetryService:LogCounter(config1, {
			standardizedFields = StandardizedFields,
			customFields = { isOpened = IsOpened }
		}, 1)
	end,
	logAdPreferencesLinkClicked = function()
		-- upvalues: TelemetryService (copy), config2 (copy), StandardizedFields (copy)
		TelemetryService:LogCounter(config2, {
			standardizedFields = StandardizedFields,
			customFields = {}
		}, 1)
	end
}