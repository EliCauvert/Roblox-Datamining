local telemetryService = game:GetService("TelemetryService")
local list = { "addOSInfo", "addSessionInfo", "addSessionId" }
local t = {
	eventName = "AdDisclosureMenuToggledCounter",
	description = "\t\tCounts the number of times the ad disclosure menu is toggled. \n\t\tCustom field \"isOpened\" indicates whether the menu was opened (true) or closed (false).\n\t",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 26, 1, 13 }
}
local t_1 = {
	eventName = "AdDisclosureWhyThisAdToggledCounter",
	description = "\t\tCounts the number of times the \"Why This Ad\" modal is toggled. \n\t\tCustom field \"isOpened\" indicates whether the modal was opened (true) or closed (false).\n\t",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 26, 1, 13 }
}
local t_2 = {
	eventName = "AdPreferencesLinkClickedCounter",
	description = "\t\tCounts the number of times the ad preferences link is clicked.\n\t",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 26, 1, 13 }
}

return {
	logAdDisclosureMenuToggled = function(p1)
		-- upvalues: telemetryService (ref), t (ref), list (ref)
		telemetryService:LogCounter(t, {
			standardizedFields = list,
			customFields = { isOpened = p1 }
		}, 1)
	end,
	logAdDisclosureWhyThisAdToggled = function(p1)
		-- upvalues: telemetryService (ref), t_1 (ref), list (ref)
		telemetryService:LogCounter(t_1, {
			standardizedFields = list,
			customFields = { isOpened = p1 }
		}, 1)
	end,
	logAdPreferencesLinkClicked = function()
		-- upvalues: telemetryService (ref), t_2 (ref), list (ref)
		telemetryService:LogCounter(t_2, { standardizedFields = list, customFields = {} }, 1)
	end
}