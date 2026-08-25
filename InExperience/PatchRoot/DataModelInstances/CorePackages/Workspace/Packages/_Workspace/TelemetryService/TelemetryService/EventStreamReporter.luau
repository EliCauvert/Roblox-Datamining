local t = {}
t.__index = t

function t.new(p0)
	-- upvalues: t (ref)
	local t_1 = { _isEnabled = true, _reporter = p0 }
	setmetatable(t_1, t)
	
	return t_1
end

function t:setEnabled(p1)
	self._isEnabled = p1
end

function t:sendTelemetryEvent(p2, p3, p4)
	p4 = p4 or {}
	assert(type(p2) == "string", "Expected eventContext to be a string")
	assert(type(p3) == "string", "Expected eventName to be a string")
	assert(type(p4) == "table", "Expected additionalArgs to be a table")
	assert(self._isEnabled, "This reporting service is disabled")
	self._reporter:logRobloxTelemetryEvent({
		throttlingPercentage = 10000,
		eventName = p3,
		backends = { "EventIngest" }
	}, { "addSessionId", "addSessionInfo" }, p4, p2)
end

return t