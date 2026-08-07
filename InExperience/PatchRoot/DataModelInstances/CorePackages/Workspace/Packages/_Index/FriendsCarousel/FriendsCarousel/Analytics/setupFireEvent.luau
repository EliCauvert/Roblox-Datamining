local dependenciesModule = require(script.Parent.Parent.dependencies)
local socialLuaAnalytics = dependenciesModule.SocialLuaAnalytics
local diagActionListModule = require(script.Parent.DiagActionList)
local fireEventStream = socialLuaAnalytics.Analytics.FireEvent.fireEventStream
local fireDiagCounter = socialLuaAnalytics.Analytics.FireEvent.fireDiagCounter
local eventStreamActionListModule = require(script.Parent.EventStreamActionList)
local analyticsService = dependenciesModule.AnalyticsService

return function(p0) --[[ line: 11 ]]
	-- upvalues: fireEventStream (ref), eventStreamActionListModule (ref), fireDiagCounter (ref), analyticsService (ref), diagActionListModule (ref)
	local var3 = fireEventStream({
		eventStreamImpl = p0.analytics.EventStream,
		eventList = eventStreamActionListModule,
		infoForAllEvents = p0.infoForAllEvents
	})
	local var4 = fireDiagCounter({
		diagImpl = if not p0.analytics.Diag then analyticsService.Diag else p0.analytics.Diag,
		eventList = diagActionListModule
	})
	
	return function(p1, p2) --[[ line: 27 ]]
		-- upvalues: var4 (ref), diagActionListModule (copy), var3 (ref)
		if var4 and diagActionListModule[p1] then
			var4(p1)
		end
		return var3(p1, p2)
	end
end