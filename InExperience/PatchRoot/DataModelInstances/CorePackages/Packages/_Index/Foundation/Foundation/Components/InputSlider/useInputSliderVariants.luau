local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Components.Types)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local GetDisabledStyleModule = require(Foundation.Utility.getDisabledStyle)
local _ = require(Foundation.Providers.Style.Tokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)

local function variantsFactory(p1)
	-- upvalues: GetDisabledStyleModule (copy)
	local Common = {
		container = { tag = "col gap-small auto-y" },
		field = {
			tag = "size-full-600 radius-small",
			backgroundStyle = {
				Transparency = 0.001,
				Color3 = p1.Color.Extended.White.White_100.Color3
			},
			cursor = {
				radius = UDim.new(0, p1.Radius.Small),
				offset = p1.Stroke.Thick,
				borderWidth = p1.Stroke.Thick
			}
		},
		textBox = {
			tag = "text-body-small text-align-x-left text-align-y-center gui-object-defaults"
		},
		suffix = { tag = "auto-xy text-body-small" },
		fill = {
			filledStyle = p1.Color.Shift.Shift_300,
			unfilledStyle = p1.Color.Shift.Shift_200
		}
	}
	local DisabledStyleModule = GetDisabledStyleModule(p1.Color.Content.Default, true)
	
	return {
		common = Common,
		stroke = {
			[true] = {
				field = {
					tag = "stroke-standard stroke-position-inner stroke-system-emphasis"
				}
			},
			[false] = {}
		},
		content = {
			[true] = {
				textBox = { tag = "content-emphasis" },
				suffix = { tag = "content-default" }
			},
			[false] = {
				textBox = { tag = "content-default" },
				suffix = { tag = "content-muted" }
			}
		},
		disabled = {
			textBox = {
				TextColor3 = DisabledStyleModule.Color3,
				TextTransparency = DisabledStyleModule.Transparency
			},
			suffix = {
				textStyle = GetDisabledStyleModule(p1.Color.Content.Muted, true)
			},
			fill = {
				filledStyle = GetDisabledStyleModule(Common.fill.filledStyle, true),
				unfilledStyle = GetDisabledStyleModule(Common.fill.unfilledStyle, true)
			}
		}
	}
end

return function(p1, p2, p3)
	-- upvalues: VariantsContextModule (copy), variantsFactory (copy), ComposeStyleVariantModule (copy)
	local InputSlider = VariantsContextModule.useVariants("InputSlider", variantsFactory, p1)
	
	return ComposeStyleVariantModule(InputSlider.common, InputSlider.stroke[p2], if p3 then InputSlider.disabled else InputSlider.content[p2])
end