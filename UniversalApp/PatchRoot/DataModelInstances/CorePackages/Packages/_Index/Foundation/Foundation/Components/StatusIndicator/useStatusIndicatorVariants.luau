local Foundation = script:FindFirstAncestor("Foundation")
local StatusIndicatorSizeModule = require(Foundation.Enums.StatusIndicatorSize)
local StatusIndicatorVariantModule = require(Foundation.Enums.StatusIndicatorVariant)
local StatusIndicatorShapeModule = require(Foundation.Enums.StatusIndicatorShape)
local _ = require(Foundation.Components.Types)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local IndexBindableModule = require(Foundation.Utility.indexBindable)
local _ = require(Foundation.Providers.Style.Tokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)
local DevAssertModule = require(Foundation.Utility.devAssert)
local ConstantsModule = require(Foundation.Constants)
local GetStatusIndicatorMaskWidthModule = require(script.Parent.getStatusIndicatorMaskWidth)
local GetStatusIndicatorSizeModule = require(script.Parent.getStatusIndicatorSize)
local _Font = Font.new(ConstantsModule.BUILDER_SANS_FONT_ASSET, Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)

function variantsFactory(p1)
	-- upvalues: _Font (copy), GetStatusIndicatorMaskWidthModule (copy), StatusIndicatorVariantModule (copy), StatusIndicatorShapeModule (copy), GetStatusIndicatorSizeModule (copy), StatusIndicatorSizeModule (copy)
	local Common = {
		content = {
			tag = "auto-xy text-align-x-left",
			font = _Font,
			typography = p1.Typography.LabelSmall
		},
		stroke = { Thickness = GetStatusIndicatorMaskWidthModule(p1) }
	}
	local Variants = {
		[StatusIndicatorVariantModule.Alert] = {
			container = { tag = "bg-system-alert" },
			content = { style = p1.DarkMode.Content.Emphasis }
		},
		[StatusIndicatorVariantModule.Success] = {
			container = { tag = "bg-system-success" },
			content = { style = p1.LightMode.Content.Emphasis }
		},
		[StatusIndicatorVariantModule.Warning] = {
			container = { tag = "bg-system-warning" },
			content = { style = p1.LightMode.Content.Emphasis }
		},
		[StatusIndicatorVariantModule.Emphasis] = {
			container = { tag = "bg-system-emphasis" },
			content = { style = p1.DarkMode.Content.Emphasis }
		},
		[StatusIndicatorVariantModule.Neutral] = {
			container = { tag = "bg-system-neutral" },
			content = { style = p1.Inverse.Content.Emphasis }
		},
		[StatusIndicatorVariantModule.Standard] = {
			container = { tag = "bg-action-standard" },
			content = { style = p1.Color.Content.Emphasis }
		},
		[StatusIndicatorVariantModule.Contrast_Experiment] = {
			container = { tag = "bg-system-contrast" },
			content = { style = p1.Inverse.Content.Emphasis }
		},
		[StatusIndicatorVariantModule.Voice] = {
			container = { backgroundStyle = p1.Color.Extended.Orange.Orange_600 }
		}
	}
	local Shape = {
		[StatusIndicatorShapeModule.Circle] = {
			container = { tag = "radius-circle" },
			stroke = { LineJoinMode = Enum.LineJoinMode.Round }
		},
		[StatusIndicatorShapeModule.Ring] = {
			container = { tag = "align-x-center align-y-center radius-circle" },
			ring = { tag = "radius-circle bg-surface-100" },
			stroke = { LineJoinMode = Enum.LineJoinMode.Round }
		},
		[StatusIndicatorShapeModule.Square] = {
			container = { tag = "radius-none" },
			stroke = { LineJoinMode = Enum.LineJoinMode.Miter }
		}
	}
	
	local function _(p2, p3, p4): UDim2
		-- upvalues: GetStatusIndicatorSizeModule (upval), p1 (copy)
		local ScaledStatusIndicatorSizeModule = GetStatusIndicatorSizeModule(p1, p2, p3) * (p4 or 1)
		
		return UDim2.fromOffset(ScaledStatusIndicatorSizeModule, ScaledStatusIndicatorSizeModule)
	end
	
	local XXSmall = StatusIndicatorSizeModule.XXSmall
	local ScaledStatusIndicatorSizeModule = GetStatusIndicatorSizeModule(p1, StatusIndicatorSizeModule.XXSmall, false) * 1
	local Container = {
		size = UDim2.fromOffset(ScaledStatusIndicatorSizeModule, ScaledStatusIndicatorSizeModule)
	}
	local ScaledStatusIndicatorSizeModule1 = GetStatusIndicatorSizeModule(p1, StatusIndicatorSizeModule.XXSmall, false) * 0.5
	local config = {
		container = Container,
		ring = {
			size = UDim2.fromOffset(ScaledStatusIndicatorSizeModule1, ScaledStatusIndicatorSizeModule1)
		}
	}
	local XSmall = StatusIndicatorSizeModule.XSmall
	local ScaledStatusIndicatorSizeModule2 = GetStatusIndicatorSizeModule(p1, StatusIndicatorSizeModule.XSmall, false) * 1
	local Container1 = {
		size = UDim2.fromOffset(ScaledStatusIndicatorSizeModule2, ScaledStatusIndicatorSizeModule2)
	}
	local ScaledStatusIndicatorSizeModule3 = GetStatusIndicatorSizeModule(p1, StatusIndicatorSizeModule.XSmall, false) * 0.5
	local config1 = {
		container = Container1,
		ring = {
			size = UDim2.fromOffset(ScaledStatusIndicatorSizeModule3, ScaledStatusIndicatorSizeModule3)
		}
	}
	local Small = StatusIndicatorSizeModule.Small
	local ScaledStatusIndicatorSizeModule4 = GetStatusIndicatorSizeModule(p1, StatusIndicatorSizeModule.Small, false) * 1
	local Container2 = {
		size = UDim2.fromOffset(ScaledStatusIndicatorSizeModule4, ScaledStatusIndicatorSizeModule4)
	}
	local ScaledStatusIndicatorSizeModule5 = GetStatusIndicatorSizeModule(p1, StatusIndicatorSizeModule.Small, false) * 0.5
	local config2 = {
		container = Container2,
		ring = {
			size = UDim2.fromOffset(ScaledStatusIndicatorSizeModule5, ScaledStatusIndicatorSizeModule5)
		}
	}
	local Medium = StatusIndicatorSizeModule.Medium
	local ScaledStatusIndicatorSizeModule6 = GetStatusIndicatorSizeModule(p1, StatusIndicatorSizeModule.Medium, false) * 1
	local Container3 = {
		size = UDim2.fromOffset(ScaledStatusIndicatorSizeModule6, ScaledStatusIndicatorSizeModule6)
	}
	local ScaledStatusIndicatorSizeModule7 = GetStatusIndicatorSizeModule(p1, StatusIndicatorSizeModule.Medium, false) * 0.5
	local config3 = {
		container = Container3,
		ring = {
			size = UDim2.fromOffset(ScaledStatusIndicatorSizeModule7, ScaledStatusIndicatorSizeModule7)
		}
	}
	local Large = StatusIndicatorSizeModule.Large
	local ScaledStatusIndicatorSizeModule8 = GetStatusIndicatorSizeModule(p1, StatusIndicatorSizeModule.Large, false) * 1
	local Container4 = {
		size = UDim2.fromOffset(ScaledStatusIndicatorSizeModule8, ScaledStatusIndicatorSizeModule8)
	}
	local ScaledStatusIndicatorSizeModule9 = GetStatusIndicatorSizeModule(p1, StatusIndicatorSizeModule.Large, false) * 0.5
	local config4 = {
		container = Container4,
		ring = {
			size = UDim2.fromOffset(ScaledStatusIndicatorSizeModule9, ScaledStatusIndicatorSizeModule9)
		}
	}
	local Pictogram = StatusIndicatorSizeModule.Pictogram
	local ScaledStatusIndicatorSizeModule10 = GetStatusIndicatorSizeModule(p1, StatusIndicatorSizeModule.Pictogram, false) * 1
	local Container5 = {
		size = UDim2.fromOffset(ScaledStatusIndicatorSizeModule10, ScaledStatusIndicatorSizeModule10)
	}
	local ScaledStatusIndicatorSizeModule11 = GetStatusIndicatorSizeModule(p1, StatusIndicatorSizeModule.Pictogram, false) * 0.5
	local Sizes = {
		[XXSmall] = config,
		[XSmall] = config1,
		[Small] = config2,
		[Medium] = config3,
		[Large] = config4,
		[Pictogram] = {
			container = Container5,
			ring = {
				size = UDim2.fromOffset(ScaledStatusIndicatorSizeModule11, ScaledStatusIndicatorSizeModule11)
			}
		}
	}
	local ScaledStatusIndicatorSizeModule12 = GetStatusIndicatorSizeModule(p1, StatusIndicatorSizeModule.Small, true) * 1
	local config5 = {
		container = {
			size = UDim2.fromOffset(ScaledStatusIndicatorSizeModule12, ScaledStatusIndicatorSizeModule12)
		}
	}
	local ScaledStatusIndicatorSizeModule13 = GetStatusIndicatorSizeModule(p1, StatusIndicatorSizeModule.Large, true) * 1
	local config51 = {
		container = {
			size = UDim2.fromOffset(ScaledStatusIndicatorSizeModule13, ScaledStatusIndicatorSizeModule13)
		},
		content = { typography = p1.Typography.LabelMedium }
	}
	
	return {
		common = Common,
		variants = Variants,
		hasValue = {
			[true] = {
				container = {
					tag = "row align-x-center align-y-center auto-x padding-xsmall"
				}
			}
		},
		shape = Shape,
		sizes = Sizes,
		numericSizes = {
			[StatusIndicatorSizeModule.XXSmall] = config5,
			[StatusIndicatorSizeModule.XSmall] = config5,
			[StatusIndicatorSizeModule.Small] = config5,
			[StatusIndicatorSizeModule.Medium] = config5,
			[StatusIndicatorSizeModule.Large] = config51,
			[StatusIndicatorSizeModule.Pictogram] = config51
		}
	}
end

return function(p1, Alert, p2, p3, p4, p5)
	-- upvalues: DevAssertModule (copy), StatusIndicatorVariantModule (copy), IndexBindableModule (copy), VariantsContextModule (copy), ComposeStyleVariantModule (copy)
	DevAssertModule(Alert ~= StatusIndicatorVariantModule.Contrast_Experiment, "Contrast is not a supported StatusIndicator variant.")
	DevAssertModule(not (Alert == StatusIndicatorVariantModule.Alert and p2), "Alert is not a supported numeric StatusIndicator variant.")
	local StatusIndicator = VariantsContextModule.useVariants("StatusIndicator", variantsFactory, p1)
	
	return ComposeStyleVariantModule(StatusIndicator.common, StatusIndicator.variants[Alert], StatusIndicator.hasValue[p2], StatusIndicator.shape[p3], if p2 then StatusIndicator.numericSizes[p4] else StatusIndicator.sizes[p4], if p5 then {
		stroke = {
			Color = IndexBindableModule(p5, "Color3"),
			Transparency = IndexBindableModule(p5, "Transparency")
		}
	} else nil)
end