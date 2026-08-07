local socialLuaAnalytics = require(script.Parent.Parent.dependencies).SocialLuaAnalytics
local telemetryActionListModule = require(script.Parent.TelemetryActionList)
local diagActionListModule = require(script.Parent.DiagActionList)
local eventStreamActionListModule = require(script.Parent.EventStreamActionList)
local analyticsFactory = socialLuaAnalytics.Analytics.AnalyticsFactory

return function(p0) --[[ line: 11 ]]
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