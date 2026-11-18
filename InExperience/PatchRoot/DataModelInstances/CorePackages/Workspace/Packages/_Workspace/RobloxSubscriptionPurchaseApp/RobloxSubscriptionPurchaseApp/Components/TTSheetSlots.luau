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
local UseTokensFunction = FoundationModule.Hooks.useTokens
local _ = require(RobloxSubscriptionPurchaseApp.types)
local FeatureRowModule = require(script.Parent.FeatureRow)
local PlusHeroContentModule = require(script.Parent.PlusHeroContent)
local LegalDisclosureModule = require(script.Parent.LegalDisclosure)
local UsePlaceholderLocalizationModule = require(RobloxSubscriptionPurchaseApp.Hooks.usePlaceholderLocalization)
local CampaignLocalizationsModule = require(RobloxSubscriptionPurchaseApp.Store.CampaignLocalizations)
local FFlagTTOnboardingSheetModule = require(RobloxSubscriptionPurchaseApp.Flags.FFlagTTOnboardingSheet)
local FFlagOnboardingSheetLayout = require(Parent.SharedFlags).FFlagOnboardingSheetLayout

if FFlagTTOnboardingSheetModule then
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
	-- upvalues: FFlagOnboardingSheetLayout (copy), UseTokensFunction (copy), UsePlaceholderLocalizationModule (copy), config (copy), SignalsReactModule (copy), CampaignLocalizationsModule (copy), list (copy), ReactModule (copy), FeatureRowModule (copy), FoundationCloudAssetsModule (copy), View (copy), Button (copy), FillBehavior (copy), ButtonVariant (copy), LegalDisclosureModule (copy), Sheet (copy), PlusHeroContentModule (copy)
	local Padding = nil
	
	if FFlagOnboardingSheetLayout then
		local UseTokensResult = UseTokensFunction()
		local _UDim = UDim.new(0, UseTokensResult.Padding.Medium - UseTokensResult.Margin.Small)
		Padding = {
			top = UDim.new(0, UseTokensResult.Padding.Medium - UseTokensResult.Padding.Small - UseTokensResult.Margin.Small),
			bottom = _UDim,
			left = _UDim,
			right = _UDim
		}
	end
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
	local PictogramsGift = FoundationCloudAssetsModule.Assets["pictograms/gift"]
	local PictogramsPlus = FoundationCloudAssetsModule.Assets["pictograms/plus"]
	local Element = ReactModule.createElement(View, {
		LayoutOrder = 1,
		tag = {
			["row wrap align-x-center gap-small size-full-0 auto-xy"] = FFlagOnboardingSheetLayout,
			["row wrap align-x-center gap-medium size-full-0 auto-xy"] = not FFlagOnboardingSheetLayout
		}
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
	
	return {
		Header = if FFlagOnboardingSheetLayout then nil else ReactModule.createElement(Sheet.Header, { hasCloseAffordance = true }),
		FullBleed = if FFlagOnboardingSheetLayout then ReactModule.createElement(Sheet.FullBleed, { media = "", aspectRatio = 1.7777777777777777 }, {
			Hero = ReactModule.createElement(View, {
				tag = "row align-x-center align-y-center size-full radius-top-large bg-shift-100",
				testId = "BlackbirdSheet--tt-hero"
			}, {
				Pictogram = ReactModule.createElement(PlusHeroContentModule, {
					layoutOrder = 1,
					pictogram = PictogramsGift,
					accentPictogram = PictogramsPlus,
					twoCardPictogramSize = Vector2.new(320, 180)
				})
			})
		}) else nil,
		Content = ReactModule.createElement(Sheet.Content, {
			isContentFullBleed = if FFlagOnboardingSheetLayout then true else nil
		}, {
			Body = ReactModule.createElement(View, {
				tag = {
					["col gap-medium size-full-0 auto-y padding-x-medium"] = FFlagOnboardingSheetLayout,
					["col gap-large size-full-0 auto-y"] = not FFlagOnboardingSheetLayout
				}
			}, {
				Hero = ReactModule.createElement(PlusHeroContentModule, {
					layoutOrder = 1,
					pictogram = if FFlagOnboardingSheetLayout then nil else PictogramsGift,
					accentPictogram = if FFlagOnboardingSheetLayout then nil else PictogramsPlus,
					title = PurchaseUIOptions.title or UsePlaceholderLocalizationModuleResult.title,
					subtitle = PurchaseUIOptions.description or UsePlaceholderLocalizationModuleResult.description
				}),
				Benefits = ReactModule.createElement(View, {
					LayoutOrder = 2,
					tag = {
						["col align-x-left gap-xsmall size-full-0 auto-y"] = FFlagOnboardingSheetLayout,
						["col align-x-left gap-small size-full-0 auto-y"] = not FFlagOnboardingSheetLayout
					}
				}, Elements)
			})
		}),
		Actions = ReactModule.createElement(Sheet.Actions, nil, {
			ActionsContainer = if FFlagOnboardingSheetLayout then ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y",
				padding = Padding
			}, { ActionsContainer = Element }) else Element
		})
	}
end