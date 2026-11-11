local SocialLuaAnalyticsModule = require(script.Parent.Parent.Parent.SocialLuaAnalytics)
local FireEventStreamFunction = SocialLuaAnalyticsModule.Analytics.FireEvent.fireEventStream
local FireTelemetryFunction = SocialLuaAnalyticsModule.Analytics.FireEvent.fireTelemetry
local _ = require(script.Parent.EventNames)
local EventStreamActionListModule = require(script.Parent.EventStreamActionList)
local TelemetryActionListModule = require(script.Parent.TelemetryActionList)

return function(p1)
	-- upvalues: FireEventStreamFunction (copy), EventStreamActionListModule (copy), FireTelemetryFunction (copy), TelemetryActionListModule (copy)
	local FireEventStreamResult = FireEventStreamFunction({
		eventStreamImpl = p1.analytics.EventStream,
		eventList = EventStreamActionListModule,
		infoForAllEvents = p1.infoForAllEvents
	})
	local FireTelemetryResult = FireTelemetryFunction({
		telemetryImpl = p1.analytics.Telemetry,
		eventList = TelemetryActionListModule
	})
	
	return function(p2, p3)
		-- upvalues: TelemetryActionListModule (upval), FireTelemetryResult (copy), EventStreamActionListModule (upval), FireEventStreamResult (copy)
		if TelemetryActionListModule[p2] then
			FireTelemetryResult(p2, p3)
		end
		if EventStreamActionListModule[p2] then
			FireEventStreamResult(p2, p3)
		end
	end
end