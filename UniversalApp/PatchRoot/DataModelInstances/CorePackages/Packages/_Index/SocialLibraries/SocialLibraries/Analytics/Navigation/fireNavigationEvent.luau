local FireEventStreamModule = require(script.Parent.Parent.FireEvent.fireEventStream)
local FireDiagCounterModule = require(script.Parent.Parent.FireEvent.fireDiagCounter)
local DiagEventListModule = require(script.Parent.DiagEventList)
local EventStreamEventListModule = require(script.Parent.EventStreamEventList)
local _ = require(script.Parent.Parent.FireEvent.Types)

return function(p1) --[[ Line: 8 ]]
	-- upvalues: FireEventStreamModule (copy), EventStreamEventListModule (copy), FireDiagCounterModule (copy), DiagEventListModule (copy)
	local FireEventStreamModuleResult = FireEventStreamModule({
		eventStreamImpl = p1.analytics.EventStream,
		eventList = EventStreamEventListModule,
		loggerImpl = p1.loggerImpl,
		infoForAllEvents = p1.infoForAllEvents
	})
	local FireDiagCounterModuleResult = FireDiagCounterModule({
		diagImpl = p1.analytics.Diag,
		eventList = DiagEventListModule,
		loggerImpl = p1.loggerImpl
	})
	
	return function(p2, p3) --[[ Line: 21 ]]
		-- upvalues: EventStreamEventListModule (upval), FireEventStreamModuleResult (copy), DiagEventListModule (upval), FireDiagCounterModuleResult (copy)
		if EventStreamEventListModule[p2] then
			FireEventStreamModuleResult(p2, p3)
		end
		if DiagEventListModule[p2] then
			FireDiagCounterModuleResult(p2)
		end
		return DateTime.now()
	end
end