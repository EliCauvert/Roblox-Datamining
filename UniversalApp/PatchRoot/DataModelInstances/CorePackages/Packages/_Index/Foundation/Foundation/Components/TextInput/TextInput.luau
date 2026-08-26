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
		input = function(p3)
			-- upvalues: reactModule (copy), internalTextInputModule (copy), var1 (ref), var2 (ref), viewModule (copy), iconModule (copy), iconButtonModule (copy)
			local var3
			local createElement = reactModule.createElement
			local t = {
				ref = p3,
				inputRef = var3.inputRef,
				hasError = var3.hasError,
				isDisabled = var3.isDisabled,
				hasClearButton = var3.hasClearButton,
				text = var3.text,
				textInputType = var3.textInputType,
				focusBehavior = var3.focusBehavior,
				size = var3.size,
				variant = var3.variant,
				Selectable = var3.Selectable,
				NextSelectionUp = var3.NextSelectionUp,
				NextSelectionDown = var3.NextSelectionDown,
				NextSelectionLeft = var3.NextSelectionLeft,
				NextSelectionRight = var3.NextSelectionRight,
				horizontalPadding = {
					left = var2.container.horizontalPadding,
					right = var2.container.horizontalPadding
				},
				onChanged = var3.onChanged,
				onFocus = var3.onFocusGained,
				onFocusLost = var3.onFocusLost,
				onReturnPressed = var3.onReturnPressed,
				placeholder = var3.placeholder,
				leadingElement = if var3.leadingIcon then reactModule.createElement(viewModule, { tag = "row align-y-center size-0-full auto-x" }, reactModule.createElement(iconModule, {
					name = var3.leadingIcon,
					style = var2.icon.style,
					size = var2.icon.size
				})) else nil
			}
			
			if var3.iconTrailing then
				var3 = reactModule.createElement
				var3 = var3(viewModule, { tag = "row align-y-center size-0-full auto-x" }, if type(var3.iconTrailing) == "table" and var3.iconTrailing.onActivated then reactModule.createElement(iconButtonModule, {
					onActivated = var3.iconTrailing.onActivated,
					isDisabled = var3.isDisabled,
					size = var2.icon.size,
					icon = var3.iconTrailing.name,
					testId = `{var3.testId}--trailing-icon-button`
				}) else reactModule.createElement(iconModule, {
					name = if type(var3.iconTrailing) == "table" then var3.iconTrailing.name else var3.iconTrailing,
					style = var2.icon.style,
					size = var2.icon.size
				}))
			else
				var3 = nil
			end
			t.trailingElement = var3
			t.testId = `{var3.testId}--internal-text-input`
			
			return createElement(internalTextInputModule, t)
		end
	}))
end))