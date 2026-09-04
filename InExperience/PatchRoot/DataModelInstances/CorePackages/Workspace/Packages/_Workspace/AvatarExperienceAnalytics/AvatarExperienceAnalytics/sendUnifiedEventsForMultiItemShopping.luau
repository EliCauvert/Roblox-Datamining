local avatarExperienceAnalytics = script:FindFirstAncestor("AvatarExperienceAnalytics")
local parent = avatarExperienceAnalytics.Parent
local cryoModule = require(parent.Cryo)
local unifiedEventLogConstantsModule = require(script.Parent.UnifiedEventLogConstants)
local unifiedEventLoggingUtilsModule = require(avatarExperienceAnalytics.Utils.UnifiedEventLoggingUtils)
local sendUnifiedEventLogModule = require(script.Parent.sendUnifiedEventLog)
local unifiedSelectionListStoreModule = require(script.Parent.Store.UnifiedSelectionListStore)
local reportAvatarEventCounterV1Module = require(script.Parent.reportAvatarEventCounterV1)
local constantsModule = require(script.Parent.Constants)
local unifiedEventLogEnumsModule = require(avatarExperienceAnalytics.UnifiedEventLogEnums)
local fFlagAXFixSearchPurchaseSurface = require(parent.AvatarExperienceFlags).FFlagAXFixSearchPurchaseSurface

return function(p1, p2)
	-- upvalues: unifiedSelectionListStoreModule (ref), unifiedEventLogConstantsModule (ref), unifiedEventLoggingUtilsModule (ref), cryoModule (ref), fFlagAXFixSearchPurchaseSurface (ref), unifiedEventLogEnumsModule (ref), reportAvatarEventCounterV1Module (ref), constantsModule (ref), sendUnifiedEventLogModule (ref)
	local var1
	local selectionList = unifiedSelectionListStoreModule.getSelectionList()
	local text = unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "itemId"
	local text_1 = unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "itemType"
	
	for i, v in p1 do
		var1 = nil
		
		for i_1, v_1 in selectionList do
			if tostring(v_1[text]) == tostring(v.itemId) and tostring(v_1[text_1]) == tostring(v.itemType) then
				var1 = v_1
				break
			end
		end
		local var2 = cryoModule.Dictionary.join(unifiedEventLoggingUtilsModule.getFieldsToSendFromInstanceAttributes(var1), v)
		var2 = cryoModule.Dictionary.join(var2, {
			surface = if fFlagAXFixSearchPurchaseSurface and var2.surface ~= nil then var2.surface else p2
		})
		
		if var2.action == unifiedEventLogEnumsModule.MarketplaceUnifiedAction.PURCHASE_SUCCESS then
			if var2.itemType == unifiedEventLogEnumsModule.MarketplaceUnifiedItemType.ASSET then
				reportAvatarEventCounterV1Module(constantsModule.AVATAR_EVENT_COUNTER_NAME.AXPurchaseAsset)
			elseif var2.itemType == unifiedEventLogEnumsModule.MarketplaceUnifiedItemType.BUNDLE then
				reportAvatarEventCounterV1Module(constantsModule.AVATAR_EVENT_COUNTER_NAME.AXPurchaseBundle)
			end
		end
		sendUnifiedEventLogModule(var2)
	end
end