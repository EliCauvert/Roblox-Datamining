local foundation = script:FindFirstAncestor("Foundation")
local chipSizeModule = require(foundation.Enums.ChipSize)
local chipVariantModule = require(foundation.Enums.ChipVariant)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)

local function variantsFactory(p1)
	-- upvalues: chipSizeModule (ref), chipVariantModule (ref)
	return {
		common = {
			chip = {
				tag = "row align-x-center align-y-center auto-x radius-circle clip"
			},
			text = { tag = "shrink size-0-full auto-x text-truncate-end" }
		},
		sizes = {
			[chipSizeModule.Small] = {
				chip = { tag = "size-0-600" },
				text = { tag = "text-label-small" }
			},
			[chipSizeModule.Medium] = {
				chip = { tag = "size-0-800" },
				text = { tag = "text-label-medium" }
			},
			[chipSizeModule.Large] = {
				chip = { tag = "size-0-1000" },
				text = { tag = "text-label-medium" }
			}
		},
		types = {
			[chipVariantModule.Utility] = {
				[true] = {
					chip = { backgroundStyle = p1.Inverse.Surface.Surface_0 },
					text = { contentStyle = p1.Inverse.Content.Emphasis }
				},
				[false] = {
					chip = { backgroundStyle = p1.Color.ActionUtility.Background },
					text = { contentStyle = p1.Color.ActionUtility.Foreground }
				}
			},
			[chipVariantModule.Standard] = {
				[true] = {
					chip = { backgroundStyle = p1.Inverse.Surface.Surface_0 },
					text = { contentStyle = p1.Inverse.Content.Emphasis }
				},
				[false] = {
					chip = { backgroundStyle = p1.Color.ActionStandard.Background },
					text = { contentStyle = p1.Color.ActionStandard.Foreground }
				}
			}
		},
		textSpacing = {
			[chipSizeModule.Small] = UDim.new(0, p1.Padding.Small),
			[chipSizeModule.Medium] = UDim.new(0, p1.Padding.Medium),
			[chipSizeModule.Large] = UDim.new(0, p1.Padding.Large)
		}
	}
end

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), composeStyleVariantModule (ref)
	local chip = variantsContextModule.useVariants("Chip", variantsFactory, p1)
	
	return composeStyleVariantModule(chip.common, chip.sizes[p2], chip.types[p3][p4], {
		text = {
			padding = {
				left = if p5 then nil else chip.textSpacing[p2],
				right = if p6 then nil else chip.textSpacing[p2]
			}
		}
	})
end