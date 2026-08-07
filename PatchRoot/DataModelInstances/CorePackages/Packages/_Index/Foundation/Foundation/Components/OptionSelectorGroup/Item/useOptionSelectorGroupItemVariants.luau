-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:06 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local iconSizeModule = require(foundation.Enums.IconSize)
local inputSizeModule = require(foundation.Enums.InputSize)
local fillBehaviorModule = require(foundation.Enums.FillBehavior)
local orientationModule = require(foundation.Enums.Orientation)
local flagsModule = require(foundation.Utility.Flags)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local _ = require(foundation.Components.Types)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)

local function variantsFactory(p0) --[[ line: 43 ]]
	-- upvalues: flagsModule (ref), inputSizeModule (ref), iconSizeModule (ref)
	return {
		common = {
			container = {
				tag = "col wrap align-x-left align-y-center gap-xsmall radius-medium",
				radius = p0.Radius.Medium
			},
			content = p0.Color.Content.Default,
			itemInner = if flagsModule.FoundationOptionSelectorGroupFixes then nil else { tag = "col gap-xsmall size-full-0 auto-y" },
			header = { tag = "row align-y-center gap-small size-full-0 auto-y" },
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
		},
		layouts = if flagsModule.FoundationOptionSelectorGroupFixes then {
			Inline = {
				container = { tag = "size-full-0 auto-y" },
				itemInner = { tag = "col gap-xsmall size-full-0 auto-y" }
			},
			StackedFill = {
				container = { tag = "fill auto-y" },
				itemInner = { tag = "col gap-xsmall size-full-0 auto-y" }
			},
			StackedFit = {
				container = { tag = "auto-xy" },
				itemInner = { tag = "col gap-xsmall auto-xy" },
				header = { tag = "flex-x-between" },
				textContainer = { tag = "col gap-xsmall auto-xy" }
			}
		} else {}
	}
end

return function(p1, p2, p3, p4) --[[ line: 116 ]]
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), flagsModule (ref), orientationModule (ref), fillBehaviorModule (ref), composeStyleVariantModule (ref)
	local optionSelectorGroupItem = variantsContextModule.useVariants("OptionSelectorGroupItem", variantsFactory, p1)
	
	return if flagsModule.FoundationOptionSelectorGroupFixes then composeStyleVariantModule(optionSelectorGroupItem.common, optionSelectorGroupItem.sizes[p2], if p3 == orientationModule.Horizontal then optionSelectorGroupItem.layouts.Inline elseif p3 == orientationModule.Vertical and p4 == fillBehaviorModule.Fit then optionSelectorGroupItem.layouts.StackedFit else optionSelectorGroupItem.layouts.StackedFill) else composeStyleVariantModule(optionSelectorGroupItem.common, optionSelectorGroupItem.sizes[p2])
end