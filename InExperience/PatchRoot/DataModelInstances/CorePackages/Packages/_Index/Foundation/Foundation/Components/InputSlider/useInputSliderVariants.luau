local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Components.Types)
local FlagsModule = require(Foundation.Utility.Flags)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local GetDisabledStyleModule = require(Foundation.Utility.getDisabledStyle)
local InputVariantModule = require(Foundation.Enums.InputVariant)
local _ = require(Foundation.Providers.Style.Tokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)

local function variantsFactory(p1)
	-- upvalues: GetDisabledStyleModule (copy), InputVariantModule (copy)
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
	local Disabled = {
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
	local config = {
		field = {
			tag = "stroke-standard stroke-position-inner stroke-system-emphasis"
		}
	}
	
	local function getTrackFill(Shift, Shift1)
		-- upvalues: GetDisabledStyleModule (upval)
		return {
			[true] = {
				fill = {
					filledStyle = GetDisabledStyleModule(Shift, true),
					unfilledStyle = GetDisabledStyleModule(Shift1, true)
				}
			},
			[false] = { fill = { filledStyle = Shift, unfilledStyle = Shift1 } }
		}
	end
	
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
		disabled = Disabled,
		outline = {
			[InputVariantModule.Standard] = {
				[true] = config,
				[false] = {
					field = {
						tag = "stroke-standard stroke-position-inner stroke-emphasis"
					}
				}
			},
			[InputVariantModule.Contrast] = { [true] = config, [false] = {} },
			[InputVariantModule.Utility] = { [true] = {}, [false] = {} }
		},
		trackFill = {
			[InputVariantModule.Standard] = getTrackFill(p1.Color.Shift.Shift_300, p1.Color.Shift.Shift_100),
			[InputVariantModule.Contrast] = getTrackFill(p1.Color.Shift.Shift_400, p1.Color.Shift.Shift_200),
			[InputVariantModule.Utility] = getTrackFill(p1.Color.None, p1.Color.None)
		}
	}
end

return function(p1, p2, p3, Utility, p4)
	-- upvalues: VariantsContextModule (copy), variantsFactory (copy), FlagsModule (copy), InputVariantModule (copy), ComposeStyleVariantModule (copy)
	local InputSlider = VariantsContextModule.useVariants("InputSlider", variantsFactory, p1)
	local Disabled = if p3 then InputSlider.disabled else InputSlider.content[p2]
	
	return if FlagsModule.FoundationInputSliderVariant then ComposeStyleVariantModule(InputSlider.common, InputSlider.outline[Utility][p2], Disabled, InputSlider.trackFill[if Utility == InputVariantModule.Utility and p4 then InputVariantModule.Standard else Utility][p3]) else ComposeStyleVariantModule(InputSlider.common, InputSlider.stroke[p2], Disabled)
end