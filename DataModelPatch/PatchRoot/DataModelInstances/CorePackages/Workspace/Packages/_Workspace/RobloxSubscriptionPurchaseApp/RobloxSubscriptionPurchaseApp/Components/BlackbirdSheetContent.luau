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
local RobloxSubscriptionUpsellTelemetryModule = require(RobloxSubscriptionPurchaseApp.Events.RobloxSubscriptionUpsellTelemetry)
local PromptStateModule = require(RobloxSubscriptionPurchaseApp.Enums.PromptState)
local SignalsReactModule = require(Parent.SignalsReact)
local FFlagSupportFreeTrialModule = require(RobloxSubscriptionPurchaseApp.Flags.FFlagSupportFreeTrial)
local FFlagSupportFreeTrialPriceRowModule = require(RobloxSubscriptionPurchaseApp.Flags.FFlagSupportFreeTrialPriceRow)
local FFlagRobloxPlusFAEFreeTrialModule = require(RobloxSubscriptionPurchaseApp.Flags.FFlagRobloxPlusFAEFreeTrial)
local config = {
	[PromptStateModule.SubscriptionPurchaseInProgress] = true,
	[PromptStateModule.SubscriptionStatusPolling] = true
}

return function()
	-- upvalues: RobloxSubscriptionStoreModule (copy), FFlagRobloxPlusFAEFreeTrialModule (copy), SignalsReactModule (copy), UseLocalizationFunction (copy), IsRobloxSubscriptionProductFreeTrialModule (copy), ReactModule (copy), FFlagEnableSubscriptionPurchaseFlowEventIngestModule (copy), LogSubscriptionPurchaseFlowEventModule (copy), LogRobloxSubscriptionUpsellCounterModule (copy), RobloxSubscriptionUpsellTelemetryModule (copy), PromptStateModule (copy), FinalizeRobloxSubscriptionUpsellFlowModule (copy), CompleteRobloxSubscriptionUpsellFlowModule (copy), PerformRobloxSubscriptionPurchaseModule (copy), config (copy), Sheet (copy), View (copy), Text (copy), GetIconRichTextFunction (copy), IconName (copy), HandleBackButtonActionModule (copy), RobloxSubscriptionPriceRowModule (copy), FFlagSupportFreeTrialPriceRowModule (copy), RobloxSubscriptionFeatureListModule (copy), Button (copy), FillBehavior (copy), ButtonVariant (copy), LegalDisclosureModule (copy), FFlagSupportFreeTrialModule (copy)
	local GetResult = RobloxSubscriptionStoreModule.get()
	local OnCtaOverride = if FFlagRobloxPlusFAEFreeTrialModule then GetResult.getOnCtaOverride() else nil
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetResult.getPurchaseUIOptions)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(GetResult.getPromptState)
	local UseLocalizationResult = UseLocalizationFunction({
		title = "Feature.RobloxSubscription.Title.GetBlackbird",
		buttonText = "Feature.RobloxSubscription.Action.Subscribe",
		getFreeTrialText = "Feature.RobloxSubscription.Action.TryItForFree"
	})
	local IsRobloxSubscriptionProductFreeTrialModule1 = IsRobloxSubscriptionProductFreeTrialModule((SignalsReactModule.useSignalState(GetResult.getRobloxSubscriptionProduct)))
	local Description = if FFlagRobloxPlusFAEFreeTrialModule then UseSignalStateResult.description else nil
	local GetFreeTrialText = if IsRobloxSubscriptionProductFreeTrialModule1 then UseLocalizationResult.getFreeTrialText else UseLocalizationResult.buttonText
	local NoShowLegalDisclosure = UseSignalStateResult.showLegalDisclosure == nil or UseSignalStateResult.showLegalDisclosure
	local NoPurchaseMethodRequired = if FFlagRobloxPlusFAEFreeTrialModule and UseSignalStateResult.noPurchaseMethodRequired ~= nil then UseSignalStateResult.noPurchaseMethodRequired else false
	
	return {
		Header = ReactModule.createElement(Sheet.Header, { hasCloseAffordance = true }, {
			View = ReactModule.createElement(View, { LayoutOrder = 1, tag = "row gap-small auto-xy" }, {
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
				tag = {
					["col size-full-0 auto-y"] = FFlagRobloxPlusFAEFreeTrialModule and Description ~= nil,
					col = not (FFlagRobloxPlusFAEFreeTrialModule and Description ~= nil)
				},
				Size = if FFlagRobloxPlusFAEFreeTrialModule and Description ~= nil then nil else UDim2.new(1, 0, 0, 140)
			}, {
				PriceRow = if FFlagRobloxPlusFAEFreeTrialModule and Description ~= nil then ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
					Text = Description
				}) else ReactModule.createElement(RobloxSubscriptionPriceRowModule, {
					layoutOrder = 1,
					isFreeTrial = if FFlagSupportFreeTrialPriceRowModule then IsRobloxSubscriptionProductFreeTrialModule1 else nil
				}),
				FeatureList = ReactModule.createElement(RobloxSubscriptionFeatureListModule, {
					layoutOrder = 2,
					noPurchaseMethodRequired = NoPurchaseMethodRequired
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
					text = if FFlagRobloxPlusFAEFreeTrialModule and UseSignalStateResult.ctaText then UseSignalStateResult.ctaText else GetFreeTrialText,
					onActivated = function()
						-- upvalues: FFlagEnableSubscriptionPurchaseFlowEventIngestModule (upval), LogSubscriptionPurchaseFlowEventModule (upval), LogRobloxSubscriptionUpsellCounterModule (upval), RobloxSubscriptionUpsellTelemetryModule (upval), FFlagRobloxPlusFAEFreeTrialModule (upval), OnCtaOverride (copy), GetResult (copy), PromptStateModule (upval), FinalizeRobloxSubscriptionUpsellFlowModule (upval), CompleteRobloxSubscriptionUpsellFlowModule (upval), PerformRobloxSubscriptionPurchaseModule (upval)
						if FFlagEnableSubscriptionPurchaseFlowEventIngestModule then
							LogSubscriptionPurchaseFlowEventModule("SubscriptionUpsellSubscribeClicked")
						end
						LogRobloxSubscriptionUpsellCounterModule(RobloxSubscriptionUpsellTelemetryModule.RobloxSubscriptionUpsellModalBuyButtonClickedCounter)
						
						if FFlagRobloxPlusFAEFreeTrialModule and OnCtaOverride then
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
				LegalDisclosure = if FFlagRobloxPlusFAEFreeTrialModule and not NoShowLegalDisclosure then nil else ReactModule.createElement(LegalDisclosureModule, {
					layoutOrder = 2,
					ctaText = if FFlagRobloxPlusFAEFreeTrialModule and UseSignalStateResult.ctaText then UseSignalStateResult.ctaText else GetFreeTrialText,
					isFreeTrial = if FFlagSupportFreeTrialModule then IsRobloxSubscriptionProductFreeTrialModule1 else nil,
					shortenFreeTrialTerms = if FFlagRobloxPlusFAEFreeTrialModule then NoPurchaseMethodRequired else nil
				})
			})
		})
	}
end