local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local UiModeStyleProvider = require(CorePackages.Workspace.Packages.Style).UiModeStyleProvider
local Constants = require(CorePackages.Packages.UIBlox).App.Style.Constants
local AvatarExperienceCatalogModule = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog)
local FFlagAXHeroUnitUIBloxDarkScope = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXHeroUnitUIBloxDarkScope
local ScreenSizeImpressionsDetector = require(CorePackages.Workspace.Packages.Impressions).ScreenSizeImpressionsDetector
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local _ = require(Modules.AvatarExperience.Common.Types)
local UnifiedEventLogEnums = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums
local GetUseSelectorDeepEqualsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals
local View = FoundationModule.View
local UseAddUnifiedLoggingToCatalogSortEffectFunction = AvatarExperienceCatalogModule.Hooks.useAddUnifiedLoggingToCatalogSortEffect
local UseWidgetItemImpressionsFunction = AvatarExperienceCatalogModule.Hooks.useWidgetItemImpressions
local WidgetEventImpressionsReporterModule = require(Modules.AvatarExperience.Common.Components.Impressions.WidgetEventImpressionsReporter)
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local UseWidgetHydrationModule = require(Modules.AvatarExperience.Common.Hooks.useWidgetHydration)
local HeroUnitSpotlightCardModule = require(Modules.AvatarExperience.Common.Components.Widgets.HeroUnitSpotlightCard)
local HeroUnitStackedModule = require(Modules.AvatarExperience.Common.Components.Widgets.HeroUnitStacked)
local HeroUnitSideBySideModule = require(Modules.AvatarExperience.Common.Components.Widgets.HeroUnitSideBySide)
local UseHeroUnitResponsiveStyleModule = require(Modules.AvatarExperience.Common.Components.Widgets.useHeroUnitResponsiveStyle)

return function(p1)
	-- upvalues: UseRoactServiceModule (copy), AnalyticsModule (copy), UseHeroUnitResponsiveStyleModule (copy), ReactModule (copy), UseAddUnifiedLoggingToCatalogSortEffectFunction (copy), UnifiedEventLogEnums (copy), WidgetEventImpressionsReporterModule (copy), UseWidgetItemImpressionsFunction (copy), UseSelectorFunction (copy), GetUseSelectorDeepEqualsFunction (copy), UseWidgetHydrationModule (copy), HeroUnitSpotlightCardModule (copy), HeroUnitStackedModule (copy), HeroUnitSideBySideModule (copy), View (copy), FFlagAXHeroUnitUIBloxDarkScope (copy), UiModeStyleProvider (copy), Constants (copy), FoundationModule (copy), ScreenSizeImpressionsDetector (copy)
	local WidgetInfo = p1.widgetInfo
	local Content = WidgetInfo.content or {}
	local CountContent = #Content
	local RowWidth = p1.rowWidth or 0
	local UseRoactServiceModuleResult = UseRoactServiceModule(AnalyticsModule)
	local IsCountContentMatch = CountContent == 1
	local IsStacked = UseHeroUnitResponsiveStyleModule(RowWidth).isStacked
	local UseRefResult = ReactModule.useRef(nil)
	UseAddUnifiedLoggingToCatalogSortEffectFunction({
		containerRef = UseRefResult,
		widgetInfo = WidgetInfo,
		widgetAnalyticsInfo = p1.widgetAnalyticsInfo,
		widgetRow = p1.widgetRow,
		uiTreatmentType = UnifiedEventLogEnums.WidgetUiTreatment.HERO_UNIT
	})
	local Text = "WIDGET_HERO_UNIT" .. "_" .. WidgetInfo.id
	local UseWidgetItemImpressionsResult = UseWidgetItemImpressionsFunction({
		widgetId = WidgetInfo.id,
		content = Content,
		widgetRow = p1.widgetRow,
		itemsPerRow = p1.itemsPerRow,
		widgetAnalyticsInfo = p1.widgetAnalyticsInfo,
		uiTreatmentType = UnifiedEventLogEnums.WidgetUiTreatment.HERO_UNIT,
		reportItemImpression = ReactModule.useCallback(function(p2)
			-- upvalues: WidgetEventImpressionsReporterModule (upval), UseRoactServiceModuleResult (copy)
			WidgetEventImpressionsReporterModule(UseRoactServiceModuleResult, p2)
		end, { UseRoactServiceModuleResult })
	})
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.AvatarExperience.Common.Widgets.HydratedWidgetData
	end, GetUseSelectorDeepEqualsFunction())
	UseWidgetHydrationModule({
		widgetInfo = WidgetInfo,
		hydratedWidgetData = UseSelectorResult
	})
	local Element = if IsCountContentMatch then ReactModule.createElement(HeroUnitSpotlightCardModule, {
		widgetInfo = WidgetInfo,
		widgetAnalyticsInfo = p1.widgetAnalyticsInfo,
		widgetRow = p1.widgetRow,
		rowWidth = RowWidth,
		resultsListRef = p1.gridRef,
		itemDetailsPeekViewRefs = p1.itemDetailsPeekViewRefs,
		impressionsTag = Text,
		selectedCategory = p1.selectedCategory,
		selectedSubcategory = p1.selectedSubcategory,
		selectedCategoryInfo = p1.selectedCategoryInfo
	}) elseif IsStacked then ReactModule.createElement(HeroUnitStackedModule, {
		widgetInfo = WidgetInfo,
		widgetConfiguration = p1.widgetConfiguration,
		widgetAnalyticsInfo = p1.widgetAnalyticsInfo,
		widgetRow = p1.widgetRow,
		rowWidth = RowWidth,
		itemsPerRow = p1.itemsPerRow,
		impressionsTag = Text,
		resultsListRef = p1.gridRef,
		itemDetailsPeekViewRefs = p1.itemDetailsPeekViewRefs,
		hydratedWidgetData = UseSelectorResult,
		onThumbnailLoaded = p1.onThumbnailLoaded,
		selectedCategory = p1.selectedCategory,
		selectedSubcategory = p1.selectedSubcategory,
		selectedCategoryInfo = p1.selectedCategoryInfo
	}) else ReactModule.createElement(HeroUnitSideBySideModule, {
		widgetInfo = WidgetInfo,
		widgetConfiguration = p1.widgetConfiguration,
		widgetAnalyticsInfo = p1.widgetAnalyticsInfo,
		widgetRow = p1.widgetRow,
		rowWidth = RowWidth,
		itemsPerRow = p1.itemsPerRow,
		impressionsTag = Text,
		resultsListRef = p1.gridRef,
		itemDetailsPeekViewRefs = p1.itemDetailsPeekViewRefs,
		hydratedWidgetData = UseSelectorResult,
		onThumbnailLoaded = p1.onThumbnailLoaded,
		selectedCategory = p1.selectedCategory,
		selectedSubcategory = p1.selectedSubcategory,
		selectedCategoryInfo = p1.selectedCategoryInfo
	})
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		HeroFrame = ReactModule.createElement(View, { tag = "size-full-0 auto-y", ref = UseRefResult }, {
			DarkScope = if FFlagAXHeroUnitUIBloxDarkScope then ReactModule.createElement(UiModeStyleProvider, {
				style = {
					themeName = Constants.ThemeName.Dark,
					fontName = Constants.FontName.Gotham
				}
			}, { Layout = Element }) else ReactModule.createElement(FoundationModule.FoundationProvider, { theme = FoundationModule.Enums.Theme.Dark }, { Layout = Element })
		}),
		ImpressionsDetector = ReactModule.createElement(ScreenSizeImpressionsDetector, {
			onRequestImpressionsSignal = UseWidgetItemImpressionsResult.onRequestImpressionsSignal,
			onImpressionsDetected = UseWidgetItemImpressionsResult.onImpressionsDetected,
			impressionsTag = Text
		})
	})
end