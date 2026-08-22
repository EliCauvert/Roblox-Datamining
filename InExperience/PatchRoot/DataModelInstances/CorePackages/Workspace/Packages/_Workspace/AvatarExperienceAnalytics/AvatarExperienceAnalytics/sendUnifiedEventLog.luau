local parent = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent
local isRunningInStudio = require(parent.AppCommonLib).isRunningInStudio
local debugPanelModule = require(parent.DebugPanel)
local analyticsServiceModule = require(script.Parent.AnalyticsService)
local unifiedEventLogConstantsModule = require(script.Parent.UnifiedEventLogConstants)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXSendUnifiedEventLogWithInstance = avatarExperienceFlagsModule.FFlagAXSendUnifiedEventLogWithInstance
local fFlagAXDebugPanelImpressed = avatarExperienceFlagsModule.FFlagAXDebugPanelImpressed
local AXSendUnifiedEventsInStudio = game:DefineFastFlag("AXSendUnifiedEventsInStudio", false)

return function(p0, p1) --[[ line: 18 ]]
	-- upvalues: fFlagAXDebugPanelImpressed (ref), debugPanelModule (ref), fFlagAXSendUnifiedEventLogWithInstance (ref), unifiedEventLogConstantsModule (ref), isRunningInStudio (ref), AXSendUnifiedEventsInStudio (ref), analyticsServiceModule (ref)
	if fFlagAXDebugPanelImpressed then
		debugPanelModule.AnalyticsFeed.notify({
			feedId = "ax.marketplaceLogging",
			fields = p0,
			instance = if fFlagAXSendUnifiedEventLogWithInstance then p1 else nil,
			eventName = unifiedEventLogConstantsModule.EVENT_NAME,
			ctx = unifiedEventLogConstantsModule.EVENT_NAME
		})
	end
	if isRunningInStudio() and not AXSendUnifiedEventsInStudio then
		return
	end
	analyticsServiceModule.EventStream:sendTelemetryEvent(unifiedEventLogConstantsModule.EVENT_NAME, unifiedEventLogConstantsModule.EVENT_NAME, p0)
end