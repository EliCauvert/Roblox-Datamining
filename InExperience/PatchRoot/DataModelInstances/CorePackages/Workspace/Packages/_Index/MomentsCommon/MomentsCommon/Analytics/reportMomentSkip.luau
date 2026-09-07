local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local loggingProtocolModule = require(momentsCommon.Parent.LoggingProtocol)
local getFFlagMomentsAnalyticsSchemaIdentityModule = require(momentsCommon.Flags.GetFFlagMomentsAnalyticsSchemaIdentity)
local t = {
	eventName = "MomentsAnalyticsSkip",
	throttlingPercentage = 10000,
	description = "Counts schema-targeted moment-scoped analytics events SKIPPED because the raw feedItemId was absent (FFlagMomentsAnalyticsSchemaIdentity). Dimensioned by surface/reason/entry; the flag-B ramp gate watches this before enabling the flag broadly.",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 2026, 7, 7 }
}

local function defaultEmit(p1, p2, p3)
	-- upvalues: loggingProtocolModule (ref)
	loggingProtocolModule.default:logRobloxTelemetryCounter(p1, p2, p3)
end

return function(p1, p2, p3, p4)
	-- upvalues: getFFlagMomentsAnalyticsSchemaIdentityModule (ref), defaultEmit (ref), t (ref)
	if not getFFlagMomentsAnalyticsSchemaIdentityModule() then return end
	local t_1 = { surface = p1, reason = p2 }
	
	if p3 then
		if p3.entry ~= nil then
			t_1.entry = p3.entry
		end
		if p3.action ~= nil then
			t_1.action = p3.action
		end
		if p3.parentEntity ~= nil then
			t_1.parentEntity = p3.parentEntity
		end
	end;
	(p4 or defaultEmit)(t, 1, t_1)
end