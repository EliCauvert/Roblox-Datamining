local analyticsFactory = require(script:FindFirstAncestor("EditProfileBackground").Parent.SocialLuaAnalytics).Analytics.AnalyticsFactory
local diagActionListModule = require(script.Parent.DiagActionList)
local eventStreamActionListModule = require(script.Parent.EventStreamActionList)
local telemetryActionListModule = require(script.Parent.TelemetryActionList)

return function(p0)
	-- upvalues: analyticsFactory (ref), eventStreamActionListModule (ref), diagActionListModule (ref), telemetryActionListModule (ref)
	return analyticsFactory.setUpAnalyticsFactory({
		eventLists = {
			EventStream = eventStreamActionListModule,
			Diag = diagActionListModule,
			Telemetry = telemetryActionListModule
		},
		analyticsImpl = p0.analytics
	})(p0).fireAnalyticsEvent
end