local LoggingProtocolModule = require(script:FindFirstAncestor("DataHydration").Parent.LoggingProtocol)
local config = {
	eventName = "joinUserActionsFetch",
	description = "JoinUserActions request outcomes; status custom field is Success or Failed.",
	backends = { LoggingProtocolModule.TelemetryBackends.Counter },
	throttlingPercentage = game:DefineFastInt("JoinUserActionsFetchCounterThrottleHundredthsPercent", 10000),
	lastUpdated = { 2026, 9, 30 }
}
local config1 = { Success = true, Failed = true }

return {
	logFetchResult = function(Status)
		-- upvalues: config1 (copy), LoggingProtocolModule (copy), config (copy)
		if config1[Status] then
			LoggingProtocolModule.default:logRobloxTelemetryCounter(config, nil, { status = Status })
			
			return
		end
	end
}