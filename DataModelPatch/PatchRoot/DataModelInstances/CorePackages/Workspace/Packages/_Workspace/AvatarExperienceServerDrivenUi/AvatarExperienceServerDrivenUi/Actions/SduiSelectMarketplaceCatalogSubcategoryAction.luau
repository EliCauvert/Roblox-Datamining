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

local function emitSubcategoryClickUnifiedEvent(SubcategoryId, p1, p2)
	-- upvalues: DataHydrationModule (copy), GetUnifiedLoggingSurfaceForAppPageFunction (copy), UnifiedEventLogEnums (copy), SendUnifiedEventLogForInstanceFunction (copy), SendUnifiedEventLogFunction (copy)
	local MarketplaceCatalogCategory = DataHydrationModule.MarketplaceCatalogCategory.getMarketplaceCatalogCategoryStore(false).getMarketplaceCatalogCategory(SubcategoryId)
	local DataResult = if MarketplaceCatalogCategory and MarketplaceCatalogCategory.data then MarketplaceCatalogCategory.data(false) else nil
	local Name = if DataResult and typeof(DataResult.name) == "string" and DataResult.name ~= "" then DataResult.name else nil
	
	if Name == nil then return end
	local UnifiedLoggingSurfaceForAppPage = GetUnifiedLoggingSurfaceForAppPageFunction(p1.appPage)
	
	if UnifiedLoggingSurfaceForAppPage == nil then return end
	local config = {
		action = UnifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
		elementName = "SELECT_SUBCATEGORY_" .. string.upper(Name),
		surface = UnifiedLoggingSurfaceForAppPage
	}
	
	if p2 == nil then
		SendUnifiedEventLogFunction(config)
		
		return
	else
		SendUnifiedEventLogForInstanceFunction(p2, config)
	end
end

return function(p1, _, p2, p3)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), emitSubcategoryClickUnifiedEvent (copy), MarketplaceCatalogSduiSelectionBridgeModule (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = SduiActionType.SelectMarketplaceCatalogSubcategory
		}, p2.appPage)
		
		return
	end
	local SubcategoryId = ActionParams.subcategoryId
	
	if typeof(SubcategoryId) == "string" and SubcategoryId ~= "" then
		emitSubcategoryClickUnifiedEvent(SubcategoryId, p2, p3)
		MarketplaceCatalogSduiSelectionBridgeModule.selectSubcategory(SubcategoryId)
		
		return
	else
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			name = SduiActionType.SelectMarketplaceCatalogSubcategory,
			message = `Invalid or missing subcategoryId: {SubcategoryId}`
		}, p2.appPage)
	end
end