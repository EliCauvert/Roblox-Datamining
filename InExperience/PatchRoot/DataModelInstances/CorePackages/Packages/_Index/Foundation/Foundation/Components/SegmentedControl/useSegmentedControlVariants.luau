local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Components.Types)
local fillBehaviorModule = require(foundation.Enums.FillBehavior)
local inputSizeModule = require(foundation.Enums.InputSize)
local iconSizeModule = require(foundation.Enums.IconSize)
local segmentedControlVariantModule = require(foundation.Enums.SegmentedControlVariant)
local flagsModule = require(foundation.Utility.Flags)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)

local function _(p0, p1) --[[ line: 39 | named "strokeFromStyle" ]]
	return {
		Color = p0.Color3,
		Transparency = p0.Transparency,
		Thickness = p1,
		BorderStrokePosition = Enum.BorderStrokePosition.Outer
	}
end

local function variantsFactory_DEPRECATED(p2) --[[ line: 48 ]]
	-- upvalues: inputSizeModule (ref), iconSizeModule (ref)
	return {
		common = {
			container = { tag = "row align-y-center auto-x bg-surface-300" },
			segment = { tag = "row align-y-center size-0-full auto-x" },
			text = { tag = "auto-x text-truncate-end content-emphasis" },
			icon = { style = p2.Color.Content.Emphasis },
			divider = { tag = "row" }
		},
		sizes = {
			[inputSizeModule.XSmall] = {
				container = { tag = "size-600" },
				segment = { tag = "padding-small" },
				text = { tag = "text-caption-small" },
				icon = { size = iconSizeModule.Small },
				divider = { Size = UDim2.new(0, p2.Stroke.Standard, 1, 0) }
			},
			[inputSizeModule.Small] = {
				container = { tag = "size-800" },
				segment = { tag = "padding-small" },
				text = { tag = "text-caption-small" },
				icon = { size = iconSizeModule.Medium },
				divider = { Size = UDim2.new(0, p2.Stroke.Standard, 1, 0) }
			},
			[inputSizeModule.Medium] = {
				container = { tag = "size-1000 padding-xsmall" },
				segment = { tag = "padding-small" },
				text = { tag = "text-caption-medium" },
				icon = { size = iconSizeModule.Medium },
				divider = { Size = UDim2.new(0, p2.Stroke.Standard, 1, 0) }
			},
			[inputSizeModule.Large] = {
				container = { tag = "size-1200 padding-xsmall" },
				segment = { tag = "padding-medium" },
				text = { tag = "text-caption-medium" },
				icon = { size = iconSizeModule.Large },
				divider = { Size = UDim2.new(0, p2.Stroke.Standard, 1, 0) }
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

local function variantsFactory(p3) --[[ line: 124 ]]
	-- upvalues: segmentedControlVariantModule (ref), inputSizeModule (ref), iconSizeModule (ref), fillBehaviorModule (ref)
	local t = {
		[segmentedControlVariantModule.Filled] = { container = { tag = "bg-shift-200" } }
	}
	local stroke = segmentedControlVariantModule.Stroke
	local t_1 = {}
	local t_2 = {}
	local emphasis = p3.Color.Stroke.Emphasis
	t_2.stroke = {
		Color = emphasis.Color3,
		Transparency = emphasis.Transparency,
		Thickness = p3.Stroke.Standard,
		BorderStrokePosition = Enum.BorderStrokePosition.Outer
	}
	t_1.container = t_2
	t[stroke] = t_1
	t[segmentedControlVariantModule.Utility] = {}
	
	return {
		common = {
			container = { tag = "row flex-y-fill align-y-center gap-xxsmall" },
			segment = { tag = "row align-x-center align-y-center" },
			text = { tag = "auto-x text-align-x-center text-truncate-end" },
			icon = {}
		},
		activeStyles = {
			[true] = {
				text = { style = p3.Color.Content.Emphasis },
				icon = { style = p3.Color.Content.Emphasis }
			},
			[false] = {
				text = { style = p3.Color.Content.Default },
				icon = { style = p3.Color.Content.Default }
			}
		},
		variantStyles = t,
		sizes = {
			[inputSizeModule.XSmall] = {
				segment = { tag = "padding-x-small" },
				text = { tag = "text-label-small" },
				icon = { size = iconSizeModule.XSmall }
			},
			[inputSizeModule.Small] = {
				segment = { tag = "padding-x-medium" },
				text = { tag = "text-label-small" },
				icon = { size = iconSizeModule.Small }
			},
			[inputSizeModule.Medium] = {
				container = { tag = "padding-xsmall" },
				segment = { tag = "padding-x-medium" },
				text = { tag = "text-label-medium" },
				icon = { size = iconSizeModule.Medium }
			},
			[inputSizeModule.Large] = {
				container = { tag = "padding-xsmall" },
				segment = { tag = "padding-x-large" },
				text = { tag = "text-label-large" },
				icon = { size = iconSizeModule.Large }
			}
		},
		fitSizes = {
			[inputSizeModule.XSmall] = { container = { tag = "size-0-600 auto-x" } },
			[inputSizeModule.Small] = { container = { tag = "size-0-800 auto-x" } },
			[inputSizeModule.Medium] = { container = { tag = "size-0-1000 auto-x" } },
			[inputSizeModule.Large] = { container = { tag = "size-0-1200 auto-x" } }
		},
		fillBehaviorStyles = {
			[fillBehaviorModule.Fit] = { segment = { tag = "size-0-full auto-xy" } },
			[fillBehaviorModule.Fill] = { segment = { tag = "grow auto-xy" } }
		},
		fillSizes = {
			[inputSizeModule.XSmall] = { container = { tag = "size-full-600" } },
			[inputSizeModule.Small] = { container = { tag = "size-full-800" } },
			[inputSizeModule.Medium] = { container = { tag = "size-full-1000" } },
			[inputSizeModule.Large] = { container = { tag = "size-full-1200" } }
		},
		utilityPadding = {
			[inputSizeModule.XSmall] = {},
			[inputSizeModule.Small] = { segment = { tag = "padding-x-medium" } },
			[inputSizeModule.Medium] = { segment = { tag = "padding-x-large" } },
			[inputSizeModule.Large] = { segment = { tag = "padding-x-xlarge" } }
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

return function(p4, p5, p6, p7, p8, p9) --[[ line: 244 ]]
	-- upvalues: flagsModule (ref), variantsContextModule (ref), variantsFactory (ref), composeStyleVariantModule (ref), segmentedControlVariantModule (ref), fillBehaviorModule (ref), variantsFactory_DEPRECATED (ref)
	if flagsModule.FoundationSegmentedControlBeta then
		local segmentedControl = variantsContextModule.useVariants("SegmentedControl", variantsFactory, p4)
		
		return composeStyleVariantModule(segmentedControl.common, segmentedControl.sizes[p5], if p6 == segmentedControlVariantModule.Utility then segmentedControl.utilityPadding[p5] else {}, if p7 == fillBehaviorModule.Fill then segmentedControl.fillSizes[p5] else segmentedControl.fitSizes[p5], segmentedControl.fillBehaviorStyles[p7], segmentedControl.activeStyles[p9 == true], segmentedControl.variantStyles[p6], if p8 then segmentedControl.circularRadius else segmentedControl.defaultRadius[p5])
	end
	local segmentedControl = variantsContextModule.useVariants("SegmentedControl", variantsFactory_DEPRECATED, p4)
	
	return composeStyleVariantModule(segmentedControl.common, segmentedControl.sizes[p5], if p8 then segmentedControl.circularRadius else segmentedControl.defaultRadius[p5])
end