local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local _ = require(parent.AvatarExperienceCommon)

return function(p1)
	-- upvalues: reactModule (ref), cryoModule (ref)
	return reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), p1 (ref)
		return cryoModule.Dictionary.join(p1.widgetAnalyticsInfo or {}, {
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
			widgetAssetType = p1.widgetAssetType,
			widgetBundleType = p1.widgetBundleType,
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