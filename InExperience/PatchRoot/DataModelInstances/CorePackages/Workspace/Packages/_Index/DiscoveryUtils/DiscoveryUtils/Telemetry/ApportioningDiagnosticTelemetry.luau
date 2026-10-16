local TelemetryService = game:GetService("TelemetryService")
local CryoModule = require(script:FindFirstAncestor("DiscoveryUtils").Parent.Cryo)
local config = {
	eventName = "NxmApportioningDiagnostic",
	description = "Diagnostic events for the NxM apportioning dry-run",
	lastUpdated = { 26, 7, 7 },
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("LuaAppNxMApportioningDiagnosticThrottleHundredthsPercent", 0)
}
local StandardizedFields = { "addOSInfo", "addSessionInfo", "addSessionId" }

return {
	log = function(EventKind, p1) --[[ Line: 33 ]]
		-- upvalues: CryoModule (copy), TelemetryService (copy), config (copy), StandardizedFields (copy)
		TelemetryService:LogEvent(config, {
			standardizedFields = StandardizedFields,
			customFields = CryoModule.Dictionary.join(p1 or {}, { eventKind = EventKind })
		})
	end
}