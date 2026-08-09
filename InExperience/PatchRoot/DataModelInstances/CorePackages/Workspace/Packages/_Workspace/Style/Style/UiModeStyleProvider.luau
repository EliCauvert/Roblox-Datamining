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
local theme = foundationModule.Enums.Theme
local getUIScale = require(parent.Display).GetDisplayStore(false).getUIScale
local enableDisplaySize = game:DefineFastFlag("LuaAppEnableWindowsHandheldTokenScale", false) and game:GetEngineFeature("EnableDisplaySize")
local debugLuaAppEnableTokenScale = game:DefineFastFlag("DebugLuaAppEnableTokenScale", false)
local fFlagEnableCoreContentTheme = require(parent.SharedFlags).FFlagEnableCoreContentTheme
local fFlagFixUiModeStyleProviderTreeShapeRace = require(parent.SharedFlags).FFlagFixUiModeStyleProviderTreeShapeRace
local enableDisplaySize_1 = enableDisplaySize or debugLuaAppEnableTokenScale
local t = { dark = theme.Dark, light = theme.Light }

local function _() --[[ line: 52 | named "useTokenScale" ]]
	-- upvalues: signalsReactModule (ref), getUIScale (ref)
	return signalsReactModule.useSignalState(getUIScale)
end

local function UiModeStyleProvider(p0) --[[ line: 57 ]]
	-- upvalues: useDeviceType (ref), enableDisplaySize_1 (ref), signalsReactModule (ref), getUIScale (ref), reactModule (ref), userGameSettingsService (ref), cryoModule (ref), fFlagFixUiModeStyleProviderTreeShapeRace (ref), foundationProvider (ref), t (ref), fFlagEnableCoreContentTheme (ref), sceneOverridesRegistryModule (ref), appStyleProvider (ref)
	local var17
	local var12 = useDeviceType()
	local var13 = if enableDisplaySize_1 then signalsReactModule.useSignalState(getUIScale) else nil
	local var14, var15 = reactModule.useState({
		preferredTransparency = userGameSettingsService.PreferredTransparency,
		reducedMotion = userGameSettingsService.ReducedMotion,
		preferredTextSize = userGameSettingsService.PreferredTextSize
	})
	reactModule.useEffect(function() --[[ line: 71 ]]
		-- upvalues: var15 (ref), userGameSettingsService (copy)
		local function updateSettings() --[[ line: 72 ]]
			-- upvalues: var15 (copy), userGameSettingsService (copy)
			var15({
				preferredTransparency = userGameSettingsService.PreferredTransparency,
				reducedMotion = userGameSettingsService.ReducedMotion,
				preferredTextSize = userGameSettingsService.PreferredTextSize
			})
		end
		
		local var21 = userGameSettingsService:GetPropertyChangedSignal("PreferredTransparency"):Connect(updateSettings)
		local var22 = userGameSettingsService:GetPropertyChangedSignal("ReducedMotion"):Connect(updateSettings)
		local var23 = userGameSettingsService:GetPropertyChangedSignal("PreferredTextSize"):Connect(updateSettings)
		
		return function() --[[ line: 86 ]]
			-- upvalues: var21 (ref), var22 (ref), var23 (ref)
			var21:Disconnect()
			var22:Disconnect()
			var23:Disconnect()
		end
	end, {})
	local style = p0.style
	local var16 = reactModule.useMemo(function() --[[ line: 94 ]]
		-- upvalues: cryoModule (copy), style (ref), var12 (ref), enableDisplaySize_1 (copy), var14 (ref), var13 (write)
		return cryoModule.Dictionary.join({ deviceType = style.deviceType or var12 }, style, {
			settings = if enableDisplaySize_1 then cryoModule.Dictionary.join(var14, { scale = var13 }) else var14
		})
	end, { style, var12, var14, var13 })
	
	if fFlagFixUiModeStyleProviderTreeShapeRace then
		var17 = var16.tokenOverrides ~= nil
		var17 = nil
	else
		var17 = nil
	end
	local var19
	local createElement = reactModule.createElement
	local t_1 = {
		device = var16.deviceType,
		theme = t[var16.themeName:lower()],
		preferences = var16.settings,
		tokenOverrides = if fFlagEnableCoreContentTheme then var16.tokenOverrides else nil
	}
	
	if fFlagFixUiModeStyleProviderTreeShapeRace then
		var19 = fFlagEnableCoreContentTheme
		
		if not var19 then
			var19 = var16.tokenOverrides ~= nil
			var19 = nil
		end
	else
		var19 = fFlagEnableCoreContentTheme and var16.tokenOverrides ~= nil
	end
	return createElement(foundationProvider, t_1, if var19 then reactModule.createElement(sceneOverridesRegistryModule, if fFlagFixUiModeStyleProviderTreeShapeRace then { isActive = var17 } else nil, reactModule.createElement(appStyleProvider, { style = var16 }, p0.children)) else reactModule.createElement(appStyleProvider, { style = var16 }, p0.children))
end

return function(p1) --[[ line: 138 | named "ThemeProvider" ]]
	-- upvalues: reactModule (ref), fFlagEnableCoreContentTheme (ref), t (ref), cryoModule (ref), themeContextModule (ref), UiModeStyleProvider (ref)
	local var24, var25 = reactModule.useState(p1.style.themeName)
	local cloned = table.clone(p1)
	local var27 = if fFlagEnableCoreContentTheme then p1.style.tokenOverrides else nil
	
	if fFlagEnableCoreContentTheme and p1.tokenOverridesByTheme then
		var27 = p1.tokenOverridesByTheme[t[var24:lower()]] or var27
	end
	cloned.style = cryoModule.Dictionary.join(cloned.style, {
		themeName = var24,
		tokenOverrides = if fFlagEnableCoreContentTheme then var27 or cryoModule.None else nil
	})
	
	return reactModule.createElement(themeContextModule.Provider, { value = { theme = var24, setTheme = var25 } }, reactModule.createElement(UiModeStyleProvider, cloned))
end