local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local constantsModule = require(foundation.Constants)
local components = foundation.Components
local internalInputModule = require(components.InternalInput)
local _ = require(components.Types)
local viewModule = require(components.View)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local useRadioGroupItemVariantsModule = require(script.Parent.useRadioGroupItemVariants)
local inputSizeModule = require(foundation.Enums.InputSize)
local inputPlacementModule = require(foundation.Enums.InputPlacement)
local useInputGroupDefaultsModule = require(foundation.Components.InternalInputGroup.useInputGroupDefaults)
local useRadioGroupModule = require(script.Parent.Parent.useRadioGroup)
local flagsModule = require(foundation.Utility.Flags)
local t = {
	isDisabled = false,
	size = inputSizeModule.Medium,
	placement = inputPlacementModule.Start
}

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: flagsModule (ref), useInputGroupDefaultsModule (ref), t (ref), withDefaultsModule (ref), useRadioGroupModule (ref), useTokensModule (ref), reactModule (ref), useRadioGroupItemVariantsModule (ref), internalInputModule (ref), withCommonPropsModule (ref), constantsModule (ref), viewModule (ref)
	local var1 = if flagsModule.FoundationInputGroup then useInputGroupDefaultsModule(p1, t) else withDefaultsModule(p1, t)
	local isDisabled = var1.isDisabled
	local var2 = useRadioGroupModule()
	local var3 = var2.value == var1.value
	local label = var1.label or var1.value
	local var4 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), var1 (ref)
		var2.onValueChanged(var1.value)
	end, { isDisabled, var1.value, var2.onValueChanged })
	local var5 = useRadioGroupItemVariantsModule(useTokensModule(), var1.size)
	var1.testId = `{var2.testId}--item-{var15.value}`
	
	return reactModule.createElement(internalInputModule, withCommonPropsModule(var1, {
		isChecked = var3,
		isDisabled = isDisabled,
		onActivated = var4,
		label = {
			text = label,
			position = constantsModule.INPUT_PLACEMENT_TO_LABEL_ALIGNMENT[var1.placement],
			hint = if flagsModule.FoundationRadioBeta then var1.hint else nil
		},
		customVariantProps = var5.input,
		size = var1.size,
		Selectable = var2.Selectable,
		ref = p2
	}), {
		Center = if var3 then reactModule.createElement(viewModule, {
			tag = var5.checkmark.tag,
			backgroundStyle = var5.checkmark.style
		}) else nil
	})
end))