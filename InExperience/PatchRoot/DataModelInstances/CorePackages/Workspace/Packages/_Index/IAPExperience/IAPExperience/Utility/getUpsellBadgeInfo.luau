local parent = script.Parent.Parent
local enums = require(parent.Parent.Foundation).Enums
local badgeTypeModule = require(parent.Enums.BadgeType)
local getFFlagIAPExperienceEnableBestValueBadgeModule = require(parent.Flags.GetFFlagIAPExperienceEnableBestValueBadge)

return function(p0, p1) --[[ line: 24 | named "getUpsellBadgeInfo" ]]
	-- upvalues: badgeTypeModule (ref), getFFlagIAPExperienceEnableBestValueBadgeModule (ref), enums (ref)
	return {
		text = if p0 == badgeTypeModule.Popular then p1.Popular elseif p0 == badgeTypeModule.LastPurchased then p1.LastPurchased elseif p0 == badgeTypeModule.ForYou then p1.ForYouItem elseif p0 == badgeTypeModule.BetterValue then p1.BetterValue elseif p0 == badgeTypeModule.BestValue and getFFlagIAPExperienceEnableBestValueBadgeModule() then p1.BestValue else nil,
		icon = if p0 == badgeTypeModule.Popular then enums.IconName.Flame elseif p0 == badgeTypeModule.ForYou then enums.IconName.CircleStar elseif p0 == badgeTypeModule.BetterValue then enums.IconName.Tag elseif p0 == badgeTypeModule.BestValue and getFFlagIAPExperienceEnableBestValueBadgeModule() then enums.IconName.Pig else nil
	}
end