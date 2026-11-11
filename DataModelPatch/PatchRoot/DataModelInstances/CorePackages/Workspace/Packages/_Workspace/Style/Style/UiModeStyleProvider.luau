local UserGameSettings = UserSettings():GetService("UserGameSettings")
local Parent = script:FindFirstAncestor("Style").Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local UseDeviceTypeFunction = require(Parent.RobloxAppHooks).useDeviceType
local ThemeContextModule = require(script.Parent.ThemeContext)
local SceneOverridesRegistryModule = require(script.Parent.SceneOverridesRegistry)
local AppStyleProvider = require(Parent.UIBlox).App.Style.AppStyleProvider
local FoundationModule = require(Parent.Foundation)
local FoundationProvider = FoundationModule.FoundationProvider
local Theme = FoundationModule.Enums.Theme
local GetUIScale = require(Parent.Display).GetDisplayStore(false).getUIScale
local DebugLuaAppEnableTokenScale = game:DefineFastFlag("DebugLuaAppEnableTokenScale", false)
local FFlagEnableCoreContentTheme = require(Parent.SharedFlags).FFlagEnableCoreContentTheme
local FFlagFixUiModeStyleProviderTreeShapeRace = require(Parent.SharedFlags).FFlagFixUiModeStyleProviderTreeShapeRace
local EnableDisplaySizeEngineFeature = game:DefineFastFlag("LuaAppEnableWindowsHandheldTokenScale", false) and game:GetEngineFeature("EnableDisplaySize") or DebugLuaAppEnableTokenScale
local config = { dark = Theme.Dark, light = Theme.Light }

local function _()
	-- upvalues: SignalsReactModule (copy), GetUIScale (copy)
	return (SignalsReactModule.useSignalState(GetUIScale))
end

local function UiModeStyleProvider(p1)
	-- upvalues: UseDeviceTypeFunction (copy), EnableDisplaySizeEngineFeature (copy), SignalsReactModule (copy), GetUIScale (copy), ReactModule (copy), UserGameSettings (copy), CryoModule (copy), FFlagFixUiModeStyleProviderTreeShapeRace (copy), FoundationProvider (copy), config (copy), FFlagEnableCoreContentTheme (copy), SceneOverridesRegistryModule (copy), AppStyleProvider (copy)
	local UseDeviceTypeResult = UseDeviceTypeFunction()
	local UseSignalStateResult = if EnableDisplaySizeEngineFeature then SignalsReactModule.useSignalState(GetUIScale) else nil
	local UseStateResult, UseStateResult2 = ReactModule.useState({
		preferredTransparency = UserGameSettings.PreferredTransparency,
		reducedMotion = UserGameSettings.ReducedMotion,
		preferredTextSize = UserGameSettings.PreferredTextSize
	})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), UserGameSettings (upval)
		local function updateSettings()
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
		
		return function()
			-- upvalues: Connection (copy), Connection1 (copy), Connection2 (copy)
			Connection:Disconnect()
			Connection1:Disconnect()
			Connection2:Disconnect()
		end
	end, {})
	local Style = p1.style
	local UseMemoResult = ReactModule.useMemo(function()
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
	local HasTokenOverrides = if FFlagFixUiModeStyleProviderTreeShapeRace then UseMemoResult.tokenOverrides ~= nil else nil
	local FFlagEnableCoreContentTheme1 = if FFlagFixUiModeStyleProviderTreeShapeRace then FFlagEnableCoreContentTheme or UseMemoResult.tokenOverrides ~= nil else FFlagEnableCoreContentTheme and UseMemoResult.tokenOverrides ~= nil
	
	return ReactModule.createElement(FoundationProvider, {
		device = UseMemoResult.deviceType,
		theme = config[UseMemoResult.themeName:lower()],
		preferences = UseMemoResult.settings,
		tokenOverrides = if FFlagEnableCoreContentTheme then UseMemoResult.tokenOverrides else nil
	}, if FFlagEnableCoreContentTheme1 then ReactModule.createElement(SceneOverridesRegistryModule, if FFlagFixUiModeStyleProviderTreeShapeRace then { isActive = HasTokenOverrides } else nil, ReactModule.createElement(AppStyleProvider, { style = UseMemoResult }, p1.children)) else ReactModule.createElement(AppStyleProvider, { style = UseMemoResult }, p1.children))
end

return function(Tbl)
	-- upvalues: ReactModule (copy), FFlagEnableCoreContentTheme (copy), config (copy), CryoModule (copy), ThemeContextModule (copy), UiModeStyleProvider (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(Tbl.style.themeName)
	local Copy = table.clone(Tbl)
	local TokenOverrides = if FFlagEnableCoreContentTheme then Tbl.style.tokenOverrides else nil
	
	if FFlagEnableCoreContentTheme and Tbl.tokenOverridesByTheme then
		TokenOverrides = Tbl.tokenOverridesByTheme[config[UseStateResult:lower()]] or TokenOverrides
	end
	Copy.style = CryoModule.Dictionary.join(Copy.style, {
		themeName = UseStateResult,
		tokenOverrides = if FFlagEnableCoreContentTheme then if TokenOverrides then TokenOverrides else CryoModule.None else nil
	})
	
	return ReactModule.createElement(ThemeContextModule.Provider, {
		value = { theme = UseStateResult, setTheme = UseStateResult2 }
	}, ReactModule.createElement(UiModeStyleProvider, Copy))
end