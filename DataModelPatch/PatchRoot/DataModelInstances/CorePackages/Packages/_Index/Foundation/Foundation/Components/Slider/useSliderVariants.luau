local Foundation = script:FindFirstAncestor("Foundation")
local InputSizeModule = require(Foundation.Enums.InputSize)
local SliderVariantModule = require(Foundation.Enums.SliderVariant)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local _ = require(Foundation.Providers.Style.Tokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)
local _ = require(Foundation.Components.Types)

local function variantsFactory(p1)
	-- upvalues: SliderVariantModule (copy), InputSizeModule (copy)
	return {
		common = {
			bar = {
				tag = "position-center-center anchor-center-center size-full-100 radius-small"
			},
			fill = { tag = "radius-small" }
		},
		variants = {
			[SliderVariantModule.Emphasis] = {
				bar = { tag = "bg-shift-400" },
				fill = { tag = "bg-emphasis" },
				knob = {
					hasShadow = true,
					style = p1.Color.Extended.White.White_100,
					dragStyle = p1.Color.ActionEmphasis.Background
				}
			},
			[SliderVariantModule.Standard] = {
				bar = { tag = "bg-shift-400" },
				fill = { tag = "bg-system-contrast" },
				knob = {
					hasShadow = false,
					style = p1.Color.System.Contrast,
					dragStyle = p1.Color.System.Contrast
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
			[InputSizeModule.XSmall] = { hitbox = { height = p1.Size.Size_300 } },
			[InputSizeModule.Small] = { hitbox = { height = p1.Size.Size_400 } },
			[InputSizeModule.Medium] = { hitbox = { height = p1.Size.Size_500 } },
			[InputSizeModule.Large] = { hitbox = { height = p1.Size.Size_700 } }
		}
	}
end

return function(p1, p2, p3)
	-- upvalues: VariantsContextModule (copy), variantsFactory (copy), ComposeStyleVariantModule (copy)
	local Slider = VariantsContextModule.useVariants("Slider", variantsFactory, p1)
	
	return ComposeStyleVariantModule(Slider.common, Slider.variants[p3], Slider.sizes[p2])
end