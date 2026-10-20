local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local CryoModule = require(CorePackages.Packages.Cryo)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local _ = require(Modules.AvatarExperience.Common.Types)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local UnifiedEventLogEnums = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums
local GetFooterVisibilityFromItemFootersFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).Utils.getFooterVisibilityFromItemFooters
local WidgetTileWithImpressionsTaggingModule = require(Modules.AvatarExperience.Common.Components.Widgets.WidgetTileWithImpressionsTagging)
local View = require(CorePackages.Packages.Foundation).View
local FFlagAXLookAndFeelBackgrounds = AvatarExperienceFlagsModule.FFlagAXLookAndFeelBackgrounds
local FFlagAXCatalogCategoriesStoreImprovePerf = AvatarExperienceFlagsModule.FFlagAXCatalogCategoriesStoreImprovePerf
local config = {
	__index = function(p1, p2)
		-- upvalues: ReactModule (copy)
		local Ref = ReactModule.createRef()
		rawset(p1, p2, Ref)
		
		return Ref
	end
}

return function(Frame)
	-- upvalues: ReactModule (copy), config (copy), UtilsModule (copy), GetFooterVisibilityFromItemFootersFunction (copy), ConstantsModule (copy), CryoModule (copy), UnifiedEventLogEnums (copy), WidgetTileWithImpressionsTaggingModule (copy), FFlagAXLookAndFeelBackgrounds (copy), FFlagAXCatalogCategoriesStoreImprovePerf (copy), View (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: config (upval)
		return (setmetatable({}, config))
	end, {})
	local WidgetInfo = Frame.widgetInfo
	local Content = WidgetInfo.content or {}
	local Smallest = math.min(#Content, Frame.itemsPerRow)
	
	if Smallest <= 0 then
		return nil
	end
	local Largest = math.max(1, Frame.itemWidth)
	local CreatorNameTileFooterEnabled = UtilsModule.getCreatorNameTileFooterEnabled(Frame.widgetConfiguration)
	local FooterVisibilityFromItemFooters = GetFooterVisibilityFromItemFootersFunction(if WidgetInfo.template then WidgetInfo.template.itemFooters else nil)
	local t = {}
	
	for i = 1, Smallest do
		local ContentEntry = Content[i] or {}
		local JoinResult = CryoModule.Dictionary.join(Frame.widgetAnalyticsInfo, {
			itemPosition = i,
			itemId = ContentEntry.id,
			itemType = ContentEntry.type,
			lookType = if ContentEntry.type == ConstantsModule.ItemType.Look and Frame.hydratedWidgetData and Frame.hydratedWidgetData[ConstantsModule.ItemType.Look] and Frame.hydratedWidgetData[ConstantsModule.ItemType.Look][ContentEntry.id] then Frame.hydratedWidgetData[ConstantsModule.ItemType.Look][ContentEntry.id].lookType else nil,
			themeId = WidgetInfo.tagId,
			gridPositionRow = Frame.widgetRow,
			gridPositionColumn = i,
			uiTreatmentType = UnifiedEventLogEnums.WidgetUiTreatment.HERO_UNIT
		})
		local TileName: string = `Tile_{i}`
		local CreateElementFunction = ReactModule.createElement
		local config1 = {
			size = UDim2.new(0, Largest, 0, 0),
			cardStyle = if FFlagAXLookAndFeelBackgrounds and WidgetInfo.template then WidgetInfo.template.cardStyle else nil,
			imageScaleType = if FFlagAXLookAndFeelBackgrounds then Enum.ScaleType.Stretch else nil,
			contentType = ContentEntry.type or "Asset",
			tileContentType = WidgetInfo.type,
			contentId = ContentEntry.id or ""
		}
		config1.index = i
		config1.refCache = UseMemoResult
		config1.resultsListRef = Frame.resultsListRef
		config1.itemDetailsPeekViewRefs = Frame.itemDetailsPeekViewRefs
		config1.itemsPerRow = Smallest
		config1.analyticsItemCountPerPage = Smallest
		config1.creatorNameTileFooterEnabled = CreatorNameTileFooterEnabled
		config1.isCreatorNameVisible = FooterVisibilityFromItemFooters.isCreatorNameVisible
		config1.isTitleVisible = FooterVisibilityFromItemFooters.isTitleVisible
		config1.isPriceVisible = FooterVisibilityFromItemFooters.isPriceVisible
		config1.impressionsTag = Frame.impressionsTag
		config1.widgetAnalyticsInfo = JoinResult
		config1.onThumbnailLoaded = Frame.onThumbnailLoaded
		config1.selectedCategory = if FFlagAXCatalogCategoriesStoreImprovePerf then Frame.selectedCategory else nil
		config1.selectedSubcategory = if FFlagAXCatalogCategoriesStoreImprovePerf then Frame.selectedSubcategory else nil
		config1.selectedCategoryInfo = if FFlagAXCatalogCategoriesStoreImprovePerf then Frame.selectedCategoryInfo else nil
		t[TileName] = CreateElementFunction(WidgetTileWithImpressionsTaggingModule, config1)
	end
	return ReactModule.createElement(View, {
		tag = "row align-y-top gap-medium size-full-0 auto-y",
		LayoutOrder = Frame.LayoutOrder
	}, t)
end