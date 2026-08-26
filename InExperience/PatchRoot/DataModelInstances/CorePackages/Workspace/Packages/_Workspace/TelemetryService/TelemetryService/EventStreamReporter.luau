local t = {}
t.__index = t

function t.new(p1)
	-- upvalues: t (ref)
	local t_1 = { _isEnabled = true, _reporter = p1 }
	setmetatable(t_1, t)
	
	return t_1
end

function t:setEnabled(p1)
	self._isEnabled = p1
end

function t:sendTelemetryEvent(p1, p2, p3)
	p3 = p3 or {}
	assert(type(p1) == "string", "Expected eventContext to be a string")
	assert(type(p2) == "string", "Expected eventName to be a string")
	assert(type(p3) == "table", "Expected additionalArgs to be a table")
	assert(self._isEnabled, "This reporting service is disabled")
	self._reporter:logRobloxTelemetryEvent({
		throttlingPercentage = 10000,
		eventName = p2,
		backends = { "EventIngest" }
	}, { "addSessionId", "addSessionInfo" }, p3, p1)
end

return t