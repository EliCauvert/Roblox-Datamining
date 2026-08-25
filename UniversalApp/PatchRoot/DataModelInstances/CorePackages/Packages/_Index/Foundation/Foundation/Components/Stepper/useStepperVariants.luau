local foundation = script:FindFirstAncestor("Foundation")
local iconSizeModule = require(foundation.Enums.IconSize)
local inputSizeModule = require(foundation.Enums.InputSize)
local stepperStepStateModule = require(foundation.Enums.StepperStepState)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Components.Types)

local function variantsFactory(p0)
	-- upvalues: inputSizeModule (ref), iconSizeModule (ref), stepperStepStateModule (ref)
	return {
		common = {
			container = { tag = "auto-xy" },
			label = { tag = "auto-xy text-align-x-left content-emphasis" },
			description = { tag = "auto-xy text-align-x-left" },
			textColumn = { tag = "col auto-xy" },
			content = { tag = "row align-y-center auto-xy" },
			index = { tag = "auto-xy text-align-x-center text-align-y-center" },
			indicatorOuter = { tag = "row align-x-center align-y-center auto-xy" },
			indicatorInner = { tag = "row align-x-center align-y-center radius-circle" }
		},
		sizes = {
			[inputSizeModule.XSmall] = {
				content = {
					tag = "size-0-800",
					padding = {
						left = UDim.new(0, p0.Padding.XSmall),
						right = UDim.new(0, p0.Padding.Small),
						top = UDim.new(0, p0.Size.Size_250),
						bottom = UDim.new(0, p0.Size.Size_250)
					}
				},
				textColumn = { padding = { left = UDim.new(0, p0.Size.Size_250) } },
				indicatorInner = { tag = "size-300-300" },
				index = { tag = "text-caption-small" },
				label = { tag = "text-label-small" },
				description = { tag = "text-body-small" },
				icon = { size = iconSizeModule.XSmall }
			},
			[inputSizeModule.Small] = {
				content = {
					tag = "size-0-1000",
					padding = {
						left = UDim.new(0, p0.Size.Size_150),
						right = UDim.new(0, p0.Size.Size_300),
						top = UDim.new(0, p0.Size.Size_300),
						bottom = UDim.new(0, p0.Size.Size_300)
					}
				},
				textColumn = { padding = { left = UDim.new(0, p0.Gap.Medium) } },
				indicatorInner = { tag = "size-400-400" },
				index = { tag = "text-caption-medium" },
				label = { tag = "text-label-small" },
				description = { tag = "text-body-small" },
				icon = { size = iconSizeModule.Small }
			},
			[inputSizeModule.Medium] = {
				content = {
					tag = "size-0-1200",
					padding = {
						left = UDim.new(0, p0.Padding.Small),
						right = UDim.new(0, p0.Padding.Large),
						top = UDim.new(0, p0.Size.Size_350),
						bottom = UDim.new(0, p0.Size.Size_350)
					}
				},
				textColumn = { padding = { left = UDim.new(0, p0.Gap.Medium) } },
				indicatorInner = { tag = "size-500-500" },
				index = { tag = "text-caption-large" },
				label = { tag = "text-label-medium" },
				description = { tag = "text-body-medium" },
				icon = { size = iconSizeModule.Medium }
			}
		},
		isFill = { [false] = {}, [true] = { container = { tag = "grow" } } },
		stepStates = {
			[stepperStepStateModule.Complete] = {
				indicatorInner = { tag = "bg-system-contrast" },
				description = { tag = "content-default" }
			},
			[stepperStepStateModule.Current] = {
				indicatorInner = { tag = "bg-system-contrast" },
				description = { tag = "content-emphasis" },
				index = { tag = "content-inverse-emphasis" }
			},
			[stepperStepStateModule.Incomplete] = {
				indicatorInner = { tag = "bg-shift-300" },
				description = { tag = "content-default" },
				index = { tag = "content-default" }
			}
		}
	}
end

return function(p1, p2, p3, p4)
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), composeStyleVariantModule (ref)
	local stepper = variantsContextModule.useVariants("Stepper", variantsFactory, p1)
	
	return composeStyleVariantModule(stepper.common, stepper.sizes[p2], stepper.isFill[p4], stepper.stepStates[p3])
end