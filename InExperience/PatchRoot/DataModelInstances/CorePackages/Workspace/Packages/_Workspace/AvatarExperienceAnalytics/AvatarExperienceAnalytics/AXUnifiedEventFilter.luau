local parent = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent
local unifiedEventLogEnumsModule = require(script.Parent.UnifiedEventLogEnums)
local marketplaceUnifiedAction = unifiedEventLogEnumsModule.MarketplaceUnifiedAction
local marketplaceUnifiedItemType = unifiedEventLogEnumsModule.MarketplaceUnifiedItemType
local widgetUiTreatment = unifiedEventLogEnumsModule.WidgetUiTreatment
local unifiedLoggingSurface = require(parent.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface
local sendAXCounterV2Module = require(script.Parent.sendAXCounterV2)
local fFlagAXUnifiedImpressionsOnThumbnail = require(parent.AvatarExperienceFlags).FFlagAXUnifiedImpressionsOnThumbnail
local AXSendPurchaseAttempt = game:DefineFastFlag("AXSendPurchaseAttempt", false)
local AXUnifiedFilterWidgetLoadedAndUIImpression = game:DefineFastFlag("AXUnifiedFilterWidgetLoadedAndUIImpression", false)
local t = {}
local t_1 = {
	AssetTypeIdStringToName = {},
	BundleTypeIdStringToName = {}
}

for i, v in Enum.BundleType:GetEnumItems() do
	t_1.BundleTypeIdStringToName[tostring(v.Value)] = v.Name
end
for i_1, v_1 in Enum.AvatarAssetType:GetEnumItems() do
	t_1.AssetTypeIdStringToName[tostring(v_1.Value)] = v_1.Name
end
function t.hasOrganicData(p1)
	return p1.assetType or p1.bundleType or (p1.organicItemPrice or p1.organicItemWearAfterPurchase) or (p1.organicItemSaveToMyAvatars or p1.organicAssetIds or p1.organicBundleIds)
end

function t.hasWidgetData(p1)
	return p1.widgetId or p1.widgetType or (p1.assetIds or p1.bundleIds) or (p1.widgetItemIds or p1.organicResultIds or (p1.widgetItemPrice or p1.uiTreatmentType)) or (p1.themeId or p1.widgetItemWearAfterPurchase or p1.widgetItemSaveToMyAvatars)
end

function t.hasUiElementData(p1)
	return p1.elementName
end

function t.hasItemId(p1)
	-- upvalues: marketplaceUnifiedAction (ref), AXUnifiedFilterWidgetLoadedAndUIImpression (ref)
	local action = p1.action
	local itemId = p1.itemId
	
	return if action == marketplaceUnifiedAction.UNDEFINED_ACTION or action == marketplaceUnifiedAction.UI_ELEMENT_CLICK or (action == marketplaceUnifiedAction.PAGE_VIEW or action == marketplaceUnifiedAction.WIDGET_IMPRESSION) or AXUnifiedFilterWidgetLoadedAndUIImpression and (action == marketplaceUnifiedAction.UI_ELEMENT_IMPRESSION or action == marketplaceUnifiedAction.WIDGET_LOADED) then true else itemId ~= nil and itemId ~= ""
end

function t.hasValidItemType(p1)
	-- upvalues: marketplaceUnifiedItemType (ref), AXUnifiedFilterWidgetLoadedAndUIImpression (ref), marketplaceUnifiedAction (ref)
	local itemType = p1.itemType
	
	if itemType == marketplaceUnifiedItemType.UNDEFINED_ITEM_TYPE or itemType == nil then
		local action = p1.action
		
		return if AXUnifiedFilterWidgetLoadedAndUIImpression then if action ~= marketplaceUnifiedAction.UI_ELEMENT_CLICK then if action ~= marketplaceUnifiedAction.UI_ELEMENT_IMPRESSION then if action ~= marketplaceUnifiedAction.PAGE_VIEW then if action ~= marketplaceUnifiedAction.WIDGET_IMPRESSION then action == marketplaceUnifiedAction.WIDGET_LOADED else true else true else true else true elseif action ~= marketplaceUnifiedAction.UI_ELEMENT_CLICK then if action ~= marketplaceUnifiedAction.PAGE_VIEW then action == marketplaceUnifiedAction.WIDGET_IMPRESSION else true else true
	end
	return if itemType ~= marketplaceUnifiedItemType.ASSET then if itemType ~= marketplaceUnifiedItemType.BUNDLE then itemType == marketplaceUnifiedItemType.LOOK else true else true
end

function t.hasValidAction(p1)
	-- upvalues: marketplaceUnifiedAction (ref)
	local action = p1.action
	
	return action ~= nil and action ~= marketplaceUnifiedAction.UNDEFINED_ACTION
end

function t.hasValidSurface(p1)
	-- upvalues: unifiedLoggingSurface (ref)
	local surface = p1.surface
	
	return surface ~= nil and surface ~= unifiedLoggingSurface.UNDEFINED_SURFACE
end

function t.hasRequestIdForWidgetLog(p1)
	-- upvalues: t (ref)
	return if t.hasWidgetData(p1) then p1.requestId ~= nil and p1.requestId ~= "" else true
end

function t.hasValidSizeAndPosition(p1)
	-- upvalues: marketplaceUnifiedAction (ref)
	local action = p1.action
	
	return if action == marketplaceUnifiedAction.ITEM_IMPRESSION or action == marketplaceUnifiedAction.ITEM_SELECTED or (action == marketplaceUnifiedAction.ITEM_DESELECTED or action == marketplaceUnifiedAction.PURCHASE_SUCCESS) then ((p1.screenSizeWidth or 0) > 0 and (p1.screenSizeHeight or 0) > 0) and (((p1.elementSizeWidth or 0) > 0 and (p1.elementSizeHeight or 0) > 0) and ((p1.gridPositionRow or 0) > 0 and (p1.gridPositionColumn or 0) > 0)) elseif action == marketplaceUnifiedAction.WIDGET_IMPRESSION then (p1.gridPositionRow or 0) > 0 and (p1.gridPositionColumn or 0) == 1 else true
end

function t.hasValidFilter(p1)
	-- upvalues: fFlagAXUnifiedImpressionsOnThumbnail (ref), marketplaceUnifiedAction (ref), unifiedLoggingSurface (ref), unifiedEventLogEnumsModule (ref)
	local surface = p1.surface
	local keyword = p1.keyword
	local category = p1.category
	local subcategory = p1.subcategory
	local filterPriceMin = p1.filterPriceMin
	local filterPriceMax = p1.filterPriceMax
	local filterPrice = p1.filterPrice
	local filterCreatorsName = p1.filterCreatorsName
	local filterCreators = p1.filterCreators
	local var1 = true
	
	if category == nil or category == "" then
		if not fFlagAXUnifiedImpressionsOnThumbnail then
			var1 = if p1.action ~= marketplaceUnifiedAction.WIDGET_IMPRESSION then if p1.action ~= marketplaceUnifiedAction.UI_ELEMENT_CLICK then if p1.action ~= marketplaceUnifiedAction.PAGE_VIEW then p1.action == marketplaceUnifiedAction.PURCHASE_ATTEMPT else true else true else true
		end
	elseif subcategory ~= nil and subcategory == "" then
		var1 = false
	end
	local var2 = true
	
	if keyword or surface == unifiedLoggingSurface.SEARCH_RESULTS then
		var2 = surface == unifiedLoggingSurface.SEARCH_RESULTS and (keyword ~= nil and keyword ~= "")
	end
	return var2 and (var1 and ((if filterPriceMin and filterPriceMin ~= "" or filterPriceMax and filterPriceMax ~= "" then filterPrice == unifiedEventLogEnumsModule.FiltersPrice.PRICE_RANGE else true) and (if filterCreatorsName and filterCreatorsName ~= "" then filterCreators == unifiedEventLogEnumsModule.FiltersCreators.CREATORS_BY_USERNAME else true)))
end

function t.hasValidEntityData(p1)
	-- upvalues: unifiedLoggingSurface (ref), AXSendPurchaseAttempt (ref), marketplaceUnifiedAction (ref), t (ref), marketplaceUnifiedItemType (ref), t_1 (ref), widgetUiTreatment (ref)
	if p1.surface == unifiedLoggingSurface.CUSTOMIZE then
		return true
	elseif AXSendPurchaseAttempt and p1.action == marketplaceUnifiedAction.PURCHASE_ATTEMPT then
		return true
	end
	local var1 = 0
	local var2 = t.hasOrganicData(p1)
	local var3 = t.hasWidgetData(p1)
	local var4 = t.hasUiElementData(p1)
	
	if var2 then
		var1 += 1
	end
	if var3 then
		var1 += 1
	end
	if var4 then
		var1 += 1
	end
	if var1 ~= 1 then
		return false
	elseif var2 then
		if not (p1.organicItemPrice ~= nil and p1.organicItemPrice >= 0) then
			return false
		elseif p1.itemType == marketplaceUnifiedItemType.LOOK then
			local var5, var6
			if p1.action == marketplaceUnifiedAction.PURCHASE_ATTEMPT then
				return true
			elseif p1.organicAssetIds then
				var5 = p1.organicAssetIds ~= ""
			end
			if p1.organicBundleIds then
				var6 = p1.organicBundleIds ~= ""
			end
			return var5 or var6
		else
			return p1.assetType and t_1.AssetTypeIdStringToName[tostring(p1.assetType)] ~= nil or p1.bundleType and t_1.BundleTypeIdStringToName[tostring(p1.bundleType)] ~= nil
		end
	elseif var3 then
		local var7, var8, var9
		local var10 = p1.widgetId ~= nil and p1.widgetId ~= ""
		local var11 = p1.widgetType ~= nil and p1.widgetType ~= ""
		
		if p1.widgetItemIds then
			var7 = p1.widgetItemIds ~= ""
		end
		if p1.assetIds then
			var8 = p1.assetIds ~= ""
		end
		if p1.bundleIds then
			var9 = p1.bundleIds ~= ""
		end
		local var12
		local _ = nil
		local var13 = if p1.itemType == marketplaceUnifiedItemType.LOOK and p1.action ~= marketplaceUnifiedAction.PURCHASE_ATTEMPT then var8 or var9 else true
		
		if p1.uiTreatmentType then
			var12 = p1.uiTreatmentType ~= widgetUiTreatment.UNKNOWN_WIDGET_UI
		end
		local var14 = if p1.widgetType == "ThemedAvatarItemsWidget" then p1.themeId ~= nil and p1.themeId ~= "" else true
		local var15 = p1.widgetItemPrice ~= nil and p1.widgetItemPrice >= 0
		
		if p1.action == marketplaceUnifiedAction.WIDGET_IMPRESSION then
			var15 = true
		end
		return var10 and (var11 and (var7 and (var13 and (var12 and (var14 and var15)))))
	else
		return if var4 then p1.elementName ~= nil and p1.elementName ~= "" else false
	end
end

function t.filter(p1)
	-- upvalues: t (ref), marketplaceUnifiedAction (ref), sendAXCounterV2Module (ref), unifiedLoggingSurface (ref)
	local var1 = t.hasItemId(p1)
	local var2 = t.hasValidItemType(p1)
	local var3 = t.hasValidAction(p1)
	local var4 = t.hasValidSurface(p1)
	local var5 = t.hasRequestIdForWidgetLog(p1)
	local var6 = t.hasValidSizeAndPosition(p1)
	local var7 = t.hasValidFilter(p1)
	local var8 = t.hasValidEntityData(p1)
	local var9 = var1 and (var2 and (var3 and (var4 and (var5 and (var6 and (var7 and var8))))))
	
	if not var9 then
		local var10 = ""
		
		if not var1 then
			var10 ..= "hasItemId "
		end
		if not var2 then
			var10 ..= "hasValidItemType "
		end
		if not var3 then
			var10 ..= "hasValidAction "
		end
		if not var4 then
			var10 ..= "hasValidSurface "
		end
		if not var5 then
			var10 ..= "hasRequestIdForWidgetLog "
		end
		if not var6 then
			var10 ..= "hasValidSizeAndPosition "
		end
		if not var7 then
			var10 ..= "hasValidFilter "
		end
		if not var8 then
			var10 ..= "hasValidEntityData "
		end
		if p1.action == marketplaceUnifiedAction.ITEM_IMPRESSION then
			warn("Failed to send unified impression event. Failing Check(s): " .. var32)
		elseif p1.action == marketplaceUnifiedAction.ITEM_SELECTED then
			warn("Failed to send unified click event. Failing Check(s): " .. var32)
		elseif p1.action == marketplaceUnifiedAction.PURCHASE_SUCCESS then
			warn("Failed to send unified purchase event. Failing Check(s): " .. var32)
		else
			warn("Failed to send unified event. Failing Check(s): " .. var32)
		end
	end
	sendAXCounterV2Module("AXUnifiedFilter", {
		success = tostring(var9),
		action = tostring(p1.action or marketplaceUnifiedAction.UNDEFINED_ACTION),
		surface = tostring(p1.surface or unifiedLoggingSurface.UNDEFINED_SURFACE),
		hasItemId = tostring(var1),
		hasValidItemType = tostring(var2),
		hasValidAction = tostring(var3),
		hasValidSurface = tostring(var4),
		hasRequestIdForWidgetLog = tostring(var5),
		hasValidSizeAndPosition = tostring(var6),
		hasValidFilter = tostring(var7),
		hasValidEntityData = tostring(var8)
	})
	
	return var9
end

return t