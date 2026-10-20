local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalizationService = game:GetService("LocalizationService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local RetrievalStatus = require(CorePackages.Workspace.Packages.Http).Enum.RetrievalStatus
local GetSafeAreaSizeFunction = require(CorePackages.Workspace.Packages.InputUi).getSafeAreaSize
local CryoModule = require(CorePackages.Packages.Cryo)
local DashModule = require(CorePackages.Packages.Dash)
local TutilsModule = require(CorePackages.Packages.tutils)
local TModule = require(CorePackages.Packages.t)
local TextService = game:GetService("TextService")
local Localization = require(CorePackages.Workspace.Packages.RobloxAppLocales).Localization
local ItemTileEnums = require(CorePackages.Packages.UIBlox).Tile.ItemTileEnums
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local GetAvatarEditorCategoriesModule = require(Modules.AvatarExperience.AvatarEditor.GetAvatarEditorCategories)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local ConstantsModule1 = require(Modules.AvatarExperience.AvatarEditor.Constants)
local FFlagAXCustomizeMakeupSupport = AvatarExperienceFlagsModule.FFlagAXCustomizeMakeupSupport
local GetCatalogCategoriesFromStoreModule = require(Modules.AvatarExperience.Catalog.GetCatalogCategoriesFromStore)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local ConstantsModule2 = require(Modules.LuaApp.Constants)
local MemoizeFunction = require(CorePackages.Workspace.Packages.AppCommonLib).memoize
local AvatarScreenProperties = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties
local DeviceOrientationMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode
local GetAvatarEditorStructureModule = require(Modules.AvatarExperience.AvatarEditor.GetAvatarEditorStructure)
local SortTypeModule = require(Modules.AvatarExperience.Common.Enum.SortType)
local SalesTypeFilterModule = require(Modules.AvatarExperience.Common.Enum.SalesTypeFilter)
local UnavailableItemFilterModule = require(Modules.AvatarExperience.Common.Enum.UnavailableItemFilter)
local _ = require(Modules.AvatarExperience.Common.Reducers.OutfitTryOn)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local FFlagUseNavigationSelectors = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors
local FFlagSignalsNavP3gAvatarExperience = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3gAvatarExperience
local GetLegacyNavigationStoreFunction = require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore
local CreateComputedFunction = require(CorePackages.Packages.Signals).createComputed
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local ConstantsModule3 = require(Modules.AvatarExperience.AccessoryAdjustment.Constants)
local UniversalAppCameraIXPTestModule = require(Modules.AvatarExperience.Flags.UniversalAppCameraIXPTest)
local FilterUtilsModule = require(Modules.AvatarExperience.Catalog.Components.Filters.FilterUtils)
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local _ = require(Modules.AvatarExperience.Catalog.SearchTypes)
local _ = require(Modules.AvatarExperience.Catalog.Reducers.SortAndFilters)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local InventoryItemAvailability = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor).Enums.InventoryItemAvailability
local GetEmotesCategoryModule = require(Modules.AvatarExperience.Common.getEmotesCategory)
local _ = require(Modules.AvatarExperience.Common.Types)
local FullView = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Enums.FullView
local SwitchTab = require(CorePackages.Workspace.Packages.RobloxAppEnums).SwitchTab
local IsTenFootInterface = game:GetService("GuiService"):IsTenFootInterface()
local AXTallBundleWidgetContentType: string = game:DefineFastString("AXTallBundleWidgetContentType", "AdvancedBodiesWidget")
local FFlagAXTallTilesForAdvancedBodiesWidget = AvatarExperienceFlagsModule.FFlagAXTallTilesForAdvancedBodiesWidget
local FFlagAXSlotsInventoryLoadableGridView = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotsInventoryLoadableGridView
local FFlagAXRootSlotBasedEditorFlag = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag
local AXFixMinMaxPriceFilterError = game:DefineFastFlag("AXFixMinMaxPriceFilterError", false)
local GetFFlagAXExtractEmotesCategoryModule = require(Modules.AvatarExperience.Flags.GetFFlagAXExtractEmotesCategory)
local GetFFlagAXEnableRecommendationTypeAllInCustomizeModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableRecommendationTypeAllInCustomize)
local FFlagAXMutedErrorLoggingForCategorySelection = AvatarExperienceFlagsModule.FFlagAXMutedErrorLoggingForCategorySelection
local FFlagAXRemoveTimedOptionsSalesTypeEnumCheck = AvatarExperienceFlagsModule.FFlagAXRemoveTimedOptionsSalesTypeEnumCheck
local FFlagAXEditorSubcategoryFilters = AvatarExperienceFlagsModule.FFlagAXEditorSubcategoryFilters
local FFlagAvatarJointUpgradeInUA = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAvatarJointUpgradeInUA
local FFlagAXFixCatalogSearchZoom = AvatarExperienceFlagsModule.FFlagAXFixCatalogSearchZoom
local FFlagAXAddHDCatalogTab = AvatarExperienceFlagsModule.FFlagAXAddHDCatalogTab
local FFlagAXAvatarTabLooksYouMayAlsoLike = AvatarExperienceFlagsModule.FFlagAXAvatarTabLooksYouMayAlsoLike
local FFlagEnableLeftNavOnConsole = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole
local GetCatalogCategoriesStoreModule = require(Modules.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore)
local MapResult = {}
local MapResult1 = {}
local T = if FFlagAXTallTilesForAdvancedBodiesWidget then {} else nil
MapResult = CryoModule.List.map(string.split(game:DefineFastString("AXLookWidgetContentType", "SearchToLooksWidget,SearchToCommunityLooksWidget,SearchToAvatarLooksWidget,PersonalizedAvatarLooksWidget,SortsPersonalizedAvatarLooksWidget,MySharedAvatarsWidget"), ",") or {}, function(p1)
	return p1:match("^%s*(.*)%s*$")
end)
MapResult1 = CryoModule.List.map(string.split(game:DefineFastString("AXAvatarWidgetContentType", "SearchToAvatarLooksWidget,PersonalizedAvatarLooksWidget,SortsPersonalizedAvatarLooksWidget,MySharedAvatarsWidget"), ",") or {}, function(p1)
	return p1:match("^%s*(.*)%s*$")
end)

if FFlagAXTallTilesForAdvancedBodiesWidget then
	T = CryoModule.List.map(string.split(AXTallBundleWidgetContentType, ",") or {}, function(p1)
		return p1:match("^%s*(.*)%s*$")
	end)
end
local config = {
	PageType = ConstantsModule.PageType.Other,
	RecommendationsType = ConstantsModule1.RecommendationsType.None
}
local config1 = {
	CanAnimateCameraBasedMood = true,
	PageType = ConstantsModule.PageType.Other,
	RecommendationsType = ConstantsModule1.RecommendationsType.None
}
local t = {}
local t1 = {}
local MemoizeResult = MemoizeFunction(function(p1, p2, EmoteSlot)
	-- upvalues: CryoModule (copy), ConstantsModule (copy)
	local v1 = p1[p2]
	
	if v1.Subcategories and EmoteSlot then
		local Subcategory = v1.Subcategories[EmoteSlot]
		
		if Subcategory then
			local JoinResult = CryoModule.Dictionary.join(v1, Subcategory)
			JoinResult.AssetTypeIdStrings = Subcategory.AssetTypeIdStrings
			JoinResult.BundleTypes = Subcategory.BundleTypes
			JoinResult.CategoryFilter = Subcategory.CategoryFilter
			JoinResult.Subcategories = Subcategory.Subcategories
			
			return JoinResult
		end
	end
	return if v1.PageType == ConstantsModule.PageType.Emotes then CryoModule.Dictionary.join(v1, { EmoteSlot = EmoteSlot }) else v1
end)
local MemoizeResult1 = MemoizeFunction(function(p1, p2, EmoteSlot)
	-- upvalues: CatalogUtilsModule (copy), FFlagAXMutedErrorLoggingForCategorySelection (copy), MutedErrorModule (copy), CryoModule (copy), ConstantsModule (copy)
	local ExtractCategoryByIdResult = CatalogUtilsModule.extractCategoryById(p2, p1)
	
	if FFlagAXMutedErrorLoggingForCategorySelection and ExtractCategoryByIdResult == nil then
		MutedErrorModule("[buildCategoryInfoById] Category not found for categoryId: " .. tostring(p2) .. " and subcategoryId: " .. tostring(EmoteSlot))
	end
	if ExtractCategoryByIdResult.Subcategories and EmoteSlot then
		local ExtractSubcategoryByIdResult = CatalogUtilsModule.extractSubcategoryById(EmoteSlot, ExtractCategoryByIdResult.Subcategories)
		
		if ExtractSubcategoryByIdResult then
			local JoinResult = CryoModule.Dictionary.join(ExtractCategoryByIdResult, ExtractSubcategoryByIdResult)
			JoinResult.AssetTypeIdStrings = ExtractSubcategoryByIdResult.AssetTypeIdStrings
			JoinResult.BundleTypes = ExtractSubcategoryByIdResult.BundleTypes
			JoinResult.CategoryFilter = ExtractSubcategoryByIdResult.CategoryFilter
			JoinResult.Subcategories = ExtractSubcategoryByIdResult.Subcategories
			JoinResult.SubcategoriesMap = ExtractSubcategoryByIdResult.SubcategoriesMap
			
			return JoinResult
		end
	end
	return if ExtractCategoryByIdResult.PageType == ConstantsModule.PageType.Emotes then CryoModule.Dictionary.join(ExtractCategoryByIdResult, { EmoteSlot = EmoteSlot }) else ExtractCategoryByIdResult
end)

local function _(p1, p2, p3): string
	return string.format("%s.%s.%s", tostring(p1), tostring(p2), (tostring(p3)))
end

local _ = function(p1, p2, p3): string
	return string.format("%s.%s.%s", tostring(p1), tostring(p2), (tostring(p3)))
end

local Utils = {
	getCategoryInfo = MemoizeFunction(function(p1, p2, p3)
		-- upvalues: t (copy), MemoizeResult (copy)
		local Formatted = string.format("%s.%s.%s", tostring(p1), tostring(p2), (tostring(p3)))
		local Entry = t[Formatted]
		
		if Entry == nil then
			Entry = MemoizeResult(p1, p2, p3)
			t[Formatted] = Entry
		end
		return Entry
	end),
	getCategoryInfoById = MemoizeFunction(function(p1, p2, p3)
		-- upvalues: t1 (copy), MemoizeResult1 (copy)
		local Formatted = string.format("%s.%s.%s", tostring(p1), tostring(p2), (tostring(p3)))
		local Entry = t1[Formatted]
		
		if Entry == nil then
			Entry = MemoizeResult1(p1, p2, p3)
			t1[Formatted] = Entry
		end
		return Entry
	end)
}
Utils.getCatalogCategoryInfo = MemoizeFunction(function(p1, p2)
	-- upvalues: GetCatalogCategoriesFromStoreModule (copy), Utils (copy)
	return Utils.getCategoryInfo(GetCatalogCategoriesFromStoreModule(), p1, p2)
end)
Utils.getCatalogCategoryInfoById = MemoizeFunction(function(p1, p2)
	-- upvalues: GetCatalogCategoriesFromStoreModule (copy), Utils (copy)
	return Utils.getCategoryInfoById(GetCatalogCategoriesFromStoreModule(), p1, p2)
end)
Utils.getAvatarEditorCategoryInfo = MemoizeFunction(function(p1, p2)
	-- upvalues: GetAvatarEditorCategoriesModule (copy), Utils (copy)
	return (Utils.getCategoryInfo(GetAvatarEditorCategoriesModule(), p1, p2))
end)

local _ = function(p1: number): number
	return if p1 < 100 then 30 elseif p1 < 148 then 36 else 42
end

local MemoizeResult2 = MemoizeFunction(function(p1, _, p2)
	-- upvalues: ConstantsModule (copy)
	local CreatorNameItemTileTitleMaxLines = if p2 then ConstantsModule.CreatorNameItemTileTitleMaxLines else ConstantsModule.ItemTileTitleMaxLines
	local CreatorNameItemTilePadding = if p2 then ConstantsModule.CreatorNameItemTilePadding else ConstantsModule.ItemTilePadding
	
	return function(p3: number): number
		-- upvalues: CreatorNameItemTileTitleMaxLines (copy), p1 (copy), CreatorNameItemTilePadding (copy), p2 (copy)
		local ScaledCreatorNameItemTileTitleMaxLines = CreatorNameItemTileTitleMaxLines * p1
		local ScaledCreatorNameItemTilePadding = CreatorNameItemTilePadding * 2
		local v1: number = if p3 < 100 then 30 elseif p3 < 148 then 36 else 42
		
		if p2 then
			v1 *= 2
		end
		return p3 + ScaledCreatorNameItemTileTitleMaxLines + ScaledCreatorNameItemTilePadding + v1
	end
end)
local MemoizeResult3 = MemoizeFunction(function(p1, _, p2)
	-- upvalues: ConstantsModule (copy)
	local CreatorNameItemTileTitleMaxLines = if p2 then ConstantsModule.CreatorNameItemTileTitleMaxLines else ConstantsModule.ItemTileTitleMaxLines
	local CreatorNameItemTilePadding = if p2 then ConstantsModule.CreatorNameItemTilePadding else ConstantsModule.ItemTilePadding
	
	return function(p3: number): number
		-- upvalues: ConstantsModule (upval), CreatorNameItemTileTitleMaxLines (copy), p1 (copy), CreatorNameItemTilePadding (copy), p2 (copy)
		local v1 = p3 / ConstantsModule.ItemTileTallAspectRatio
		local ScaledCreatorNameItemTileTitleMaxLines = CreatorNameItemTileTitleMaxLines * p1
		local ScaledCreatorNameItemTilePadding = CreatorNameItemTilePadding * 2
		local v2: number = if p3 < 100 then 30 elseif p3 < 148 then 36 else 42
		
		if p2 then
			v2 *= 2
		end
		return v1 + ScaledCreatorNameItemTileTitleMaxLines + ScaledCreatorNameItemTilePadding + v2
	end
end)

function Utils.isLooksWidget(Value): boolean
	-- upvalues: MapResult (ref)
	return table.find(MapResult, Value) ~= nil
end

function Utils.isTallBundleWidget(Value): boolean
	-- upvalues: FFlagAXTallTilesForAdvancedBodiesWidget (copy), T (ref)
	return if FFlagAXTallTilesForAdvancedBodiesWidget then table.find(T, Value) ~= nil else false
end

function Utils.isAvatarLooksWidget(Value): boolean
	-- upvalues: Utils (copy), MapResult1 (ref)
	return Utils.isLooksWidget(Value) and table.find(MapResult1, Value) ~= nil
end

local MemoizeResult4 = MemoizeFunction(function(Amount, _, p1, p2, p3)
	-- upvalues: ConstantsModule (copy)
	return function(p4): number
		-- upvalues: ConstantsModule (upval), p1 (copy), p2 (copy), p3 (copy), Amount (copy)
		local Count = p4 / ConstantsModule.LookTileAspectRatio
		local P38 = p1 or p2
		
		if p3 then
			if P38 then
				Count += 30
			end
		else
			Count += 30
		end
		if P38 then
			Count += 4
		end
		if p1 then
			Count += Amount
		end
		if p2 then
			if p1 then
				Count += 4
			end
			Count += Amount
		end
		return Count
	end
end)
local MemoizeResult5 = MemoizeFunction(function(p1)
	-- upvalues: ConstantsModule (copy)
	return function(p2)
		-- upvalues: ConstantsModule (upval), p1 (copy)
		return p2 + ConstantsModule.ItemTileTitleMaxLines * p1 + ConstantsModule.ItemTilePadding
	end
end)

local function squareItemHeightGetter(p1)
	return p1
end

local MemoizeResult6 = MemoizeFunction(function(p1)
	-- upvalues: squareItemHeightGetter (copy), FFlagAXSlotsInventoryLoadableGridView (copy), ConstantsModule (copy), FFlagAXRootSlotBasedEditorFlag (copy)
	return if p1 == nil then squareItemHeightGetter else function(p2)
		-- upvalues: FFlagAXSlotsInventoryLoadableGridView (upval), ConstantsModule (upval), p1 (copy), FFlagAXRootSlotBasedEditorFlag (upval)
		return p2 + (if FFlagAXSlotsInventoryLoadableGridView then ConstantsModule.EditorItemTileTitleMaxLines * p1 else ConstantsModule.ItemTileTitleMaxLines * p1) + (if FFlagAXRootSlotBasedEditorFlag then ConstantsModule.ItemTilePadding else ConstantsModule.ItemTilePadding * 2)
	end
end)

local _ = function(Text: string)
	return if Text then string.split(Text, " ") else {}
end

function Utils.mergeKeywordsAndTopics(Text: string, Text1: string): string
	local Parts = if Text then string.split(Text, " ") else {}
	local Parts1 = if Text1 then string.split(Text1, " ") else {}
	for _, value in Parts1 do
		if #value > 0 and not table.find(Parts, value) then
			table.insert(Parts, value)
		end
	end
	return table.concat(Parts, " ")
end

Utils.GetCategoryIdsFromNavKey = MemoizeFunction(function(NavigationKey, NavigationKey1)
	-- upvalues: GetCatalogCategoriesFromStoreModule (copy)
	local Id = nil
	for _, value in GetCatalogCategoriesFromStoreModule() do
		if value.NavigationKey then
			Id = value.Id
			
			if value.NavigationKey == NavigationKey then
				if value.Subcategories and NavigationKey1 then
					for _, subcategory in value.Subcategories do
						if subcategory.NavigationKey == NavigationKey1 then
							return Id, subcategory.Id
						end
					end
				end
				return Id, nil
			end
		end
	end
	return nil, nil
end)
Utils.GetAvatarEditorCategoryIdsFromNavKey = MemoizeFunction(function(NavigationKey)
	-- upvalues: GetAvatarEditorCategoriesModule (copy), FFlagAXEditorSubcategoryFilters (copy)
	for i, value in GetAvatarEditorCategoriesModule() do
		if value.NavigationKey == NavigationKey then
			return i, nil, nil
		end
		if value.Subcategories then
			for i1, subcategory in value.Subcategories do
				if subcategory.NavigationKey == NavigationKey then
					return i, i1, nil
				end
				if FFlagAXEditorSubcategoryFilters and subcategory.SubcategoryFilters then
					for i2, subcategoryFilter in subcategory.SubcategoryFilters do
						if subcategoryFilter.NavigationKey == NavigationKey then
							return i, i1, i2
						end
					end
				end
			end
		end
	end
	return nil, nil, nil
end)

function Utils.GridItemHeightGetter(AvatarEditorTile, ...)
	-- upvalues: ConstantsModule (copy), MemoizeResult6 (copy), squareItemHeightGetter (copy), MemoizeResult5 (copy), MemoizeResult4 (copy), MemoizeResult2 (copy), MemoizeResult3 (copy)
	if AvatarEditorTile == ConstantsModule.ItemTileType.AvatarEditorTile then
		return MemoizeResult6(...)
	elseif AvatarEditorTile == ConstantsModule.ItemTileType.BodyColorButton then
		return squareItemHeightGetter
	elseif AvatarEditorTile == ConstantsModule.ItemTileType.BundleItemTile then
		return MemoizeResult5(...)
	elseif AvatarEditorTile == ConstantsModule.ItemTileType.BundleItemTileNoText then
		return squareItemHeightGetter
	elseif AvatarEditorTile == ConstantsModule.ItemTileType.LookItemTile then
		return MemoizeResult4(...)
	elseif AvatarEditorTile == ConstantsModule.ItemTileType.CatalogItemTile then
		return MemoizeResult2(...)
	elseif AvatarEditorTile == ConstantsModule.ItemTileType.TallCatalogItemTile then
		return MemoizeResult3(...)
	else
		warn("Unknown itemType " .. tostring(AvatarEditorTile) .. " in AvatarExperienceUtils.GridItemHeightGetter")
		
		return squareItemHeightGetter
	end
end

function Utils.GridItemHeightGetterWithOptions(p1)
	-- upvalues: ConstantsModule (copy), MemoizeResult6 (copy), squareItemHeightGetter (copy), MemoizeResult5 (copy), MemoizeResult4 (copy), MemoizeResult2 (copy), MemoizeResult3 (copy)
	local ItemTileType = p1.itemTileType
	
	if ItemTileType == ConstantsModule.ItemTileType.AvatarEditorTile then
		return MemoizeResult6(p1.fontHeight)
	elseif ItemTileType == ConstantsModule.ItemTileType.BodyColorButton then
		return squareItemHeightGetter
	elseif ItemTileType == ConstantsModule.ItemTileType.BundleItemTile and p1.fontHeight then
		return MemoizeResult5(p1.fontHeight)
	elseif ItemTileType == ConstantsModule.ItemTileType.BundleItemTileNoText then
		return squareItemHeightGetter
	elseif ItemTileType == ConstantsModule.ItemTileType.LookItemTile and p1.fontHeight then
		return MemoizeResult4(p1.fontHeight, p1.hideItemName, p1.itemCreatorNamesEnabled, p1.itemPriceEnabled, p1.isWidgetFocused)
	elseif ItemTileType == ConstantsModule.ItemTileType.CatalogItemTile then
		return MemoizeResult2(p1.fontHeight, nil, p1.itemCreatorNamesEnabled)
	elseif ItemTileType == ConstantsModule.ItemTileType.TallCatalogItemTile then
		return MemoizeResult3(p1.fontHeight, nil, p1.itemCreatorNamesEnabled)
	else
		warn("Unknown itemType " .. tostring(ItemTileType) .. " in AvatarExperienceUtils.GridItemHeightGetterWithOptions")
		
		return squareItemHeightGetter
	end
end

function Utils.isAvatarBackground(AvatarBackground): boolean
	-- upvalues: AvatarScreen (copy)
	return AvatarBackground == AvatarScreen.AvatarBackground
end

function Utils.isAvatarExperienceRoute(p1): boolean
	-- upvalues: FFlagUseNavigationSelectors (copy), Selectors (copy), AvatarScreen (copy), SwitchTab (copy)
	local SelectCurrentLegacyRouteResult = if FFlagUseNavigationSelectors then Selectors.selectCurrentLegacyRoute(p1) else p1.Navigation.history[#p1.Navigation.history]
	for _, value in SelectCurrentLegacyRouteResult do
		if value.name == AvatarScreen.AvatarExperienceRoot or value.name == SwitchTab.AvatarExperienceTab then
			return true
		end
	end
	return false
end

local Computed = if FFlagSignalsNavP3gAvatarExperience then CreateComputedFunction(function(p2): boolean
	-- upvalues: GetLegacyNavigationStoreFunction (copy), AvatarScreen (copy), SwitchTab (copy)
	for _, value in GetLegacyNavigationStoreFunction(false).getCurrentLegacyRoute(p2) do
		if value.name == AvatarScreen.AvatarExperienceRoot or value.name == SwitchTab.AvatarExperienceTab then
			return true
		end
	end
	return false
end) else nil

function Utils.getIsAvatarExperienceRoute()
	-- upvalues: Computed (copy)
	return Computed
end

function Utils.isRouteInAvatarEditor(p3): boolean
	-- upvalues: AvatarScreen (copy)
	return p3.opaque.name == AvatarScreen.AvatarEditor
end

function Utils.didLeaveAvatarEditor(p3, p4): boolean
	-- upvalues: Utils (copy)
	return Utils.isRouteInAvatarEditor(p4) and not Utils.isRouteInAvatarEditor(p3) or false
end

function Utils.getIsSceneFullViewFromState(p3, p4): boolean
	-- upvalues: FullView (copy)
	return p3.AvatarExperience.Common.FullView[p4.opaque.name] == FullView.SceneFullView
end

function Utils.getAvatarEditorCategoryInfoFromState(p3)
	-- upvalues: Utils (copy)
	return Utils.getAvatarEditorCategoryInfo(p3.AvatarExperience.AvatarEditor.Categories.category, p3.AvatarExperience.AvatarEditor.Categories.subcategory)
end

function Utils.getAvatarEditorSubcategoryFilterFromState(p3)
	-- upvalues: Utils (copy)
	local AvatarEditorCategoryInfoFromState = Utils.getAvatarEditorCategoryInfoFromState(p3)
	
	return if AvatarEditorCategoryInfoFromState.SubcategoryFilters then AvatarEditorCategoryInfoFromState.SubcategoryFilters[p3.AvatarExperience.AvatarEditor.Categories.subcategoryFilter] else nil
end

function Utils.getSelectedAccessoryDescription(HumanoidDescription, SelectedAccessory)
	local Number: number = tonumber(SelectedAccessory) or 0
	
	for _, AccessoryDescription in HumanoidDescription:GetChildren() do
		if AccessoryDescription:IsA("AccessoryDescription") and AccessoryDescription.AssetId == Number then
			return AccessoryDescription
		end
	end
	return nil
end

function Utils.getAccessoryAdjustmentCategoryInfo(p3)
	-- upvalues: Utils (copy), ConstantsModule3 (copy)
	local SelectedAccessory = p3.AvatarExperience.AccessoryAdjustment.SelectedAccessory or ""
	local CurrentCharacter = p3.AvatarExperience.AvatarScene.Character.CurrentCharacter
	assert(CurrentCharacter, "assert currentCharacter exists")
	local Humanoid = CurrentCharacter:FindFirstChild("Humanoid")
	assert(Humanoid, "assert humanoid exists")
	local HumanoidDescription = Humanoid:FindFirstChild("HumanoidDescription")
	assert(HumanoidDescription, "assert currentCharacter exists")
	local SelectedAccessoryDescription = Utils.getSelectedAccessoryDescription(HumanoidDescription, SelectedAccessory)
	
	if not SelectedAccessoryDescription then return end
	assert(SelectedAccessoryDescription, "assert accessoryDescription exists")
	
	return ConstantsModule3.CameraCategories[SelectedAccessoryDescription.AccessoryType]
end

function Utils.getCategoryInfoFromState(p3, p4)
	-- upvalues: AvatarScreen (copy), Utils (copy), GetCatalogCategoriesStoreModule (copy), FFlagAXFixCatalogSearchZoom (copy), GetFFlagAXExtractEmotesCategoryModule (copy), GetEmotesCategoryModule (copy), GetAvatarEditorStructureModule (copy), ConstantsModule (copy), config (copy), IxpUtilsModule (copy), UniversalAppCameraIXPTestModule (copy), config1 (copy), FFlagAXCustomizeMakeupSupport (copy)
	local Name = p4.opaque.name
	
	if Name == AvatarScreen.AvatarEditor then
		return Utils.getAvatarEditorCategoryInfoFromState(p3)
	elseif Name == AvatarScreen.Catalog then
		return (GetCatalogCategoriesStoreModule.getCatalogSelectionStore().selectedCategoryInfo(false))
	elseif FFlagAXFixCatalogSearchZoom and Name == AvatarScreen.CatalogSearch then
		return GetCatalogCategoriesStoreModule.getCatalogSearchSelectionStore().selectedCategoryInfo(false)
	elseif Name == AvatarScreen.ProfilePictureEditorEmotes then
		if GetFFlagAXExtractEmotesCategoryModule() then
			return (GetEmotesCategoryModule())
		else
			local AssetTypeToCategorySubcategoryEntry = GetAvatarEditorStructureModule().AssetTypeToCategorySubcategory[ConstantsModule.AssetTypeIdStrings.EmoteAnimation]
			
			return Utils.getAvatarEditorCategoryInfo(AssetTypeToCategorySubcategoryEntry.category, AssetTypeToCategorySubcategoryEntry.subcategory)
		end
	elseif Name == AvatarScreen.AdjustAccessoryView then
		local AccessoryAdjustmentCategoryInfo = Utils.getAccessoryAdjustmentCategoryInfo(p3)
		
		return if AccessoryAdjustmentCategoryInfo then AccessoryAdjustmentCategoryInfo else config
	else
		return if IxpUtilsModule.readTestVariable(UniversalAppCameraIXPTestModule.EnabledForUser) and Name == AvatarScreen.CatalogSearch then config1 elseif Name == AvatarScreen.HeadRefinement then ConstantsModule.HeadRefinementCameraCategory elseif FFlagAXCustomizeMakeupSupport and Name == AvatarScreen.LayeredMakeupSort then ConstantsModule.LayeredMakeupCameraCategory else config
	end
end

local list = {
	"Torso",
	"RightArm",
	"LeftArm",
	"LeftLeg",
	"RightLeg"
}

function Utils.routeIsProfilePictureEditor(p3): boolean
	-- upvalues: AvatarScreen (copy)
	return p3.opaque.name == AvatarScreen.ProfilePictureEditorEmotes or (p3.opaque.name == AvatarScreen.ProfilePictureEditorCamera or p3.opaque.name == AvatarScreen.ProfilePictureEditorFinal)
end

function Utils.routeIsPPEStaticImagePage(p3): boolean
	-- upvalues: AvatarScreen (copy)
	return p3.opaque.name == AvatarScreen.ProfilePictureEditorCamera or p3.opaque.name == AvatarScreen.ProfilePictureEditorFinal
end

function Utils.isFullyQualifiedCostume(p3): boolean
	-- upvalues: list (copy)
	for _, value in list do
		if p3[value] == "" or p3[value] == 0 then
			return false
		end
	end
	return true
end

function Utils.shouldShowGradientForScrollingFrame(ScrollFrame)
	local AbsoluteSize = ScrollFrame.AbsoluteSize
	local CanvasSize = ScrollFrame.CanvasSize
	local CanvasPosition = ScrollFrame.CanvasPosition
	
	return AbsoluteSize.X < CanvasSize.X.Offset, CanvasPosition.X > 20, CanvasPosition.X + AbsoluteSize.X < CanvasSize.X.Offset - 20
end

function Utils.Round(p4, p5)
	local P72 = p5 or 1
	
	return math.floor((p4 + P72 / 2) / P72) * P72
end

function Utils.isFetchingDoneOrFailed(Done, Done1): boolean
	-- upvalues: RetrievalStatus (copy)
	local IsDoneMatch: boolean = Done1 == RetrievalStatus.Done or Done1 == RetrievalStatus.Failed
	
	return not (Done == RetrievalStatus.Done or Done == RetrievalStatus.Failed) and IsDoneMatch
end

function Utils.getDeviceType()
	-- upvalues: UserInputService (copy), ConstantsModule (copy)
	local Platform = UserInputService:GetPlatform()
	
	return if Platform == Enum.Platform.Android then ConstantsModule.DeviceType.Android elseif Platform == Enum.Platform.IOS then ConstantsModule.DeviceType.IOS else ConstantsModule.DeviceType.Other
end

function Utils.getUserOutfitIdFromBundle(p4)
	-- upvalues: ConstantsModule (copy)
	for _, item in p4.items do
		if item.type == ConstantsModule.ItemType.Outfit then
			return item.id
		end
	end
	return nil
end

function Utils.getUserOutfitIdsFromBundle(p5)
	-- upvalues: ConstantsModule (copy)
	local Ids = {}
	
	if p5.items then
		for _, item in p5.items do
			if item.type == ConstantsModule.ItemType.Outfit then
				table.insert(Ids, item.id)
			end
		end
	end
	return Ids
end

Utils.getBundleInfo = MemoizeFunction(function(p6, p7)
	if p7 == nil then
		return nil
	else
		local v1 = p6[p7]
		
		return if v1 and v1.receivedCatalogData then v1 else nil
	end
end)

function Utils.getBundleInfoFromState(p6, p7)
	-- upvalues: Utils (copy)
	return Utils.getBundleInfo(p6.AvatarExperience.Common.BundleInfos, p7)
end

function Utils.getOutfitInfoFromBundleIdNoState(BundleInfoFromState, OutfitInfos)
	-- upvalues: Utils (copy), TutilsModule (copy), CryoModule (copy)
	if not BundleInfoFromState then
		return nil
	end
	assert(BundleInfoFromState, "contentId is not nil: silences type checker")
	local UserOutfitIdsFromBundle = Utils.getUserOutfitIdsFromBundle(BundleInfoFromState)
	
	if #UserOutfitIdsFromBundle < 1 then
		return nil
	end
	local DeepCopyResult = nil
	
	for _, value in UserOutfitIdsFromBundle do
		local OutfitInfo = OutfitInfos[value]
		
		if not OutfitInfo then
			return nil
		end
		if DeepCopyResult then
			DeepCopyResult.assets = CryoModule.Dictionary.join(DeepCopyResult.assets, OutfitInfo.assets)
		else
			DeepCopyResult = TutilsModule.deepCopy(OutfitInfo)
		end
	end
	return DeepCopyResult
end

function Utils.getOutfitInfoFromBundleId(p6, p7)
	-- upvalues: Utils (copy)
	return Utils.getOutfitInfoFromBundleIdNoState(Utils.getBundleInfoFromState(p6, p7), p6.AvatarExperience.AvatarEditor.OutfitInfos)
end

function Utils.getAllCategoriesStr(p6): string
	local Text = ""
	local Count = 1
	while true do
		local Text1 = "level" .. Count
		if not p6[Text1] then break end
		if Count ~= 1 then
			Text ..= "|"
		end
		Text ..= p6[Text1]
		Count += 1
	end
	return Text
end

function Utils.isAnimationAssetType(ClimbAnimation): boolean
	-- upvalues: ConstantsModule (copy)
	return ClimbAnimation == ConstantsModule.AssetTypeIdStrings.ClimbAnimation or (ClimbAnimation == ConstantsModule.AssetTypeIdStrings.FallAnimation or (ClimbAnimation == ConstantsModule.AssetTypeIdStrings.IdleAnimation or (ClimbAnimation == ConstantsModule.AssetTypeIdStrings.JumpAnimation or (ClimbAnimation == ConstantsModule.AssetTypeIdStrings.RunAnimation or (ClimbAnimation == ConstantsModule.AssetTypeIdStrings.SwimAnimation or ClimbAnimation == ConstantsModule.AssetTypeIdStrings.WalkAnimation)))))
end

function Utils.getNumElementsWithKeyField(List): number
	local Count = 0
	
	if List then
		for _, value in List do
			if typeof(value) == "table" and value.key then
				Count += 1
			end
		end
	end
	return Count
end

function Utils.lerp(p7, p8, p9)
	return (p8 - p7) * p9 + p7
end

function Utils.getTopBarHeightAvatarScene(p7)
	-- upvalues: FFlagEnableLeftNavOnConsole (copy), IsTenFootInterface (copy), DeviceOrientationMode (copy), ConstantsModule2 (copy)
	return if p7.TopBar then if FFlagEnableLeftNavOnConsole and IsTenFootInterface then 96 elseif p7.DeviceOrientation == DeviceOrientationMode.Landscape then p7.TopBar.statusBarHeight + ConstantsModule2.NAV_BAR_SIZE else p7.TopBar.topBarHeight else 0
end

function Utils.tableToCamelCaseKeys(List)
	-- upvalues: Utils (copy)
	local TableToCamelCaseKeysResults = {}
	
	for Text, value in List do
		TableToCamelCaseKeysResults[if typeof(Text) == "string" then string.lower((string.sub(Text, 1, 1))) .. string.sub(Text, 2) else Text] = if typeof(value) == "table" then Utils.tableToCamelCaseKeys(value) else value
	end
	return TableToCamelCaseKeysResults
end

function Utils.AssetTypeIdStringToEnumValue(p7)
	-- upvalues: ConstantsModule (copy)
	return Enum.AvatarAssetType[ConstantsModule.AssetTypeIdStringToName[p7]]
end

function Utils.bundleIdToEnum(p7)
	-- upvalues: ConstantsModule (copy)
	return Enum.BundleType[ConstantsModule.BundleTypeIdStringToName[p7]]
end

function Utils.getSearchKey(p7, Text): string
	-- upvalues: FilterUtilsModule (copy), ConstantsModule (copy)
	return ConstantsModule.SearchCatalogKey .. Text .. "." .. FilterUtilsModule.selectSortAndFiltersKey(p7)
end

local function v88(p7)
	-- upvalues: TModule (copy)
	assert(TModule.strictInterface({
		searchUuid = TModule.union(TModule.number, TModule.string),
		searchKeyword = TModule.optional(TModule.string),
		recordSearchTime = TModule.optional(TModule.boolean),
		categoryInfo = TModule.optional(TModule.table),
		minPrice = TModule.optional(TModule.number),
		maxPrice = TModule.optional(TModule.number),
		catalogSort = TModule.optional(TModule.string),
		categoryFilter = TModule.optional(TModule.enum(Enum.CatalogCategoryFilter)),
		topics = TModule.optional(TModule.array(TModule.string))
	})(p7))
end

local function v89(p7)
	-- upvalues: TModule (copy)
	assert(TModule.strictInterface({
		CatalogSort = TModule.optional(TModule.string),
		CatalogSortAggregation = TModule.optional(TModule.string),
		PriceRange = TModule.strictInterface({ maxPrice = TModule.number, minPrice = TModule.number }),
		SelectedTopics = TModule.optional(TModule.array(TModule.string)),
		SalesTypeFilter = TModule.optional(TModule.string),
		CreatorFilter = TModule.optional(TModule.string),
		UnavailableItemFilter = TModule.optional(TModule.string),
		WearTimeFilter = TModule.optional(TModule.string)
	})(p7))
end

local function v90(CatalogSearchParams1, AssetTypeIdStrings, BundleTypes)
	-- upvalues: CryoModule (copy), Utils (copy)
	if AssetTypeIdStrings ~= nil and #AssetTypeIdStrings > 0 then
		CatalogSearchParams1.AssetTypes = CryoModule.List.map(AssetTypeIdStrings, function(p7)
			-- upvalues: Utils (upval)
			return Utils.AssetTypeIdStringToEnumValue(p7)
		end)
	end
	if BundleTypes ~= nil and #BundleTypes > 0 then
		CatalogSearchParams1.BundleTypes = CryoModule.List.map(BundleTypes, function(p7)
			-- upvalues: Utils (upval)
			return Utils.bundleIdToEnum(p7)
		end)
	end
end

local _ = function(p7)
	-- upvalues: CatalogConstantsModule (copy)
	return p7.SortType ~= Enum.CatalogSortType.Relevance or (p7.CreatorName ~= "" or (p7.SalesTypeFilter ~= Enum.SalesTypeFilter.All or p7.SearchKeyword ~= "")) or (CatalogConstantsModule.MinPriceFilter < p7.MinPrice or (p7.MaxPrice < CatalogConstantsModule.MaxPriceFilter or p7.IncludeOffSale))
end

function Utils.getSearchParamsAsQueryParams(p7, p8)
	-- upvalues: FFlagAXAddHDCatalogTab (copy), CatalogConstantsModule (copy)
	local config = { keyword = p7.SearchKeyword or "", limit = p7.Limit }
	
	if FFlagAXAddHDCatalogTab then
		if p8 and p8.CategoryFilter and (CatalogConstantsModule.CategoryFilters[p8.CategoryFilter] == nil or p7.CategoryFilter ~= Enum.CatalogCategoryFilter.None) then
			config.categoryFilter = p8.CategoryFilter
		end
	elseif p7.CategoryFilter ~= Enum.CatalogCategoryFilter.None and (p7.SortType == Enum.CatalogSortType.Relevance and (p7.CreatorName == "" and (p7.SalesTypeFilter == Enum.SalesTypeFilter.All and (p7.SearchKeyword == "" and (CatalogConstantsModule.MinPriceFilter >= p7.MinPrice and (p7.MaxPrice >= CatalogConstantsModule.MaxPriceFilter and not p7.IncludeOffSale)))))) then
		config.categoryFilter = tostring(p7.CategoryFilter.Name)
	end
	config.sortType = CatalogConstantsModule.SortTypeAPIMap[tostring(p7.SortType.Name)]
	
	if p7.CreatorName and p7.CreatorName ~= "" then
		config.creatorName = p7.CreatorName
	end
	if p8 and p8.TaxonomyUuid then
		config.taxonomy = tostring(p8.TaxonomyUuid)
	else
		if p7.BundleTypes and #p7.BundleTypes > 0 then
			local BundleTypeIds = {}
			
			for _, bundleType in p7.BundleTypes do
				table.insert(BundleTypeIds, bundleType.Value)
			end
			config.bundleTypeIds = BundleTypeIds
		end
		if p7.AssetTypes and #p7.AssetTypes > 0 then
			local AssetTypeIds = {}
			
			for _, assetType in p7.AssetTypes do
				table.insert(AssetTypeIds, assetType.Value)
			end
			config.assetTypeIds = AssetTypeIds
		end
	end
	config.includeNotForSale = p7.IncludeOffSale
	config.creatorType = "All"
	
	if p7.MinPrice and CatalogConstantsModule.MinPriceFilter < p7.MinPrice then
		config.minPrice = p7.MinPrice
	end
	if p7.MaxPrice and p7.MaxPrice < CatalogConstantsModule.MaxPriceFilter then
		config.maxPrice = p7.MaxPrice
	end
	if p7.SalesTypeFilter and p7.SalesTypeFilter ~= Enum.SalesTypeFilter.All then
		config.salesTypeFilter = tostring(p7.SalesTypeFilter.Name)
	end
	if p7.SortAggregation and (p7.SortType == Enum.CatalogSortType.MostFavorited or p7.SortType == Enum.CatalogSortType.Bestselling) then
		config.sortAggregation = tostring(p7.SortAggregation.Name)
	end
	return config
end

function Utils.getSearchParams(p9, p10, p11)
	-- upvalues: v88 (copy), v89 (copy), v90 (copy), CatalogConstantsModule (copy), AXFixMinMaxPriceFilterError (copy), UnavailableItemFilterModule (copy), SalesTypeFilterModule (copy), FFlagAXRemoveTimedOptionsSalesTypeEnumCheck (copy), MutedErrorModule (copy), SortTypeModule (copy)
	v88(p9)
	v89(p10)
	local CatalogSearchParams1 = CatalogSearchParams.new()
	local SearchKeyword = if p9.searchKeyword then p9.searchKeyword else nil
	CatalogSearchParams1.AssetTypes = {}
	CatalogSearchParams1.BundleTypes = {}
	CatalogSearchParams1.IncludeOffSale = false
	local Flag = false
	local SelectedTopics = p10.SelectedTopics
	
	if SelectedTopics and #SelectedTopics > 0 then
		Flag = true
		local Joined = table.concat(SelectedTopics, " ")
		
		if SearchKeyword == nil then
			SearchKeyword = Joined
		else
			if #SearchKeyword > 0 then
				SearchKeyword ..= " "
			end
			SearchKeyword ..= Joined
		end
	end
	if SearchKeyword then
		CatalogSearchParams1.SearchKeyword = SearchKeyword
	end
	CatalogSearchParams1.Limit = if SearchKeyword or not p11 then 120 else 30
	
	if p9.categoryInfo == nil then
		local t = {}
		local t2 = {}
		CatalogSearchParams1.CategoryFilter = Enum.CatalogCategoryFilter.None
		v90(CatalogSearchParams1, t, t2)
	else
		local CategoryFilter = CatalogConstantsModule.CategoryFilters[p9.categoryInfo.CategoryFilter]
		
		if CategoryFilter == nil or Flag then
			CatalogSearchParams1.CategoryFilter = Enum.CatalogCategoryFilter.None
		else
			CatalogSearchParams1.CategoryFilter = CategoryFilter
		end
		v90(CatalogSearchParams1, p9.categoryInfo.AssetTypeIdStrings, p9.categoryInfo.BundleTypes)
	end
	local MinPrice = p10.PriceRange.minPrice
	local MaxPrice = p10.PriceRange.maxPrice
	
	if AXFixMinMaxPriceFilterError and MinPrice and MaxPrice and MaxPrice < MinPrice then
		local MaxPrice1 = MaxPrice
		MaxPrice = MinPrice
		MinPrice = MaxPrice1
	end
	if CatalogConstantsModule.MinPriceFilter < MinPrice then
		CatalogSearchParams1.MinPrice = MinPrice
	end
	if MaxPrice < CatalogConstantsModule.MaxPriceFilter then
		CatalogSearchParams1.MaxPrice = MaxPrice
	end
	local CatalogSort = p10.CatalogSort
	CatalogSearchParams1.SortType = Enum.CatalogSortType[CatalogSort]
	
	if p10.UnavailableItemFilter ~= UnavailableItemFilterModule.Hide then
		CatalogSearchParams1.IncludeOffSale = true
	end
	local SalesTypeFilter = p10.SalesTypeFilter
	
	if SalesTypeFilter ~= SalesTypeFilterModule.All then
		if FFlagAXRemoveTimedOptionsSalesTypeEnumCheck then
			CatalogSearchParams1.SalesTypeFilter = Enum.SalesTypeFilter[SalesTypeFilter]
		else
			local Success = pcall(function()
				local _ = Enum.SalesTypeFilter.TimedOptions
			end)
			
			if SalesTypeFilter == SalesTypeFilterModule.TimedOptions and not Success then
				MutedErrorModule("Referenced TimeOptions sales type but enum value is not present")
			else
				CatalogSearchParams1.SalesTypeFilter = Enum.SalesTypeFilter[SalesTypeFilter]
			end
		end
	end
	local CreatorFilter = p10.CreatorFilter
	
	if CreatorFilter ~= nil and CreatorFilter ~= "" then
		CatalogSearchParams1.CreatorName = CreatorFilter
	end
	if CatalogSort == SortTypeModule.MostFavorited or CatalogSort == SortTypeModule.Bestselling then
		CatalogSearchParams1.SortAggregation = Enum.CatalogSortAggregation[p10.CatalogSortAggregation]
	end
	if CatalogSearchParams1.SortType ~= Enum.CatalogSortType.Relevance or (CatalogSearchParams1.CreatorName ~= "" or (CatalogSearchParams1.SalesTypeFilter ~= Enum.SalesTypeFilter.All or (CatalogSearchParams1.SearchKeyword ~= "" or (CatalogConstantsModule.MinPriceFilter < CatalogSearchParams1.MinPrice or (CatalogSearchParams1.MaxPrice < CatalogConstantsModule.MaxPriceFilter or CatalogSearchParams1.IncludeOffSale))))) then
		CatalogSearchParams1.CategoryFilter = Enum.CatalogCategoryFilter.None
	end
	return CatalogSearchParams1
end

function Utils.getWebAssetModelFromEquippedAssets(List)
	-- upvalues: ConstantsModule (copy)
	local List1 = {}
	
	for i, value in List do
		local HasLayeredAssetType = ConstantsModule.LayeredAssetTypes[i] ~= nil
		for Id, value1 in value do
			table.insert(List1, { id = Id, meta = HasLayeredAssetType and value1 or nil })
		end
	end
	return List1
end

function Utils.createHumanoidDescriptionAccessoryInfo(p9, p10, p11)
	-- upvalues: ConstantsModule (copy)
	local Number: number? = tonumber(p10)
	assert(Number ~= nil, "assetIdAsNumber is not nil. Silence type checker.")
	
	return {
		AssetId = Number,
		Order = p11.order,
		AccessoryType = p11.type or ConstantsModule.AssetTypeIdToAccessoryTypeEnum[p9],
		IsLayered = p11.isLayered,
		Position = p11.position,
		Rotation = p11.rotation,
		Scale = p11.scale
	}
end

function Utils.createDefaultHumanoidDescriptionAccessoryInfo(p9, p10)
	-- upvalues: MutedErrorModule (copy), ConstantsModule (copy)
	local Number: number? = tonumber(p10)
	
	if Number == nil then
		MutedErrorModule("Called AvatarExperienceUtils.createDefaultHumanoidDescriptionAccessoryInfo with assetId that does not convert to string.")
		Number = 0
	end
	assert(Number, "assetIdAsNumber is non-nil: Silence type checker")
	
	return {
		AssetId = Number,
		Order = ConstantsModule.LayeredClothingOrder[p9],
		AccessoryType = ConstantsModule.AssetTypeIdToAccessoryTypeEnum[p9],
		IsLayered = ConstantsModule.LayeredAssetTypes[p9] ~= nil
	}
end

function Utils.getNewFullViewEnum(None)
	-- upvalues: FullView (copy)
	return if None == FullView.None then FullView.UIFullView else FullView.None
end

function Utils.getPartCFrame(Object, ChildName)
	-- upvalues: ConstantsModule (copy)
	return if Object and Object:FindFirstChild(ChildName) then Object[ChildName].CFrame else CFrame.new(ConstantsModule.DefaultRigPosition)
end

function Utils.getAttachmentCFrame(Object, ChildName, ChildName1)
	-- upvalues: FFlagAvatarJointUpgradeInUA (copy)
	if Object and Object:FindFirstChild(ChildName) then
		local Entry = Object[ChildName]
		local ChildName2 = if FFlagAvatarJointUpgradeInUA then nil else Entry:FindFirstChild(ChildName1)
		
		if FFlagAvatarJointUpgradeInUA then
			for _, Attachment in Entry:GetDescendants() do
				if Attachment:IsA("Attachment") and Attachment.Name == ChildName1 then
					ChildName2 = Attachment
					break
				end
			end
		end
		if ChildName2 then
			return if FFlagAvatarJointUpgradeInUA then ChildName2.WorldCFrame else Entry.CFrame * ChildName2.CFrame
		end
	end
	return nil
end

function Utils.getRecursiveAttachmentCFrame(p9)
	local _CFrame = p9.CFrame
	local Parent = p9.Parent
	while Parent and Parent:IsA("Bone") do
		_CFrame = Parent.CFrame * _CFrame
		Parent = Parent.Parent
	end
	return _CFrame
end

function Utils.isLCCategory(p10): boolean
	-- upvalues: ConstantsModule (copy)
	if p10 and p10.AssetTypeIdStrings then
		for _, assetTypeIdString in p10.AssetTypeIdStrings do
			if ConstantsModule.LayeredAssetTypes[assetTypeIdString] ~= nil then
				return ConstantsModule.LayeredAssetTypes[assetTypeIdString] ~= Enum.AccessoryType.Hair
			end
		end
	end
	return false
end

function Utils.isShoeBundle(p11): boolean
	-- upvalues: ConstantsModule (copy)
	return p11.bundleType == ConstantsModule.BundleTypeIdStrings.Shoes or p11.bundleType == Enum.BundleType.Shoes.Name
end

function Utils.isBundleOrLCAsset(Asset, p11): boolean
	-- upvalues: ConstantsModule (copy)
	local IsAssetMatch = Asset == ConstantsModule.ItemType.Bundle
	
	return Asset == ConstantsModule.ItemType.Asset and ConstantsModule.LayeredAssetTypes[p11] ~= nil or IsAssetMatch
end

function Utils.isBoundingBoxVectorSane(Vector): boolean
	return Vector.X <= 50000 and (Vector.X >= -50000 and (Vector.Y <= 50000 and (Vector.Y >= -50000 and Vector.Z <= 50000))) and Vector.Z >= -50000
end

function Utils.isBoundingBoxCFrameSane(CF)
	-- upvalues: Utils (copy)
	return Utils.isBoundingBoxVectorSane(CF.Position) and Utils.isBoundingBoxVectorSane(CF.LookVector)
end

function Utils.getAssetIdsWithGeometryFromHumanoidDescription(Character)
	if Character == nil then
		return {}
	end
	local List = {}
	
	for _, accessory in Character:GetAccessories(true) do
		if accessory.AssetId then
			table.insert(List, accessory.AssetId)
		end
	end
	if Character.Torso then
		table.insert(List, Character.Torso)
	end
	if Character.RightLeg then
		table.insert(List, Character.RightLeg)
	end
	if Character.RightArm then
		table.insert(List, Character.RightArm)
	end
	if Character.LeftLeg then
		table.insert(List, Character.LeftLeg)
	end
	if Character.LeftArm then
		table.insert(List, Character.LeftArm)
	end
	if Character.Head then
		table.insert(List, Character.Head)
	end
	return List
end

function Utils.calculateNewAssetIdsWithGeometry(Character, Character1)
	-- upvalues: Utils (copy), CryoModule (copy)
	if Character and Character1 then
		local Set = CryoModule.List.toSet((Utils.getAssetIdsWithGeometryFromHumanoidDescription(Character)))
		
		return (CryoModule.List.filter(Utils.getAssetIdsWithGeometryFromHumanoidDescription(Character1), function(p11): boolean
			-- upvalues: Set (copy)
			return Set[p11] == nil
		end))
	else
		return {}
	end
end

function Utils.getItemIconTypeFromOutfit(p11)
	-- upvalues: ConstantsModule (copy), ItemTileEnums (copy)
	local ContainsDynamicHead = p11.containsDynamicHead
	
	return if p11.outfitType == ConstantsModule.OutfitTypes.DynamicHead or ContainsDynamicHead then ItemTileEnums.ItemIconType.DynamicHead else nil
end

function Utils.getItemStatusStyleFromOutfit(p11)
	-- upvalues: ItemTileEnums (copy)
	local ModerationStatus = p11.moderationStatus
	
	return if ModerationStatus == Enum.ModerationStatus.ReviewedRejected then ItemTileEnums.StatusStyle.AlertIcon elseif ModerationStatus == Enum.ModerationStatus.NotReviewed then ItemTileEnums.StatusStyle.PendingIcon else nil
end

function Utils.isModerationPendingOrRejected(ModerationStatus): boolean
	return ModerationStatus == Enum.ModerationStatus.NotReviewed or ModerationStatus == Enum.ModerationStatus.ReviewedRejected
end

function Utils.getMessageTypeFromModerationStatus(ModerationStatus)
	return if ModerationStatus then if ModerationStatus == Enum.ModerationStatus.NotReviewed then "UnavailableItems" elseif ModerationStatus == Enum.ModerationStatus.ReviewedRejected then "ItemDidNotMeetRobloxCommunityStandards" else nil else nil
end

function Utils.getModerationStatusFromAvailabilityStatus(p11)
	-- upvalues: InventoryItemAvailability (copy)
	return if p11 then ({
		[InventoryItemAvailability.Invalid] = Enum.ModerationStatus.Invalid,
		[InventoryItemAvailability.Available] = Enum.ModerationStatus.ReviewedApproved,
		[InventoryItemAvailability.Unavailable] = Enum.ModerationStatus.ReviewedRejected,
		[InventoryItemAvailability.Revoked] = Enum.ModerationStatus.NotApplicable,
		[InventoryItemAvailability.PartiallyAvailableWithUnavailableSubitems] = Enum.ModerationStatus.NotApplicable,
		[InventoryItemAvailability.PartiallyAvailableWithExpiredSubitems] = Enum.ModerationStatus.NotApplicable,
		[InventoryItemAvailability.Expired] = Enum.ModerationStatus.NotApplicable,
		[InventoryItemAvailability.PendingReview] = Enum.ModerationStatus.NotReviewed
	})[p11] else nil
end

function Utils.assetTypeIdIsAnimationOrEmote(ItemSubType): boolean
	-- upvalues: ConstantsModule (copy)
	return if ItemSubType then ConstantsModule.AssetTypeIdToCategory[ItemSubType] == ConstantsModule.AssetCategories.Animation else false
end

local MemoizeResult7 = MemoizeFunction(function(p11)
	-- upvalues: ConstantsModule (copy)
	local v1 = p11 and p11[ConstantsModule.AssetTypeIdStrings.MoodAnimation]
	
	return v1 and next(v1)
end)

function Utils.getEquippedMoodAssetId(p11)
	-- upvalues: MemoizeResult7 (copy)
	return MemoizeResult7(p11.AvatarExperience.AvatarEditor.Character.EquippedAssets)
end

function Utils.getAssetIdForPPEPose(p11)
	-- upvalues: ConstantsModule (copy), Utils (copy)
	local AvatarExperience = p11.AvatarExperience
	
	for _, tryOnItem in p11.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems do
		if tryOnItem.itemType == ConstantsModule.ItemType.Asset and Utils.assetTypeIdIsAnimationOrEmote(tryOnItem.itemSubType) then
			return tryOnItem.itemId
		end
	end
	return if AvatarExperience.ProfilePictureEditor.ProfilePictureParams.emoteAssetId then AvatarExperience.ProfilePictureEditor.ProfilePictureParams.emoteAssetId else nil
end

local MemoizeResult8 = MemoizeFunction(function(p12)
	-- upvalues: ConstantsModule (copy)
	return p12 and (p12[ConstantsModule.AssetTypeIdStrings.Gear] and next(p12[ConstantsModule.AssetTypeIdStrings.Gear]))
end)

function Utils.getEquippedToolId(p12)
	-- upvalues: MemoizeResult8 (copy)
	return MemoizeResult8(p12.AvatarExperience.AvatarEditor.Character.EquippedAssets)
end

function Utils.getNextPageCursorKey(Text, p12, p13)
	return if p12 then Text .. (p13 or "") else Text
end

function Utils.getPerformFetchKey(Text, p12, p13): string
	-- upvalues: ConstantsModule (copy)
	return if p12 then ConstantsModule.OutfitsKey .. Text .. (p13 or "") else ConstantsModule.UserInventoryKey .. Text
end

function Utils.getCurrentScreenIgnoreItemDetails(p12)
	-- upvalues: AvatarScreen (copy)
	local Name = p12.current.name
	
	if Name == AvatarScreen.ItemDetails or (Name == AvatarScreen.LookDetails or Name == AvatarScreen.OutfitDetails) then
		Name = p12.opaque.name
	end
	return Name
end

function Utils.getLargestPossibleOneLineTextSize(String1, FontSize: number, p12, p13: number)
	-- upvalues: TextService (copy)
	local _Vector2 = Vector2.new(p13 - 1, 100000)
	local TextSize = nil
	while FontSize > 1 do
		TextSize = TextService:GetTextSize(String1, FontSize, p12.Font, _Vector2)
		
		if TextSize.Y <= FontSize + 1 then
			return Vector2.new(math.ceil(TextSize.X), (math.ceil(TextSize.Y))), FontSize
		end
		FontSize -= 1
	end
	return nil, nil
end

function Utils.selectSceneSize(p14)
	-- upvalues: DeviceOrientationMode (copy), GetSafeAreaSizeFunction (copy), ConstantsModule (copy)
	local GlobalGuiInset = p14.GlobalGuiInset
	local IsDeviceOrientationMatch = p14.DeviceOrientation == DeviceOrientationMode.Portrait
	local ScreenSize = p14.ScreenSize
	local YDelta = ScreenSize.Y - GlobalGuiInset.bottom
	local ScaledOffset = GetSafeAreaSizeFunction(ScreenSize, GlobalGuiInset).Y.Offset * ConstantsModule.PortraitSceneHeight
	local ScaledX = ScreenSize.X * ConstantsModule.LandscapeSceneWidth
	
	return IsDeviceOrientationMatch and ScaledOffset or YDelta, IsDeviceOrientationMatch and ScreenSize.X or ScaledX
end

Utils.getColor3Difference = MemoizeFunction(function(p14, p15): number
	return (math.sqrt((p14.R - p15.R) * (p14.R - p15.R) + (p14.G - p15.G) * (p14.G - p15.G) + (p14.B - p15.B) * (p14.B - p15.B)))
end)
Utils.bodyColorToBodyColor3 = MemoizeFunction(function(p14)
	return if p14 then BrickColor.new(p14).Color else nil
end)
Utils.bodyPartForSkinColoringIdToBodyColorId = {
	headColor3 = "headColorId",
	torsoColor3 = "torsoColorId",
	rightArmColor3 = "rightArmColorId",
	rightLegColor3 = "rightLegColorId",
	leftArmColor3 = "leftArmColorId",
	leftLegColor3 = "leftLegColorId"
}
Utils.bodyColorIdToBodyPartForSkinColoringId = {}

for i, value in pairs(Utils.bodyPartForSkinColoringIdToBodyColorId) do
	Utils.bodyColorIdToBodyPartForSkinColoringId[value] = i
end
Utils.convertBodyColor3sToHexes = MemoizeFunction(function(List)
	local Hexes = {}
	
	for i, value in pairs(List) do
		Hexes[i] = value:ToHex()
	end
	return Hexes
end)
Utils.convertBodyColor3HexesToColor3s = MemoizeFunction(function(List)
	local Colors = {}
	
	for i, value in pairs(List) do
		Colors[i] = Color3.fromHex(value)
	end
	return Colors
end)

function Utils.isAvatarSceneButtonsVisible(p14, p15, p16, p17, p18)
	-- upvalues: AvatarScreenProperties (copy)
	local NoP164: boolean = (AvatarScreenProperties[p14.opaque.name] or {}).refinementButtonVisible and (not p16 and not p17)
	
	if p18 then
		NoP164 = NoP164 and p18.state.key == p14.opaque.key
		
		return NoP164
	else
		return NoP164 and p15
	end
end

function Utils.isUserCameraEligible(): boolean
	-- upvalues: CryoModule (copy), Players (copy), IsTenFootInterface (copy)
	local IsEmpty = CryoModule.isEmpty((game:GetService("VideoCaptureService"):GetCameraDevices()))
	assert(Players ~= nil, "Players should always be defined")
	
	return not (IsEmpty or IsTenFootInterface)
end

function Utils.getUserId(p14)
	return if p14.LocalUserId then p14.LocalUserId elseif p14.RobloxUser and p14.RobloxUser.rbxuid then tostring(p14.RobloxUser.rbxuid) else nil
end

function Utils.isItemSelectable(p14): boolean
	if p14 == nil then
		return false
	else
		local NoPriceStatus = p14.noPriceStatus
		
		return NoPriceStatus == nil or NoPriceStatus == "Free" or NoPriceStatus ~= "Unavailable" and p14.quantityOwned > 0
	end
end

function Utils.isTryingOnClassicFace(p14)
	-- upvalues: DashModule (copy), ConstantsModule (copy)
	return DashModule.some(p14, function(p15): boolean
		-- upvalues: ConstantsModule (upval)
		return p15.itemType == "Asset" and p15.itemSubType == ConstantsModule.AssetTypeIdStrings.Face
	end)
end

function Utils.isTryingOnDynamicHead(p14)
	-- upvalues: DashModule (copy), ConstantsModule (copy)
	return DashModule.some(p14, function(p15): boolean
		-- upvalues: ConstantsModule (upval)
		return p15.itemType == "Bundle" and p15.itemSubType == ConstantsModule.BundleTypeIdStrings.DynamicHead
	end)
end

Utils.getRecommendedAssetTypeIdStringFromCategoryInfo = MemoizeFunction(function(p14)
	return if p14.RecommendedAssetTypeIdString then p14.RecommendedAssetTypeIdString elseif p14.AssetTypeIdStrings and #p14.AssetTypeIdStrings == 1 then p14.AssetTypeIdStrings[1] else nil
end)
Utils.getRecommendedKey = MemoizeFunction(function(p14)
	-- upvalues: ConstantsModule1 (copy), Utils (copy), MutedErrorModule (copy), ConstantsModule (copy), FFlagAXAvatarTabLooksYouMayAlsoLike (copy), GetFFlagAXEnableRecommendationTypeAllInCustomizeModule (copy)
	if p14.RecommendationsType ~= ConstantsModule1.RecommendationsType.Asset then
		return if p14.RecommendationsType == ConstantsModule1.RecommendationsType.BodyParts then ConstantsModule1.RecommendationsType.BodyParts elseif FFlagAXAvatarTabLooksYouMayAlsoLike and p14.RecommendationsType == ConstantsModule1.RecommendationsType.AvatarLooks then ConstantsModule1.RecommendationsType.AvatarLooks elseif p14.RecommendationsType == ConstantsModule1.RecommendationsType.AvatarAnimations then ConstantsModule1.RecommendationsType.AvatarAnimations elseif p14.RecommendationsType == ConstantsModule1.RecommendationsType.Shoes then ConstantsModule1.RecommendationsType.Shoes elseif p14.RecommendationsType == ConstantsModule1.RecommendationsType.DynamicHeads then ConstantsModule1.RecommendationsType.DynamicHeads elseif GetFFlagAXEnableRecommendationTypeAllInCustomizeModule() and p14.RecommendationsType == ConstantsModule1.RecommendationsType.All then ConstantsModule1.RecommendationsType.All else ConstantsModule1.RecommendationsType.None
	end
	local RecommendedAssetTypeIdStringFromCategoryInfo = Utils.getRecommendedAssetTypeIdStringFromCategoryInfo(p14)
	
	if RecommendedAssetTypeIdStringFromCategoryInfo then
		return RecommendedAssetTypeIdStringFromCategoryInfo
	else
		MutedErrorModule("called getRecommendedKey with a category with no assetTypeIdString")
		
		return ConstantsModule.AssetTypeIdStrings.Hat
	end
end)
Utils.getCategoryInfoByName = MemoizeFunction(function(List, Name, Name1)
	-- upvalues: Utils (copy)
	local v1 = nil
	local v2 = nil
	
	for i, value in List do
		if value.Name == Name then
			v1 = i
			
			if not Name1 or not value.Subcategories then break end
			for i1, subcategory in value.Subcategories do
				if subcategory.Name == Name1 then
					v2 = i1
					break
				end
			end
			assert(v2 ~= nil, "Could not find subcategory with name " .. Name1)
			break
		end
	end
	assert(v1 ~= nil, "Could not find category with name  " .. Name)
	
	return (Utils.getCategoryInfo(List, v1, v2))
end)
Utils.getAssetIdFromContent = MemoizeFunction(function(Text: string): string?
	if Text == nil then
		return nil
	else
		assert(Text, "contentId is not nil: silences type checker")
		local Match: string? = string.match(Text, ".*?id=([0-9]+)")
		
		return if Match then Match else string.match(Text, "rbxassetid://([0-9]+)")
	end
end)
Utils.sortOutfitTryOnItemsByRecency = MemoizeFunction(function(List, p14)
	local List1 = {}
	
	for _, value in List do
		table.insert(List1, value)
	end
	table.sort(List1, function(A, B): boolean
		-- upvalues: p14 (copy)
		return if A.itemRecency and B.itemRecency then if p14 then B.itemRecency < A.itemRecency else A.itemRecency < B.itemRecency else false
	end)
	
	return List1
end)

function Utils.fuzzyEq(p15, p16, p17): boolean
	return math.abs(p15 - p16) < (p17 or 0.001)
end

function Utils.getCreatorNameTileFooterEnabled(p15): boolean
	return p15 and (p15.customizedDataMap and p15.customizedDataMap.creatorNameTileFooterEnabled == "true")
end

function Utils.translateString(Text, p15)
	-- upvalues: LocalizationService (copy), Localization (copy), MutedErrorModule (copy)
	local RobloxLocaleId = LocalizationService.RobloxLocaleId
	local NewLocalization = Localization.new(RobloxLocaleId)
	NewLocalization:SetLocale(RobloxLocaleId)
	local Success, Result = pcall(function()
		-- upvalues: NewLocalization (copy), Text (copy), p15 (copy)
		return NewLocalization:Format(Text, p15)
	end)
	
	if Success then
		return Result
	else
		MutedErrorModule("Failed to translate string with key: " .. Text)
		
		return ""
	end
end

function Utils.resolveEditorCategory(Id)
	-- upvalues: GetAvatarEditorCategoriesModule (copy)
	for _, value in GetAvatarEditorCategoriesModule() do
		if value.Id == Id then
			return value.Category, nil
		end
		if value.Subcategories then
			for _, subcategory in value.Subcategories do
				if subcategory.Id == Id then
					return value.Category, subcategory.Subcategory
				end
			end
		end
	end
	return nil, nil
end

return Utils