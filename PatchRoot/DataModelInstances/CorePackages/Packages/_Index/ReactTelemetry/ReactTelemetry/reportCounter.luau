-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:38 2026 Pacific Standard Time.

local telemetryService = game:GetService("TelemetryService")
local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local var2 = require(parent.SafeFlags).createGetFFlag("ReactTelemetryEnabled", false)()

return function(p0) --[[ line: 19 | named "reportCounter" ]]
	-- upvalues: var2 (ref), telemetryService (ref), reactGlobalsModule (ref)
	if not var2 then return end
	local ok, status = pcall(telemetryService.LogCounter, telemetryService, {
		eventName = p0.eventName,
		backends = { "RobloxTelemetryCounter" },
		lastUpdated = p0.lastUpdated,
		description = p0.description,
		links = p0.links
	}, { customFields = p0.customFields or {} }, p0.value)
	
	if reactGlobalsModule.__DEV__ and not ok then
		warn(`React telemetry collection is enabled but log failed: {status}`)
	end
end