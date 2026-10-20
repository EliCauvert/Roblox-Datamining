local AvatarExperienceAnalytics = script:FindFirstAncestor("AvatarExperienceAnalytics")
local Parent = AvatarExperienceAnalytics.Parent
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.AvatarExperienceCommon)
local ItemTypeEnum = require(Parent.AvatarExperienceModel).Enums.ItemTypeEnum
local GetMarketplaceUnifiedItemTypeModule = require(AvatarExperienceAnalytics.Utils.getMarketplaceUnifiedItemType)
local GetItemSelectionActionModule = require(AvatarExperienceAnalytics.Utils.getItemSelectionAction)
local GetTimedOptionForItemDataModule = require(AvatarExperienceAnalytics.Utils.getTimedOptionForItemData)
local UnifiedEventLoggingUtilsModule = require(AvatarExperienceAnalytics.Utils.UnifiedEventLoggingUtils)
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXOrganicItemPosition = AvatarExperienceFlagsModule.FFlagAXOrganicItemPosition
local FFlagAXEditorRecommendedItemsUnifiedImpressions = AvatarExperienceFlagsModule.FFlagAXEditorRecommendedItemsUnifiedImpressions

local function isReadyToLog(p1): boolean
	-- upvalues: ItemTypeEnum (copy)
	local ItemType = p1.itemType
	local ItemData = p1.itemData
	local LookData = p1.lookData
	local HydratedContent = p1.hydratedContent
	local Enabled: boolean? = nil
	local Enabled1: boolean? = nil
	local Enabled2: boolean? = nil
	
	if p1.widgetAnalyticsInfo then
		if ItemType == ItemTypeEnum.Look then
			Enabled = if LookData then LookData.totalPrice ~= nil else false
			Enabled1 = p1.widgetAnalyticsInfo.itemId ~= nil
			Enabled2 = true
		else
			Enabled = if HydratedContent then HydratedContent.price ~= nil else false
			Enabled1 = p1.widgetAnalyticsInfo.itemId ~= nil
			Enabled2 = true
		end
	elseif p1.isOrganic then
		if ItemType == ItemTypeEnum.Look then
			Enabled = if LookData then LookData.totalPrice ~= nil else false
			Enabled1 = p1.itemId ~= nil
			Enabled2 = true
		else
			Enabled = if ItemData then ItemData.lowestPrice ~= nil or ItemData.priceInRobux ~= nil else false
			Enabled1 = p1.itemId ~= nil
			Enabled2 = if ItemData then ItemData.assetType ~= nil or ItemData.bundleType ~= nil and ItemData.bundleType ~= "AvatarAnimations" else false
		end
	end
	return Enabled == true and Enabled1 == true and Enabled2 == true
end

local function buildFields(p1)
	-- upvalues: FFlagAXOrganicItemPosition (copy), GetMarketplaceUnifiedItemTypeModule (copy), GetItemSelectionActionModule (copy), FFlagAXEditorRecommendedItemsUnifiedImpressions (copy), UnifiedEventLoggingUtilsModule (copy), GetTimedOptionForItemDataModule (copy), CryoModule (copy)
	local ItemData = p1.itemData
	local LookData = p1.lookData
	local HydratedContent = p1.hydratedContent
	local AssetAndBundleIds = p1.assetAndBundleIds
	local IsOrganic = p1.isOrganic
	local WidgetAnalyticsInfo = p1.widgetAnalyticsInfo
	
	return CryoModule.Dictionary.join(WidgetAnalyticsInfo or {
		itemId = p1.itemId,
		assetType = if ItemData then ItemData.assetType else nil,
		bundleType = if ItemData then ItemData.bundleType else nil,
		gridPositionRow = p1.gridPositionRow,
		gridPositionColumn = p1.gridPositionColumn,
		itemPosition = if FFlagAXOrganicItemPosition then p1.itemPosition else nil
	}, {
		itemType = GetMarketplaceUnifiedItemTypeModule(p1.itemType),
		action = GetItemSelectionActionModule(p1.isSelected == true),
		category = p1.impressionsCategory,
		subcategory = p1.impressionsSubcategory,
		taxonomyId = p1.impressionsTaxonomyId,
		section = if FFlagAXEditorRecommendedItemsUnifiedImpressions then p1.section else nil,
		assetIds = if WidgetAnalyticsInfo and AssetAndBundleIds then AssetAndBundleIds.assetIds else nil,
		bundleIds = if WidgetAnalyticsInfo and AssetAndBundleIds then AssetAndBundleIds.bundleIds else nil,
		organicAssetIds = if IsOrganic and AssetAndBundleIds then AssetAndBundleIds.assetIds else nil,
		organicBundleIds = if IsOrganic and AssetAndBundleIds then AssetAndBundleIds.bundleIds else nil,
		organicLookType = if IsOrganic and LookData and LookData.lookType then UnifiedEventLoggingUtilsModule.formatLookTypeAttribute(LookData.lookType) else nil,
		widgetLookType = if LookData and LookData.lookType and not IsOrganic then UnifiedEventLoggingUtilsModule.formatLookTypeAttribute(LookData.lookType) else nil,
		organicItemPrice = if IsOrganic then if LookData then LookData.totalPrice elseif ItemData then ItemData.lowestPrice or ItemData.priceInRobux else nil else nil,
		widgetItemPrice = if WidgetAnalyticsInfo then if LookData then LookData.totalPrice elseif HydratedContent then HydratedContent.price else nil else nil,
		organicTimedOption = if IsOrganic and ItemData then GetTimedOptionForItemDataModule(ItemData) else nil,
		widgetTimedOption = if IsOrganic or not ItemData then nil else GetTimedOptionForItemDataModule(ItemData),
		widgetAssetType = if IsOrganic or not ItemData then nil else ItemData.assetType,
		widgetBundleType = if IsOrganic or not ItemData then nil else ItemData.bundleType
	})
end

return function(p1)
	-- upvalues: isReadyToLog (copy), buildFields (copy)
	return if isReadyToLog(p1) then buildFields(p1) else nil
end