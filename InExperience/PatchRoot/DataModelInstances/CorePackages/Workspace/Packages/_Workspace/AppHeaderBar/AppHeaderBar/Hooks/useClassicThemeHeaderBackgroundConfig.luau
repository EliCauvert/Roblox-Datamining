local Parent = script.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local StyleModule = require(Parent.Style)
local UiModeBrandThemeContext = StyleModule.UiModeBrandThemeContext
local _ = require(script.Parent.Parent.Components.AppHeaderBarClassicThemeBackground)
local FFlagAppNavBarPerItemThemeOverride = require(Parent.SharedFlags).FFlagAppNavBarPerItemThemeOverride
local config = {
	Classic_light = {
		centerImage = "rbxasset://textures/ui/LuaApp/graphic/starburst_center_classic_light.png",
		gradientColor = Color3.fromHex("#CDECFF")
	},
	Classic_dark = {
		centerImage = "rbxasset://textures/ui/LuaApp/graphic/starburst_center_classic_dark.png",
		gradientColor = Color3.fromHex("#042349")
	}
}

return function() --[[ Line: 27 | Named "useClassicThemeHeaderBackgroundConfig" ]]
	-- upvalues: FFlagAppNavBarPerItemThemeOverride (copy), ReactModule (copy), StyleModule (copy), UiModeBrandThemeContext (copy), config (copy)
	return if FFlagAppNavBarPerItemThemeOverride then config[`{ReactModule.useContext(UiModeBrandThemeContext).foundationThemeName}_{ReactModule.useContext(StyleModule.AppearanceContext).theme:lower()}`] else nil
end