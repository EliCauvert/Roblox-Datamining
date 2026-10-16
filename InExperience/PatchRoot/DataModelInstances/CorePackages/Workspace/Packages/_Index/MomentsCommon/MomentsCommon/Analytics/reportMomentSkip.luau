local LoggingProtocolModule = require(script:FindFirstAncestor("MomentsCommon").Parent.LoggingProtocol)
local config = {
	eventName = "MomentsAnalyticsSkip",
	throttlingPercentage = 10000,
	description = "Counts schema-targeted moment-scoped analytics events skipped because the raw feedItemId was absent. Dimensioned by surface/reason/entry.",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 2026, 9, 2 }
}

local function defaultEmit(p1, p2, p3) --[[ Line: 62 ]]
	-- upvalues: LoggingProtocolModule (copy)
	LoggingProtocolModule.default:logRobloxTelemetryCounter(p1, p2, p3)
end

return function(Surface, Reason, p1, p2) --[[ Line: 76 | Named "reportMomentSkip" ]]
	-- upvalues: defaultEmit (copy), config (copy)
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