local telemetryService = game:GetService("TelemetryService")
local cryoModule = require(script:FindFirstAncestor("DiscoveryUtils").Parent.Cryo)
local t = {
	eventName = "NxmApportioningDiagnostic",
	description = "Diagnostic events for the NxM apportioning dry-run",
	lastUpdated = { 26, 7, 7 },
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("LuaAppNxMApportioningDiagnosticThrottleHundredthsPercent", 0)
}
local list = { "addOSInfo", "addSessionInfo", "addSessionId" }

return {
	log = function(p1, p2)
		-- upvalues: cryoModule (ref), telemetryService (ref), t (ref), list (ref)
		telemetryService:LogEvent(t, {
			standardizedFields = list,
			customFields = cryoModule.Dictionary.join(p2 or {}, { eventKind = p1 })
		})
	end
}