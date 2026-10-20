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
	local CardPaddingPx: number = UseHeroUnitResponsiveStyleModuleResult.cardPaddingPx
	local Largest = math.max(1, p1.rowWidth - math.max(1, (math.floor(p1.rowWidth * 0.4))))
	local Largest1 = math.max(1, p1.itemsPerRow)
	local ItemGapPx = UseHeroUnitResponsiveStyleModuleResult.itemGapPx
	local Largest2 = math.max(1, (math.floor((math.max(1, Largest - 2 * CardPaddingPx) - (Largest1 - 1) * ItemGapPx) / Largest1)))
	local Smallest = math.min(#(if WidgetInfo.content then WidgetInfo.content else {}), Largest1)
	local Smallest1 = math.min(Largest, math.max(1, Smallest * Largest2 + math.max(0, (Smallest - 1) * ItemGapPx)) + 2 * CardPaddingPx)
	
	return ReactModule.createElement(HeroUnitMultiItemFrameModule, {
		direction = "row",
		itemsClipTag = "auto-y clip",
		backgroundLayers = if Template.widgetStyle and Template.widgetStyle.backgroundLayers then Template.widgetStyle.backgroundLayers else nil,
		header = {
			size = UDim2.fromOffset(math.max(1, p1.rowWidth - Smallest1), 0),
			paddingTag = `col align-x-left size-full {UseHeroUnitResponsiveStyleModuleResult.cardPaddingTag}`,
			props = {
				centerTitleGroup = true,
				titleText = Template.localizedTitle,
				titleTag = UseHeroUnitResponsiveStyleModuleResult.titleTag,
				descriptionText = Template.localizedDescription,
				descriptionTag = UseHeroUnitResponsiveStyleModuleResult.descriptionTag,
				titleGroupGapTag = UseHeroUnitResponsiveStyleModuleResult.titleGroupGapTag,
				availableUntil = Template.availableUntil
			}
		},
		itemsClipSize = UDim2.new(0, Smallest1, 0, 0),
		itemsContentTag = `size-full-0 auto-y {UseHeroUnitResponsiveStyleModuleResult.cardPaddingTag}`
	}, {
		ItemRow = ReactModule.createElement(HeroItemRowModule, {
			widgetInfo = WidgetInfo,
			widgetConfiguration = p1.widgetConfiguration,
			widgetAnalyticsInfo = p1.widgetAnalyticsInfo,
			widgetRow = p1.widgetRow,
			itemWidth = Largest2,
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