local default = require(script:FindFirstAncestor("DiscoveryUtils").Parent.LoggingProtocol).default
local t = {
	eventName = "DiscoveryResponseSize",
	description = "Response body size for discovery network requests",
	links = "",
	backends = { default.TelemetryBackends.Stats },
	throttlingPercentage = game:DefineFastInt("DiscoveryResponseSizeEventHundredthsPercent", 0),
	lastUpdated = { 24, 8, 2 }
}

return function(value, p1, p2)
	-- upvalues: default (ref), t (ref)
	if p2 == nil then
		p2 = default
	end
	assert(p2, "LoggingProtocol must exist")
	p2:logRobloxTelemetryStat(t, p1.responseSize, { endpoint_name = value })
end