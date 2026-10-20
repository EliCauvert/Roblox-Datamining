local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Components.Types)
local FillBehaviorModule = require(Foundation.Enums.FillBehavior)
local InputSizeModule = require(Foundation.Enums.InputSize)
local IconSizeModule = require(Foundation.Enums.IconSize)
local SegmentedControlVariantModule = require(Foundation.Enums.SegmentedControlVariant)
local FlagsModule = require(Foundation.Utility.Flags)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local _ = require(Foundation.Providers.Style.Tokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)

local function _(p1, Thickness)
	return {
		Color = p1.Color3,
		Transparency = p1.Transparency,
		Thickness = Thickness,
		BorderStrokePosition = Enum.BorderStrokePosition.Outer
	}
end

local function variantsFactory_DEPRECATED(p1)
	-- upvalues: InputSizeModule (copy), IconSizeModule (copy)
	return {
		common = {
			container = { tag = "row align-y-center auto-x bg-surface-300" },
			segment = { tag = "row align-y-center size-0-full auto-x" },
			text = { tag = "auto-x text-truncate-end content-emphasis" },
			icon = { style = p1.Color.Content.Emphasis },
			divider = { tag = "row" }
		},
		sizes = {
			[InputSizeModule.XSmall] = {
				container = { tag = "size-600" },
				segment = { tag = "padding-small" },
				text = { tag = "text-caption-small" },
				icon = { size = IconSizeModule.Small },
				divider = { Size = UDim2.new(0, p1.Stroke.Standard, 1, 0) }
			},
			[InputSizeModule.Small] = {
				container = { tag = "size-800" },
				segment = { tag = "padding-small" },
				text = { tag = "text-caption-small" },
				icon = { size = IconSizeModule.Medium },
				divider = { Size = UDim2.new(0, p1.Stroke.Standard, 1, 0) }
			},
			[InputSizeModule.Medium] = {
				container = { tag = "size-1000 padding-xsmall" },
				segment = { tag = "padding-small" },
				text = { tag = "text-caption-medium" },
				icon = { size = IconSizeModule.Medium },
				divider = { Size = UDim2.new(0, p1.Stroke.Standard, 1, 0) }
			},
			[InputSizeModule.Large] = {
				container = { tag = "size-1200 padding-xsmall" },
				segment = { tag = "padding-medium" },
				text = { tag = "text-caption-medium" },
				icon = { size = IconSizeModule.Large },
				divider = { Size = UDim2.new(0, p1.Stroke.Standard, 1, 0) }
			}
		},
		defaultRadius = {
			[InputSizeModule.XSmall] = {
				container = { tag = "radius-medium" },
				segment = { tag = "radius-medium" }
			},
			[InputSizeModule.Small] = {
				container = { tag = "radius-medium" },
				segment = { tag = "radius-medium" }
			},
			[InputSizeModule.Medium] = {
				container = { tag = "radius-medium" },
				segment = { tag = "radius-small" }
			},
			[InputSizeModule.Large] = {
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

local function variantsFactory(p1)
	-- upvalues: SegmentedControlVariantModule (copy), InputSizeModule (copy), IconSizeModule (copy), FillBehaviorModule (copy)
	local Emphasis = p1.Color.Stroke.Emphasis
	
	return {
		common = {
			container = { tag = "row flex-y-fill align-y-center gap-xxsmall" },
			segment = { tag = "row align-x-center align-y-center" },
			text = { tag = "auto-x text-align-x-center text-truncate-end" },
			icon = {}
		},
		activeStyles = {
			[true] = {
				text = { style = p1.Color.Content.Emphasis },
				icon = { style = p1.Color.Content.Emphasis }
			},
			[false] = {
				text = { style = p1.Color.Content.Default },
				icon = { style = p1.Color.Content.Default }
			}
		},
		variantStyles = {
			[SegmentedControlVariantModule.Filled] = { container = { tag = "bg-shift-200" } },
			[SegmentedControlVariantModule.Stroke] = {
				container = {
					stroke = {
						Color = Emphasis.Color3,
						Transparency = Emphasis.Transparency,
						Thickness = p1.Stroke.Standard,
						BorderStrokePosition = Enum.BorderStrokePosition.Outer
					}
				}
			},
			[SegmentedControlVariantModule.Utility] = {}
		},
		sizes = {
			[InputSizeModule.XSmall] = {
				segment = { tag = "padding-x-small" },
				text = { tag = "text-label-small" },
				icon = { size = IconSizeModule.XSmall }
			},
			[InputSizeModule.Small] = {
				segment = { tag = "padding-x-medium" },
				text = { tag = "text-label-small" },
				icon = { size = IconSizeModule.Small }
			},
			[InputSizeModule.Medium] = {
				container = { tag = "padding-xsmall" },
				segment = { tag = "padding-x-medium" },
				text = { tag = "text-label-medium" },
				icon = { size = IconSizeModule.Medium }
			},
			[InputSizeModule.Large] = {
				container = { tag = "padding-xsmall" },
				segment = { tag = "padding-x-large" },
				text = { tag = "text-label-large" },
				icon = { size = IconSizeModule.Large }
			}
		},
		fitSizes = {
			[InputSizeModule.XSmall] = { container = { tag = "size-0-600 auto-x" } },
			[InputSizeModule.Small] = { container = { tag = "size-0-800 auto-x" } },
			[InputSizeModule.Medium] = { container = { tag = "size-0-1000 auto-x" } },
			[InputSizeModule.Large] = { container = { tag = "size-0-1200 auto-x" } }
		},
		fillBehaviorStyles = {
			[FillBehaviorModule.Fit] = { segment = { tag = "size-0-full auto-xy" } },
			[FillBehaviorModule.Fill] = { segment = { tag = "grow auto-xy" } }
		},
		fillSizes = {
			[InputSizeModule.XSmall] = { container = { tag = "size-full-600" } },
			[InputSizeModule.Small] = { container = { tag = "size-full-800" } },
			[InputSizeModule.Medium] = { container = { tag = "size-full-1000" } },
			[InputSizeModule.Large] = { container = { tag = "size-full-1200" } }
		},
		utilityPadding = {
			[InputSizeModule.XSmall] = {},
			[InputSizeModule.Small] = { segment = { tag = "padding-x-medium" } },
			[InputSizeModule.Medium] = { segment = { tag = "padding-x-large" } },
			[InputSizeModule.Large] = { segment = { tag = "padding-x-xlarge" } }
		},
		defaultRadius = {
			[InputSizeModule.XSmall] = {
				container = { tag = "radius-medium" },
				segment = { tag = "radius-medium" }
			},
			[InputSizeModule.Small] = {
				container = { tag = "radius-medium" },
				segment = { tag = "radius-medium" }
			},
			[InputSizeModule.Medium] = {
				container = { tag = "radius-medium" },
				segment = { tag = "radius-small" }
			},
			[InputSizeModule.Large] = {
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

return function(p1, p2, Utility, Fill, p3, Enabled)
	-- upvalues: FlagsModule (copy), VariantsContextModule (copy), variantsFactory (copy), ComposeStyleVariantModule (copy), SegmentedControlVariantModule (copy), FillBehaviorModule (copy), variantsFactory_DEPRECATED (copy)
	if FlagsModule.FoundationSegmentedControlBeta then
		local SegmentedControl = VariantsContextModule.useVariants("SegmentedControl", variantsFactory, p1)
		
		return ComposeStyleVariantModule(SegmentedControl.common, SegmentedControl.sizes[p2], if Utility == SegmentedControlVariantModule.Utility then SegmentedControl.utilityPadding[p2] else {}, if Fill == FillBehaviorModule.Fill then SegmentedControl.fillSizes[p2] else SegmentedControl.fitSizes[p2], SegmentedControl.fillBehaviorStyles[Fill], SegmentedControl.activeStyles[Enabled == true], SegmentedControl.variantStyles[Utility], if p3 then SegmentedControl.circularRadius else SegmentedControl.defaultRadius[p2])
	else
		local SegmentedControl = VariantsContextModule.useVariants("SegmentedControl", variantsFactory_DEPRECATED, p1)
		
		return ComposeStyleVariantModule(SegmentedControl.common, SegmentedControl.sizes[p2], if p3 then SegmentedControl.circularRadius else SegmentedControl.defaultRadius[p2])
	end
end