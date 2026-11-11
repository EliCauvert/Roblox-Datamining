local AvatarExperienceServerDrivenUi = script:FindFirstAncestor("AvatarExperienceServerDrivenUi")
local Parent = AvatarExperienceServerDrivenUi.Parent
local MarketplaceCatalogSduiSelectionBridgeModule = require(AvatarExperienceServerDrivenUi.System.MarketplaceCatalogSduiSelectionBridge)
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local AvatarExperienceAnalyticsModule = require(Parent.AvatarExperienceAnalytics)
local SendUnifiedEventLogFunction = AvatarExperienceAnalyticsModule.sendUnifiedEventLog
local SendUnifiedEventLogForInstanceFunction = AvatarExperienceAnalyticsModule.sendUnifiedEventLogForInstance
local UnifiedEventLogEnums = AvatarExperienceAnalyticsModule.UnifiedEventLogEnums
local GetUnifiedLoggingSurfaceForAppPageFunction = AvatarExperienceAnalyticsModule.Utils.getUnifiedLoggingSurfaceForAppPage
local DataHydrationModule = require(Parent.DataHydration)
local config = { Recommended = "All" }

local function emitCategoryClickUnifiedEvent(CategoryId, p1, p2)
	-- upvalues: DataHydrationModule (copy), config (copy), GetUnifiedLoggingSurfaceForAppPageFunction (copy), UnifiedEventLogEnums (copy), SendUnifiedEventLogForInstanceFunction (copy), SendUnifiedEventLogFunction (copy)
	local MarketplaceCatalogCategory = DataHydrationModule.MarketplaceCatalogCategory.getMarketplaceCatalogCategoryStore(false).getMarketplaceCatalogCategory(CategoryId)
	local DataResult = if MarketplaceCatalogCategory and MarketplaceCatalogCategory.data then MarketplaceCatalogCategory.data(false) else nil
	local Name = if DataResult and typeof(DataResult.name) == "string" and DataResult.name ~= "" then DataResult.name else nil
	
	if Name == nil then return end
	local Entry = config[CategoryId] or Name
	local UnifiedLoggingSurfaceForAppPage = GetUnifiedLoggingSurfaceForAppPageFunction(p1.appPage)
	
	if UnifiedLoggingSurfaceForAppPage == nil then return end
	local config1 = {
		action = UnifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
		elementName = "SELECT_CATEGORY_" .. string.upper(Entry),
		surface = UnifiedLoggingSurfaceForAppPage
	}
	
	if p2 == nil then
		SendUnifiedEventLogFunction(config1)
		
		return
	else
		SendUnifiedEventLogForInstanceFunction(p2, config1)
	end
end

return function(p1, _, p2, p3)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), emitCategoryClickUnifiedEvent (copy), MarketplaceCatalogSduiSelectionBridgeModule (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = SduiActionType.SelectMarketplaceCatalogCategory
		}, p2.appPage)
		
		return
	end
	local CategoryId = ActionParams.categoryId
	
	if typeof(CategoryId) == "string" and CategoryId ~= "" then
		emitCategoryClickUnifiedEvent(CategoryId, p2, p3)
		MarketplaceCatalogSduiSelectionBridgeModule.selectCategory(CategoryId)
		
		return
	else
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			name = SduiActionType.SelectMarketplaceCatalogCategory,
			message = `Invalid or missing categoryId: {CategoryId}`
		}, p2.appPage)
	end
end