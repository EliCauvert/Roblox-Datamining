local sessionService = game:GetService("SessionService")
local parent = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent
local cryoModule = require(parent.Cryo)
local isRunningInStudio = require(parent.AppCommonLib).isRunningInStudio
local debugPanelModule = require(parent.DebugPanel)
local analyticsServiceModule = require(script.Parent.AnalyticsService)
local unifiedEventLogConstantsModule = require(script.Parent.UnifiedEventLogConstants)
local unifiedEventPageStoreModule = require(script.Parent.Store.UnifiedEventPageStore)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXSendUnifiedEventLogWithInstance = avatarExperienceFlagsModule.FFlagAXSendUnifiedEventLogWithInstance
local fFlagAXDebugPanelImpressed = avatarExperienceFlagsModule.FFlagAXDebugPanelImpressed
local fFlagAXUnifiedEventPageContext = avatarExperienceFlagsModule.FFlagAXUnifiedEventPageContext
local AXSendUnifiedEventsInStudio = game:DefineFastFlag("AXSendUnifiedEventsInStudio", false)

return function(p1, p2)
	-- upvalues: fFlagAXUnifiedEventPageContext (ref), sessionService (ref), unifiedEventPageStoreModule (ref), cryoModule (ref), fFlagAXDebugPanelImpressed (ref), debugPanelModule (ref), fFlagAXSendUnifiedEventLogWithInstance (ref), unifiedEventLogConstantsModule (ref), isRunningInStudio (ref), AXSendUnifiedEventsInStudio (ref), analyticsServiceModule (ref)
	if fFlagAXUnifiedEventPageContext then
		local level2aSessionTag = sessionService:GetSessionTag("level2a")
		local pageFields = unifiedEventPageStoreModule.getPageFields()
		p1 = cryoModule.Dictionary.join({
			navigationPage = pageFields.navigationPage,
			navigationOpaquePage = pageFields.navigationOpaquePage,
			sessionTag = if level2aSessionTag == nil or level2aSessionTag == "" then unifiedEventPageStoreModule.UNKNOWN else level2aSessionTag
		}, p1)
	end
	if fFlagAXDebugPanelImpressed then
		debugPanelModule.AnalyticsFeed.notify({
			feedId = "ax.marketplaceLogging",
			fields = p1,
			instance = if fFlagAXSendUnifiedEventLogWithInstance then p2 else nil,
			eventName = unifiedEventLogConstantsModule.EVENT_NAME,
			ctx = unifiedEventLogConstantsModule.EVENT_NAME
		})
	end
	if isRunningInStudio() and not AXSendUnifiedEventsInStudio then
		return
	end
	analyticsServiceModule.EventStream:sendTelemetryEvent(unifiedEventLogConstantsModule.EVENT_NAME, unifiedEventLogConstantsModule.EVENT_NAME, p1)
end