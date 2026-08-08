local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local parent = script:FindFirstAncestor("Style").Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local useDeviceType = require(parent.RobloxAppHooks).useDeviceType
local themeContextModule = require(script.Parent.ThemeContext)
local sceneOverridesRegistryModule = require(script.Parent.SceneOverridesRegistry)
local appStyleProvider = require(parent.UIBlox).App.Style.AppStyleProvider
local foundationModule = require(parent.Foundation)
local foundationProvider = foundationModule.FoundationProvider
local colorMode = foundationModule.Enums.ColorMode
local getUIScale = require(parent.Display).GetDisplayStore(false).getUIScale
local enableDisplaySize = game:DefineFastFlag("LuaAppEnableWindowsHandheldTokenScale", false) and game:GetEngineFeature("EnableDisplaySize") or game:DefineFastFlag("DebugLuaAppEnableTokenScale", false)
local fFlagAppNavBarPerItemThemeOverride = require(parent.SharedFlags).FFlagAppNavBarPerItemThemeOverride
local t = { dark = colorMode.Dark, light = colorMode.Light }

local function _() --[[ line: 52 | named "useTokenScale" ]]
	-- upvalues: signalsReactModule (ref), getUIScale (ref)
	return signalsReactModule.useSignalState(getUIScale)
end

local function UiModeStyleProvider(p0) --[[ line: 57 ]]
	-- upvalues: useDeviceType (ref), enableDisplaySize (ref), signalsReactModule (ref), getUIScale (ref), reactModule (ref), userGameSettingsService (ref), cryoModule (ref), foundationProvider (ref), t (ref), sceneOverridesRegistryModule (ref), appStyleProvider (ref)
	local var10 = useDeviceType()
	local var11 = if enableDisplaySize then signalsReactModule.useSignalState(getUIScale) else nil
	local var12, var13 = reactModule.useState({
		preferredTransparency = userGameSettingsService.PreferredTransparency,
		reducedMotion = userGameSettingsService.ReducedMotion,
		preferredTextSize = userGameSettingsService.PreferredTextSize
	})
	reactModule.useEffect(function() --[[ line: 71 ]]
		-- upvalues: var13 (ref), userGameSettingsService (copy)
		local function updateSettings() --[[ line: 72 ]]
			-- upvalues: var13 (copy), userGameSettingsService (copy)
			var13({
				preferredTransparency = userGameSettingsService.PreferredTransparency,
				reducedMotion = userGameSettingsService.ReducedMotion,
				preferredTextSize = userGameSettingsService.PreferredTextSize
			})
		end
		
		local var16 = userGameSettingsService:GetPropertyChangedSignal("PreferredTransparency"):Connect(updateSettings)
		local var17 = userGameSettingsService:GetPropertyChangedSignal("ReducedMotion"):Connect(updateSettings)
		local var18 = userGameSettingsService:GetPropertyChangedSignal("PreferredTextSize"):Connect(updateSettings)
		
		return function() --[[ line: 86 ]]
			-- upvalues: var16 (ref), var17 (ref), var18 (ref)
			var16:Disconnect()
			var17:Disconnect()
			var18:Disconnect()
		end
	end, {})
	local style = p0.style
	local var14 = reactModule.useMemo(function() --[[ line: 94 ]]
		-- upvalues: cryoModule (copy), style (ref), var10 (ref), enableDisplaySize (copy), var12 (ref), var11 (write)
		return cryoModule.Dictionary.join({ deviceType = style.deviceType or var10 }, style, {
			settings = if enableDisplaySize then cryoModule.Dictionary.join(var12, { scale = var11 }) else var12
		})
	end, { style, var10, var12, var11 })
	
	return reactModule.createElement(foundationProvider, {
		device = var14.deviceType,
		theme = t[var14.themeName:lower()],
		preferences = var14.settings,
		tokenOverrides = var14.tokenOverrides
	}, reactModule.createElement(sceneOverridesRegistryModule, { isActive = var14.tokenOverrides ~= nil }, reactModule.createElement(appStyleProvider, { style = var14 }, p0.children)))
end

return function(p1) --[[ line: 132 | named "ThemeProvider" ]]
	-- upvalues: reactModule (ref), fFlagAppNavBarPerItemThemeOverride (ref), t (ref), cryoModule (ref), themeContextModule (ref), UiModeStyleProvider (ref)
	local var19, var20 = reactModule.useState(p1.style.themeName)
	local var21 = if fFlagAppNavBarPerItemThemeOverride and p1.syncThemeFromProps then p1.style.themeName else var19
	local cloned = table.clone(p1)
	local tokenOverrides = p1.style.tokenOverrides
	
	if p1.tokenOverridesByTheme then
		tokenOverrides = p1.tokenOverridesByTheme[t[var21:lower()]] or tokenOverrides
	end
	cloned.style = cryoModule.Dictionary.join(cloned.style, {
		themeName = var21,
		tokenOverrides = tokenOverrides or cryoModule.None
	})
	local var23 = reactModule.createElement(themeContextModule.Provider, { value = { theme = var21, setTheme = var20 } }, reactModule.createElement(UiModeStyleProvider, cloned))
	
	return if fFlagAppNavBarPerItemThemeOverride then reactModule.createElement(require(script.Parent.UiModeTokenOverridesContext).Provider, { value = p1.tokenOverridesByTheme or {} }, var23) else var23
end