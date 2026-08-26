local socialLuaAnalytics = require(script.Parent.Parent.dependencies).SocialLuaAnalytics
local eventNamesModule = require(script.Parent.Enums.EventNames)
local fireReportStatsModule = require(script.Parent.fireReportStats)
local fireEventStream = socialLuaAnalytics.Analytics.FireEvent.fireEventStream
local fireDiagCounter = socialLuaAnalytics.Analytics.FireEvent.fireDiagCounter
local analyticsEventsModule = require(script.Parent.AnalyticsEvents)
local diagEventsModule = require(script.Parent.DiagEvents)

return function(p1)
	-- upvalues: fireEventStream (ref), analyticsEventsModule (ref), fireDiagCounter (ref), diagEventsModule (ref), fireReportStatsModule (ref), eventNamesModule (ref)
	local var1 = fireEventStream({
		eventStreamImpl = if p1.analytics then p1.analytics.EventStream else p1.eventStreamImpl,
		eventList = analyticsEventsModule,
		infoForAllEvents = p1.defaultAnalyticsInfo
	})
	local var2 = fireDiagCounter({
		diagImpl = if p1.analytics then p1.analytics.Diag else p1.diag,
		eventList = diagEventsModule
	})
	local var3 = fireReportStatsModule({
		diagImpl = if p1.analytics then p1.analytics.Diag else p1.diag,
		eventList = diagEventsModule
	})
	
	return function(p2, p3)
		-- upvalues: diagEventsModule (copy), eventNamesModule (copy), var3 (ref), var2 (ref), analyticsEventsModule (copy), var1 (ref)
		if diagEventsModule[p2] then
			if p2 == eventNamesModule.ContactImportingTime then
				var3(eventNamesModule.ContactImportingTime, p3)
			else
				var2(p2)
			end
		end
		if analyticsEventsModule[p2] then
			var1(p2, p3)
		end
	end
end