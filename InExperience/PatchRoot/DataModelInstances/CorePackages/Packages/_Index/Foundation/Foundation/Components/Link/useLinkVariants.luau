local foundation = script:FindFirstAncestor("Foundation")
local inputSizeModule = require(foundation.Enums.InputSize)
local linkVariantModule = require(foundation.Enums.LinkVariant)
local _ = require(foundation.Components.Types)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)
local _ = require(foundation.Providers.Style.Tokens)

local function variantsFactory(p1)
	-- upvalues: linkVariantModule (ref), inputSizeModule (ref)
	return {
		common = {
			container = { tag = "row align-y-center auto-xy" },
			text = { tag = "auto-xy" }
		},
		variants = {
			[linkVariantModule.Standard] = { content = { style = p1.Color.Content.Emphasis } },
			[linkVariantModule.Inverse] = { content = { style = p1.Inverse.Content.Default } }
		},
		sizes = {
			[inputSizeModule.XSmall] = { text = { tag = "text-body-small" } },
			[inputSizeModule.Small] = { text = { tag = "text-body-small" } },
			[inputSizeModule.Medium] = { text = { tag = "text-body-medium" } },
			[inputSizeModule.Large] = { text = { tag = "text-body-large" } }
		}
	}
end

return function(p1, p2, p3)
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), composeStyleVariantModule (ref)
	local link = variantsContextModule.useVariants("Link", variantsFactory, p1)
	
	return composeStyleVariantModule(link.common, link.variants[p3], link.sizes[p2])
end