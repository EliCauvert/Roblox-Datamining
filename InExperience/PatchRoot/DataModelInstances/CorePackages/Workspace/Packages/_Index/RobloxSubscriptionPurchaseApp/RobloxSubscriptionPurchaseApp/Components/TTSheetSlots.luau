local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local Parent = RobloxSubscriptionPurchaseApp.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local FoundationCloudAssetsModule = require(Parent.FoundationCloudAssets)
local View = FoundationModule.View
local Sheet = FoundationModule.Sheet
local Button = FoundationModule.Button
local IconName = FoundationModule.Enums.IconName
local FillBehavior = FoundationModule.Enums.FillBehavior
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local _ = require(RobloxSubscriptionPurchaseApp.types)
local FeatureRowModule = require(script.Parent.FeatureRow)
local PlusHeroContentModule = require(script.Parent.PlusHeroContent)
local UsePlaceholderLocalizationModule = require(RobloxSubscriptionPurchaseApp.Hooks.usePlaceholderLocalization)

if require(RobloxSubscriptionPurchaseApp.Flags.FFlagTTOnboardingSheet) then
	FoundationCloudAssetsModule.preloadAsset("pictograms/gift")
	FoundationCloudAssetsModule.preloadAsset("pictograms/plus")
end
local config = {
	title = "Feature.RobloxSubscription.Heading.TTGrant",
	description = "Feature.RobloxSubscription.Description.TTGrant",
	ctaText = "Feature.RobloxSubscription.Action.TTClaim",
	benefitCustomize = "Feature.RobloxSubscription.Label.TTBenefitCustomize",
	benefitDiscount = "Feature.RobloxSubscription.Label.TTBenefitDiscount",
	benefitPrivateServer = "Feature.RobloxSubscription.Label.TTBenefitPrivateServer",
	benefitRobux = "Feature.RobloxSubscription.Label.TTBenefitRobux"
}
local list = {
	{
		stringName = "benefitCustomize",
		iconName = IconName.PaintBrush
	},
	{ stringName = "benefitDiscount", iconName = IconName.Tag },
	{
		stringName = "benefitPrivateServer",
		iconName = IconName.Controller
	},
	{ stringName = "benefitRobux", iconName = IconName.Robux }
}

return function(p1)
	-- upvalues: UsePlaceholderLocalizationModule (copy), config (copy), list (copy), ReactModule (copy), FeatureRowModule (copy), Sheet (copy), View (copy), PlusHeroContentModule (copy), FoundationCloudAssetsModule (copy), Button (copy), FillBehavior (copy), ButtonVariant (copy)
	local UsePlaceholderLocalizationModuleResult = UsePlaceholderLocalizationModule(config)
	local PurchaseUIOptions = p1.purchaseUIOptions
	local Elements = {}
	
	for LayoutOrder, value in list do
		Elements[`Benefit{LayoutOrder}`] = ReactModule.createElement(FeatureRowModule, {
			layoutOrder = LayoutOrder,
			iconName = value.iconName,
			text = UsePlaceholderLocalizationModuleResult[value.stringName]
		})
	end
	return {
		Header = ReactModule.createElement(Sheet.Header, { hasCloseAffordance = true }),
		Content = ReactModule.createElement(Sheet.Content, nil, {
			Body = ReactModule.createElement(View, { tag = "col gap-large size-full-0 auto-y" }, {
				Hero = ReactModule.createElement(PlusHeroContentModule, {
					layoutOrder = 1,
					pictogram = FoundationCloudAssetsModule.Assets["pictograms/gift"],
					accentPictogram = FoundationCloudAssetsModule.Assets["pictograms/plus"],
					title = PurchaseUIOptions.title or UsePlaceholderLocalizationModuleResult.title,
					subtitle = PurchaseUIOptions.description or UsePlaceholderLocalizationModuleResult.description
				}),
				Benefits = ReactModule.createElement(View, {
					LayoutOrder = 2,
					tag = "col align-x-left gap-small size-full-0 auto-y"
				}, Elements)
			})
		}),
		Actions = ReactModule.createElement(Sheet.Actions, nil, {
			Claim = ReactModule.createElement(Button, {
				testId = "BlackbirdSheet--tt-claim",
				ref = p1.onButtonMounted,
				text = PurchaseUIOptions.ctaText or UsePlaceholderLocalizationModuleResult.ctaText,
				onActivated = p1.onActivated,
				isLoading = p1.isLoading,
				fillBehavior = FillBehavior.Fill,
				variant = ButtonVariant.Emphasis
			})
		})
	}
end