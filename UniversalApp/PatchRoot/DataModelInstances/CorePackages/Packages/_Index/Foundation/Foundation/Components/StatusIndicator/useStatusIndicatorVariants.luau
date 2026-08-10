local foundation = script:FindFirstAncestor("Foundation")
local flagsModule = require(foundation.Utility.Flags)
local statusIndicatorSizeModule = require(foundation.Enums.StatusIndicatorSize)
local statusIndicatorVariantModule = require(foundation.Enums.StatusIndicatorVariant)
local statusIndicatorShapeModule = require(foundation.Enums.StatusIndicatorShape)
local _ = require(foundation.Components.Types)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)
local var7 = _G.__DEV__ == true
local font = Font.new(require(foundation.Constants).BUILDER_SANS_FONT_ASSET, Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)

function variantsFactory(p0) --[[ line: 35 ]]
	-- upvalues: font (ref), statusIndicatorVariantModule (ref), flagsModule (ref), statusIndicatorShapeModule (ref), statusIndicatorSizeModule (ref)
	return {
		common = {
			content = { tag = "auto-xy text-align-x-left", font = font }
		},
		variants = {
			[statusIndicatorVariantModule.Alert] = {
				container = { tag = "bg-system-alert" },
				content = { style = p0.DarkMode.Content.Emphasis }
			},
			[statusIndicatorVariantModule.Success] = {
				container = { tag = "bg-system-success" },
				content = { style = p0.LightMode.Content.Emphasis }
			},
			[statusIndicatorVariantModule.Warning] = {
				container = { tag = "bg-system-warning" },
				content = { style = p0.LightMode.Content.Emphasis }
			},
			[statusIndicatorVariantModule.Emphasis] = if flagsModule.FoundationActionEmphasisStatusIndicator then {
				container = { tag = "bg-action-emphasis" },
				content = { style = p0.Color.ActionEmphasis.Foreground }
			} else {
				container = { tag = "bg-system-emphasis" },
				content = { style = p0.DarkMode.Content.Emphasis }
			},
			[statusIndicatorVariantModule.Neutral] = {
				container = { tag = "bg-system-neutral" },
				content = { style = p0.Inverse.Content.Emphasis }
			},
			[statusIndicatorVariantModule.Standard] = {
				container = { tag = "bg-action-standard" },
				content = { style = p0.Color.Content.Emphasis }
			},
			[statusIndicatorVariantModule.Contrast_Experiment] = {
				container = { tag = "bg-system-contrast" },
				content = { style = p0.Inverse.Content.Emphasis }
			},
			[statusIndicatorVariantModule.Voice] = {
				container = { backgroundStyle = p0.Color.Extended.Orange.Orange_600 }
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
			[statusIndicatorShapeModule.Circle] = { container = { tag = "radius-circle" } },
			[statusIndicatorShapeModule.Ring] = {
				container = { tag = "align-x-center align-y-center radius-circle" },
				ring = {
					tag = if flagsModule.FoundationAvatarBeta then "radius-circle bg-surface-100" else "size-100-100 radius-circle bg-surface-100"
				}
			},
			[statusIndicatorShapeModule.Square] = { container = { tag = "radius-none" } }
		},
		sizes = if flagsModule.FoundationAvatarBeta then {
			[statusIndicatorSizeModule.XSmall] = {
				container = {
					size = UDim2.fromOffset(p0.Size.Size_150, p0.Size.Size_150)
				},
				ring = {
					size = UDim2.fromOffset(p0.Size.Size_150 / 2, p0.Size.Size_150 / 2)
				}
			},
			[statusIndicatorSizeModule.Small] = {
				container = {
					size = UDim2.fromOffset(p0.Size.Size_200, p0.Size.Size_200)
				},
				ring = {
					size = UDim2.fromOffset(p0.Size.Size_200 / 2, p0.Size.Size_200 / 2)
				}
			},
			[statusIndicatorSizeModule.Medium] = {
				container = {
					size = UDim2.fromOffset(p0.Size.Size_250, p0.Size.Size_250)
				},
				ring = {
					size = UDim2.fromOffset(p0.Size.Size_250 / 2, p0.Size.Size_250 / 2)
				}
			},
			[statusIndicatorSizeModule.Pictogram] = {
				container = {
					size = UDim2.fromOffset(p0.Size.Size_500, p0.Size.Size_500)
				},
				ring = {
					size = UDim2.fromOffset(p0.Size.Size_500 / 2, p0.Size.Size_500 / 2)
				}
			}
		} else nil
	}
end

return function(p1, p2, p3, p4, p5) --[[ line: 178 ]]
	-- upvalues: flagsModule (ref), var7 (ref), statusIndicatorVariantModule (ref), variantsContextModule (ref), composeStyleVariantModule (ref)
	if not flagsModule.FoundationStatusIndicatorVariantExperiment and var7 then
		if p2 == statusIndicatorVariantModule.Contrast_Experiment then
			error("Contrast is not a supported StatusIndicator variant.")
		end
		if p2 == statusIndicatorVariantModule.Alert and p3 then
			error("Alert is not a supported numeric StatusIndicator variant.")
		end
	end
	local statusIndicator = variantsContextModule.useVariants("StatusIndicator", variantsFactory, p1)
	
	return composeStyleVariantModule(statusIndicator.common, statusIndicator.variants[p2], statusIndicator.hasValue[p3], statusIndicator.shape[p4], if flagsModule.FoundationAvatarBeta then if not p3 then statusIndicator.sizes[p5] else {} else nil)
end