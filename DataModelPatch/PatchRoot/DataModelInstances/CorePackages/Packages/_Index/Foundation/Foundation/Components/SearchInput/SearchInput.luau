local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local ReactModule = require(Parent.React)
local Components = Foundation.Components
local IconModule = require(Components.Icon)
local InternalTextInputModule = require(Components.InternalTextInput)
local _ = require(Components.Types)
local ViewModule = require(Components.View)
local ConstantsModule = require(Foundation.Constants)
local TranslatorModule = require(Foundation.Utility.Localization.Translator)
local UseScaledValueModule = require(Foundation.Utility.useScaledValue)
local UseTextInputVariantsModule = require(Foundation.Components.TextInput.useTextInputVariants)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local RadiusModule = require(Foundation.Enums.Radius)
local SearchInputShapeModule = require(Foundation.Enums.SearchInputShape)
local config = {
	[SearchInputShapeModule.Pill] = RadiusModule.Circle,
	[SearchInputShapeModule.Box] = RadiusModule.None
}
local config1 = {
	hasClearButton = true,
	testId = "--foundation-search-input",
	size = require(Foundation.Enums.InputSize).Medium,
	variant = require(Foundation.Enums.InputVariant).Standard,
	shape = SearchInputShapeModule.Pill
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config1 (copy), UseTokensModule (copy), UseTextInputVariantsModule (copy), UseScaledValueModule (copy), ConstantsModule (copy), ReactModule (copy), ViewModule (copy), WithCommonPropsModule (copy), InternalTextInputModule (copy), config (copy), TranslatorModule (copy), IconModule (copy), BuilderIconsModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config1)
	local UseTokensModuleResult = UseTokensModule()
	local UseTextInputVariantsModuleResult = UseTextInputVariantsModule(UseTokensModuleResult, WithDefaultsModuleResult.size, WithDefaultsModuleResult.variant)
	local UseScaledValueModuleResult = UseScaledValueModule(ConstantsModule.DEFAULT_INPUT_FIELD_WIDTH_PIXELS)
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		tag = "auto-y",
		Size = if WithDefaultsModuleResult.width then UDim2.new(WithDefaultsModuleResult.width, UDim.new(0, 0)) else UDim2.new(UDim.new(0, UseScaledValueModuleResult), UDim.new(0, 0))
	}), {
		Input = ReactModule.createElement(InternalTextInputModule, {
			ref = Ref,
			hasError = WithDefaultsModuleResult.hasError,
			isDisabled = WithDefaultsModuleResult.isDisabled,
			hasClearButton = WithDefaultsModuleResult.hasClearButton,
			text = WithDefaultsModuleResult.text,
			size = WithDefaultsModuleResult.size,
			radius = config[WithDefaultsModuleResult.shape],
			variant = WithDefaultsModuleResult.variant,
			horizontalPadding = {
				left = UseTextInputVariantsModuleResult.container.horizontalPadding,
				right = UseTextInputVariantsModuleResult.container.horizontalPadding
			},
			onChanged = WithDefaultsModuleResult.onChanged,
			onFocus = WithDefaultsModuleResult.onFocusGained,
			onFocusLost = WithDefaultsModuleResult.onFocusLost,
			placeholder = if WithDefaultsModuleResult.placeholder then WithDefaultsModuleResult.placeholder else TranslatorModule:FormatByKey("CommonUI.Controls.Action.Search"),
			leadingElement = ReactModule.createElement(ViewModule, {
				tag = "anchor-center-left auto-xy",
				Position = ReactModule.useMemo(function(): UDim2
					-- upvalues: UseTextInputVariantsModuleResult (copy), UseTokensModuleResult (copy)
					return UDim2.fromOffset(0, (UseTextInputVariantsModuleResult.container.minHeight - UseTokensModuleResult.Stroke.Standard) / 2)
				end, {
					UseTextInputVariantsModuleResult.container.minHeight,
					UseTokensModuleResult.Stroke.Standard
				})
			}, {
				Icon = ReactModule.createElement(IconModule, {
					name = BuilderIconsModule.Icon.MagnifyingGlass,
					size = WithDefaultsModuleResult.size,
					testId = `{WithDefaultsModuleResult.testId}--search-icon`
				})
			}),
			testId = `{WithDefaultsModuleResult.testId}--input`
		})
	})
end))