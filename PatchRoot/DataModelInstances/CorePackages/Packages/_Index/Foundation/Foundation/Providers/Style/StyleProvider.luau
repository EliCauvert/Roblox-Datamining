-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:27 2026 Pacific Standard Time.

local parent = script.Parent
local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Enums.ColorMode)
local deviceModule = require(foundation.Enums.Device)
local styleSheetContextModule = require(parent.StyleSheetContext)
local tagsContextModule = require(parent.TagsContext)
local textSizeOffsetContextModule = require(parent.TextSizeOffsetContext)
local themeModule = require(foundation.Enums.Theme)
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
	theme = themeModule.Dark,
	device = deviceModule.Desktop
}

return function(p0) --[[ line: 55 | named "StyleProvider" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), variantsContextModule (ref), reactModule (ref), getTokens (ref), usePreferencesModule (ref), getTextSizeOffsetModule (ref), useRegistryStyleSheetModule (ref), tokensContextModule (ref), textSizeOffsetContextModule (ref), tagsContextModule (ref), styleSheetContextModule (ref)
	local var15 = withDefaultsModule({
		theme = p0.colorMode or p0.theme,
		device = p0.device,
		scale = p0.scale
	}, t)
	local var16 = variantsContextModule.useVariantsState()
	local var17 = reactModule.useMemo(function() --[[ line: 64 ]]
		-- upvalues: getTokens (copy), var15 (ref), p0 (ref)
		return getTokens(var15.theme, var15.device, var15.scale, p0.tokenOverrides)
	end, {
		var15.device,
		var15.theme,
		var15.scale,
		p0.tokenOverrides
	})
	local var18 = reactModule.useMemo(function() --[[ line: 71 ]]
		-- upvalues: getTextSizeOffsetModule (copy)
		return getTextSizeOffsetModule() or 0
	end, { usePreferencesModule().preferredTextSize })
	local var19, var20 = useRegistryStyleSheetModule(var15.theme, var15.device, var15.scale, p0.tokenOverrides)
	
	return reactModule.createElement(tokensContextModule.Provider, { value = var17 }, {
		TextSizeOffsetContext = reactModule.createElement(textSizeOffsetContextModule.Provider, { value = var18 }, {
			VariantsContext = reactModule.createElement(variantsContextModule.Provider, { value = var16 }, {
				TagsContext = reactModule.createElement(tagsContextModule.Provider, { value = var20 }, reactModule.createElement(styleSheetContextModule.Provider, { value = var19 }, p0.children)),
				StyleSheet = reactModule.createElement("StyleLink", { StyleSheet = var19 })
			})
		})
	})
end