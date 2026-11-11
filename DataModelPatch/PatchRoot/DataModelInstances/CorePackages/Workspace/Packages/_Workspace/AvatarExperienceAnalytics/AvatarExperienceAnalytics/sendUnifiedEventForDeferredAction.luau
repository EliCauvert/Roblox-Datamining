local AvatarExperienceAnalytics = script:FindFirstAncestor("AvatarExperienceAnalytics")
local Parent = AvatarExperienceAnalytics.Parent
local CollectionService = game:GetService("CollectionService")
local CryoModule = require(Parent.Cryo)
local UnifiedEventLogConstantsModule = require(script.Parent.UnifiedEventLogConstants)
local UnifiedEventLoggingUtilsModule = require(AvatarExperienceAnalytics.Utils.UnifiedEventLoggingUtils)
local SendUnifiedEventLogModule = require(script.Parent.sendUnifiedEventLog)
local SendUnifiedEventLogForInstanceModule = require(script.Parent.sendUnifiedEventLogForInstance)
local UnifiedSelectionListStoreModule = require(script.Parent.Store.UnifiedSelectionListStore)
local FFlagAXAvatarSortInDiscoveryUnifiedPurchase = require(Parent.SharedFlags).FFlagAXAvatarSortInDiscoveryUnifiedPurchase
local FFlagAXMISEnableMultiShoppingUnifiedEvents = require(Parent.AvatarExperienceFlags).FFlagAXMISEnableMultiShoppingUnifiedEvents

return function(p1)
	-- upvalues: FFlagAXMISEnableMultiShoppingUnifiedEvents (copy), UnifiedSelectionListStoreModule (copy), UnifiedEventLogConstantsModule (copy), UnifiedEventLoggingUtilsModule (copy), CryoModule (copy), SendUnifiedEventLogModule (copy), CollectionService (copy), FFlagAXAvatarSortInDiscoveryUnifiedPurchase (copy), SendUnifiedEventLogForInstanceModule (copy)
	if FFlagAXMISEnableMultiShoppingUnifiedEvents then
		local Text = UnifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "itemId"
		local Text1 = UnifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "itemType"
		local v1 = nil
		
		for _, value in UnifiedSelectionListStoreModule.getSelectionList() do
			if value[Text] == p1.itemId and tostring(value[Text1]) == tostring(p1.itemType) then
				v1 = value
				break
			end
		end
		SendUnifiedEventLogModule((CryoModule.Dictionary.join(UnifiedEventLoggingUtilsModule.getFieldsToSendFromInstanceAttributes(v1), p1)))
		
		return
	else
		local Tagged = CollectionService:GetTagged(UnifiedEventLogConstantsModule.LAST_ACTIVATED_TAG_NAME)
		
		if FFlagAXAvatarSortInDiscoveryUnifiedPurchase then
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
			return
		else
			for _, value2 in Tagged do
				SendUnifiedEventLogForInstanceModule(value2, p1, {
					includeScreenSize = true,
					includeElementSizeAndPosition = true
				})
			end
		end
	end
end