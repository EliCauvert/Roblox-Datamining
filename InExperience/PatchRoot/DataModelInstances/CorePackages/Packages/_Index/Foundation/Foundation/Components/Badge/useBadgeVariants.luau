local foundation = script:FindFirstAncestor("Foundation")
local badgeVariantModule = require(foundation.Enums.BadgeVariant)
local dashModule = require(foundation.Parent.Dash)
local badgeShapeModule = require(foundation.Enums.BadgeShape)
local badgeSizeModule = require(foundation.Enums.BadgeSize)
local iconPositionModule = require(foundation.Enums.IconPosition)
local iconSizeModule = require(foundation.Enums.IconSize)
local _ = require(foundation.Components.Types)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local flagsModule = require(foundation.Utility.Flags)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)

function variantsFactory(p1)
	-- upvalues: flagsModule (ref), badgeVariantModule (ref), badgeSizeModule (ref), iconSizeModule (ref), badgeShapeModule (ref), iconPositionModule (ref), dashModule (ref)
	return {
		common = {
			container = {
				tag = if flagsModule.FoundationBadgeBetaUpdate then "row align-x-center align-y-center auto-xy" else "row align-x-center align-y-center gap-xsmall"
			},
			text = {
				tag = if flagsModule.FoundationBadgeBetaUpdate then "auto-xy text-align-x-left text-truncate-split" else "auto-xy text-label-small text-align-x-left text-truncate-split"
			}
		},
		variants = {
			[badgeVariantModule.Alert] = {
				container = {
					backgroundStyle = if flagsModule.FoundationBadgeBetaUpdate then {
						Transparency = 0.8,
						Color3 = p1.Color.System.Alert.Color3
					} else p1.Color.System.Alert
				},
				content = {
					style = if flagsModule.FoundationBadgeBetaUpdate then p1.Color.Content.Emphasis else p1.DarkMode.Content.Emphasis
				},
				icon = { style = p1.Color.System.Alert }
			},
			[badgeVariantModule.Success] = {
				container = {
					backgroundStyle = if flagsModule.FoundationBadgeBetaUpdate then {
						Transparency = 0.8,
						Color3 = p1.Color.System.Success.Color3
					} else p1.Color.System.Success
				},
				content = {
					style = if flagsModule.FoundationBadgeBetaUpdate then p1.Color.Content.Emphasis else p1.LightMode.Content.Emphasis
				},
				icon = { style = p1.Color.System.Success }
			},
			[badgeVariantModule.Warning] = {
				container = {
					backgroundStyle = if flagsModule.FoundationBadgeBetaUpdate then {
						Transparency = 0.8,
						Color3 = p1.Color.System.Warning.Color3
					} else p1.Color.System.Warning
				},
				content = {
					style = if flagsModule.FoundationBadgeBetaUpdate then p1.Color.Content.Emphasis else p1.LightMode.Content.Emphasis
				},
				icon = { style = p1.Color.System.Warning }
			},
			[badgeVariantModule.Contrast] = {
				container = { backgroundStyle = p1.Color.System.Contrast },
				content = { style = p1.Inverse.Content.Emphasis },
				icon = { style = p1.Inverse.Content.Emphasis }
			},
			[badgeVariantModule.Standard] = {
				container = { backgroundStyle = p1.Color.ActionStandard.Background },
				content = { style = p1.Color.ActionStandard.Foreground },
				icon = { style = p1.Color.ActionStandard.Foreground }
			},
			[badgeVariantModule.Neutral] = if flagsModule.FoundationBadgeBetaUpdate then nil else {
				container = { backgroundStyle = p1.Color.Shift.Shift_300 },
				content = { style = p1.Color.Content.Emphasis },
				icon = { style = p1.Color.ActionStandard.Foreground }
			},
			[badgeVariantModule.OverMedia] = {
				container = {
					backgroundStyle = if flagsModule.FoundationBadgeBetaUpdate then p1.Color.OverMedia.OverMedia_0 else p1.LightMode.Surface.Surface_100,
					stroke = if flagsModule.FoundationBadgeBetaUpdate then nil else {
						Color = p1.LightMode.Stroke.Default.Color3,
						Transparency = p1.LightMode.Stroke.Default.Transparency
					}
				},
				content = {
					style = if flagsModule.FoundationBadgeBetaUpdate then p1.Inverse.OverMedia.OverMedia_0 else p1.LightMode.Content.Emphasis
				},
				icon = { style = p1.Inverse.OverMedia.OverMedia_0 }
			},
			[badgeVariantModule.Emphasis] = {
				container = { backgroundStyle = p1.Color.ActionEmphasis.Background },
				content = { style = p1.Color.ActionEmphasis.Foreground },
				icon = { style = p1.Color.ActionEmphasis.Foreground }
			}
		},
		shapes = {
			[badgeShapeModule.Pill] = { container = { tag = "radius-circle" } },
			[badgeShapeModule.Box] = { container = { tag = "radius-small" } }
		},
		iconOnly = if flagsModule.FoundationBadgeBetaUpdate then nil elseif flagsModule.FoundationBadgeBetaUpdate then nil else {
			[true] = { container = { tag = "size-600" } },
			[false] = {
				container = { tag = "size-0-600 auto-x padding-x-small" }
			}
		},
		sizes = if flagsModule.FoundationBadgeBetaUpdate then {
			[badgeSizeModule.XSmall] = {
				container = { tag = "gap-xxsmall size-0-400 padding-x-xsmall" },
				text = { tag = "text-caption-small" },
				icon = { size = iconSizeModule.XSmall }
			},
			[badgeSizeModule.Small] = {
				container = { tag = "gap-xsmall size-0-600 padding-x-small" },
				text = { tag = "text-caption-medium" },
				icon = { size = iconSizeModule.XSmall }
			},
			[badgeSizeModule.Medium] = {
				container = { tag = "gap-xsmall size-0-600 padding-x-small" },
				text = { tag = "text-caption-medium" },
				icon = { size = iconSizeModule.XSmall }
			}
		} else nil,
		iconPlacement = if flagsModule.FoundationBadgeBetaUpdate then {
			[iconPositionModule.Left] = { text = { tag = "padding-right-xsmall" } },
			[iconPositionModule.Right] = { text = { tag = "padding-left-xsmall" } },
			[dashModule.None] = { text = { tag = "padding-x-xsmall" } }
		} else nil
	}
end

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: variantsContextModule (ref), composeStyleVariantModule (ref), flagsModule (ref), dashModule (ref)
	local badge = variantsContextModule.useVariants("Badge", variantsFactory, p1)
	
	return composeStyleVariantModule(badge.common, badge.variants[p2], badge.shapes[p3], if flagsModule.FoundationBadgeBetaUpdate then badge.sizes[p4] else nil, if flagsModule.FoundationBadgeBetaUpdate then badge.iconPlacement[p5 or dashModule.None] else nil, if flagsModule.FoundationBadgeBetaUpdate then nil else badge.iconOnly[p6])
end