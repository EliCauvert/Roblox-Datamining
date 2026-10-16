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
local MarketplaceUnifiedItemType = require(Parent.AvatarExperienceAnalytics).UnifiedEventLogEnums.MarketplaceUnifiedItemType
local self = setmetatable({}, { __mode = "k" })

return function(Key, p1, p2, AnalyticsData, p3, p4) --[[ Line: 46 | Named "SduiDevStoreSeeAllImpressionsHandler" ]]
	-- upvalues: FindAnalyticsFieldInAncestorsFunction (copy), MarketplaceUnifiedItemType (copy), SduiMarketplaceItemImpressionsHandlerModule (copy), SduiLogger (copy), SduiErrors (copy), self (copy), EdpStoreAnalyticsLogger (copy), StoreEnums (copy)
	if #p1 == 0 then return end
	local config = { analyticsData = AnalyticsData }
	local ItemType = FindAnalyticsFieldInAncestorsFunction("itemType", config)
	
	if if ItemType == nil then nil else MarketplaceUnifiedItemType[ItemType] then
		SduiMarketplaceItemImpressionsHandlerModule(Key, p1, p2, AnalyticsData, p3, p4)
	end
	local ExperienceStoreProductType = FindAnalyticsFieldInAncestorsFunction("experienceStoreProductType", config)
	
	if not ExperienceStoreProductType then
		SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToLogExperienceStoreImpressions, {
			name = "SduiDevStoreSeeAllImpressionsHandler",
			message = "Missing experienceStoreProductType on collectionAnalyticsData"
		}, Key.appPage)
		
		return
	end
	local Text = tostring(ExperienceStoreProductType)
	local SelfEntry = self[Key]
	
	if not SelfEntry then
		SelfEntry = {}
		self[Key] = SelfEntry
	end
	if not SelfEntry[Text] then
		SelfEntry[Text] = true
		local EdpLocationType = FindAnalyticsFieldInAncestorsFunction("edpLocationType", config)
		local UniverseId = FindAnalyticsFieldInAncestorsFunction("universeId", config)
		EdpStoreAnalyticsLogger.logImpression({
			layoutOrder = 1,
			actionType = StoreEnums.ActionType.Impression,
			productType = ExperienceStoreProductType,
			locationType = EdpLocationType,
			universeId = if UniverseId == nil then nil else tonumber((tostring(UniverseId)))
		})
		EdpStoreAnalyticsLogger.logExperienceStoreExposure()
		
		return
	end
end