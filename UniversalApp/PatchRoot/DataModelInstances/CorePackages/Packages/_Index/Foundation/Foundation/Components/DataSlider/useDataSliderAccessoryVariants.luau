local Foundation = script:FindFirstAncestor("Foundation")
local DataSliderAccessoryPlacementModule = require(Foundation.Enums.DataSliderAccessoryPlacement)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local _ = require(Foundation.Providers.Style.Tokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)

local function variantsFactory(_)
	-- upvalues: DataSliderAccessoryPlacementModule (copy)
	local config = {
		container = { tag = "fill auto-y" },
		text = { tag = "size-full-0 auto-y text-truncate-end" }
	}
	
	return {
		common = {
			container = { tag = "row align-y-center" },
			text = { tag = "text-label-medium content-default" }
		},
		placements = {
			[DataSliderAccessoryPlacementModule.Bottom] = config,
			[DataSliderAccessoryPlacementModule.Top] = config,
			[DataSliderAccessoryPlacementModule.Sides] = {
				container = { tag = "auto-xy" },
				text = { tag = "auto-xy" }
			}
		},
		trackEnds = {
			Leading = {
				container = { tag = "align-x-left" },
				text = { tag = "text-align-x-left" }
			},
			Trailing = {
				container = { tag = "align-x-right" },
				text = { tag = "text-align-x-right" }
			}
		}
	}
end

return function(p1, p2, p3)
	-- upvalues: VariantsContextModule (copy), variantsFactory (copy), ComposeStyleVariantModule (copy)
	local DataSliderAccessory = VariantsContextModule.useVariants("DataSliderAccessory", variantsFactory, p1)
	
	return ComposeStyleVariantModule(DataSliderAccessory.common, DataSliderAccessory.placements[p2], DataSliderAccessory.trackEnds[p3])
end