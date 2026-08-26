local socialLuaAnalyticsModule = require(script.Parent.Parent.Parent.SocialLuaAnalytics)
local fireDiagCounter = socialLuaAnalyticsModule.Analytics.FireEvent.fireDiagCounter
local fireEventStream = socialLuaAnalyticsModule.Analytics.FireEvent.fireEventStream
local fireTelemetry = socialLuaAnalyticsModule.Analytics.FireEvent.fireTelemetry
local diagActionListModule = require(script.Parent.DiagActionList)
local _ = require(script.Parent.EventNames)
local eventStreamActionListModule = require(script.Parent.EventStreamActionList)
local telemetryActionListModule = require(script.Parent.TelemetryActionList)

return function(p1)
	-- upvalues: fireEventStream (ref), eventStreamActionListModule (ref), fireDiagCounter (ref), diagActionListModule (ref), fireTelemetry (ref), telemetryActionListModule (ref)
	local var1 = fireEventStream({
		eventStreamImpl = p1.analytics.EventStream,
		eventList = eventStreamActionListModule,
		infoForAllEvents = p1.infoForAllEvents
	})
	local var2 = fireDiagCounter({
		diagImpl = p1.analytics.Diag,
		eventList = diagActionListModule
	})
	local var3 = fireTelemetry({
		telemetryImpl = p1.analytics.Telemetry,
		eventList = telemetryActionListModule
	})
	
	return function(p2, p3)
		-- upvalues: diagActionListModule (copy), var2 (ref), telemetryActionListModule (copy), var3 (ref), eventStreamActionListModule (copy), var1 (ref)
		if diagActionListModule[p2] then
			var2(p2)
		end
		if telemetryActionListModule[p2] then
			var3(p2, p3)
		end
		if eventStreamActionListModule[p2] then
			var1(p2, p3)
		end
	end
end