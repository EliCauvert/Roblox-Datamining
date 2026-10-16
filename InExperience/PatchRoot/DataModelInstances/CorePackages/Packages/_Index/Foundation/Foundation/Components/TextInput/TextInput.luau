local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local Components = Foundation.Components
local IconModule = require(Components.Icon)
local IconButtonModule = require(Components.IconButton)
local InputFieldModule = require(Components.InputField)
local InternalTextInputModule = require(Components.InternalTextInput)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Components.View)
local UseTextInputVariantsModule = require(Foundation.Components.TextInput.useTextInputVariants)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local _ = require(Foundation.Enums.InputVariant)
local GetInputTextSizeModule = require(Foundation.Utility.getInputTextSize)
local _ = require(Foundation.Enums.ControlState)
local config = {
	testId = "--foundation-text-input",
	size = require(Foundation.Enums.InputSize).Large
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref) --[[ Line: 51 | Named "TextInput" ]]
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), UseTextInputVariantsModule (copy), ReactModule (copy), InputFieldModule (copy), WithCommonPropsModule (copy), GetInputTextSizeModule (copy), InternalTextInputModule (copy), ViewModule (copy), IconModule (copy), IconButtonModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTextInputVariantsModuleResult = UseTextInputVariantsModule(UseTokensModule(), WithDefaultsModuleResult.size, WithDefaultsModuleResult.variant)
	
	return ReactModule.createElement(InputFieldModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		width = WithDefaultsModuleResult.width,
		ref = Ref,
		label = WithDefaultsModuleResult.label,
		size = GetInputTextSizeModule(WithDefaultsModuleResult.size),
		isRequired = WithDefaultsModuleResult.isRequired,
		isDisabled = WithDefaultsModuleResult.isDisabled,
		hasError = WithDefaultsModuleResult.hasError,
		hint = WithDefaultsModuleResult.hint,
		textBoxRef = WithDefaultsModuleResult.textBoxRef,
		input = function(Ref) --[[ Line: 68 ]]
			-- upvalues: ReactModule (upval), InternalTextInputModule (upval), WithDefaultsModuleResult (copy), UseTextInputVariantsModuleResult (copy), ViewModule (upval), IconModule (upval), IconButtonModule (upval)
			return ReactModule.createElement(InternalTextInputModule, {
				ref = Ref,
				inputRef = WithDefaultsModuleResult.inputRef,
				hasError = WithDefaultsModuleResult.hasError,
				isDisabled = WithDefaultsModuleResult.isDisabled,
				hasClearButton = WithDefaultsModuleResult.hasClearButton,
				text = WithDefaultsModuleResult.text,
				textInputType = WithDefaultsModuleResult.textInputType,
				focusBehavior = WithDefaultsModuleResult.focusBehavior,
				size = WithDefaultsModuleResult.size,
				variant = WithDefaultsModuleResult.variant,
				Selectable = WithDefaultsModuleResult.Selectable,
				NextSelectionUp = WithDefaultsModuleResult.NextSelectionUp,
				NextSelectionDown = WithDefaultsModuleResult.NextSelectionDown,
				NextSelectionLeft = WithDefaultsModuleResult.NextSelectionLeft,
				NextSelectionRight = WithDefaultsModuleResult.NextSelectionRight,
				horizontalPadding = {
					left = UseTextInputVariantsModuleResult.container.horizontalPadding,
					right = UseTextInputVariantsModuleResult.container.horizontalPadding
				},
				onChanged = WithDefaultsModuleResult.onChanged,
				onFocus = WithDefaultsModuleResult.onFocusGained,
				onFocusLost = WithDefaultsModuleResult.onFocusLost,
				onReturnPressed = WithDefaultsModuleResult.onReturnPressed,
				placeholder = WithDefaultsModuleResult.placeholder,
				leadingElement = if WithDefaultsModuleResult.leadingIcon then ReactModule.createElement(ViewModule, { tag = "row align-y-center size-0-full auto-x" }, ReactModule.createElement(IconModule, {
					name = WithDefaultsModuleResult.leadingIcon,
					style = UseTextInputVariantsModuleResult.icon.style,
					size = UseTextInputVariantsModuleResult.icon.size
				})) else nil,
				trailingElement = if WithDefaultsModuleResult.iconTrailing then ReactModule.createElement(ViewModule, { tag = "row align-y-center size-0-full auto-x" }, if type(WithDefaultsModuleResult.iconTrailing) == "table" and WithDefaultsModuleResult.iconTrailing.onActivated then ReactModule.createElement(IconButtonModule, {
					onActivated = WithDefaultsModuleResult.iconTrailing.onActivated,
					isDisabled = WithDefaultsModuleResult.isDisabled,
					size = UseTextInputVariantsModuleResult.icon.size,
					icon = WithDefaultsModuleResult.iconTrailing.name,
					testId = `{WithDefaultsModuleResult.testId}--trailing-icon-button`
				}) else ReactModule.createElement(IconModule, {
					name = if type(WithDefaultsModuleResult.iconTrailing) == "table" then WithDefaultsModuleResult.iconTrailing.name else WithDefaultsModuleResult.iconTrailing,
					style = UseTextInputVariantsModuleResult.icon.style,
					size = UseTextInputVariantsModuleResult.icon.size
				})) else nil,
				testId = `{WithDefaultsModuleResult.testId}--internal-text-input`
			})
		end
	}))
end))