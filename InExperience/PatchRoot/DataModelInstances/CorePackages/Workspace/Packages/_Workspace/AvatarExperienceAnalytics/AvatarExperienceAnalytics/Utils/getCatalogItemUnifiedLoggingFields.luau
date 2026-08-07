local avatarExperienceAnalytics = script:FindFirstAncestor("AvatarExperienceAnalytics")
local parent = avatarExperienceAnalytics.Parent
local cryoModule = require(parent.Cryo)
local itemTypeEnum = require(parent.AvatarExperienceCommon).Enums.ItemTypeEnum
local getMarketplaceUnifiedItemTypeModule = require(avatarExperienceAnalytics.Utils.getMarketplaceUnifiedItemType)
local getItemSelectionActionModule = require(avatarExperienceAnalytics.Utils.getItemSelectionAction)
local getTimedOptionForItemDataModule = require(avatarExperienceAnalytics.Utils.getTimedOptionForItemData)
local unifiedEventLoggingUtilsModule = require(avatarExperienceAnalytics.Utils.UnifiedEventLoggingUtils)
local fFlagAddTypesToWidgetItems = require(parent.AvatarExperienceFlags).FFlagAddTypesToWidgetItems

local function isReadyToLog(p0) --[[ line: 87 ]]
	-- upvalues: itemTypeEnum (ref)
	local itemType = p0.itemType
	local itemData = p0.itemData
	local lookData = p0.lookData
	local hydratedContent = p0.hydratedContent
	local var8 = nil
	local var9 = nil
	local var10 = nil
	
	if p0.widgetAnalyticsInfo then
		if itemType == itemTypeEnum.Look then
			if lookData then
				var8 = lookData.totalPrice ~= nil
				var8 = nil
			else
				var8 = false
			end
			var9 = p0.widgetAnalyticsInfo.itemId ~= nil
			var10 = true
		elseif hydratedContent then
			var8 = hydratedContent.price ~= nil
			var8 = nil
		else
			var8 = false
		end
		var9 = p0.widgetAnalyticsInfo.itemId ~= nil
		var10 = true
	elseif p0.isOrganic then
		if itemType == itemTypeEnum.Look then
			if lookData then
				var8 = lookData.totalPrice ~= nil
				var8 = nil
			else
				var8 = false
			end
			var9 = p0.itemId ~= nil
			var10 = true
		else
			var8 = if itemData then if itemData.lowestPrice == nil then itemData.priceInRobux ~= nil else true else false
			var9 = p0.itemId ~= nil
			var10 = if itemData then if itemData.assetType == nil then itemData.bundleType ~= nil and itemData.bundleType ~= "AvatarAnimations" else true else false
		end
	end
	return var8 == true and (var9 == true and var10 == true)
end

local function buildFields(p1) --[[ line: 123 ]]
	-- upvalues: getMarketplaceUnifiedItemTypeModule (ref), getItemSelectionActionModule (ref), unifiedEventLoggingUtilsModule (ref), getTimedOptionForItemDataModule (ref), fFlagAddTypesToWidgetItems (ref), cryoModule (ref)
	local itemData = p1.itemData
	local lookData = p1.lookData
	local hydratedContent = p1.hydratedContent
	local assetAndBundleIds = p1.assetAndBundleIds
	local isOrganic = p1.isOrganic
	local widgetAnalyticsInfo = p1.widgetAnalyticsInfo
	
	return cryoModule.Dictionary.join(widgetAnalyticsInfo or {
		itemId = p1.itemId,
		assetType = if itemData then itemData.assetType else nil,
		bundleType = if itemData then itemData.bundleType else nil,
		gridPositionRow = p1.gridPositionRow,
		gridPositionColumn = p1.gridPositionColumn
	}, {
		itemType = getMarketplaceUnifiedItemTypeModule(p1.itemType),
		action = getItemSelectionActionModule(p1.isSelected == true),
		category = p1.impressionsCategory,
		subcategory = p1.impressionsSubcategory,
		taxonomyId = p1.impressionsTaxonomyId,
		assetIds = if widgetAnalyticsInfo and assetAndBundleIds then assetAndBundleIds.assetIds else nil,
		bundleIds = if widgetAnalyticsInfo and assetAndBundleIds then assetAndBundleIds.bundleIds else nil,
		organicAssetIds = if isOrganic and assetAndBundleIds then assetAndBundleIds.assetIds else nil,
		organicBundleIds = if isOrganic and assetAndBundleIds then assetAndBundleIds.bundleIds else nil,
		organicLookType = if isOrganic and lookData and lookData.lookType then unifiedEventLoggingUtilsModule.formatLookTypeAttribute(lookData.lookType) else nil,
		widgetLookType = if lookData and lookData.lookType and not isOrganic then unifiedEventLoggingUtilsModule.formatLookTypeAttribute(lookData.lookType) else nil,
		organicItemPrice = if isOrganic then if lookData then lookData.totalPrice elseif itemData then itemData.lowestPrice or itemData.priceInRobux else nil else nil,
		widgetItemPrice = if widgetAnalyticsInfo then if lookData then lookData.totalPrice elseif hydratedContent then hydratedContent.price else nil else nil,
		organicTimedOption = if isOrganic and itemData then getTimedOptionForItemDataModule(itemData) else nil,
		widgetTimedOption = if isOrganic or not itemData then nil else getTimedOptionForItemDataModule(itemData),
		widgetAssetType = if fFlagAddTypesToWidgetItems and not isOrganic and itemData then itemData.assetType else nil,
		widgetBundleType = if fFlagAddTypesToWidgetItems and not isOrganic and itemData then itemData.bundleType else nil
	})
end

return function(p2) --[[ line: 188 | named "getCatalogItemUnifiedLoggingFields" ]]
	-- upvalues: isReadyToLog (ref), buildFields (ref)
	return if isReadyToLog(p2) then buildFields(p2) else nil
end