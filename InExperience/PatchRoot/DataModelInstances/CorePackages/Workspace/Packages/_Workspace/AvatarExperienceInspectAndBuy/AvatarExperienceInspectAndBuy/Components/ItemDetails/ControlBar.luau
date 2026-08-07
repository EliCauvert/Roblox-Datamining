local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local parent = avatarExperienceInspectAndBuy.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local badgeModule = require(avatarExperienceInspectAndBuy.Components.Common.Badge)
local enums = foundationModule.Enums

return function(p0) --[[ line: 33 | named "ControlBar" ]]
	-- upvalues: reactModule (ref), foundationModule (ref), badgeModule (ref), enums (ref)
	return reactModule.createElement(foundationModule.View, {
		tag = "auto-xy row align-x-left align-y-center gap-small",
		LayoutOrder = p0.LayoutOrder
	}, {
		FavoritesBadge = reactModule.createElement(badgeModule, {
			LayoutOrder = 1,
			icon = enums.IconName.Star,
			iconVariant = p0.favoritesBadge.iconVariant,
			text = p0.favoritesBadge.text,
			onActivated = p0.favoritesBadge.onActivated
		}),
		TryOnBadge = if p0.tryOnBadge then reactModule.createElement(badgeModule, {
			LayoutOrder = 2,
			icon = enums.IconName.MirrorStanding,
			iconVariant = p0.tryOnBadge.iconVariant,
			text = p0.tryOnBadge.text,
			onActivated = p0.tryOnBadge.onActivated
		}) else nil
	})
end