local SocialLuaAnalytics = require(script.Parent.Parent.dependencies).SocialLuaAnalytics
local EventNamesModule = require(script.Parent.Enums.EventNames)
local FireReportStatsModule = require(script.Parent.fireReportStats)
local FireEventStreamFunction = SocialLuaAnalytics.Analytics.FireEvent.fireEventStream
local FireDiagCounterFunction = SocialLuaAnalytics.Analytics.FireEvent.fireDiagCounter
local AnalyticsEventsModule = require(script.Parent.AnalyticsEvents)
local DiagEventsModule = require(script.Parent.DiagEvents)

return function(p1)
	-- upvalues: FireEventStreamFunction (copy), AnalyticsEventsModule (copy), FireDiagCounterFunction (copy), DiagEventsModule (copy), FireReportStatsModule (copy), EventNamesModule (copy)
	local FireEventStreamResult = FireEventStreamFunction({
		eventStreamImpl = if p1.analytics then p1.analytics.EventStream else p1.eventStreamImpl,
		eventList = AnalyticsEventsModule,
		infoForAllEvents = p1.defaultAnalyticsInfo
	})
	local FireDiagCounterResult = FireDiagCounterFunction({
		diagImpl = if p1.analytics then p1.analytics.Diag else p1.diag,
		eventList = DiagEventsModule
	})
	local FireReportStatsModuleResult = FireReportStatsModule({
		diagImpl = if p1.analytics then p1.analytics.Diag else p1.diag,
		eventList = DiagEventsModule
	})
	
	return function(ContactImportingTime, p2)
		-- upvalues: DiagEventsModule (upval), EventNamesModule (upval), FireReportStatsModuleResult (copy), FireDiagCounterResult (copy), AnalyticsEventsModule (upval), FireEventStreamResult (copy)
		if DiagEventsModule[ContactImportingTime] then
			if ContactImportingTime == EventNamesModule.ContactImportingTime then
				FireReportStatsModuleResult(EventNamesModule.ContactImportingTime, p2)
			else
				FireDiagCounterResult(ContactImportingTime)
			end
		end
		if AnalyticsEventsModule[ContactImportingTime] then
			FireEventStreamResult(ContactImportingTime, p2)
		end
	end
end