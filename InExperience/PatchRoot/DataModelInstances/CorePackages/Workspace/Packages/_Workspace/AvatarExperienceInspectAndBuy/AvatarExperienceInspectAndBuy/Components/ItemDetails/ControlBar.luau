local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local Parent = AvatarExperienceInspectAndBuy.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local BadgeModule = require(AvatarExperienceInspectAndBuy.Components.Common.Badge)
local Enums = FoundationModule.Enums

return function(Frame) --[[ Line: 33 | Named "ControlBar" ]]
	-- upvalues: ReactModule (copy), FoundationModule (copy), BadgeModule (copy), Enums (copy)
	return ReactModule.createElement(FoundationModule.View, {
		tag = "auto-xy row align-x-left align-y-center gap-small",
		LayoutOrder = Frame.LayoutOrder
	}, {
		FavoritesBadge = ReactModule.createElement(BadgeModule, {
			LayoutOrder = 1,
			icon = Enums.IconName.Star,
			iconVariant = Frame.favoritesBadge.iconVariant,
			text = Frame.favoritesBadge.text,
			onActivated = Frame.favoritesBadge.onActivated
		}),
		TryOnBadge = if Frame.tryOnBadge then ReactModule.createElement(BadgeModule, {
			LayoutOrder = 2,
			icon = Enums.IconName.MirrorStanding,
			iconVariant = Frame.tryOnBadge.iconVariant,
			text = Frame.tryOnBadge.text,
			onActivated = Frame.tryOnBadge.onActivated
		}) else nil
	})
end