local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local components = foundation.Components
local inputFieldModule = require(components.InputField)
local internalTextInputModule = require(components.InternalTextInput)
local _ = require(foundation.Components.Types)
local flagsModule = require(foundation.Utility.Flags)
local getInputTextSizeModule = require(foundation.Utility.getInputTextSize)
local useTextInputVariantsModule = require(components.TextInput.useTextInputVariants)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local inputSizeModule = require(foundation.Enums.InputSize)
local _ = require(foundation.Enums.InputVariant)
local _ = require(foundation.Enums.ControlState)
local t = {
	numLines = 3,
	testId = "--foundation-text-area",
	size = inputSizeModule.Medium
}

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 40 | named "TextArea" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useTextInputVariantsModule (ref), reactModule (ref), inputFieldModule (ref), withCommonPropsModule (ref), flagsModule (ref), getInputTextSizeModule (ref), internalTextInputModule (ref)
	local var12 = withDefaultsModule(p0, t)
	local var13 = useTokensModule()
	local var14 = useTextInputVariantsModule(var13, var12.size, var12.variant)
	
	return reactModule.createElement(inputFieldModule, withCommonPropsModule(var12, {
		width = if var12.width then var12.width else nil,
		label = var12.label,
		size = if flagsModule.FoundationTextInputsBetaUpdate then getInputTextSizeModule(var12.size) else nil,
		hint = var12.hint,
		hasError = var12.hasError,
		isDisabled = var12.isDisabled,
		isRequired = var12.isRequired,
		input = function(p2) --[[ line: 55 ]]
			-- upvalues: reactModule (copy), internalTextInputModule (copy), var12 (ref), var14 (ref), var13 (ref)
			return reactModule.createElement(internalTextInputModule, {
				LayoutOrder = 2,
				inputRef = var12.inputRef,
				size = var12.size,
				variant = var12.variant,
				numLines = var12.numLines,
				focusBehavior = var12.focusBehavior,
				onFocus = var12.onFocusGained,
				onFocusLost = var12.onFocusLost,
				onChanged = var12.onChanged,
				text = var12.text,
				hasError = var12.hasError,
				isDisabled = var12.isDisabled,
				hasClearButton = var12.hasClearButton,
				placeholder = var12.placeholder,
				horizontalPadding = {
					left = var14.container.horizontalPadding,
					right = var14.container.horizontalPadding - UDim.new(0, var13.Size.Size_150)
				},
				ref = p2,
				testId = `{var12.testId}--input`
			})
		end,
		textBoxRef = var12.textBoxRef,
		ref = p1
	}))
end))