local socialLuaAnalytics = require(script.Parent.Parent.dependencies).SocialLuaAnalytics
local eventNamesModule = require(script.Parent.Enums.EventNames)
local fireReportStatsModule = require(script.Parent.fireReportStats)
local fireEventStream = socialLuaAnalytics.Analytics.FireEvent.fireEventStream
local fireDiagCounter = socialLuaAnalytics.Analytics.FireEvent.fireDiagCounter
local analyticsEventsModule = require(script.Parent.AnalyticsEvents)
local diagEventsModule = require(script.Parent.DiagEvents)

return function(p0)
	-- upvalues: fireEventStream (ref), analyticsEventsModule (ref), fireDiagCounter (ref), diagEventsModule (ref), fireReportStatsModule (ref), eventNamesModule (ref)
	local var4 = fireEventStream({
		eventStreamImpl = if p0.analytics then p0.analytics.EventStream else p0.eventStreamImpl,
		eventList = analyticsEventsModule,
		infoForAllEvents = p0.defaultAnalyticsInfo
	})
	local var5 = fireDiagCounter({
		diagImpl = if p0.analytics then p0.analytics.Diag else p0.diag,
		eventList = diagEventsModule
	})
	local var6 = fireReportStatsModule({
		diagImpl = if p0.analytics then p0.analytics.Diag else p0.diag,
		eventList = diagEventsModule
	})
	
	return function(p1, p2)
		-- upvalues: diagEventsModule (copy), eventNamesModule (copy), var6 (ref), var5 (ref), analyticsEventsModule (copy), var4 (ref)
		if diagEventsModule[p1] then
			if p1 == eventNamesModule.ContactImportingTime then
				var6(eventNamesModule.ContactImportingTime, p2)
			else
				var5(p1)
			end
		end
		if analyticsEventsModule[p1] then
			var4(p1, p2)
		end
	end
end