local Parent = script:FindFirstAncestor("IAPExperience").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Checkbox = FoundationModule.Checkbox
local Badge = FoundationModule.Badge
local BadgeVariant = FoundationModule.Enums.BadgeVariant
local BadgeShape = FoundationModule.Enums.BadgeShape
local IconVariant = FoundationModule.Enums.IconVariant
local IconPosition = FoundationModule.Enums.IconPosition
local UseTokensFunction = FoundationModule.Hooks.useTokens
local BuilderIconsModule = require(Parent.BuilderIcons)
local UseRemainingTimeTextFunction = require(Parent.InExperienceOffers).Hooks.useRemainingTimeText
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FFlagEnableInExperienceOfferExpiryBadge = require(Parent.SharedFlags).FFlagEnableInExperienceOfferExpiryBadge
local UpdateOfferExpiryBadgeBoxShape = game:DefineFastFlag("UpdateOfferExpiryBadgeBoxShape", false)

return function(Frame: Frame)
	-- upvalues: UseTokensFunction (copy), UseRemainingTimeTextFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), View (copy), Checkbox (copy), FoundationModule (copy), FFlagEnableInExperienceOfferExpiryBadge (copy), Badge (copy), BuilderIconsModule (copy), IconVariant (copy), IconPosition (copy), BadgeVariant (copy), UpdateOfferExpiryBadgeBoxShape (copy), BadgeShape (copy)
	local UseTokensResult = UseTokensFunction()
	local UseRemainingTimeTextResult = UseRemainingTimeTextFunction(Frame.expirationTimeUtc)
	local UseLocalizationResult = UseLocalizationFunction({
		endTime = {
			"Feature.InExperienceShop.Label.EndTime",
			timeRemaining = UseRemainingTimeTextResult or ""
		}
	})
	local LayoutOrder = Frame.LayoutOrder or 0
	
	return ReactModule.createElement(View, {
		tag = "row wrap align-x-left items-center gap-small size-full-0 auto-y",
		LayoutOrder = Frame.LayoutOrder,
		padding = {
			right = UDim.new(0, UseTokensResult.Size.Size_400 + UseTokensResult.Gap.Medium)
		}
	}, {
		Checkbox = ReactModule.createElement(Checkbox, {
			LayoutOrder = LayoutOrder,
			size = FoundationModule.Enums.InputSize.XSmall,
			label = Frame.label,
			isChecked = Frame.isChecked,
			isDisabled = Frame.isDisabled,
			onActivated = Frame.onActivated
		}),
		ExpiryBadge = if FFlagEnableInExperienceOfferExpiryBadge and UseRemainingTimeTextResult ~= nil then ReactModule.createElement(Badge, {
			LayoutOrder = LayoutOrder + 1,
			icon = {
				name = BuilderIconsModule.Icon.Clock,
				variant = IconVariant.Filled,
				position = IconPosition.Left
			},
			text = UseLocalizationResult.endTime,
			variant = BadgeVariant.Standard,
			shape = if UpdateOfferExpiryBadgeBoxShape then BadgeShape.Box else nil
		}) else nil
	})
end