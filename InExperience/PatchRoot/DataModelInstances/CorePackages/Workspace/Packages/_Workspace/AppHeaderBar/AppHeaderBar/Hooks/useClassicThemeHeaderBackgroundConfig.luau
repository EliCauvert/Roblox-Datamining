local parent = script.Parent.Parent.Parent
local reactModule = require(parent.React)
local styleModule = require(parent.Style)
local uiModeBrandThemeContext = styleModule.UiModeBrandThemeContext
local _ = require(script.Parent.Parent.Components.AppHeaderBarClassicThemeBackground)
local fFlagAppNavBarPerItemThemeOverride = require(parent.SharedFlags).FFlagAppNavBarPerItemThemeOverride
local t = {
	Classic_light = {
		centerImage = "rbxasset://textures/ui/LuaApp/graphic/starburst_center_classic_light.png",
		gradientColor = Color3.fromHex("#CDECFF")
	},
	Classic_dark = {
		centerImage = "rbxasset://textures/ui/LuaApp/graphic/starburst_center_classic_dark.png",
		gradientColor = Color3.fromHex("#042349")
	},
	KidsClassic_light = {
		centerImage = "rbxasset://textures/ui/LuaApp/graphic/starburst_center_classic_kids_light.png",
		gradientColor = Color3.fromHex("#BBD1FB")
	},
	KidsClassic_dark = {
		centerImage = "rbxasset://textures/ui/LuaApp/graphic/starburst_center_classic_kids_dark.png",
		gradientColor = Color3.fromHex("#10278E")
	}
}

return function()
	-- upvalues: fFlagAppNavBarPerItemThemeOverride (ref), reactModule (ref), styleModule (ref), uiModeBrandThemeContext (ref), t (ref)
	return if fFlagAppNavBarPerItemThemeOverride then t[`{reactModule.useContext(uiModeBrandThemeContext).foundationThemeName}_{reactModule.useContext(styleModule.AppearanceContext).theme:lower()}`] else nil
end