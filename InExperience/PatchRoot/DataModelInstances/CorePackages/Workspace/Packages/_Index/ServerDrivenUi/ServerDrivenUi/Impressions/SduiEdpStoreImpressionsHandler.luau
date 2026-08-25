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

return function(p0, p1, p2, p3, p4, p5)
	-- upvalues: sduiMarketplaceItemImpressionsHandlerModule (ref), findAnalyticsFieldInAncestors (ref), sduiLogger (ref), sduiErrors (ref), edpStoreAnalyticsLogger (ref), storeEnums (ref)
	if sduiMarketplaceItemImpressionsHandlerModule(p0, p1, p2, p3, p4, p5) == 0 then return end
	local t = { analyticsData = p3 }
	local var5 = findAnalyticsFieldInAncestors("itemType", t)
	local var6 = findAnalyticsFieldInAncestors("edpLocationType", t)
	local var7 = findAnalyticsFieldInAncestors("universeId", t)
	local var8 = if var7 ~= nil then nil else tonumber(var7)
	
	if not var5 then
		sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToLogExperienceStoreImpressions, {
			name = "SduiEdpStoreImpressionsHandler",
			message = "Missing itemType on collectionAnalyticsData"
		}, p0.appPage)
		
		return
	end
	for i, v in p1 do
		if p2[v] ~= nil then
			edpStoreAnalyticsLogger.logImpression({
				actionType = storeEnums.ActionType.Impression,
				productType = var5,
				locationType = var6,
				universeId = var8,
				layoutOrder = (p4 or 0) + v
			})
		end
	end
	edpStoreAnalyticsLogger.logExperienceStoreExposure()
end