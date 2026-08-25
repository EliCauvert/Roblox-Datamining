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

return function(p0, p1, p2, p3, p4, p5)
	-- upvalues: findAnalyticsFieldInAncestors (ref), marketplaceUnifiedItemType (ref), sduiMarketplaceItemImpressionsHandlerModule (ref), sduiLogger (ref), sduiErrors (ref), tbl (ref), edpStoreAnalyticsLogger (ref), storeEnums (ref)
	if #p1 == 0 then return end
	local t = { analyticsData = p3 }
	local var6 = findAnalyticsFieldInAncestors("itemType", t)
	
	if if var6 ~= nil then nil else marketplaceUnifiedItemType[var6] then
		sduiMarketplaceItemImpressionsHandlerModule(p0, p1, p2, p3, p4, p5)
	end
	local var7 = findAnalyticsFieldInAncestors("experienceStoreProductType", t)
	
	if not var7 then
		sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToLogExperienceStoreImpressions, {
			name = "SduiDevStoreSeeAllImpressionsHandler",
			message = "Missing experienceStoreProductType on collectionAnalyticsData"
		}, p0.appPage)
		
		return
	end
	local var8 = tostring(var7)
	local var9 = tbl[p0]
	
	if not var9 then
		var9 = {}
		tbl[p0] = var9
	end
	if var9[var8] then
		return
	end
	var9[var8] = true
	local var10 = findAnalyticsFieldInAncestors("universeId", t)
	edpStoreAnalyticsLogger.logImpression({
		layoutOrder = 1,
		actionType = storeEnums.ActionType.Impression,
		productType = var7,
		locationType = findAnalyticsFieldInAncestors("edpLocationType", t),
		universeId = if var10 ~= nil then nil else tonumber(tostring(var10))
	})
	edpStoreAnalyticsLogger.logExperienceStoreExposure()
end