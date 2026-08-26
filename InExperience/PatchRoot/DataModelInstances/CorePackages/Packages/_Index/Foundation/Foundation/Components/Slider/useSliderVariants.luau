local foundation = script:FindFirstAncestor("Foundation")
local inputSizeModule = require(foundation.Enums.InputSize)
local sliderVariantModule = require(foundation.Enums.SliderVariant)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)
local _ = require(foundation.Components.Types)
local flagsModule = require(foundation.Utility.Flags)

local function variantsFactory(p1)
	-- upvalues: flagsModule (ref), sliderVariantModule (ref), inputSizeModule (ref)
	return {
		common = {
			bar = {
				tag = if flagsModule.FoundationSliderBeta then "position-center-center anchor-center-center radius-circle" else "position-center-center anchor-center-center size-full-100 radius-small"
			},
			fill = {
				tag = if flagsModule.FoundationSliderBeta then "radius-circle" else "radius-small"
			}
		},
		variants = {
			[sliderVariantModule.Emphasis] = {
				bar = {
					tag = if flagsModule.FoundationSliderBeta then "bg-shift-200" else "bg-shift-400"
				},
				fill = { tag = "bg-emphasis" },
				knob = {
					hasShadow = true,
					style = p1.Color.Extended.White.White_100,
					dragStyle = p1.Color.ActionEmphasis.Background
				}
			},
			[sliderVariantModule.Standard] = {
				bar = {
					tag = if flagsModule.FoundationSliderBeta then "bg-shift-200" else "bg-shift-400"
				},
				fill = { tag = "bg-system-contrast" },
				knob = {
					style = p1.Color.System.Contrast,
					dragStyle = p1.Color.System.Contrast,
					stroke = if flagsModule.FoundationSliderBeta then {
						Color = p1.Color.Stroke.Default.Color3,
						Transparency = p1.Color.Stroke.Default.Transparency,
						Thickness = p1.Stroke.Standard
					} else nil,
					hasShadow = if flagsModule.FoundationSliderBeta then true else false
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
			[inputSizeModule.XSmall] = {
				bar = if flagsModule.FoundationSliderBeta then { height = p1.Size.Size_100 } else nil,
				hitbox = if flagsModule.FoundationSliderBeta then nil else { height = p1.Size.Size_300 }
			},
			[inputSizeModule.Small] = {
				bar = if flagsModule.FoundationSliderBeta then { height = p1.Size.Size_150 } else nil,
				hitbox = if flagsModule.FoundationSliderBeta then nil else { height = p1.Size.Size_400 }
			},
			[inputSizeModule.Medium] = {
				bar = if flagsModule.FoundationSliderBeta then { height = p1.Size.Size_200 } else nil,
				hitbox = if flagsModule.FoundationSliderBeta then nil else { height = p1.Size.Size_500 }
			},
			[inputSizeModule.Large] = {
				bar = if flagsModule.FoundationSliderBeta then { height = p1.Size.Size_250 } else nil,
				hitbox = if flagsModule.FoundationSliderBeta then nil else { height = p1.Size.Size_700 }
			}
		}
	}
end

return function(p1, p2, p3)
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), composeStyleVariantModule (ref)
	local slider = variantsContextModule.useVariants("Slider", variantsFactory, p1)
	
	return composeStyleVariantModule(slider.common, slider.variants[p3], slider.sizes[p2])
end