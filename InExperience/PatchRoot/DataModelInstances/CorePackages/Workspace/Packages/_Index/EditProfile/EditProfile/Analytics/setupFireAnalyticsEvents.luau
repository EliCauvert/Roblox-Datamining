local AnalyticsFactory = require(script:FindFirstAncestor("EditProfile").Parent.SocialLuaAnalytics).Analytics.AnalyticsFactory
local DiagActionListModule = require(script.Parent.DiagActionList)
local EventStreamActionListModule = require(script.Parent.EventStreamActionList)
local TelemetryActionListModule = require(script.Parent.TelemetryActionList)

return function(p1) --[[ Line: 10 ]]
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