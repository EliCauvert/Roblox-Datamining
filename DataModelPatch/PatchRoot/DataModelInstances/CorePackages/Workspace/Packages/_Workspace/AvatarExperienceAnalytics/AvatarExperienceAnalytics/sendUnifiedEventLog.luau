local AnalyticsServiceModule = require(script.Parent.AnalyticsService)
local UnifiedEventLogConstantsModule = require(script.Parent.UnifiedEventLogConstants)

return function(p1)
	-- upvalues: AnalyticsServiceModule (copy), UnifiedEventLogConstantsModule (copy)
	AnalyticsServiceModule.EventStream:sendTelemetryEvent(UnifiedEventLogConstantsModule.EVENT_NAME, UnifiedEventLogConstantsModule.EVENT_NAME, p1)
end