local LoggingProtocolModule = require(script:FindFirstAncestor("GameJoinCard").Parent.LoggingProtocol)
local config = {
	eventName = "mobileGameJoinCardBannerLoad",
	description = "MobileGameJoinCard banner image resolution outcomes; status custom field is one of Success / NotFound / Fallback / Failed.",
	backends = { LoggingProtocolModule.TelemetryBackends.Counter },
	throttlingPercentage = game:DefineFastInt("MobileGameJoinCardBannerLoadCounterThrottleHundredthsPercent", 10000),
	lastUpdated = { 2026, 5, 14 }
}
local config1 = {
	Success = true,
	NotFound = true,
	Fallback = true,
	Failed = true
}

return {
	logBannerLoadResult = function(Status)
		-- upvalues: config1 (copy), LoggingProtocolModule (copy), config (copy)
		if config1[Status] then
			LoggingProtocolModule.default:logRobloxTelemetryCounter(config, nil, { status = Status })
			
			return
		end
	end
}