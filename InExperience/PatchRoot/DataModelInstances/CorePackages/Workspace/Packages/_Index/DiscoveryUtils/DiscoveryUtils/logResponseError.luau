local loggingProtocolModule = require(script:FindFirstAncestor("DiscoveryUtils").Parent.LoggingProtocol)
local default = loggingProtocolModule.default
local t = {
	eventName = "DiscoveryResponse_Error",
	description = "Response errors for discovery network requests",
	backends = { loggingProtocolModule.TelemetryBackends.Counter },
	throttlingPercentage = game:DefineFastInt("DiscoveryResponseErrorEventHundredthsPercent", 0),
	lastUpdated = { 24, 12, 2 }
}

local function _(p1)
	return (if typeof(p1) == "table" then tostring(p1.StatusCode) else nil) or "unknown"
end

return function(p1, p2, p3)
	-- upvalues: default (ref), t (ref)
	if p3 == nil then
		p3 = default
	end
	assert(p3, "LoggingProtocol must exist")
	p3:logRobloxTelemetryCounter(t, 1, {
		endpoint_name = p1,
		status_code = (if typeof(p2) == "table" then tostring(p2.StatusCode) else nil) or "unknown"
	})
end