local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Components.Types)
local InputSizeModule = require(Foundation.Enums.InputSize)
local IconSizeModule = require(Foundation.Enums.IconSize)
local FlagsModule = require(Foundation.Utility.Flags)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local _ = require(Foundation.Providers.Style.Tokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)

local function variantsFactory(p1)
	-- upvalues: FlagsModule (copy), InputSizeModule (copy), IconSizeModule (copy)
	local Common = {
		container = {
			tag = if FlagsModule.FoundationSegmentedControlAutoXFix then "row align-y-center auto-x bg-surface-300" else "row align-y-center auto-xy bg-surface-300"
		},
		segment = {
			tag = if FlagsModule.FoundationSegmentedControlAutoXFix then "row align-y-center size-0-full auto-x" else "row align-y-center size-0-full auto-xy"
		},
		text = { tag = "auto-x text-truncate-end content-emphasis" },
		icon = { style = p1.Color.Content.Emphasis },
		divider = { tag = "row" }
	}
	
	return if FlagsModule.FoundationSegmentedControlCircular then {
		common = Common,
		sizes = {
			[InputSizeModule.XSmall] = {
				container = {
					tag = {
						["size-600"] = true,
						["padding-xsmall"] = not FlagsModule.FoundationSegmentedControlSizePaddingUpdate
					}
				},
				segment = { tag = "padding-small" },
				text = { tag = "text-caption-small" },
				icon = { size = IconSizeModule.Small },
				divider = { Size = UDim2.new(0, p1.Stroke.Standard, 1, 0) }
			},
			[InputSizeModule.Small] = {
				container = {
					tag = {
						["size-800"] = true,
						["padding-xsmall"] = not FlagsModule.FoundationSegmentedControlSizePaddingUpdate
					}
				},
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
				container = {
					tag = {
						["radius-medium"] = FlagsModule.FoundationSegmentedControlSizePaddingUpdate,
						["radius-small"] = not FlagsModule.FoundationSegmentedControlSizePaddingUpdate
					}
				},
				segment = {
					tag = {
						["radius-medium"] = FlagsModule.FoundationSegmentedControlSizePaddingUpdate,
						["radius-small"] = not FlagsModule.FoundationSegmentedControlSizePaddingUpdate
					}
				}
			},
			[InputSizeModule.Small] = {
				container = { tag = "radius-medium" },
				segment = {
					tag = {
						["radius-medium"] = FlagsModule.FoundationSegmentedControlSizePaddingUpdate,
						["radius-small"] = not FlagsModule.FoundationSegmentedControlSizePaddingUpdate
					}
				}
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
	} else {
		defaultRadius = nil,
		circularRadius = nil,
		common = Common,
		sizes = {
			[InputSizeModule.XSmall] = {
				container = {
					tag = if FlagsModule.FoundationSegmentedControlSizePaddingUpdate then "size-600 radius-medium" else "size-600 padding-xsmall radius-small"
				},
				segment = {
					tag = if FlagsModule.FoundationSegmentedControlSizePaddingUpdate then "padding-small radius-medium" else "padding-small radius-small"
				},
				text = { tag = "text-caption-small" },
				icon = { size = IconSizeModule.Small },
				divider = { Size = UDim2.new(0, p1.Stroke.Standard, 1, 0) }
			},
			[InputSizeModule.Small] = {
				container = {
					tag = if FlagsModule.FoundationSegmentedControlSizePaddingUpdate then "size-800 radius-medium" else "size-800 padding-xsmall radius-medium"
				},
				segment = {
					tag = if FlagsModule.FoundationSegmentedControlSizePaddingUpdate then "padding-small radius-medium" else "padding-small radius-small"
				},
				text = { tag = "text-caption-small" },
				icon = { size = IconSizeModule.Medium },
				divider = { Size = UDim2.new(0, p1.Stroke.Standard, 1, 0) }
			},
			[InputSizeModule.Medium] = {
				container = { tag = "size-1000 padding-xsmall radius-medium" },
				segment = { tag = "padding-small radius-small" },
				text = { tag = "text-caption-medium" },
				icon = { size = IconSizeModule.Medium },
				divider = { Size = UDim2.new(0, p1.Stroke.Standard, 1, 0) }
			},
			[InputSizeModule.Large] = {
				container = { tag = "size-1200 padding-xsmall radius-medium" },
				segment = { tag = "padding-medium radius-small" },
				text = { tag = "text-caption-medium" },
				icon = { size = IconSizeModule.Large },
				divider = { Size = UDim2.new(0, p1.Stroke.Standard, 1, 0) }
			}
		}
	}
end

return function(p1, p2, p3)
	-- upvalues: VariantsContextModule (copy), variantsFactory (copy), FlagsModule (copy), ComposeStyleVariantModule (copy)
	local SegmentedControl = VariantsContextModule.useVariants("SegmentedControl", variantsFactory, p1)
	
	return if FlagsModule.FoundationSegmentedControlCircular then ComposeStyleVariantModule(SegmentedControl.common, SegmentedControl.sizes[p2], if p3 then SegmentedControl.circularRadius else SegmentedControl.defaultRadius[p2]) else ComposeStyleVariantModule(SegmentedControl.common, SegmentedControl.sizes[p2])
end