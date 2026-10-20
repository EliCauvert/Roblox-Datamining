local Foundation = script:FindFirstAncestor("Foundation")
local InputSizeModule = require(Foundation.Enums.InputSize)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local _ = require(Foundation.Providers.Style.Tokens)
local _ = require(Foundation.Components.Types)
local StateLayerAffordanceModule = require(Foundation.Enums.StateLayerAffordance)
local IconSizeModule = require(Foundation.Enums.IconSize)

local function v8(p1)
	-- upvalues: StateLayerAffordanceModule (copy), InputSizeModule (copy), IconSizeModule (copy)
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
				tag = "grow auto-y text-align-x-left text-truncate-end content-emphasis"
			}
		},
		sizes = {
			[InputSizeModule.XSmall] = {
				container = { tag = "radius-small" },
				header = { tag = "gap-small size-full-600" },
				content = { tag = "padding-bottom-small" },
				icon = { size = IconSizeModule.XSmall },
				text = { tag = "text-title-small" }
			},
			[InputSizeModule.Small] = {
				container = { tag = "radius-medium" },
				header = { tag = "gap-small size-full-800" },
				content = { tag = "padding-bottom-large" },
				icon = { size = IconSizeModule.Small },
				text = { tag = "text-title-small" }
			},
			[InputSizeModule.Medium] = {
				container = { tag = "radius-medium" },
				header = { tag = "gap-small size-full-1000" },
				content = { tag = "padding-bottom-xlarge" },
				icon = { size = IconSizeModule.Medium },
				text = { tag = "text-title-medium" }
			},
			[InputSizeModule.Large] = {
				container = { tag = "radius-medium" },
				header = { tag = "gap-small size-full-1200" },
				content = { tag = "padding-bottom-xlarge" },
				icon = { size = IconSizeModule.Large },
				text = { tag = "text-title-large" }
			}
		},
		isContained = {
			[false] = { header = { tag = "padding-x-xsmall" } },
			[true] = { header = { tag = "padding-x-medium" } }
		}
	}
end

return function(p1, p2, p3)
	-- upvalues: VariantsContextModule (copy), v8 (copy), ComposeStyleVariantModule (copy)
	local AccordionItem = VariantsContextModule.useVariants("AccordionItem", v8, p1)
	
	return ComposeStyleVariantModule(AccordionItem.common, AccordionItem.sizes[p2], AccordionItem.isContained[p3])
end