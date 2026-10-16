local EventStreamReporterModule = {}
EventStreamReporterModule.__index = EventStreamReporterModule

function EventStreamReporterModule.new(_reporter) --[[ Line: 9 ]]
	-- upvalues: EventStreamReporterModule (copy)
	local config = { _isEnabled = true, _reporter = _reporter }
	setmetatable(config, EventStreamReporterModule)
	
	return config
end

function EventStreamReporterModule:setEnabled(_isEnabled) --[[ Line: 19 ]]
	self._isEnabled = _isEnabled
end

function EventStreamReporterModule:sendTelemetryEvent(p1, EventName, p2) --[[ Line: 26 ]]
	local P6 = p2 or {}
	assert(type(p1) == "string", "Expected eventContext to be a string")
	assert(type(EventName) == "string", "Expected eventName to be a string")
	assert(type(P6) == "table", "Expected additionalArgs to be a table")
	assert(self._isEnabled, "This reporting service is disabled")
	self._reporter:logRobloxTelemetryEvent({
		throttlingPercentage = 10000,
		eventName = EventName,
		backends = { "EventIngest" }
	}, { "addSessionId", "addSessionInfo" }, P6, p1)
end

return EventStreamReporterModule