local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local WidgetListItem = require(CorePackages.Workspace.Packages.AvatarExperienceUIKit).WidgetComponents.WidgetListItem
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local AvatarExperienceCatalogModule = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog)
local WidgetIxpLayerMap = AvatarExperienceCatalogModule.Utils.WidgetIxpLayerMap
local _ = require(Modules.AvatarExperience.Common.Types)
local WidgetConstants = AvatarExperienceCatalogModule.WidgetConstants
local EntryButtonWidgetModule = require(Modules.AvatarExperience.Common.Components.Widgets.EntryButtonWidget)
local HeroUnitWidgetModule = require(Modules.AvatarExperience.Common.Components.Widgets.HeroUnitWidget)
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local ImpressionEnums = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).Enums.ImpressionEnums
local GetFFlagEnableDecreaseWidgetPaddingSizingModule = require(Modules.AvatarExperience.Flags.GetFFlagEnableDecreaseWidgetPaddingSizing)
local GetFIntWidgetPaddingSizingModule = require(Modules.AvatarExperience.Flags.GetFIntWidgetPaddingSizing)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXCatalogCategoriesStoreImprovePerf = AvatarExperienceFlagsModule.FFlagAXCatalogCategoriesStoreImprovePerf
local config = {
	[WidgetConstants.Templates.ItemGroup] = {
		horizontalMargin = 15,
		component = require(Modules.AvatarExperience.Common.Components.Widgets.ItemGroupWidget)
	},
	[WidgetConstants.Templates.Carousel] = {
		horizontalMargin = 15,
		component = require(Modules.AvatarExperience.Common.Components.Widgets.ItemCarouselWidget)
	},
	[WidgetConstants.Templates.Button] = if game:DefineFastFlag("AXRemoveEntryButtonWidget", false) then nil else {
		horizontalMargin = 15,
		component = EntryButtonWidgetModule
	}
}

if AvatarExperienceFlagsModule.FFlagAXHeroWidget then
	config[WidgetConstants.Templates.HeroUnit] = { horizontalMargin = 15, component = HeroUnitWidgetModule }
end
return (ReactModule.memo((ReactModule.forwardRef(function(Gui, Ref)
	-- upvalues: UseRoactServiceModule (copy), AnalyticsModule (copy), UseDesignTokensFunction (copy), config (copy), ReactModule (copy), ImpressionEnums (copy), GetFFlagEnableDecreaseWidgetPaddingSizingModule (copy), FFlagRenameDeprecatedUIBloxTokens (copy), GetFIntWidgetPaddingSizingModule (copy), WidgetListItem (copy), WidgetIxpLayerMap (copy), FFlagAXCatalogCategoriesStoreImprovePerf (copy)
	local WidgetRow = Gui.widgetRow
	local WidgetInfo = Gui.widgetInfo
	local WidgetConfiguration = Gui.widgetConfiguration
	local UseRoactServiceModuleResult = UseRoactServiceModule(AnalyticsModule)
	local UseDesignTokensResult = UseDesignTokensFunction()
	
	if not WidgetInfo or not WidgetInfo.template or not WidgetInfo.template.type or config[WidgetInfo.template.type] == nil then
		return nil
	end
	assert(WidgetInfo.template, "")
	local Entry = config[WidgetInfo.template.type]
	local Component = Entry.component
	local HorizontalMargin = Entry.horizontalMargin
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: Gui (copy), ImpressionEnums (upval), UseRoactServiceModuleResult (copy)
		if Gui.requestWidgetAcquireFocus then
			UseRoactServiceModuleResult.widgetInteractionV2(Gui.widgetAnalyticsInfo, ImpressionEnums.ActionType.SEE_ALL)
			Gui.requestWidgetAcquireFocus()
		end
	end, { Gui.requestWidgetAcquireFocus })
	local Offset = nil
	
	if GetFFlagEnableDecreaseWidgetPaddingSizingModule() then
		local config1 = {
			[32] = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_800 else UseDesignTokensResult.Global.Space_400,
			[24] = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_600 else UseDesignTokensResult.Global.Space_300,
			[20] = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_500 else UseDesignTokensResult.Global.Space_250,
			[16] = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_400 else UseDesignTokensResult.Global.Space_200
		}
		Offset = if config1[GetFIntWidgetPaddingSizingModule()] == nil then if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_800 else UseDesignTokensResult.Global.Space_400 else config1[GetFIntWidgetPaddingSizingModule()]
	end
	return ReactModule.createElement(WidgetListItem, {
		ref = Ref,
		NextSelectionUp = Gui.NextSelectionUp,
		NextSelectionDown = Gui.NextSelectionDown,
		padding = {
			bottom = if GetFFlagEnableDecreaseWidgetPaddingSizingModule() then UDim.new(0, Offset) else UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_800 else UseDesignTokensResult.Global.Space_400)
		},
		horizontalMargin = HorizontalMargin
	}, {
		Widget = ReactModule.createElement(Component, {
			widgetInfo = Gui.widgetInfo,
			itemsPerRow = Gui.itemsPerRow,
			rowHeight = Gui.rowHeight,
			rowCount = Gui.rowCount,
			widgetRow = WidgetRow,
			widgetAnalyticsInfo = Gui.widgetAnalyticsInfo,
			widgetFocused = Gui.widgetFocused,
			requestWidgetAcquireFocus = UseResult,
			requestWidgetReleaseFocus = Gui.requestWidgetReleaseFocus,
			itemDetailsPeekViewRefs = Gui.itemDetailsPeekViewRefs,
			gridRef = Gui.gridRef,
			gamepadNavigationFocusPos = Gui.gamepadNavigationFocusPos,
			setGamepadNavigationFocusPos = Gui.setGamepadNavigationFocusPos,
			itemSize = Gui.itemSize,
			ixpLayerToExpose = WidgetIxpLayerMap[Gui.widgetInfo.type],
			widgetConfiguration = WidgetConfiguration,
			rowWidth = Gui.rowWidth,
			onThumbnailLoaded = Gui.onThumbnailLoaded,
			selectedCategory = if FFlagAXCatalogCategoriesStoreImprovePerf then Gui.selectedCategory else nil,
			selectedSubcategory = if FFlagAXCatalogCategoriesStoreImprovePerf then Gui.selectedSubcategory else nil,
			selectedCategoryInfo = if FFlagAXCatalogCategoriesStoreImprovePerf then Gui.selectedCategoryInfo else nil
		})
	})
end))))