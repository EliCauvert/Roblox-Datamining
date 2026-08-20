local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local _ = require(parent.AvatarExperienceCommon)

return function(p0) --[[ line: 32 | named "useWidgetItemPayload" ]]
	-- upvalues: reactModule (ref), cryoModule (ref)
	return reactModule.useMemo(function() --[[ line: 34 ]]
		-- upvalues: cryoModule (copy), p0 (ref)
		return cryoModule.Dictionary.join(p0.widgetAnalyticsInfo or {}, {
			action = p0.action,
			itemId = p0.itemId,
			itemType = p0.itemType,
			itemPosition = p0.itemPosition,
			gridPositionRow = p0.gridPositionRow,
			gridPositionColumn = p0.gridPositionColumn,
			uiTreatmentType = p0.uiTreatmentType,
			themeId = p0.themeId,
			category = p0.category,
			subcategory = p0.subcategory,
			taxonomyId = p0.taxonomyId,
			widgetItemPrice = p0.widgetItemPrice,
			widgetTimedOption = p0.widgetTimedOption,
			widgetAssetType = p0.widgetAssetType,
			widgetBundleType = p0.widgetBundleType,
			widgetLookType = p0.widgetLookType,
			assetIds = p0.assetIds,
			bundleIds = p0.bundleIds
		})
	end, {
		p0.action, p0.widgetAnalyticsInfo, p0.itemId, p0.itemType, p0.itemPosition,
		p0.gridPositionRow, p0.gridPositionColumn, p0.uiTreatmentType, p0.themeId,
		p0.category, p0.subcategory, p0.taxonomyId, p0.widgetItemPrice,
		p0.widgetTimedOption, p0.widgetAssetType, p0.widgetBundleType,
		p0.widgetLookType, p0.assetIds, p0.bundleIds
	})
end