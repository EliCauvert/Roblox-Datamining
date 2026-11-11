local SocialLuaAnalytics = require(script.Parent.Parent.dependencies).SocialLuaAnalytics
local DiagEventsModule = require(script.Parent.DiagEvents)
local FireEventStreamFunction = SocialLuaAnalytics.Analytics.FireEvent.fireEventStream
local FireDiagCounterFunction = SocialLuaAnalytics.Analytics.FireEvent.fireDiagCounter
local AnalyticsEventsModule = require(script.Parent.AnalyticsEvents)

return function(p1)
	-- upvalues: FireEventStreamFunction (copy), AnalyticsEventsModule (copy), FireDiagCounterFunction (copy), DiagEventsModule (copy)
	local FireEventStreamResult = FireEventStreamFunction({
		eventStreamImpl = if p1.analytics then p1.analytics.EventStream else p1.eventStreamImpl,
		eventList = AnalyticsEventsModule,
		infoForAllEvents = p1.defaultAnalyticsInfo
	})
	local FireDiagCounterResult = FireDiagCounterFunction({
		diagImpl = if p1.analytics then p1.analytics.Diag else p1.diag,
		eventList = DiagEventsModule
	})
	
	return function(p2, p3)
		-- upvalues: FireDiagCounterResult (copy), FireEventStreamResult (copy)
		FireDiagCounterResult(p2)
		FireEventStreamResult(p2, p3)
	end
end