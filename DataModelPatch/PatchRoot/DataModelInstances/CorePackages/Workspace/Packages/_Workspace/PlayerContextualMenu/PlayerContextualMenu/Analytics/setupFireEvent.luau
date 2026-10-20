local SocialLuaAnalyticsModule = require(script.Parent.Parent.Parent.SocialLuaAnalytics)
local FireDiagCounterFunction = SocialLuaAnalyticsModule.Analytics.FireEvent.fireDiagCounter
local FireEventStreamFunction = SocialLuaAnalyticsModule.Analytics.FireEvent.fireEventStream
local EventStreamActionListModule = require(script.Parent.EventStreamActionList)
local DiagActionListModule = require(script.Parent.DiagActionList)

return function(p1)
	-- upvalues: FireEventStreamFunction (copy), EventStreamActionListModule (copy), FireDiagCounterFunction (copy), DiagActionListModule (copy)
	local FireEventStreamResult = FireEventStreamFunction({
		eventStreamImpl = p1.analytics.EventStream,
		eventList = EventStreamActionListModule,
		infoForAllEvents = p1.infoForAllEvents
	})
	local FireDiagCounterResult = FireDiagCounterFunction({
		diagImpl = p1.analytics.Diag,
		eventList = DiagActionListModule
	})
	
	return function(p2, p3)
		-- upvalues: FireDiagCounterResult (copy), DiagActionListModule (upval), FireEventStreamResult (copy)
		if FireDiagCounterResult and DiagActionListModule[p2] then
			FireDiagCounterResult(p2)
		end
		return FireEventStreamResult(p2, p3)
	end
end