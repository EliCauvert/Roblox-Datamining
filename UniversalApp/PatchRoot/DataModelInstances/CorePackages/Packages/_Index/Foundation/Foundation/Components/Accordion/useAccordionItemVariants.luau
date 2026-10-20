local Foundation = script:FindFirstAncestor("Foundation")
local FlagsModule = require(Foundation.Utility.Flags)
local InputSizeModule = require(Foundation.Enums.InputSize)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local _ = require(Foundation.Providers.Style.Tokens)
local _ = require(Foundation.Components.Types)
local StateLayerAffordanceModule = require(Foundation.Enums.StateLayerAffordance)
local IconSizeModule = require(Foundation.Enums.IconSize)

local function v9(p1)
	-- upvalues: StateLayerAffordanceModule (copy), InputSizeModule (copy), IconSizeModule (copy), FlagsModule (copy)
	return {
		common = {
			container = {
				tag = "col flex-y-between align-x-center size-full-0 auto-y",
				stateLayer = { affordance = StateLayerAffordanceModule.None }
			},
			header = { tag = "row flex-x-between align-y-center" },
			content = { tag = "size-full-0 auto-y padding-top-xsmall" },
			icon = { style = p1.Color.Content.Emphasis },
			text = {
				tag = "auto-y text-align-x-left text-truncate-end content-emphasis"
			},
			textContainer = { tag = "col grow auto-y" },
			description = {
				tag = "size-full-0 auto-y text-align-x-left text-truncate-end"
			}
		},
		sizes = {
			[InputSizeModule.XSmall] = {
				container = { tag = "radius-small" },
				header = { tag = "gap-small size-full-600" },
				content = { tag = "padding-bottom-small" },
				icon = { size = IconSizeModule.XSmall },
				text = { tag = "text-title-small" },
				description = { tag = "text-body-small" }
			},
			[InputSizeModule.Small] = {
				container = { tag = "radius-medium" },
				header = { tag = "gap-small size-full-800" },
				content = { tag = "padding-bottom-large" },
				icon = { size = IconSizeModule.Small },
				text = { tag = "text-title-small" },
				description = { tag = "text-body-small" }
			},
			[InputSizeModule.Medium] = {
				container = { tag = "radius-medium" },
				header = { tag = "gap-small size-full-1000" },
				content = { tag = "padding-bottom-xlarge" },
				icon = { size = IconSizeModule.Medium },
				text = { tag = "text-title-medium" },
				description = { tag = "text-body-medium" }
			},
			[InputSizeModule.Large] = {
				container = { tag = "radius-medium" },
				header = { tag = "gap-small size-full-1200" },
				content = { tag = "padding-bottom-xlarge" },
				icon = { size = IconSizeModule.Large },
				text = { tag = "text-title-large" },
				description = { tag = "text-body-medium" }
			}
		},
		isContained = {
			[false] = {
				header = {
					tag = if FlagsModule.FoundationAccordionBeta then "" else "padding-x-xsmall"
				}
			},
			[true] = {
				header = { tag = "padding-x-medium" },
				content = { tag = "padding-x-medium" }
			}
		}
	}
end

return function(p1, p2, p3)
	-- upvalues: VariantsContextModule (copy), v9 (copy), ComposeStyleVariantModule (copy)
	local AccordionItem = VariantsContextModule.useVariants("AccordionItem", v9, p1)
	
	return ComposeStyleVariantModule(AccordionItem.common, AccordionItem.sizes[p2], AccordionItem.isContained[p3])
end