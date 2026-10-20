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
local config2 = {
	eventName = "gameJoinCardActionsResolve",
	links = "",
	description = "Milliseconds a visible join card waited on JoinUserActions. status is Ready or Failed. surface is mobile or desktop.",
	backends = { LoggingProtocolModule.TelemetryBackends.Stats },
	throttlingPercentage = game:DefineFastInt("GameJoinCardActionsResolveStatThrottleHundredthsPercent", 10000),
	lastUpdated = { 2026, 10, 5 }
}
local config3 = { Ready = true, Failed = true }

return {
	logBannerLoadResult = function(Status)
		-- upvalues: config1 (copy), LoggingProtocolModule (copy), config (copy)
		if config1[Status] then
			LoggingProtocolModule.default:logRobloxTelemetryCounter(config, nil, { status = Status })
			
			return
		end
	end,
	logActionsResolved = function(Value: number, Status, Surface)
		-- upvalues: config3 (copy), LoggingProtocolModule (copy), config2 (copy)
		if config3[Status] then
			LoggingProtocolModule.default:logRobloxTelemetryStat(config2, math.max(0, (math.floor(Value))), { status = Status, surface = Surface })
			
			return
		end
	end
}