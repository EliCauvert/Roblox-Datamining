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
local AXAddV1CountersForMISPurchaseSuccess = game:DefineFastFlag("AXAddV1CountersForMISPurchaseSuccess", false)
local fFlagAXFixSearchPurchaseSurface = require(parent.AvatarExperienceFlags).FFlagAXFixSearchPurchaseSurface

return function(p0, p1) --[[ line: 18 ]]
	-- upvalues: unifiedSelectionListStoreModule (ref), unifiedEventLogConstantsModule (ref), unifiedEventLoggingUtilsModule (ref), cryoModule (ref), fFlagAXFixSearchPurchaseSurface (ref), AXAddV1CountersForMISPurchaseSuccess (ref), unifiedEventLogEnumsModule (ref), reportAvatarEventCounterV1Module (ref), constantsModule (ref), sendUnifiedEventLogModule (ref)
	local var13
	local selectionList = unifiedSelectionListStoreModule.getSelectionList()
	local text = unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "itemId"
	local text_1 = unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "itemType"
	
	for i, v in p0 do
		var13 = nil
		
		for i_1, v_1 in selectionList do
			if tostring(v_1[text]) == tostring(v.itemId) and tostring(v_1[text_1]) == tostring(v.itemType) then
				var13 = v_1
				break
			end
		end
		local var14 = cryoModule.Dictionary.join(unifiedEventLoggingUtilsModule.getFieldsToSendFromInstanceAttributes(var13), v)
		var14 = cryoModule.Dictionary.join(var14, {
			surface = if fFlagAXFixSearchPurchaseSurface and var14.surface ~= nil then var14.surface else p1
		})
		
		if AXAddV1CountersForMISPurchaseSuccess and var14.action == unifiedEventLogEnumsModule.MarketplaceUnifiedAction.PURCHASE_SUCCESS then
			if var14.itemType == unifiedEventLogEnumsModule.MarketplaceUnifiedItemType.ASSET then
				reportAvatarEventCounterV1Module(constantsModule.AVATAR_EVENT_COUNTER_NAME.AXPurchaseAsset)
			elseif var14.itemType == unifiedEventLogEnumsModule.MarketplaceUnifiedItemType.BUNDLE then
				reportAvatarEventCounterV1Module(constantsModule.AVATAR_EVENT_COUNTER_NAME.AXPurchaseBundle)
			end
		end
		sendUnifiedEventLogModule(var14)
	end
end