local socialLuaAnalyticsModule = require(script.Parent.Parent.Parent.SocialLuaAnalytics)
local fireDiagCounter = socialLuaAnalyticsModule.Analytics.FireEvent.fireDiagCounter
local fireEventStream = socialLuaAnalyticsModule.Analytics.FireEvent.fireEventStream
local eventStreamActionListModule = require(script.Parent.EventStreamActionList)
local diagActionListModule = require(script.Parent.DiagActionList)

return function(p0)
	-- upvalues: fireEventStream (ref), eventStreamActionListModule (ref), fireDiagCounter (ref), diagActionListModule (ref)
	local var3 = fireEventStream({
		eventStreamImpl = p0.analytics.EventStream,
		eventList = eventStreamActionListModule,
		infoForAllEvents = p0.infoForAllEvents
	})
	local var4 = fireDiagCounter({
		diagImpl = p0.analytics.Diag,
		eventList = diagActionListModule
	})
	
	return function(p1, p2)
		-- upvalues: var4 (ref), diagActionListModule (copy), var3 (ref)
		if var4 and diagActionListModule[p1] then
			var4(p1)
		end
		return var3(p1, p2)
	end
end