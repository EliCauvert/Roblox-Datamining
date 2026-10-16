local Parent = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent
local UnifiedEventLogEnumsModule = require(script.Parent.UnifiedEventLogEnums)
local MarketplaceUnifiedAction = UnifiedEventLogEnumsModule.MarketplaceUnifiedAction
local MarketplaceUnifiedItemType = UnifiedEventLogEnumsModule.MarketplaceUnifiedItemType
local WidgetUiTreatment = UnifiedEventLogEnumsModule.WidgetUiTreatment
local UnifiedLoggingSurface = require(Parent.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface
local SendAXCounterV2Module = require(script.Parent.sendAXCounterV2)
local FFlagAXUnifiedImpressionsOnThumbnail = require(Parent.AvatarExperienceFlags).FFlagAXUnifiedImpressionsOnThumbnail
local FFlagAXFixHomeAvatarsUnifiedPurchase = require(Parent.SharedFlags).FFlagAXFixHomeAvatarsUnifiedPurchase
local FFlagAXEnableUnifiedLoggingAvatarMoment = require(Parent.SharedFlags).FFlagAXEnableUnifiedLoggingAvatarMoment
local FFlagAXUnifiedEventCounters = require(Parent.AvatarExperienceFlags).FFlagAXUnifiedEventCounters
local AXSendPurchaseAttempt = game:DefineFastFlag("AXSendPurchaseAttempt", false)
local AXUnifiedFilterWidgetLoadedAndUIImpression = game:DefineFastFlag("AXUnifiedFilterWidgetLoadedAndUIImpression", false)
local AXAlignUnifiedFilterSearchKeyword = game:DefineFastFlag("AXAlignUnifiedFilterSearchKeyword", false)
local AXUnifiedEventFilterModule = {}
local config = {
	AssetTypeIdStringToName = {},
	BundleTypeIdStringToName = {}
}

for _, enumItem in Enum.BundleType:GetEnumItems() do
	config.BundleTypeIdStringToName[tostring(enumItem.Value)] = enumItem.Name
end
for _, enumItem1 in Enum.AvatarAssetType:GetEnumItems() do
	config.AssetTypeIdStringToName[tostring(enumItem1.Value)] = enumItem1.Name
end
function AXUnifiedEventFilterModule.hasOrganicData(p1): boolean --[[ Line: 110 ]]
	return if p1.assetType or p1.bundleType or p1.organicItemPrice or p1.organicItemWearAfterPurchase or p1.organicItemSaveToMyAvatars or p1.organicAssetIds or p1.organicBundleIds then true else false
end

function AXUnifiedEventFilterModule.hasWidgetData(p1): boolean --[[ Line: 126 ]]
	return if p1.widgetId or p1.widgetType or p1.assetIds or p1.bundleIds or p1.widgetItemIds or p1.organicResultIds or p1.widgetItemPrice or p1.uiTreatmentType or p1.themeId or p1.widgetItemWearAfterPurchase or p1.widgetItemSaveToMyAvatars then true else false
end

function AXUnifiedEventFilterModule.hasUiElementData(p1): boolean --[[ Line: 147 ]]
	return if p1.elementName then true else false
end

function AXUnifiedEventFilterModule.hasItemId(p1): boolean --[[ Line: 155 ]]
	-- upvalues: FFlagAXEnableUnifiedLoggingAvatarMoment (copy), MarketplaceUnifiedAction (copy), AXUnifiedFilterWidgetLoadedAndUIImpression (copy)
	local Action = p1.action
	local ItemId = p1.itemId
	
	return FFlagAXEnableUnifiedLoggingAvatarMoment and Action == MarketplaceUnifiedAction.PAGE_EXIT or (Action == MarketplaceUnifiedAction.UNDEFINED_ACTION or Action == MarketplaceUnifiedAction.UI_ELEMENT_CLICK or Action == MarketplaceUnifiedAction.PAGE_VIEW or Action == MarketplaceUnifiedAction.WIDGET_IMPRESSION or AXUnifiedFilterWidgetLoadedAndUIImpression and (Action == MarketplaceUnifiedAction.UI_ELEMENT_IMPRESSION or Action == MarketplaceUnifiedAction.WIDGET_LOADED) or ItemId ~= nil and ItemId ~= "")
end

function AXUnifiedEventFilterModule.hasValidItemType(p1): boolean --[[ Line: 182 ]]
	-- upvalues: MarketplaceUnifiedItemType (copy), FFlagAXEnableUnifiedLoggingAvatarMoment (copy), MarketplaceUnifiedAction (copy), AXUnifiedFilterWidgetLoadedAndUIImpression (copy)
	local ItemType = p1.itemType
	
	if ItemType == MarketplaceUnifiedItemType.UNDEFINED_ITEM_TYPE or ItemType == nil then
		local Action = p1.action
		
		return FFlagAXEnableUnifiedLoggingAvatarMoment and Action == MarketplaceUnifiedAction.PAGE_EXIT or (if AXUnifiedFilterWidgetLoadedAndUIImpression then Action == MarketplaceUnifiedAction.UI_ELEMENT_CLICK or (Action == MarketplaceUnifiedAction.UI_ELEMENT_IMPRESSION or (Action == MarketplaceUnifiedAction.PAGE_VIEW or (Action == MarketplaceUnifiedAction.WIDGET_IMPRESSION or Action == MarketplaceUnifiedAction.WIDGET_LOADED))) else Action == MarketplaceUnifiedAction.UI_ELEMENT_CLICK or (Action == MarketplaceUnifiedAction.PAGE_VIEW or Action == MarketplaceUnifiedAction.WIDGET_IMPRESSION))
	else
		return ItemType == MarketplaceUnifiedItemType.ASSET or (ItemType == MarketplaceUnifiedItemType.BUNDLE or ItemType == MarketplaceUnifiedItemType.LOOK)
	end
end

function AXUnifiedEventFilterModule.hasValidAction(p1): boolean --[[ Line: 208 ]]
	-- upvalues: MarketplaceUnifiedAction (copy)
	local Action = p1.action
	
	return Action ~= nil and Action ~= MarketplaceUnifiedAction.UNDEFINED_ACTION
end

function AXUnifiedEventFilterModule.hasValidSurface(p1): boolean --[[ Line: 213 ]]
	-- upvalues: UnifiedLoggingSurface (copy)
	local Surface = p1.surface
	
	return Surface ~= nil and Surface ~= UnifiedLoggingSurface.UNDEFINED_SURFACE
end

function AXUnifiedEventFilterModule.hasRequestIdForWidgetLog(p1): boolean --[[ Line: 218 ]]
	-- upvalues: AXUnifiedEventFilterModule (copy)
	return not AXUnifiedEventFilterModule.hasWidgetData(p1) or p1.requestId ~= nil and p1.requestId ~= ""
end

function AXUnifiedEventFilterModule.hasValidSizeAndPosition(p1): boolean --[[ Line: 228 ]]
	-- upvalues: FFlagAXFixHomeAvatarsUnifiedPurchase (copy), MarketplaceUnifiedAction (copy), UnifiedLoggingSurface (copy), FFlagAXEnableUnifiedLoggingAvatarMoment (copy)
	local Action = p1.action
	
	if FFlagAXFixHomeAvatarsUnifiedPurchase and Action == MarketplaceUnifiedAction.PURCHASE_SUCCESS and (p1.surface == UnifiedLoggingSurface.DISCOVERY_HOMEPAGE or p1.surface == UnifiedLoggingSurface.DISCOVERY_SEARCH_RESULTS) then
		return true
	elseif FFlagAXEnableUnifiedLoggingAvatarMoment and Action == MarketplaceUnifiedAction.PURCHASE_SUCCESS and p1.surface == UnifiedLoggingSurface.SHOP_AVATAR_MOMENT then
		return true
	elseif Action == MarketplaceUnifiedAction.ITEM_IMPRESSION or Action == MarketplaceUnifiedAction.ITEM_SELECTED or Action == MarketplaceUnifiedAction.ITEM_DESELECTED or Action == MarketplaceUnifiedAction.PURCHASE_SUCCESS then
		local ScreenSizeHeight = p1.screenSizeHeight or 0
		local ElementSizeHeight = p1.elementSizeHeight or 0
		local IsElementSizeHeightAbove: boolean = (p1.elementSizeWidth or 0) > 0 and ElementSizeHeight > 0
		local GridPositionColumn = p1.gridPositionColumn or 0
		local IsGridPositionColumnAbove: boolean = (p1.gridPositionRow or 0) > 0 and GridPositionColumn > 0
		
		return (p1.screenSizeWidth or 0) > 0 and ScreenSizeHeight > 0 and (IsElementSizeHeightAbove and IsGridPositionColumnAbove)
	elseif Action == MarketplaceUnifiedAction.WIDGET_IMPRESSION then
		local GridPositionColumn = p1.gridPositionColumn or 0
		
		return (p1.gridPositionRow or 0) > 0 and GridPositionColumn == 1
	else
		return true
	end
end

function AXUnifiedEventFilterModule.hasValidFilter(p1): boolean --[[ Line: 279 ]]
	-- upvalues: AXAlignUnifiedFilterSearchKeyword (copy), MarketplaceUnifiedAction (copy), UnifiedLoggingSurface (copy), FFlagAXUnifiedImpressionsOnThumbnail (copy), FFlagAXEnableUnifiedLoggingAvatarMoment (copy), UnifiedEventLogEnumsModule (copy)
	local Surface = p1.surface
	local Keyword = p1.keyword
	local Category = p1.category
	local Subcategory = p1.subcategory
	local FilterPriceMin = p1.filterPriceMin
	local FilterPriceMax = p1.filterPriceMax
	local FilterPrice = p1.filterPrice
	local FilterCreatorsName = p1.filterCreatorsName
	local FilterCreators = p1.filterCreators
	
	if AXAlignUnifiedFilterSearchKeyword and Keyword ~= nil then
		return Keyword ~= "" and (p1.action == MarketplaceUnifiedAction.PURCHASE_ATTEMPT or p1.action == MarketplaceUnifiedAction.PURCHASE_SUCCESS or (Surface == UnifiedLoggingSurface.SEARCH_RESULTS or Surface == UnifiedLoggingSurface.ITEM_DETAILS))
	end
	local IsActionMatch = true
	
	if Category == nil or Category == "" then
		if not FFlagAXUnifiedImpressionsOnThumbnail then
			IsActionMatch = p1.action == MarketplaceUnifiedAction.WIDGET_IMPRESSION or (p1.action == MarketplaceUnifiedAction.UI_ELEMENT_CLICK or (p1.action == MarketplaceUnifiedAction.PAGE_VIEW or (p1.action == MarketplaceUnifiedAction.PURCHASE_ATTEMPT or FFlagAXEnableUnifiedLoggingAvatarMoment and p1.action == MarketplaceUnifiedAction.PAGE_EXIT)))
		end
	elseif Subcategory ~= nil and Subcategory == "" then
		IsActionMatch = false
	end
	local IsFilterPriceMatch: boolean = if FilterPriceMin and FilterPriceMin ~= "" then FilterPrice == UnifiedEventLogEnumsModule.FiltersPrice.PRICE_RANGE else not FilterPriceMax or FilterPriceMax == "" or FilterPrice == UnifiedEventLogEnumsModule.FiltersPrice.PRICE_RANGE
	local NoFilterCreatorsName: boolean = not FilterCreatorsName or FilterCreatorsName == "" or FilterCreators == UnifiedEventLogEnumsModule.FiltersCreators.CREATORS_BY_USERNAME
	
	return (if AXAlignUnifiedFilterSearchKeyword or not Keyword and Surface ~= UnifiedLoggingSurface.SEARCH_RESULTS then true else Surface == UnifiedLoggingSurface.SEARCH_RESULTS and (Keyword ~= nil and Keyword ~= "")) and (IsActionMatch and (IsFilterPriceMatch and NoFilterCreatorsName))
end

local function _(p1): boolean --[[ Line: 352 | Named "isValidPrice" ]]
	local Number: number? = tonumber(p1)
	
	return Number ~= nil and Number >= 0
end

function AXUnifiedEventFilterModule.hasValidEntityData(p1): boolean --[[ Line: 357 ]]
	-- upvalues: UnifiedLoggingSurface (copy), AXSendPurchaseAttempt (copy), MarketplaceUnifiedAction (copy), AXUnifiedEventFilterModule (copy), FFlagAXUnifiedEventCounters (copy), MarketplaceUnifiedItemType (copy), config (copy), WidgetUiTreatment (copy)
	if p1.surface == UnifiedLoggingSurface.CUSTOMIZE then
		return true
	end
	if AXSendPurchaseAttempt and p1.action == MarketplaceUnifiedAction.PURCHASE_ATTEMPT then
		return true
	end
	local Count = 0
	local HasOrganicData = AXUnifiedEventFilterModule.hasOrganicData(p1)
	local HasWidgetData = AXUnifiedEventFilterModule.hasWidgetData(p1)
	local HasUiElementData = AXUnifiedEventFilterModule.hasUiElementData(p1)
	
	if HasOrganicData then
		Count += 1
	end
	if HasWidgetData then
		Count += 1
	end
	if HasUiElementData then
		Count += 1
	end
	if Count ~= 1 then
		return false
	end
	if HasOrganicData then
		local IsNumberAbove = nil
		if FFlagAXUnifiedEventCounters then
			local Number: number? = tonumber(p1.organicItemPrice)
			IsNumberAbove = Number ~= nil and Number >= 0
		else
			IsNumberAbove = p1.organicItemPrice ~= nil and p1.organicItemPrice >= 0
		end
		if not IsNumberAbove then
			return false
		elseif p1.itemType ~= MarketplaceUnifiedItemType.LOOK then
			local HasAssetTypeIdStringToNameEntry: boolean = p1.assetType and config.AssetTypeIdStringToName[tostring(p1.assetType)] ~= nil
			local HasBundleTypeIdStringToNameEntry: boolean = p1.bundleType and config.BundleTypeIdStringToName[tostring(p1.bundleType)] ~= nil
			
			return if HasAssetTypeIdStringToNameEntry or HasBundleTypeIdStringToNameEntry then true else false
		elseif p1.action == MarketplaceUnifiedAction.PURCHASE_ATTEMPT then
			return true
		else
			local IsNotOrganicBundleIdsMatch: boolean = if p1.organicBundleIds then p1.organicBundleIds ~= "" else false
			
			return (if p1.organicAssetIds then p1.organicAssetIds ~= "" else false) or IsNotOrganicBundleIdsMatch
		end
	else
		if not HasWidgetData then
			return if HasUiElementData then p1.elementName ~= nil and p1.elementName ~= "" else false
		end
		local IsNotWidgetIdMatch: boolean = p1.widgetId ~= nil and p1.widgetId ~= ""
		local IsNotWidgetTypeMatch: boolean = p1.widgetType ~= nil and p1.widgetType ~= ""
		local IsNotWidgetItemIdsMatch: boolean = if p1.widgetItemIds then p1.widgetItemIds ~= "" else false
		local IsNotAssetIdsMatch: boolean = if p1.assetIds then p1.assetIds ~= "" else false
		local IsNotBundleIdsMatch: boolean = if p1.bundleIds then p1.bundleIds ~= "" else false
		local IsNotItemTypeMatch: boolean = p1.itemType ~= MarketplaceUnifiedItemType.LOOK or p1.action == MarketplaceUnifiedAction.PURCHASE_ATTEMPT or (IsNotAssetIdsMatch or IsNotBundleIdsMatch)
		local IsNotUiTreatmentTypeMatch: boolean = if p1.uiTreatmentType then p1.uiTreatmentType ~= WidgetUiTreatment.UNKNOWN_WIDGET_UI else false
		local IsNotThemeIdMatch: boolean = p1.themeId ~= nil and p1.themeId ~= ""
		local Inverted: boolean = not (p1.widgetType == "ThemedAvatarItemsWidget") or IsNotThemeIdMatch
		local IsNumberAbove = nil
		
		if FFlagAXUnifiedEventCounters then
			local Number: number? = tonumber(p1.widgetItemPrice)
			IsNumberAbove = Number ~= nil and Number >= 0
		else
			IsNumberAbove = p1.widgetItemPrice ~= nil and p1.widgetItemPrice >= 0
		end
		if p1.action == MarketplaceUnifiedAction.WIDGET_IMPRESSION then
			IsNumberAbove = true
		end
		return IsNotWidgetIdMatch and (IsNotWidgetTypeMatch and (IsNotWidgetItemIdsMatch and (IsNotItemTypeMatch and (IsNotUiTreatmentTypeMatch and (Inverted and IsNumberAbove)))))
	end
end

function AXUnifiedEventFilterModule.filter(p1, p2) --[[ Line: 479 ]]
	-- upvalues: AXUnifiedEventFilterModule (copy), FFlagAXUnifiedEventCounters (copy), MarketplaceUnifiedAction (copy), SendAXCounterV2Module (copy), UnifiedLoggingSurface (copy)
	local HasItemId = AXUnifiedEventFilterModule.hasItemId(p1)
	local HasValidItemType = AXUnifiedEventFilterModule.hasValidItemType(p1)
	local HasValidAction = AXUnifiedEventFilterModule.hasValidAction(p1)
	local HasValidSurface = AXUnifiedEventFilterModule.hasValidSurface(p1)
	local HasRequestIdForWidgetLog = AXUnifiedEventFilterModule.hasRequestIdForWidgetLog(p1)
	local HasValidSizeAndPosition = AXUnifiedEventFilterModule.hasValidSizeAndPosition(p1)
	local HasValidFilter = AXUnifiedEventFilterModule.hasValidFilter(p1)
	local HasValidEntityData = AXUnifiedEventFilterModule.hasValidEntityData(p1)
	local HasValidEntityData1 = HasItemId and (HasValidItemType and (HasValidAction and (HasValidSurface and (HasRequestIdForWidgetLog and (HasValidSizeAndPosition and (HasValidFilter and HasValidEntityData))))))
	
	if FFlagAXUnifiedEventCounters and p2 ~= nil and p2.skipReporting then
		return HasValidEntityData1
	end
	if not HasValidEntityData1 then
		local Text = ""
		
		if not HasItemId then
			Text ..= "hasItemId "
		end
		if not HasValidItemType then
			Text ..= "hasValidItemType "
		end
		if not HasValidAction then
			Text ..= "hasValidAction "
		end
		if not HasValidSurface then
			Text ..= "hasValidSurface "
		end
		if not HasRequestIdForWidgetLog then
			Text ..= "hasRequestIdForWidgetLog "
		end
		if not HasValidSizeAndPosition then
			Text ..= "hasValidSizeAndPosition "
		end
		if not HasValidFilter then
			Text ..= "hasValidFilter "
		end
		if not HasValidEntityData then
			Text ..= "hasValidEntityData "
		end
		if p1.action == MarketplaceUnifiedAction.ITEM_IMPRESSION then
			warn("Failed to send unified impression event. Failing Check(s): " .. Text)
		elseif p1.action == MarketplaceUnifiedAction.ITEM_SELECTED then
			warn("Failed to send unified click event. Failing Check(s): " .. Text)
		elseif p1.action == MarketplaceUnifiedAction.PURCHASE_SUCCESS then
			warn("Failed to send unified purchase event. Failing Check(s): " .. Text)
		else
			warn("Failed to send unified event. Failing Check(s): " .. Text)
		end
	end
	SendAXCounterV2Module("AXUnifiedFilter", {
		success = tostring(HasValidEntityData1),
		action = tostring(p1.action or MarketplaceUnifiedAction.UNDEFINED_ACTION),
		surface = tostring(p1.surface or UnifiedLoggingSurface.UNDEFINED_SURFACE),
		hasItemId = tostring(HasItemId),
		hasValidItemType = tostring(HasValidItemType),
		hasValidAction = tostring(HasValidAction),
		hasValidSurface = tostring(HasValidSurface),
		hasRequestIdForWidgetLog = tostring(HasRequestIdForWidgetLog),
		hasValidSizeAndPosition = tostring(HasValidSizeAndPosition),
		hasValidFilter = tostring(HasValidFilter),
		hasValidEntityData = tostring(HasValidEntityData)
	})
	
	return HasValidEntityData1
end

return AXUnifiedEventFilterModule