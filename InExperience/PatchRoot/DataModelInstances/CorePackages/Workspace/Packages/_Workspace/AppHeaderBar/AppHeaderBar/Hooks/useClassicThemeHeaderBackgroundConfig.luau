local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local StyleModule = require(Parent1.Style)
local UiModeBrandThemeContext = StyleModule.UiModeBrandThemeContext
local _ = require(script.Parent.Parent.Components.AppHeaderBarClassicThemeBackground)
local FFlagAppNavBarPerItemThemeOverride = require(Parent1.SharedFlags).FFlagAppNavBarPerItemThemeOverride
local FFlagClassicThemeHeaderGradientFromTokensModule = require(Parent.Flags.FFlagClassicThemeHeaderGradientFromTokens)
local config = {
	Classic_light = {
		centerImage = "rbxasset://textures/ui/LuaApp/graphic/starburst_center_classic_light.png",
		gradientColor = if FFlagClassicThemeHeaderGradientFromTokensModule then nil else Color3.fromHex("#CDECFF")
	},
	Classic_dark = {
		centerImage = "rbxasset://textures/ui/LuaApp/graphic/starburst_center_classic_dark.png",
		gradientColor = if FFlagClassicThemeHeaderGradientFromTokensModule then nil else Color3.fromHex("#042349")
	}
}

return function()
	-- upvalues: FFlagAppNavBarPerItemThemeOverride (copy), ReactModule (copy), StyleModule (copy), UiModeBrandThemeContext (copy), config (copy)
	return if FFlagAppNavBarPerItemThemeOverride then config[`{ReactModule.useContext(UiModeBrandThemeContext).foundationThemeName}_{ReactModule.useContext(StyleModule.AppearanceContext).theme:lower()}`] else nil
end