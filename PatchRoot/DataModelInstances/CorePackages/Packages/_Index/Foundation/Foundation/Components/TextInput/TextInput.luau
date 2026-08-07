-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:10 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local components = foundation.Components
local iconModule = require(components.Icon)
local iconButtonModule = require(components.IconButton)
local inputFieldModule = require(components.InputField)
local internalTextInputModule = require(components.InternalTextInput)
local _ = require(foundation.Components.Types)
local viewModule = require(components.View)
local flagsModule = require(foundation.Utility.Flags)
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

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 52 | named "TextInput" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useTextInputVariantsModule (ref), reactModule (ref), inputFieldModule (ref), withCommonPropsModule (ref), getInputTextSizeModule (ref), internalTextInputModule (ref), flagsModule (ref), viewModule (ref), iconModule (ref), iconButtonModule (ref)
	local var15 = withDefaultsModule(p0, t)
	local var16 = useTextInputVariantsModule(useTokensModule(), var15.size, var15.variant)
	
	return reactModule.createElement(inputFieldModule, withCommonPropsModule(var15, {
		width = var15.width,
		ref = p1,
		label = var15.label,
		size = getInputTextSizeModule(var15.size),
		isRequired = var15.isRequired,
		isDisabled = var15.isDisabled,
		hasError = var15.hasError,
		hint = var15.hint,
		textBoxRef = var15.textBoxRef,
		input = function(p2) --[[ line: 69 ]]
			-- upvalues: reactModule (copy), internalTextInputModule (copy), var15 (ref), flagsModule (copy), var16 (ref), viewModule (copy), iconModule (copy), iconButtonModule (copy)
			local var18
			local createElement = reactModule.createElement
			local t = {
				ref = p2,
				inputRef = var15.inputRef,
				hasError = var15.hasError,
				isDisabled = var15.isDisabled,
				hasClearButton = var15.hasClearButton,
				text = var15.text,
				textInputType = var15.textInputType,
				focusBehavior = var15.focusBehavior,
				size = var15.size,
				variant = var15.variant,
				Selectable = if flagsModule.FoundationInputSelectionProps then var15.Selectable else nil,
				NextSelectionUp = if flagsModule.FoundationInputSelectionProps then var15.NextSelectionUp else nil,
				NextSelectionDown = if flagsModule.FoundationInputSelectionProps then var15.NextSelectionDown else nil,
				NextSelectionLeft = if flagsModule.FoundationInputSelectionProps then var15.NextSelectionLeft else nil,
				NextSelectionRight = if flagsModule.FoundationInputSelectionProps then var15.NextSelectionRight else nil,
				horizontalPadding = {
					left = var16.container.horizontalPadding,
					right = var16.container.horizontalPadding
				},
				onChanged = var15.onChanged,
				onFocus = var15.onFocusGained,
				onFocusLost = var15.onFocusLost,
				onReturnPressed = var15.onReturnPressed,
				placeholder = var15.placeholder,
				leadingElement = if var15.leadingIcon then reactModule.createElement(viewModule, { tag = "row align-y-center size-0-full auto-x" }, reactModule.createElement(iconModule, {
					name = var15.leadingIcon,
					style = var16.icon.style,
					size = var16.icon.size
				})) else nil
			}
			
			if var15.iconTrailing then
				var18 = reactModule.createElement
				var18 = var18(viewModule, { tag = "row align-y-center size-0-full auto-x" }, if type(var15.iconTrailing) == "table" and var15.iconTrailing.onActivated then reactModule.createElement(iconButtonModule, {
					onActivated = var15.iconTrailing.onActivated,
					isDisabled = var15.isDisabled,
					size = var16.icon.size,
					icon = var15.iconTrailing.name,
					testId = `{var15.testId}--trailing-icon-button`
				}) else reactModule.createElement(iconModule, {
					name = if type(var15.iconTrailing) == "table" then var15.iconTrailing.name else var15.iconTrailing,
					style = var16.icon.style,
					size = var16.icon.size
				}))
			else
				var18 = nil
			end
			t.trailingElement = var18
			t.testId = `{var15.testId}--internal-text-input`
			
			return createElement(internalTextInputModule, t)
		end
	}))
end))