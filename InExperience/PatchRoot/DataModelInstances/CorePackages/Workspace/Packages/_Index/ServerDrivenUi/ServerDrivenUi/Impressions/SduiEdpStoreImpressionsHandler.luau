local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local edpStoreAnalyticsModule = require(parent.EdpStoreAnalytics)
local edpStoreAnalyticsLogger = edpStoreAnalyticsModule.EdpStoreAnalyticsLogger
local storeEnums = edpStoreAnalyticsModule.Constants.StoreEnums
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrors = sduiCoreSystemModule.SduiErrors
local sduiLogger = sduiCoreSystemModule.SduiLogger
local findAnalyticsFieldInAncestors = sduiCoreSystemModule.findAnalyticsFieldInAncestors
local sduiMarketplaceItemImpressionsHandlerModule = require(serverDrivenUi.Impressions.SduiMarketplaceItemImpressionsHandler)

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: sduiMarketplaceItemImpressionsHandlerModule (ref), findAnalyticsFieldInAncestors (ref), sduiLogger (ref), sduiErrors (ref), edpStoreAnalyticsLogger (ref), storeEnums (ref)
	if sduiMarketplaceItemImpressionsHandlerModule(p1, p2, p3, p4, p5, p6) == 0 then return end
	local t = { analyticsData = p4 }
	local var1 = findAnalyticsFieldInAncestors("itemType", t)
	local var2 = findAnalyticsFieldInAncestors("edpLocationType", t)
	local var3 = findAnalyticsFieldInAncestors("universeId", t)
	local var4 = if var3 ~= nil then nil else tonumber(var3)
	
	if not var1 then
		sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToLogExperienceStoreImpressions, {
			name = "SduiEdpStoreImpressionsHandler",
			message = "Missing itemType on collectionAnalyticsData"
		}, p1.appPage)
		
		return
	end
	for i, v in p2 do
		if p3[v] ~= nil then
			edpStoreAnalyticsLogger.logImpression({
				actionType = storeEnums.ActionType.Impression,
				productType = var1,
				locationType = var2,
				universeId = var4,
				layoutOrder = (p5 or 0) + v
			})
		end
	end
	edpStoreAnalyticsLogger.logExperienceStoreExposure()
end