local parent = script.Parent.Parent
local enums = require(parent.Parent.Foundation).Enums
local badgeTypeModule = require(parent.Enums.BadgeType)
local getFFlagIAPExperienceEnableBestValueBadgeModule = require(parent.Flags.GetFFlagIAPExperienceEnableBestValueBadge)

return function(p1, p2)
	-- upvalues: badgeTypeModule (ref), getFFlagIAPExperienceEnableBestValueBadgeModule (ref), enums (ref)
	return {
		text = if p1 == badgeTypeModule.Popular then p2.Popular elseif p1 == badgeTypeModule.LastPurchased then p2.LastPurchased elseif p1 == badgeTypeModule.ForYou then p2.ForYouItem elseif p1 == badgeTypeModule.BetterValue then p2.BetterValue elseif p1 == badgeTypeModule.BestValue and getFFlagIAPExperienceEnableBestValueBadgeModule() then p2.BestValue else nil,
		icon = if p1 == badgeTypeModule.Popular then enums.IconName.Flame elseif p1 == badgeTypeModule.ForYou then enums.IconName.CircleStar elseif p1 == badgeTypeModule.BetterValue then enums.IconName.Tag elseif p1 == badgeTypeModule.BestValue and getFFlagIAPExperienceEnableBestValueBadgeModule() then enums.IconName.Pig else nil
	}
end