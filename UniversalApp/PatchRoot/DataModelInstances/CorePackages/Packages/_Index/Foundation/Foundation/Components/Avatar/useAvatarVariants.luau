local Foundation = script:FindFirstAncestor("Foundation")
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local FlagsModule = require(Foundation.Utility.Flags)
local _ = require(Foundation.Providers.Style.Tokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)
local AvatarSizeModule = require(Foundation.Enums.AvatarSize)
local UserPresenceModule = require(Foundation.Enums.UserPresence)
local StatusIndicatorVariantModule = require(Foundation.Enums.StatusIndicatorVariant)
local StatusIndicatorSizeModule = require(Foundation.Enums.StatusIndicatorSize)
local StatusIndicatorShapeModule = require(Foundation.Enums.StatusIndicatorShape)
local _ = require(Foundation.Components.Types)
local IndexBindableModule = require(Foundation.Utility.indexBindable)

local function variantsFactory(p1)
	-- upvalues: FlagsModule (copy), AvatarSizeModule (copy), StatusIndicatorSizeModule (copy), UserPresenceModule (copy), StatusIndicatorShapeModule (copy), StatusIndicatorVariantModule (copy)
	return {
		common = {
			container = { tag = "radius-circle" },
			avatar = { tag = "size-full radius-circle" },
			statusIndicatorBackplate = if FlagsModule.FoundationStatusIndicatorMask then nil else {
				ZIndex = 2,
				tag = "auto-xy radius-circle bg-surface-0",
				AnchorPoint = Vector2.new(1, 1),
				Position = UDim2.fromScale(1, 1),
				padding = UDim2.fromOffset(p1.Size.Size_150 / 2, p1.Size.Size_150 / 2)
			},
			statusIndicatorMask = if FlagsModule.FoundationStatusIndicatorMask then {
				ZIndex = 2,
				AnchorPoint = Vector2.new(1, 1),
				Position = UDim2.new(1, -p1.Size.Size_150 / 2, 1, -p1.Size.Size_150 / 2),
				mask = p1.Color.Surface.Surface_0
			} else nil
		},
		sizes = {
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
				statusIndicator = {
					size = if FlagsModule.FoundationStatusIndicatorDesignUpdate then StatusIndicatorSizeModule.Large else StatusIndicatorSizeModule.Pictogram
				}
			}
		},
		presence = {
			[UserPresenceModule.InExperience] = {},
			[UserPresenceModule.Away] = {
				statusIndicator = {
					shape = StatusIndicatorShapeModule.Ring,
					variant = StatusIndicatorVariantModule.Neutral
				}
			},
			[UserPresenceModule.Active] = {
				statusIndicator = {
					shape = StatusIndicatorShapeModule.Circle,
					variant = StatusIndicatorVariantModule.Success
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
		sizeStrokes = {
			[AvatarSizeModule.Small] = p1.Stroke.Thicker,
			[AvatarSizeModule.Medium] = p1.Stroke.Thicker,
			[AvatarSizeModule.Large] = p1.Stroke.Thicker,
			[AvatarSizeModule.XLarge] = p1.Stroke.Thicker,
			[AvatarSizeModule.Pictogram] = p1.Stroke.Thicker + p1.Stroke.Standard
		}
	}
end

return function(p1, p2, Active, BackgroundStyle, p3)
	-- upvalues: VariantsContextModule (copy), variantsFactory (copy), UserPresenceModule (copy), ComposeStyleVariantModule (copy), IndexBindableModule (copy)
	local Avatar = VariantsContextModule.useVariants("Avatar", variantsFactory, p1)
	local BackgroundStyle1 = if p3 or Active ~= UserPresenceModule.InExperience then BackgroundStyle else p1.Color.System.Emphasis
	local IconSizeStroke = if p3 then Avatar.iconSizeStrokes[p2] else Avatar.sizeStrokes[p2]
	
	return ComposeStyleVariantModule(Avatar.common, Avatar.sizes[p2], Avatar.presence[Active], {
		container = {
			stroke = if BackgroundStyle1 then {
				Color = IndexBindableModule(BackgroundStyle1, "Color3"),
				Transparency = IndexBindableModule(BackgroundStyle1, "Transparency"),
				Thickness = IconSizeStroke
			} else nil,
			backgroundStyle = BackgroundStyle
		},
		statusIndicator = {
			isVisible = not p3 and (Active == UserPresenceModule.Active or Active == UserPresenceModule.Away)
		}
	})
end