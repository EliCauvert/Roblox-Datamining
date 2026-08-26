local dependenciesModule = require(script.Parent.Parent.dependencies)
local socialLuaAnalytics = dependenciesModule.SocialLuaAnalytics
local diagActionListModule = require(script.Parent.DiagActionList)
local fireEventStream = socialLuaAnalytics.Analytics.FireEvent.fireEventStream
local fireDiagCounter = socialLuaAnalytics.Analytics.FireEvent.fireDiagCounter
local eventStreamActionListModule = require(script.Parent.EventStreamActionList)
local analyticsService = dependenciesModule.AnalyticsService

return function(p1)
	-- upvalues: fireEventStream (ref), eventStreamActionListModule (ref), fireDiagCounter (ref), analyticsService (ref), diagActionListModule (ref)
	local var1 = fireEventStream({
		eventStreamImpl = p1.analytics.EventStream,
		eventList = eventStreamActionListModule,
		infoForAllEvents = p1.infoForAllEvents
	})
	local var2 = fireDiagCounter({
		diagImpl = if not p1.analytics.Diag then analyticsService.Diag else p1.analytics.Diag,
		eventList = diagActionListModule
	})
	
	return function(p2, p3)
		-- upvalues: var2 (ref), diagActionListModule (copy), var1 (ref)
		if var2 and diagActionListModule[p2] then
			var2(p2)
		end
		return var1(p2, p3)
	end
end