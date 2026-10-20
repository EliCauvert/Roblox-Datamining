local Foundation = script:FindFirstAncestor("Foundation")
local InputSizeModule = require(Foundation.Enums.InputSize)
local _ = require(Foundation.Components.Types)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local _ = require(Foundation.Providers.Style.Tokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)

local function variantsFactory(p1)
	-- upvalues: InputSizeModule (copy)
	return {
		common = {
			container = {
				tag = "row align-x-center align-y-center auto-x radius-small bg-action-standard clip"
			},
			text = {
				tag = "shrink size-0-full auto-x text-truncate-end",
				contentStyle = p1.Color.ActionStandard.Foreground
			},
			close = { tag = "auto-xy" }
		},
		sizes = {
			[InputSizeModule.XSmall] = {
				container = { tag = "size-0-400" },
				text = {
					tag = "text-caption-small",
					padding = {
						left = UDim.new(0, p1.Size.Size_150),
						right = UDim.new(0, p1.Padding.XSmall)
					}
				},
				close = { padding = { right = UDim.new(0, p1.Size.Size_150) } }
			},
			[InputSizeModule.Small] = {
				container = { tag = "size-0-500" },
				text = {
					tag = "text-label-small",
					padding = {
						left = UDim.new(0, p1.Padding.Small),
						right = UDim.new(0, p1.Size.Size_150)
					}
				},
				close = { padding = { right = UDim.new(0, p1.Padding.Small) } }
			},
			[InputSizeModule.Medium] = {
				container = { tag = "size-0-600" },
				text = {
					tag = "text-label-small",
					padding = {
						left = UDim.new(0, p1.Padding.Small),
						right = UDim.new(0, p1.Size.Size_150)
					}
				},
				close = { padding = { right = UDim.new(0, p1.Padding.Small) } }
			},
			[InputSizeModule.Large] = {
				container = { tag = "size-0-800" },
				text = {
					tag = "text-label-medium",
					padding = {
						left = UDim.new(0, p1.Padding.Medium),
						right = UDim.new(0, p1.Padding.Small)
					}
				},
				close = { padding = { right = UDim.new(0, p1.Padding.Medium) } }
			}
		}
	}
end

return function(p1, p2)
	-- upvalues: VariantsContextModule (copy), variantsFactory (copy), ComposeStyleVariantModule (copy)
	local InputChip = VariantsContextModule.useVariants("InputChip", variantsFactory, p1)
	
	return ComposeStyleVariantModule(InputChip.common, InputChip.sizes[p2])
end