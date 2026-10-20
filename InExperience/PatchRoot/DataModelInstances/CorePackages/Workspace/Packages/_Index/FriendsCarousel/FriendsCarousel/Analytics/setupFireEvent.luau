local DependenciesModule = require(script.Parent.Parent.dependencies)
local SocialLuaAnalytics = DependenciesModule.SocialLuaAnalytics
local DiagActionListModule = require(script.Parent.DiagActionList)
local FireEventStreamFunction = SocialLuaAnalytics.Analytics.FireEvent.fireEventStream
local FireDiagCounterFunction = SocialLuaAnalytics.Analytics.FireEvent.fireDiagCounter
local EventStreamActionListModule = require(script.Parent.EventStreamActionList)
local AnalyticsService = DependenciesModule.AnalyticsService

return function(p1)
	-- upvalues: FireEventStreamFunction (copy), EventStreamActionListModule (copy), FireDiagCounterFunction (copy), AnalyticsService (copy), DiagActionListModule (copy)
	local FireEventStreamResult = FireEventStreamFunction({
		eventStreamImpl = p1.analytics.EventStream,
		eventList = EventStreamActionListModule,
		infoForAllEvents = p1.infoForAllEvents
	})
	local FireDiagCounterResult = FireDiagCounterFunction({
		diagImpl = if p1.analytics.Diag then p1.analytics.Diag else AnalyticsService.Diag,
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