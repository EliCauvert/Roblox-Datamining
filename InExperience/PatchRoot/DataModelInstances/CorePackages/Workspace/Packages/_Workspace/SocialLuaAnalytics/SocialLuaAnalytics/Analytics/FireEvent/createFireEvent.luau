local fireEventStreamModule = require(script.Parent.fireEventStream)
local fireDiagModule = require(script.Parent.fireDiag)
local fireTelemetryModule = require(script.Parent.fireTelemetry)
local _ = require(script.Parent.Parent.Types)

local function setupFireEvent(value, p1)
	-- upvalues: fireEventStreamModule (ref), fireDiagModule (ref), fireTelemetryModule (ref)
	local var1 = if value.analytics.EventStream and p1.EventStream then fireEventStreamModule({
		eventStreamImpl = value.analytics.EventStream,
		eventList = p1.EventStream,
		infoForAllEvents = value.infoForAllEvents,
		getInfoForAllEvents = value.getInfoForAllEvents,
		loggerImpl = value.loggerImpl
	}) else nil
	local var2 = if value.analytics.Diag and p1.Diag then fireDiagModule({
		diagImpl = value.analytics.Diag,
		eventList = p1.Diag,
		loggerImpl = value.loggerImpl
	}) else nil
	local var3 = if value.analytics.Telemetry and p1.Telemetry then fireTelemetryModule({
		telemetryImpl = value.analytics.Telemetry,
		eventList = p1.Telemetry,
		getInfoForAllEvents = value.getInfoForAllEvents,
		loggerImpl = value.loggerImpl
	}) else nil
	
	return function(p2, p3)
		-- upvalues: var2 (ref), p1 (ref), var1 (ref), var3 (ref)
		if var2 and p1.Diag and p1.Diag[p2] then
			var2(p2, p3)
		end
		if var1 and p1.EventStream and p1.EventStream[p2] then
			var1(p2, p3)
		end
		if var3 and p1.Telemetry and p1.Telemetry[p2] then
			var3(p2, p3)
		end
		return p2, p3
	end
end

return function(p1)
	-- upvalues: setupFireEvent (ref)
	return function(p2)
		-- upvalues: setupFireEvent (copy), p1 (ref)
		return setupFireEvent(p2, p1)
	end
end