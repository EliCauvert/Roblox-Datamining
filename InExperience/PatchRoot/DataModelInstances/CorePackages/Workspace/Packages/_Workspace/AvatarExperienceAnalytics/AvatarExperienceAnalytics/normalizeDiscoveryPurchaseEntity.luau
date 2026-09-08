local marketplaceUnifiedAction = require(script.Parent.UnifiedEventLogEnums).MarketplaceUnifiedAction
local unifiedLoggingSurface = require(script:FindFirstAncestor("AvatarExperienceAnalytics").Parent.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface
local list = {
	"widgetId", "widgetType", "assetIds", "bundleIds", "widgetItemIds",
	"organicResultIds", "widgetItemPrice", "uiTreatmentType", "themeId",
	"widgetItemWearAfterPurchase", "widgetItemSaveToMyAvatars"
}
local list_1 = {
	"assetType", "bundleType", "organicItemPrice", "organicItemWearAfterPurchase",
	"organicItemSaveToMyAvatars", "organicAssetIds", "organicBundleIds"
}

local function _(p1)
	-- upvalues: unifiedLoggingSurface (ref)
	return if p1 ~= unifiedLoggingSurface.DISCOVERY_HOMEPAGE then p1 == unifiedLoggingSurface.DISCOVERY_SEARCH_RESULTS else true
end

local _ = function(p1)
	return p1 ~= nil and p1 ~= ""
end

return function(p1)
	-- upvalues: marketplaceUnifiedAction (ref), unifiedLoggingSurface (ref), list_1 (ref), list (ref)
	local action = p1.action
	
	if if action ~= marketplaceUnifiedAction.PURCHASE_SUCCESS then action == marketplaceUnifiedAction.PURCHASE_ATTEMPT else true then
		local surface = p1.surface
		
		if not (if surface ~= unifiedLoggingSurface.DISCOVERY_HOMEPAGE then surface == unifiedLoggingSurface.DISCOVERY_SEARCH_RESULTS else true) then
			return p1
		end
		local widgetId = p1.widgetId
		local var1 = widgetId ~= nil and widgetId ~= ""
		
		if var1 then
			local widgetType = p1.widgetType
			var1 = widgetType ~= nil and widgetType ~= ""
			
			if var1 then
				local widgetItemIds = p1.widgetItemIds
				var1 = widgetItemIds ~= nil and widgetItemIds ~= ""
				
				if var1 then
					local requestId = p1.requestId
					var1 = requestId ~= nil and requestId ~= ""
				end
			end
		end
		local cloned = table.clone(p1)
		
		if var1 then
			for i, v in list_1 do
				cloned[v] = nil
			end
			return cloned
		else
			cloned.organicItemPrice = cloned.organicItemPrice or cloned.widgetItemPrice
			cloned.organicAssetIds = cloned.organicAssetIds or cloned.assetIds
			cloned.organicBundleIds = cloned.organicBundleIds or cloned.bundleIds
			
			if cloned.organicItemWearAfterPurchase == nil then
				cloned.organicItemWearAfterPurchase = cloned.widgetItemWearAfterPurchase
			end
			if cloned.organicItemSaveToMyAvatars == nil then
				cloned.organicItemSaveToMyAvatars = cloned.widgetItemSaveToMyAvatars
			end
			for i, v in list do
				cloned[v] = nil
			end
			return cloned
		end
	end
end