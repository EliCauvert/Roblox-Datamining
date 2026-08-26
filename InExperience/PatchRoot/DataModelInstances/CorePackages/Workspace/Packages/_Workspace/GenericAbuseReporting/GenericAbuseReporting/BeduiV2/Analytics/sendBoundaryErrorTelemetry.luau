local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local dashModule = require(genericAbuseReporting.Parent.Dash)
local analyticsServiceModule = require(genericAbuseReporting.BeduiV2.Analytics.analyticsService)
local sendAnalyticsEvent = analyticsServiceModule.sendAnalyticsEvent
local telemetryEventType = analyticsServiceModule.TelemetryEventType

return function(p1, p2)
	-- upvalues: dashModule (ref), sendAnalyticsEvent (ref), telemetryEventType (ref)
	sendAnalyticsEvent({
		run_id = "err",
		total_duration = 0,
		abuse_vector = p2.abuse_vector,
		target_id = p2.target_id,
		path = {}
	}, {
		sub_event_type = telemetryEventType.Error,
		error_detail = {
			error_message = `Render error: {dashModule.pretty(p1, { depth = 10, multiline = true })}`
		}
	})
end