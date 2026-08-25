local default = require(script:FindFirstAncestor("DiscoveryUtils").Parent.LoggingProtocol).default
local t = {
	eventName = "DiscoveryResponseSize",
	description = "Response body size for discovery network requests",
	links = "",
	backends = { default.TelemetryBackends.Stats },
	throttlingPercentage = game:DefineFastInt("DiscoveryResponseSizeEventHundredthsPercent", 0),
	lastUpdated = { 24, 8, 2 }
}

return function(value, p0, p1)
	-- upvalues: default (ref), t (ref)
	if p1 == nil then
		p1 = default
	end
	assert(p1, "LoggingProtocol must exist")
	p1:logRobloxTelemetryStat(t, p0.responseSize, { endpoint_name = value })
end