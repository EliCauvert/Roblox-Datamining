local loggingProtocolModule = require(script:FindFirstAncestor("ServerTriggeredModals").Parent.LoggingProtocol)
local default = loggingProtocolModule.default
local t = {
	eventName = "ServerTriggeredModals_HttpStatusCode",
	description = "Response status code from server triggered modals request",
	backends = { loggingProtocolModule.TelemetryBackends.Counter },
	lastUpdated = { 25, 8, 29 }
}

return function(p1, p2, p3)
	-- upvalues: default (ref), t (ref)
	if p3 == nil then
		p3 = default
	end
	assert(p3, "loggingProtocol must exists")
	p3:logRobloxTelemetryCounter(t, 1, { endpoint_name = p1, status_code = p2 or "unknown" })
end