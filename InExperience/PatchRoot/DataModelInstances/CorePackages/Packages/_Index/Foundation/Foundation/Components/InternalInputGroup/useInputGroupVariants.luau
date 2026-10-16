local Foundation = script:FindFirstAncestor("Foundation")
local InputSizeModule = require(Foundation.Enums.InputSize)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local _ = require(Foundation.Providers.Style.Tokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)
local _ = require(Foundation.Components.Types)

local function variantsFactory(_) --[[ Line: 22 ]]
	-- upvalues: InputSizeModule (copy)
	return {
		common = {
			container = { tag = "col auto-xy" },
			children = { tag = "col auto-xy" },
			legend = {
				tag = "auto-xy text-wrap text-align-x-left content-emphasis"
			}
		},
		sizes = {
			[InputSizeModule.XSmall] = {
				container = { tag = "gap-medium" },
				children = { tag = "gap-small" },
				legend = { tag = "text-title-small" }
			},
			[InputSizeModule.Small] = {
				container = { tag = "gap-large" },
				children = { tag = "gap-medium" },
				legend = { tag = "text-title-small" }
			},
			[InputSizeModule.Medium] = {
				container = { tag = "gap-large" },
				children = { tag = "gap-medium" },
				legend = { tag = "text-title-medium" }
			}
		}
	}
end

return function(p1, p2) --[[ Line: 77 | Named "useInputGroupVariants" ]]
	-- upvalues: VariantsContextModule (copy), variantsFactory (copy), ComposeStyleVariantModule (copy)
	local InputGroup = VariantsContextModule.useVariants("InputGroup", variantsFactory, p1)
	
	return ComposeStyleVariantModule(InputGroup.common, InputGroup.sizes[p2])
end