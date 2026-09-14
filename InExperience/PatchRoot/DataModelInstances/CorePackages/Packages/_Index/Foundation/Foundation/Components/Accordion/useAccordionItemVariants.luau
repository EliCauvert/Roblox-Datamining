local foundation = script:FindFirstAncestor("Foundation")
local flagsModule = require(foundation.Utility.Flags)
local inputSizeModule = require(foundation.Enums.InputSize)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local _ = require(foundation.Components.Types)
local stateLayerAffordanceModule = require(foundation.Enums.StateLayerAffordance)
local iconSizeModule = require(foundation.Enums.IconSize)

local var1 = function(p1)
	-- upvalues: stateLayerAffordanceModule (ref), inputSizeModule (ref), iconSizeModule (ref), flagsModule (ref)
	return {
		common = {
			container = {
				tag = "col flex-y-between align-x-center size-full-0 auto-y",
				stateLayer = { affordance = stateLayerAffordanceModule.None }
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
			[inputSizeModule.XSmall] = {
				container = { tag = "radius-small" },
				header = { tag = "gap-small size-full-600" },
				content = { tag = "padding-bottom-small" },
				icon = { size = iconSizeModule.XSmall },
				text = { tag = "text-title-small" },
				description = { tag = "text-body-small" }
			},
			[inputSizeModule.Small] = {
				container = { tag = "radius-medium" },
				header = { tag = "gap-small size-full-800" },
				content = { tag = "padding-bottom-large" },
				icon = { size = iconSizeModule.Small },
				text = { tag = "text-title-small" },
				description = { tag = "text-body-small" }
			},
			[inputSizeModule.Medium] = {
				container = { tag = "radius-medium" },
				header = { tag = "gap-small size-full-1000" },
				content = { tag = "padding-bottom-xlarge" },
				icon = { size = iconSizeModule.Medium },
				text = { tag = "text-title-medium" },
				description = { tag = "text-body-medium" }
			},
			[inputSizeModule.Large] = {
				container = { tag = "radius-medium" },
				header = { tag = "gap-small size-full-1200" },
				content = { tag = "padding-bottom-xlarge" },
				icon = { size = iconSizeModule.Large },
				text = { tag = "text-title-large" },
				description = { tag = "text-body-medium" }
			}
		},
		isContained = {
			[false] = {
				header = {
					tag = if flagsModule.FoundationAccordionBeta then "" else "padding-x-xsmall"
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
	-- upvalues: variantsContextModule (ref), var1 (ref), composeStyleVariantModule (ref)
	local accordionItem = variantsContextModule.useVariants("AccordionItem", var1, p1)
	
	return composeStyleVariantModule(accordionItem.common, accordionItem.sizes[p2], accordionItem.isContained[p3])
end