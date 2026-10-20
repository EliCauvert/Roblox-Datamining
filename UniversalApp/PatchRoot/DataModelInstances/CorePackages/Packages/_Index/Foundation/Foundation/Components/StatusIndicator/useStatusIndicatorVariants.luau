local Foundation = script:FindFirstAncestor("Foundation")
local FlagsModule = require(Foundation.Utility.Flags)
local StatusIndicatorSizeModule = require(Foundation.Enums.StatusIndicatorSize)
local StatusIndicatorVariantModule = require(Foundation.Enums.StatusIndicatorVariant)
local StatusIndicatorShapeModule = require(Foundation.Enums.StatusIndicatorShape)
local _ = require(Foundation.Components.Types)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local IndexBindableModule = require(Foundation.Utility.indexBindable)
local _ = require(Foundation.Providers.Style.Tokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)
local IsDEV = _G.__DEV__ == true
local _Font = Font.new(require(Foundation.Constants).BUILDER_SANS_FONT_ASSET, Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)

function variantsFactory(p1)
	-- upvalues: _Font (copy), FlagsModule (copy), StatusIndicatorVariantModule (copy), StatusIndicatorShapeModule (copy), StatusIndicatorSizeModule (copy)
	local config = {
		container = {
			size = UDim2.fromOffset(p1.Size.Size_400, p1.Size.Size_400)
		},
		content = { typography = p1.Typography.LabelSmall }
	}
	local config1 = {
		container = {
			size = UDim2.fromOffset(p1.Size.Size_500, p1.Size.Size_500)
		},
		content = { typography = p1.Typography.LabelMedium }
	}
	local config2 = {
		[StatusIndicatorSizeModule.XSmall] = config,
		[StatusIndicatorSizeModule.Small] = config,
		[StatusIndicatorSizeModule.Medium] = config,
		[StatusIndicatorSizeModule.Large] = config1,
		[StatusIndicatorSizeModule.Pictogram] = config1
	}
	
	return {
		common = {
			content = { tag = "auto-xy text-align-x-left", font = _Font },
			stroke = if FlagsModule.FoundationStatusIndicatorDesignUpdate then { Thickness = p1.Stroke.Thicker } else nil
		},
		variants = {
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
		},
		hasValue = {
			[true] = {
				container = {
					tag = if FlagsModule.FoundationStatusIndicatorDesignUpdate then "row align-x-center align-y-center auto-x padding-xsmall" else "row align-x-center align-y-center size-400-400 auto-x padding-xsmall"
				}
			}
		},
		shape = {
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
		},
		sizes = {
			[StatusIndicatorSizeModule.XSmall] = {
				container = {
					size = UDim2.fromOffset(p1.Size.Size_150, p1.Size.Size_150)
				},
				ring = {
					size = UDim2.fromOffset(p1.Size.Size_150 / 2, p1.Size.Size_150 / 2)
				},
				stroke = if FlagsModule.FoundationStatusIndicatorDesignUpdate then nil else { Thickness = p1.Stroke.Standard }
			},
			[StatusIndicatorSizeModule.Small] = {
				container = {
					size = UDim2.fromOffset(p1.Size.Size_200, p1.Size.Size_200)
				},
				ring = {
					size = UDim2.fromOffset(p1.Size.Size_200 / 2, p1.Size.Size_200 / 2)
				},
				stroke = if FlagsModule.FoundationStatusIndicatorDesignUpdate then nil else { Thickness = p1.Size.Size_50 }
			},
			[StatusIndicatorSizeModule.Medium] = {
				container = {
					size = UDim2.fromOffset(p1.Size.Size_250, p1.Size.Size_250)
				},
				ring = {
					size = UDim2.fromOffset(p1.Size.Size_250 / 2, p1.Size.Size_250 / 2)
				},
				stroke = if FlagsModule.FoundationStatusIndicatorDesignUpdate then nil else { Thickness = p1.Size.Size_50 }
			},
			[StatusIndicatorSizeModule.Large] = {
				container = {
					size = UDim2.fromOffset(p1.Size.Size_500, p1.Size.Size_500)
				},
				ring = {
					size = UDim2.fromOffset(p1.Size.Size_500 / 2, p1.Size.Size_500 / 2)
				},
				stroke = { Thickness = p1.Stroke.Thicker }
			},
			[StatusIndicatorSizeModule.Pictogram] = {
				container = {
					size = UDim2.fromOffset(p1.Size.Size_500, p1.Size.Size_500)
				},
				ring = {
					size = UDim2.fromOffset(p1.Size.Size_500 / 2, p1.Size.Size_500 / 2)
				},
				stroke = { Thickness = p1.Stroke.Thicker }
			}
		},
		numericSizes = if FlagsModule.FoundationStatusIndicatorDesignUpdate then config2 else nil
	}
end

return function(p1, Alert, p2, p3, p4, p5)
	-- upvalues: IsDEV (copy), StatusIndicatorVariantModule (copy), IndexBindableModule (copy), VariantsContextModule (copy), ComposeStyleVariantModule (copy), FlagsModule (copy)
	if IsDEV then
		if Alert == StatusIndicatorVariantModule.Contrast_Experiment then
			error("Contrast is not a supported StatusIndicator variant.")
		end
		if Alert == StatusIndicatorVariantModule.Alert and p2 then
			error("Alert is not a supported numeric StatusIndicator variant.")
		end
	end
	local StatusIndicator = VariantsContextModule.useVariants("StatusIndicator", variantsFactory, p1)
	
	return ComposeStyleVariantModule(StatusIndicator.common, StatusIndicator.variants[Alert], StatusIndicator.hasValue[p2], StatusIndicator.shape[p3], if FlagsModule.FoundationStatusIndicatorDesignUpdate then if p2 then StatusIndicator.numericSizes[p4] else StatusIndicator.sizes[p4] elseif p2 then {} else StatusIndicator.sizes[p4], if p5 then {
		stroke = {
			Color = IndexBindableModule(p5, "Color3"),
			Transparency = IndexBindableModule(p5, "Transparency")
		}
	} else nil)
end