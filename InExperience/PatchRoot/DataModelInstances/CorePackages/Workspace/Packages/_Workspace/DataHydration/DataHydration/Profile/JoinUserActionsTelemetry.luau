local loggingProtocolModule = require(script:FindFirstAncestor("DataHydration").Parent.LoggingProtocol)
local t = {
	eventName = "joinUserActionsFetch",
	description = "JoinUserActions request outcomes; status custom field is Success or Failed.",
	backends = { loggingProtocolModule.TelemetryBackends.Counter },
	throttlingPercentage = game:DefineFastInt("JoinUserActionsFetchCounterThrottleHundredthsPercent", 10000),
	lastUpdated = { 2026, 9, 30 }
}
local t_1 = { Success = true, Failed = true }

return {
	logFetchResult = function(p1)
		-- upvalues: t_1 (ref), loggingProtocolModule (ref), t (ref)
		if t_1[p1] then
			loggingProtocolModule.default:logRobloxTelemetryCounter(t, nil, { status = p1 })
			
			return
		end
	end
}