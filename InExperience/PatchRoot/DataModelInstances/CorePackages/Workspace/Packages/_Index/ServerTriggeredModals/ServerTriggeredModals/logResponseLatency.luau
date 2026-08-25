local loggingProtocolModule = require(script:FindFirstAncestor("ServerTriggeredModals").Parent.LoggingProtocol)
local default = loggingProtocolModule.default
local t = {
	eventName = "ServerTriggeredModals_NetworkLatency",
	description = "Response latency from server triggered modals request",
	backends = { loggingProtocolModule.TelemetryBackends.Stats },
	lastUpdated = { 25, 8, 29 }
}

return function(p0, p1, p2, p3)
	-- upvalues: default (ref), t (ref)
	if p3 == nil then
		p3 = default
	end
	assert(p3, "loggingProtocol must exists")
	p3:logRobloxTelemetryStat(t, p1, { endpoint_name = p0, status_code = p2 })
end