local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.AppCommonLib)
local _ = require(Parent.AvatarExperienceCommon)
local SeenImpressionsStore = require(Parent.AvatarExperienceAnalytics).Store.SeenImpressionsStore
local Category = SeenImpressionsStore.Category
local UseOnRequestImpressionsSignalModule = require(AvatarExperienceCatalog.Components.Hooks.useOnRequestImpressionsSignal)

return function(p1) --[[ Line: 61 | Named "useWidgetItemImpressions" ]]
	-- upvalues: UseOnRequestImpressionsSignalModule (copy), ReactModule (copy), SeenImpressionsStore (copy), Category (copy), CryoModule (copy)
	local WidgetId = p1.widgetId
	local Content = p1.content
	local WidgetRow = p1.widgetRow
	local ItemsPerRow = p1.itemsPerRow
	local WidgetAnalyticsInfo = p1.widgetAnalyticsInfo
	local UiTreatmentType = p1.uiTreatmentType
	local ReportItemImpressionFunction = p1.reportItemImpression
	local BuildItemImpressionInfoFunction = p1.buildItemImpressionInfo
	
	return {
		onRequestImpressionsSignal = UseOnRequestImpressionsSignalModule(),
		onImpressionsDetected = ReactModule.useCallback(function(ItemPositions) --[[ Line: 74 ]]
			-- upvalues: WidgetId (copy), SeenImpressionsStore (upval), Category (upval), Content (copy), BuildItemImpressionInfoFunction (copy), CryoModule (upval), WidgetAnalyticsInfo (copy), WidgetRow (copy), ItemsPerRow (copy), UiTreatmentType (copy), ReportItemImpressionFunction (copy)
			for _, itemPosition in ItemPositions do
				local Text = WidgetId .. "_" .. itemPosition
				
				if not SeenImpressionsStore.hasSeen(Category.WidgetItems, Text) then
					local ContentEntry = Content[itemPosition] or {}
					ReportItemImpressionFunction(if BuildItemImpressionInfoFunction then BuildItemImpressionInfoFunction(ContentEntry, itemPosition) else CryoModule.Dictionary.join(WidgetAnalyticsInfo, {
						widgetPosition = WidgetRow,
						widgetId = WidgetId,
						itemPosition = itemPosition,
						itemId = if ContentEntry.id == nil then nil else tostring(ContentEntry.id),
						itemType = ContentEntry.type,
						widgetAbsPosition = (WidgetRow - 1) * ItemsPerRow,
						uiTreatmentType = UiTreatmentType
					}))
					SeenImpressionsStore.markSeen(Category.WidgetItems, Text)
				end
			end
		end, {
			WidgetId, Content, WidgetRow, ItemsPerRow, WidgetAnalyticsInfo,
			UiTreatmentType, ReportItemImpressionFunction, BuildItemImpressionInfoFunction
		})
	}
end