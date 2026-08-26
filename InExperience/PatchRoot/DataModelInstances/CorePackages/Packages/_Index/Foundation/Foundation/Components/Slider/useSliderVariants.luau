local foundation = script:FindFirstAncestor("Foundation")
local inputSizeModule = require(foundation.Enums.InputSize)
local sliderVariantModule = require(foundation.Enums.SliderVariant)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)
local _ = require(foundation.Components.Types)

local function variantsFactory(p1)
	-- upvalues: sliderVariantModule (ref), inputSizeModule (ref)
	return {
		common = {
			bar = {
				tag = "position-center-center anchor-center-center size-full-100 radius-small"
			},
			fill = { tag = "radius-small" }
		},
		variants = {
			[sliderVariantModule.Emphasis] = {
				bar = { tag = "bg-shift-400" },
				fill = { tag = "bg-emphasis" },
				knob = {
					hasShadow = true,
					style = p1.Color.Extended.White.White_100,
					dragStyle = p1.Color.ActionEmphasis.Background
				}
			},
			[sliderVariantModule.Standard] = {
				bar = { tag = "bg-shift-400" },
				fill = { tag = "bg-system-contrast" },
				knob = {
					hasShadow = false,
					style = p1.Color.System.Contrast,
					dragStyle = p1.Color.System.Contrast
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
			[inputSizeModule.XSmall] = { hitbox = { height = p1.Size.Size_300 } },
			[inputSizeModule.Small] = { hitbox = { height = p1.Size.Size_400 } },
			[inputSizeModule.Medium] = { hitbox = { height = p1.Size.Size_500 } },
			[inputSizeModule.Large] = { hitbox = { height = p1.Size.Size_700 } }
		}
	}
end

return function(p1, p2, p3)
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), composeStyleVariantModule (ref)
	local slider = variantsContextModule.useVariants("Slider", variantsFactory, p1)
	
	return composeStyleVariantModule(slider.common, slider.variants[p3], slider.sizes[p2])
end