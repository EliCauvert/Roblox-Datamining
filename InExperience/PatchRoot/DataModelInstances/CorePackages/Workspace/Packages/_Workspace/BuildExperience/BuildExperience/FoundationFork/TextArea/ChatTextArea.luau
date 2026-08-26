local foundation = game:GetService("CorePackages").Packages._Index.Foundation.Foundation
local reactModule = require(foundation.Parent.React)
local components = foundation.Components
local inputFieldModule = require(components.InputField)
local _ = require(foundation.Components.Types)
local chatInternalTextInputModule = require(script.Parent.ChatInternalTextInput)
local useTextInputVariantsModule = require(components.TextInput.useTextInputVariants)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local t = {
	maxLines = 5,
	testId = "--build-experience-chat-text-area",
	size = require(foundation.Enums.InputSize).Large
}

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useTextInputVariantsModule (ref), reactModule (ref), inputFieldModule (ref), withCommonPropsModule (ref), chatInternalTextInputModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = useTokensModule()
	local var3 = useTextInputVariantsModule(var2, var1.size, var1.variant)
	
	return reactModule.createElement(inputFieldModule, withCommonPropsModule(var1, {
		width = if var1.width then var1.width else nil,
		label = var1.label,
		hint = var1.hint,
		hasError = var1.hasError,
		isDisabled = var1.trailingElement ~= nil and var1.isDisabled,
		isRequired = var1.isRequired,
		input = function(p3)
			-- upvalues: reactModule (copy), chatInternalTextInputModule (copy), var1 (ref), var2 (ref), var3 (ref)
			return reactModule.createElement(chatInternalTextInputModule, {
				alwaysMultiLine = true,
				manualFocusRelease = true,
				textPaddingOnParent = true,
				LayoutOrder = 2,
				size = var1.size,
				variant = var1.variant,
				maxLines = var1.maxLines,
				trailingAlignBottom = var1.trailingElement ~= nil,
				composerDebug = var1.composerDebug,
				focusBehavior = var1.focusBehavior,
				onFocus = var1.onFocusGained,
				onFocusLost = var1.onFocusLost,
				onReturnPressed = var1.onReturnPressed,
				onChanged = var1.onChanged,
				text = var1.text,
				hasError = var1.hasError,
				isDisabled = var1.isDisabled,
				hasClearButton = var1.hasClearButton,
				placeholder = var1.placeholder,
				horizontalPadding = {
					left = UDim.new(0, var2.Padding.Large),
					right = if var1.trailingElement then UDim.new(0, var2.Padding.XSmall) else var3.container.horizontalPadding
				},
				trailingElement = var1.trailingElement,
				ref = p3,
				testId = `{var1.testId}--input`
			})
		end,
		textBoxRef = var1.textBoxRef,
		ref = p2
	}))
end))