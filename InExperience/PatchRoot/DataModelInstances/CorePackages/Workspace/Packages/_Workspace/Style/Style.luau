local parent = script.Parent
local UIBloxModule = require(parent.UIBlox)
local designTokensModule = require(script.DesignTokens)

return {
	AppStyleProvider = UIBloxModule.App.Style.AppStyleProvider,
	Colors = require(script.Colors),
	Constants = UIBloxModule.App.Style.Constants,
	Themes = {
		DarkTheme = UIBloxModule.App.Style.Themes.DarkTheme,
		LightTheme = UIBloxModule.App.Style.Themes.LightTheme
	},
	DesignTokenProvider = designTokensModule.DesignTokenProvider,
	UiModeStyleProvider = require(script.UiModeStyleProvider),
	useDesignTokens = designTokensModule.useDesignTokens,
	mapTypographyVariantToFontEnum = designTokensModule.mapTypographyVariantToFontEnum,
	GetTextSize = require(script.Utils.GetTextSize),
	StyleProviderWithDefaultTheme = require(script.StyleProviderWithDefaultTheme),
	AppFonts = require(script.AppFonts),
	ThemeContext = require(script.ThemeContext),
	UiModeTokenOverridesContext = if require(parent.SharedFlags).FFlagAppNavBarPerItemThemeOverride then require(script.UiModeTokenOverridesContext) else nil,
	getSceneOverridesStore = require(script.getSceneOverridesStore),
	["jest.config"] = script["jest.config"]
}