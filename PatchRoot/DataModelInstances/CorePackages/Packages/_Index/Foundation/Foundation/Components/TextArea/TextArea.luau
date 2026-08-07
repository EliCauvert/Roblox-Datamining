-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:10 2026 Pacific Standard Time.

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

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 39 | named "TextArea" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useTextInputVariantsModule (ref), reactModule (ref), inputFieldModule (ref), withCommonPropsModule (ref), getInputTextSizeModule (ref), internalTextInputModule (ref)
	local var11 = withDefaultsModule(p0, t)
	local var12 = useTokensModule()
	local var13 = useTextInputVariantsModule(var12, var11.size, var11.variant)
	
	return reactModule.createElement(inputFieldModule, withCommonPropsModule(var11, {
		width = if var11.width then var11.width else nil,
		label = var11.label,
		size = getInputTextSizeModule(var11.size),
		hint = var11.hint,
		hasError = var11.hasError,
		isDisabled = var11.isDisabled,
		isRequired = var11.isRequired,
		input = function(p2) --[[ line: 54 ]]
			-- upvalues: reactModule (copy), internalTextInputModule (copy), var11 (ref), var13 (ref), var12 (ref)
			return reactModule.createElement(internalTextInputModule, {
				LayoutOrder = 2,
				inputRef = var11.inputRef,
				size = var11.size,
				variant = var11.variant,
				numLines = var11.numLines,
				focusBehavior = var11.focusBehavior,
				onFocus = var11.onFocusGained,
				onFocusLost = var11.onFocusLost,
				onChanged = var11.onChanged,
				text = var11.text,
				hasError = var11.hasError,
				isDisabled = var11.isDisabled,
				hasClearButton = var11.hasClearButton,
				placeholder = var11.placeholder,
				horizontalPadding = {
					left = var13.container.horizontalPadding,
					right = var13.container.horizontalPadding - UDim.new(0, var12.Size.Size_150)
				},
				ref = p2,
				testId = `{var11.testId}--input`
			})
		end,
		textBoxRef = var11.textBoxRef,
		ref = p1
	}))
end))