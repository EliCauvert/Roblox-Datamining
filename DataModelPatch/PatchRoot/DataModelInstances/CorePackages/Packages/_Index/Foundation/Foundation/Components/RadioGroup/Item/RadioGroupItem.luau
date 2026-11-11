local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local ConstantsModule = require(Foundation.Constants)
local Components = Foundation.Components
local InternalInputModule = require(Components.InternalInput)
local _ = require(Components.Types)
local ViewModule = require(Components.View)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local UseRadioGroupItemVariantsModule = require(script.Parent.useRadioGroupItemVariants)
local UseRadioGroupModule = require(script.Parent.Parent.useRadioGroup)
local config = {
	isDisabled = false,
	size = require(Foundation.Enums.InputSize).Medium,
	placement = require(Foundation.Enums.InputPlacement).Start
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseRadioGroupModule (copy), UseTokensModule (copy), ReactModule (copy), UseRadioGroupItemVariantsModule (copy), InternalInputModule (copy), WithCommonPropsModule (copy), ConstantsModule (copy), ViewModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local IsDisabled = WithDefaultsModuleResult.isDisabled
	local UseRadioGroupModuleResult = UseRadioGroupModule()
	local IsValueMatch = UseRadioGroupModuleResult.value == WithDefaultsModuleResult.value
	local Label = WithDefaultsModuleResult.label or WithDefaultsModuleResult.value
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRadioGroupModuleResult (copy), WithDefaultsModuleResult (copy)
		UseRadioGroupModuleResult.onValueChanged(WithDefaultsModuleResult.value)
	end, {
		IsDisabled,
		WithDefaultsModuleResult.value,
		UseRadioGroupModuleResult.onValueChanged
	})
	local UseRadioGroupItemVariantsModuleResult = UseRadioGroupItemVariantsModule(UseTokensModule(), WithDefaultsModuleResult.size)
	WithDefaultsModuleResult.testId = `{UseRadioGroupModuleResult.testId}--item-{WithDefaultsModuleResult.value}`
	
	return ReactModule.createElement(InternalInputModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		isChecked = IsValueMatch,
		isDisabled = IsDisabled,
		onActivated = UseResult,
		label = {
			text = Label,
			position = ConstantsModule.INPUT_PLACEMENT_TO_LABEL_ALIGNMENT[WithDefaultsModuleResult.placement]
		},
		customVariantProps = UseRadioGroupItemVariantsModuleResult.input,
		size = WithDefaultsModuleResult.size,
		Selectable = UseRadioGroupModuleResult.Selectable,
		ref = Ref
	}), {
		Center = if IsValueMatch then ReactModule.createElement(ViewModule, {
			tag = UseRadioGroupItemVariantsModuleResult.checkmark.tag,
			backgroundStyle = UseRadioGroupItemVariantsModuleResult.checkmark.style
		}) else nil
	})
end))