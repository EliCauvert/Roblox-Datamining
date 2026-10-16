local TelemetryService = game:GetService("TelemetryService")
local CryoModule = require(script:FindFirstAncestor("DiscoveryUtils").Parent.Cryo)
local UpdateDiscoveryEventErrorDetailsLogging = game:DefineFastFlag("UpdateDiscoveryEventErrorDetailsLogging", false)
local config = {
	eventName = "DiscoveryEventErrorLogger_ErrorDetails",
	description = "Error messages related to discovery events",
	links = "https://roblox.atlassian.net/browse/CLIGROW-2890",
	lastUpdated = { 25, 10, 14 },
	backends = {
		"Points",
		if UpdateDiscoveryEventErrorDetailsLogging then "EventIngest" else nil
	},
	throttlingPercentage = game:DefineFastInt("DiscoveryEventErrorDetailsHundredthsPercent", 0)
}
local config1 = {
	eventName = "DiscoveryEventErrorLogger_ErrorCounter",
	description = "Counter related to discovery event errors",
	links = "https://roblox.atlassian.net/browse/CLIGROW-2890",
	lastUpdated = { 25, 10, 14 },
	backends = { "RobloxTelemetryCounter" }
}

return {
	reportError = function(ErrorType, ErrorMessage, p1) --[[ Line: 33 ]]
		-- upvalues: TelemetryService (copy), config1 (copy), config (copy), UpdateDiscoveryEventErrorDetailsLogging (copy), CryoModule (copy)
		if not _G.__TESTEZ_RUNNING_TEST__ then
			warn(`[DiscoveryEventErrorLogger]\nError Type: {ErrorType}\nError Message: {ErrorMessage}`)
		end
		TelemetryService:LogCounter(config1, { customFields = { errorType = ErrorType } }, 1)
		TelemetryService:LogEvent(config, {
			standardizedFields = if UpdateDiscoveryEventErrorDetailsLogging then { "addSessionInfo" } else nil,
			customFields = CryoModule.Dictionary.join(p1 or {}, { errorType = ErrorType, errorMessage = ErrorMessage })
		})
	end
}