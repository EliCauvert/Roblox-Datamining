local MarketplaceUnifiedAction = require(script.Parent.UnifiedEventLogEnums).MarketplaceUnifiedAction
local UnifiedLoggingSurface = require(script:FindFirstAncestor("AvatarExperienceAnalytics").Parent.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface
local list = {
	"widgetId", "widgetType", "assetIds", "bundleIds", "widgetItemIds",
	"organicResultIds", "widgetItemPrice", "uiTreatmentType", "themeId",
	"widgetItemWearAfterPurchase", "widgetItemSaveToMyAvatars"
}
local list1 = {
	"assetType", "bundleType", "organicItemPrice", "organicItemWearAfterPurchase",
	"organicItemSaveToMyAvatars", "organicAssetIds", "organicBundleIds"
}

local function _(DISCOVERYHOMEPAGE): boolean --[[ Line: 31 | Named "isDiscoverySurface" ]]
	-- upvalues: UnifiedLoggingSurface (copy)
	return DISCOVERYHOMEPAGE == UnifiedLoggingSurface.DISCOVERY_HOMEPAGE or DISCOVERYHOMEPAGE == UnifiedLoggingSurface.DISCOVERY_SEARCH_RESULTS
end

local _ = function(p1): boolean --[[ Line: 36 | Named "isNonEmpty" ]]
	return p1 ~= nil and p1 ~= ""
end

return function(Tbl) --[[ Line: 40 | Named "normalizeDiscoveryPurchaseEntity" ]]
	-- upvalues: MarketplaceUnifiedAction (copy), UnifiedLoggingSurface (copy), list1 (copy), list (copy)
	local Action = Tbl.action
	
	if Action == MarketplaceUnifiedAction.PURCHASE_SUCCESS or Action == MarketplaceUnifiedAction.PURCHASE_ATTEMPT then
		local Surface = Tbl.surface
		
		if Surface == UnifiedLoggingSurface.DISCOVERY_HOMEPAGE or Surface == UnifiedLoggingSurface.DISCOVERY_SEARCH_RESULTS then
			local WidgetId = Tbl.widgetId
			local IsNotWidgetIdMatch: boolean = WidgetId ~= nil and WidgetId ~= ""
			
			if IsNotWidgetIdMatch then
				local WidgetType = Tbl.widgetType
				IsNotWidgetIdMatch = WidgetType ~= nil and WidgetType ~= ""
				
				if IsNotWidgetIdMatch then
					local WidgetItemIds = Tbl.widgetItemIds
					IsNotWidgetIdMatch = WidgetItemIds ~= nil and WidgetItemIds ~= ""
					
					if IsNotWidgetIdMatch then
						local RequestId = Tbl.requestId
						IsNotWidgetIdMatch = RequestId ~= nil and RequestId ~= ""
					end
				end
			end
			local Copy = table.clone(Tbl)
			
			if IsNotWidgetIdMatch then
				for _, value in list1 do
					Copy[value] = nil
				end
				return Copy
			else
				Copy.organicItemPrice = Copy.organicItemPrice or Copy.widgetItemPrice
				Copy.organicAssetIds = Copy.organicAssetIds or Copy.assetIds
				Copy.organicBundleIds = Copy.organicBundleIds or Copy.bundleIds
				
				if Copy.organicItemWearAfterPurchase == nil then
					Copy.organicItemWearAfterPurchase = Copy.widgetItemWearAfterPurchase
				end
				if Copy.organicItemSaveToMyAvatars == nil then
					Copy.organicItemSaveToMyAvatars = Copy.widgetItemSaveToMyAvatars
				end
				for _, value1 in list do
					Copy[value1] = nil
				end
				return Copy
			end
		end
	end
	return Tbl
end