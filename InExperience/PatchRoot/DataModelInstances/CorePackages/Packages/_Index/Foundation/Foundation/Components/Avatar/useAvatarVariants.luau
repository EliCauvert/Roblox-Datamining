local foundation = script:FindFirstAncestor("Foundation")
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local flagsModule = require(foundation.Utility.Flags)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)
local avatarSizeModule = require(foundation.Enums.AvatarSize)
local userPresenceModule = require(foundation.Enums.UserPresence)
local indicatorVariantModule = require(foundation.Enums.IndicatorVariant)
local indicatorShapeModule = require(foundation.Enums.IndicatorShape)
local statusIndicatorVariantModule = require(foundation.Enums.StatusIndicatorVariant)
local statusIndicatorSizeModule = require(foundation.Enums.StatusIndicatorSize)
local statusIndicatorShapeModule = require(foundation.Enums.StatusIndicatorShape)
local _ = require(foundation.Components.Types)
local indexBindableModule = require(foundation.Utility.indexBindable)

local function variantsFactory(p1)
	-- upvalues: flagsModule (ref), avatarSizeModule (ref), statusIndicatorSizeModule (ref), userPresenceModule (ref), statusIndicatorShapeModule (ref), statusIndicatorVariantModule (ref), indicatorShapeModule (ref), indicatorVariantModule (ref)
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
		sizes = if flagsModule.FoundationAvatarBeta then {
			[avatarSizeModule.XSmall] = {
				statusIndicator = { size = statusIndicatorSizeModule.XSmall }
			},
			[avatarSizeModule.Small] = {
				statusIndicator = { size = statusIndicatorSizeModule.XSmall }
			},
			[avatarSizeModule.Medium] = {
				statusIndicator = { size = statusIndicatorSizeModule.Small }
			},
			[avatarSizeModule.Large] = {
				statusIndicator = { size = statusIndicatorSizeModule.Small }
			},
			[avatarSizeModule.XLarge] = {
				statusIndicator = { size = statusIndicatorSizeModule.Medium }
			},
			[avatarSizeModule.Pictogram] = {
				statusIndicator = { size = statusIndicatorSizeModule.Pictogram }
			}
		} else {
			[avatarSizeModule.XSmall] = { indicator = { size = p1.Size.Size_150 } },
			[avatarSizeModule.Small] = { indicator = { size = p1.Size.Size_150 } },
			[avatarSizeModule.Medium] = { indicator = { size = p1.Size.Size_200 } },
			[avatarSizeModule.Large] = { indicator = { size = p1.Size.Size_200 } },
			[avatarSizeModule.XLarge] = { indicator = { size = p1.Size.Size_250 } },
			[avatarSizeModule.Pictogram] = { indicator = { size = p1.Size.Size_500 } }
		},
		presence = {
			[userPresenceModule.InExperience] = {},
			[userPresenceModule.Away] = if flagsModule.FoundationAvatarBeta then {
				statusIndicator = {
					shape = statusIndicatorShapeModule.Ring,
					variant = statusIndicatorVariantModule.Neutral
				}
			} else {
				indicator = {
					shape = indicatorShapeModule.Ring,
					variant = indicatorVariantModule.Neutral
				}
			},
			[userPresenceModule.Active] = if flagsModule.FoundationAvatarBeta then {
				statusIndicator = {
					shape = statusIndicatorShapeModule.Circle,
					variant = statusIndicatorVariantModule.Success
				}
			} else {
				indicator = {
					shape = indicatorShapeModule.Circle,
					variant = indicatorVariantModule.Success
				}
			},
			[userPresenceModule.None] = {}
		},
		iconSizeStrokes = {
			[avatarSizeModule.XSmall] = p1.Stroke.Standard,
			[avatarSizeModule.Small] = p1.Stroke.Thick,
			[avatarSizeModule.Medium] = p1.Stroke.Thick,
			[avatarSizeModule.Large] = p1.Stroke.Thicker,
			[avatarSizeModule.XLarge] = p1.Stroke.Thicker,
			[avatarSizeModule.Pictogram] = p1.Stroke.Thicker
		},
		sizeStrokes = if flagsModule.FoundationAvatarBeta then if flagsModule.FoundationAvatarBeta then {
			[avatarSizeModule.Small] = p1.Stroke.Thicker,
			[avatarSizeModule.Medium] = p1.Stroke.Thicker,
			[avatarSizeModule.Large] = p1.Stroke.Thicker,
			[avatarSizeModule.XLarge] = p1.Stroke.Thicker,
			[avatarSizeModule.Pictogram] = p1.Stroke.Thicker + p1.Stroke.Standard
		} else nil else nil
	}
end

return function(p1, p2, p3, p4, p5)
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), userPresenceModule (ref), flagsModule (ref), composeStyleVariantModule (ref), indexBindableModule (ref)
	local avatar = variantsContextModule.useVariants("Avatar", variantsFactory, p1)
	local var1 = not p5 and (if p3 ~= userPresenceModule.Active then p3 == userPresenceModule.Away else true)
	local var2 = if p5 or p3 ~= userPresenceModule.InExperience then p4 else p1.Color.System.Emphasis
	
	return composeStyleVariantModule(avatar.common, avatar.sizes[p2], avatar.presence[p3], {
		container = {
			stroke = if var2 then {
				Color = indexBindableModule(var2, "Color3"),
				Transparency = indexBindableModule(var2, "Transparency"),
				Thickness = if flagsModule.FoundationAvatarBeta then if p5 then avatar.iconSizeStrokes[p2] else avatar.sizeStrokes[p2] elseif not p5 then p1.Stroke.Thicker else avatar.iconSizeStrokes[p2]
			} else nil,
			backgroundStyle = p4
		},
		indicator = if flagsModule.FoundationAvatarBeta then nil else { isVisible = var1 },
		statusIndicator = if flagsModule.FoundationAvatarBeta then { isVisible = var1 } else nil
	})
end