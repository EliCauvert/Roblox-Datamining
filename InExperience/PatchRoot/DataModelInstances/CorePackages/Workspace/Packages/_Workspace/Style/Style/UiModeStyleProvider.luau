local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local parent = script:FindFirstAncestor("Style").Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local useDeviceType = require(parent.RobloxAppHooks).useDeviceType
local appearanceContextModule = require(script.Parent.AppearanceContext)
local sceneOverridesRegistryModule = require(script.Parent.SceneOverridesRegistry)
local appStyleProvider = require(parent.UIBlox).App.Style.AppStyleProvider
local foundationModule = require(parent.Foundation)
local foundationProvider = foundationModule.FoundationProvider
local colorMode = foundationModule.Enums.ColorMode
local getUIScale = require(parent.Display).GetDisplayStore(false).getUIScale
local enableDisplaySize = game:DefineFastFlag("LuaAppEnableWindowsHandheldTokenScale", false) and game:GetEngineFeature("EnableDisplaySize") or game:DefineFastFlag("DebugLuaAppEnableTokenScale", false)
local fFlagAppNavBarPerItemThemeOverride = require(parent.SharedFlags).FFlagAppNavBarPerItemThemeOverride
local var8 = if fFlagAppNavBarPerItemThemeOverride then require(script.Parent.UiModeTokenOverridesContext) else nil
local t = { dark = colorMode.Dark, light = colorMode.Light }

local function _()
	-- upvalues: signalsReactModule (ref), getUIScale (ref)
	return signalsReactModule.useSignalState(getUIScale)
end

local function UiModeStyleProvider(p0)
	-- upvalues: useDeviceType (ref), enableDisplaySize (ref), signalsReactModule (ref), getUIScale (ref), reactModule (ref), userGameSettingsService (ref), cryoModule (ref), foundationProvider (ref), t (ref), sceneOverridesRegistryModule (ref), appStyleProvider (ref)
	local var11 = useDeviceType()
	local var12 = if enableDisplaySize then signalsReactModule.useSignalState(getUIScale) else nil
	local var13, var14 = reactModule.useState({
		preferredTransparency = userGameSettingsService.PreferredTransparency,
		reducedMotion = userGameSettingsService.ReducedMotion,
		preferredTextSize = userGameSettingsService.PreferredTextSize
	})
	reactModule.useEffect(function()
		-- upvalues: var14 (ref), userGameSettingsService (copy)
		local function updateSettings()
			-- upvalues: var14 (copy), userGameSettingsService (copy)
			var14({
				preferredTransparency = userGameSettingsService.PreferredTransparency,
				reducedMotion = userGameSettingsService.ReducedMotion,
				preferredTextSize = userGameSettingsService.PreferredTextSize
			})
		end
		
		local var17 = userGameSettingsService:GetPropertyChangedSignal("PreferredTransparency"):Connect(updateSettings)
		local var18 = userGameSettingsService:GetPropertyChangedSignal("ReducedMotion"):Connect(updateSettings)
		local var19 = userGameSettingsService:GetPropertyChangedSignal("PreferredTextSize"):Connect(updateSettings)
		
		return function()
			-- upvalues: var17 (ref), var18 (ref), var19 (ref)
			var17:Disconnect()
			var18:Disconnect()
			var19:Disconnect()
		end
	end, {})
	local style = p0.style
	local var15 = reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), style (ref), var11 (ref), enableDisplaySize (copy), var13 (ref), var12 (write)
		return cryoModule.Dictionary.join({ deviceType = style.deviceType or var11 }, style, {
			settings = if enableDisplaySize then cryoModule.Dictionary.join(var13, { scale = var12 }) else var13
		})
	end, { style, var11, var13, var12 })
	
	return reactModule.createElement(foundationProvider, {
		device = var15.deviceType,
		theme = t[var15.themeName:lower()],
		preferences = var15.settings,
		tokenOverrides = var15.tokenOverrides
	}, reactModule.createElement(sceneOverridesRegistryModule, { isActive = var15.tokenOverrides ~= nil }, reactModule.createElement(appStyleProvider, { style = var15 }, p0.children)))
end

return function(p1)
	-- upvalues: reactModule (ref), fFlagAppNavBarPerItemThemeOverride (ref), t (ref), cryoModule (ref), appearanceContextModule (ref), UiModeStyleProvider (ref), var8 (ref)
	local var20, var21 = reactModule.useState(p1.style.themeName)
	local var22 = if fFlagAppNavBarPerItemThemeOverride and p1.syncThemeFromProps then p1.style.themeName else var20
	local cloned = table.clone(p1)
	local tokenOverrides = p1.style.tokenOverrides
	
	if p1.tokenOverridesByTheme then
		tokenOverrides = p1.tokenOverridesByTheme[t[var22:lower()]] or tokenOverrides
	end
	cloned.style = cryoModule.Dictionary.join(cloned.style, {
		themeName = var22,
		tokenOverrides = tokenOverrides or cryoModule.None
	})
	local var24 = reactModule.createElement(appearanceContextModule.Provider, { value = { theme = var22, setTheme = var21 } }, reactModule.createElement(UiModeStyleProvider, cloned))
	
	return if fFlagAppNavBarPerItemThemeOverride then reactModule.createElement(var8.Provider, { value = p1.tokenOverridesByTheme or {} }, var24) else var24
end