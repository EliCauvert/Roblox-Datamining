local Foundation = script:FindFirstAncestor("Foundation")
local IconSizeModule = require(Foundation.Enums.IconSize)
local _ = require(Foundation.Components.InternalInput)
local InputSizeModule = require(Foundation.Enums.InputSize)
local _ = require(Foundation.Enums.ControlState)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local _ = require(Foundation.Providers.Style.Tokens)
local _ = require(Foundation.Components.Types)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)

local function variantsFactory(p1)
	-- upvalues: InputSizeModule (copy), IconSizeModule (copy)
	return {
		common = {
			container = {
				tag = "col wrap align-x-left align-y-center gap-xsmall radius-medium",
				radius = p1.Radius.Medium
			},
			content = p1.Color.Content.Default,
			itemInner = { tag = "col gap-xsmall size-full-0 auto-y" },
			label = { tag = "fill auto-xy" },
			metadata = { tag = "shrink auto-xy" },
			description = { tag = "grow auto-xy" }
		},
		sizes = {
			[InputSizeModule.XSmall] = {
				container = { tag = "padding-medium" },
				icon = { size = IconSizeModule.XSmall },
				label = { tag = "text-title-small" },
				metadata = { tag = "text-caption-small" },
				description = { tag = "text-body-small" }
			},
			[InputSizeModule.Small] = {
				container = { tag = "padding-large" },
				icon = { size = IconSizeModule.Small },
				label = { tag = "text-title-small" },
				metadata = { tag = "text-caption-small" },
				description = { tag = "text-body-small" }
			},
			[InputSizeModule.Medium] = {
				container = { tag = "padding-xlarge" },
				icon = { size = IconSizeModule.Medium },
				label = { tag = "text-title-medium" },
				metadata = { tag = "text-caption-medium" },
				description = { tag = "text-body-medium" }
			},
			[InputSizeModule.Large] = {
				container = { tag = "padding-xxlarge" },
				icon = { size = IconSizeModule.Large },
				label = { tag = "text-title-large" },
				metadata = { tag = "text-caption-large" },
				description = { tag = "text-body-large" }
			}
		}
	}
end

return function(p1, p2)
	-- upvalues: VariantsContextModule (copy), variantsFactory (copy), ComposeStyleVariantModule (copy)
	local OptionSelectorGroupItem = VariantsContextModule.useVariants("OptionSelectorGroupItem", variantsFactory, p1)
	
	return ComposeStyleVariantModule(OptionSelectorGroupItem.common, OptionSelectorGroupItem.sizes[p2])
end