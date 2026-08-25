local telemetryService = game:GetService("TelemetryService")
local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local var1 = require(parent.SafeFlags).createGetFFlag("ReactTelemetryEnabled", false)()

return function(p1)
	-- upvalues: var1 (ref), telemetryService (ref), reactGlobalsModule (ref)
	if not var1 then return end
	local ok, status = pcall(telemetryService.LogCounter, telemetryService, {
		eventName = p1.eventName,
		backends = { "RobloxTelemetryCounter" },
		lastUpdated = p1.lastUpdated,
		description = p1.description,
		links = p1.links
	}, { customFields = p1.customFields or {} }, p1.value)
	
	if reactGlobalsModule.__DEV__ and not ok then
		warn(`React telemetry collection is enabled but log failed: {status}`)
	end
end