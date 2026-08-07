local foundation = script:FindFirstAncestor("Foundation")
local dashModule = require(foundation.Parent.Dash)
local _ = require(foundation.Components.Types)
local inputSizeModule = require(foundation.Enums.InputSize)
local inputVariantModule = require(foundation.Enums.InputVariant)
local _ = require(foundation.Enums.IconSize)
local radiusModule = require(foundation.Enums.Radius)
local _ = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)

return function(p0) --[[ line: 39 | named "getInputVariantsFactory" ]]
	-- upvalues: inputSizeModule (ref), inputVariantModule (ref), dashModule (ref), radiusModule (ref)
	return {
		common = {
			container = {
				strokeStyle = p0.Color.Stroke.Emphasis,
				strokeThickness = p0.Stroke.Standard
			}
		},
		sizes = {
			[inputSizeModule.XSmall] = { container = { tag = "size-full-600" } },
			[inputSizeModule.Small] = { container = { tag = "size-full-800" } },
			[inputSizeModule.Medium] = { container = { tag = "size-full-1000" } },
			[inputSizeModule.Large] = { container = { tag = "size-full-1200" } }
		},
		variants = {
			[inputVariantModule.Standard] = {},
			[inputVariantModule.Contrast] = {
				container = {
					bgStyle = p0.Color.Shift.Shift_200,
					strokeStyle = dashModule.None
				}
			},
			[inputVariantModule.Utility] = {
				container = { bgStyle = dashModule.None, strokeStyle = dashModule.None }
			}
		},
		defaultRadius = {
			[inputSizeModule.XSmall] = { container = { tag = { ["radius-small"] = true } } },
			[inputSizeModule.Small] = { container = { tag = { ["radius-medium"] = true } } },
			[inputSizeModule.Medium] = { container = { tag = { ["radius-medium"] = true } } },
			[inputSizeModule.Large] = { container = { tag = { ["radius-medium"] = true } } }
		},
		radius = {
			[radiusModule.None] = { container = { tag = { ["radius-none"] = true } } },
			[radiusModule.XSmall] = { container = { tag = { ["radius-xsmall"] = true } } },
			[radiusModule.Small] = { container = { tag = { ["radius-small"] = true } } },
			[radiusModule.Medium] = { container = { tag = { ["radius-medium"] = true } } },
			[radiusModule.Large] = { container = { tag = { ["radius-large"] = true } } }
		},
		errorState = {
			[true] = { container = { strokeStyle = p0.Color.System.Alert } },
			[false] = {}
		},
		focusedState = {
			[true] = {
				container = {
					strokeStyle = p0.Color.System.Emphasis,
					strokeThickness = p0.Stroke.Standard * 2
				}
			},
			[false] = {}
		},
		hoverState = {
			[true] = { container = { strokeThickness = p0.Stroke.Standard * 2 } },
			[false] = {}
		}
	}
end