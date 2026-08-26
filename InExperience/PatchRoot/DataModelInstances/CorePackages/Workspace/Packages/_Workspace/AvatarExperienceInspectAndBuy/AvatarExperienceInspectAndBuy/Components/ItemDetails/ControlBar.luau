local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local parent = avatarExperienceInspectAndBuy.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local badgeModule = require(avatarExperienceInspectAndBuy.Components.Common.Badge)
local enums = foundationModule.Enums

return function(p1)
	-- upvalues: reactModule (ref), foundationModule (ref), badgeModule (ref), enums (ref)
	return reactModule.createElement(foundationModule.View, {
		tag = "auto-xy row align-x-left align-y-center gap-small",
		LayoutOrder = p1.LayoutOrder
	}, {
		FavoritesBadge = reactModule.createElement(badgeModule, {
			LayoutOrder = 1,
			icon = enums.IconName.Star,
			iconVariant = p1.favoritesBadge.iconVariant,
			text = p1.favoritesBadge.text,
			onActivated = p1.favoritesBadge.onActivated
		}),
		TryOnBadge = if p1.tryOnBadge then reactModule.createElement(badgeModule, {
			LayoutOrder = 2,
			icon = enums.IconName.MirrorStanding,
			iconVariant = p1.tryOnBadge.iconVariant,
			text = p1.tryOnBadge.text,
			onActivated = p1.tryOnBadge.onActivated
		}) else nil
	})
end