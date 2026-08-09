local foundation = script:FindFirstAncestor("Foundation")
local iconSizeModule = require(foundation.Enums.IconSize)
local _ = require(foundation.Components.InternalInput)
local inputSizeModule = require(foundation.Enums.InputSize)
local _ = require(foundation.Enums.ControlState)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local _ = require(foundation.Components.Types)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)

local function variantsFactory(p0) --[[ line: 39 ]]
	-- upvalues: inputSizeModule (ref), iconSizeModule (ref)
	return {
		common = {
			container = {
				tag = "col wrap align-x-left align-y-center gap-xsmall radius-medium",
				radius = p0.Radius.Medium
			},
			content = p0.Color.Content.Default,
			itemInner = { tag = "col gap-xsmall size-full-0 auto-y" },
			label = { tag = "fill auto-xy" },
			metadata = { tag = "shrink auto-xy" },
			description = { tag = "grow auto-xy" }
		},
		sizes = {
			[inputSizeModule.XSmall] = {
				container = { tag = "padding-medium" },
				icon = { size = iconSizeModule.XSmall },
				label = { tag = "text-title-small" },
				metadata = { tag = "text-caption-small" },
				description = { tag = "text-body-small" }
			},
			[inputSizeModule.Small] = {
				container = { tag = "padding-large" },
				icon = { size = iconSizeModule.Small },
				label = { tag = "text-title-small" },
				metadata = { tag = "text-caption-small" },
				description = { tag = "text-body-small" }
			},
			[inputSizeModule.Medium] = {
				container = { tag = "padding-xlarge" },
				icon = { size = iconSizeModule.Medium },
				label = { tag = "text-title-medium" },
				metadata = { tag = "text-caption-medium" },
				description = { tag = "text-body-medium" }
			},
			[inputSizeModule.Large] = {
				container = { tag = "padding-xxlarge" },
				icon = { size = iconSizeModule.Large },
				label = { tag = "text-title-large" },
				metadata = { tag = "text-caption-large" },
				description = { tag = "text-body-large" }
			}
		}
	}
end

return function(p1, p2) --[[ line: 88 ]]
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), composeStyleVariantModule (ref)
	local optionSelectorGroupItem = variantsContextModule.useVariants("OptionSelectorGroupItem", variantsFactory, p1)
	
	return composeStyleVariantModule(optionSelectorGroupItem.common, optionSelectorGroupItem.sizes[p2])
end