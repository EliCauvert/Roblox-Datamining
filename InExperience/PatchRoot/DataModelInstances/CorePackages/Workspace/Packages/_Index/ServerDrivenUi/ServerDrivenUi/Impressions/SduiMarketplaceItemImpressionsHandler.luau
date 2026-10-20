local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local AvatarExperienceAnalyticsModule = require(Parent.AvatarExperienceAnalytics)
local AXUnifiedEventFilter = AvatarExperienceAnalyticsModule.AXUnifiedEventFilter
local UnifiedEventLogEnums = AvatarExperienceAnalyticsModule.UnifiedEventLogEnums
local SendUnifiedEventLogFunction = AvatarExperienceAnalyticsModule.sendUnifiedEventLog
local UnifiedEventLoggingUtils = AvatarExperienceAnalyticsModule.Utils.UnifiedEventLoggingUtils
local FFlagAXUnifiedEventCounters = AvatarExperienceAnalyticsModule.Flags.FFlagAXUnifiedEventCounters
local UnifiedLoggingSurface = require(Parent.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiErrors = SduiCoreSystemModule.SduiErrors
local SduiLogger = SduiCoreSystemModule.SduiLogger
local FindAnalyticsFieldInAncestorsFunction = SduiCoreSystemModule.findAnalyticsFieldInAncestors
local FindCollectionItemInstancesModule = require(ServerDrivenUi.Analytics.findCollectionItemInstances)
local t = {}
local MarketplaceUnifiedAction = UnifiedEventLogEnums.MarketplaceUnifiedAction
local MarketplaceUnifiedItemType = UnifiedEventLogEnums.MarketplaceUnifiedItemType

local function _(p1: number, p2: number)
	if p2 and p2 > 0 then
		return math.ceil(p1 / p2), (p1 - 1) % p2 + 1
	else
		return 1, p1
	end
end

return function(p1, List, p2, AnalyticsData, p3, p4): number
	-- upvalues: t (copy), SduiLogger (copy), SduiErrors (copy), FindAnalyticsFieldInAncestorsFunction (copy), UnifiedLoggingSurface (copy), MarketplaceUnifiedItemType (copy), FindCollectionItemInstancesModule (copy), MarketplaceUnifiedAction (copy), UnifiedEventLoggingUtils (copy), FFlagAXUnifiedEventCounters (copy), AXUnifiedEventFilter (copy), SendUnifiedEventLogFunction (copy)
	if #List == 0 or #(p2 or t) == 0 then
		SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToLogMarketplaceItemImpressions, {
			name = "SduiMarketplaceItemImpressionsHandler",
			message = `No entries to log: impressionIndexes={#List}, itemAnalyticsDatas={#(p2 or t)}`
		}, p1.appPage)
		
		return 0
	end
	local config = { analyticsData = AnalyticsData }
	local Surface = FindAnalyticsFieldInAncestorsFunction("surface", config)
	local ItemType = FindAnalyticsFieldInAncestorsFunction("itemType", config)
	local UniverseId = FindAnalyticsFieldInAncestorsFunction("universeId", config)
	local ItemsPerRow = FindAnalyticsFieldInAncestorsFunction("itemsPerRow", config)
	local Number = if UniverseId == nil then nil else tonumber(UniverseId)
	local Number1 = if ItemsPerRow == nil then nil else tonumber(ItemsPerRow)
	local UnifiedLoggingSurfaceEntry = if Surface == nil then nil else UnifiedLoggingSurface[Surface]
	local MarketplaceUnifiedItemTypeEntry = if ItemType == nil then nil else MarketplaceUnifiedItemType[ItemType]
	
	if not UnifiedLoggingSurfaceEntry then
		SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToLogMarketplaceItemImpressions, {
			name = "SduiMarketplaceItemImpressionsHandler",
			message = `Missing or unknown surface on analytics data: {tostring(Surface)}`
		}, p1.appPage)
		
		return 0
	end
	if not MarketplaceUnifiedItemTypeEntry then
		SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToLogMarketplaceItemImpressions, {
			name = "SduiMarketplaceItemImpressionsHandler",
			message = `Missing or unknown itemType on analytics data: {tostring(ItemType)}`
		}, p1.appPage)
		
		return 0
	end
	local CollectionItemInstancesModule = FindCollectionItemInstancesModule(p4)
	local Count = 0
	
	for _, value in List do
		local v1 = p2[value]
		
		if v1 ~= nil then
			local NewValue = (p3 or 0) + value
			local Ceiled = nil
			local GridPositionColumn = nil
			
			if Number1 and Number1 > 0 then
				Ceiled = math.ceil(NewValue / Number1)
				GridPositionColumn = (NewValue - 1) % Number1 + 1
			else
				Ceiled = 1
				GridPositionColumn = NewValue
			end
			local config1 = {
				action = MarketplaceUnifiedAction.ITEM_IMPRESSION,
				surface = UnifiedLoggingSurfaceEntry,
				itemType = MarketplaceUnifiedItemTypeEntry,
				itemId = v1.id,
				universeId = Number,
				gridPositionRow = Ceiled,
				gridPositionColumn = GridPositionColumn
			}
			local CollectionItemInstancesModuleEntry = CollectionItemInstancesModule[value]
			
			if CollectionItemInstancesModuleEntry then
				for i, value1 in UnifiedEventLoggingUtils.getScreenSize(CollectionItemInstancesModuleEntry) do
					config1[i] = value1
				end
				for i1, value2 in UnifiedEventLoggingUtils.getElementSizeAndPosition(CollectionItemInstancesModuleEntry) do
					config1[i1] = value2
				end
			end
			local FilterResult = nil
			
			if FFlagAXUnifiedEventCounters then
				FilterResult = AXUnifiedEventFilter.filter(config1)
			else
				AXUnifiedEventFilter.filter(config1)
			end
			SendUnifiedEventLogFunction(config1, nil, if FFlagAXUnifiedEventCounters then { filterPassed = FilterResult } else nil)
			Count += 1
		end
	end
	if Count == 0 then
		SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToLogMarketplaceItemImpressions, {
			name = "SduiMarketplaceItemImpressionsHandler",
			message = "No valid items found for impression indexes"
		}, p1.appPage)
	end
	return Count
end