local AvatarExperienceAnalytics = script:FindFirstAncestor("AvatarExperienceAnalytics")
local Parent = AvatarExperienceAnalytics.Parent
local CollectionService = game:GetService("CollectionService")
local CryoModule = require(Parent.Cryo)
local UnifiedEventLogConstantsModule = require(script.Parent.UnifiedEventLogConstants)
local UnifiedEventLogEnumsModule = require(script.Parent.UnifiedEventLogEnums)
local UnifiedEventLoggingUtilsModule = require(AvatarExperienceAnalytics.Utils.UnifiedEventLoggingUtils)
local SendUnifiedEventLogModule = require(script.Parent.sendUnifiedEventLog)
local SendUnifiedEventLogForInstanceModule = require(script.Parent.sendUnifiedEventLogForInstance)
local MapAnalyticsMetadataFieldsModule = require(AvatarExperienceAnalytics.Utils.mapAnalyticsMetadataFields)
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local UnifiedSelectionListStoreModule = require(script.Parent.Store.UnifiedSelectionListStore)
local LastDeferredSingleItemStoreModule = require(script.Parent.Store.LastDeferredSingleItemStore)
local FFlagAXMISEnableMultiShoppingUnifiedEvents = AvatarExperienceFlagsModule.FFlagAXMISEnableMultiShoppingUnifiedEvents
local FFlagAXFixSingleItemPurchaseWidgetLogging = AvatarExperienceFlagsModule.FFlagAXFixSingleItemPurchaseWidgetLogging
local FFlagAXFixUnifiedPurchaseFieldLanding = AvatarExperienceFlagsModule.FFlagAXFixUnifiedPurchaseFieldLanding
local FFlagAXFixDeferredItemIdTypeMatch = AvatarExperienceFlagsModule.FFlagAXFixDeferredItemIdTypeMatch

return function(p1) --[[ Line: 22 ]]
	-- upvalues: FFlagAXFixUnifiedPurchaseFieldLanding (copy), MapAnalyticsMetadataFieldsModule (copy), FFlagAXMISEnableMultiShoppingUnifiedEvents (copy), UnifiedSelectionListStoreModule (copy), UnifiedEventLogConstantsModule (copy), FFlagAXFixDeferredItemIdTypeMatch (copy), FFlagAXFixSingleItemPurchaseWidgetLogging (copy), UnifiedEventLogEnumsModule (copy), LastDeferredSingleItemStoreModule (copy), UnifiedEventLoggingUtilsModule (copy), SendUnifiedEventLogModule (copy), CryoModule (copy), CollectionService (copy), SendUnifiedEventLogForInstanceModule (copy)
	if FFlagAXFixUnifiedPurchaseFieldLanding then
		p1 = MapAnalyticsMetadataFieldsModule(p1)
	end
	if FFlagAXMISEnableMultiShoppingUnifiedEvents then
		local Text = UnifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "itemId"
		local Text1 = UnifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "itemType"
		local v1 = nil
		
		for _, value in UnifiedSelectionListStoreModule.getSelectionList() do
			if (if FFlagAXFixDeferredItemIdTypeMatch then tostring(value[Text]) == tostring(p1.itemId) else value[Text] == p1.itemId) and tostring(value[Text1]) == tostring(p1.itemType) then
				v1 = value
				break
			end
		end
		if not FFlagAXFixSingleItemPurchaseWidgetLogging or v1 ~= nil then
			SendUnifiedEventLogModule((CryoModule.Dictionary.join(UnifiedEventLoggingUtilsModule.getFieldsToSendFromInstanceAttributes(v1), p1)))
			
			return
		end
		if p1.action == UnifiedEventLogEnumsModule.MarketplaceUnifiedAction.PURCHASE_SUCCESS then
			local Snapshot = LastDeferredSingleItemStoreModule.getSnapshot()
			LastDeferredSingleItemStoreModule.clearSnapshot()
			
			if Snapshot then
				SendUnifiedEventLogModule(CryoModule.Dictionary.join(UnifiedEventLoggingUtilsModule.getFieldsToSendFromInstanceAttributes(Snapshot), p1))
				
				return
			end
		end
		SendUnifiedEventLogModule(p1)
		
		return
	else
		local Tagged = CollectionService:GetTagged(UnifiedEventLogConstantsModule.LAST_ACTIVATED_TAG_NAME)
		
		if #Tagged <= 0 then
			SendUnifiedEventLogModule(p1)
			
			return
		end
		for _, value1 in Tagged do
			SendUnifiedEventLogForInstanceModule(value1, p1, {
				includeScreenSize = true,
				includeElementSizeAndPosition = true
			})
		end
	end
end