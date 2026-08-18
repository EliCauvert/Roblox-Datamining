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

return function(p0) --[[ line: 60 | named "useOnCatalogSortImpressionsDetectedCallback" ]]
	-- upvalues: useCatalogPageMonolithDependenciesModule (ref), useStore (ref), reactModule (ref), selectHydratedWidgetDataModule (ref), itemTypeEnum (ref), fFlagAXDeferLookImpressionsForHydration (ref), sendAXCounterV2 (ref), constantsModule (ref), cryoModule (ref), impressionEnums (ref)
	local catalogAnalytics = useCatalogPageMonolithDependenciesModule().catalogAnalytics
	local widgetInfo = p0.widgetInfo
	local widgetAnalyticsInfo = p0.widgetAnalyticsInfo
	local widgetRow = p0.widgetRow
	local itemsPerRow = p0.itemsPerRow
	local uiTreatmentType = p0.uiTreatmentType
	local var7 = useStore()
	local var8 = if widgetInfo then widgetInfo.id else ""
	local var9 = if widgetInfo then widgetInfo.content else nil
	
	return reactModule.useCallback(function(p1) --[[ line: 79 ]]
		-- upvalues: selectHydratedWidgetDataModule (copy), var7 (ref), itemTypeEnum (copy), var9 (ref), fFlagAXDeferLookImpressionsForHydration (copy), sendAXCounterV2 (copy), constantsModule (copy), widgetRow (ref), var8 (ref), itemsPerRow (ref), uiTreatmentType (ref), catalogAnalytics (ref), cryoModule (copy), widgetAnalyticsInfo (ref), impressionEnums (copy)
		local var10 = nil
		
		local function _() --[[ line: 85 | named "getHydratedLooks" ]]
			-- upvalues: var10 (write), selectHydratedWidgetDataModule (copy), var7 (copy), itemTypeEnum (copy)
			if var10 == nil then
				local var17 = selectHydratedWidgetDataModule(var7:getState())
				var10 = if var17 then var17[itemTypeEnum.Look] else false
				
				return var10
			end
			return var10
		end
		
		for i, v in p1 do
			local var15, var16
			local var11 = if var9 then var9[v] else {}
			local var12 = if var11.id ~= nil then nil else tostring(var11.id)
			local var13 = var11.type == itemTypeEnum.Look
			local var14 = nil
			
			if not var13 then
				if fFlagAXDeferLookImpressionsForHydration and var13 and var14 == nil then
					sendAXCounterV2(constantsModule.COUNTERS.LookImpressionMissingLookType)
				end
				catalogAnalytics.widgetInteractionV2(cryoModule.Dictionary.join(widgetAnalyticsInfo, {
					widgetPosition = widgetRow,
					widgetId = var8,
					itemPosition = v,
					itemId = var12,
					itemType = var11.type,
					lookType = var14,
					widgetAbsPosition = (widgetRow - 1) * itemsPerRow,
					uiTreatmentType = uiTreatmentType
				}), impressionEnums.ActionType.ITEM_IMPRESSION)
			end
			if var10 == nil then
				var16 = selectHydratedWidgetDataModule(var7:getState())
				var10 = if var16 then var16[itemTypeEnum.Look] else false
				var15 = var10
			else
				var15 = var10
			end
			var16 = var15 and var15[var12]
			var14 = if var16 and var16.lookType then var16.lookType else nil
		end
	end, {
		var8, var9, widgetAnalyticsInfo, widgetRow, itemsPerRow, uiTreatmentType, var7,
		catalogAnalytics
	})
end