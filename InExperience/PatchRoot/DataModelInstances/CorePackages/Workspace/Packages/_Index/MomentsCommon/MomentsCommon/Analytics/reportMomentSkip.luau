local loggingProtocolModule = require(script:FindFirstAncestor("MomentsCommon").Parent.LoggingProtocol)
local t = {
	eventName = "MomentsAnalyticsSkip",
	throttlingPercentage = 10000,
	description = "Counts schema-targeted moment-scoped analytics events skipped because the raw feedItemId was absent. Dimensioned by surface/reason/entry.",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 2026, 9, 2 }
}

local function defaultEmit(p1, p2, p3)
	-- upvalues: loggingProtocolModule (ref)
	loggingProtocolModule.default:logRobloxTelemetryCounter(p1, p2, p3)
end

return function(p1, p2, p3, p4)
	-- upvalues: defaultEmit (ref), t (ref)
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