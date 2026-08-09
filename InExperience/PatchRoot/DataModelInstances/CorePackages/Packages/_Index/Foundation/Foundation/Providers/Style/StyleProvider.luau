local parent = script.Parent
local foundation = script:FindFirstAncestor("Foundation")
local parent_1 = foundation.Parent
local dashModule = require(parent_1.Dash)
local reactModule = require(parent_1.React)
local deviceModule = require(foundation.Enums.Device)
local flagsModule = require(foundation.Utility.Flags)
local styleSheetModule = require(foundation.StyleSheet)
local styleSheetContextModule = require(parent.StyleSheetContext)
local tagsContextModule = require(parent.TagsContext)
local textSizeOffsetContextModule = require(parent.TextSizeOffsetContext)
local themeModule = require(foundation.Enums.Theme)
local tokensModule = require(parent.Tokens)
local tokensContextModule = require(parent.TokensContext)
local variantsContextModule = require(parent.VariantsContext)
local getTextSizeOffsetModule = require(foundation.Utility.getTextSizeOffset)
local usePreferencesModule = require(foundation.Providers.Preferences.usePreferences)
local useTagsStateModule = require(parent.useTagsState)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local getTokens = tokensModule.getTokens
local var17 = if flagsModule.FoundationUseStyleSheetRegistry then require(parent.useRegistryStyleSheet) else nil
local t = {
	scale = 1,
	theme = themeModule.Dark,
	device = deviceModule.Desktop
}

function StyleSheetContextWrapper(p0) --[[ line: 55 ]]
	-- upvalues: reactModule (ref), styleSheetContextModule (ref), dashModule (ref)
	local var19, var20 = reactModule.useState(nil)
	
	if p0.setStyleSheetRef and p0.setStyleSheetRef.current ~= var20 then
		p0.setStyleSheetRef.current = var20
	end
	return reactModule.createElement(styleSheetContextModule.Provider, { value = var19 or dashModule.None }, p0.children)
end

return function(p1) --[[ line: 69 | named "StyleProvider" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), flagsModule (ref), reactModule (ref), useTagsStateModule (ref), variantsContextModule (ref), getTokens (ref), usePreferencesModule (ref), getTextSizeOffsetModule (ref), var17 (ref), tokensContextModule (ref), textSizeOffsetContextModule (ref), tagsContextModule (ref), styleSheetContextModule (ref), styleSheetModule (ref)
	local var21 = withDefaultsModule({ theme = p1.theme, device = p1.device, scale = p1.scale }, t)
	local var22 = if not flagsModule.FoundationUseStyleSheetRegistry then reactModule.useRef(nil) else nil
	local var23 = nil
	local var24 = nil
	
	if not flagsModule.FoundationUseStyleSheetRegistry then
		local var25, var26 = useTagsStateModule()
		var23 = var25
		var24 = var26
	end
	local var27 = variantsContextModule.useVariantsState()
	local var28 = reactModule.useMemo(function() --[[ line: 86 ]]
		-- upvalues: getTokens (copy), var21 (ref), p1 (ref)
		return getTokens(var21.theme, var21.device, var21.scale, p1.tokenOverrides)
	end, {
		var21.device,
		var21.theme,
		var21.scale,
		p1.tokenOverrides
	})
	local var29 = reactModule.useMemo(function() --[[ line: 93 ]]
		-- upvalues: getTextSizeOffsetModule (copy)
		return getTextSizeOffsetModule() or 0
	end, { usePreferencesModule().preferredTextSize })
	local var30 = nil
	local var31 = nil
	
	if flagsModule.FoundationUseStyleSheetRegistry then
		local var32, var33 = var17(var21.theme, var21.device, var21.scale, p1.tokenOverrides)
		var30 = var32
		var31 = var33
	end
	return reactModule.createElement(tokensContextModule.Provider, { value = var28 }, {
		TextSizeOffsetContext = reactModule.createElement(textSizeOffsetContextModule.Provider, { value = var29 }, {
			VariantsContext = reactModule.createElement(variantsContextModule.Provider, { value = var27 }, {
				TagsContext = reactModule.createElement(tagsContextModule.Provider, {
					value = if flagsModule.FoundationUseStyleSheetRegistry then var31 else var24
				}, if flagsModule.FoundationUseStyleSheetRegistry then reactModule.createElement(styleSheetContextModule.Provider, { value = var30 }, p1.children) else reactModule.createElement(StyleSheetContextWrapper, { setStyleSheetRef = var22 }, p1.children)),
				StyleSheet = if flagsModule.FoundationUseStyleSheetRegistry then reactModule.createElement("StyleLink", { StyleSheet = var30 }) else reactModule.createElement(styleSheetModule, {
					theme = var21.theme,
					device = var21.device,
					scale = var21.scale,
					tags = var23,
					derives = p1.derives,
					setStyleSheetRef = var22,
					tokenOverrides = p1.tokenOverrides
				})
			})
		})
	})
end