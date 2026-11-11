local Parent = script.Parent
local Foundation = script:FindFirstAncestor("Foundation")
local Parent1 = Foundation.Parent
local DashModule = require(Parent1.Dash)
local ReactModule = require(Parent1.React)
local FlagsModule = require(Foundation.Utility.Flags)
local StyleSheetModule = require(Foundation.StyleSheet)
local StyleSheetContextModule = require(Parent.StyleSheetContext)
local TagsContextModule = require(Parent.TagsContext)
local TextSizeOffsetContextModule = require(Parent.TextSizeOffsetContext)
local TokensContextModule = require(Parent.TokensContext)
local VariantsContextModule = require(Parent.VariantsContext)
local GetTextSizeOffsetModule = require(Foundation.Utility.getTextSizeOffset)
local UsePreferencesModule = require(Foundation.Providers.Preferences.usePreferences)
local UseTagsStateModule = require(Parent.useTagsState)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local GetTokensFunction = require(Parent.Tokens).getTokens
local UseRegistryStyleSheetModule = if FlagsModule.FoundationUseStyleSheetRegistry then require(Parent.useRegistryStyleSheet) else nil
local config = {
	scale = 1,
	theme = require(Foundation.Enums.Theme).Dark,
	device = require(Foundation.Enums.Device).Desktop
}

function StyleSheetContextWrapper(p1)
	-- upvalues: ReactModule (copy), StyleSheetContextModule (copy), DashModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	
	if p1.setStyleSheetRef and p1.setStyleSheetRef.current ~= UseStateResult2 then
		p1.setStyleSheetRef.current = UseStateResult2
	end
	return ReactModule.createElement(StyleSheetContextModule.Provider, { value = UseStateResult or DashModule.None }, p1.children)
end

return function(p1)
	-- upvalues: WithDefaultsModule (copy), config (copy), FlagsModule (copy), ReactModule (copy), UseTagsStateModule (copy), VariantsContextModule (copy), GetTokensFunction (copy), UsePreferencesModule (copy), GetTextSizeOffsetModule (copy), UseRegistryStyleSheetModule (copy), TokensContextModule (copy), TextSizeOffsetContextModule (copy), TagsContextModule (copy), StyleSheetContextModule (copy), StyleSheetModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule({ theme = p1.theme, device = p1.device, scale = p1.scale }, config)
	local UseRefResult = if FlagsModule.FoundationUseStyleSheetRegistry then nil else ReactModule.useRef(nil)
	local Tags = nil
	local v1 = nil
	
	if not FlagsModule.FoundationUseStyleSheetRegistry then
		Tags, v23 = UseTagsStateModule()
	end
	local UseVariantsStateResult = VariantsContextModule.useVariantsState()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: GetTokensFunction (upval), WithDefaultsModuleResult (copy), p1 (copy)
		return GetTokensFunction(WithDefaultsModuleResult.theme, WithDefaultsModuleResult.device, WithDefaultsModuleResult.scale, p1.tokenOverrides)
	end, {
		WithDefaultsModuleResult.device,
		WithDefaultsModuleResult.theme,
		WithDefaultsModuleResult.scale,
		p1.tokenOverrides
	})
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: GetTextSizeOffsetModule (upval)
		return GetTextSizeOffsetModule() or 0
	end, { UsePreferencesModule().preferredTextSize })
	local StyleSheet = nil
	local v2 = nil
	
	if FlagsModule.FoundationUseStyleSheetRegistry then
		StyleSheet, v28 = UseRegistryStyleSheetModule(WithDefaultsModuleResult.theme, WithDefaultsModuleResult.device, WithDefaultsModuleResult.scale, p1.tokenOverrides)
	end
	return ReactModule.createElement(TokensContextModule.Provider, { value = UseMemoResult }, {
		TextSizeOffsetContext = ReactModule.createElement(TextSizeOffsetContextModule.Provider, { value = UseMemoResult1 }, {
			VariantsContext = ReactModule.createElement(VariantsContextModule.Provider, { value = UseVariantsStateResult }, {
				TagsContext = ReactModule.createElement(TagsContextModule.Provider, {
					value = if FlagsModule.FoundationUseStyleSheetRegistry then v2 else v1
				}, if FlagsModule.FoundationUseStyleSheetRegistry then ReactModule.createElement(StyleSheetContextModule.Provider, { value = StyleSheet }, p1.children) else ReactModule.createElement(StyleSheetContextWrapper, { setStyleSheetRef = UseRefResult }, p1.children)),
				StyleSheet = if FlagsModule.FoundationUseStyleSheetRegistry then ReactModule.createElement("StyleLink", { StyleSheet = StyleSheet }) else ReactModule.createElement(StyleSheetModule, {
					theme = WithDefaultsModuleResult.theme,
					device = WithDefaultsModuleResult.device,
					scale = WithDefaultsModuleResult.scale,
					tags = Tags,
					derives = p1.derives,
					setStyleSheetRef = UseRefResult,
					tokenOverrides = p1.tokenOverrides
				})
			})
		})
	})
end