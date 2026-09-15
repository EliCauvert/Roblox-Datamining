local foundation = script:FindFirstAncestor("Foundation")
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local flagsModule = require(foundation.Utility.Flags)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)
local avatarSizeModule = require(foundation.Enums.AvatarSize)
local userPresenceModule = require(foundation.Enums.UserPresence)
local statusIndicatorVariantModule = require(foundation.Enums.StatusIndicatorVariant)
local statusIndicatorSizeModule = require(foundation.Enums.StatusIndicatorSize)
local statusIndicatorShapeModule = require(foundation.Enums.StatusIndicatorShape)
local _ = require(foundation.Components.Types)
local indexBindableModule = require(foundation.Utility.indexBindable)

local function variantsFactory(p1)
	-- upvalues: flagsModule (ref), avatarSizeModule (ref), statusIndicatorSizeModule (ref), userPresenceModule (ref), statusIndicatorShapeModule (ref), statusIndicatorVariantModule (ref)
	return {
		common = {
			container = { tag = "radius-circle" },
			avatar = { tag = "size-full radius-circle" },
			statusIndicatorBackplate = if flagsModule.FoundationStatusIndicatorMask then nil else {
				ZIndex = 2,
				tag = "auto-xy radius-circle bg-surface-0",
				AnchorPoint = Vector2.new(1, 1),
				Position = UDim2.fromScale(1, 1),
				padding = UDim2.fromOffset(p1.Size.Size_150 / 2, p1.Size.Size_150 / 2)
			},
			statusIndicatorMask = if flagsModule.FoundationStatusIndicatorMask then {
				ZIndex = 2,
				AnchorPoint = Vector2.new(1, 1),
				Position = UDim2.new(1, -p1.Size.Size_150 / 2, 1, -p1.Size.Size_150 / 2),
				mask = p1.Color.Surface.Surface_0
			} else nil
		},
		sizes = {
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
		},
		presence = {
			[userPresenceModule.InExperience] = {},
			[userPresenceModule.Away] = {
				statusIndicator = {
					shape = statusIndicatorShapeModule.Ring,
					variant = statusIndicatorVariantModule.Neutral
				}
			},
			[userPresenceModule.Active] = {
				statusIndicator = {
					shape = statusIndicatorShapeModule.Circle,
					variant = statusIndicatorVariantModule.Success
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
		sizeStrokes = {
			[avatarSizeModule.Small] = p1.Stroke.Thicker,
			[avatarSizeModule.Medium] = p1.Stroke.Thicker,
			[avatarSizeModule.Large] = p1.Stroke.Thicker,
			[avatarSizeModule.XLarge] = p1.Stroke.Thicker,
			[avatarSizeModule.Pictogram] = p1.Stroke.Thicker + p1.Stroke.Standard
		}
	}
end

return function(p1, p2, p3, p4, p5)
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), userPresenceModule (ref), composeStyleVariantModule (ref), indexBindableModule (ref)
	local avatar = variantsContextModule.useVariants("Avatar", variantsFactory, p1)
	local var1 = if p5 or p3 ~= userPresenceModule.InExperience then p4 else p1.Color.System.Emphasis
	
	return composeStyleVariantModule(avatar.common, avatar.sizes[p2], avatar.presence[p3], {
		container = {
			stroke = if var1 then {
				Color = indexBindableModule(var1, "Color3"),
				Transparency = indexBindableModule(var1, "Transparency"),
				Thickness = if p5 then avatar.iconSizeStrokes[p2] else avatar.sizeStrokes[p2]
			} else nil,
			backgroundStyle = p4
		},
		statusIndicator = {
			isVisible = not p5 and (if p3 ~= userPresenceModule.Active then p3 == userPresenceModule.Away else true)
		}
	})
end