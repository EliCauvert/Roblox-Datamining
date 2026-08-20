local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local _ = require(parent.AppCommonLib)
local _ = require(parent.AvatarExperienceCommon)
local seenImpressionsStore = require(parent.AvatarExperienceAnalytics).Store.SeenImpressionsStore
local category = seenImpressionsStore.Category
local useOnRequestImpressionsSignalModule = require(avatarExperienceCatalog.Components.Hooks.useOnRequestImpressionsSignal)

return function(p0) --[[ line: 61 | named "useWidgetItemImpressions" ]]
	-- upvalues: useOnRequestImpressionsSignalModule (ref), reactModule (ref), seenImpressionsStore (ref), category (ref), cryoModule (ref)
	local var4 = useOnRequestImpressionsSignalModule()
	local widgetId = p0.widgetId
	local content = p0.content
	local widgetRow = p0.widgetRow
	local itemsPerRow = p0.itemsPerRow
	local widgetAnalyticsInfo = p0.widgetAnalyticsInfo
	local uiTreatmentType = p0.uiTreatmentType
	local reportItemImpression = p0.reportItemImpression
	local buildItemImpressionInfo = p0.buildItemImpressionInfo
	
	return {
		onRequestImpressionsSignal = var4,
		onImpressionsDetected = reactModule.useCallback(function(p1) --[[ line: 74 ]]
			-- upvalues: widgetId (ref), seenImpressionsStore (copy), category (copy), content (ref), buildItemImpressionInfo (ref), cryoModule (copy), widgetAnalyticsInfo (ref), widgetRow (ref), itemsPerRow (ref), uiTreatmentType (ref), reportItemImpression (ref)
			for i, v in p1 do
				local text = widgetId .. "_" .. v
				
				if not seenImpressionsStore.hasSeen(category.WidgetItems, text) then
					local var6 = content[v] or {}
					reportItemImpression(if buildItemImpressionInfo then buildItemImpressionInfo(var6, v) else cryoModule.Dictionary.join(widgetAnalyticsInfo, {
						widgetPosition = widgetRow,
						widgetId = widgetId,
						itemPosition = v,
						itemId = if var6.id ~= nil then nil else tostring(var6.id),
						itemType = var6.type,
						widgetAbsPosition = (widgetRow - 1) * itemsPerRow,
						uiTreatmentType = uiTreatmentType
					}))
					seenImpressionsStore.markSeen(category.WidgetItems, text)
				end
			end
		end, {
			widgetId, content, widgetRow, itemsPerRow, widgetAnalyticsInfo,
			uiTreatmentType, reportItemImpression, buildItemImpressionInfo
		})
	}
end