local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local dashModule = require(genericAbuseReporting.Parent.Dash)
local analyticsServiceModule = require(genericAbuseReporting.BeduiV2.Analytics.analyticsService)
local sendAnalyticsEvent = analyticsServiceModule.sendAnalyticsEvent
local telemetryEventType = analyticsServiceModule.TelemetryEventType

return function(p0, p1) --[[ line: 20 | named "sendBoundaryErrorTelemetry" ]]
	-- upvalues: dashModule (ref), sendAnalyticsEvent (ref), telemetryEventType (ref)
	sendAnalyticsEvent({
		run_id = "err",
		total_duration = 0,
		abuse_vector = p1.abuse_vector,
		target_id = p1.target_id,
		path = {}
	}, {
		sub_event_type = telemetryEventType.Error,
		error_detail = {
			error_message = `Render error: {dashModule.pretty(p0, { depth = 10, multiline = true })}`
		}
	})
end