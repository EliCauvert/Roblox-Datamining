-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:01 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local chipSizeModule = require(foundation.Enums.ChipSize)
local chipGroupVariantModule = require(foundation.Enums.ChipGroupVariant)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)

local function variantsFactory(p0) --[[ line: 27 ]]
	-- upvalues: chipSizeModule (ref), chipGroupVariantModule (ref)
	return {
		scrimWidth = {
			[chipSizeModule.Small] = p0.Size.Size_600,
			[chipSizeModule.Medium] = p0.Size.Size_800
		},
		gap = {
			[chipSizeModule.Small] = p0.Padding.XSmall,
			[chipSizeModule.Medium] = p0.Padding.Small
		},
		variants = {
			[chipGroupVariantModule.Row] = { isWrapped = false, hasScrim = true },
			[chipGroupVariantModule.Wrap] = { isWrapped = true, hasScrim = false }
		}
	}
end

return function(p1, p2, p3) --[[ line: 56 ]]
	-- upvalues: variantsContextModule (ref), variantsFactory (ref)
	local chipGroup = variantsContextModule.useVariants("ChipGroup", variantsFactory, p1)
	local var6 = chipGroup.variants[p2]
	
	return {
		isWrapped = var6.isWrapped,
		hasScrim = var6.hasScrim,
		scrimWidth = chipGroup.scrimWidth[p3],
		gap = chipGroup.gap[p3]
	}
end