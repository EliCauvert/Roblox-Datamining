local socialLuaAnalyticsModule = require(script.Parent.Parent.Parent.SocialLuaAnalytics)
local fireDiagCounter = socialLuaAnalyticsModule.Analytics.FireEvent.fireDiagCounter
local fireEventStream = socialLuaAnalyticsModule.Analytics.FireEvent.fireEventStream
local eventStreamActionListModule = require(script.Parent.EventStreamActionList)
local diagActionListModule = require(script.Parent.DiagActionList)

return function(p1)
	-- upvalues: fireEventStream (ref), eventStreamActionListModule (ref), fireDiagCounter (ref), diagActionListModule (ref)
	local var1 = fireEventStream({
		eventStreamImpl = p1.analytics.EventStream,
		eventList = eventStreamActionListModule,
		infoForAllEvents = p1.infoForAllEvents
	})
	local var2 = fireDiagCounter({
		diagImpl = p1.analytics.Diag,
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