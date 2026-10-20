local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local EdpStoreAnalyticsModule = require(Parent.EdpStoreAnalytics)
local EdpStoreAnalyticsLogger = EdpStoreAnalyticsModule.EdpStoreAnalyticsLogger
local StoreEnums = EdpStoreAnalyticsModule.Constants.StoreEnums
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiErrors = SduiCoreSystemModule.SduiErrors
local SduiLogger = SduiCoreSystemModule.SduiLogger
local FindAnalyticsFieldInAncestorsFunction = SduiCoreSystemModule.findAnalyticsFieldInAncestors
local SduiMarketplaceItemImpressionsHandlerModule = require(ServerDrivenUi.Impressions.SduiMarketplaceItemImpressionsHandler)

return function(p1, List, p2, AnalyticsData, p3, p4)
	-- upvalues: SduiMarketplaceItemImpressionsHandlerModule (copy), FindAnalyticsFieldInAncestorsFunction (copy), SduiLogger (copy), SduiErrors (copy), EdpStoreAnalyticsLogger (copy), StoreEnums (copy)
	if SduiMarketplaceItemImpressionsHandlerModule(p1, List, p2, AnalyticsData, p3, p4) == 0 then return end
	local config = { analyticsData = AnalyticsData }
	local ItemType = FindAnalyticsFieldInAncestorsFunction("itemType", config)
	local EdpLocationType = FindAnalyticsFieldInAncestorsFunction("edpLocationType", config)
	local UniverseId = FindAnalyticsFieldInAncestorsFunction("universeId", config)
	local Number = if UniverseId == nil then nil else tonumber(UniverseId)
	
	if not ItemType then
		SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToLogExperienceStoreImpressions, {
			name = "SduiEdpStoreImpressionsHandler",
			message = "Missing itemType on collectionAnalyticsData"
		}, p1.appPage)
		
		return
	end
	for _, value in List do
		if p2[value] ~= nil then
			EdpStoreAnalyticsLogger.logImpression({
				actionType = StoreEnums.ActionType.Impression,
				productType = ItemType,
				locationType = EdpLocationType,
				universeId = Number,
				layoutOrder = (p3 or 0) + value
			})
		end
	end
	EdpStoreAnalyticsLogger.logExperienceStoreExposure()
end