local parent = script.Parent
local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local flagsModule = require(foundation.Utility.Flags)
local colorModeModule = require(foundation.Enums.ColorMode)
local deviceModule = require(foundation.Enums.Device)
local styleSheetContextModule = require(parent.StyleSheetContext)
local tagsContextModule = require(parent.TagsContext)
local textSizeOffsetContextModule = require(parent.TextSizeOffsetContext)
local themeNameModule = require(foundation.Enums.ThemeName)
local tokensModule = require(parent.Tokens)
local tokensContextModule = require(parent.TokensContext)
local variantsContextModule = require(parent.VariantsContext)
local getTextSizeOffsetModule = require(foundation.Utility.getTextSizeOffset)
local usePreferencesModule = require(foundation.Providers.Preferences.usePreferences)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local getTokens = tokensModule.getTokens
local useRegistryStyleSheetModule = require(parent.useRegistryStyleSheet)
local t = {
	scale = 1,
	themeName = if flagsModule.FoundationThemeName then themeNameModule.Default else nil,
	colorMode = colorModeModule.Dark,
	device = deviceModule.Desktop
}

return function(p1)
	-- upvalues: withDefaultsModule (ref), flagsModule (ref), t (ref), variantsContextModule (ref), reactModule (ref), getTokens (ref), usePreferencesModule (ref), getTextSizeOffsetModule (ref), useRegistryStyleSheetModule (ref), tokensContextModule (ref), textSizeOffsetContextModule (ref), tagsContextModule (ref), styleSheetContextModule (ref)
	local var1 = withDefaultsModule({
		themeName = if flagsModule.FoundationThemeName then p1.themeName else nil,
		colorMode = p1.colorMode or p1.theme,
		device = p1.device,
		scale = p1.scale
	}, t)
	local var2 = variantsContextModule.useVariantsState()
	local var3 = reactModule.useMemo(function()
		-- upvalues: getTokens (copy), var1 (ref), p1 (ref), flagsModule (copy)
		return getTokens(var1.colorMode, var1.device, var1.scale, p1.tokenOverrides, if flagsModule.FoundationThemeName then var1.themeName else nil)
	end, {
		var1.colorMode,
		var1.device,
		var1.scale,
		p1.tokenOverrides,
		if flagsModule.FoundationThemeName then var1.themeName else nil
	})
	local var4 = reactModule.useMemo(function()
		-- upvalues: getTextSizeOffsetModule (copy)
		return getTextSizeOffsetModule() or 0
	end, { usePreferencesModule().preferredTextSize })
	local var5, var6 = useRegistryStyleSheetModule(if flagsModule.FoundationThemeName then var1.themeName else nil, var1.colorMode, var1.device, var1.scale, p1.tokenOverrides)
	
	return reactModule.createElement(tokensContextModule.Provider, { value = var3 }, {
		TextSizeOffsetContext = reactModule.createElement(textSizeOffsetContextModule.Provider, { value = var4 }, {
			VariantsContext = reactModule.createElement(variantsContextModule.Provider, { value = var2 }, {
				TagsContext = reactModule.createElement(tagsContextModule.Provider, { value = var6 }, reactModule.createElement(styleSheetContextModule.Provider, { value = var5 }, p1.children)),
				StyleSheet = reactModule.createElement("StyleLink", { StyleSheet = var5 })
			})
		})
	})
end