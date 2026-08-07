local sharedFlagsModule = require(script.Parent.Parent.SharedFlags)
local UIBlox = sharedFlagsModule.UIBlox

return {
	useFoundationButton = true,
	enableTooltipV2HoverControllerReRenderFix = UIBlox.GetFFlagUIBloxEnableTooltipV2HoverControllerReRenderFix(),
	enableTooltipV2BodyFontFix = UIBlox.GetFFlagUIBloxEnableTooltipV2BodyFontFix(),
	enableOpenTypeSupport = sharedFlagsModule.GetFFlagLuaAppEnableOpenTypeSupport(),
	didMountUpdateFullPageModal = UIBlox.GetFFlagUIBloxDidMountUpdateFullPageModal(),
	useTokenizedShortcutBar = sharedFlagsModule.FFlagEnableConsoleExpControls,
	disableTokenScaling = UIBlox.FFlagUIBloxDisableTokenScaling
}