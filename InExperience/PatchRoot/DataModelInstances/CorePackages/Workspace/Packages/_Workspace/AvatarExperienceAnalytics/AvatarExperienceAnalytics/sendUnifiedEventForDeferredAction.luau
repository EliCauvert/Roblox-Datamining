local avatarExperienceAnalytics = script:FindFirstAncestor("AvatarExperienceAnalytics")
local parent = avatarExperienceAnalytics.Parent
local collectionService = game:GetService("CollectionService")
local cryoModule = require(parent.Cryo)
local unifiedEventLogConstantsModule = require(script.Parent.UnifiedEventLogConstants)
local unifiedEventLogEnumsModule = require(script.Parent.UnifiedEventLogEnums)
local unifiedEventLoggingUtilsModule = require(avatarExperienceAnalytics.Utils.UnifiedEventLoggingUtils)
local sendUnifiedEventLogModule = require(script.Parent.sendUnifiedEventLog)
local sendUnifiedEventLogForInstanceModule = require(script.Parent.sendUnifiedEventLogForInstance)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local unifiedSelectionListStoreModule = require(script.Parent.Store.UnifiedSelectionListStore)
local lastDeferredSingleItemStoreModule = require(script.Parent.Store.LastDeferredSingleItemStore)
local fFlagAXAvatarSortInDiscoveryUnifiedPurchase = require(parent.SharedFlags).FFlagAXAvatarSortInDiscoveryUnifiedPurchase
local fFlagAXMISEnableMultiShoppingUnifiedEvents = avatarExperienceFlagsModule.FFlagAXMISEnableMultiShoppingUnifiedEvents
local fFlagAXFixSingleItemPurchaseWidgetLogging = avatarExperienceFlagsModule.FFlagAXFixSingleItemPurchaseWidgetLogging

return function(p1)
	-- upvalues: fFlagAXMISEnableMultiShoppingUnifiedEvents (ref), unifiedSelectionListStoreModule (ref), unifiedEventLogConstantsModule (ref), fFlagAXFixSingleItemPurchaseWidgetLogging (ref), unifiedEventLogEnumsModule (ref), lastDeferredSingleItemStoreModule (ref), unifiedEventLoggingUtilsModule (ref), sendUnifiedEventLogModule (ref), cryoModule (ref), collectionService (ref), fFlagAXAvatarSortInDiscoveryUnifiedPurchase (ref), sendUnifiedEventLogForInstanceModule (ref)
	if fFlagAXMISEnableMultiShoppingUnifiedEvents then
		local selectionList = unifiedSelectionListStoreModule.getSelectionList()
		local text = unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "itemId"
		local text_1 = unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "itemType"
		local var1 = nil
		
		for i, v in selectionList do
			if v[text] == p1.itemId and tostring(v[text_1]) == tostring(p1.itemType) then
				var1 = v
				break
			end
		end
		if fFlagAXFixSingleItemPurchaseWidgetLogging and var1 == nil then
			if p1.action == unifiedEventLogEnumsModule.MarketplaceUnifiedAction.PURCHASE_SUCCESS then
				local snapshot = lastDeferredSingleItemStoreModule.getSnapshot()
				lastDeferredSingleItemStoreModule.clearSnapshot()
				
				if snapshot then
					sendUnifiedEventLogModule(cryoModule.Dictionary.join(unifiedEventLoggingUtilsModule.getFieldsToSendFromInstanceAttributes(snapshot), p1))
					
					return
				end
			end
			sendUnifiedEventLogModule(p1)
			
			return
		else
			sendUnifiedEventLogModule(cryoModule.Dictionary.join(unifiedEventLoggingUtilsModule.getFieldsToSendFromInstanceAttributes(var1), p1))
			
			return
		end
	else
		local last_activated_tag_nameTagged = collectionService:GetTagged(unifiedEventLogConstantsModule.LAST_ACTIVATED_TAG_NAME)
		
		if fFlagAXAvatarSortInDiscoveryUnifiedPurchase then
			if #last_activated_tag_nameTagged > 0 then
				for i, v in last_activated_tag_nameTagged do
					sendUnifiedEventLogForInstanceModule(v, p1, {
						includeScreenSize = true,
						includeElementSizeAndPosition = true
					})
				end
				return
			else
				sendUnifiedEventLogModule(p1)
				
				return
			end
		else
			for i, v in last_activated_tag_nameTagged do
				sendUnifiedEventLogForInstanceModule(v, p1, {
					includeScreenSize = true,
					includeElementSizeAndPosition = true
				})
			end
		end
	end
end