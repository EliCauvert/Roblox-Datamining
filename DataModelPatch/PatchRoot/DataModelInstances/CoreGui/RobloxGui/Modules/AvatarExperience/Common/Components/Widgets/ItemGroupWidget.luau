local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local _ = require(Modules.AvatarExperience.Common.Types)
local ItemCarouselWidgetModule = require(Modules.AvatarExperience.Common.Components.Widgets.ItemCarouselWidget)
local FFlagAXCatalogCategoriesStoreImprovePerf = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXCatalogCategoriesStoreImprovePerf

return function(Frame)
	-- upvalues: ReactModule (copy), ItemCarouselWidgetModule (copy), FFlagAXCatalogCategoriesStoreImprovePerf (copy)
	return ReactModule.createElement(ItemCarouselWidgetModule, {
		displayAsItemGroupWidget = true,
		LayoutOrder = Frame.LayoutOrder,
		widgetInfo = Frame.widgetInfo,
		itemsPerRow = Frame.itemsPerRow,
		rowCount = Frame.rowCount,
		rowHeight = Frame.rowHeight,
		widgetRow = Frame.widgetRow,
		itemSize = Frame.itemSize,
		widgetAnalyticsInfo = Frame.widgetAnalyticsInfo,
		widgetFocused = Frame.widgetFocused,
		gridRef = Frame.gridRef,
		itemDetailsPeekViewRefs = Frame.itemDetailsPeekViewRefs,
		requestWidgetAcquireFocus = Frame.requestWidgetAcquireFocus,
		getItemMetrics = Frame.getItemMetrics,
		hideItemName = Frame.hideItemName,
		widgetConfiguration = Frame.widgetConfiguration,
		ixpLayerToExpose = Frame.ixpLayerToExpose,
		rowWidth = Frame.rowWidth,
		onThumbnailLoaded = Frame.onThumbnailLoaded,
		selectedCategory = if FFlagAXCatalogCategoriesStoreImprovePerf then Frame.selectedCategory else nil,
		selectedSubcategory = if FFlagAXCatalogCategoriesStoreImprovePerf then Frame.selectedSubcategory else nil,
		selectedCategoryInfo = if FFlagAXCatalogCategoriesStoreImprovePerf then Frame.selectedCategoryInfo else nil
	})
end