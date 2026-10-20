local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local ConstantsModule = require(Foundation.Constants)
local Components = Foundation.Components
local InternalInputModule = require(Components.InternalInput)
local _ = require(Components.Types)
local ViewModule = require(Components.View)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local UseRadioGroupItemVariantsModule = require(script.Parent.useRadioGroupItemVariants)
local UseInputGroupDefaultsModule = require(Foundation.Components.InternalInputGroup.useInputGroupDefaults)
local UseRadioGroupModule = require(script.Parent.Parent.useRadioGroup)
local config = {
	isDisabled = false,
	size = require(Foundation.Enums.InputSize).Medium,
	placement = require(Foundation.Enums.InputPlacement).Start
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: UseInputGroupDefaultsModule (copy), config (copy), UseRadioGroupModule (copy), UseTokensModule (copy), ReactModule (copy), UseRadioGroupItemVariantsModule (copy), InternalInputModule (copy), WithCommonPropsModule (copy), ConstantsModule (copy), ViewModule (copy)
	local UseInputGroupDefaultsModuleResult = UseInputGroupDefaultsModule(p1, config)
	local IsDisabled = UseInputGroupDefaultsModuleResult.isDisabled
	local UseRadioGroupModuleResult = UseRadioGroupModule()
	local IsValueMatch = UseRadioGroupModuleResult.value == UseInputGroupDefaultsModuleResult.value
	local Label = UseInputGroupDefaultsModuleResult.label or UseInputGroupDefaultsModuleResult.value
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRadioGroupModuleResult (copy), UseInputGroupDefaultsModuleResult (copy)
		UseRadioGroupModuleResult.onValueChanged(UseInputGroupDefaultsModuleResult.value)
	end, {
		IsDisabled,
		UseInputGroupDefaultsModuleResult.value,
		UseRadioGroupModuleResult.onValueChanged
	})
	local UseRadioGroupItemVariantsModuleResult = UseRadioGroupItemVariantsModule(UseTokensModule(), UseInputGroupDefaultsModuleResult.size)
	UseInputGroupDefaultsModuleResult.testId = `{UseRadioGroupModuleResult.testId}--item-{UseInputGroupDefaultsModuleResult.value}`
	
	return ReactModule.createElement(InternalInputModule, WithCommonPropsModule(UseInputGroupDefaultsModuleResult, {
		isChecked = IsValueMatch,
		isDisabled = IsDisabled,
		onActivated = UseResult,
		label = {
			text = Label,
			position = ConstantsModule.INPUT_PLACEMENT_TO_LABEL_ALIGNMENT[UseInputGroupDefaultsModuleResult.placement],
			hint = UseInputGroupDefaultsModuleResult.hint
		},
		customVariantProps = UseRadioGroupItemVariantsModuleResult.input,
		size = UseInputGroupDefaultsModuleResult.size,
		Selectable = UseRadioGroupModuleResult.Selectable,
		ref = Ref
	}), {
		Center = if IsValueMatch then ReactModule.createElement(ViewModule, {
			tag = UseRadioGroupItemVariantsModuleResult.checkmark.tag,
			backgroundStyle = UseRadioGroupItemVariantsModuleResult.checkmark.style
		}) else nil
	})
end))