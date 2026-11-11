local Foundation = script:FindFirstAncestor("Foundation")
local DashModule = require(Foundation.Parent.Dash)
local FlagsModule = require(Foundation.Utility.Flags)
local _ = require(Foundation.Components.Types)
local InputSizeModule = require(Foundation.Enums.InputSize)
local InputVariantModule = require(Foundation.Enums.InputVariant)
local _ = require(Foundation.Enums.IconSize)
local RadiusModule = require(Foundation.Enums.Radius)
local _ = require(Foundation.Utility.composeStyleVariant)
local _ = require(Foundation.Providers.Style.Tokens)

return function(p1)
	-- upvalues: FlagsModule (copy), InputSizeModule (copy), InputVariantModule (copy), DashModule (copy), RadiusModule (copy)
	return {
		common = {
			container = {
				bgStyle = if FlagsModule.FoundationTextInputRemoveBackgroundStyle then nil else p1.Color.Shift.Shift_100,
				strokeStyle = p1.Color.Stroke.Emphasis,
				strokeThickness = p1.Stroke.Standard
			}
		},
		sizes = {
			[InputSizeModule.XSmall] = { container = { tag = "size-full-600" } },
			[InputSizeModule.Small] = { container = { tag = "size-full-800" } },
			[InputSizeModule.Medium] = { container = { tag = "size-full-1000" } },
			[InputSizeModule.Large] = { container = { tag = "size-full-1200" } }
		},
		variants = {
			[InputVariantModule.Standard] = if FlagsModule.FoundationTextInputRemoveBackgroundStyle then {} else { container = { bgStyle = p1.Color.Shift.Shift_100 } },
			[InputVariantModule.Contrast] = {
				container = {
					bgStyle = p1.Color.Shift.Shift_200,
					strokeStyle = DashModule.None
				}
			},
			[InputVariantModule.Utility] = {
				container = { bgStyle = DashModule.None, strokeStyle = DashModule.None }
			}
		},
		defaultRadius = {
			[InputSizeModule.XSmall] = { container = { tag = { ["radius-small"] = true } } },
			[InputSizeModule.Small] = { container = { tag = { ["radius-medium"] = true } } },
			[InputSizeModule.Medium] = { container = { tag = { ["radius-medium"] = true } } },
			[InputSizeModule.Large] = { container = { tag = { ["radius-medium"] = true } } }
		},
		radius = {
			[RadiusModule.None] = { container = { tag = { ["radius-none"] = true } } },
			[RadiusModule.XSmall] = { container = { tag = { ["radius-xsmall"] = true } } },
			[RadiusModule.Small] = { container = { tag = { ["radius-small"] = true } } },
			[RadiusModule.Medium] = { container = { tag = { ["radius-medium"] = true } } },
			[RadiusModule.Large] = { container = { tag = { ["radius-large"] = true } } }
		},
		errorState = {
			[true] = { container = { strokeStyle = p1.Color.System.Alert } },
			[false] = {}
		},
		focusedState = {
			[true] = {
				container = {
					strokeStyle = p1.Color.System.Emphasis,
					strokeThickness = p1.Stroke.Standard * 2
				}
			},
			[false] = {}
		},
		hoverState = {
			[true] = { container = { strokeThickness = p1.Stroke.Standard * 2 } },
			[false] = {}
		}
	}
end