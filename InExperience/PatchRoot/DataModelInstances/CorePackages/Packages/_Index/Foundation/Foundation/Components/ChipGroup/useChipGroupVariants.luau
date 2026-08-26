local foundation = script:FindFirstAncestor("Foundation")
local chipSizeModule = require(foundation.Enums.ChipSize)
local chipGroupVariantModule = require(foundation.Enums.ChipGroupVariant)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)

local function variantsFactory(p1)
	-- upvalues: chipSizeModule (ref), chipGroupVariantModule (ref)
	return {
		scrimWidth = {
			[chipSizeModule.Small] = p1.Size.Size_600,
			[chipSizeModule.Medium] = p1.Size.Size_800
		},
		gap = {
			[chipSizeModule.Small] = p1.Padding.XSmall,
			[chipSizeModule.Medium] = p1.Padding.Small
		},
		variants = {
			[chipGroupVariantModule.Row] = { isWrapped = false, hasScrim = true },
			[chipGroupVariantModule.Wrap] = { isWrapped = true, hasScrim = false }
		}
	}
end

return function(p1, p2, p3)
	-- upvalues: variantsContextModule (ref), variantsFactory (ref)
	local chipGroup = variantsContextModule.useVariants("ChipGroup", variantsFactory, p1)
	local var1 = chipGroup.variants[p2]
	
	return {
		isWrapped = var1.isWrapped,
		hasScrim = var1.hasScrim,
		scrimWidth = chipGroup.scrimWidth[p3],
		gap = chipGroup.gap[p3]
	}
end