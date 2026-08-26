local socialLuaAnalyticsModule = require(script:FindFirstAncestor("ProfileQRCode").Parent.SocialLuaAnalytics)
local diagActionListModule = require(script.Parent.DiagActionList)
local fireEventStream = socialLuaAnalyticsModule.Analytics.FireEvent.fireEventStream
local fireDiagCounter = socialLuaAnalyticsModule.Analytics.FireEvent.fireDiagCounter
local eventStreamActionListModule = require(script.Parent.EventStreamActionList)

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
		-- upvalues: diagActionListModule (copy), var2 (ref), var1 (ref)
		if diagActionListModule[p2] then
			var2(p2)
		end
		return var1(p2, p3)
	end
end