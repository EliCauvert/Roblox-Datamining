-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:59 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local inputSizeModule = require(foundation.Enums.InputSize)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local _ = require(foundation.Components.Types)
local stateLayerAffordanceModule = require(foundation.Enums.StateLayerAffordance)
local iconSizeModule = require(foundation.Enums.IconSize)

local var6 = function(p0) --[[ line: 28 ]]
	-- upvalues: stateLayerAffordanceModule (ref), inputSizeModule (ref), iconSizeModule (ref)
	return {
		common = {
			container = {
				tag = "col flex-y-between align-x-center size-full-0 auto-y",
				stateLayer = { affordance = stateLayerAffordanceModule.None }
			},
			header = { tag = "row flex-x-between align-y-center" },
			content = { tag = "size-full-0 auto-y padding-top-xsmall" },
			icon = { style = p0.Color.Content.Emphasis },
			text = {
				tag = "grow auto-y text-align-x-left text-truncate-end content-emphasis"
			}
		},
		sizes = {
			[inputSizeModule.XSmall] = {
				container = { tag = "radius-small" },
				header = { tag = "gap-small size-full-600" },
				content = { tag = "padding-bottom-small" },
				icon = { size = iconSizeModule.XSmall },
				text = { tag = "text-title-small" }
			},
			[inputSizeModule.Small] = {
				container = { tag = "radius-medium" },
				header = { tag = "gap-small size-full-800" },
				content = { tag = "padding-bottom-large" },
				icon = { size = iconSizeModule.Small },
				text = { tag = "text-title-small" }
			},
			[inputSizeModule.Medium] = {
				container = { tag = "radius-medium" },
				header = { tag = "gap-small size-full-1000" },
				content = { tag = "padding-bottom-xlarge" },
				icon = { size = iconSizeModule.Medium },
				text = { tag = "text-title-medium" }
			},
			[inputSizeModule.Large] = {
				container = { tag = "radius-medium" },
				header = { tag = "gap-small size-full-1200" },
				content = { tag = "padding-bottom-xlarge" },
				icon = { size = iconSizeModule.Large },
				text = { tag = "text-title-large" }
			}
		},
		isContained = {
			[false] = { header = { tag = "padding-x-xsmall" } },
			[true] = { header = { tag = "padding-x-medium" } }
		}
	}
end

return function(p1, p2, p3) --[[ line: 79 ]]
	-- upvalues: variantsContextModule (ref), var6 (ref), composeStyleVariantModule (ref)
	local accordionItem = variantsContextModule.useVariants("AccordionItem", var6, p1)
	
	return composeStyleVariantModule(accordionItem.common, accordionItem.sizes[p2], accordionItem.isContained[p3])
end