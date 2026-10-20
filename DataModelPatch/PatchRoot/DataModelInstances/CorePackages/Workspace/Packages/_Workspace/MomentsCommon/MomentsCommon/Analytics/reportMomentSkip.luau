local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local LoggingProtocolModule = require(MomentsCommon.Parent.LoggingProtocol)
local GetFFlagMomentsAnalyticsSchemaIdentityModule = require(MomentsCommon.Flags.GetFFlagMomentsAnalyticsSchemaIdentity)
local config = {
	eventName = "MomentsAnalyticsSkip",
	throttlingPercentage = 10000,
	description = "Counts schema-targeted moment-scoped analytics events SKIPPED because the raw feedItemId was absent (FFlagMomentsAnalyticsSchemaIdentity). Dimensioned by surface/reason/entry; the flag-B ramp gate watches this before enabling the flag broadly.",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 2026, 7, 7 }
}

local function defaultEmit(p1, p2, p3)
	-- upvalues: LoggingProtocolModule (copy)
	LoggingProtocolModule.default:logRobloxTelemetryCounter(p1, p2, p3)
end

return function(Surface, Reason, p1, p2)
	-- upvalues: GetFFlagMomentsAnalyticsSchemaIdentityModule (copy), defaultEmit (copy), config (copy)
	if not GetFFlagMomentsAnalyticsSchemaIdentityModule() then return end
	local config1 = { surface = Surface, reason = Reason }
	
	if p1 then
		if p1.entry ~= nil then
			config1.entry = p1.entry
		end
		if p1.action ~= nil then
			config1.action = p1.action
		end
		if p1.parentEntity ~= nil then
			config1.parentEntity = p1.parentEntity
		end
	end;
	(p2 or defaultEmit)(config, 1, config1)
end