local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UseImpressionsTaggerFunction = require(CorePackages.Workspace.Packages.Impressions).useImpressionsTagger
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog)
local ApplyWidgetTileLookTypeOverrideModule = require(script.Parent.applyWidgetTileLookTypeOverride)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXCatalogCategoriesStoreImprovePerf = AvatarExperienceFlagsModule.FFlagAXCatalogCategoriesStoreImprovePerf
local FFlagAXTallTilesForAdvancedBodiesWidget = AvatarExperienceFlagsModule.FFlagAXTallTilesForAdvancedBodiesWidget
local FFlagAXDeferLookImpressionsForHydration = AvatarExperienceFlagsModule.FFlagAXDeferLookImpressionsForHydration
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local CatalogItemCardContainerModule = require(Modules.AvatarExperience.Catalog.Components.ItemsList.CatalogItemCardContainer)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local GetUseSelectorDeepEqualsFunction = AvatarExperienceCommonModule.Utils.getUseSelectorDeepEquals
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local ItemTypeEnum = AvatarExperienceCommonModule.Enums.ItemTypeEnum
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local UseCatalogCategoryImpressionsInfoModule = require(Modules.AvatarExperience.Catalog.Hooks.useCatalogCategoryImpressionsInfo)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local GetFStringAXTallTilesThumbnailSizeModule = require(Modules.AvatarExperience.Flags.GetFStringAXTallTilesThumbnailSize)
local FFlagAXHeroWidget = AvatarExperienceFlagsModule.FFlagAXHeroWidget

return function(p1)
	-- upvalues: UseImpressionsTaggerFunction (copy), UseSelectorFunction (copy), GetUseSelectorDeepEqualsFunction (copy), ItemTypeEnum (copy), FFlagAXCatalogCategoriesStoreImprovePerf (copy), UseCatalogCategoryImpressionsInfoModule (copy), AvatarScreen (copy), ReactModule (copy), FFlagAXDeferLookImpressionsForHydration (copy), ApplyWidgetTileLookTypeOverrideModule (copy), RoactGamepadModule (copy), CatalogItemCardContainerModule (copy), CatalogConstantsModule (copy), FFlagAXHeroWidget (copy), ConstantsModule (copy), FFlagAXTallTilesForAdvancedBodiesWidget (copy), GetFStringAXTallTilesThumbnailSizeModule (copy)
	UseImpressionsTaggerFunction(p1.refCache[p1.index], p1.impressionsTag, p1.index)
	local ContentType = p1.contentType
	local ContentId = p1.contentId
	local Index: number = p1.index
	local RefCache = p1.refCache
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: ContentType (copy), ContentId (copy)
		local HydratedWidget = p2.AvatarExperience.Common.Widgets.HydratedWidgetData[ContentType]
		
		return if HydratedWidget then HydratedWidget[tostring(ContentId)] else nil
	end, GetUseSelectorDeepEqualsFunction())
	local IsTypeMatch: boolean = UseSelectorResult and UseSelectorResult.type == ItemTypeEnum.Look
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		return p2.AvatarExperience.AvatarScene.AvatarRoute.opaque.name
	end, GetUseSelectorDeepEqualsFunction())
	local UseCatalogCategoryImpressionsInfoModuleResult = if FFlagAXCatalogCategoriesStoreImprovePerf then UseCatalogCategoryImpressionsInfoModule(UseSelectorResult1 == AvatarScreen.CatalogSearch, p1.selectedCategory, p1.selectedSubcategory, p1.selectedCategoryInfo) else UseCatalogCategoryImpressionsInfoModule(UseSelectorResult1 == AvatarScreen.CatalogSearch)
	local LookType = UseSelectorResult and UseSelectorResult.lookType
	local WidgetAnalyticsInfo = p1.widgetAnalyticsInfo
	
	return ReactModule.createElement(RoactGamepadModule.Focusable.Frame, {
		BackgroundTransparency = 1,
		Size = UDim2.new(p1.size.X, UDim.new()),
		AutomaticSize = Enum.AutomaticSize.Y,
		ref = RefCache[Index],
		NextSelectionRight = if Index < p1.itemsPerRow then RefCache[Index + 1] else nil,
		NextSelectionLeft = if Index > 1 then RefCache[Index - 1] else nil
	}, {
		WidgetItemTile = ReactModule.createElement(CatalogItemCardContainerModule, {
			itemId = if UseSelectorResult then tostring(UseSelectorResult.id) else nil,
			itemType = if UseSelectorResult then UseSelectorResult.type else nil,
			index = p1.index,
			analyticsItemCountPerPage = p1.analyticsItemCountPerPage,
			analyticsContext = CatalogConstantsModule.AnalyticsContext.Catalog,
			widgetAnalyticsInfo = ReactModule.useMemo(function()
				-- upvalues: FFlagAXDeferLookImpressionsForHydration (upval), WidgetAnalyticsInfo (copy), ApplyWidgetTileLookTypeOverrideModule (upval), LookType (copy)
				return if FFlagAXDeferLookImpressionsForHydration then ApplyWidgetTileLookTypeOverrideModule(WidgetAnalyticsInfo, LookType) else WidgetAnalyticsInfo
			end, { WidgetAnalyticsInfo, LookType }),
			itemDetailsPeekViewRefs = p1.itemDetailsPeekViewRefs,
			resultsListRef = p1.resultsListRef,
			itemCreatorNamesEnabled = p1.creatorNameFooterEnabled,
			creatorNameTileFooterEnabled = p1.creatorNameTileFooterEnabled,
			cardStyle = p1.cardStyle,
			imageScaleType = if FFlagAXHeroWidget then p1.imageScaleType else nil,
			tileWidth = p1.size.X.Offset,
			onThumbnailLoaded = if p1.onThumbnailLoaded then p1.onThumbnailLoaded else nil,
			isCreatorNameVisible = p1.isCreatorNameVisible,
			isTitleVisible = p1.isTitleVisible,
			isPriceVisible = p1.isPriceVisible,
			lookData = if IsTypeMatch then UseSelectorResult else nil,
			hydratedContent = if IsTypeMatch then nil else UseSelectorResult,
			tileContentType = p1.tileContentType,
			thumbailAspectRatio = if IsTypeMatch then ConstantsModule.LookTileAspectRatio elseif FFlagAXTallTilesForAdvancedBodiesWidget and p1.isTallTile then ConstantsModule.ItemTileTallAspectRatio else nil,
			thumbnailSize = if IsTypeMatch then "w=300&h=450" elseif FFlagAXTallTilesForAdvancedBodiesWidget and p1.isTallTile then GetFStringAXTallTilesThumbnailSizeModule() else nil,
			impressionsCategory = UseCatalogCategoryImpressionsInfoModuleResult.impressionsCategory,
			impressionsSubcategory = UseCatalogCategoryImpressionsInfoModuleResult.impressionsSubcategory,
			impressionsTaxonomyId = UseCatalogCategoryImpressionsInfoModuleResult.impressionsTaxonomyId
		})
	})
end