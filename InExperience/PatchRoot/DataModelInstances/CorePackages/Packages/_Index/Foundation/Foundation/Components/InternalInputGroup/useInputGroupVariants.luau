local foundation = script:FindFirstAncestor("Foundation")
local inputSizeModule = require(foundation.Enums.InputSize)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)
local _ = require(foundation.Components.Types)

local function variantsFactory(_) --[[ line: 22 ]]
	-- upvalues: inputSizeModule (ref)
	return {
		common = {
			container = { tag = "col auto-xy" },
			children = { tag = "col auto-xy" },
			legend = {
				tag = "auto-xy text-wrap text-align-x-left content-emphasis"
			}
		},
		sizes = {
			[inputSizeModule.XSmall] = {
				container = { tag = "gap-medium" },
				children = { tag = "gap-small" },
				legend = { tag = "text-title-small" }
			},
			[inputSizeModule.Small] = {
				container = { tag = "gap-large" },
				children = { tag = "gap-medium" },
				legend = { tag = "text-title-small" }
			},
			[inputSizeModule.Medium] = {
				container = { tag = "gap-large" },
				children = { tag = "gap-medium" },
				legend = { tag = "text-title-medium" }
			}
		}
	}
end

return function(p0, p1) --[[ line: 77 | named "useInputGroupVariants" ]]
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), composeStyleVariantModule (ref)
	local inputGroup = variantsContextModule.useVariants("InputGroup", variantsFactory, p0)
	
	return composeStyleVariantModule(inputGroup.common, inputGroup.sizes[p1])
end