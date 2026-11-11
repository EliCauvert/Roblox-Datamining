local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local _ = require(Modules.AvatarExperience.Common.Types)
local HeroItemRowModule = require(Modules.AvatarExperience.Common.Components.Widgets.HeroItemRow)
local HeroUnitMultiItemFrameModule = require(Modules.AvatarExperience.Common.Components.Widgets.HeroUnitMultiItemFrame)
local UseHeroUnitResponsiveStyleModule = require(Modules.AvatarExperience.Common.Components.Widgets.useHeroUnitResponsiveStyle)

return function(p1)
	-- upvalues: UseHeroUnitResponsiveStyleModule (copy), ReactModule (copy), HeroUnitMultiItemFrameModule (copy), HeroItemRowModule (copy)
	local UseHeroUnitResponsiveStyleModuleResult = UseHeroUnitResponsiveStyleModule(p1.rowWidth)
	local WidgetInfo = p1.widgetInfo
	local Template = WidgetInfo.template
	local Largest = math.max(1, p1.itemsPerRow)
	local StackedSeamScale = UseHeroUnitResponsiveStyleModuleResult.stackedSeamScale
	
	return ReactModule.createElement(HeroUnitMultiItemFrameModule, {
		direction = "col",
		itemsClipTag = "size-full-0 auto-y clip",
		backgroundLayers = if Template.widgetStyle and Template.widgetStyle.backgroundLayers then Template.widgetStyle.backgroundLayers else nil,
		header = {
			tag = "auto-y",
			size = UDim2.fromScale(1, 0),
			paddingTag = `col align-x-left size-full-0 auto-y {UseHeroUnitResponsiveStyleModuleResult.cardPaddingTag} padding-bottom-{StackedSeamScale}`,
			props = {
				LayoutOrder = 1,
				titleText = Template.localizedTitle,
				titleTag = UseHeroUnitResponsiveStyleModuleResult.titleTag,
				descriptionText = Template.localizedDescription,
				descriptionTag = UseHeroUnitResponsiveStyleModuleResult.descriptionTag,
				titleGroupGapTag = UseHeroUnitResponsiveStyleModuleResult.titleGroupGapTag,
				badgeGapTag = UseHeroUnitResponsiveStyleModuleResult.stackedBadgeGapTag,
				availableUntil = Template.availableUntil
			}
		},
		itemsContentSize = UDim2.new(1, 0, 0, 0),
		itemsContentAutomaticSize = Enum.AutomaticSize.Y,
		itemsContentTag = `{UseHeroUnitResponsiveStyleModuleResult.cardPaddingTag} padding-top-{StackedSeamScale}`
	}, {
		ItemRow = ReactModule.createElement(HeroItemRowModule, {
			widgetInfo = WidgetInfo,
			widgetConfiguration = p1.widgetConfiguration,
			widgetAnalyticsInfo = p1.widgetAnalyticsInfo,
			widgetRow = p1.widgetRow,
			itemWidth = math.max(1, (math.floor((math.max(1, p1.rowWidth - 2 * UseHeroUnitResponsiveStyleModuleResult.cardPaddingPx) - (Largest - 1) * UseHeroUnitResponsiveStyleModuleResult.itemGapPx) / Largest))),
			itemsPerRow = p1.itemsPerRow,
			impressionsTag = p1.impressionsTag,
			resultsListRef = p1.resultsListRef,
			itemDetailsPeekViewRefs = p1.itemDetailsPeekViewRefs,
			hydratedWidgetData = p1.hydratedWidgetData,
			onThumbnailLoaded = p1.onThumbnailLoaded,
			selectedCategory = p1.selectedCategory,
			selectedSubcategory = p1.selectedSubcategory,
			selectedCategoryInfo = p1.selectedCategoryInfo
		})
	})
end