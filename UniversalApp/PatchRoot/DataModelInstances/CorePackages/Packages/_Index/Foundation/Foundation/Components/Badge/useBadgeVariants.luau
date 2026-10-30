local Foundation = script:FindFirstAncestor("Foundation")
local BadgeVariantModule = require(Foundation.Enums.BadgeVariant)
local DashModule = require(Foundation.Parent.Dash)
local BadgeShapeModule = require(Foundation.Enums.BadgeShape)
local BadgeSizeModule = require(Foundation.Enums.BadgeSize)
local IconPositionModule = require(Foundation.Enums.IconPosition)
local IconSizeModule = require(Foundation.Enums.IconSize)
local _ = require(Foundation.Components.Types)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local FlagsModule = require(Foundation.Utility.Flags)
local _ = require(Foundation.Providers.Style.Tokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)

function variantsFactory(p1)
	-- upvalues: FlagsModule (copy), BadgeVariantModule (copy), BadgeSizeModule (copy), IconSizeModule (copy), BadgeShapeModule (copy), IconPositionModule (copy), DashModule (copy)
	local Config = if FlagsModule.FoundationBadgeBetaUpdate then nil else {
		[true] = { container = { tag = "size-600" } },
		[false] = {
			container = { tag = "size-0-600 auto-x padding-x-small" }
		}
	}
	
	return {
		common = {
			container = {
				tag = if FlagsModule.FoundationBadgeBetaUpdate then "row align-x-center align-y-center auto-xy" else "row align-x-center align-y-center gap-xsmall"
			},
			text = {
				tag = if FlagsModule.FoundationBadgeBetaUpdate then "auto-xy text-align-x-left text-truncate-split" else "auto-xy text-label-small text-align-x-left text-truncate-split"
			}
		},
		variants = {
			[BadgeVariantModule.Alert] = {
				container = {
					backgroundStyle = if FlagsModule.FoundationBadgeBetaUpdate then {
						Transparency = 0.8,
						Color3 = p1.Color.System.Alert.Color3
					} else p1.Color.System.Alert
				},
				content = {
					style = if FlagsModule.FoundationBadgeBetaUpdate then p1.Color.Content.Emphasis else p1.DarkMode.Content.Emphasis
				},
				icon = { style = p1.Color.System.Alert }
			},
			[BadgeVariantModule.Success] = {
				container = {
					backgroundStyle = if FlagsModule.FoundationBadgeBetaUpdate then {
						Transparency = 0.8,
						Color3 = p1.Color.System.Success.Color3
					} else p1.Color.System.Success
				},
				content = {
					style = if FlagsModule.FoundationBadgeBetaUpdate then p1.Color.Content.Emphasis else p1.LightMode.Content.Emphasis
				},
				icon = { style = p1.Color.System.Success }
			},
			[BadgeVariantModule.Warning] = {
				container = {
					backgroundStyle = if FlagsModule.FoundationBadgeBetaUpdate then {
						Transparency = 0.8,
						Color3 = p1.Color.System.Warning.Color3
					} else p1.Color.System.Warning
				},
				content = {
					style = if FlagsModule.FoundationBadgeBetaUpdate then p1.Color.Content.Emphasis else p1.LightMode.Content.Emphasis
				},
				icon = { style = p1.Color.System.Warning }
			},
			[BadgeVariantModule.Contrast] = {
				container = { backgroundStyle = p1.Color.System.Contrast },
				content = { style = p1.Inverse.Content.Emphasis },
				icon = { style = p1.Inverse.Content.Emphasis }
			},
			[BadgeVariantModule.Standard] = {
				container = { backgroundStyle = p1.Color.ActionStandard.Background },
				content = { style = p1.Color.ActionStandard.Foreground },
				icon = { style = p1.Color.ActionStandard.Foreground }
			},
			[BadgeVariantModule.Neutral] = if FlagsModule.FoundationBadgeBetaUpdate then nil else {
				container = { backgroundStyle = p1.Color.Shift.Shift_300 },
				content = { style = p1.Color.Content.Emphasis },
				icon = { style = p1.Color.ActionStandard.Foreground }
			},
			[BadgeVariantModule.OverMedia] = {
				container = {
					backgroundStyle = if FlagsModule.FoundationBadgeOverMediaAdaptive then p1.Color.OverMedia.OverMedia_0 else p1.LightMode.Surface.Surface_100,
					stroke = if FlagsModule.FoundationBadgeOverMediaAdaptive then nil else {
						Color = p1.LightMode.Stroke.Default.Color3,
						Transparency = p1.LightMode.Stroke.Default.Transparency
					}
				},
				content = {
					style = if FlagsModule.FoundationBadgeOverMediaAdaptive then p1.Inverse.OverMedia.OverMedia_0 else p1.LightMode.Content.Emphasis
				},
				icon = {
					style = if FlagsModule.FoundationBadgeOverMediaAdaptive then p1.Inverse.OverMedia.OverMedia_0 else p1.LightMode.Content.Emphasis
				}
			},
			[BadgeVariantModule.OverMediaWhite] = {
				container = {
					backgroundStyle = p1.LightMode.Surface.Surface_100,
					stroke = {
						Color = p1.LightMode.Stroke.Default.Color3,
						Transparency = p1.LightMode.Stroke.Default.Transparency
					}
				},
				content = { style = p1.LightMode.Content.Emphasis },
				icon = { style = p1.LightMode.Content.Emphasis }
			},
			[BadgeVariantModule.Emphasis] = {
				container = {
					backgroundStyle = if FlagsModule.FoundationSystemEmphasisNonActions then p1.Color.System.Emphasis else p1.Color.ActionEmphasis.Background
				},
				content = {
					style = if FlagsModule.FoundationSystemEmphasisNonActions then p1.DarkMode.Content.Emphasis else p1.Color.ActionEmphasis.Foreground
				},
				icon = {
					style = if FlagsModule.FoundationSystemEmphasisNonActions then p1.DarkMode.Content.Emphasis else p1.Color.ActionEmphasis.Foreground
				}
			}
		},
		shapes = {
			[BadgeShapeModule.Pill] = { container = { tag = "radius-circle" } },
			[BadgeShapeModule.Box] = { container = { tag = "radius-small" } }
		},
		iconOnly = if FlagsModule.FoundationBadgeBetaUpdate then nil else Config,
		sizes = if FlagsModule.FoundationBadgeBetaUpdate then {
			[BadgeSizeModule.XSmall] = {
				container = { tag = "gap-xxsmall size-0-400 padding-x-xsmall" },
				text = { tag = "text-caption-small" },
				icon = { size = IconSizeModule.XSmall }
			},
			[BadgeSizeModule.Small] = {
				container = { tag = "gap-xsmall size-0-600 padding-x-small" },
				text = { tag = "text-caption-medium" },
				icon = { size = IconSizeModule.XSmall }
			},
			[BadgeSizeModule.Medium] = {
				container = { tag = "gap-xsmall size-0-600 padding-x-small" },
				text = { tag = "text-caption-medium" },
				icon = { size = IconSizeModule.XSmall }
			}
		} else nil,
		iconPlacement = if FlagsModule.FoundationBadgeBetaUpdate then {
			[IconPositionModule.Left] = { text = { tag = "padding-right-xsmall" } },
			[IconPositionModule.Right] = { text = { tag = "padding-left-xsmall" } },
			[DashModule.None] = { text = { tag = "padding-x-xsmall" } }
		} else nil
	}
end

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: VariantsContextModule (copy), ComposeStyleVariantModule (copy), FlagsModule (copy), DashModule (copy)
	local Badge = VariantsContextModule.useVariants("Badge", variantsFactory, p1)
	
	return ComposeStyleVariantModule(Badge.common, Badge.variants[p2], Badge.shapes[p3], if FlagsModule.FoundationBadgeBetaUpdate then Badge.sizes[p4] else nil, if FlagsModule.FoundationBadgeBetaUpdate then Badge.iconPlacement[if p5 then p5 else DashModule.None] else nil, if FlagsModule.FoundationBadgeBetaUpdate then nil else Badge.iconOnly[p6])
end