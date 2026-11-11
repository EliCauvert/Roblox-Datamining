local TelemetryService = game:GetService("TelemetryService")
local Parent = script.Parent.Parent
local ReactGlobalsModule = require(Parent.ReactGlobals)
local v1 = require(Parent.SafeFlags).createGetFFlag("ReactTelemetryEnabled", false)()

return function(p1)
	-- upvalues: v1 (copy), TelemetryService (copy), ReactGlobalsModule (copy)
	if not v1 then return end
	local Success, Result = pcall(TelemetryService.LogCounter, TelemetryService, {
		eventName = p1.eventName,
		backends = { "RobloxTelemetryCounter" },
		lastUpdated = p1.lastUpdated,
		description = p1.description,
		links = p1.links
	}, { customFields = p1.customFields or {} }, p1.value)
	
	if ReactGlobalsModule.__DEV__ and not Success then
		warn(`React telemetry collection is enabled but log failed: {Result}`)
	end
end