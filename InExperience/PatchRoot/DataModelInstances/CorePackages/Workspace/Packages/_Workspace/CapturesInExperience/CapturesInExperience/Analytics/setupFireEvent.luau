local socialLuaAnalyticsModule = require(script.Parent.Parent.Parent.SocialLuaAnalytics)
local fireDiagCounter = socialLuaAnalyticsModule.Analytics.FireEvent.fireDiagCounter
local fireEventStream = socialLuaAnalyticsModule.Analytics.FireEvent.fireEventStream
local fireTelemetry = socialLuaAnalyticsModule.Analytics.FireEvent.fireTelemetry
local diagActionListModule = require(script.Parent.DiagActionList)
local _ = require(script.Parent.EventNames)
local eventStreamActionListModule = require(script.Parent.EventStreamActionList)
local telemetryActionListModule = require(script.Parent.TelemetryActionList)

return function(p0)
	-- upvalues: fireEventStream (ref), eventStreamActionListModule (ref), fireDiagCounter (ref), diagActionListModule (ref), fireTelemetry (ref), telemetryActionListModule (ref)
	local var4 = fireEventStream({
		eventStreamImpl = p0.analytics.EventStream,
		eventList = eventStreamActionListModule,
		infoForAllEvents = p0.infoForAllEvents
	})
	local var5 = fireDiagCounter({
		diagImpl = p0.analytics.Diag,
		eventList = diagActionListModule
	})
	local var6 = fireTelemetry({
		telemetryImpl = p0.analytics.Telemetry,
		eventList = telemetryActionListModule
	})
	
	return function(p1, p2)
		-- upvalues: diagActionListModule (copy), var5 (ref), telemetryActionListModule (copy), var6 (ref), eventStreamActionListModule (copy), var4 (ref)
		if diagActionListModule[p1] then
			var5(p1)
		end
		if telemetryActionListModule[p1] then
			var6(p1, p2)
		end
		if eventStreamActionListModule[p1] then
			var4(p1, p2)
		end
	end
end