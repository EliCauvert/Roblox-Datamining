local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AvatarEditorPropertyChangedModule = require(Modules.AvatarExperience.AvatarEditor.Analytics.avatarEditorPropertyChanged)
local ClickNavigationTabModule = require(Modules.AvatarExperience.AvatarEditor.Analytics.clickNavigationTab)
local ClickShopForMoreModule = require(Modules.AvatarExperience.AvatarEditor.Analytics.clickShopForMore)
local AvatarEditorOpenedFromLandingPageModule = require(Modules.AvatarExperience.AvatarEditor.Analytics.avatarEditorOpenedFromLandingPage)
local CatalogToAvatarBackButtonModule = require(Modules.AvatarExperience.AvatarEditor.Analytics.catalogToAvatarBackButton)
local CatalogToAvatarButtonModule = require(Modules.AvatarExperience.AvatarEditor.Analytics.catalogToAvatarButton)
local AnalyticsService = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).AnalyticsService
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local ImpressionEnums = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).Enums.ImpressionEnums
local GetAvatarEditorCategoriesModule = require(Modules.AvatarExperience.AvatarEditor.GetAvatarEditorCategories)
local AvatarExperienceAnalyticsModule = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics)
local Constants = AvatarExperienceAnalyticsModule.Constants
local FFlagAXImproveSlotBasedEditorPerformanceModule = require(Modules.AvatarExperience.Flags.FFlagAXImproveSlotBasedEditorPerformance)
local ReportAvatarEventCounterV1Function = AvatarExperienceAnalyticsModule.reportAvatarEventCounterV1
local FFlagAXEditorSubcategoryFilters = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXEditorSubcategoryFilters
local v1 = nil

local function getAvatarEditorAnalyticsInner(AnalyticsService)
	-- upvalues: AvatarEditorPropertyChangedModule (copy), ConstantsModule (copy), ReportAvatarEventCounterV1Function (copy), Constants (copy), GetAvatarEditorCategoriesModule (copy), FFlagAXEditorSubcategoryFilters (copy), ClickNavigationTabModule (copy), ClickShopForMoreModule (copy), CatalogToAvatarBackButtonModule (copy), CatalogToAvatarButtonModule (copy), AvatarEditorOpenedFromLandingPageModule (copy), ImpressionEnums (copy), FFlagAXImproveSlotBasedEditorPerformanceModule (copy), v1 (ref)
	local function _(p1, p2, p3, p4, p5, p6)
		-- upvalues: AvatarEditorPropertyChangedModule (upval), AnalyticsService (copy)
		AvatarEditorPropertyChangedModule(AnalyticsService.EventStream, p1, p5, p2, p3, p4, p6)
	end
	
	local config = {
		equipAsset = function(p1, p2, p3, Text, _, p4)
			-- upvalues: ConstantsModule (upval), AvatarEditorPropertyChangedModule (upval), AnalyticsService (copy), ReportAvatarEventCounterV1Function (upval), Constants (upval)
			AvatarEditorPropertyChangedModule(AnalyticsService.EventStream, "EquipAsset", ConstantsModule.AssetTypeIdStringToName[Text] or "UnknownAssetTypeId: " .. Text, p1, p2, p3, p4)
			ReportAvatarEventCounterV1Function(Constants.AVATAR_EVENT_COUNTER_NAME.AXEquipAsset)
		end,
		unequipAsset = function(p1, p2, p3, Text, _, p4)
			-- upvalues: ConstantsModule (upval), AvatarEditorPropertyChangedModule (upval), AnalyticsService (copy), ReportAvatarEventCounterV1Function (upval), Constants (upval)
			AvatarEditorPropertyChangedModule(AnalyticsService.EventStream, "UnequipAsset", ConstantsModule.AssetTypeIdStringToName[Text] or "UnknownAssetTypeId: " .. Text, p1, p2, p3, p4)
			ReportAvatarEventCounterV1Function(Constants.AVATAR_EVENT_COUNTER_NAME.AXUnequipAsset)
		end,
		clickNavigationTab = function(p1, p2, p3)
			-- upvalues: GetAvatarEditorCategoriesModule (upval), FFlagAXEditorSubcategoryFilters (upval), ClickNavigationTabModule (upval), AnalyticsService (copy)
			local AvatarEditorCategoriesModuleEntry = GetAvatarEditorCategoriesModule()[p1]
			
			if AvatarEditorCategoriesModuleEntry then
				local Subcategory = AvatarEditorCategoriesModuleEntry.Subcategories and AvatarEditorCategoriesModuleEntry.Subcategories[p2]
				local SubcategoryFilter = if FFlagAXEditorSubcategoryFilters and p3 and Subcategory and Subcategory.SubcategoryFilters then Subcategory.SubcategoryFilters[p3] else nil
				local Name = if FFlagAXEditorSubcategoryFilters and SubcategoryFilter then SubcategoryFilter.Name else ""
				ClickNavigationTabModule(AnalyticsService.EventStream, "clickNavigationTab", AvatarEditorCategoriesModuleEntry and AvatarEditorCategoriesModuleEntry.Name or "", Subcategory and Subcategory.Name or "", if FFlagAXEditorSubcategoryFilters then Name else nil)
			end
		end,
		setAvatarHeadSize = function(p1, p2, p3)
			-- upvalues: AvatarEditorPropertyChangedModule (upval), AnalyticsService (copy)
			AvatarEditorPropertyChangedModule(AnalyticsService.EventStream, "SetHeadSize", "HeadSize", p1, p2, p3, nil)
		end,
		setAvatarHeight = function(p1, p2, p3)
			-- upvalues: AvatarEditorPropertyChangedModule (upval), AnalyticsService (copy)
			AvatarEditorPropertyChangedModule(AnalyticsService.EventStream, "SetHeight", "Height", p1, p2, p3, nil)
		end,
		setAvatarWidth = function(p1, p2, p3)
			-- upvalues: AvatarEditorPropertyChangedModule (upval), AnalyticsService (copy)
			AvatarEditorPropertyChangedModule(AnalyticsService.EventStream, "SetWidth", "Width", p1, p2, p3, nil)
		end,
		setAvatarBodyType = function(p1, p2, p3)
			-- upvalues: AvatarEditorPropertyChangedModule (upval), AnalyticsService (copy)
			AvatarEditorPropertyChangedModule(AnalyticsService.EventStream, "SetBodyType", "BodyType", p1, p2, p3, nil)
		end,
		setAvatarProportion = function(p1, p2, p3)
			-- upvalues: AvatarEditorPropertyChangedModule (upval), AnalyticsService (copy)
			AvatarEditorPropertyChangedModule(AnalyticsService.EventStream, "SetProportion", "Proportion", p1, p2, p3, nil)
		end,
		toggleAvatarType = function(p1, p2, p3)
			-- upvalues: AvatarEditorPropertyChangedModule (upval), AnalyticsService (copy)
			AvatarEditorPropertyChangedModule(AnalyticsService.EventStream, "SetAvatarType", "AvatarType", p1, p2, p3, nil)
		end,
		setBodyColors = function(List, p1, p2)
			-- upvalues: AvatarEditorPropertyChangedModule (upval), AnalyticsService (copy)
			local Entry = List[next(List)] or "empty"
			
			for _, value in List do
				Entry = value == Entry and Entry or "mixed"
			end
			AvatarEditorPropertyChangedModule(AnalyticsService.EventStream, "SetBodyColors", "BodyColors", Entry, p1, p2, nil)
		end,
		setBodyColor3s = function(List, p3, p4)
			-- upvalues: AvatarEditorPropertyChangedModule (upval), AnalyticsService (copy)
			local Hex = List[next(List)]:ToHex() or "empty"
			
			for _, value in List do
				Hex = value:ToHex() == Hex and Hex or "mixed"
			end
			AvatarEditorPropertyChangedModule(AnalyticsService.EventStream, "SetBodyColor3s", "BodyColor3s", Hex, p3, p4, nil)
		end,
		clickShopForMore = function(p5, p6)
			-- upvalues: GetAvatarEditorCategoriesModule (upval), ClickShopForMoreModule (upval), AnalyticsService (copy)
			local AvatarEditorCategoriesModuleEntry = GetAvatarEditorCategoriesModule()[p5]
			
			if AvatarEditorCategoriesModuleEntry then
				local Subcategory = AvatarEditorCategoriesModuleEntry.Subcategories and AvatarEditorCategoriesModuleEntry.Subcategories[p6]
				ClickShopForMoreModule(AnalyticsService.EventStream, "ClickShopForMore", AvatarEditorCategoriesModuleEntry and AvatarEditorCategoriesModuleEntry.Name or "", Subcategory and Subcategory.Name or "")
			end
		end,
		catalogToAvatarBackButton = function()
			-- upvalues: CatalogToAvatarBackButtonModule (upval), AnalyticsService (copy)
			CatalogToAvatarBackButtonModule(AnalyticsService.EventStream, "ClickCatalogToAvatarBackButton")
		end,
		catalogToAvatarButton = function()
			-- upvalues: CatalogToAvatarButtonModule (upval), AnalyticsService (copy)
			CatalogToAvatarButtonModule(AnalyticsService.EventStream, "ClickCatalogToAvatarButton")
		end,
		avatarEditorOpenedFromLandingPage = function()
			-- upvalues: AvatarEditorOpenedFromLandingPageModule (upval), AnalyticsService (copy)
			AvatarEditorOpenedFromLandingPageModule(AnalyticsService.EventStream, "AvatarEditorLandingPageButtonClicked")
		end,
		outfitCreated = function(_)
			-- upvalues: ReportAvatarEventCounterV1Function (upval), Constants (upval)
			ReportAvatarEventCounterV1Function(Constants.AVATAR_EVENT_COUNTER_NAME.AXCreateCostume)
		end,
		outfitClicked = function(ItemId, _, p5)
			-- upvalues: ImpressionEnums (upval), AnalyticsService (copy)
			AnalyticsService.EventStream:sendTelemetryEvent("clickToWearOutfit", "marketplaceOrganicFELog", {
				surface = ImpressionEnums.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY,
				actionType = ImpressionEnums.ActionType.ITEM_CLICK,
				contentType = ImpressionEnums.MarketplaceItemType.CHARACTER,
				characterType = if p5 then ImpressionEnums.CharacterType.CREATION else ImpressionEnums.CharacterType.PURCHASED,
				itemId = ItemId
			})
		end,
		colorPickerChanged = function(_, _, _)
			-- upvalues: ReportAvatarEventCounterV1Function (upval), Constants (upval)
			ReportAvatarEventCounterV1Function(Constants.AVATAR_EVENT_COUNTER_NAME.AXColorPickerChanged)
		end
	}
	
	if FFlagAXImproveSlotBasedEditorPerformanceModule then
		v1 = config
	end
	return config
end

return {
	mock = function(p3)
		-- upvalues: getAvatarEditorAnalyticsInner (copy)
		return (getAvatarEditorAnalyticsInner(p3))
	end,
	get = function(_)
		-- upvalues: FFlagAXImproveSlotBasedEditorPerformanceModule (copy), v1 (ref), AnalyticsService (copy), getAvatarEditorAnalyticsInner (copy)
		return if FFlagAXImproveSlotBasedEditorPerformanceModule and v1 then v1 else getAvatarEditorAnalyticsInner(AnalyticsService)
	end
}