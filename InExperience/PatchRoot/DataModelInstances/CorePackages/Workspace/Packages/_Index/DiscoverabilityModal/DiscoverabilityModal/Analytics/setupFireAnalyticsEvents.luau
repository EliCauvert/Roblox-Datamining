local socialLuaAnalytics = require(script.Parent.Parent.dependencies).SocialLuaAnalytics
local diagEventsModule = require(script.Parent.DiagEvents)
local fireEventStream = socialLuaAnalytics.Analytics.FireEvent.fireEventStream
local fireDiagCounter = socialLuaAnalytics.Analytics.FireEvent.fireDiagCounter
local analyticsEventsModule = require(script.Parent.AnalyticsEvents)

return function(p1)
	-- upvalues: fireEventStream (ref), analyticsEventsModule (ref), fireDiagCounter (ref), diagEventsModule (ref)
	local var1 = fireEventStream({
		eventStreamImpl = if p1.analytics then p1.analytics.EventStream else p1.eventStreamImpl,
		eventList = analyticsEventsModule,
		infoForAllEvents = p1.defaultAnalyticsInfo
	})
	local var2 = fireDiagCounter({
		diagImpl = if p1.analytics then p1.analytics.Diag else p1.diag,
		eventList = diagEventsModule
	})
	
	return function(p2, p3)
		-- upvalues: var2 (ref), var1 (ref)
		var2(p2)
		var1(p2, p3)
	end
end