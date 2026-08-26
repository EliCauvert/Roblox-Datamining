local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local components = foundation.Components
local inputFieldModule = require(components.InputField)
local internalTextInputModule = require(components.InternalTextInput)
local _ = require(foundation.Components.Types)
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

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useTextInputVariantsModule (ref), reactModule (ref), inputFieldModule (ref), withCommonPropsModule (ref), getInputTextSizeModule (ref), internalTextInputModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = useTokensModule()
	local var3 = useTextInputVariantsModule(var2, var1.size, var1.variant)
	
	return reactModule.createElement(inputFieldModule, withCommonPropsModule(var1, {
		width = if var1.width then var1.width else nil,
		label = var1.label,
		size = getInputTextSizeModule(var1.size),
		hint = var1.hint,
		hasError = var1.hasError,
		isDisabled = var1.isDisabled,
		isRequired = var1.isRequired,
		input = function(p3)
			-- upvalues: reactModule (copy), internalTextInputModule (copy), var1 (ref), var3 (ref), var2 (ref)
			return reactModule.createElement(internalTextInputModule, {
				LayoutOrder = 2,
				inputRef = var1.inputRef,
				size = var1.size,
				variant = var1.variant,
				numLines = var1.numLines,
				focusBehavior = var1.focusBehavior,
				onFocus = var1.onFocusGained,
				onFocusLost = var1.onFocusLost,
				onChanged = var1.onChanged,
				text = var1.text,
				hasError = var1.hasError,
				isDisabled = var1.isDisabled,
				hasClearButton = var1.hasClearButton,
				placeholder = var1.placeholder,
				horizontalPadding = {
					left = var3.container.horizontalPadding,
					right = var3.container.horizontalPadding - UDim.new(0, var2.Size.Size_150)
				},
				ref = p3,
				testId = `{var1.testId}--input`
			})
		end,
		textBoxRef = var1.textBoxRef,
		ref = p2
	}))
end))