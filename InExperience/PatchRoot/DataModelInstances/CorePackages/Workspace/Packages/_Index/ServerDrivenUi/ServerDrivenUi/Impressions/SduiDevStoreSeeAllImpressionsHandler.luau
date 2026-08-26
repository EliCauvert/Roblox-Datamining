local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local edpStoreAnalyticsModule = require(parent.EdpStoreAnalytics)
local edpStoreAnalyticsLogger = edpStoreAnalyticsModule.EdpStoreAnalyticsLogger
local storeEnums = edpStoreAnalyticsModule.Constants.StoreEnums
local unifiedEventLogEnums = require(parent.AvatarExperienceAnalytics).UnifiedEventLogEnums
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrors = sduiCoreSystemModule.SduiErrors
local sduiLogger = sduiCoreSystemModule.SduiLogger
local findAnalyticsFieldInAncestors = sduiCoreSystemModule.findAnalyticsFieldInAncestors
local sduiMarketplaceItemImpressionsHandlerModule = require(serverDrivenUi.Impressions.SduiMarketplaceItemImpressionsHandler)
local marketplaceUnifiedItemType = unifiedEventLogEnums.MarketplaceUnifiedItemType
local tbl = setmetatable({}, { __mode = "k" })

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: findAnalyticsFieldInAncestors (ref), marketplaceUnifiedItemType (ref), sduiMarketplaceItemImpressionsHandlerModule (ref), sduiLogger (ref), sduiErrors (ref), tbl (ref), edpStoreAnalyticsLogger (ref), storeEnums (ref)
	if #p2 == 0 then return end
	local t = { analyticsData = p4 }
	local var1 = findAnalyticsFieldInAncestors("itemType", t)
	
	if if var1 ~= nil then nil else marketplaceUnifiedItemType[var1] then
		sduiMarketplaceItemImpressionsHandlerModule(p1, p2, p3, p4, p5, p6)
	end
	local var2 = findAnalyticsFieldInAncestors("experienceStoreProductType", t)
	
	if not var2 then
		sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToLogExperienceStoreImpressions, {
			name = "SduiDevStoreSeeAllImpressionsHandler",
			message = "Missing experienceStoreProductType on collectionAnalyticsData"
		}, p1.appPage)
		
		return
	end
	local var3 = tostring(var2)
	local var4 = tbl[p1]
	
	if not var4 then
		var4 = {}
		tbl[p1] = var4
	end
	if var4[var3] then
		return
	end
	var4[var3] = true
	local var5 = findAnalyticsFieldInAncestors("universeId", t)
	edpStoreAnalyticsLogger.logImpression({
		layoutOrder = 1,
		actionType = storeEnums.ActionType.Impression,
		productType = var2,
		locationType = findAnalyticsFieldInAncestors("edpLocationType", t),
		universeId = if var5 ~= nil then nil else tonumber(tostring(var5))
	})
	edpStoreAnalyticsLogger.logExperienceStoreExposure()
end