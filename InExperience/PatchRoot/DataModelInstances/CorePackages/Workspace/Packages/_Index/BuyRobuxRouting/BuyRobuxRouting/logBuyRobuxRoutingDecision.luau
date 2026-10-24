local LoggingProtocolModule = require(script:FindFirstAncestor("BuyRobuxRouting").Parent.LoggingProtocol)
local config = {
	eventName = "BuyRobuxRoutingDecision",
	throttlingPercentage = 10000,
	description = "Fires when new Buy Robux routing chooses a destination.",
	backends = { LoggingProtocolModule.TelemetryBackends.Counter },
	lastUpdated = { 2026, 10, 21 }
}

return function(Destination, Reason)
	-- upvalues: LoggingProtocolModule (copy), config (copy)
	LoggingProtocolModule.default:logRobloxTelemetryCounter(config, 1, { destination = Destination, reason = Reason })
end