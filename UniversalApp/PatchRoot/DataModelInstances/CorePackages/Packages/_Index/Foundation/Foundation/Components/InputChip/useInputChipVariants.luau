local foundation = script:FindFirstAncestor("Foundation")
local inputSizeModule = require(foundation.Enums.InputSize)
local _ = require(foundation.Components.Types)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)

local function variantsFactory(p0)
	-- upvalues: inputSizeModule (ref)
	return {
		common = {
			container = {
				tag = "row align-x-center align-y-center auto-x radius-small bg-action-standard clip"
			},
			text = {
				tag = "shrink size-0-full auto-x text-truncate-end",
				contentStyle = p0.Color.ActionStandard.Foreground
			},
			close = { tag = "auto-xy" }
		},
		sizes = {
			[inputSizeModule.XSmall] = {
				container = { tag = "size-0-400" },
				text = {
					tag = "text-caption-small",
					padding = {
						left = UDim.new(0, p0.Size.Size_150),
						right = UDim.new(0, p0.Padding.XSmall)
					}
				},
				close = { padding = { right = UDim.new(0, p0.Size.Size_150) } }
			},
			[inputSizeModule.Small] = {
				container = { tag = "size-0-500" },
				text = {
					tag = "text-label-small",
					padding = {
						left = UDim.new(0, p0.Padding.Small),
						right = UDim.new(0, p0.Size.Size_150)
					}
				},
				close = { padding = { right = UDim.new(0, p0.Padding.Small) } }
			},
			[inputSizeModule.Medium] = {
				container = { tag = "size-0-600" },
				text = {
					tag = "text-label-small",
					padding = {
						left = UDim.new(0, p0.Padding.Small),
						right = UDim.new(0, p0.Size.Size_150)
					}
				},
				close = { padding = { right = UDim.new(0, p0.Padding.Small) } }
			},
			[inputSizeModule.Large] = {
				container = { tag = "size-0-800" },
				text = {
					tag = "text-label-medium",
					padding = {
						left = UDim.new(0, p0.Padding.Medium),
						right = UDim.new(0, p0.Padding.Small)
					}
				},
				close = { padding = { right = UDim.new(0, p0.Padding.Medium) } }
			}
		}
	}
end

return function(p1, p2)
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), composeStyleVariantModule (ref)
	local inputChip = variantsContextModule.useVariants("InputChip", variantsFactory, p1)
	
	return composeStyleVariantModule(inputChip.common, inputChip.sizes[p2])
end