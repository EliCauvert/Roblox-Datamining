local SharedFlagsModule = require(script.Parent.Parent.SharedFlags)
local UIBlox = SharedFlagsModule.UIBlox

return {
	responsiveGridDisplayLinesNonNil = true,
	enableScalingForSomeEdpIcons = true,
	useFoundationButton = UIBlox.GetFFlagUIBloxUseFoundationButton(),
	setZIndexOnGridCells = game:DefineFastFlag("UIBloxUseNewZindex", false),
	passRowAndColumnDataToItemInGridView = game:DefineFastFlag("UIBloxUseGridInfoForTile", false),
	enableTooltipV2HoverControllerReRenderFix = UIBlox.GetFFlagUIBloxEnableTooltipV2HoverControllerReRenderFix(),
	enableTooltipV2BodyFontFix = UIBlox.GetFFlagUIBloxEnableTooltipV2BodyFontFix(),
	enableOpenTypeSupport = SharedFlagsModule.GetFFlagLuaAppEnableOpenTypeSupport(),
	didMountUpdateFullPageModal = UIBlox.GetFFlagUIBloxDidMountUpdateFullPageModal(),
	useTokenizedShortcutBar = UIBlox.FFlagUIBloxAppShortcutBarUseTokens,
	enableShortcutCustomization = SharedFlagsModule.FFlagLuaAppEnableStickyShortcutBar or SharedFlagsModule.FFlagGuacStickyShortcutBarEnabled,
	enableActionBarButtonOverride = UIBlox.FFlagUIBloxEnableActionBarButtonOverride,
	fixCoplayFooterConditionalHooks = UIBlox.FFlagUIBloxFixCoplayFooterConditionalHooks,
	disableTokenScaling = UIBlox.FFlagUIBloxDisableTokenScaling,
	removeStackedNavigationTabIconLabelSpacing = UIBlox.FFlagUIBloxRemoveStackedNavigationTabIconLabelSpacing
}