local Foundation = script:FindFirstAncestor("Foundation")
local ChipSizeModule = require(Foundation.Enums.ChipSize)
local ChipGroupVariantModule = require(Foundation.Enums.ChipGroupVariant)
local _ = require(Foundation.Providers.Style.Tokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)

local function variantsFactory(p1) --[[ Line: 27 ]]
	-- upvalues: ChipSizeModule (copy), ChipGroupVariantModule (copy)
	return {
		scrimWidth = {
			[ChipSizeModule.Small] = p1.Size.Size_600,
			[ChipSizeModule.Medium] = p1.Size.Size_800
		},
		gap = {
			[ChipSizeModule.Small] = p1.Padding.XSmall,
			[ChipSizeModule.Medium] = p1.Padding.Small
		},
		variants = {
			[ChipGroupVariantModule.Row] = { isWrapped = false, hasScrim = true },
			[ChipGroupVariantModule.Wrap] = { isWrapped = true, hasScrim = false }
		}
	}
end

return function(p1, p2, p3) --[[ Line: 56 ]]
	-- upvalues: VariantsContextModule (copy), variantsFactory (copy)
	local ChipGroup = VariantsContextModule.useVariants("ChipGroup", variantsFactory, p1)
	local Variant = ChipGroup.variants[p2]
	
	return {
		isWrapped = Variant.isWrapped,
		hasScrim = Variant.hasScrim,
		scrimWidth = ChipGroup.scrimWidth[p3],
		gap = ChipGroup.gap[p3]
	}
end