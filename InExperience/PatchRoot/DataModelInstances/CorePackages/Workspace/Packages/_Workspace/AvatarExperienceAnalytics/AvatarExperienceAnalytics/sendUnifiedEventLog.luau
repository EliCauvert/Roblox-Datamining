local SessionService = game:GetService("SessionService")
local Parent = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent
local CryoModule = require(Parent.Cryo)
local IsRunningInStudioFunction = require(Parent.AppCommonLib).isRunningInStudio
local DebugPanelModule = require(Parent.DebugPanel)
local DeviceTier = require(Parent.Devices).DeviceTier
local AnalyticsServiceModule = require(script.Parent.AnalyticsService)
local UnifiedEventLogConstantsModule = require(script.Parent.UnifiedEventLogConstants)
local UnifiedEventPageStoreModule = require(script.Parent.Store.UnifiedEventPageStore)
local UnifiedEventCounterAggregatorModule = require(script.Parent.Lib.UnifiedEventCounterAggregator)
local AXUnifiedEventFilterModule = require(script.Parent.AXUnifiedEventFilter)
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXSendUnifiedEventLogWithInstance = AvatarExperienceFlagsModule.FFlagAXSendUnifiedEventLogWithInstance
local FFlagAXDebugPanelImpressed = AvatarExperienceFlagsModule.FFlagAXDebugPanelImpressed
local FFlagAXUnifiedEventPageContext = AvatarExperienceFlagsModule.FFlagAXUnifiedEventPageContext
local FFlagAXUnifiedEventCounters = AvatarExperienceFlagsModule.FFlagAXUnifiedEventCounters
local FFlagAXUnifiedEventDeviceTier = AvatarExperienceFlagsModule.FFlagAXUnifiedEventDeviceTier
local AXSendUnifiedEventsInStudio = game:DefineFastFlag("AXSendUnifiedEventsInStudio", false)
local DeviceMemoryTier = if FFlagAXUnifiedEventDeviceTier then DeviceTier.GetDeviceMemoryTier() else nil

return function(JoinResult, p1, p2) --[[ Line: 34 ]]
	-- upvalues: FFlagAXUnifiedEventPageContext (copy), SessionService (copy), UnifiedEventPageStoreModule (copy), CryoModule (copy), FFlagAXUnifiedEventDeviceTier (copy), DeviceMemoryTier (copy), FFlagAXDebugPanelImpressed (copy), DebugPanelModule (copy), FFlagAXSendUnifiedEventLogWithInstance (copy), UnifiedEventLogConstantsModule (copy), IsRunningInStudioFunction (copy), AXSendUnifiedEventsInStudio (copy), FFlagAXUnifiedEventCounters (copy), AXUnifiedEventFilterModule (copy), UnifiedEventCounterAggregatorModule (copy), AnalyticsServiceModule (copy)
	if FFlagAXUnifiedEventPageContext then
		local Level2aSessionTag = SessionService:GetSessionTag("level2a")
		local PageFields = UnifiedEventPageStoreModule.getPageFields()
		JoinResult = CryoModule.Dictionary.join({
			navigationPage = PageFields.navigationPage,
			navigationOpaquePage = PageFields.navigationOpaquePage,
			sessionTag = if Level2aSessionTag == nil or Level2aSessionTag == "" then UnifiedEventPageStoreModule.UNKNOWN else Level2aSessionTag
		}, JoinResult)
	end
	if FFlagAXUnifiedEventDeviceTier then
		JoinResult = CryoModule.Dictionary.join({ deviceTier = DeviceMemoryTier or "Unknown" }, JoinResult)
	end
	if FFlagAXDebugPanelImpressed then
		DebugPanelModule.AnalyticsFeed.notify({
			feedId = "ax.marketplaceLogging",
			fields = JoinResult,
			instance = if FFlagAXSendUnifiedEventLogWithInstance then p1 else nil,
			eventName = UnifiedEventLogConstantsModule.EVENT_NAME,
			ctx = UnifiedEventLogConstantsModule.EVENT_NAME
		})
	end
	if IsRunningInStudioFunction() and not AXSendUnifiedEventsInStudio then return end
	if FFlagAXUnifiedEventCounters then
		UnifiedEventCounterAggregatorModule.record(JoinResult, if p2 == nil or p2.filterPassed == nil then AXUnifiedEventFilterModule.filter(JoinResult, { skipReporting = true }) else p2.filterPassed)
	end
	AnalyticsServiceModule.EventStream:sendTelemetryEvent(UnifiedEventLogConstantsModule.EVENT_NAME, UnifiedEventLogConstantsModule.EVENT_NAME, JoinResult)
end