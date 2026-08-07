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
local useRadioGroupModule = require(script.Parent.Parent.useRadioGroup)
local t = {
	isDisabled = false,
	size = require(foundation.Enums.InputSize).Medium,
	placement = require(foundation.Enums.InputPlacement).Start
}

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 47 | named "RadioGroupItem" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useRadioGroupModule (ref), useTokensModule (ref), reactModule (ref), useRadioGroupItemVariantsModule (ref), internalInputModule (ref), withCommonPropsModule (ref), constantsModule (ref), viewModule (ref)
	local var11 = withDefaultsModule(p0, t)
	local isDisabled = var11.isDisabled
	local var12 = useRadioGroupModule()
	local var13 = var12.value == var11.value
	local label = var11.label or var11.value
	local var15 = reactModule.useCallback(function() --[[ line: 57 ]]
		-- upvalues: var12 (ref), var11 (ref)
		var12.onValueChanged(var11.value)
	end, { isDisabled, var11.value, var12.onValueChanged })
	local var16 = useRadioGroupItemVariantsModule(useTokensModule(), var11.size)
	var11.testId = `{var12.testId}--item-{var11.value}`
	
	return reactModule.createElement(internalInputModule, withCommonPropsModule(var11, {
		isChecked = var13,
		isDisabled = isDisabled,
		onActivated = var15,
		label = {
			text = label,
			position = constantsModule.INPUT_PLACEMENT_TO_LABEL_ALIGNMENT[var11.placement]
		},
		customVariantProps = var16.input,
		size = var11.size,
		Selectable = var12.Selectable,
		ref = p1
	}), {
		Center = if var13 then reactModule.createElement(viewModule, {
			tag = var16.checkmark.tag,
			backgroundStyle = var16.checkmark.style
		}) else nil
	})
end))