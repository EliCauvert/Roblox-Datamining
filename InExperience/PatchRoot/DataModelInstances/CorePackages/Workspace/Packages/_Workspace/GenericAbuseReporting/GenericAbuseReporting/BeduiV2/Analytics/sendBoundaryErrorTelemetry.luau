local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local DashModule = require(GenericAbuseReporting.Parent.Dash)
local AnalyticsServiceModule = require(GenericAbuseReporting.BeduiV2.Analytics.analyticsService)
local SendAnalyticsEventFunction = AnalyticsServiceModule.sendAnalyticsEvent
local TelemetryEventType = AnalyticsServiceModule.TelemetryEventType

return function(p1, p2) --[[ Line: 20 | Named "sendBoundaryErrorTelemetry" ]]
	-- upvalues: DashModule (copy), SendAnalyticsEventFunction (copy), TelemetryEventType (copy)
	SendAnalyticsEventFunction({
		run_id = "err",
		total_duration = 0,
		abuse_vector = p2.abuse_vector,
		target_id = p2.target_id,
		path = {}
	}, {
		sub_event_type = TelemetryEventType.Error,
		error_detail = {
			error_message = `Render error: {DashModule.pretty(p1, { depth = 10, multiline = true })}`
		}
	})
end