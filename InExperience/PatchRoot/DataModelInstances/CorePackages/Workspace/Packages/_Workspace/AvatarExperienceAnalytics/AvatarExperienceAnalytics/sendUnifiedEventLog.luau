local analyticsServiceModule = require(script.Parent.AnalyticsService)
local unifiedEventLogConstantsModule = require(script.Parent.UnifiedEventLogConstants)

return function(p0) --[[ line: 4 ]]
	-- upvalues: analyticsServiceModule (ref), unifiedEventLogConstantsModule (ref)
	analyticsServiceModule.EventStream:sendTelemetryEvent(unifiedEventLogConstantsModule.EVENT_NAME, unifiedEventLogConstantsModule.EVENT_NAME, p0)
end