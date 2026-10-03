local parent = script:FindFirstAncestor("IAPExperience").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local checkbox = foundationModule.Checkbox
local badge = foundationModule.Badge
local badgeVariant = foundationModule.Enums.BadgeVariant
local badgeShape = foundationModule.Enums.BadgeShape
local iconVariant = foundationModule.Enums.IconVariant
local iconPosition = foundationModule.Enums.IconPosition
local useTokens = foundationModule.Hooks.useTokens
local builderIconsModule = require(parent.BuilderIcons)
local useRemainingTimeText = require(parent.InExperienceOffers).Hooks.useRemainingTimeText
local useLocalization = require(parent.Localization).Hooks.useLocalization
local fFlagEnableInExperienceOfferExpiryBadge = require(parent.SharedFlags).FFlagEnableInExperienceOfferExpiryBadge
local updateOfferExpiryBadgeBoxShape = game:DefineFastFlag("UpdateOfferExpiryBadgeBoxShape", false)

return function(p1)
	-- upvalues: useTokens (ref), useRemainingTimeText (ref), useLocalization (ref), reactModule (ref), view (ref), checkbox (ref), foundationModule (ref), fFlagEnableInExperienceOfferExpiryBadge (ref), badge (ref), builderIconsModule (ref), iconVariant (ref), iconPosition (ref), badgeVariant (ref), updateOfferExpiryBadgeBoxShape (ref), badgeShape (ref)
	local var1 = useTokens()
	local var2 = useRemainingTimeText(p1.expirationTimeUtc)
	local layoutOrder = p1.LayoutOrder or 0
	
	return reactModule.createElement(view, {
		tag = "row wrap align-x-left items-center gap-small size-full-0 auto-y",
		LayoutOrder = p1.LayoutOrder,
		padding = {
			right = UDim.new(0, var1.Size.Size_400 + var1.Gap.Medium)
		}
	}, {
		Checkbox = reactModule.createElement(checkbox, {
			LayoutOrder = layoutOrder,
			size = foundationModule.Enums.InputSize.XSmall,
			label = p1.label,
			isChecked = p1.isChecked,
			isDisabled = p1.isDisabled,
			onActivated = p1.onActivated
		}),
		ExpiryBadge = if fFlagEnableInExperienceOfferExpiryBadge and var2 ~= nil then reactModule.createElement(badge, {
			LayoutOrder = layoutOrder + 1,
			icon = {
				name = builderIconsModule.Icon.Clock,
				variant = iconVariant.Filled,
				position = iconPosition.Left
			},
			text = useLocalization({
				endTime = {
					"Feature.InExperienceShop.Label.EndTime",
					timeRemaining = var2 or ""
				}
			}).endTime,
			variant = badgeVariant.Standard,
			shape = if updateOfferExpiryBadgeBoxShape then badgeShape.Box else nil
		}) else nil
	})
end