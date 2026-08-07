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
function t.hasOrganicData(p0) --[[ line: 107 ]]
	return p0.assetType or p0.bundleType or (p0.organicItemPrice or p0.organicItemWearAfterPurchase) or (p0.organicItemSaveToMyAvatars or p0.organicAssetIds or p0.organicBundleIds)
end

function t.hasWidgetData(p1) --[[ line: 123 ]]
	return p1.widgetId or p1.widgetType or (p1.assetIds or p1.bundleIds) or (p1.widgetItemIds or p1.organicResultIds or (p1.widgetItemPrice or p1.uiTreatmentType)) or (p1.themeId or p1.widgetItemWearAfterPurchase or p1.widgetItemSaveToMyAvatars)
end

function t.hasUiElementData(p2) --[[ line: 144 ]]
	return p2.elementName
end

function t.hasItemId(p3) --[[ line: 152 ]]
	-- upvalues: marketplaceUnifiedAction (ref), AXUnifiedFilterWidgetLoadedAndUIImpression (ref)
	local action = p3.action
	local itemId = p3.itemId
	
	return if action == marketplaceUnifiedAction.UNDEFINED_ACTION or action == marketplaceUnifiedAction.UI_ELEMENT_CLICK or action == marketplaceUnifiedAction.WIDGET_IMPRESSION or AXUnifiedFilterWidgetLoadedAndUIImpression and (action == marketplaceUnifiedAction.UI_ELEMENT_IMPRESSION or action == marketplaceUnifiedAction.WIDGET_LOADED) then true else itemId ~= nil and itemId ~= ""
end

function t.hasValidItemType(p4) --[[ line: 175 ]]
	-- upvalues: marketplaceUnifiedItemType (ref), AXUnifiedFilterWidgetLoadedAndUIImpression (ref), marketplaceUnifiedAction (ref)
	local itemType = p4.itemType
	
	if itemType == marketplaceUnifiedItemType.UNDEFINED_ITEM_TYPE or itemType == nil then
		local action = p4.action
		
		return if AXUnifiedFilterWidgetLoadedAndUIImpression then if action ~= marketplaceUnifiedAction.UI_ELEMENT_CLICK then if action ~= marketplaceUnifiedAction.UI_ELEMENT_IMPRESSION then if action ~= marketplaceUnifiedAction.WIDGET_IMPRESSION then action == marketplaceUnifiedAction.WIDGET_LOADED else true else true else true elseif action ~= marketplaceUnifiedAction.UI_ELEMENT_CLICK then action == marketplaceUnifiedAction.WIDGET_IMPRESSION else true
	end
	return if itemType ~= marketplaceUnifiedItemType.ASSET then if itemType ~= marketplaceUnifiedItemType.BUNDLE then itemType == marketplaceUnifiedItemType.LOOK else true else true
end

function t.hasValidAction(p5) --[[ line: 196 ]]
	-- upvalues: marketplaceUnifiedAction (ref)
	local action = p5.action
	
	return action ~= nil and action ~= marketplaceUnifiedAction.UNDEFINED_ACTION
end

function t.hasValidSurface(p6) --[[ line: 201 ]]
	-- upvalues: unifiedLoggingSurface (ref)
	local surface = p6.surface
	
	return surface ~= nil and surface ~= unifiedLoggingSurface.UNDEFINED_SURFACE
end

function t.hasRequestIdForWidgetLog(p7) --[[ line: 206 ]]
	-- upvalues: t (ref)
	return if t.hasWidgetData(p7) then p7.requestId ~= nil and p7.requestId ~= "" else true
end

function t.hasValidSizeAndPosition(p8) --[[ line: 216 ]]
	-- upvalues: marketplaceUnifiedAction (ref)
	local action = p8.action
	
	return if action == marketplaceUnifiedAction.ITEM_IMPRESSION or action == marketplaceUnifiedAction.ITEM_SELECTED or (action == marketplaceUnifiedAction.ITEM_DESELECTED or action == marketplaceUnifiedAction.PURCHASE_SUCCESS) then ((p8.screenSizeWidth or 0) > 0 and (p8.screenSizeHeight or 0) > 0) and (((p8.elementSizeWidth or 0) > 0 and (p8.elementSizeHeight or 0) > 0) and ((p8.gridPositionRow or 0) > 0 and (p8.gridPositionColumn or 0) > 0)) elseif action == marketplaceUnifiedAction.WIDGET_IMPRESSION then (p8.gridPositionRow or 0) > 0 and (p8.gridPositionColumn or 0) == 1 else true
end

function t.hasValidFilter(p9) --[[ line: 251 ]]
	-- upvalues: fFlagAXUnifiedImpressionsOnThumbnail (ref), marketplaceUnifiedAction (ref), unifiedLoggingSurface (ref), unifiedEventLogEnumsModule (ref)
	local surface = p9.surface
	local keyword = p9.keyword
	local category = p9.category
	local subcategory = p9.subcategory
	local filterPriceMin = p9.filterPriceMin
	local filterPriceMax = p9.filterPriceMax
	local filterPrice = p9.filterPrice
	local filterCreatorsName = p9.filterCreatorsName
	local filterCreators = p9.filterCreators
	local var6 = true
	
	if category == nil or category == "" then
		if not fFlagAXUnifiedImpressionsOnThumbnail then
			var6 = if p9.action ~= marketplaceUnifiedAction.WIDGET_IMPRESSION then if p9.action ~= marketplaceUnifiedAction.UI_ELEMENT_CLICK then p9.action == marketplaceUnifiedAction.PURCHASE_ATTEMPT else true else true
		end
	elseif subcategory ~= nil and subcategory == "" then
		var6 = false
	end
	local var7 = true
	
	if keyword or surface == unifiedLoggingSurface.SEARCH_RESULTS then
		var7 = surface == unifiedLoggingSurface.SEARCH_RESULTS and (keyword ~= nil and keyword ~= "")
	end
	return var7 and (var6 and ((if filterPriceMin and filterPriceMin ~= "" or filterPriceMax and filterPriceMax ~= "" then filterPrice == unifiedEventLogEnumsModule.FiltersPrice.PRICE_RANGE else true) and (if filterCreatorsName and filterCreatorsName ~= "" then filterCreators == unifiedEventLogEnumsModule.FiltersCreators.CREATORS_BY_USERNAME else true)))
end

function t.hasValidEntityData(p10) --[[ line: 297 ]]
	-- upvalues: unifiedLoggingSurface (ref), AXSendPurchaseAttempt (ref), marketplaceUnifiedAction (ref), t (ref), marketplaceUnifiedItemType (ref), t_1 (ref), widgetUiTreatment (ref)
	if p10.surface == unifiedLoggingSurface.CUSTOMIZE then
		return true
	elseif AXSendPurchaseAttempt and p10.action == marketplaceUnifiedAction.PURCHASE_ATTEMPT then
		return true
	end
	local var8 = 0
	local var9 = t.hasOrganicData(p10)
	local var10 = t.hasWidgetData(p10)
	local var11 = t.hasUiElementData(p10)
	
	if var9 then
		var8 += 1
	end
	if var10 then
		var8 += 1
	end
	if var11 then
		var8 += 1
	end
	if var8 ~= 1 then
		return false
	elseif var9 then
		if not (p10.organicItemPrice ~= nil and p10.organicItemPrice >= 0) then
			return false
		elseif p10.itemType == marketplaceUnifiedItemType.LOOK then
			local var12, var13
			if p10.action == marketplaceUnifiedAction.PURCHASE_ATTEMPT then
				return true
			elseif p10.organicAssetIds then
				var12 = p10.organicAssetIds ~= ""
			end
			if p10.organicBundleIds then
				var13 = p10.organicBundleIds ~= ""
			end
			return var12 or var13
		else
			return p10.assetType and t_1.AssetTypeIdStringToName[tostring(p10.assetType)] ~= nil or p10.bundleType and t_1.BundleTypeIdStringToName[tostring(p10.bundleType)] ~= nil
		end
	elseif var10 then
		local var16, var17, var18
		local var14 = p10.widgetId ~= nil and p10.widgetId ~= ""
		local var15 = p10.widgetType ~= nil and p10.widgetType ~= ""
		
		if p10.widgetItemIds then
			var16 = p10.widgetItemIds ~= ""
		end
		if p10.assetIds then
			var17 = p10.assetIds ~= ""
		end
		if p10.bundleIds then
			var18 = p10.bundleIds ~= ""
		end
		local var20
		local _ = nil
		local var19 = if p10.itemType == marketplaceUnifiedItemType.LOOK and p10.action ~= marketplaceUnifiedAction.PURCHASE_ATTEMPT then var17 or var18 else true
		
		if p10.uiTreatmentType then
			var20 = p10.uiTreatmentType ~= widgetUiTreatment.UNKNOWN_WIDGET_UI
		end
		local var21 = if p10.widgetType == "ThemedAvatarItemsWidget" then p10.themeId ~= nil and p10.themeId ~= "" else true
		local var22 = p10.widgetItemPrice ~= nil and p10.widgetItemPrice >= 0
		
		if p10.action == marketplaceUnifiedAction.WIDGET_IMPRESSION then
			var22 = true
		end
		return var14 and (var15 and (var16 and (var19 and (var20 and (var21 and var22)))))
	else
		return if var11 then p10.elementName ~= nil and p10.elementName ~= "" else false
	end
end

function t.filter(p11) --[[ line: 407 ]]
	-- upvalues: t (ref), marketplaceUnifiedAction (ref), sendAXCounterV2Module (ref), unifiedLoggingSurface (ref)
	local var23 = t.hasItemId(p11)
	local var24 = t.hasValidItemType(p11)
	local var25 = t.hasValidAction(p11)
	local var26 = t.hasValidSurface(p11)
	local var27 = t.hasRequestIdForWidgetLog(p11)
	local var28 = t.hasValidSizeAndPosition(p11)
	local var29 = t.hasValidFilter(p11)
	local var30 = t.hasValidEntityData(p11)
	local var30_1 = var23 and (var24 and (var25 and (var26 and (var27 and (var28 and (var29 and var30))))))
	
	if not var30_1 then
		local var32 = ""
		
		if not var23 then
			var32 ..= "hasItemId "
		end
		if not var24 then
			var32 ..= "hasValidItemType "
		end
		if not var25 then
			var32 ..= "hasValidAction "
		end
		if not var26 then
			var32 ..= "hasValidSurface "
		end
		if not var27 then
			var32 ..= "hasRequestIdForWidgetLog "
		end
		if not var28 then
			var32 ..= "hasValidSizeAndPosition "
		end
		if not var29 then
			var32 ..= "hasValidFilter "
		end
		if not var30 then
			var32 ..= "hasValidEntityData "
		end
		if p11.action == marketplaceUnifiedAction.ITEM_IMPRESSION then
			warn("Failed to send unified impression event. Failing Check(s): " .. var32)
		elseif p11.action == marketplaceUnifiedAction.ITEM_SELECTED then
			warn("Failed to send unified click event. Failing Check(s): " .. var32)
		elseif p11.action == marketplaceUnifiedAction.PURCHASE_SUCCESS then
			warn("Failed to send unified purchase event. Failing Check(s): " .. var32)
		else
			warn("Failed to send unified event. Failing Check(s): " .. var32)
		end
	end
	sendAXCounterV2Module("AXUnifiedFilter", {
		success = tostring(var30_1),
		action = tostring(p11.action or marketplaceUnifiedAction.UNDEFINED_ACTION),
		surface = tostring(p11.surface or unifiedLoggingSurface.UNDEFINED_SURFACE),
		hasItemId = tostring(var23),
		hasValidItemType = tostring(var24),
		hasValidAction = tostring(var25),
		hasValidSurface = tostring(var26),
		hasRequestIdForWidgetLog = tostring(var27),
		hasValidSizeAndPosition = tostring(var28),
		hasValidFilter = tostring(var29),
		hasValidEntityData = tostring(var30)
	})
	
	return var30_1
end

return t