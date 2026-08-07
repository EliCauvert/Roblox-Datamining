-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:00 2026 Pacific Standard Time.

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
local t = {
	Selectable = true,
	testId = "--foundation-checkbox",
	size = require(foundation.Enums.InputSize).Medium,
	placement = require(foundation.Enums.InputPlacement).Start
}

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 53 | named "Checkbox" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useCheckboxVariantsModule (ref), useUncontrolledStateModule (ref), reactModule (ref), internalInputModule (ref), withCommonPropsModule (ref), constantsModule (ref), textModule (ref), builderIconsModule (ref)
	local var12 = withDefaultsModule(p0, t)
	local var13 = useCheckboxVariantsModule(useTokensModule(), var12.size)
	local var14, var15 = useUncontrolledStateModule(var12.isChecked, var12.onActivated)
	local isIndeterminate = var12.isIndeterminate or false
	
	return reactModule.createElement(internalInputModule, withCommonPropsModule(var12, {
		isChecked = var14,
		isIndeterminate = isIndeterminate,
		isDisabled = var12.isDisabled,
		onActivated = var15,
		label = {
			text = var12.label,
			position = constantsModule.INPUT_PLACEMENT_TO_LABEL_ALIGNMENT[var12.placement]
		},
		customVariantProps = var13.input,
		size = var12.size,
		Selectable = var12.Selectable,
		NextSelectionUp = var12.NextSelectionUp,
		NextSelectionDown = var12.NextSelectionDown,
		NextSelectionLeft = var12.NextSelectionLeft,
		NextSelectionRight = var12.NextSelectionRight,
		ref = p1
	}), {
		Checkmark = if var14 or isIndeterminate then reactModule.createElement(textModule, {
			TextScaled = true,
			Text = if isIndeterminate then builderIconsModule.Icon.Minus else builderIconsModule.Icon.Check,
			fontStyle = {
				Font = builderIconsModule.Font[builderIconsModule.IconVariant.Filled]
			},
			tag = var13.checkmark.tag,
			testId = `{var12.testId}--checkmark`
		}) else nil
	})
end))