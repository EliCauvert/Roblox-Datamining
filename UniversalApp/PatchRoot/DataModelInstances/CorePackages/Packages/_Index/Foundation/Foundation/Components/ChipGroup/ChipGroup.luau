local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local _ = require(Foundation.Enums.ChipVariant)
local _ = require(Foundation.Components.Chip.Accessory)
local ChipModule = require(Foundation.Components.Chip)
local OverflowScrollContainerModule = require(Foundation.Components.OverflowScrollContainer)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseChipGroupVariantsModule = require(Foundation.Components.ChipGroup.useChipGroupVariants)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local config = {
	testId = "--foundation-chip-group",
	size = require(Foundation.Enums.ChipSize).Medium,
	variant = require(Foundation.Enums.ChipGroupVariant).Row
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), UseChipGroupVariantsModule (copy), ReactModule (copy), ChipModule (copy), ViewModule (copy), WithCommonPropsModule (copy), OverflowScrollContainerModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseChipGroupVariantsModuleResult = UseChipGroupVariantsModule(UseTokensModule(), WithDefaultsModuleResult.variant, WithDefaultsModuleResult.size)
	local Size = WithDefaultsModuleResult.size
	local Elements = {}
	
	for LayoutOrder, chip in WithDefaultsModuleResult.chips do
		Elements[`Chip{LayoutOrder}`] = ReactModule.createElement(ChipModule, {
			text = chip.text,
			leading = chip.leading,
			trailing = chip.trailing,
			onActivated = chip.onActivated,
			isChecked = chip.isChecked,
			variant = chip.variant,
			size = Size,
			LayoutOrder = LayoutOrder,
			testId = `{WithDefaultsModuleResult.testId}--chip-{LayoutOrder}`
		})
	end
	local Element = ReactModule.createElement(ViewModule, {
		tag = "auto-xy",
		layout = {
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, UseChipGroupVariantsModuleResult.gap),
			Wraps = UseChipGroupVariantsModuleResult.isWrapped
		}
	}, Elements)
	
	return if UseChipGroupVariantsModuleResult.isWrapped then ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, { tag = "size-full-0 auto-y", ref = Ref }), { ChipContainer = Element }) else ReactModule.createElement(OverflowScrollContainerModule, WithCommonPropsModule(WithDefaultsModuleResult, { size = WithDefaultsModuleResult.size, ref = Ref }), { ChipContainer = Element })
end))