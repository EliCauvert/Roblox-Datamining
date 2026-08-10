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

return function(p0) --[[ line: 60 | named "StyleProvider" ]]
	-- upvalues: withDefaultsModule (ref), flagsModule (ref), t (ref), variantsContextModule (ref), reactModule (ref), getTokens (ref), usePreferencesModule (ref), getTextSizeOffsetModule (ref), useRegistryStyleSheetModule (ref), tokensContextModule (ref), textSizeOffsetContextModule (ref), tagsContextModule (ref), styleSheetContextModule (ref)
	local var17 = withDefaultsModule({
		themeName = if flagsModule.FoundationThemeName then p0.themeName else nil,
		colorMode = p0.colorMode or p0.theme,
		device = p0.device,
		scale = p0.scale
	}, t)
	local var18 = variantsContextModule.useVariantsState()
	local var19 = reactModule.useMemo(function() --[[ line: 71 ]]
		-- upvalues: getTokens (copy), var17 (ref), p0 (ref), flagsModule (copy)
		return getTokens(var17.colorMode, var17.device, var17.scale, p0.tokenOverrides, if flagsModule.FoundationThemeName then var17.themeName else nil)
	end, {
		var17.colorMode,
		var17.device,
		var17.scale,
		p0.tokenOverrides,
		if flagsModule.FoundationThemeName then var17.themeName else nil
	})
	local var20 = reactModule.useMemo(function() --[[ line: 92 ]]
		-- upvalues: getTextSizeOffsetModule (copy)
		return getTextSizeOffsetModule() or 0
	end, { usePreferencesModule().preferredTextSize })
	local var21, var22 = useRegistryStyleSheetModule(if flagsModule.FoundationThemeName then var17.themeName else nil, var17.colorMode, var17.device, var17.scale, p0.tokenOverrides)
	
	return reactModule.createElement(tokensContextModule.Provider, { value = var19 }, {
		TextSizeOffsetContext = reactModule.createElement(textSizeOffsetContextModule.Provider, { value = var20 }, {
			VariantsContext = reactModule.createElement(variantsContextModule.Provider, { value = var18 }, {
				TagsContext = reactModule.createElement(tagsContextModule.Provider, { value = var22 }, reactModule.createElement(styleSheetContextModule.Provider, { value = var21 }, p0.children)),
				StyleSheet = reactModule.createElement("StyleLink", { StyleSheet = var21 })
			})
		})
	})
end