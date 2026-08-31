local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local itemTypeEnum = require(parent.AvatarExperienceCommon).Enums.ItemTypeEnum
local avatarExperienceAnalyticsModule = require(parent.AvatarExperienceAnalytics)
local impressionEnums = avatarExperienceAnalyticsModule.Enums.ImpressionEnums
local sendAXCounterV2 = avatarExperienceAnalyticsModule.sendAXCounterV2
local fFlagAXDeferLookImpressionsForHydration = require(parent.AvatarExperienceFlags).FFlagAXDeferLookImpressionsForHydration
local useStore = require(parent.RoactUtils).Hooks.RoactRodux.useStore
local _ = require(avatarExperienceCatalog.Components.ResultsList.WidgetListInfoViewModel)
local selectHydratedWidgetDataModule = require(avatarExperienceCatalog.State.Selectors.selectHydratedWidgetData)
local constantsModule = require(avatarExperienceCatalog.Constants)
local useCatalogPageMonolithDependenciesModule = require(avatarExperienceCatalog.Providers.useCatalogPageMonolithDependencies)

return function(p1)
	-- upvalues: useCatalogPageMonolithDependenciesModule (ref), useStore (ref), reactModule (ref), selectHydratedWidgetDataModule (ref), itemTypeEnum (ref), fFlagAXDeferLookImpressionsForHydration (ref), sendAXCounterV2 (ref), constantsModule (ref), cryoModule (ref), impressionEnums (ref)
	local catalogAnalytics = useCatalogPageMonolithDependenciesModule().catalogAnalytics
	local widgetInfo = p1.widgetInfo
	local widgetAnalyticsInfo = p1.widgetAnalyticsInfo
	local widgetRow = p1.widgetRow
	local itemsPerRow = p1.itemsPerRow
	local uiTreatmentType = p1.uiTreatmentType
	local var1 = useStore()
	local var2 = if widgetInfo then widgetInfo.id else ""
	local var3 = if widgetInfo then widgetInfo.content else nil
	
	return reactModule.useCallback(function(p2)
		-- upvalues: selectHydratedWidgetDataModule (copy), var1 (ref), itemTypeEnum (copy), var3 (ref), fFlagAXDeferLookImpressionsForHydration (copy), sendAXCounterV2 (copy), constantsModule (copy), widgetRow (ref), var2 (ref), itemsPerRow (ref), uiTreatmentType (ref), catalogAnalytics (ref), cryoModule (copy), widgetAnalyticsInfo (ref), impressionEnums (copy)
		local var4 = nil
		
		local function _()
			-- upvalues: var4 (write), selectHydratedWidgetDataModule (copy), var1 (copy), itemTypeEnum (copy)
			if var4 == nil then
				local var5 = selectHydratedWidgetDataModule(var1:getState())
				var4 = if var5 then var5[itemTypeEnum.Look] else false
				
				return var4
			end
			return var4
		end
		
		for i, v in p2 do
			local var5, var6
			local var7 = if var3 then var3[v] else {}
			local var8 = if var7.id ~= nil then nil else tostring(var7.id)
			local var9 = var7.type == itemTypeEnum.Look
			local var10 = nil
			
			if not var9 then
				if fFlagAXDeferLookImpressionsForHydration and var9 and var10 == nil then
					sendAXCounterV2(constantsModule.COUNTERS.LookImpressionMissingLookType)
				end
				catalogAnalytics.widgetInteractionV2(cryoModule.Dictionary.join(widgetAnalyticsInfo, {
					widgetPosition = widgetRow,
					widgetId = var2,
					itemPosition = v,
					itemId = var8,
					itemType = var7.type,
					lookType = var10,
					widgetAbsPosition = (widgetRow - 1) * itemsPerRow,
					uiTreatmentType = uiTreatmentType
				}), impressionEnums.ActionType.ITEM_IMPRESSION)
			end
			if var4 == nil then
				var6 = selectHydratedWidgetDataModule(var1:getState())
				var4 = if var6 then var6[itemTypeEnum.Look] else false
				var5 = var4
			else
				var5 = var4
			end
			var6 = var5 and var5[var8]
			var10 = if var6 and var6.lookType then var6.lookType else nil
		end
	end, {
		var2, var3, widgetAnalyticsInfo, widgetRow, itemsPerRow, uiTreatmentType, var1,
		catalogAnalytics
	})
end