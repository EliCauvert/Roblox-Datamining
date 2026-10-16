local Foundation = script:FindFirstAncestor("Foundation")
local IconSizeModule = require(Foundation.Enums.IconSize)
local InputSizeModule = require(Foundation.Enums.InputSize)
local StepperStepStateModule = require(Foundation.Enums.StepperStepState)
local _ = require(Foundation.Providers.Style.Tokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local _ = require(Foundation.Components.Types)

local function variantsFactory(p1) --[[ Line: 33 ]]
	-- upvalues: InputSizeModule (copy), IconSizeModule (copy), StepperStepStateModule (copy)
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
			[InputSizeModule.XSmall] = {
				content = {
					tag = "size-0-800",
					padding = {
						left = UDim.new(0, p1.Padding.XSmall),
						right = UDim.new(0, p1.Padding.Small),
						top = UDim.new(0, p1.Size.Size_250),
						bottom = UDim.new(0, p1.Size.Size_250)
					}
				},
				textColumn = { padding = { left = UDim.new(0, p1.Size.Size_250) } },
				indicatorInner = { tag = "size-300-300" },
				index = { tag = "text-caption-small" },
				label = { tag = "text-label-small" },
				description = { tag = "text-body-small" },
				icon = { size = IconSizeModule.XSmall }
			},
			[InputSizeModule.Small] = {
				content = {
					tag = "size-0-1000",
					padding = {
						left = UDim.new(0, p1.Size.Size_150),
						right = UDim.new(0, p1.Size.Size_300),
						top = UDim.new(0, p1.Size.Size_300),
						bottom = UDim.new(0, p1.Size.Size_300)
					}
				},
				textColumn = { padding = { left = UDim.new(0, p1.Gap.Medium) } },
				indicatorInner = { tag = "size-400-400" },
				index = { tag = "text-caption-medium" },
				label = { tag = "text-label-small" },
				description = { tag = "text-body-small" },
				icon = { size = IconSizeModule.Small }
			},
			[InputSizeModule.Medium] = {
				content = {
					tag = "size-0-1200",
					padding = {
						left = UDim.new(0, p1.Padding.Small),
						right = UDim.new(0, p1.Padding.Large),
						top = UDim.new(0, p1.Size.Size_350),
						bottom = UDim.new(0, p1.Size.Size_350)
					}
				},
				textColumn = { padding = { left = UDim.new(0, p1.Gap.Medium) } },
				indicatorInner = { tag = "size-500-500" },
				index = { tag = "text-caption-large" },
				label = { tag = "text-label-medium" },
				description = { tag = "text-body-medium" },
				icon = { size = IconSizeModule.Medium }
			}
		},
		isFill = { [false] = {}, [true] = { container = { tag = "grow" } } },
		stepStates = {
			[StepperStepStateModule.Complete] = {
				indicatorInner = { tag = "bg-system-contrast" },
				description = { tag = "content-default" }
			},
			[StepperStepStateModule.Current] = {
				indicatorInner = { tag = "bg-system-contrast" },
				description = { tag = "content-emphasis" },
				index = { tag = "content-inverse-emphasis" }
			},
			[StepperStepStateModule.Incomplete] = {
				indicatorInner = { tag = "bg-shift-300" },
				description = { tag = "content-default" },
				index = { tag = "content-default" }
			}
		}
	}
end

return function(p1, p2, p3, p4) --[[ Line: 129 ]]
	-- upvalues: VariantsContextModule (copy), variantsFactory (copy), ComposeStyleVariantModule (copy)
	local Stepper = VariantsContextModule.useVariants("Stepper", variantsFactory, p1)
	
	return ComposeStyleVariantModule(Stepper.common, Stepper.sizes[p2], Stepper.isFill[p4], Stepper.stepStates[p3])
end