local loggingProtocolModule = require(script:FindFirstAncestor("ServerTriggeredModals").Parent.LoggingProtocol)
local default = loggingProtocolModule.default
local t = {
	eventName = "ServerTriggeredModals_NetworkLatency",
	description = "Response latency from server triggered modals request",
	backends = { loggingProtocolModule.TelemetryBackends.Stats },
	lastUpdated = { 25, 8, 29 }
}

return function(p1, p2, p3, p4)
	-- upvalues: default (ref), t (ref)
	if p4 == nil then
		p4 = default
	end
	assert(p4, "loggingProtocol must exists")
	p4:logRobloxTelemetryStat(t, p2, { endpoint_name = p1, status_code = p3 })
end