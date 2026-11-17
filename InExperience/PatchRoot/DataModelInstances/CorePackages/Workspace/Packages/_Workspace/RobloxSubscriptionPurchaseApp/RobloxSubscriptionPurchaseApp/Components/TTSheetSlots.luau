local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local Parent = RobloxSubscriptionPurchaseApp.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
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
local LegalDisclosureModule = require(script.Parent.LegalDisclosure)
local UsePlaceholderLocalizationModule = require(RobloxSubscriptionPurchaseApp.Hooks.usePlaceholderLocalization)
local CampaignLocalizationsModule = require(RobloxSubscriptionPurchaseApp.Store.CampaignLocalizations)

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
	-- upvalues: UsePlaceholderLocalizationModule (copy), config (copy), SignalsReactModule (copy), CampaignLocalizationsModule (copy), list (copy), ReactModule (copy), FeatureRowModule (copy), Sheet (copy), View (copy), PlusHeroContentModule (copy), FoundationCloudAssetsModule (copy), Button (copy), FillBehavior (copy), ButtonVariant (copy), LegalDisclosureModule (copy)
	local UsePlaceholderLocalizationModuleResult = UsePlaceholderLocalizationModule(config)
	local FeatureRobloxSubscriptionDisclosureTTClaimTerms = SignalsReactModule.useSignalState(CampaignLocalizationsModule.getCampaignLocalizations)["Feature.RobloxSubscription.Disclosure.TTClaimTerms"]
	local PurchaseUIOptions = p1.purchaseUIOptions
	local CtaText = PurchaseUIOptions.ctaText or UsePlaceholderLocalizationModuleResult.ctaText
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
			ActionsContainer = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = "row wrap align-x-center gap-medium size-full-0 auto-xy"
			}, {
				Claim = ReactModule.createElement(Button, {
					LayoutOrder = 1,
					testId = "BlackbirdSheet--tt-claim",
					ref = p1.onButtonMounted,
					text = CtaText,
					onActivated = p1.onActivated,
					isLoading = p1.isLoading,
					fillBehavior = FillBehavior.Fill,
					variant = ButtonVariant.Emphasis
				}),
				LegalDisclosure = if FeatureRobloxSubscriptionDisclosureTTClaimTerms and FeatureRobloxSubscriptionDisclosureTTClaimTerms ~= "" then ReactModule.createElement(LegalDisclosureModule, {
					layoutOrder = 2,
					ctaText = CtaText,
					textTemplate = FeatureRobloxSubscriptionDisclosureTTClaimTerms
				}) else nil
			})
		})
	}
end