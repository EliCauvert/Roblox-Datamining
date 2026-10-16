local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local Components = Foundation.Components
local InputFieldModule = require(Components.InputField)
local InternalTextInputModule = require(Components.InternalTextInput)
local _ = require(Foundation.Components.Types)
local GetInputTextSizeModule = require(Foundation.Utility.getInputTextSize)
local UseTextInputVariantsModule = require(Components.TextInput.useTextInputVariants)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local _ = require(Foundation.Enums.InputVariant)
local _ = require(Foundation.Enums.ControlState)
local config = {
	numLines = 3,
	testId = "--foundation-text-area",
	size = require(Foundation.Enums.InputSize).Medium
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref) --[[ Line: 39 | Named "TextArea" ]]
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), UseTextInputVariantsModule (copy), ReactModule (copy), InputFieldModule (copy), WithCommonPropsModule (copy), GetInputTextSizeModule (copy), InternalTextInputModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local UseTextInputVariantsModuleResult = UseTextInputVariantsModule(UseTokensModuleResult, WithDefaultsModuleResult.size, WithDefaultsModuleResult.variant)
	
	return ReactModule.createElement(InputFieldModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		width = if WithDefaultsModuleResult.width then WithDefaultsModuleResult.width else nil,
		label = WithDefaultsModuleResult.label,
		size = GetInputTextSizeModule(WithDefaultsModuleResult.size),
		hint = WithDefaultsModuleResult.hint,
		hasError = WithDefaultsModuleResult.hasError,
		isDisabled = WithDefaultsModuleResult.isDisabled,
		isRequired = WithDefaultsModuleResult.isRequired,
		input = function(Ref) --[[ Line: 54 ]]
			-- upvalues: ReactModule (upval), InternalTextInputModule (upval), WithDefaultsModuleResult (copy), UseTextInputVariantsModuleResult (copy), UseTokensModuleResult (copy)
			return ReactModule.createElement(InternalTextInputModule, {
				LayoutOrder = 2,
				inputRef = WithDefaultsModuleResult.inputRef,
				size = WithDefaultsModuleResult.size,
				variant = WithDefaultsModuleResult.variant,
				numLines = WithDefaultsModuleResult.numLines,
				focusBehavior = WithDefaultsModuleResult.focusBehavior,
				onFocus = WithDefaultsModuleResult.onFocusGained,
				onFocusLost = WithDefaultsModuleResult.onFocusLost,
				onChanged = WithDefaultsModuleResult.onChanged,
				text = WithDefaultsModuleResult.text,
				hasError = WithDefaultsModuleResult.hasError,
				isDisabled = WithDefaultsModuleResult.isDisabled,
				hasClearButton = WithDefaultsModuleResult.hasClearButton,
				placeholder = WithDefaultsModuleResult.placeholder,
				horizontalPadding = {
					left = UseTextInputVariantsModuleResult.container.horizontalPadding,
					right = UseTextInputVariantsModuleResult.container.horizontalPadding - UDim.new(0, UseTokensModuleResult.Size.Size_150)
				},
				ref = Ref,
				testId = `{WithDefaultsModuleResult.testId}--input`
			})
		end,
		textBoxRef = WithDefaultsModuleResult.textBoxRef,
		ref = Ref
	}))
end))