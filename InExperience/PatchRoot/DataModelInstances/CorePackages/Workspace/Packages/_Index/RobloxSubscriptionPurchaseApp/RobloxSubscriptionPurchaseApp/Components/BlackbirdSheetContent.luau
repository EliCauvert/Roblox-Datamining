local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local Parent = RobloxSubscriptionPurchaseApp.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local HandleBackButtonActionModule = require(RobloxSubscriptionPurchaseApp.Actions.handleBackButtonAction)
local View = FoundationModule.View
local Sheet = FoundationModule.Sheet
local Text = FoundationModule.Text
local Button = FoundationModule.Button
local GetIconRichTextFunction = FoundationModule.Utility.getIconRichText
local Enums = FoundationModule.Enums
local IconName = Enums.IconName
local FillBehavior = Enums.FillBehavior
local ButtonVariant = Enums.ButtonVariant
local _ = require(RobloxSubscriptionPurchaseApp.types)
local RobloxSubscriptionPriceRowModule = require(script.Parent.RobloxSubscriptionPriceRow)
local RobloxSubscriptionFeatureListModule = require(script.Parent.RobloxSubscriptionFeatureList)
local LegalDisclosureModule = require(script.Parent.LegalDisclosure)
local RobloxSubscriptionStoreModule = require(RobloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local PerformRobloxSubscriptionPurchaseModule = require(RobloxSubscriptionPurchaseApp.Actions.performRobloxSubscriptionPurchase)
local FinalizeRobloxSubscriptionUpsellFlowModule = require(RobloxSubscriptionPurchaseApp.Actions.finalizeRobloxSubscriptionUpsellFlow)
local CompleteRobloxSubscriptionUpsellFlowModule = require(RobloxSubscriptionPurchaseApp.Actions.completeRobloxSubscriptionUpsellFlow)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LogRobloxSubscriptionUpsellCounterModule = require(RobloxSubscriptionPurchaseApp.Utils.logRobloxSubscriptionUpsellCounter)
local LogSubscriptionPurchaseFlowEventModule = require(RobloxSubscriptionPurchaseApp.Utils.logSubscriptionPurchaseFlowEvent)
local FFlagEnableSubscriptionPurchaseFlowEventIngestModule = require(RobloxSubscriptionPurchaseApp.Flags.FFlagEnableSubscriptionPurchaseFlowEventIngest)
local IsRobloxSubscriptionProductFreeTrialModule = require(RobloxSubscriptionPurchaseApp.Utils.isRobloxSubscriptionProductFreeTrial)
local GetFreeTrialOfferModule = require(RobloxSubscriptionPurchaseApp.Utils.getFreeTrialOffer)
local RobloxSubscriptionUpsellTelemetryModule = require(RobloxSubscriptionPurchaseApp.Events.RobloxSubscriptionUpsellTelemetry)
local PromptStateModule = require(RobloxSubscriptionPurchaseApp.Enums.PromptState)
local SignalsReactModule = require(Parent.SignalsReact)
local FFlagSupportFreeTrialModule = require(RobloxSubscriptionPurchaseApp.Flags.FFlagSupportFreeTrial)
local FFlagEnablePlusReferralLandingSheet = require(Parent.SharedFlags).FFlagEnablePlusReferralLandingSheet
local FIntPlusReferralRewardRobux = require(Parent.SharedFlags).FIntPlusReferralRewardRobux
local UseReferrerNameModule = require(RobloxSubscriptionPurchaseApp.Hooks.useReferrerName)
local PlusHeroContentModule = require(script.Parent.PlusHeroContent)
local FoundationCloudAssetsModule = require(Parent.FoundationCloudAssets)
local PictogramsPlusRobux = FoundationCloudAssetsModule.Assets["pictograms/plus_robux"]
FoundationCloudAssetsModule.preloadAsset("pictograms/plus_robux")
local FFlagRobloxPlusDynamicFreeTrialLengthModule = require(RobloxSubscriptionPurchaseApp.Flags.FFlagRobloxPlusDynamicFreeTrialLength)
local FFlagEnablePlusReferralLegalDisclosureModule = require(RobloxSubscriptionPurchaseApp.Flags.FFlagEnablePlusReferralLegalDisclosure)
local GuiService = game:GetService("GuiService")
local config = {
	[PromptStateModule.SubscriptionPurchaseInProgress] = true,
	[PromptStateModule.SubscriptionStatusPolling] = true
}

return function()
	-- upvalues: RobloxSubscriptionStoreModule (copy), SignalsReactModule (copy), FFlagEnablePlusReferralLandingSheet (copy), UseReferrerNameModule (copy), UseLocalizationFunction (copy), FIntPlusReferralRewardRobux (copy), IsRobloxSubscriptionProductFreeTrialModule (copy), FFlagRobloxPlusDynamicFreeTrialLengthModule (copy), GetFreeTrialOfferModule (copy), ReactModule (copy), FFlagEnableSubscriptionPurchaseFlowEventIngestModule (copy), LogSubscriptionPurchaseFlowEventModule (copy), LogRobloxSubscriptionUpsellCounterModule (copy), RobloxSubscriptionUpsellTelemetryModule (copy), PromptStateModule (copy), FinalizeRobloxSubscriptionUpsellFlowModule (copy), CompleteRobloxSubscriptionUpsellFlowModule (copy), PerformRobloxSubscriptionPurchaseModule (copy), config (copy), GuiService (copy), Sheet (copy), View (copy), Text (copy), GetIconRichTextFunction (copy), IconName (copy), HandleBackButtonActionModule (copy), PlusHeroContentModule (copy), PictogramsPlusRobux (copy), RobloxSubscriptionPriceRowModule (copy), RobloxSubscriptionFeatureListModule (copy), Button (copy), FillBehavior (copy), ButtonVariant (copy), LegalDisclosureModule (copy), FFlagSupportFreeTrialModule (copy), FFlagEnablePlusReferralLegalDisclosureModule (copy)
	local GetResult = RobloxSubscriptionStoreModule.get()
	local OnCtaOverride = GetResult.getOnCtaOverride()
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetResult.getPurchaseUIOptions)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(GetResult.getPromptState)
	local UseSignalStateResult2 = if FFlagEnablePlusReferralLandingSheet then SignalsReactModule.useSignalState(GetResult.getReferrerId) else nil
	local UseReferrerNameModuleResult = if FFlagEnablePlusReferralLandingSheet then UseReferrerNameModule(UseSignalStateResult2) else nil
	local UseLocalizationResult = UseLocalizationFunction({
		title = "Feature.RobloxSubscription.Title.GetBlackbird",
		buttonText = "Feature.RobloxSubscription.Action.Subscribe",
		getFreeTrialText = "Feature.RobloxSubscription.Action.TryItForFree",
		referralTitle = if FFlagEnablePlusReferralLandingSheet then "Feature.RobloxSubscription.Heading.ReferralRecipientJoin" else nil,
		referralInvite = if FFlagEnablePlusReferralLandingSheet then {
			"Feature.RobloxSubscription.Description.ReferralRecipientInvite",
			username = UseReferrerNameModuleResult or "",
			amount = tostring(FIntPlusReferralRewardRobux)
		} else nil
	})
	local UseSignalStateResult3 = SignalsReactModule.useSignalState(GetResult.getRobloxSubscriptionProduct)
	local IsRobloxSubscriptionProductFreeTrialModule1 = IsRobloxSubscriptionProductFreeTrialModule(UseSignalStateResult3)
	local FreeTrialOfferModule = if FFlagRobloxPlusDynamicFreeTrialLengthModule then GetFreeTrialOfferModule(UseSignalStateResult3) else nil
	local ReferralInvite = if FFlagEnablePlusReferralLandingSheet and UseReferrerNameModuleResult and UseReferrerNameModuleResult ~= "" then UseLocalizationResult.referralInvite else nil
	local Description = if UseSignalStateResult.description then UseSignalStateResult.description elseif FFlagEnablePlusReferralLandingSheet and ReferralInvite then ReferralInvite else nil
	local GetFreeTrialText = if IsRobloxSubscriptionProductFreeTrialModule1 then UseLocalizationResult.getFreeTrialText else UseLocalizationResult.buttonText
	local NoShowLegalDisclosure = UseSignalStateResult.showLegalDisclosure == nil or UseSignalStateResult.showLegalDisclosure
	local NoPurchaseMethodRequired = UseSignalStateResult.noPurchaseMethodRequired ~= nil and UseSignalStateResult.noPurchaseMethodRequired
	local HasReferralInvite: boolean = FFlagEnablePlusReferralLandingSheet and ReferralInvite ~= nil
	local IsNotViewportDisplaySizeMatch: boolean = if FFlagEnablePlusReferralLandingSheet then GuiService.ViewportDisplaySize ~= Enum.DisplaySize.Small else false
	
	return {
		Header = ReactModule.createElement(Sheet.Header, { hasCloseAffordance = true }, {
			View = if HasReferralInvite then nil else ReactModule.createElement(View, { LayoutOrder = 1, tag = "row gap-small auto-xy" }, {
				BackButton = if UseSignalStateResult.showBackButton then ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = "gap-small auto-xy text-heading-small text-align-x-center content-emphasis",
					RichText = true,
					Text = `{GetIconRichTextFunction(IconName.ChevronLargeLeft)}`,
					onActivated = HandleBackButtonActionModule
				}) else nil,
				Title = ReactModule.createElement(Text, {
					LayoutOrder = 2,
					tag = "auto-xy text-heading-small text-align-x-center content-emphasis",
					RichText = true,
					Text = `{GetIconRichTextFunction(IconName.RobloxPlus)} {UseSignalStateResult.title or UseLocalizationResult.title}`
				})
			})
		}),
		Content = ReactModule.createElement(Sheet.Content, { LayoutOrder = 2 }, {
			ContentContainer = ReactModule.createElement(View, {
				tag = if HasReferralInvite and not IsNotViewportDisplaySizeMatch then "col gap-xsmall size-full-0 auto-y padding-bottom-large" elseif HasReferralInvite and IsNotViewportDisplaySizeMatch then "col gap-xsmall size-full-0" elseif Description == nil then "col" else "col size-full-0 auto-y",
				Size = if HasReferralInvite and IsNotViewportDisplaySizeMatch then UDim2.new(1, 0, 0, 300) elseif HasReferralInvite or Description ~= nil then nil else UDim2.new(1, 0, 0, 140)
			}, {
				HeroContent = if HasReferralInvite then ReactModule.createElement(PlusHeroContentModule, {
					layoutOrder = 1,
					titleRichText = true,
					pictogram = PictogramsPlusRobux,
					title = `{UseLocalizationResult.referralTitle} {GetIconRichTextFunction(IconName.Robux)} {tostring(FIntPlusReferralRewardRobux)}`,
					subtitle = ReferralInvite
				}) else nil,
				PriceRow = if HasReferralInvite then ReactModule.createElement(RobloxSubscriptionPriceRowModule, {
					layoutOrder = if FFlagEnablePlusReferralLandingSheet then 4 else 1,
					isFreeTrial = IsRobloxSubscriptionProductFreeTrialModule1
				}) elseif Description == nil then ReactModule.createElement(RobloxSubscriptionPriceRowModule, {
					layoutOrder = if FFlagEnablePlusReferralLandingSheet then 4 else 1,
					isFreeTrial = IsRobloxSubscriptionProductFreeTrialModule1
				}) else ReactModule.createElement(Text, {
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
					LayoutOrder = if FFlagEnablePlusReferralLandingSheet then 4 else 1,
					Text = Description
				}),
				FeatureList = ReactModule.createElement(RobloxSubscriptionFeatureListModule, {
					layoutOrder = if FFlagEnablePlusReferralLandingSheet then 5 else 2,
					noPurchaseMethodRequired = NoPurchaseMethodRequired,
					compact = HasReferralInvite and IsNotViewportDisplaySizeMatch
				})
			})
		}),
		Actions = ReactModule.createElement(Sheet.Actions, { LayoutOrder = 3 }, {
			ActionsContainer = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = "row wrap align-x-center gap-medium size-full-0 auto-xy"
			}, {
				SubscribeButton = ReactModule.createElement(Button, {
					LayoutOrder = 1,
					ref = ReactModule.useCallback(function(p1)
						-- upvalues: FFlagEnableSubscriptionPurchaseFlowEventIngestModule (upval), LogSubscriptionPurchaseFlowEventModule (upval), LogRobloxSubscriptionUpsellCounterModule (upval), RobloxSubscriptionUpsellTelemetryModule (upval)
						if p1 then
							if FFlagEnableSubscriptionPurchaseFlowEventIngestModule then
								LogSubscriptionPurchaseFlowEventModule("SubscriptionUpsellModalShown")
							end
							LogRobloxSubscriptionUpsellCounterModule(RobloxSubscriptionUpsellTelemetryModule.RobloxSubscriptionUpsellModalShownCounter)
						end
					end, {}),
					text = if UseSignalStateResult.ctaText then UseSignalStateResult.ctaText else GetFreeTrialText,
					onActivated = function()
						-- upvalues: FFlagEnableSubscriptionPurchaseFlowEventIngestModule (upval), LogSubscriptionPurchaseFlowEventModule (upval), LogRobloxSubscriptionUpsellCounterModule (upval), RobloxSubscriptionUpsellTelemetryModule (upval), OnCtaOverride (copy), GetResult (copy), PromptStateModule (upval), FinalizeRobloxSubscriptionUpsellFlowModule (upval), CompleteRobloxSubscriptionUpsellFlowModule (upval), PerformRobloxSubscriptionPurchaseModule (upval)
						if FFlagEnableSubscriptionPurchaseFlowEventIngestModule then
							LogSubscriptionPurchaseFlowEventModule("SubscriptionUpsellSubscribeClicked")
						end
						LogRobloxSubscriptionUpsellCounterModule(RobloxSubscriptionUpsellTelemetryModule.RobloxSubscriptionUpsellModalBuyButtonClickedCounter)
						
						if OnCtaOverride then
							GetResult.setPromptState(PromptStateModule.SubscriptionPurchaseRequested)
							OnCtaOverride(function()
								-- upvalues: GetResult (upval), FinalizeRobloxSubscriptionUpsellFlowModule (upval)
								GetResult.setDidTryPurchasing(true)
								FinalizeRobloxSubscriptionUpsellFlowModule(true)
							end, function()
								-- upvalues: CompleteRobloxSubscriptionUpsellFlowModule (upval)
								CompleteRobloxSubscriptionUpsellFlowModule()
							end)
							
							return
						else
							PerformRobloxSubscriptionPurchaseModule()
						end
					end,
					fillBehavior = FillBehavior.Fill,
					variant = ButtonVariant.Emphasis,
					isLoading = config[UseSignalStateResult1] == true
				}),
				LegalDisclosure = if NoShowLegalDisclosure then ReactModule.createElement(LegalDisclosureModule, {
					layoutOrder = 2,
					ctaText = if UseSignalStateResult.ctaText then UseSignalStateResult.ctaText else GetFreeTrialText,
					isFreeTrial = if FFlagSupportFreeTrialModule then IsRobloxSubscriptionProductFreeTrialModule1 else nil,
					isReferral = if FFlagEnablePlusReferralLegalDisclosureModule then HasReferralInvite else nil,
					shortenFreeTrialTerms = NoPurchaseMethodRequired,
					trialDuration = if FreeTrialOfferModule then FreeTrialOfferModule.Duration else nil,
					trialPeriodType = if FreeTrialOfferModule then FreeTrialOfferModule.PeriodType else nil,
					billingPeriodType = if FreeTrialOfferModule and UseSignalStateResult3 then UseSignalStateResult3.PeriodType else nil
				}) else nil
			})
		})
	}
end