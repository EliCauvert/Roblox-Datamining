local loggingProtocolModule = require(script:FindFirstAncestor("GameJoinCard").Parent.LoggingProtocol)
local t = {
	eventName = "mobileGameJoinCardBannerLoad",
	description = "MobileGameJoinCard banner image resolution outcomes; status custom field is one of Success / NotFound / Fallback / Failed.",
	backends = { loggingProtocolModule.TelemetryBackends.Counter },
	throttlingPercentage = game:DefineFastInt("MobileGameJoinCardBannerLoadCounterThrottleHundredthsPercent", 10000),
	lastUpdated = { 2026, 5, 14 }
}
local t_1 = {
	Success = true,
	NotFound = true,
	Fallback = true,
	Failed = true
}

local function logBannerLoadResult(p1)
	-- upvalues: t_1 (ref), loggingProtocolModule (ref), t (ref)
	if t_1[p1] then
		loggingProtocolModule.default:logRobloxTelemetryCounter(t, nil, { status = p1 })
		
		return
	end
end

local t_2 = {
	eventName = "gameJoinCardActionsResolve",
	links = "",
	description = "Milliseconds a visible join card waited on JoinUserActions. status is Ready or Failed. surface is mobile or desktop.",
	backends = { loggingProtocolModule.TelemetryBackends.Stats },
	throttlingPercentage = game:DefineFastInt("GameJoinCardActionsResolveStatThrottleHundredthsPercent", 10000),
	lastUpdated = { 2026, 10, 5 }
}
local t_3 = { Ready = true, Failed = true }

return {
	logBannerLoadResult = logBannerLoadResult,
	logActionsResolved = function(p1, p2, p3)
		-- upvalues: t_3 (ref), loggingProtocolModule (ref), t_2 (ref)
		if t_3[p2] then
			loggingProtocolModule.default:logRobloxTelemetryStat(t_2, math.max(0, math.floor(p1)), { status = p2, surface = p3 })
			
			return
		end
	end
}