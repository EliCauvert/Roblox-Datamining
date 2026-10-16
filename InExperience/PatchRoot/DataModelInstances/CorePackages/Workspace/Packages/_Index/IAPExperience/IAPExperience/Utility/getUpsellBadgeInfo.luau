local Parent = script.Parent.Parent
local Enums = require(Parent.Parent.Foundation).Enums
local BadgeTypeModule = require(Parent.Enums.BadgeType)
local GetFFlagIAPExperienceEnableBestValueBadgeModule = require(Parent.Flags.GetFFlagIAPExperienceEnableBestValueBadge)

return function(BestValue, p1) --[[ Line: 24 | Named "getUpsellBadgeInfo" ]]
	-- upvalues: BadgeTypeModule (copy), GetFFlagIAPExperienceEnableBestValueBadgeModule (copy), Enums (copy)
	return {
		text = if BestValue == BadgeTypeModule.Popular then p1.Popular elseif BestValue == BadgeTypeModule.LastPurchased then p1.LastPurchased elseif BestValue == BadgeTypeModule.ForYou then p1.ForYouItem elseif BestValue == BadgeTypeModule.BetterValue then p1.BetterValue elseif BestValue == BadgeTypeModule.BestValue and GetFFlagIAPExperienceEnableBestValueBadgeModule() then p1.BestValue else nil,
		icon = if BestValue == BadgeTypeModule.Popular then Enums.IconName.Flame elseif BestValue == BadgeTypeModule.ForYou then Enums.IconName.CircleStar elseif BestValue == BadgeTypeModule.BetterValue then Enums.IconName.Tag elseif BestValue == BadgeTypeModule.BestValue and GetFFlagIAPExperienceEnableBestValueBadgeModule() then Enums.IconName.Pig else nil
	}
end