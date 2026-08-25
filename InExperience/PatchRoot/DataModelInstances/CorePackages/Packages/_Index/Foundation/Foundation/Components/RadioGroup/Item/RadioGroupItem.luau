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

return reactModule.memo(reactModule.forwardRef(function(p0, p1)
	-- upvalues: flagsModule (ref), useInputGroupDefaultsModule (ref), t (ref), withDefaultsModule (ref), useRadioGroupModule (ref), useTokensModule (ref), reactModule (ref), useRadioGroupItemVariantsModule (ref), internalInputModule (ref), withCommonPropsModule (ref), constantsModule (ref), viewModule (ref)
	local var15 = if flagsModule.FoundationInputGroup then useInputGroupDefaultsModule(p0, t) else withDefaultsModule(p0, t)
	local isDisabled = var15.isDisabled
	local var16 = useRadioGroupModule()
	local var17 = var16.value == var15.value
	local label = var15.label or var15.value
	local var19 = reactModule.useCallback(function()
		-- upvalues: var16 (ref), var15 (ref)
		var16.onValueChanged(var15.value)
	end, { isDisabled, var15.value, var16.onValueChanged })
	local var20 = useRadioGroupItemVariantsModule(useTokensModule(), var15.size)
	var15.testId = `{var16.testId}--item-{var15.value}`
	
	return reactModule.createElement(internalInputModule, withCommonPropsModule(var15, {
		isChecked = var17,
		isDisabled = isDisabled,
		onActivated = var19,
		label = {
			text = label,
			position = constantsModule.INPUT_PLACEMENT_TO_LABEL_ALIGNMENT[var15.placement],
			hint = if flagsModule.FoundationRadioBeta then var15.hint else nil
		},
		customVariantProps = var20.input,
		size = var15.size,
		Selectable = var16.Selectable,
		ref = p1
	}), {
		Center = if var17 then reactModule.createElement(viewModule, {
			tag = var20.checkmark.tag,
			backgroundStyle = var20.checkmark.style
		}) else nil
	})
end))