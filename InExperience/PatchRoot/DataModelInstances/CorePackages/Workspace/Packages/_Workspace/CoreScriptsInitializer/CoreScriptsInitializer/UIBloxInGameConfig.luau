local SharedFlagsModule = require(script.Parent.Parent.SharedFlags)
local UIBlox = SharedFlagsModule.UIBlox

return {
	useFoundationButton = true,
	didMountUpdateFullPageModal = true,
	enableTooltipV2HoverControllerReRenderFix = UIBlox.GetFFlagUIBloxEnableTooltipV2HoverControllerReRenderFix(),
	enableTooltipV2BodyFontFix = UIBlox.GetFFlagUIBloxEnableTooltipV2BodyFontFix(),
	enableOpenTypeSupport = SharedFlagsModule.GetFFlagLuaAppEnableOpenTypeSupport(),
	useFoundationToastButtonSizing = UIBlox.FFlagUIBloxToastFoundationButtonSizing,
	useTokenizedShortcutBar = SharedFlagsModule.FFlagEnableConsoleExpControls,
	disableTokenScaling = UIBlox.FFlagUIBloxDisableTokenScaling
}