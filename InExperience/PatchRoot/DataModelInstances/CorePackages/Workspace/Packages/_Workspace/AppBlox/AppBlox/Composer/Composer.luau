local foundation = game:GetService("CorePackages").Packages._Index.Foundation.Foundation
local reactModule = require(foundation.Parent.React)
local components = foundation.Components
local inputFieldModule = require(components.InputField)
local _ = require(foundation.Components.Types)
local composerTextInputModule = require(script.Parent.ComposerTextInput)
local useTextInputVariantsModule = require(components.TextInput.useTextInputVariants)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local t = {
	minLines = 1,
	maxLines = 5,
	testId = "--app-blox-composer",
	size = require(foundation.Enums.InputSize).Large
}

return reactModule.memo(reactModule.forwardRef(function(p0, p1)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useTextInputVariantsModule (ref), reactModule (ref), inputFieldModule (ref), withCommonPropsModule (ref), composerTextInputModule (ref)
	local var8 = withDefaultsModule(p0, t)
	local var9 = useTokensModule()
	local var10 = useTextInputVariantsModule(var9, var8.size, var8.variant)
	
	return reactModule.createElement(inputFieldModule, withCommonPropsModule(var8, {
		width = if var8.width then var8.width else nil,
		label = var8.label,
		hint = var8.hint,
		hasError = var8.hasError,
		isDisabled = var8.trailingElement ~= nil and var8.isDisabled,
		isRequired = var8.isRequired,
		input = function(p2)
			-- upvalues: reactModule (copy), composerTextInputModule (copy), var8 (ref), var9 (ref), var10 (ref)
			return reactModule.createElement(composerTextInputModule, {
				alwaysMultiLine = true,
				manualFocusRelease = true,
				textPaddingOnParent = true,
				LayoutOrder = 2,
				size = var8.size,
				variant = var8.variant,
				minLines = var8.minLines,
				maxLines = var8.maxLines,
				trailingAlignBottom = var8.trailingElement ~= nil,
				composerDebug = var8.composerDebug,
				focusBehavior = var8.focusBehavior,
				onFocus = var8.onFocusGained,
				onFocusLost = var8.onFocusLost,
				onReturnPressed = var8.onReturnPressed,
				onChanged = var8.onChanged,
				text = var8.text,
				hasError = var8.hasError,
				isDisabled = var8.isDisabled,
				hasClearButton = var8.hasClearButton,
				placeholder = var8.placeholder,
				horizontalPadding = {
					left = UDim.new(0, var9.Padding.Large),
					right = if var8.trailingElement then UDim.new(0, var9.Padding.XSmall) else var10.container.horizontalPadding
				},
				trailingElement = var8.trailingElement,
				ref = p2,
				testId = `{var8.testId}--input`
			})
		end,
		textBoxRef = var8.textBoxRef,
		ref = p1
	}))
end))