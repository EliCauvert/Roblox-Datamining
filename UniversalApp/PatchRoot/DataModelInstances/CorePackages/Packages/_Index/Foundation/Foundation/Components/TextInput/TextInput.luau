local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local components = foundation.Components
local iconModule = require(components.Icon)
local iconButtonModule = require(components.IconButton)
local inputFieldModule = require(components.InputField)
local internalTextInputModule = require(components.InternalTextInput)
local _ = require(foundation.Components.Types)
local viewModule = require(components.View)
local useTextInputVariantsModule = require(foundation.Components.TextInput.useTextInputVariants)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local inputSizeModule = require(foundation.Enums.InputSize)
local _ = require(foundation.Enums.InputVariant)
local getInputTextSizeModule = require(foundation.Utility.getInputTextSize)
local _ = require(foundation.Enums.ControlState)
local t = {
	testId = "--foundation-text-input",
	size = inputSizeModule.Large
}

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 51 | named "TextInput" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useTextInputVariantsModule (ref), reactModule (ref), inputFieldModule (ref), withCommonPropsModule (ref), getInputTextSizeModule (ref), internalTextInputModule (ref), viewModule (ref), iconModule (ref), iconButtonModule (ref)
	local var14 = withDefaultsModule(p0, t)
	local var15 = useTextInputVariantsModule(useTokensModule(), var14.size, var14.variant)
	
	return reactModule.createElement(inputFieldModule, withCommonPropsModule(var14, {
		width = var14.width,
		ref = p1,
		label = var14.label,
		size = getInputTextSizeModule(var14.size),
		isRequired = var14.isRequired,
		isDisabled = var14.isDisabled,
		hasError = var14.hasError,
		hint = var14.hint,
		textBoxRef = var14.textBoxRef,
		input = function(p2) --[[ line: 68 ]]
			-- upvalues: reactModule (copy), internalTextInputModule (copy), var14 (ref), var15 (ref), viewModule (copy), iconModule (copy), iconButtonModule (copy)
			local var17
			local createElement = reactModule.createElement
			local t = {
				ref = p2,
				inputRef = var14.inputRef,
				hasError = var14.hasError,
				isDisabled = var14.isDisabled,
				hasClearButton = var14.hasClearButton,
				text = var14.text,
				textInputType = var14.textInputType,
				focusBehavior = var14.focusBehavior,
				size = var14.size,
				variant = var14.variant,
				Selectable = var14.Selectable,
				NextSelectionUp = var14.NextSelectionUp,
				NextSelectionDown = var14.NextSelectionDown,
				NextSelectionLeft = var14.NextSelectionLeft,
				NextSelectionRight = var14.NextSelectionRight,
				horizontalPadding = {
					left = var15.container.horizontalPadding,
					right = var15.container.horizontalPadding
				},
				onChanged = var14.onChanged,
				onFocus = var14.onFocusGained,
				onFocusLost = var14.onFocusLost,
				onReturnPressed = var14.onReturnPressed,
				placeholder = var14.placeholder,
				leadingElement = if var14.leadingIcon then reactModule.createElement(viewModule, { tag = "row align-y-center size-0-full auto-x" }, reactModule.createElement(iconModule, {
					name = var14.leadingIcon,
					style = var15.icon.style,
					size = var15.icon.size
				})) else nil
			}
			
			if var14.iconTrailing then
				var17 = reactModule.createElement
				var17 = var17(viewModule, { tag = "row align-y-center size-0-full auto-x" }, if type(var14.iconTrailing) == "table" and var14.iconTrailing.onActivated then reactModule.createElement(iconButtonModule, {
					onActivated = var14.iconTrailing.onActivated,
					isDisabled = var14.isDisabled,
					size = var15.icon.size,
					icon = var14.iconTrailing.name,
					testId = `{var14.testId}--trailing-icon-button`
				}) else reactModule.createElement(iconModule, {
					name = if type(var14.iconTrailing) == "table" then var14.iconTrailing.name else var14.iconTrailing,
					style = var15.icon.style,
					size = var15.icon.size
				}))
			else
				var17 = nil
			end
			t.trailingElement = var17
			t.testId = `{var14.testId}--internal-text-input`
			
			return createElement(internalTextInputModule, t)
		end
	}))
end))