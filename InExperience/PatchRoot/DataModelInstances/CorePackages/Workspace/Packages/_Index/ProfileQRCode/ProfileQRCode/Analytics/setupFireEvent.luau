local socialLuaAnalyticsModule = require(script:FindFirstAncestor("ProfileQRCode").Parent.SocialLuaAnalytics)
local diagActionListModule = require(script.Parent.DiagActionList)
local fireEventStream = socialLuaAnalyticsModule.Analytics.FireEvent.fireEventStream
local fireDiagCounter = socialLuaAnalyticsModule.Analytics.FireEvent.fireDiagCounter
local eventStreamActionListModule = require(script.Parent.EventStreamActionList)

return function(p0) --[[ line: 10 ]]
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
	
	return function(p1, p2) --[[ line: 26 ]]
		-- upvalues: diagActionListModule (copy), var4 (ref), var3 (ref)
		if diagActionListModule[p1] then
			var4(p1)
		end
		return var3(p1, p2)
	end
end