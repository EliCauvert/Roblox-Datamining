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
	local t = {
		container = { tag = "row align-y-center auto-xy bg-surface-300" },
		segment = { tag = "row align-y-center size-0-full auto-xy" },
		text = { tag = "auto-x text-truncate-end content-emphasis" },
		icon = if flagsModule.FoundationSegmentedControlIconSupport then { style = p0.Color.Content.Emphasis } else nil,
		divider = { tag = "row" }
	}
	
	return if flagsModule.FoundationSegmentedControlCircular then {
		common = t,
		sizes = {
			[inputSizeModule.XSmall] = {
				container = {
					tag = {
						["size-600"] = true,
						["padding-xsmall"] = not flagsModule.FoundationSegmentedControlSizePaddingUpdate
					}
				},
				segment = { tag = "padding-small" },
				text = { tag = "text-caption-small" },
				icon = if flagsModule.FoundationSegmentedControlIconSupport then { size = iconSizeModule.Small } else nil,
				divider = { Size = UDim2.new(0, p0.Stroke.Standard, 1, 0) }
			},
			[inputSizeModule.Small] = {
				container = {
					tag = {
						["size-800"] = true,
						["padding-xsmall"] = not flagsModule.FoundationSegmentedControlSizePaddingUpdate
					}
				},
				segment = { tag = "padding-small" },
				text = { tag = "text-caption-small" },
				icon = if flagsModule.FoundationSegmentedControlIconSupport then { size = iconSizeModule.Medium } else nil,
				divider = { Size = UDim2.new(0, p0.Stroke.Standard, 1, 0) }
			},
			[inputSizeModule.Medium] = {
				container = { tag = "size-1000 padding-xsmall" },
				segment = { tag = "padding-small" },
				text = { tag = "text-caption-medium" },
				icon = if flagsModule.FoundationSegmentedControlIconSupport then { size = iconSizeModule.Medium } else nil,
				divider = { Size = UDim2.new(0, p0.Stroke.Standard, 1, 0) }
			},
			[inputSizeModule.Large] = {
				container = { tag = "size-1200 padding-xsmall" },
				segment = { tag = "padding-medium" },
				text = { tag = "text-caption-medium" },
				icon = if flagsModule.FoundationSegmentedControlIconSupport then { size = iconSizeModule.Large } else nil,
				divider = { Size = UDim2.new(0, p0.Stroke.Standard, 1, 0) }
			}
		},
		defaultRadius = {
			[inputSizeModule.XSmall] = {
				container = {
					tag = {
						["radius-medium"] = flagsModule.FoundationSegmentedControlSizePaddingUpdate,
						["radius-small"] = not flagsModule.FoundationSegmentedControlSizePaddingUpdate
					}
				},
				segment = {
					tag = {
						["radius-medium"] = flagsModule.FoundationSegmentedControlSizePaddingUpdate,
						["radius-small"] = not flagsModule.FoundationSegmentedControlSizePaddingUpdate
					}
				}
			},
			[inputSizeModule.Small] = {
				container = { tag = "radius-medium" },
				segment = {
					tag = {
						["radius-medium"] = flagsModule.FoundationSegmentedControlSizePaddingUpdate,
						["radius-small"] = not flagsModule.FoundationSegmentedControlSizePaddingUpdate
					}
				}
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
	} else {
		defaultRadius = nil,
		circularRadius = nil,
		common = t,
		sizes = {
			[inputSizeModule.XSmall] = {
				container = {
					tag = if flagsModule.FoundationSegmentedControlSizePaddingUpdate then "size-600 radius-medium" else "size-600 padding-xsmall radius-small"
				},
				segment = {
					tag = if flagsModule.FoundationSegmentedControlSizePaddingUpdate then "padding-small radius-medium" else "padding-small radius-small"
				},
				text = { tag = "text-caption-small" },
				icon = if flagsModule.FoundationSegmentedControlIconSupport then { size = iconSizeModule.Small } else nil,
				divider = { Size = UDim2.new(0, p0.Stroke.Standard, 1, 0) }
			},
			[inputSizeModule.Small] = {
				container = {
					tag = if flagsModule.FoundationSegmentedControlSizePaddingUpdate then "size-800 radius-medium" else "size-800 padding-xsmall radius-medium"
				},
				segment = {
					tag = if flagsModule.FoundationSegmentedControlSizePaddingUpdate then "padding-small radius-medium" else "padding-small radius-small"
				},
				text = { tag = "text-caption-small" },
				icon = if flagsModule.FoundationSegmentedControlIconSupport then { size = iconSizeModule.Medium } else nil,
				divider = { Size = UDim2.new(0, p0.Stroke.Standard, 1, 0) }
			},
			[inputSizeModule.Medium] = {
				container = { tag = "size-1000 padding-xsmall radius-medium" },
				segment = { tag = "padding-small radius-small" },
				text = { tag = "text-caption-medium" },
				icon = if flagsModule.FoundationSegmentedControlIconSupport then { size = iconSizeModule.Medium } else nil,
				divider = { Size = UDim2.new(0, p0.Stroke.Standard, 1, 0) }
			},
			[inputSizeModule.Large] = {
				container = { tag = "size-1200 padding-xsmall radius-medium" },
				segment = { tag = "padding-medium radius-small" },
				text = { tag = "text-caption-medium" },
				icon = if flagsModule.FoundationSegmentedControlIconSupport then { size = iconSizeModule.Large } else nil,
				divider = { Size = UDim2.new(0, p0.Stroke.Standard, 1, 0) }
			}
		}
	}
end

return function(p1, p2, p3) --[[ line: 187 ]]
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), flagsModule (ref), composeStyleVariantModule (ref)
	local segmentedControl = variantsContextModule.useVariants("SegmentedControl", variantsFactory, p1)
	
	return if flagsModule.FoundationSegmentedControlCircular then composeStyleVariantModule(segmentedControl.common, segmentedControl.sizes[p2], if p3 then segmentedControl.circularRadius else segmentedControl.defaultRadius[p2]) else composeStyleVariantModule(segmentedControl.common, segmentedControl.sizes[p2])
end