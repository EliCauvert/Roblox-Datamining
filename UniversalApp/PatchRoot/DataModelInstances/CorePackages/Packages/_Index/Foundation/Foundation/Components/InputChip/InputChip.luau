local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local CloseAffordanceModule = require(Foundation.Components.CloseAffordance)
local CloseAffordanceVariantModule = require(Foundation.Enums.CloseAffordanceVariant)
local InputSizeModule = require(Foundation.Enums.InputSize)
local ConstantsModule = require(Foundation.Constants)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseInputChipVariantsModule = require(script.Parent.useInputChipVariants)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local config = {
	isDisabled = false,
	testId = "--foundation-input-chip",
	size = InputSizeModule.Medium
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), UseInputChipVariantsModule (copy), ReactModule (copy), ViewModule (copy), WithCommonPropsModule (copy), ConstantsModule (copy), TextModule (copy), CloseAffordanceModule (copy), InputSizeModule (copy), CloseAffordanceVariantModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseInputChipVariantsModuleResult = UseInputChipVariantsModule(UseTokensModule(), WithDefaultsModuleResult.size)
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		tag = UseInputChipVariantsModuleResult.container.tag,
		GroupTransparency = if WithDefaultsModuleResult.isDisabled then ConstantsModule.DISABLED_TRANSPARENCY else nil,
		ref = Ref
	}), {
		Text = ReactModule.createElement(TextModule, {
			LayoutOrder = 1,
			Text = WithDefaultsModuleResult.text,
			textStyle = UseInputChipVariantsModuleResult.text.contentStyle,
			tag = UseInputChipVariantsModuleResult.text.tag,
			padding = UseInputChipVariantsModuleResult.text.padding,
			testId = `{WithDefaultsModuleResult.testId}--text`
		}),
		Close = ReactModule.createElement(ViewModule, {
			LayoutOrder = 2,
			tag = UseInputChipVariantsModuleResult.close.tag,
			padding = UseInputChipVariantsModuleResult.close.padding,
			testId = `{WithDefaultsModuleResult.testId}--close-container`
		}, {
			CloseAffordance = ReactModule.createElement(CloseAffordanceModule, {
				hasPadding = false,
				LayoutOrder = 1,
				onActivated = if WithDefaultsModuleResult.isDisabled then nil else WithDefaultsModuleResult.onClose,
				size = InputSizeModule.XSmall,
				variant = CloseAffordanceVariantModule.Utility,
				Selectable = not WithDefaultsModuleResult.isDisabled and nil,
				testId = `{WithDefaultsModuleResult.testId}--close`
			})
		})
	})
end))