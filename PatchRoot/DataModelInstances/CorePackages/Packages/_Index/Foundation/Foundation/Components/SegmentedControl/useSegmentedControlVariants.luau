-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:07 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Components.Types)
local inputSizeModule = require(foundation.Enums.InputSize)
local iconSizeModule = require(foundation.Enums.IconSize)
local flagsModule = require(foundation.Utility.Flags)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)

local function variantsFactory(p0) --[[ line: 29 ]]
	-- upvalues: flagsModule (ref), inputSizeModule (ref), iconSizeModule (ref)
	return {
		common = {
			container = {
				tag = if flagsModule.FoundationSegmentedControlAutoXFix then "row align-y-center auto-x bg-surface-300" else "row align-y-center auto-xy bg-surface-300"
			},
			segment = {
				tag = if flagsModule.FoundationSegmentedControlAutoXFix then "row align-y-center size-0-full auto-x" else "row align-y-center size-0-full auto-xy"
			},
			text = { tag = "auto-x text-truncate-end content-emphasis" },
			icon = { style = p0.Color.Content.Emphasis },
			divider = { tag = "row" }
		},
		sizes = {
			[inputSizeModule.XSmall] = {
				container = { tag = "size-600" },
				segment = { tag = "padding-small" },
				text = { tag = "text-caption-small" },
				icon = { size = iconSizeModule.Small },
				divider = { Size = UDim2.new(0, p0.Stroke.Standard, 1, 0) }
			},
			[inputSizeModule.Small] = {
				container = { tag = "size-800" },
				segment = { tag = "padding-small" },
				text = { tag = "text-caption-small" },
				icon = { size = iconSizeModule.Medium },
				divider = { Size = UDim2.new(0, p0.Stroke.Standard, 1, 0) }
			},
			[inputSizeModule.Medium] = {
				container = { tag = "size-1000 padding-xsmall" },
				segment = { tag = "padding-small" },
				text = { tag = "text-caption-medium" },
				icon = { size = iconSizeModule.Medium },
				divider = { Size = UDim2.new(0, p0.Stroke.Standard, 1, 0) }
			},
			[inputSizeModule.Large] = {
				container = { tag = "size-1200 padding-xsmall" },
				segment = { tag = "padding-medium" },
				text = { tag = "text-caption-medium" },
				icon = { size = iconSizeModule.Large },
				divider = { Size = UDim2.new(0, p0.Stroke.Standard, 1, 0) }
			}
		},
		defaultRadius = {
			[inputSizeModule.XSmall] = {
				container = { tag = "radius-medium" },
				segment = { tag = "radius-medium" }
			},
			[inputSizeModule.Small] = {
				container = { tag = "radius-medium" },
				segment = { tag = "radius-medium" }
			},
			[inputSizeModule.Medium] = {
				container = { tag = "radius-medium" },
				segment = { tag = "radius-small" }
			},
			[inputSizeModule.Large] = {
				container = { tag = "radius-medium" },
				segment = { tag = "radius-small" }
			}
		},
		circularRadius = {
			container = { tag = "radius-circle" },
			segment = { tag = "radius-circle" }
		}
	}
end

return function(p1, p2, p3) --[[ line: 112 ]]
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), composeStyleVariantModule (ref)
	local segmentedControl = variantsContextModule.useVariants("SegmentedControl", variantsFactory, p1)
	
	return composeStyleVariantModule(segmentedControl.common, segmentedControl.sizes[p2], if p3 then segmentedControl.circularRadius else segmentedControl.defaultRadius[p2])
end