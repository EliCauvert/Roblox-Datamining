local telemetryService = game:GetService("TelemetryService")
local cryoModule = require(script:FindFirstAncestor("DiscoveryUtils").Parent.Cryo)
local updateDiscoveryEventErrorDetailsLogging = game:DefineFastFlag("UpdateDiscoveryEventErrorDetailsLogging", false)
local t = {
	eventName = "DiscoveryEventErrorLogger_ErrorDetails",
	description = "Error messages related to discovery events",
	links = "https://roblox.atlassian.net/browse/CLIGROW-2890",
	lastUpdated = { 25, 10, 14 },
	backends = {
		"Points",
		if updateDiscoveryEventErrorDetailsLogging then "EventIngest" else nil
	},
	throttlingPercentage = game:DefineFastInt("DiscoveryEventErrorDetailsHundredthsPercent", 0)
}
local t_1 = {
	eventName = "DiscoveryEventErrorLogger_ErrorCounter",
	description = "Counter related to discovery event errors",
	links = "https://roblox.atlassian.net/browse/CLIGROW-2890",
	lastUpdated = { 25, 10, 14 },
	backends = { "RobloxTelemetryCounter" }
}

return {
	reportError = function(p0, p1, p2)
		-- upvalues: telemetryService (ref), t_1 (ref), t (ref), updateDiscoveryEventErrorDetailsLogging (ref), cryoModule (ref)
		if not _G.__TESTEZ_RUNNING_TEST__ then
			warn(`[DiscoveryEventErrorLogger]\nError Type: {p0}\nError Message: {p1}`)
		end
		telemetryService:LogCounter(t_1, { customFields = { errorType = p0 } }, 1)
		telemetryService:LogEvent(t, {
			standardizedFields = if updateDiscoveryEventErrorDetailsLogging then { "addSessionInfo" } else nil,
			customFields = cryoModule.Dictionary.join(p2 or {}, { errorType = p0, errorMessage = p1 })
		})
	end
}