local Foundation = script:FindFirstAncestor("Foundation")
local ChipSizeModule = require(Foundation.Enums.ChipSize)
local ChipVariantModule = require(Foundation.Enums.ChipVariant)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local _ = require(Foundation.Providers.Style.Tokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)

local function variantsFactory(p1) --[[ Line: 17 ]]
	-- upvalues: ChipSizeModule (copy), ChipVariantModule (copy)
	return {
		common = {
			chip = {
				tag = "row align-x-center align-y-center auto-x radius-circle clip"
			},
			text = { tag = "shrink size-0-full auto-x text-truncate-end" }
		},
		sizes = {
			[ChipSizeModule.Small] = {
				chip = { tag = "size-0-600" },
				text = { tag = "text-label-small" }
			},
			[ChipSizeModule.Medium] = {
				chip = { tag = "size-0-800" },
				text = { tag = "text-label-medium" }
			},
			[ChipSizeModule.Large] = {
				chip = { tag = "size-0-1000" },
				text = { tag = "text-label-medium" }
			}
		},
		types = {
			[ChipVariantModule.Utility] = {
				[true] = {
					chip = { backgroundStyle = p1.Inverse.Surface.Surface_0 },
					text = { contentStyle = p1.Inverse.Content.Emphasis }
				},
				[false] = {
					chip = { backgroundStyle = p1.Color.ActionUtility.Background },
					text = { contentStyle = p1.Color.ActionUtility.Foreground }
				}
			},
			[ChipVariantModule.Standard] = {
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
			[ChipSizeModule.Small] = UDim.new(0, p1.Padding.Small),
			[ChipSizeModule.Medium] = UDim.new(0, p1.Padding.Medium),
			[ChipSizeModule.Large] = UDim.new(0, p1.Padding.Large)
		}
	}
end

return function(p1, p2, p3, p4, p5, p6) --[[ Line: 75 ]]
	-- upvalues: VariantsContextModule (copy), variantsFactory (copy), ComposeStyleVariantModule (copy)
	local Chip = VariantsContextModule.useVariants("Chip", variantsFactory, p1)
	
	return ComposeStyleVariantModule(Chip.common, Chip.sizes[p2], Chip.types[p3][p4], {
		text = {
			padding = {
				left = if p5 then nil else Chip.textSpacing[p2],
				right = if p6 then nil else Chip.textSpacing[p2]
			}
		}
	})
end