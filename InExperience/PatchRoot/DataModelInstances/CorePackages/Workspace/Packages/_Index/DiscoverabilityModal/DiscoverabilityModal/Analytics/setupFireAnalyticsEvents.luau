local socialLuaAnalytics = require(script.Parent.Parent.dependencies).SocialLuaAnalytics
local diagEventsModule = require(script.Parent.DiagEvents)
local fireEventStream = socialLuaAnalytics.Analytics.FireEvent.fireEventStream
local fireDiagCounter = socialLuaAnalytics.Analytics.FireEvent.fireDiagCounter
local analyticsEventsModule = require(script.Parent.AnalyticsEvents)

return function(p0) --[[ line: 10 ]]
	-- upvalues: fireEventStream (ref), analyticsEventsModule (ref), fireDiagCounter (ref), diagEventsModule (ref)
	local var2 = fireEventStream({
		eventStreamImpl = if p0.analytics then p0.analytics.EventStream else p0.eventStreamImpl,
		eventList = analyticsEventsModule,
		infoForAllEvents = p0.defaultAnalyticsInfo
	})
	local var3 = fireDiagCounter({
		diagImpl = if p0.analytics then p0.analytics.Diag else p0.diag,
		eventList = diagEventsModule
	})
	
	return function(p1, p2) --[[ line: 28 ]]
		-- upvalues: var3 (ref), var2 (ref)
		var3(p1)
		var2(p1, p2)
	end
end