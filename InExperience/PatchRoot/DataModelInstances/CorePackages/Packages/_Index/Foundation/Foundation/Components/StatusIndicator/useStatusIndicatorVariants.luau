local foundation = script:FindFirstAncestor("Foundation")
local flagsModule = require(foundation.Utility.Flags)
local statusIndicatorSizeModule = require(foundation.Enums.StatusIndicatorSize)
local statusIndicatorVariantModule = require(foundation.Enums.StatusIndicatorVariant)
local statusIndicatorShapeModule = require(foundation.Enums.StatusIndicatorShape)
local _ = require(foundation.Components.Types)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local indexBindableModule = require(foundation.Utility.indexBindable)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)
local var1 = _G.__DEV__ == true
local font = Font.new(require(foundation.Constants).BUILDER_SANS_FONT_ASSET, Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)

function variantsFactory(p1)
	-- upvalues: font (ref), flagsModule (ref), statusIndicatorVariantModule (ref), statusIndicatorShapeModule (ref), statusIndicatorSizeModule (ref)
	return {
		common = {
			content = { tag = "auto-xy text-align-x-left", font = font },
			stroke = if flagsModule.FoundationAvatarBeta then nil else { Thickness = p1.Size.Size_50 }
		},
		variants = {
			[statusIndicatorVariantModule.Alert] = {
				container = { tag = "bg-system-alert" },
				content = { style = p1.DarkMode.Content.Emphasis }
			},
			[statusIndicatorVariantModule.Success] = {
				container = { tag = "bg-system-success" },
				content = { style = p1.LightMode.Content.Emphasis }
			},
			[statusIndicatorVariantModule.Warning] = {
				container = { tag = "bg-system-warning" },
				content = { style = p1.LightMode.Content.Emphasis }
			},
			[statusIndicatorVariantModule.Emphasis] = if flagsModule.FoundationActionEmphasisStatusIndicator then {
				container = { tag = "bg-action-emphasis" },
				content = { style = p1.Color.ActionEmphasis.Foreground }
			} else {
				container = { tag = "bg-system-emphasis" },
				content = { style = p1.DarkMode.Content.Emphasis }
			},
			[statusIndicatorVariantModule.Neutral] = {
				container = { tag = "bg-system-neutral" },
				content = { style = p1.Inverse.Content.Emphasis }
			},
			[statusIndicatorVariantModule.Standard] = {
				container = { tag = "bg-action-standard" },
				content = { style = p1.Color.Content.Emphasis }
			},
			[statusIndicatorVariantModule.Contrast_Experiment] = {
				container = { tag = "bg-system-contrast" },
				content = { style = p1.Inverse.Content.Emphasis }
			},
			[statusIndicatorVariantModule.Voice] = {
				container = { backgroundStyle = p1.Color.Extended.Orange.Orange_600 }
			}
		},
		hasValue = if flagsModule.FoundationAvatarBeta then {
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
			[statusIndicatorShapeModule.Circle] = {
				container = { tag = "radius-circle" },
				stroke = { LineJoinMode = Enum.LineJoinMode.Round }
			},
			[statusIndicatorShapeModule.Ring] = {
				container = { tag = "align-x-center align-y-center radius-circle" },
				ring = {
					tag = if flagsModule.FoundationAvatarBeta then "radius-circle bg-surface-100" else "size-100-100 radius-circle bg-surface-100"
				},
				stroke = { LineJoinMode = Enum.LineJoinMode.Round }
			},
			[statusIndicatorShapeModule.Square] = {
				container = { tag = "radius-none" },
				stroke = { LineJoinMode = Enum.LineJoinMode.Miter }
			}
		},
		sizes = if flagsModule.FoundationAvatarBeta then {
			[statusIndicatorSizeModule.XSmall] = {
				container = {
					size = UDim2.fromOffset(p1.Size.Size_150, p1.Size.Size_150)
				},
				ring = {
					size = UDim2.fromOffset(p1.Size.Size_150 / 2, p1.Size.Size_150 / 2)
				},
				stroke = { Thickness = p1.Stroke.Standard }
			},
			[statusIndicatorSizeModule.Small] = {
				container = {
					size = UDim2.fromOffset(p1.Size.Size_200, p1.Size.Size_200)
				},
				ring = {
					size = UDim2.fromOffset(p1.Size.Size_200 / 2, p1.Size.Size_200 / 2)
				},
				stroke = { Thickness = p1.Size.Size_50 }
			},
			[statusIndicatorSizeModule.Medium] = {
				container = {
					size = UDim2.fromOffset(p1.Size.Size_250, p1.Size.Size_250)
				},
				ring = {
					size = UDim2.fromOffset(p1.Size.Size_250 / 2, p1.Size.Size_250 / 2)
				},
				stroke = { Thickness = p1.Size.Size_50 }
			},
			[statusIndicatorSizeModule.Pictogram] = {
				container = {
					size = UDim2.fromOffset(p1.Size.Size_500, p1.Size.Size_500)
				},
				ring = {
					size = UDim2.fromOffset(p1.Size.Size_500 / 2, p1.Size.Size_500 / 2)
				},
				stroke = { Thickness = p1.Stroke.Thicker }
			}
		} else nil
	}
end

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: flagsModule (ref), var1 (ref), statusIndicatorVariantModule (ref), indexBindableModule (ref), variantsContextModule (ref), composeStyleVariantModule (ref)
	if not flagsModule.FoundationStatusIndicatorVariantExperiment and var1 then
		if p2 == statusIndicatorVariantModule.Contrast_Experiment then
			error("Contrast is not a supported StatusIndicator variant.")
		end
		if p2 == statusIndicatorVariantModule.Alert and p3 then
			error("Alert is not a supported numeric StatusIndicator variant.")
		end
	end
	local statusIndicator = variantsContextModule.useVariants("StatusIndicator", variantsFactory, p1)
	
	return composeStyleVariantModule(statusIndicator.common, statusIndicator.variants[p2], statusIndicator.hasValue[p3], statusIndicator.shape[p4], if flagsModule.FoundationAvatarBeta then if not p3 then statusIndicator.sizes[p5] else {} else nil, if p6 then {
		stroke = {
			Color = indexBindableModule(p6, "Color3"),
			Transparency = indexBindableModule(p6, "Transparency")
		}
	} else nil)
end