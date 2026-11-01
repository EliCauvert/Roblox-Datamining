local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.AvatarExperienceCommon)
local AvatarExperienceAnalyticsModule = require(Parent.AvatarExperienceAnalytics)
local FFlagAXUnifiedEventStrictPayloads = require(Parent.AvatarExperienceFlags).FFlagAXUnifiedEventStrictPayloads

return function(p1)
	-- upvalues: ReactModule (copy), CryoModule (copy), FFlagAXUnifiedEventStrictPayloads (copy), AvatarExperienceAnalyticsModule (copy)
	return ReactModule.useMemo(function()
		-- upvalues: CryoModule (upval), p1 (copy), FFlagAXUnifiedEventStrictPayloads (upval), AvatarExperienceAnalyticsModule (upval)
		return CryoModule.Dictionary.join(p1.widgetAnalyticsInfo or {}, {
			action = p1.action,
			itemId = p1.itemId,
			itemType = p1.itemType,
			itemPosition = p1.itemPosition,
			gridPositionRow = p1.gridPositionRow,
			gridPositionColumn = p1.gridPositionColumn,
			uiTreatmentType = p1.uiTreatmentType,
			themeId = p1.themeId,
			category = p1.category,
			subcategory = p1.subcategory,
			taxonomyId = p1.taxonomyId,
			widgetItemPrice = p1.widgetItemPrice,
			widgetTimedOption = p1.widgetTimedOption,
			widgetAssetType = if FFlagAXUnifiedEventStrictPayloads then AvatarExperienceAnalyticsModule.Utils.getMarketplaceUnifiedAssetType(p1.widgetAssetType) else p1.widgetAssetType,
			widgetBundleType = if FFlagAXUnifiedEventStrictPayloads then AvatarExperienceAnalyticsModule.Utils.getMarketplaceUnifiedBundleType(p1.widgetBundleType) else p1.widgetBundleType,
			widgetLookType = p1.widgetLookType,
			assetIds = p1.assetIds,
			bundleIds = p1.bundleIds
		})
	end, {
		p1.action, p1.widgetAnalyticsInfo, p1.itemId, p1.itemType, p1.itemPosition,
		p1.gridPositionRow, p1.gridPositionColumn, p1.uiTreatmentType, p1.themeId,
		p1.category, p1.subcategory, p1.taxonomyId, p1.widgetItemPrice,
		p1.widgetTimedOption, p1.widgetAssetType, p1.widgetBundleType,
		p1.widgetLookType, p1.assetIds, p1.bundleIds
	})
end