local AvatarExperienceAnalytics = script:FindFirstAncestor("AvatarExperienceAnalytics")
local Parent = AvatarExperienceAnalytics.Parent
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.AvatarExperienceCommon)
local ItemTypeEnum = require(Parent.AvatarExperienceModel).Enums.ItemTypeEnum
local _ = require(AvatarExperienceAnalytics.Generated.UnifiedEventTypes)
local GetMarketplaceUnifiedItemTypeModule = require(AvatarExperienceAnalytics.Utils.getMarketplaceUnifiedItemType)
local GetMarketplaceUnifiedLookTypeModule = require(AvatarExperienceAnalytics.Utils.getMarketplaceUnifiedLookType)
local GetMarketplaceUnifiedAssetTypeModule = require(AvatarExperienceAnalytics.Utils.getMarketplaceUnifiedAssetType)
local GetMarketplaceUnifiedBundleTypeModule = require(AvatarExperienceAnalytics.Utils.getMarketplaceUnifiedBundleType)
local GetItemSelectionActionModule = require(AvatarExperienceAnalytics.Utils.getItemSelectionAction)
local GetTimedOptionForItemDataModule = require(AvatarExperienceAnalytics.Utils.getTimedOptionForItemData)
local UnifiedEventLoggingUtilsModule = require(AvatarExperienceAnalytics.Utils.UnifiedEventLoggingUtils)
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXUnifiedEventStrictPayloads = AvatarExperienceFlagsModule.FFlagAXUnifiedEventStrictPayloads
local FFlagAXEditorRecommendedItemsUnifiedImpressions = AvatarExperienceFlagsModule.FFlagAXEditorRecommendedItemsUnifiedImpressions

local function _(List)
	return if List then table.concat(List, ",") else nil
end

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
	-- upvalues: FFlagAXUnifiedEventStrictPayloads (copy), GetMarketplaceUnifiedAssetTypeModule (copy), GetMarketplaceUnifiedBundleTypeModule (copy), GetMarketplaceUnifiedItemTypeModule (copy), GetItemSelectionActionModule (copy), FFlagAXEditorRecommendedItemsUnifiedImpressions (copy), GetMarketplaceUnifiedLookTypeModule (copy), UnifiedEventLoggingUtilsModule (copy), GetTimedOptionForItemDataModule (copy), CryoModule (copy)
	local ItemData = p1.itemData
	local LookData = p1.lookData
	local HydratedContent = p1.hydratedContent
	local AssetAndBundleIds = p1.assetAndBundleIds
	local IsOrganic = p1.isOrganic
	local WidgetAnalyticsInfo = p1.widgetAnalyticsInfo
	local WidgetAnalyticsInfo1 = WidgetAnalyticsInfo or {
		itemId = if FFlagAXUnifiedEventStrictPayloads and p1.itemId ~= nil then tostring(p1.itemId) else p1.itemId,
		assetType = if ItemData then if FFlagAXUnifiedEventStrictPayloads then GetMarketplaceUnifiedAssetTypeModule(ItemData.assetType) else ItemData.assetType else nil,
		bundleType = if ItemData then if FFlagAXUnifiedEventStrictPayloads then GetMarketplaceUnifiedBundleTypeModule(ItemData.bundleType) else ItemData.bundleType else nil,
		gridPositionRow = p1.gridPositionRow,
		gridPositionColumn = p1.gridPositionColumn,
		itemPosition = p1.itemPosition
	}
	local config = {
		itemType = GetMarketplaceUnifiedItemTypeModule(p1.itemType),
		action = GetItemSelectionActionModule(p1.isSelected == true),
		category = p1.impressionsCategory,
		subcategory = p1.impressionsSubcategory,
		taxonomyId = p1.impressionsTaxonomyId,
		section = if FFlagAXEditorRecommendedItemsUnifiedImpressions then p1.section else nil,
		gridPositionRow = if FFlagAXUnifiedEventStrictPayloads and WidgetAnalyticsInfo1.gridPositionRow == nil then p1.gridPositionRow else nil,
		gridPositionColumn = if FFlagAXUnifiedEventStrictPayloads and WidgetAnalyticsInfo1.gridPositionColumn == nil then p1.gridPositionColumn else nil
	}
	local AssetIds = nil
	
	if WidgetAnalyticsInfo and AssetAndBundleIds then
		if FFlagAXUnifiedEventStrictPayloads then
			local AssetIds1 = AssetAndBundleIds.assetIds
			AssetIds = if AssetIds1 then table.concat(AssetIds1, ",") else nil
		else
			AssetIds = AssetAndBundleIds.assetIds
		end
	else
		AssetIds = nil
	end
	config.assetIds = AssetIds
	local BundleIds = nil
	
	if WidgetAnalyticsInfo and AssetAndBundleIds then
		if FFlagAXUnifiedEventStrictPayloads then
			local BundleIds1 = AssetAndBundleIds.bundleIds
			BundleIds = if BundleIds1 then table.concat(BundleIds1, ",") else nil
		else
			BundleIds = AssetAndBundleIds.bundleIds
		end
	else
		BundleIds = nil
	end
	config.bundleIds = BundleIds
	local AssetIds2 = nil
	
	if IsOrganic and AssetAndBundleIds then
		if FFlagAXUnifiedEventStrictPayloads then
			local AssetIds21 = AssetAndBundleIds.assetIds
			AssetIds2 = if AssetIds21 then table.concat(AssetIds21, ",") else nil
		else
			AssetIds2 = AssetAndBundleIds.assetIds
		end
	else
		AssetIds2 = nil
	end
	config.organicAssetIds = AssetIds2
	local BundleIds2 = nil
	
	if IsOrganic and AssetAndBundleIds then
		if FFlagAXUnifiedEventStrictPayloads then
			local BundleIds21 = AssetAndBundleIds.bundleIds
			BundleIds2 = if BundleIds21 then table.concat(BundleIds21, ",") else nil
		else
			BundleIds2 = AssetAndBundleIds.bundleIds
		end
	else
		BundleIds2 = nil
	end
	config.organicBundleIds = BundleIds2
	config.organicLookType = if IsOrganic and LookData and LookData.lookType then if FFlagAXUnifiedEventStrictPayloads then GetMarketplaceUnifiedLookTypeModule(LookData.lookType) else UnifiedEventLoggingUtilsModule.formatLookTypeAttribute(LookData.lookType) else nil
	config.widgetLookType = if LookData and LookData.lookType and not IsOrganic then if FFlagAXUnifiedEventStrictPayloads then GetMarketplaceUnifiedLookTypeModule(LookData.lookType) else UnifiedEventLoggingUtilsModule.formatLookTypeAttribute(LookData.lookType) else nil
	config.organicItemPrice = if IsOrganic then if LookData then LookData.totalPrice elseif ItemData then ItemData.lowestPrice or ItemData.priceInRobux else nil else nil
	config.widgetItemPrice = if WidgetAnalyticsInfo then if LookData then LookData.totalPrice elseif HydratedContent then HydratedContent.price else nil else nil
	config.organicTimedOption = if IsOrganic and ItemData then GetTimedOptionForItemDataModule(ItemData) else nil
	config.widgetTimedOption = if IsOrganic or not ItemData then nil else GetTimedOptionForItemDataModule(ItemData)
	config.widgetAssetType = if IsOrganic or not ItemData then nil elseif FFlagAXUnifiedEventStrictPayloads then GetMarketplaceUnifiedAssetTypeModule(ItemData.assetType) else ItemData.assetType
	config.widgetBundleType = if IsOrganic or not ItemData then nil elseif FFlagAXUnifiedEventStrictPayloads then GetMarketplaceUnifiedBundleTypeModule(ItemData.bundleType) else ItemData.bundleType
	
	return (CryoModule.Dictionary.join(WidgetAnalyticsInfo1, config))
end

return function(p1)
	-- upvalues: isReadyToLog (copy), buildFields (copy)
	return if isReadyToLog(p1) then buildFields(p1) else nil
end