local Foundation = script:FindFirstAncestor("Foundation")
local InputSizeModule = require(Foundation.Enums.InputSize)
local SliderVariantModule = require(Foundation.Enums.SliderVariant)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local _ = require(Foundation.Providers.Style.Tokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)
local _ = require(Foundation.Components.Types)
local FlagsModule = require(Foundation.Utility.Flags)

local function variantsFactory(p1)
	-- upvalues: SliderVariantModule (copy), FlagsModule (copy), InputSizeModule (copy)
	return {
		common = {
			bar = {
				tag = "position-center-center anchor-center-center radius-circle"
			},
			fill = { tag = "radius-circle" }
		},
		variants = {
			[SliderVariantModule.Emphasis] = {
				bar = { tag = "bg-shift-200" },
				fill = { tag = "bg-emphasis" },
				knob = {
					hasShadow = true,
					style = p1.Color.Extended.White.White_100,
					dragStyle = if FlagsModule.FoundationSystemEmphasisNonActions then p1.Color.System.Emphasis else p1.Color.ActionEmphasis.Background
				}
			},
			[SliderVariantModule.Standard] = {
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
			[SliderVariantModule.Utility] = {
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
			[InputSizeModule.XSmall] = { bar = { height = p1.Size.Size_100 } },
			[InputSizeModule.Small] = { bar = { height = p1.Size.Size_150 } },
			[InputSizeModule.Medium] = { bar = { height = p1.Size.Size_200 } },
			[InputSizeModule.Large] = { bar = { height = p1.Size.Size_250 } }
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
	-- upvalues: VariantsContextModule (copy), variantsFactory (copy), FlagsModule (copy), ComposeStyleVariantModule (copy)
	local Slider = VariantsContextModule.useVariants("Slider", variantsFactory, p1)
	
	return if FlagsModule.FoundationSliderCapture then ComposeStyleVariantModule(Slider.common, Slider.variants[p3], Slider.sizes[p2]) else ComposeStyleVariantModule(Slider.common, Slider.variants[p3], Slider.sizes[p2], Slider.orientation[p4])
end