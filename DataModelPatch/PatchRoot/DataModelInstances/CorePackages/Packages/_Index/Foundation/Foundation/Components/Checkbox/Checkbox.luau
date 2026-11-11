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
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local UseCheckboxVariantsModule = require(script.Parent.useCheckboxVariants)
local config = {
	Selectable = true,
	testId = "--foundation-checkbox",
	size = require(Foundation.Enums.InputSize).Medium,
	placement = require(Foundation.Enums.InputPlacement).Start
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), UseCheckboxVariantsModule (copy), UseUncontrolledStateModule (copy), ReactModule (copy), InternalInputModule (copy), WithCommonPropsModule (copy), ConstantsModule (copy), TextModule (copy), BuilderIconsModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseCheckboxVariantsModuleResult = UseCheckboxVariantsModule(UseTokensModule(), WithDefaultsModuleResult.size)
	local UseUncontrolledStateModuleResult, UseUncontrolledStateModuleResult2 = UseUncontrolledStateModule(WithDefaultsModuleResult.isChecked, WithDefaultsModuleResult.onActivated)
	local IsIndeterminate = WithDefaultsModuleResult.isIndeterminate or false
	
	return ReactModule.createElement(InternalInputModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		isChecked = UseUncontrolledStateModuleResult,
		isIndeterminate = IsIndeterminate,
		isDisabled = WithDefaultsModuleResult.isDisabled,
		onActivated = UseUncontrolledStateModuleResult2,
		label = {
			text = WithDefaultsModuleResult.label,
			position = ConstantsModule.INPUT_PLACEMENT_TO_LABEL_ALIGNMENT[WithDefaultsModuleResult.placement]
		},
		customVariantProps = UseCheckboxVariantsModuleResult.input,
		size = WithDefaultsModuleResult.size,
		Selectable = WithDefaultsModuleResult.Selectable,
		NextSelectionUp = WithDefaultsModuleResult.NextSelectionUp,
		NextSelectionDown = WithDefaultsModuleResult.NextSelectionDown,
		NextSelectionLeft = WithDefaultsModuleResult.NextSelectionLeft,
		NextSelectionRight = WithDefaultsModuleResult.NextSelectionRight,
		ref = Ref
	}), {
		Checkmark = if UseUncontrolledStateModuleResult or IsIndeterminate then ReactModule.createElement(TextModule, {
			TextScaled = true,
			Text = if IsIndeterminate then BuilderIconsModule.Icon.Minus else BuilderIconsModule.Icon.Check,
			fontStyle = {
				Font = BuilderIconsModule.Font[BuilderIconsModule.IconVariant.Filled]
			},
			tag = UseCheckboxVariantsModuleResult.checkmark.tag,
			testId = `{WithDefaultsModuleResult.testId}--checkmark`
		}) else nil
	})
end))