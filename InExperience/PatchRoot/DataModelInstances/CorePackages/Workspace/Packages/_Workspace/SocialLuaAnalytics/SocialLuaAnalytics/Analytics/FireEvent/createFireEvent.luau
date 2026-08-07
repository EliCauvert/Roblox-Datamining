local fireEventStreamModule = require(script.Parent.fireEventStream)
local fireDiagModule = require(script.Parent.fireDiag)
local fireTelemetryModule = require(script.Parent.fireTelemetry)
local _ = require(script.Parent.Parent.Types)

local function setupFireEvent(value, p0) --[[ line: 23 ]]
	-- upvalues: fireEventStreamModule (ref), fireDiagModule (ref), fireTelemetryModule (ref)
	local var4 = if value.analytics.EventStream and p0.EventStream then fireEventStreamModule({
		eventStreamImpl = value.analytics.EventStream,
		eventList = p0.EventStream,
		infoForAllEvents = value.infoForAllEvents,
		getInfoForAllEvents = value.getInfoForAllEvents,
		loggerImpl = value.loggerImpl
	}) else nil
	local var5 = if value.analytics.Diag and p0.Diag then fireDiagModule({
		diagImpl = value.analytics.Diag,
		eventList = p0.Diag,
		loggerImpl = value.loggerImpl
	}) else nil
	local var6 = if value.analytics.Telemetry and p0.Telemetry then fireTelemetryModule({
		telemetryImpl = value.analytics.Telemetry,
		eventList = p0.Telemetry,
		getInfoForAllEvents = value.getInfoForAllEvents,
		loggerImpl = value.loggerImpl
	}) else nil
	
	return function(p1, p2) --[[ line: 51 ]]
		-- upvalues: var5 (ref), p0 (ref), var4 (ref), var6 (ref)
		if var5 and p0.Diag and p0.Diag[p1] then
			var5(p1, p2)
		end
		if var4 and p0.EventStream and p0.EventStream[p1] then
			var4(p1, p2)
		end
		if var6 and p0.Telemetry and p0.Telemetry[p1] then
			var6(p1, p2)
		end
		return p1, p2
	end
end

return function(p3) --[[ line: 72 | named "createFireEvent" ]]
	-- upvalues: setupFireEvent (ref)
	return function(p4) --[[ line: 73 ]]
		-- upvalues: setupFireEvent (copy), p3 (ref)
		return setupFireEvent(p4, p3)
	end
end