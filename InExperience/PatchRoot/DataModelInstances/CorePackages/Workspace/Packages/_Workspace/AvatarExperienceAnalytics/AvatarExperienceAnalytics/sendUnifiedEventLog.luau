local isRunningInStudio = require(script:FindFirstAncestor("AvatarExperienceAnalytics").Parent.AppCommonLib).isRunningInStudio
local analyticsServiceModule = require(script.Parent.AnalyticsService)
local unifiedEventLogConstantsModule = require(script.Parent.UnifiedEventLogConstants)
local AXSendUnifiedEventsInStudio = game:DefineFastFlag("AXSendUnifiedEventsInStudio", false)

return function(p0) --[[ line: 11 ]]
	-- upvalues: isRunningInStudio (ref), AXSendUnifiedEventsInStudio (ref), analyticsServiceModule (ref), unifiedEventLogConstantsModule (ref)
	if isRunningInStudio() and not AXSendUnifiedEventsInStudio then
		return
	end
	analyticsServiceModule.EventStream:sendTelemetryEvent(unifiedEventLogConstantsModule.EVENT_NAME, unifiedEventLogConstantsModule.EVENT_NAME, p0)
end