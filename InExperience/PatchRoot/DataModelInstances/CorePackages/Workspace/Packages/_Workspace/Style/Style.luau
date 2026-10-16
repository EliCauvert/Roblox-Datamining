local Parent = script.Parent
local UIBloxModule = require(Parent.UIBlox)
local DesignTokensModule = require(script.DesignTokens)

return {
	AppStyleProvider = UIBloxModule.App.Style.AppStyleProvider,
	Colors = require(script.Colors),
	Constants = UIBloxModule.App.Style.Constants,
	Themes = {
		DarkTheme = UIBloxModule.App.Style.Themes.DarkTheme,
		LightTheme = UIBloxModule.App.Style.Themes.LightTheme
	},
	DesignTokenProvider = DesignTokensModule.DesignTokenProvider,
	UiModeStyleProvider = require(script.UiModeStyleProvider),
	useDesignTokens = DesignTokensModule.useDesignTokens,
	mapTypographyVariantToFontEnum = DesignTokensModule.mapTypographyVariantToFontEnum,
	GetTextSize = require(script.Utils.GetTextSize),
	StyleProviderWithDefaultTheme = require(script.StyleProviderWithDefaultTheme),
	AppFonts = require(script.AppFonts),
	AppearanceContext = require(script.AppearanceContext),
	UiModeBrandThemeContext = if require(Parent.SharedFlags).FFlagAppNavBarPerItemThemeOverride then require(script.UiModeBrandThemeContext) else nil,
	getSceneOverridesStore = require(script.getSceneOverridesStore),
	["jest.config"] = script["jest.config"]
}