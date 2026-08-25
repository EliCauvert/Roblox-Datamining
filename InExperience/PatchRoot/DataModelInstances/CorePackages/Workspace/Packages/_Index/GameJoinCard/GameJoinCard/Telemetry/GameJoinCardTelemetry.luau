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

return {
	logBannerLoadResult = function(p0)
		-- upvalues: t_1 (ref), loggingProtocolModule (ref), t (ref)
		if t_1[p0] then
			loggingProtocolModule.default:logRobloxTelemetryCounter(t, nil, { status = p0 })
			
			return
		end
	end
}