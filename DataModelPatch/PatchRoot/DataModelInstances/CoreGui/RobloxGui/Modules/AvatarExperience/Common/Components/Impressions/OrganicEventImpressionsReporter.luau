local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CollectionService = game:GetService("CollectionService")
local ReactModule = require(CorePackages.Packages.React)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local AvatarExperienceAnalyticsModule = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics)
local ImpressionsUtil = AvatarExperienceAnalyticsModule.ImpressionsReporter.ImpressionsUtil
local OrganicEventImpressionsSchema = AvatarExperienceAnalyticsModule.ImpressionsReporter.OrganicEventImpressionsSchema
local ImpressionEnums = AvatarExperienceAnalyticsModule.Enums.ImpressionEnums
local AvatarExperienceScreenSizeImpressionsDetector = AvatarExperienceAnalyticsModule.AvatarExperienceScreenSizeImpressionsDetector
local AnalyticsService = AvatarExperienceAnalyticsModule.AnalyticsService
local AvatarExperiencePointsTelemetryModule = require(Modules.AvatarExperience.Common.Components.Impressions.AvatarExperiencePointsTelemetry)
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local EnableImpressionReporterCounter3 = game:DefineFastFlag("EnableImpressionReporterCounter3", false)
local CatalogTilesLatencyTrackerModule = require(Modules.AvatarExperience.Catalog.Actions.CatalogTilesLatencyTracker)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local UseTileThumbnailLatencyTrackerModule = require(Modules.AvatarExperience.Common.Hooks.TileLatency.useTileThumbnailLatencyTracker)
local GetFFlagEnableCatalogTileLoadingLatencyModule = require(Modules.AvatarExperience.Flags.GetFFlagEnableCatalogTileLoadingLatency)
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local AXCatalogPerfReduxReductionIXPModule = require(Modules.AvatarExperience.Experiments.AXCatalogPerfReduxReductionIXP)
local AXImpressionReporterConditionalHookBacktraceError = game:DefineFastFlag("AXImpressionReporterConditionalHookBacktraceError", false)
local AXConditionalHookForOrganicImpressionReporter = game:DefineFastFlag("AXConditionalHookForOrganicImpressionReporter", false)
local UseCategoryInfoModule = require(Modules.AvatarExperience.Common.Hooks.useCategoryInfo)
local FFlagAXMoveAllTabToWidgetOnly = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXMoveAllTabToWidgetOnly
local ITEMIMPRESSION = ImpressionEnums.ActionType.ITEM_IMPRESSION
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local SelectFilterCountModule = require(Modules.AvatarExperience.Catalog.Selectors.selectFilterCount)
local GetUseSelectorDeepEqualsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local GetShouldPageUseWidgetOnlyFetcherFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).Utils.getShouldPageUseWidgetOnlyFetcher

return function(p1)
	-- upvalues: AnalyticsService (copy), EnableImpressionReporterCounter3 (copy), UseRoactServiceModule (copy), AnalyticsModule (copy), ReactModule (copy), UseDispatchFunction (copy), AXCatalogPerfReduxReductionIXPModule (copy), IxpUtilsModule (copy), AXImpressionReporterConditionalHookBacktraceError (copy), UseCategoryInfoModule (copy), FFlagAXMoveAllTabToWidgetOnly (copy), UseSelectorFunction (copy), GetUseSelectorDeepEqualsFunction (copy), SelectFilterCountModule (copy), GetShouldPageUseWidgetOnlyFetcherFunction (copy), AXConditionalHookForOrganicImpressionReporter (copy), GetFFlagEnableCatalogTileLoadingLatencyModule (copy), UseTileThumbnailLatencyTrackerModule (copy), ConstantsModule (copy), CollectionService (copy), OrganicEventImpressionsSchema (copy), ImpressionsUtil (copy), CatalogTilesLatencyTrackerModule (copy), ITEMIMPRESSION (copy), AvatarExperiencePointsTelemetryModule (copy), ImpressionEnums (copy), AvatarExperienceScreenSizeImpressionsDetector (copy)
	local EventStream = AnalyticsService.EventStream
	local UseRoactServiceModuleResult = if EnableImpressionReporterCounter3 then UseRoactServiceModule(AnalyticsModule) else nil
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseStateResult1 = ReactModule.useState({})
	local UseRefResult = ReactModule.useRef({})
	local UseDispatchResult = UseDispatchFunction()
	local TestVariable = if AXCatalogPerfReduxReductionIXPModule.isEnabled() then IxpUtilsModule.readTestVariable(AXCatalogPerfReduxReductionIXPModule.EnabledForUser) else nil
	local v1 = nil
	local UseStateResult3 = nil
	local UseStateResult2_1 = nil
	
	if AXImpressionReporterConditionalHookBacktraceError and AXCatalogPerfReduxReductionIXPModule.isEnabled() then
		v1 = UseCategoryInfoModule()
		UseStateResult3, UseStateResult2_1 = ReactModule.useState(if v1 then v1.Name else "")
	else
		if TestVariable then
			v1 = UseCategoryInfoModule()
		end
		UseStateResult3, UseStateResult2_1 = ReactModule.useState(if TestVariable and v1 then v1.Name else "")
	end
	local v2: boolean? = nil
	
	if FFlagAXMoveAllTabToWidgetOnly then
		local UseSelectorResult = UseSelectorFunction(function(p2)
			-- upvalues: p1 (copy)
			return if p1.searchUuid then p2.SearchesParameters[p1.searchUuid] else nil
		end, GetUseSelectorDeepEqualsFunction())
		v2 = not GetShouldPageUseWidgetOnlyFetcherFunction(v1, UseSelectorFunction(SelectFilterCountModule), UseSelectorResult and UseSelectorResult.searchKeyword)
	end
	if AXConditionalHookForOrganicImpressionReporter and GetFFlagEnableCatalogTileLoadingLatencyModule() then
		UseTileThumbnailLatencyTrackerModule(p1.searchUuid, v2)
	elseif GetFFlagEnableCatalogTileLoadingLatencyModule() and p1.searchUuid then
		UseTileThumbnailLatencyTrackerModule(p1.searchUuid)
	end
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), UseStateResult (copy), ConstantsModule (upval)
		task.delay(1, function()
			-- upvalues: UseStateResult2 (upval), UseStateResult (upval), ConstantsModule (upval)
			UseStateResult2(UseStateResult + ConstantsModule.ImpressionsDetectionInterval)
		end)
	end, { UseStateResult })
	
	local function collect(_)
		-- upvalues: CollectionService (upval), p1 (copy)
		return CollectionService:GetTagged(p1.impressionsTag)
	end
	
	local UseRefResult1 = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: TestVariable (copy), v1 (ref), UseStateResult3 (ref), UseStateResult2_1 (ref), UseRefResult1 (copy)
		if TestVariable and v1 and v1.Name and v1.Name ~= UseStateResult3 then
			UseStateResult2_1(v1.Name)
			UseRefResult1.current = false
		end
	end, { v1, UseStateResult3, TestVariable })
	
	return ReactModule.createElement(AvatarExperienceScreenSizeImpressionsDetector, {
		parentRef = p1.parentRef,
		pageFilter = p1.pageFilter,
		onRequestImpressionsSignal = p1.onRequestImpressionsSignal,
		collectObjectsFunc = collect,
		filterImpressionFunc = function(Object): boolean
			-- upvalues: p1 (copy), TestVariable (copy), UseRefResult (copy), UseStateResult1 (copy)
			local Attribute = Object:GetAttribute(p1.impressionsTag)
			
			return if TestVariable then Attribute and not UseRefResult.current[Attribute] else Attribute and not UseStateResult1[Attribute]
		end,
		onImpressionsDetected = function(List)
			-- upvalues: p1 (copy), TestVariable (copy), UseRefResult (copy), UseStateResult1 (copy), OrganicEventImpressionsSchema (upval), ImpressionsUtil (upval), UseRefResult1 (copy), UseDispatchResult (copy), CatalogTilesLatencyTrackerModule (upval), GetFFlagEnableCatalogTileLoadingLatencyModule (upval), ITEMIMPRESSION (upval), EnableImpressionReporterCounter3 (upval), UseRoactServiceModuleResult (copy), AvatarExperiencePointsTelemetryModule (upval), ImpressionEnums (upval), EventStream (copy)
			for _, value in List do
				local Attribute = value:GetAttribute(p1.impressionsTag)
				
				if TestVariable then
					UseRefResult.current[Attribute] = true
				else
					UseStateResult1[Attribute] = true
				end
			end
			local OrganicEventImpressionsSchemaEntry = OrganicEventImpressionsSchema[p1.impressionsSchema]
			local PackEventsResult = ImpressionsUtil.packEvents(OrganicEventImpressionsSchemaEntry, List)
			
			if TestVariable and p1.searchUuid and not UseRefResult1.current and UseRefResult.current then
				UseRefResult1.current = true
				local List1 = {}
				
				for i in UseRefResult.current do
					table.insert(List1, i)
				end
				if #List1 > 0 then
					UseDispatchResult(CatalogTilesLatencyTrackerModule.SetLoadedThumbnails(p1.searchUuid, List1))
				end
			elseif GetFFlagEnableCatalogTileLoadingLatencyModule() and p1.searchUuid and UseStateResult1 then
				for i1 in pairs(UseStateResult1) do
					UseDispatchResult(CatalogTilesLatencyTrackerModule.SetLoadedThumbnail(p1.searchUuid, i1))
				end
			end
			if PackEventsResult then
				for _, value1 in PackEventsResult do
					local Text = if p1.eventNamePrefix then p1.eventNamePrefix .. p1.eventName else p1.eventName
					value1.surface = p1.surface
					
					if p1.surface and p1.analyticsMetadata and OrganicEventImpressionsSchemaEntry.surfaceSpecificAnalyticsMetadata then
						local SurfaceSpecificAnalyticsMeta = OrganicEventImpressionsSchemaEntry.surfaceSpecificAnalyticsMetadata[p1.surface]
						
						if SurfaceSpecificAnalyticsMeta then
							for _, value2 in SurfaceSpecificAnalyticsMeta do
								value1[value2.out] = p1.analyticsMetadata[value2.prop]
							end
						end
					end
					value1.requestId = p1.requestId
					value1.actionType = ITEMIMPRESSION
					
					if EnableImpressionReporterCounter3 then
						UseRoactServiceModuleResult.sendCounter("AvatarCatalogImpressionReported")
						AvatarExperiencePointsTelemetryModule.sendTelemetryEvent("Impression", { id = p1.requestId })
					end
					value1.event_sender_api = ImpressionEnums.MarketplaceEventSenderAPI.SEND_ROBLOX_TELEMETRY_EVENT
					EventStream:sendTelemetryEvent(p1.eventContext, Text, value1)
				end
			end
		end
	})
end