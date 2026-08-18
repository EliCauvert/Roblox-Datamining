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
local flagsModule = require(foundation.Utility.Flags)
local t = {
	Selectable = true,
	testId = "--foundation-checkbox",
	size = require(foundation.Enums.InputSize).Medium,
	placement = require(foundation.Enums.InputPlacement).Start
}

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 57 | named "Checkbox" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useCheckboxVariantsModule (ref), useUncontrolledStateModule (ref), reactModule (ref), internalInputModule (ref), withCommonPropsModule (ref), constantsModule (ref), flagsModule (ref), textModule (ref), builderIconsModule (ref)
	local var13 = withDefaultsModule(p0, t)
	local var14 = useCheckboxVariantsModule(useTokensModule(), var13.size)
	local var15, var16 = useUncontrolledStateModule(var13.isChecked, var13.onActivated)
	local isIndeterminate = var13.isIndeterminate or false
	
	return reactModule.createElement(internalInputModule, withCommonPropsModule(var13, {
		isChecked = var15,
		isIndeterminate = isIndeterminate,
		isDisabled = var13.isDisabled,
		onActivated = var16,
		label = {
			text = var13.label,
			position = constantsModule.INPUT_PLACEMENT_TO_LABEL_ALIGNMENT[var13.placement],
			hint = if flagsModule.FoundationCheckboxBeta then var13.hint else nil
		},
		customVariantProps = var14.input,
		size = var13.size,
		Selectable = var13.Selectable,
		NextSelectionUp = var13.NextSelectionUp,
		NextSelectionDown = var13.NextSelectionDown,
		NextSelectionLeft = var13.NextSelectionLeft,
		NextSelectionRight = var13.NextSelectionRight,
		ref = p1
	}), {
		Checkmark = if var15 or isIndeterminate then reactModule.createElement(textModule, {
			TextScaled = true,
			Text = if isIndeterminate then builderIconsModule.Icon.Minus else builderIconsModule.Icon.Check,
			fontStyle = {
				Font = builderIconsModule.Font[builderIconsModule.IconVariant.Filled]
			},
			tag = var14.checkmark.tag,
			testId = `{var13.testId}--checkmark`
		}) else nil
	})
end))