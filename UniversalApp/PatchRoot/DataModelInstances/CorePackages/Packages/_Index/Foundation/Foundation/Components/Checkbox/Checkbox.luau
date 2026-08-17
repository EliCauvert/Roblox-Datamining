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

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 58 | named "Checkbox" ]]
	-- upvalues: flagsModule (ref), useInputGroupDefaultsModule (ref), t (ref), withDefaultsModule (ref), useTokensModule (ref), useCheckboxVariantsModule (ref), useUncontrolledStateModule (ref), reactModule (ref), internalInputModule (ref), withCommonPropsModule (ref), constantsModule (ref), textModule (ref), builderIconsModule (ref)
	local var16 = if flagsModule.FoundationInputGroup then useInputGroupDefaultsModule(p0, t) else withDefaultsModule(p0, t)
	local var17 = useCheckboxVariantsModule(useTokensModule(), var16.size)
	local var18, var19 = useUncontrolledStateModule(var16.isChecked, var16.onActivated)
	local isIndeterminate = var16.isIndeterminate or false
	
	return reactModule.createElement(internalInputModule, withCommonPropsModule(var16, {
		isChecked = var18,
		isIndeterminate = isIndeterminate,
		isDisabled = var16.isDisabled,
		onActivated = var19,
		label = {
			text = var16.label,
			position = constantsModule.INPUT_PLACEMENT_TO_LABEL_ALIGNMENT[var16.placement],
			hint = if flagsModule.FoundationCheckboxBeta then var16.hint else nil
		},
		customVariantProps = var17.input,
		size = var16.size,
		Selectable = var16.Selectable,
		NextSelectionUp = var16.NextSelectionUp,
		NextSelectionDown = var16.NextSelectionDown,
		NextSelectionLeft = var16.NextSelectionLeft,
		NextSelectionRight = var16.NextSelectionRight,
		ref = p1
	}), {
		Checkmark = if var18 or isIndeterminate then reactModule.createElement(textModule, {
			TextScaled = true,
			Text = if isIndeterminate then builderIconsModule.Icon.Minus else builderIconsModule.Icon.Check,
			fontStyle = {
				Font = builderIconsModule.Font[builderIconsModule.IconVariant.Filled]
			},
			tag = var17.checkmark.tag,
			testId = `{var16.testId}--checkmark`
		}) else nil
	})
end))