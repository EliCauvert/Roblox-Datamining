local Foundation = game:GetService("CorePackages").Packages._Index.Foundation.Foundation
local ReactModule = require(Foundation.Parent.React)
local Components = Foundation.Components
local InputFieldModule = require(Components.InputField)
local _ = require(Foundation.Components.Types)
local ChatInternalTextInputModule = require(script.Parent.ChatInternalTextInput)
local UseTextInputVariantsModule = require(Components.TextInput.useTextInputVariants)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local config = {
	maxLines = 5,
	testId = "--build-experience-chat-text-area",
	size = require(Foundation.Enums.InputSize).Large
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), UseTextInputVariantsModule (copy), ReactModule (copy), InputFieldModule (copy), WithCommonPropsModule (copy), ChatInternalTextInputModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local UseTextInputVariantsModuleResult = UseTextInputVariantsModule(UseTokensModuleResult, WithDefaultsModuleResult.size, WithDefaultsModuleResult.variant)
	
	return ReactModule.createElement(InputFieldModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		width = if WithDefaultsModuleResult.width then WithDefaultsModuleResult.width else nil,
		label = WithDefaultsModuleResult.label,
		hint = WithDefaultsModuleResult.hint,
		hasError = WithDefaultsModuleResult.hasError,
		isDisabled = WithDefaultsModuleResult.leadingElement == nil and WithDefaultsModuleResult.trailingElement == nil and WithDefaultsModuleResult.isDisabled,
		isRequired = WithDefaultsModuleResult.isRequired,
		input = function(Ref)
			-- upvalues: ReactModule (upval), ChatInternalTextInputModule (upval), WithDefaultsModuleResult (copy), UseTokensModuleResult (copy), UseTextInputVariantsModuleResult (copy)
			return ReactModule.createElement(ChatInternalTextInputModule, {
				alwaysMultiLine = true,
				manualFocusRelease = true,
				textPaddingOnParent = true,
				LayoutOrder = 2,
				size = WithDefaultsModuleResult.size,
				variant = WithDefaultsModuleResult.variant,
				maxLines = WithDefaultsModuleResult.maxLines,
				trailingAlignBottom = WithDefaultsModuleResult.trailingElement ~= nil,
				composerDebug = WithDefaultsModuleResult.composerDebug,
				focusBehavior = WithDefaultsModuleResult.focusBehavior,
				onFocus = WithDefaultsModuleResult.onFocusGained,
				onFocusLost = WithDefaultsModuleResult.onFocusLost,
				onReturnPressed = WithDefaultsModuleResult.onReturnPressed,
				onChanged = WithDefaultsModuleResult.onChanged,
				text = WithDefaultsModuleResult.text,
				hasError = WithDefaultsModuleResult.hasError,
				isDisabled = WithDefaultsModuleResult.isDisabled,
				hasClearButton = WithDefaultsModuleResult.hasClearButton,
				placeholder = WithDefaultsModuleResult.placeholder,
				horizontalPadding = {
					left = if WithDefaultsModuleResult.leadingElement then UDim.new(0, UseTokensModuleResult.Padding.XSmall) else UDim.new(0, UseTokensModuleResult.Padding.Large),
					right = if WithDefaultsModuleResult.trailingElement then UDim.new(0, UseTokensModuleResult.Padding.XSmall) else UseTextInputVariantsModuleResult.container.horizontalPadding
				},
				leadingElement = WithDefaultsModuleResult.leadingElement,
				trailingElement = WithDefaultsModuleResult.trailingElement,
				ref = Ref,
				testId = `{WithDefaultsModuleResult.testId}--input`
			})
		end,
		textBoxRef = WithDefaultsModuleResult.textBoxRef,
		ref = Ref
	}))
end))