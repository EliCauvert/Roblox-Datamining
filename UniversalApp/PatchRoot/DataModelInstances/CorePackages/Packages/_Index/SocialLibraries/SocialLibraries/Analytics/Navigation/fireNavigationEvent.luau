local fireEventStreamModule = require(script.Parent.Parent.FireEvent.fireEventStream)
local fireDiagCounterModule = require(script.Parent.Parent.FireEvent.fireDiagCounter)
local diagEventListModule = require(script.Parent.DiagEventList)
local eventStreamEventListModule = require(script.Parent.EventStreamEventList)
local _ = require(script.Parent.Parent.FireEvent.Types)

return function(p0)
	-- upvalues: fireEventStreamModule (ref), eventStreamEventListModule (ref), fireDiagCounterModule (ref), diagEventListModule (ref)
	local var4 = fireEventStreamModule({
		eventStreamImpl = p0.analytics.EventStream,
		eventList = eventStreamEventListModule,
		loggerImpl = p0.loggerImpl,
		infoForAllEvents = p0.infoForAllEvents
	})
	local var5 = fireDiagCounterModule({
		diagImpl = p0.analytics.Diag,
		eventList = diagEventListModule,
		loggerImpl = p0.loggerImpl
	})
	
	return function(p1, p2)
		-- upvalues: eventStreamEventListModule (copy), var4 (ref), diagEventListModule (copy), var5 (ref)
		if eventStreamEventListModule[p1] then
			var4(p1, p2)
		end
		if diagEventListModule[p1] then
			var5(p1)
		end
		return DateTime.now()
	end
end