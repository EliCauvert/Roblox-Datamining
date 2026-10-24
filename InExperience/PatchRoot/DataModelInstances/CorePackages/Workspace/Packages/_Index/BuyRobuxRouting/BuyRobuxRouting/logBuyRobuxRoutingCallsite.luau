local LoggingProtocolModule = require(script:FindFirstAncestor("BuyRobuxRouting").Parent.LoggingProtocol)
local config = {
	eventName = "BuyRobuxNewRoutingCallsite",
	throttlingPercentage = 10000,
	description = "Fires when a new Buy Robux routing callsite runs.",
	backends = { LoggingProtocolModule.TelemetryBackends.Counter },
	lastUpdated = { 2026, 10, 21 }
}

return function(Callsite)
	-- upvalues: LoggingProtocolModule (copy), config (copy)
	LoggingProtocolModule.default:logRobloxTelemetryCounter(config, 1, { callsite = Callsite })
end