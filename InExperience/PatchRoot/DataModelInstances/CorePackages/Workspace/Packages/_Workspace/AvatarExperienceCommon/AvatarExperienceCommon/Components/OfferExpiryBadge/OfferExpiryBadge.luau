local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local parent = avatarExperienceCommon.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local builderIconsModule = require(parent.BuilderIcons)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useRemainingTimeTextModule = require(avatarExperienceCommon.Hooks.useRemainingTimeText)
local badgeVariant = foundationModule.Enums.BadgeVariant
local badgeShape = foundationModule.Enums.BadgeShape
local iconVariant = foundationModule.Enums.IconVariant
local iconPosition = foundationModule.Enums.IconPosition

return function(p1)
	-- upvalues: useRemainingTimeTextModule (ref), useLocalization (ref), reactModule (ref), foundationModule (ref), builderIconsModule (ref), iconVariant (ref), iconPosition (ref), badgeVariant (ref), badgeShape (ref)
	local var1 = useRemainingTimeTextModule(p1.expirationTimeInUTC)
	
	return if var1 == nil then nil else reactModule.createElement(foundationModule.Badge, {
		LayoutOrder = p1.layoutOrder,
		icon = {
			name = builderIconsModule.Icon.Clock,
			variant = iconVariant.Filled,
			position = iconPosition.Left
		},
		text = useLocalization({
			endTime = {
				"Feature.InExperienceShop.Label.EndTime",
				timeRemaining = var1 or ""
			}
		}).endTime,
		variant = badgeVariant.Standard,
		shape = badgeShape.Box
	})
end