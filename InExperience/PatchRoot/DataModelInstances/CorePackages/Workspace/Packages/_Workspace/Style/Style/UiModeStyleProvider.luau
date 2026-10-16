local UserGameSettings = UserSettings():GetService("UserGameSettings")
local Parent = script:FindFirstAncestor("Style").Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local UseDeviceTypeFunction = require(Parent.RobloxAppHooks).useDeviceType
local AppearanceContextModule = require(script.Parent.AppearanceContext)
local SceneOverridesRegistryModule = require(script.Parent.SceneOverridesRegistry)
local AppStyleProvider = require(Parent.UIBlox).App.Style.AppStyleProvider
local FoundationModule = require(Parent.Foundation)
local FoundationProvider = FoundationModule.FoundationProvider
local ColorMode = FoundationModule.Enums.ColorMode
local ThemeName = FoundationModule.Enums.ThemeName
local GetUIScale = require(Parent.Display).GetDisplayStore(false).getUIScale
local DebugLuaAppEnableTokenScale = game:DefineFastFlag("DebugLuaAppEnableTokenScale", false)
local EnableDisplaySizeEngineFeature = game:DefineFastFlag("LuaAppEnableWindowsHandheldTokenScale", false) and game:GetEngineFeature("EnableDisplaySize") or DebugLuaAppEnableTokenScale
local FFlagAppNavBarPerItemThemeOverride = require(Parent.SharedFlags).FFlagAppNavBarPerItemThemeOverride
local UiModeBrandThemeContextModule = if FFlagAppNavBarPerItemThemeOverride then require(script.Parent.UiModeBrandThemeContext) else nil
local AppClassicThemeGreenButtonColors = game:DefineFastFlag("AppClassicThemeGreenButtonColors", false)
local config = {
	["Color.ActionEmphasis.Background.Color3"] = Color3.fromHex("#137F1F"),
	["Color.ActionSoftEmphasis.Background.Color3"] = Color3.fromHex("#137F1F"),
	["Color.ActionSoftEmphasis.Foreground.Color3"] = Color3.fromHex("#E2F8E3")
}
local config1 = {
	["Color.ActionEmphasis.Background.Color3"] = Color3.fromHex("#12891D"),
	["Color.ActionEmphasis.Foreground.Color3"] = Color3.fromHex("#FFFFFF"),
	["Color.ActionSoftEmphasis.Background.Color3"] = Color3.fromHex("#12891D"),
	["Color.ActionSoftEmphasis.Foreground.Color3"] = Color3.fromHex("#022708")
}
local config2 = { dark = ColorMode.Dark, light = ColorMode.Light }

local function _() --[[ Line: 73 | Named "useTokenScale" ]]
	-- upvalues: SignalsReactModule (copy), GetUIScale (copy)
	return (SignalsReactModule.useSignalState(GetUIScale))
end

local function UiModeStyleProvider(p1) --[[ Line: 78 ]]
	-- upvalues: UseDeviceTypeFunction (copy), EnableDisplaySizeEngineFeature (copy), SignalsReactModule (copy), GetUIScale (copy), ReactModule (copy), UserGameSettings (copy), CryoModule (copy), AppClassicThemeGreenButtonColors (copy), ThemeName (copy), config2 (copy), ColorMode (copy), config1 (copy), config (copy), FoundationProvider (copy), SceneOverridesRegistryModule (copy), AppStyleProvider (copy)
	local UseDeviceTypeResult = UseDeviceTypeFunction()
	local UseSignalStateResult = if EnableDisplaySizeEngineFeature then SignalsReactModule.useSignalState(GetUIScale) else nil
	local UseStateResult, UseStateResult2 = ReactModule.useState({
		preferredTransparency = UserGameSettings.PreferredTransparency,
		reducedMotion = UserGameSettings.ReducedMotion,
		preferredTextSize = UserGameSettings.PreferredTextSize
	})
	ReactModule.useEffect(function() --[[ Line: 92 ]]
		-- upvalues: UseStateResult2 (copy), UserGameSettings (upval)
		local function updateSettings() --[[ Line: 93 ]]
			-- upvalues: UseStateResult2 (upval), UserGameSettings (upval)
			UseStateResult2({
				preferredTransparency = UserGameSettings.PreferredTransparency,
				reducedMotion = UserGameSettings.ReducedMotion,
				preferredTextSize = UserGameSettings.PreferredTextSize
			})
		end
		
		local Connection = UserGameSettings:GetPropertyChangedSignal("PreferredTransparency"):Connect(updateSettings)
		local Connection1 = UserGameSettings:GetPropertyChangedSignal("ReducedMotion"):Connect(updateSettings)
		local Connection2 = UserGameSettings:GetPropertyChangedSignal("PreferredTextSize"):Connect(updateSettings)
		
		return function() --[[ Line: 107 ]]
			-- upvalues: Connection (copy), Connection1 (copy), Connection2 (copy)
			Connection:Disconnect()
			Connection1:Disconnect()
			Connection2:Disconnect()
		end
	end, {})
	local Style = p1.style
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 115 ]]
		-- upvalues: CryoModule (upval), Style (copy), UseDeviceTypeResult (copy), EnableDisplaySizeEngineFeature (upval), UseStateResult (copy), UseSignalStateResult (ref)
		return CryoModule.Dictionary.join({ deviceType = Style.deviceType or UseDeviceTypeResult }, Style, {
			settings = if EnableDisplaySizeEngineFeature then CryoModule.Dictionary.join(UseStateResult, { scale = UseSignalStateResult }) else UseStateResult
		})
	end, {
		Style,
		UseDeviceTypeResult,
		UseStateResult,
		UseSignalStateResult
	})
	local HasFoundationThemeName = UseMemoResult.foundationThemeName ~= nil
	local TokenOverrides = nil
	
	if AppClassicThemeGreenButtonColors and UseMemoResult.foundationThemeName == ThemeName.Classic then
		local IsEntryMatch = config2[UseMemoResult.themeName:lower()] == ColorMode.Light
		TokenOverrides = if IsEntryMatch then config1 else config
	end
	return ReactModule.createElement(FoundationProvider, {
		device = UseMemoResult.deviceType,
		colorMode = config2[UseMemoResult.themeName:lower()],
		themeName = UseMemoResult.foundationThemeName,
		preferences = UseMemoResult.settings,
		tokenOverrides = TokenOverrides
	}, ReactModule.createElement(SceneOverridesRegistryModule, { isActive = HasFoundationThemeName }, ReactModule.createElement(AppStyleProvider, { style = UseMemoResult }, p1.children)))
end

return function(Tbl) --[[ Line: 164 | Named "ThemeProvider" ]]
	-- upvalues: ReactModule (copy), FFlagAppNavBarPerItemThemeOverride (copy), CryoModule (copy), AppearanceContextModule (copy), UiModeStyleProvider (copy), UiModeBrandThemeContextModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(Tbl.style.themeName)
	local ThemeName = if FFlagAppNavBarPerItemThemeOverride and Tbl.syncThemeFromProps then Tbl.style.themeName else UseStateResult
	local Copy = table.clone(Tbl)
	Copy.style = CryoModule.Dictionary.join(Copy.style, {
		themeName = ThemeName,
		foundationThemeName = if Tbl.foundationThemeName then Tbl.foundationThemeName else CryoModule.None
	})
	local Element = ReactModule.createElement(AppearanceContextModule.Provider, {
		value = { theme = ThemeName, setTheme = UseStateResult2 }
	}, ReactModule.createElement(UiModeStyleProvider, Copy))
	
	return if FFlagAppNavBarPerItemThemeOverride then ReactModule.createElement(UiModeBrandThemeContextModule.Provider, {
		value = { foundationThemeName = Tbl.foundationThemeName }
	}, Element) else Element
end