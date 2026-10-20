local FireEventStreamModule = require(script.Parent.fireEventStream)
local FireDiagModule = require(script.Parent.fireDiag)
local FireTelemetryModule = require(script.Parent.fireTelemetry)
local _ = require(script.Parent.Parent.Types)

local function setupFireEvent(p1, p2)
	-- upvalues: FireEventStreamModule (copy), FireDiagModule (copy), FireTelemetryModule (copy)
	local FireEventStreamModuleResult = if p1.analytics.EventStream and p2.EventStream then FireEventStreamModule({
		eventStreamImpl = p1.analytics.EventStream,
		eventList = p2.EventStream,
		infoForAllEvents = p1.infoForAllEvents,
		getInfoForAllEvents = p1.getInfoForAllEvents,
		loggerImpl = p1.loggerImpl
	}) else nil
	local FireDiagModuleResult = if p1.analytics.Diag and p2.Diag then FireDiagModule({
		diagImpl = p1.analytics.Diag,
		eventList = p2.Diag,
		loggerImpl = p1.loggerImpl
	}) else nil
	local FireTelemetryModuleResult = if p1.analytics.Telemetry and p2.Telemetry then FireTelemetryModule({
		telemetryImpl = p1.analytics.Telemetry,
		eventList = p2.Telemetry,
		getInfoForAllEvents = p1.getInfoForAllEvents,
		loggerImpl = p1.loggerImpl
	}) else nil
	
	return function(p3, p4)
		-- upvalues: FireDiagModuleResult (copy), p2 (copy), FireEventStreamModuleResult (copy), FireTelemetryModuleResult (copy)
		if FireDiagModuleResult and p2.Diag and p2.Diag[p3] then
			FireDiagModuleResult(p3, p4)
		end
		if FireEventStreamModuleResult and p2.EventStream and p2.EventStream[p3] then
			FireEventStreamModuleResult(p3, p4)
		end
		if FireTelemetryModuleResult and p2.Telemetry and p2.Telemetry[p3] then
			FireTelemetryModuleResult(p3, p4)
		end
		return p3, p4
	end
end

return function(p1)
	-- upvalues: setupFireEvent (copy)
	return function(p2)
		-- upvalues: setupFireEvent (upval), p1 (copy)
		return (setupFireEvent(p2, p1))
	end
end