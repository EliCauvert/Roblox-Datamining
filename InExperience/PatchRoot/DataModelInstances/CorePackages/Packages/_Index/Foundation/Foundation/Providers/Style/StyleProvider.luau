local Parent = script.Parent
local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local StyleSheetContextModule = require(Parent.StyleSheetContext)
local TagsContextModule = require(Parent.TagsContext)
local TextSizeOffsetContextModule = require(Parent.TextSizeOffsetContext)
local TokensContextModule = require(Parent.TokensContext)
local VariantsContextModule = require(Parent.VariantsContext)
local GetTextSizeOffsetModule = require(Foundation.Utility.getTextSizeOffset)
local UsePreferencesModule = require(Foundation.Providers.Preferences.usePreferences)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local GetTokensFunction = require(Parent.Tokens).getTokens
local UseRegistryStyleSheetModule = require(Parent.useRegistryStyleSheet)
local config = {
	scale = 1,
	themeName = require(Foundation.Enums.ThemeName).Default,
	colorMode = require(Foundation.Enums.ColorMode).Dark,
	device = require(Foundation.Enums.Device).Desktop
}

return function(p1)
	-- upvalues: WithDefaultsModule (copy), config (copy), VariantsContextModule (copy), ReactModule (copy), GetTokensFunction (copy), UsePreferencesModule (copy), GetTextSizeOffsetModule (copy), UseRegistryStyleSheetModule (copy), TokensContextModule (copy), TextSizeOffsetContextModule (copy), TagsContextModule (copy), StyleSheetContextModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule({
		themeName = p1.themeName,
		colorMode = p1.colorMode or p1.theme,
		device = p1.device,
		scale = p1.scale
	}, config)
	local UseVariantsStateResult = VariantsContextModule.useVariantsState()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: GetTokensFunction (upval), WithDefaultsModuleResult (copy), p1 (copy)
		return GetTokensFunction(WithDefaultsModuleResult.colorMode, WithDefaultsModuleResult.device, WithDefaultsModuleResult.scale, p1.tokenOverrides, WithDefaultsModuleResult.themeName)
	end, {
		WithDefaultsModuleResult.colorMode,
		WithDefaultsModuleResult.device,
		WithDefaultsModuleResult.scale,
		p1.tokenOverrides,
		WithDefaultsModuleResult.themeName
	})
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: GetTextSizeOffsetModule (upval)
		return GetTextSizeOffsetModule() or 0
	end, { UsePreferencesModule().preferredTextSize })
	local UseRegistryStyleSheetModuleResult, UseRegistryStyleSheetModuleResult2 = UseRegistryStyleSheetModule(WithDefaultsModuleResult.themeName, WithDefaultsModuleResult.colorMode, WithDefaultsModuleResult.device, WithDefaultsModuleResult.scale, p1.tokenOverrides)
	
	return ReactModule.createElement(TokensContextModule.Provider, { value = UseMemoResult }, {
		TextSizeOffsetContext = ReactModule.createElement(TextSizeOffsetContextModule.Provider, { value = UseMemoResult1 }, {
			VariantsContext = ReactModule.createElement(VariantsContextModule.Provider, { value = UseVariantsStateResult }, {
				TagsContext = ReactModule.createElement(TagsContextModule.Provider, { value = UseRegistryStyleSheetModuleResult2 }, ReactModule.createElement(StyleSheetContextModule.Provider, { value = UseRegistryStyleSheetModuleResult }, p1.children)),
				StyleSheet = ReactModule.createElement("StyleLink", { StyleSheet = UseRegistryStyleSheetModuleResult })
			})
		})
	})
end