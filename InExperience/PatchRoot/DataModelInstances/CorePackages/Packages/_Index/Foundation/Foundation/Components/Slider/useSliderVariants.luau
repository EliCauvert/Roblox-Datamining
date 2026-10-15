local foundation = script:FindFirstAncestor("Foundation")
local inputSizeModule = require(foundation.Enums.InputSize)
local sliderVariantModule = require(foundation.Enums.SliderVariant)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)
local _ = require(foundation.Components.Types)
local flagsModule = require(foundation.Utility.Flags)

local function variantsFactory(p1)
	-- upvalues: sliderVariantModule (ref), flagsModule (ref), inputSizeModule (ref)
	return {
		common = {
			bar = {
				tag = "position-center-center anchor-center-center radius-circle"
			},
			fill = { tag = "radius-circle" }
		},
		variants = {
			[sliderVariantModule.Emphasis] = {
				bar = { tag = "bg-shift-200" },
				fill = { tag = "bg-emphasis" },
				knob = {
					hasShadow = true,
					style = p1.Color.Extended.White.White_100,
					dragStyle = if flagsModule.FoundationSystemEmphasisNonActions then p1.Color.System.Emphasis else p1.Color.ActionEmphasis.Background
				}
			},
			[sliderVariantModule.Standard] = {
				bar = { tag = "bg-shift-200" },
				fill = { tag = "bg-system-contrast" },
				knob = {
					hasShadow = true,
					style = p1.Color.System.Contrast,
					dragStyle = p1.Color.System.Contrast,
					stroke = {
						Color = p1.Color.Stroke.Default.Color3,
						Transparency = p1.Color.Stroke.Default.Transparency,
						Thickness = p1.Stroke.Standard
					}
				}
			},
			[sliderVariantModule.Utility] = {
				knob = {
					hasShadow = true,
					style = p1.Color.None,
					dragStyle = p1.Color.None,
					stroke = {
						Color = p1.Color.System.Contrast.Color3,
						Transparency = p1.Color.System.Contrast.Transparency,
						Thickness = p1.Stroke.Thicker
					}
				}
			}
		},
		sizes = {
			[inputSizeModule.XSmall] = { bar = { height = p1.Size.Size_100 } },
			[inputSizeModule.Small] = { bar = { height = p1.Size.Size_150 } },
			[inputSizeModule.Medium] = { bar = { height = p1.Size.Size_200 } },
			[inputSizeModule.Large] = { bar = { height = p1.Size.Size_250 } }
		},
		orientation = {
			[true] = {
				selectionGroup = {
					SelectionBehaviorLeft = Enum.SelectionBehavior.Escape,
					SelectionBehaviorRight = Enum.SelectionBehavior.Escape,
					SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
					SelectionBehaviorDown = Enum.SelectionBehavior.Stop
				}
			},
			[false] = {
				selectionGroup = {
					SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
					SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
					SelectionBehaviorUp = Enum.SelectionBehavior.Escape,
					SelectionBehaviorDown = Enum.SelectionBehavior.Escape
				}
			}
		}
	}
end

return function(p1, p2, p3, p4)
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), flagsModule (ref), composeStyleVariantModule (ref)
	local slider = variantsContextModule.useVariants("Slider", variantsFactory, p1)
	
	return if flagsModule.FoundationSliderCapture then composeStyleVariantModule(slider.common, slider.variants[p3], slider.sizes[p2]) else composeStyleVariantModule(slider.common, slider.variants[p3], slider.sizes[p2], slider.orientation[p4])
end