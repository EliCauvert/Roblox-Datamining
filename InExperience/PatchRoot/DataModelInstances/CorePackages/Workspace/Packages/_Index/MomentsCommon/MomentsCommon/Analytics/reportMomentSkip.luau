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

local function defaultEmit(p0, p1, p2)
	-- upvalues: loggingProtocolModule (ref)
	loggingProtocolModule.default:logRobloxTelemetryCounter(p0, p1, p2)
end

return function(p3, p4, p5, p6)
	-- upvalues: getFFlagMomentsAnalyticsSchemaIdentityModule (ref), defaultEmit (ref), t (ref)
	if not getFFlagMomentsAnalyticsSchemaIdentityModule() then return end
	local t_1 = { surface = p3, reason = p4 }
	
	if p5 then
		if p5.entry ~= nil then
			t_1.entry = p5.entry
		end
		if p5.action ~= nil then
			t_1.action = p5.action
		end
		if p5.parentEntity ~= nil then
			t_1.parentEntity = p5.parentEntity
		end
	end;
	(p6 or defaultEmit)(t, 1, t_1)
end