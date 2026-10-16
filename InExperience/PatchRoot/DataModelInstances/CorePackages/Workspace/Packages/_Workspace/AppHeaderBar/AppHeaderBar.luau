local FFlagEnableClassicThemeHeaderBackground = require(script.Parent.SharedFlags).FFlagEnableClassicThemeHeaderBackground

return {
	AppHeaderBar = require(script.Components.AppHeaderBarResponsive),
	AppHeaderBarClassicThemeBackground = if FFlagEnableClassicThemeHeaderBackground then require(script.Components.AppHeaderBarClassicThemeBackground) else nil,
	useClassicThemeHeaderBackgroundConfig = if FFlagEnableClassicThemeHeaderBackground then require(script.Hooks.useClassicThemeHeaderBackgroundConfig) else nil,
	makeBackButton = require(script.Utils).makeBackButton,
	makeCloseButton = require(script.Utils).makeCloseButton,
	["jest.config"] = script["jest.config"]
}