local LoggingProtocolModule = require(script:FindFirstAncestor("DiscoveryUtils").Parent.LoggingProtocol)
local Default = LoggingProtocolModule.default
local config = {
	eventName = "DiscoveryResponse_Error",
	description = "Response errors for discovery network requests",
	backends = { LoggingProtocolModule.TelemetryBackends.Counter },
	throttlingPercentage = game:DefineFastInt("DiscoveryResponseErrorEventHundredthsPercent", 0),
	lastUpdated = { 24, 12, 2 }
}

local function _(p1)
	return (if typeof(p1) == "table" then tostring(p1.StatusCode) else nil) or "unknown"
end

return function(Endpoint_name, p1, Default1)
	-- upvalues: Default (copy), config (copy)
	if Default1 == nil then
		Default1 = Default
	end
	assert(Default1, "LoggingProtocol must exist")
	Default1:logRobloxTelemetryCounter(config, 1, {
		endpoint_name = Endpoint_name,
		status_code = (if typeof(p1) == "table" then tostring(p1.StatusCode) else nil) or "unknown"
	})
end