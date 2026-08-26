local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local reactModule = require(parent.React)
local constantsModule = require(foundation.Constants)
local components = foundation.Components
local internalInputModule = require(components.InternalInput)
local textModule = require(components.Text)
local _ = require(components.Types)
local useUncontrolledStateModule = require(components.InternalInput.useUncontrolledState)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local useCheckboxVariantsModule = require(script.Parent.useCheckboxVariants)
local inputSizeModule = require(foundation.Enums.InputSize)
local inputPlacementModule = require(foundation.Enums.InputPlacement)
local flagsModule = require(foundation.Utility.Flags)
local useInputGroupDefaultsModule = require(components.InternalInputGroup.useInputGroupDefaults)
local t = {
	Selectable = true,
	testId = "--foundation-checkbox",
	size = inputSizeModule.Medium,
	placement = inputPlacementModule.Start
}

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: flagsModule (ref), useInputGroupDefaultsModule (ref), t (ref), withDefaultsModule (ref), useTokensModule (ref), useCheckboxVariantsModule (ref), useUncontrolledStateModule (ref), reactModule (ref), internalInputModule (ref), withCommonPropsModule (ref), constantsModule (ref), textModule (ref), builderIconsModule (ref)
	local var1 = if flagsModule.FoundationInputGroup then useInputGroupDefaultsModule(p1, t) else withDefaultsModule(p1, t)
	local var2 = useCheckboxVariantsModule(useTokensModule(), var1.size)
	local var3, var4 = useUncontrolledStateModule(var1.isChecked, var1.onActivated)
	local isIndeterminate = var1.isIndeterminate or false
	
	return reactModule.createElement(internalInputModule, withCommonPropsModule(var1, {
		isChecked = var3,
		isIndeterminate = isIndeterminate,
		isDisabled = var1.isDisabled,
		onActivated = var4,
		label = {
			text = var1.label,
			position = constantsModule.INPUT_PLACEMENT_TO_LABEL_ALIGNMENT[var1.placement],
			hint = if flagsModule.FoundationCheckboxBeta then var1.hint else nil
		},
		customVariantProps = var2.input,
		size = var1.size,
		Selectable = var1.Selectable,
		NextSelectionUp = var1.NextSelectionUp,
		NextSelectionDown = var1.NextSelectionDown,
		NextSelectionLeft = var1.NextSelectionLeft,
		NextSelectionRight = var1.NextSelectionRight,
		ref = p2
	}), {
		Checkmark = if var3 or isIndeterminate then reactModule.createElement(textModule, {
			TextScaled = true,
			Text = if isIndeterminate then builderIconsModule.Icon.Minus else builderIconsModule.Icon.Check,
			fontStyle = {
				Font = builderIconsModule.Font[builderIconsModule.IconVariant.Filled]
			},
			tag = var2.checkmark.tag,
			testId = `{var1.testId}--checkmark`
		}) else nil
	})
end))