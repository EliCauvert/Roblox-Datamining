local AvatarExperienceAnalytics = script:FindFirstAncestor("AvatarExperienceAnalytics")
local Parent = AvatarExperienceAnalytics.Parent
local CryoModule = require(Parent.Cryo)
local UnifiedEventLogConstantsModule = require(script.Parent.UnifiedEventLogConstants)
local UnifiedEventLoggingUtilsModule = require(AvatarExperienceAnalytics.Utils.UnifiedEventLoggingUtils)
local SendUnifiedEventLogModule = require(script.Parent.sendUnifiedEventLog)
local UnifiedSelectionListStoreModule = require(script.Parent.Store.UnifiedSelectionListStore)
local ReportAvatarEventCounterV1Module = require(script.Parent.reportAvatarEventCounterV1)
local ConstantsModule = require(script.Parent.Constants)
local UnifiedEventLogEnumsModule = require(AvatarExperienceAnalytics.UnifiedEventLogEnums)
local FFlagAXFixSearchPurchaseSurface = require(Parent.AvatarExperienceFlags).FFlagAXFixSearchPurchaseSurface

return function(List, p1) --[[ Line: 16 ]]
	-- upvalues: UnifiedSelectionListStoreModule (copy), UnifiedEventLogConstantsModule (copy), UnifiedEventLoggingUtilsModule (copy), CryoModule (copy), FFlagAXFixSearchPurchaseSurface (copy), UnifiedEventLogEnumsModule (copy), ReportAvatarEventCounterV1Module (copy), ConstantsModule (copy), SendUnifiedEventLogModule (copy)
	local SelectionList = UnifiedSelectionListStoreModule.getSelectionList()
	local Text = UnifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "itemId"
	local Text1 = UnifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "itemType"
	local v1 = nil
	
	for _, value in List do
		v1 = nil
		
		for _, value1 in SelectionList do
			if tostring(value1[Text]) == tostring(value.itemId) and tostring(value1[Text1]) == tostring(value.itemType) then
				v1 = value1
				break
			end
		end
		local JoinResult = CryoModule.Dictionary.join(UnifiedEventLoggingUtilsModule.getFieldsToSendFromInstanceAttributes(v1), value)
		local JoinResult1 = CryoModule.Dictionary.join(JoinResult, {
			surface = if FFlagAXFixSearchPurchaseSurface and JoinResult.surface ~= nil then JoinResult.surface else p1
		})
		
		if JoinResult1.action == UnifiedEventLogEnumsModule.MarketplaceUnifiedAction.PURCHASE_SUCCESS then
			if JoinResult1.itemType == UnifiedEventLogEnumsModule.MarketplaceUnifiedItemType.ASSET then
				ReportAvatarEventCounterV1Module(ConstantsModule.AVATAR_EVENT_COUNTER_NAME.AXPurchaseAsset)
			elseif JoinResult1.itemType == UnifiedEventLogEnumsModule.MarketplaceUnifiedItemType.BUNDLE then
				ReportAvatarEventCounterV1Module(ConstantsModule.AVATAR_EVENT_COUNTER_NAME.AXPurchaseBundle)
			end
		end
		SendUnifiedEventLogModule(JoinResult1)
	end
end