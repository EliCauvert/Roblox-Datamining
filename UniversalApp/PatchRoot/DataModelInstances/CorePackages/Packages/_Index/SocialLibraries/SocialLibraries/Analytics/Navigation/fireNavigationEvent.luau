local fireEventStreamModule = require(script.Parent.Parent.FireEvent.fireEventStream)
local fireDiagCounterModule = require(script.Parent.Parent.FireEvent.fireDiagCounter)
local diagEventListModule = require(script.Parent.DiagEventList)
local eventStreamEventListModule = require(script.Parent.EventStreamEventList)
local _ = require(script.Parent.Parent.FireEvent.Types)

return function(p1)
	-- upvalues: fireEventStreamModule (ref), eventStreamEventListModule (ref), fireDiagCounterModule (ref), diagEventListModule (ref)
	local var1 = fireEventStreamModule({
		eventStreamImpl = p1.analytics.EventStream,
		eventList = eventStreamEventListModule,
		loggerImpl = p1.loggerImpl,
		infoForAllEvents = p1.infoForAllEvents
	})
	local var2 = fireDiagCounterModule({
		diagImpl = p1.analytics.Diag,
		eventList = diagEventListModule,
		loggerImpl = p1.loggerImpl
	})
	
	return function(p2, p3)
		-- upvalues: eventStreamEventListModule (copy), var1 (ref), diagEventListModule (copy), var2 (ref)
		if eventStreamEventListModule[p2] then
			var1(p2, p3)
		end
		if diagEventListModule[p2] then
			var2(p2)
		end
		return DateTime.now()
	end
end