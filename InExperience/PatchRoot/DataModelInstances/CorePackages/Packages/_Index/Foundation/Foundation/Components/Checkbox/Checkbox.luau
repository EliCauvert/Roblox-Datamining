local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local ReactModule = require(Parent.React)
local ConstantsModule = require(Foundation.Constants)
local Components = Foundation.Components
local InternalInputModule = require(Components.InternalInput)
local TextModule = require(Components.Text)
local _ = require(Components.Types)
local UseUncontrolledStateModule = require(Components.InternalInput.useUncontrolledState)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local UseCheckboxVariantsModule = require(script.Parent.useCheckboxVariants)
local UseInputGroupDefaultsModule = require(Components.InternalInputGroup.useInputGroupDefaults)
local config = {
	Selectable = true,
	testId = "--foundation-checkbox",
	size = require(Foundation.Enums.InputSize).Medium,
	placement = require(Foundation.Enums.InputPlacement).Start
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: UseInputGroupDefaultsModule (copy), config (copy), UseTokensModule (copy), UseCheckboxVariantsModule (copy), UseUncontrolledStateModule (copy), ReactModule (copy), InternalInputModule (copy), WithCommonPropsModule (copy), ConstantsModule (copy), TextModule (copy), BuilderIconsModule (copy)
	local UseInputGroupDefaultsModuleResult = UseInputGroupDefaultsModule(p1, config)
	local UseCheckboxVariantsModuleResult = UseCheckboxVariantsModule(UseTokensModule(), UseInputGroupDefaultsModuleResult.size)
	local UseUncontrolledStateModuleResult, UseUncontrolledStateModuleResult2 = UseUncontrolledStateModule(UseInputGroupDefaultsModuleResult.isChecked, UseInputGroupDefaultsModuleResult.onActivated)
	local IsIndeterminate = UseInputGroupDefaultsModuleResult.isIndeterminate or false
	
	return ReactModule.createElement(InternalInputModule, WithCommonPropsModule(UseInputGroupDefaultsModuleResult, {
		isChecked = UseUncontrolledStateModuleResult,
		isIndeterminate = IsIndeterminate,
		isDisabled = UseInputGroupDefaultsModuleResult.isDisabled,
		onActivated = UseUncontrolledStateModuleResult2,
		label = {
			text = UseInputGroupDefaultsModuleResult.label,
			position = ConstantsModule.INPUT_PLACEMENT_TO_LABEL_ALIGNMENT[UseInputGroupDefaultsModuleResult.placement],
			hint = UseInputGroupDefaultsModuleResult.hint
		},
		customVariantProps = UseCheckboxVariantsModuleResult.input,
		size = UseInputGroupDefaultsModuleResult.size,
		Selectable = UseInputGroupDefaultsModuleResult.Selectable,
		NextSelectionUp = UseInputGroupDefaultsModuleResult.NextSelectionUp,
		NextSelectionDown = UseInputGroupDefaultsModuleResult.NextSelectionDown,
		NextSelectionLeft = UseInputGroupDefaultsModuleResult.NextSelectionLeft,
		NextSelectionRight = UseInputGroupDefaultsModuleResult.NextSelectionRight,
		ref = Ref
	}), {
		Checkmark = if UseUncontrolledStateModuleResult or IsIndeterminate then ReactModule.createElement(TextModule, {
			TextScaled = true,
			Text = if IsIndeterminate then BuilderIconsModule.Icon.Minus else BuilderIconsModule.Icon.Check,
			fontStyle = {
				Font = BuilderIconsModule.Font[BuilderIconsModule.IconVariant.Filled]
			},
			tag = UseCheckboxVariantsModuleResult.checkmark.tag,
			testId = `{UseInputGroupDefaultsModuleResult.testId}--checkmark`
		}) else nil
	})
end))