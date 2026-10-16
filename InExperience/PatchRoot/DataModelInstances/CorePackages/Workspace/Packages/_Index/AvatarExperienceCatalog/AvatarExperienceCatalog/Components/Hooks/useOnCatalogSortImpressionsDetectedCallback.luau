local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.AvatarExperienceCommon)
local ItemTypeEnum = require(Parent.AvatarExperienceModel).Enums.ItemTypeEnum
local AvatarExperienceAnalyticsModule = require(Parent.AvatarExperienceAnalytics)
local ImpressionEnums = AvatarExperienceAnalyticsModule.Enums.ImpressionEnums
local SendAXCounterV2Function = AvatarExperienceAnalyticsModule.sendAXCounterV2
local FFlagAXDeferLookImpressionsForHydration = require(Parent.AvatarExperienceFlags).FFlagAXDeferLookImpressionsForHydration
local UseStoreFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useStore
local _ = require(AvatarExperienceCatalog.Components.ResultsList.WidgetListInfoViewModel)
local SelectHydratedWidgetDataModule = require(AvatarExperienceCatalog.State.Selectors.selectHydratedWidgetData)
local ConstantsModule = require(AvatarExperienceCatalog.Constants)
local UseCatalogPageMonolithDependenciesModule = require(AvatarExperienceCatalog.Providers.useCatalogPageMonolithDependencies)

return function(p1) --[[ Line: 61 | Named "useOnCatalogSortImpressionsDetectedCallback" ]]
	-- upvalues: UseCatalogPageMonolithDependenciesModule (copy), UseStoreFunction (copy), ReactModule (copy), SelectHydratedWidgetDataModule (copy), ItemTypeEnum (copy), FFlagAXDeferLookImpressionsForHydration (copy), SendAXCounterV2Function (copy), ConstantsModule (copy), CryoModule (copy), ImpressionEnums (copy)
	local CatalogAnalytics = UseCatalogPageMonolithDependenciesModule().catalogAnalytics
	local WidgetInfo = p1.widgetInfo
	local WidgetAnalyticsInfo = p1.widgetAnalyticsInfo
	local WidgetRow = p1.widgetRow
	local ItemsPerRow = p1.itemsPerRow
	local UiTreatmentType = p1.uiTreatmentType
	local UseStoreResult = UseStoreFunction()
	local Id = WidgetInfo and WidgetInfo.id or ""
	local Content = if WidgetInfo then WidgetInfo.content else nil
	
	return ReactModule.useCallback(function(ItemPositions) --[[ Line: 80 ]]
		-- upvalues: SelectHydratedWidgetDataModule (upval), UseStoreResult (copy), ItemTypeEnum (upval), Content (copy), FFlagAXDeferLookImpressionsForHydration (upval), SendAXCounterV2Function (upval), ConstantsModule (upval), WidgetRow (copy), Id (copy), ItemsPerRow (copy), UiTreatmentType (copy), CatalogAnalytics (copy), CryoModule (upval), WidgetAnalyticsInfo (copy), ImpressionEnums (upval)
		local v1 = nil
		
		local function _() --[[ Line: 86 | Named "getHydratedLooks" ]]
			-- upvalues: v1 (ref), SelectHydratedWidgetDataModule (upval), UseStoreResult (upval), ItemTypeEnum (upval)
			if v1 == nil then
				local SelectHydratedWidgetDataModuleResult = SelectHydratedWidgetDataModule(UseStoreResult:getState())
				v1 = SelectHydratedWidgetDataModuleResult and SelectHydratedWidgetDataModuleResult[ItemTypeEnum.Look] or false
				
				return v1
			else
				return v1
			end
		end
		
		for _, itemPosition in ItemPositions do
			local ContentEntry = Content and Content[itemPosition] or {}
			local Text = if ContentEntry.id == nil then nil else tostring(ContentEntry.id)
			local IsTypeMatch = ContentEntry.type == ItemTypeEnum.Look
			local LookType = nil
			
			if IsTypeMatch then
				local v2 = nil
				if v1 == nil then
					local SelectHydratedWidgetDataModuleResult = SelectHydratedWidgetDataModule(UseStoreResult:getState())
					v1 = SelectHydratedWidgetDataModuleResult and SelectHydratedWidgetDataModuleResult[ItemTypeEnum.Look] or false
					v2 = v1
				else
					v2 = v1
				end
				local v3 = v2 and v2[Text]
				LookType = if v3 and v3.lookType then v3.lookType else nil
			end
			if FFlagAXDeferLookImpressionsForHydration and IsTypeMatch and LookType == nil then
				SendAXCounterV2Function(ConstantsModule.COUNTERS.LookImpressionMissingLookType)
			end
			CatalogAnalytics.widgetInteractionV2(CryoModule.Dictionary.join(WidgetAnalyticsInfo, {
				widgetPosition = WidgetRow,
				widgetId = Id,
				itemPosition = itemPosition,
				itemId = Text,
				itemType = ContentEntry.type,
				lookType = LookType,
				widgetAbsPosition = (WidgetRow - 1) * ItemsPerRow,
				uiTreatmentType = UiTreatmentType
			}), ImpressionEnums.ActionType.ITEM_IMPRESSION)
		end
	end, {
		Id, Content, WidgetAnalyticsInfo, WidgetRow, ItemsPerRow, UiTreatmentType,
		UseStoreResult, CatalogAnalytics
	})
end