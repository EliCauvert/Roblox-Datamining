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
local _ = require(script.Parent.Generated.UnifiedEventTypes)
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local UnifiedSelectionListStoreModule = require(script.Parent.Store.UnifiedSelectionListStore)
local LastDeferredSingleItemStoreModule = require(script.Parent.Store.LastDeferredSingleItemStore)
local FFlagAXMISEnableMultiShoppingUnifiedEvents = AvatarExperienceFlagsModule.FFlagAXMISEnableMultiShoppingUnifiedEvents
local FFlagAXFixSingleItemPurchaseWidgetLogging = AvatarExperienceFlagsModule.FFlagAXFixSingleItemPurchaseWidgetLogging
local FFlagAXFixUnifiedPurchaseFieldLanding = AvatarExperienceFlagsModule.FFlagAXFixUnifiedPurchaseFieldLanding
local FFlagAXFixDeferredItemIdTypeMatch = AvatarExperienceFlagsModule.FFlagAXFixDeferredItemIdTypeMatch
local FFlagAXUnifiedEventStrictPayloads = AvatarExperienceFlagsModule.FFlagAXUnifiedEventStrictPayloads

local function _(p1, p2)
	-- upvalues: CryoModule (copy)
	return CryoModule.Dictionary.join(p2 or {}, p1)
end

local function getUnsetInstanceFields(Object, List)
	-- upvalues: UnifiedEventLogConstantsModule (copy)
	local t = {}
	
	if List then
		for i, value in List do
			t[i] = value
		end
	end
	for i1 in t do
		if Object:GetAttribute(UnifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. i1) ~= nil then
			t[i1] = nil
		end
	end
	return t
end

return function(p1, p2)
	-- upvalues: FFlagAXFixUnifiedPurchaseFieldLanding (copy), MapAnalyticsMetadataFieldsModule (copy), FFlagAXMISEnableMultiShoppingUnifiedEvents (copy), UnifiedSelectionListStoreModule (copy), UnifiedEventLogConstantsModule (copy), FFlagAXFixDeferredItemIdTypeMatch (copy), FFlagAXFixSingleItemPurchaseWidgetLogging (copy), UnifiedEventLogEnumsModule (copy), LastDeferredSingleItemStoreModule (copy), UnifiedEventLoggingUtilsModule (copy), CryoModule (copy), SendUnifiedEventLogModule (copy), FFlagAXUnifiedEventStrictPayloads (copy), CollectionService (copy), SendUnifiedEventLogForInstanceModule (copy), getUnsetInstanceFields (copy)
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
			local JoinResult = CryoModule.Dictionary.join(UnifiedEventLoggingUtilsModule.getFieldsToSendFromInstanceAttributes(v1), p1)
			SendUnifiedEventLogModule(if FFlagAXUnifiedEventStrictPayloads then CryoModule.Dictionary.join(p2 or {}, JoinResult) else JoinResult)
			
			return
		end
		if p1.action == UnifiedEventLogEnumsModule.MarketplaceUnifiedAction.PURCHASE_SUCCESS then
			local Snapshot = LastDeferredSingleItemStoreModule.getSnapshot()
			LastDeferredSingleItemStoreModule.clearSnapshot()
			
			if Snapshot then
				local JoinResult = CryoModule.Dictionary.join(UnifiedEventLoggingUtilsModule.getFieldsToSendFromInstanceAttributes(Snapshot), p1)
				SendUnifiedEventLogModule(if FFlagAXUnifiedEventStrictPayloads then CryoModule.Dictionary.join(p2 or {}, JoinResult) else JoinResult)
				
				return
			end
		end
		SendUnifiedEventLogModule(if FFlagAXUnifiedEventStrictPayloads then CryoModule.Dictionary.join(p2 or {}, p1) else p1)
		
		return
	else
		local Tagged = CollectionService:GetTagged(UnifiedEventLogConstantsModule.LAST_ACTIVATED_TAG_NAME)
		
		if #Tagged <= 0 then
			SendUnifiedEventLogModule(if FFlagAXUnifiedEventStrictPayloads then CryoModule.Dictionary.join(p2 or {}, p1) else p1)
			
			return
		end
		for _, value1 in Tagged do
			SendUnifiedEventLogForInstanceModule(value1, if FFlagAXUnifiedEventStrictPayloads then CryoModule.Dictionary.join(getUnsetInstanceFields(value1, p2), p1) else p1, {
				includeScreenSize = true,
				includeElementSizeAndPosition = true
			})
		end
	end
end