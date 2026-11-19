local Foundation = script:FindFirstAncestor("Foundation")
local ChipSizeModule = require(Foundation.Enums.ChipSize)
local ChipGroupVariantModule = require(Foundation.Enums.ChipGroupVariant)
local _ = require(Foundation.Providers.Style.Tokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)

local function variantsFactory(p1)
	-- upvalues: ChipSizeModule (copy), ChipGroupVariantModule (copy)
	return {
		gap = {
			[ChipSizeModule.Small] = p1.Padding.XSmall,
			[ChipSizeModule.Medium] = p1.Padding.Small
		},
		variants = {
			[ChipGroupVariantModule.Row] = { isWrapped = false },
			[ChipGroupVariantModule.Wrap] = { isWrapped = true }
		}
	}
end

return function(p1, p2, p3)
	-- upvalues: VariantsContextModule (copy), variantsFactory (copy)
	local ChipGroup = VariantsContextModule.useVariants("ChipGroup", variantsFactory, p1)
	
	return {
		isWrapped = ChipGroup.variants[p2].isWrapped,
		gap = ChipGroup.gap[p3]
	}
end