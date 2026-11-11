local Foundation = script:FindFirstAncestor("Foundation")
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local FlagsModule = require(Foundation.Utility.Flags)
local _ = require(Foundation.Providers.Style.Tokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)
local AvatarSizeModule = require(Foundation.Enums.AvatarSize)
local UserPresenceModule = require(Foundation.Enums.UserPresence)
local IndicatorVariantModule = require(Foundation.Enums.IndicatorVariant)
local IndicatorShapeModule = require(Foundation.Enums.IndicatorShape)
local StatusIndicatorVariantModule = require(Foundation.Enums.StatusIndicatorVariant)
local StatusIndicatorSizeModule = require(Foundation.Enums.StatusIndicatorSize)
local StatusIndicatorShapeModule = require(Foundation.Enums.StatusIndicatorShape)
local _ = require(Foundation.Components.Types)
local IndexBindableModule = require(Foundation.Utility.indexBindable)

local function variantsFactory(p1)
	-- upvalues: FlagsModule (copy), AvatarSizeModule (copy), StatusIndicatorSizeModule (copy), UserPresenceModule (copy), StatusIndicatorShapeModule (copy), StatusIndicatorVariantModule (copy), IndicatorShapeModule (copy), IndicatorVariantModule (copy)
	local Config = if FlagsModule.FoundationAvatarBeta then {
		[AvatarSizeModule.Small] = p1.Stroke.Thicker,
		[AvatarSizeModule.Medium] = p1.Stroke.Thicker,
		[AvatarSizeModule.Large] = p1.Stroke.Thicker,
		[AvatarSizeModule.XLarge] = p1.Stroke.Thicker,
		[AvatarSizeModule.Pictogram] = p1.Stroke.Thicker + p1.Stroke.Standard
	} else nil
	
	return {
		common = {
			container = { tag = "radius-circle" },
			avatar = { tag = "size-full radius-circle" },
			indicatorBackplate = {
				ZIndex = 2,
				tag = "position-bottom-right anchor-bottom-right auto-xy radius-circle bg-surface-0",
				padding = UDim2.fromOffset(3, 3)
			},
			statusIndicatorBackplate = {
				ZIndex = 2,
				tag = "auto-xy radius-circle bg-surface-0",
				AnchorPoint = Vector2.new(1, 1),
				Position = UDim2.fromScale(1, 1),
				padding = UDim2.fromOffset(p1.Size.Size_150 / 2, p1.Size.Size_150 / 2)
			}
		},
		sizes = if FlagsModule.FoundationAvatarBeta then {
			[AvatarSizeModule.XSmall] = {
				statusIndicator = { size = StatusIndicatorSizeModule.XSmall }
			},
			[AvatarSizeModule.Small] = {
				statusIndicator = { size = StatusIndicatorSizeModule.XSmall }
			},
			[AvatarSizeModule.Medium] = {
				statusIndicator = { size = StatusIndicatorSizeModule.Small }
			},
			[AvatarSizeModule.Large] = {
				statusIndicator = { size = StatusIndicatorSizeModule.Small }
			},
			[AvatarSizeModule.XLarge] = {
				statusIndicator = { size = StatusIndicatorSizeModule.Medium }
			},
			[AvatarSizeModule.Pictogram] = {
				statusIndicator = { size = StatusIndicatorSizeModule.Pictogram }
			}
		} else {
			[AvatarSizeModule.XSmall] = { indicator = { size = p1.Size.Size_150 } },
			[AvatarSizeModule.Small] = { indicator = { size = p1.Size.Size_150 } },
			[AvatarSizeModule.Medium] = { indicator = { size = p1.Size.Size_200 } },
			[AvatarSizeModule.Large] = { indicator = { size = p1.Size.Size_200 } },
			[AvatarSizeModule.XLarge] = { indicator = { size = p1.Size.Size_250 } },
			[AvatarSizeModule.Pictogram] = { indicator = { size = p1.Size.Size_500 } }
		},
		presence = {
			[UserPresenceModule.InExperience] = {},
			[UserPresenceModule.Away] = if FlagsModule.FoundationAvatarBeta then {
				statusIndicator = {
					shape = StatusIndicatorShapeModule.Ring,
					variant = StatusIndicatorVariantModule.Neutral
				}
			} else {
				indicator = {
					shape = IndicatorShapeModule.Ring,
					variant = IndicatorVariantModule.Neutral
				}
			},
			[UserPresenceModule.Active] = if FlagsModule.FoundationAvatarBeta then {
				statusIndicator = {
					shape = StatusIndicatorShapeModule.Circle,
					variant = StatusIndicatorVariantModule.Success
				}
			} else {
				indicator = {
					shape = IndicatorShapeModule.Circle,
					variant = IndicatorVariantModule.Success
				}
			},
			[UserPresenceModule.None] = {}
		},
		iconSizeStrokes = {
			[AvatarSizeModule.XSmall] = p1.Stroke.Standard,
			[AvatarSizeModule.Small] = p1.Stroke.Thick,
			[AvatarSizeModule.Medium] = p1.Stroke.Thick,
			[AvatarSizeModule.Large] = p1.Stroke.Thicker,
			[AvatarSizeModule.XLarge] = p1.Stroke.Thicker,
			[AvatarSizeModule.Pictogram] = p1.Stroke.Thicker
		},
		sizeStrokes = if FlagsModule.FoundationAvatarBeta then Config else nil
	}
end

return function(p1, p2, Active, BackgroundStyle, p3)
	-- upvalues: VariantsContextModule (copy), variantsFactory (copy), UserPresenceModule (copy), FlagsModule (copy), ComposeStyleVariantModule (copy), IndexBindableModule (copy)
	local Avatar = VariantsContextModule.useVariants("Avatar", variantsFactory, p1)
	local IsActiveMatch: boolean = not p3 and (Active == UserPresenceModule.Active or Active == UserPresenceModule.Away)
	local BackgroundStyle1 = if p3 or Active ~= UserPresenceModule.InExperience then BackgroundStyle else p1.Color.System.Emphasis
	local IconSizeStroke = if FlagsModule.FoundationAvatarBeta then if p3 then Avatar.iconSizeStrokes[p2] else Avatar.sizeStrokes[p2] elseif p3 then Avatar.iconSizeStrokes[p2] else p1.Stroke.Thicker
	
	return ComposeStyleVariantModule(Avatar.common, Avatar.sizes[p2], Avatar.presence[Active], {
		container = {
			stroke = if BackgroundStyle1 then {
				Color = IndexBindableModule(BackgroundStyle1, "Color3"),
				Transparency = IndexBindableModule(BackgroundStyle1, "Transparency"),
				Thickness = IconSizeStroke
			} else nil,
			backgroundStyle = BackgroundStyle
		},
		indicator = if FlagsModule.FoundationAvatarBeta then nil else { isVisible = IsActiveMatch },
		statusIndicator = if FlagsModule.FoundationAvatarBeta then { isVisible = IsActiveMatch } else nil
	})
end