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

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useTextInputVariantsModule (ref), reactModule (ref), inputFieldModule (ref), withCommonPropsModule (ref), getInputTextSizeModule (ref), internalTextInputModule (ref), viewModule (ref), iconModule (ref), iconButtonModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = useTextInputVariantsModule(useTokensModule(), var1.size, var1.variant)
	
	return reactModule.createElement(inputFieldModule, withCommonPropsModule(var1, {
		width = var1.width,
		ref = p2,
		label = var1.label,
		size = getInputTextSizeModule(var1.size),
		isRequired = var1.isRequired,
		isDisabled = var1.isDisabled,
		hasError = var1.hasError,
		hint = var1.hint,
		textBoxRef = var1.textBoxRef,
		input = function(p1)
			-- upvalues: reactModule (copy), internalTextInputModule (copy), var1 (ref), var2 (ref), viewModule (copy), iconModule (copy), iconButtonModule (copy)
			local var1
			local createElement = reactModule.createElement
			local t = {
				ref = p1,
				inputRef = var1.inputRef,
				hasError = var1.hasError,
				isDisabled = var1.isDisabled,
				hasClearButton = var1.hasClearButton,
				text = var1.text,
				textInputType = var1.textInputType,
				focusBehavior = var1.focusBehavior,
				size = var1.size,
				variant = var1.variant,
				Selectable = var1.Selectable,
				NextSelectionUp = var1.NextSelectionUp,
				NextSelectionDown = var1.NextSelectionDown,
				NextSelectionLeft = var1.NextSelectionLeft,
				NextSelectionRight = var1.NextSelectionRight,
				horizontalPadding = {
					left = var2.container.horizontalPadding,
					right = var2.container.horizontalPadding
				},
				onChanged = var1.onChanged,
				onFocus = var1.onFocusGained,
				onFocusLost = var1.onFocusLost,
				onReturnPressed = var1.onReturnPressed,
				placeholder = var1.placeholder,
				leadingElement = if var1.leadingIcon then reactModule.createElement(viewModule, { tag = "row align-y-center size-0-full auto-x" }, reactModule.createElement(iconModule, {
					name = var1.leadingIcon,
					style = var2.icon.style,
					size = var2.icon.size
				})) else nil
			}
			
			if var1.iconTrailing then
				var1 = reactModule.createElement
				var1 = var1(viewModule, { tag = "row align-y-center size-0-full auto-x" }, if type(var1.iconTrailing) == "table" and var1.iconTrailing.onActivated then reactModule.createElement(iconButtonModule, {
					onActivated = var1.iconTrailing.onActivated,
					isDisabled = var1.isDisabled,
					size = var2.icon.size,
					icon = var1.iconTrailing.name,
					testId = `{var1.testId}--trailing-icon-button`
				}) else reactModule.createElement(iconModule, {
					name = if type(var1.iconTrailing) == "table" then var1.iconTrailing.name else var1.iconTrailing,
					style = var2.icon.style,
					size = var2.icon.size
				}))
			else
				var1 = nil
			end
			t.trailingElement = var1
			t.testId = `{var1.testId}--internal-text-input`
			
			return createElement(internalTextInputModule, t)
		end
	}))
end))