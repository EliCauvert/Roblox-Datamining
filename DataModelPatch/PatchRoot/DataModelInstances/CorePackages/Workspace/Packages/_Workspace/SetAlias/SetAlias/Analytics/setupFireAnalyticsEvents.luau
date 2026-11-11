local TelemetryActionListModule = require(script.Parent.TelemetryActionList)
local DiagActionListModule = require(script.Parent.DiagActionList)
local EventStreamActionListModule = require(script.Parent.EventStreamActionList)
local AnalyticsFactory = require(script.Parent.Parent.dependencies).SocialLuaAnalytics.Analytics.AnalyticsFactory

return function(p1)
	-- upvalues: AnalyticsFactory (copy), EventStreamActionListModule (copy), DiagActionListModule (copy), TelemetryActionListModule (copy)
	return AnalyticsFactory.setUpAnalyticsFactory({
		eventLists = {
			EventStream = EventStreamActionListModule,
			Diag = DiagActionListModule,
			Telemetry = TelemetryActionListModule
		},
		analyticsImpl = p1.analytics
	})(p1).fireAnalyticsEvent
end