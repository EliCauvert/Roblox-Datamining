local Foundation = script:FindFirstAncestor("Foundation")
local InputSizeModule = require(Foundation.Enums.InputSize)
local LinkVariantModule = require(Foundation.Enums.LinkVariant)
local _ = require(Foundation.Components.Types)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)
local _ = require(Foundation.Providers.Style.Tokens)

local function variantsFactory(p1)
	-- upvalues: LinkVariantModule (copy), InputSizeModule (copy)
	return {
		common = {
			container = { tag = "row align-y-center auto-xy" },
			text = { tag = "auto-xy" }
		},
		variants = {
			[LinkVariantModule.Standard] = { content = { style = p1.Color.Content.Emphasis } },
			[LinkVariantModule.Inverse] = { content = { style = p1.Inverse.Content.Default } }
		},
		sizes = {
			[InputSizeModule.XSmall] = { text = { tag = "text-body-small" } },
			[InputSizeModule.Small] = { text = { tag = "text-body-small" } },
			[InputSizeModule.Medium] = { text = { tag = "text-body-medium" } },
			[InputSizeModule.Large] = { text = { tag = "text-body-large" } }
		}
	}
end

return function(p1, p2, p3)
	-- upvalues: VariantsContextModule (copy), variantsFactory (copy), ComposeStyleVariantModule (copy)
	local Link = VariantsContextModule.useVariants("Link", variantsFactory, p1)
	
	return ComposeStyleVariantModule(Link.common, Link.variants[p3], Link.sizes[p2])
end