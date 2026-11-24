local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local FoundationModule = require(Parent1.Foundation)
local FoundationCloudAssetsModule = require(Parent1.FoundationCloudAssets)
local ReactModule = require(Parent1.React)
local StyleModule = require(Parent1.Style)
local _ = require(script.Parent.Parent.Components.AppHeaderBarClassicThemeBackground)
local SharedFlagsModule = require(Parent1.SharedFlags)
local FFlagAppNavBarPerItemThemeOverride = SharedFlagsModule.FFlagAppNavBarPerItemThemeOverride
local FFlagThemeAssetsFromTokens = SharedFlagsModule.FFlagThemeAssetsFromTokens
local FFlagClassicThemeHeaderGradientFromTokensModule = require(Parent.Flags.FFlagClassicThemeHeaderGradientFromTokens)
local UiModeBrandThemeContext = if FFlagThemeAssetsFromTokens then nil else StyleModule.UiModeBrandThemeContext
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Config = if FFlagThemeAssetsFromTokens then nil else {
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
	-- upvalues: FFlagAppNavBarPerItemThemeOverride (copy), FFlagThemeAssetsFromTokens (copy), UseTokensFunction (copy), FFlagClassicThemeHeaderGradientFromTokensModule (copy), ReactModule (copy), FoundationCloudAssetsModule (copy), StyleModule (copy), UiModeBrandThemeContext (copy), Config (copy)
	if not FFlagAppNavBarPerItemThemeOverride then
		return nil
	elseif FFlagThemeAssetsFromTokens then
		local UseTokensResult = UseTokensFunction()
		local CenterImage = UseTokensResult.Assets.TopBar.CenterImage
		local NavigationBarColor3 = if FFlagClassicThemeHeaderGradientFromTokensModule then nil else UseTokensResult.Color.Common.NavigationBar.Color3
		
		return ReactModule.useMemo(function()
			-- upvalues: CenterImage (copy), FoundationCloudAssetsModule (upval), NavigationBarColor3 (copy)
			local Asset = if CenterImage then FoundationCloudAssetsModule.Assets[CenterImage] else nil
			
			return if Asset then {
				centerImage = Asset.assetId,
				gradientColor = NavigationBarColor3
			} else nil
		end, { CenterImage, NavigationBarColor3 })
	else
		return Config[`{ReactModule.useContext(UiModeBrandThemeContext).foundationThemeName}_{ReactModule.useContext(StyleModule.AppearanceContext).theme:lower()}`]
	end
end