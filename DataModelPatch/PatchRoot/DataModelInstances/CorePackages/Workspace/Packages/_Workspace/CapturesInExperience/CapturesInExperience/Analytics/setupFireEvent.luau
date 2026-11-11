local SocialLuaAnalyticsModule = require(script.Parent.Parent.Parent.SocialLuaAnalytics)
local FireDiagCounterFunction = SocialLuaAnalyticsModule.Analytics.FireEvent.fireDiagCounter
local FireEventStreamFunction = SocialLuaAnalyticsModule.Analytics.FireEvent.fireEventStream
local FireTelemetryFunction = SocialLuaAnalyticsModule.Analytics.FireEvent.fireTelemetry
local DiagActionListModule = require(script.Parent.DiagActionList)
local _ = require(script.Parent.EventNames)
local EventStreamActionListModule = require(script.Parent.EventStreamActionList)
local TelemetryActionListModule = require(script.Parent.TelemetryActionList)

return function(p1)
	-- upvalues: FireEventStreamFunction (copy), EventStreamActionListModule (copy), FireDiagCounterFunction (copy), DiagActionListModule (copy), FireTelemetryFunction (copy), TelemetryActionListModule (copy)
	local FireEventStreamResult = FireEventStreamFunction({
		eventStreamImpl = p1.analytics.EventStream,
		eventList = EventStreamActionListModule,
		infoForAllEvents = p1.infoForAllEvents
	})
	local FireDiagCounterResult = FireDiagCounterFunction({
		diagImpl = p1.analytics.Diag,
		eventList = DiagActionListModule
	})
	local FireTelemetryResult = FireTelemetryFunction({
		telemetryImpl = p1.analytics.Telemetry,
		eventList = TelemetryActionListModule
	})
	
	return function(p2, p3)
		-- upvalues: DiagActionListModule (upval), FireDiagCounterResult (copy), TelemetryActionListModule (upval), FireTelemetryResult (copy), EventStreamActionListModule (upval), FireEventStreamResult (copy)
		if DiagActionListModule[p2] then
			FireDiagCounterResult(p2)
		end
		if TelemetryActionListModule[p2] then
			FireTelemetryResult(p2, p3)
		end
		if EventStreamActionListModule[p2] then
			FireEventStreamResult(p2, p3)
		end
	end
end