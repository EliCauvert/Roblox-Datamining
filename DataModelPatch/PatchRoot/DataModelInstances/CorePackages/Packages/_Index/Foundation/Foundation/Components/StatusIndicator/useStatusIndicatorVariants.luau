local Foundation = script:FindFirstAncestor("Foundation")
local FlagsModule = require(Foundation.Utility.Flags)
local StatusIndicatorSizeModule = require(Foundation.Enums.StatusIndicatorSize)
local StatusIndicatorVariantModule = require(Foundation.Enums.StatusIndicatorVariant)
local StatusIndicatorShapeModule = require(Foundation.Enums.StatusIndicatorShape)
local _ = require(Foundation.Components.Types)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local _ = require(Foundation.Providers.Style.Tokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)
local IsDEV = _G.__DEV__ == true
local _Font = Font.new(require(Foundation.Constants).BUILDER_SANS_FONT_ASSET, Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)

function variantsFactory(p1)
	-- upvalues: FlagsModule (copy), _Font (copy), StatusIndicatorVariantModule (copy), StatusIndicatorShapeModule (copy), StatusIndicatorSizeModule (copy)
	return {
		common = {
			content = {
				tag = if FlagsModule.FoundationStatusIndicatorBeta then "auto-xy text-align-x-left" else "auto-xy text-caption-small text-align-x-left",
				font = if FlagsModule.FoundationStatusIndicatorBeta then _Font else nil
			}
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
			[StatusIndicatorVariantModule.Emphasis] = if FlagsModule.FoundationActionEmphasisStatusIndicator then {
				container = { tag = "bg-action-emphasis" },
				content = { style = p1.Color.ActionEmphasis.Foreground }
			} else {
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
		hasValue = if FlagsModule.FoundationAvatarBeta then {
			[true] = {
				container = {
					tag = "row align-x-center align-y-center size-400-400 auto-x padding-xsmall"
				}
			}
		} else {
			[false] = { container = { tag = "size-200-200" } },
			[true] = {
				container = {
					tag = "row align-x-center align-y-center size-400-400 auto-x padding-xsmall"
				}
			}
		},
		shape = {
			[StatusIndicatorShapeModule.Circle] = { container = { tag = "radius-circle" } },
			[StatusIndicatorShapeModule.Ring] = {
				container = { tag = "align-x-center align-y-center radius-circle" },
				ring = {
					tag = if FlagsModule.FoundationAvatarBeta then "radius-circle bg-surface-100" else "size-100-100 radius-circle bg-surface-100"
				}
			},
			[StatusIndicatorShapeModule.Square] = { container = { tag = "radius-none" } }
		},
		sizes = if FlagsModule.FoundationAvatarBeta then {
			[StatusIndicatorSizeModule.XSmall] = {
				container = {
					size = UDim2.fromOffset(p1.Size.Size_150, p1.Size.Size_150)
				},
				ring = {
					size = UDim2.fromOffset(p1.Size.Size_150 / 2, p1.Size.Size_150 / 2)
				}
			},
			[StatusIndicatorSizeModule.Small] = {
				container = {
					size = UDim2.fromOffset(p1.Size.Size_200, p1.Size.Size_200)
				},
				ring = {
					size = UDim2.fromOffset(p1.Size.Size_200 / 2, p1.Size.Size_200 / 2)
				}
			},
			[StatusIndicatorSizeModule.Medium] = {
				container = {
					size = UDim2.fromOffset(p1.Size.Size_250, p1.Size.Size_250)
				},
				ring = {
					size = UDim2.fromOffset(p1.Size.Size_250 / 2, p1.Size.Size_250 / 2)
				}
			},
			[StatusIndicatorSizeModule.Pictogram] = {
				container = {
					size = UDim2.fromOffset(p1.Size.Size_500, p1.Size.Size_500)
				},
				ring = {
					size = UDim2.fromOffset(p1.Size.Size_500 / 2, p1.Size.Size_500 / 2)
				}
			}
		} else nil
	}
end

return function(p1, Alert, p2, p3, p4)
	-- upvalues: FlagsModule (copy), IsDEV (copy), StatusIndicatorVariantModule (copy), VariantsContextModule (copy), ComposeStyleVariantModule (copy)
	if not FlagsModule.FoundationStatusIndicatorVariantExperiment and IsDEV then
		if Alert == StatusIndicatorVariantModule.Contrast_Experiment then
			error("Contrast is not a supported StatusIndicator variant.")
		end
		if Alert == StatusIndicatorVariantModule.Alert and p2 then
			error("Alert is not a supported numeric StatusIndicator variant.")
		end
	end
	local StatusIndicator = VariantsContextModule.useVariants("StatusIndicator", variantsFactory, p1)
	
	return ComposeStyleVariantModule(StatusIndicator.common, StatusIndicator.variants[Alert], StatusIndicator.hasValue[p2], StatusIndicator.shape[p3], if FlagsModule.FoundationAvatarBeta then if p2 then {} else StatusIndicator.sizes[p4] else nil)
end