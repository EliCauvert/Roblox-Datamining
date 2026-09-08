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
local var1 = if fFlagAppNavBarPerItemThemeOverride then require(script.Parent.UiModeBrandThemeContext) else nil
local t = { dark = colorMode.Dark, light = colorMode.Light }

local function _()
	-- upvalues: signalsReactModule (ref), getUIScale (ref)
	return signalsReactModule.useSignalState(getUIScale)
end

local function UiModeStyleProvider(p1)
	-- upvalues: useDeviceType (ref), enableDisplaySize (ref), signalsReactModule (ref), getUIScale (ref), reactModule (ref), userGameSettingsService (ref), cryoModule (ref), foundationProvider (ref), t (ref), sceneOverridesRegistryModule (ref), appStyleProvider (ref)
	local var2 = useDeviceType()
	local var3 = if enableDisplaySize then signalsReactModule.useSignalState(getUIScale) else nil
	local var4, var5 = reactModule.useState({
		preferredTransparency = userGameSettingsService.PreferredTransparency,
		reducedMotion = userGameSettingsService.ReducedMotion,
		preferredTextSize = userGameSettingsService.PreferredTextSize
	})
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), userGameSettingsService (copy)
		local function updateSettings()
			-- upvalues: var5 (copy), userGameSettingsService (copy)
			var5({
				preferredTransparency = userGameSettingsService.PreferredTransparency,
				reducedMotion = userGameSettingsService.ReducedMotion,
				preferredTextSize = userGameSettingsService.PreferredTextSize
			})
		end
		
		local var6 = userGameSettingsService:GetPropertyChangedSignal("PreferredTransparency"):Connect(updateSettings)
		local var7 = userGameSettingsService:GetPropertyChangedSignal("ReducedMotion"):Connect(updateSettings)
		local var8 = userGameSettingsService:GetPropertyChangedSignal("PreferredTextSize"):Connect(updateSettings)
		
		return function()
			-- upvalues: var6 (ref), var7 (ref), var8 (ref)
			var6:Disconnect()
			var7:Disconnect()
			var8:Disconnect()
		end
	end, {})
	local style = p1.style
	local var6 = reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), style (ref), var2 (ref), enableDisplaySize (copy), var4 (ref), var3 (write)
		return cryoModule.Dictionary.join({ deviceType = style.deviceType or var2 }, style, {
			settings = if enableDisplaySize then cryoModule.Dictionary.join(var4, { scale = var3 }) else var4
		})
	end, { style, var2, var4, var3 })
	
	return reactModule.createElement(foundationProvider, {
		device = var6.deviceType,
		colorMode = t[var6.themeName:lower()],
		themeName = var6.foundationThemeName,
		preferences = var6.settings,
		tokenOverrides = var6.tokenOverrides
	}, reactModule.createElement(sceneOverridesRegistryModule, {
		isActive = if var6.tokenOverrides == nil then var6.foundationThemeName ~= nil else true
	}, reactModule.createElement(appStyleProvider, { style = var6 }, p1.children)))
end

return function(p1)
	-- upvalues: reactModule (ref), fFlagAppNavBarPerItemThemeOverride (ref), t (ref), cryoModule (ref), appearanceContextModule (ref), UiModeStyleProvider (ref), var1 (ref)
	local var2, var3 = reactModule.useState(p1.style.themeName)
	local var4 = if fFlagAppNavBarPerItemThemeOverride and p1.syncThemeFromProps then p1.style.themeName else var2
	local cloned = table.clone(p1)
	local tokenOverrides = p1.style.tokenOverrides
	
	if p1.tokenOverridesByTheme then
		tokenOverrides = p1.tokenOverridesByTheme[t[var4:lower()]] or tokenOverrides
	end
	cloned.style = cryoModule.Dictionary.join(cloned.style, {
		themeName = var4,
		tokenOverrides = tokenOverrides or cryoModule.None,
		foundationThemeName = if p1.foundationThemeName then p1.foundationThemeName else cryoModule.None
	})
	local var5 = reactModule.createElement(appearanceContextModule.Provider, { value = { theme = var4, setTheme = var3 } }, reactModule.createElement(UiModeStyleProvider, cloned))
	
	return if fFlagAppNavBarPerItemThemeOverride then reactModule.createElement(var1.Provider, {
		value = {
			tokenOverridesByTheme = p1.tokenOverridesByTheme or {},
			foundationThemeName = p1.foundationThemeName
		}
	}, var5) else var5
end