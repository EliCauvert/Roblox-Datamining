local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local parent = robloxSubscriptionPurchaseApp.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local handleBackButtonActionModule = require(robloxSubscriptionPurchaseApp.Actions.handleBackButtonAction)
local view = foundationModule.View
local sheet = foundationModule.Sheet
local text = foundationModule.Text
local button = foundationModule.Button
local getIconRichText = foundationModule.Utility.getIconRichText
local enums = foundationModule.Enums
local iconName = enums.IconName
local fillBehavior = enums.FillBehavior
local buttonVariant = enums.ButtonVariant
local _ = require(robloxSubscriptionPurchaseApp.types)
local robloxSubscriptionPriceRowModule = require(script.Parent.RobloxSubscriptionPriceRow)
local robloxSubscriptionFeatureListModule = require(script.Parent.RobloxSubscriptionFeatureList)
local legalDisclosureModule = require(script.Parent.LegalDisclosure)
local robloxSubscriptionStoreModule = require(robloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local performRobloxSubscriptionPurchaseModule = require(robloxSubscriptionPurchaseApp.Actions.performRobloxSubscriptionPurchase)
local finalizeRobloxSubscriptionUpsellFlowModule = require(robloxSubscriptionPurchaseApp.Actions.finalizeRobloxSubscriptionUpsellFlow)
local completeRobloxSubscriptionUpsellFlowModule = require(robloxSubscriptionPurchaseApp.Actions.completeRobloxSubscriptionUpsellFlow)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local logRobloxSubscriptionUpsellCounterModule = require(robloxSubscriptionPurchaseApp.Utils.logRobloxSubscriptionUpsellCounter)
local logSubscriptionPurchaseFlowEventModule = require(robloxSubscriptionPurchaseApp.Utils.logSubscriptionPurchaseFlowEvent)
local fFlagEnableSubscriptionPurchaseFlowEventIngestModule = require(robloxSubscriptionPurchaseApp.Flags.FFlagEnableSubscriptionPurchaseFlowEventIngest)
local isRobloxSubscriptionProductFreeTrialModule = require(robloxSubscriptionPurchaseApp.Utils.isRobloxSubscriptionProductFreeTrial)
local getFreeTrialOfferModule = require(robloxSubscriptionPurchaseApp.Utils.getFreeTrialOffer)
local robloxSubscriptionUpsellTelemetryModule = require(robloxSubscriptionPurchaseApp.Events.RobloxSubscriptionUpsellTelemetry)
local promptStateModule = require(robloxSubscriptionPurchaseApp.Enums.PromptState)
local signalsReactModule = require(parent.SignalsReact)
local fFlagSupportFreeTrialModule = require(robloxSubscriptionPurchaseApp.Flags.FFlagSupportFreeTrial)
local fFlagRobloxPlusFAEFreeTrialModule = require(robloxSubscriptionPurchaseApp.Flags.FFlagRobloxPlusFAEFreeTrial)
local fFlagEnablePlusReferralLandingSheet = require(parent.SharedFlags).FFlagEnablePlusReferralLandingSheet
local fIntPlusReferralRewardRobux = require(parent.SharedFlags).FIntPlusReferralRewardRobux
local useReferrerNameModule = require(robloxSubscriptionPurchaseApp.Hooks.useReferrerName)
local plusHeroContentModule = require(script.Parent.PlusHeroContent)
local foundationCloudAssetsModule = require(parent.FoundationCloudAssets)
local plusRobux = foundationCloudAssetsModule.Assets["pictograms/plus_robux"]
foundationCloudAssetsModule.preloadAsset("pictograms/plus_robux")
local fFlagRobloxPlusDynamicFreeTrialLengthModule = require(robloxSubscriptionPurchaseApp.Flags.FFlagRobloxPlusDynamicFreeTrialLength)
local guiService = game:GetService("GuiService")
local t = {
	[promptStateModule.SubscriptionPurchaseInProgress] = true,
	[promptStateModule.SubscriptionStatusPolling] = true
}

return function()
	-- upvalues: robloxSubscriptionStoreModule (ref), fFlagRobloxPlusFAEFreeTrialModule (ref), signalsReactModule (ref), fFlagEnablePlusReferralLandingSheet (ref), useReferrerNameModule (ref), useLocalization (ref), fIntPlusReferralRewardRobux (ref), isRobloxSubscriptionProductFreeTrialModule (ref), fFlagRobloxPlusDynamicFreeTrialLengthModule (ref), getFreeTrialOfferModule (ref), reactModule (ref), fFlagEnableSubscriptionPurchaseFlowEventIngestModule (ref), logSubscriptionPurchaseFlowEventModule (ref), logRobloxSubscriptionUpsellCounterModule (ref), robloxSubscriptionUpsellTelemetryModule (ref), promptStateModule (ref), finalizeRobloxSubscriptionUpsellFlowModule (ref), completeRobloxSubscriptionUpsellFlowModule (ref), performRobloxSubscriptionPurchaseModule (ref), t (ref), guiService (ref), sheet (ref), view (ref), text (ref), getIconRichText (ref), iconName (ref), handleBackButtonActionModule (ref), plusHeroContentModule (ref), plusRobux (ref), robloxSubscriptionPriceRowModule (ref), robloxSubscriptionFeatureListModule (ref), button (ref), fillBehavior (ref), buttonVariant (ref), legalDisclosureModule (ref), fFlagSupportFreeTrialModule (ref)
	local var1
	local var2 = robloxSubscriptionStoreModule.get()
	local var3 = if fFlagRobloxPlusFAEFreeTrialModule then var2.getOnCtaOverride() else nil
	local var4 = signalsReactModule.useSignalState(var2.getPurchaseUIOptions)
	local var5 = signalsReactModule.useSignalState(var2.getPromptState)
	local var6 = if fFlagEnablePlusReferralLandingSheet then useReferrerNameModule(if fFlagEnablePlusReferralLandingSheet then signalsReactModule.useSignalState(var2.getReferrerId) else nil) else nil
	local var7 = useLocalization({
		title = "Feature.RobloxSubscription.Title.GetBlackbird",
		buttonText = "Feature.RobloxSubscription.Action.Subscribe",
		getFreeTrialText = "Feature.RobloxSubscription.Action.TryItForFree",
		referralTitle = if fFlagEnablePlusReferralLandingSheet then "Feature.RobloxSubscription.Heading.ReferralRecipientJoin" else nil,
		referralInvite = if fFlagEnablePlusReferralLandingSheet then {
			"Feature.RobloxSubscription.Description.ReferralRecipientInvite",
			username = var6 or "",
			amount = tostring(fIntPlusReferralRewardRobux)
		} else nil
	})
	local var8 = signalsReactModule.useSignalState(var2.getRobloxSubscriptionProduct)
	local var9 = isRobloxSubscriptionProductFreeTrialModule(var8)
	local var10 = if fFlagRobloxPlusDynamicFreeTrialLengthModule then getFreeTrialOfferModule(var8) else nil
	local var11 = if fFlagEnablePlusReferralLandingSheet and var6 and var6 ~= "" then var7.referralInvite else nil
	local var12 = if fFlagRobloxPlusFAEFreeTrialModule and var4.description then var4.description elseif fFlagEnablePlusReferralLandingSheet and var11 then var11 else nil
	local var13 = if var9 then var7.getFreeTrialText else var7.buttonText
	local var14 = var4.showLegalDisclosure ~= nil or var4.showLegalDisclosure
	local var15 = if fFlagRobloxPlusFAEFreeTrialModule and var4.noPurchaseMethodRequired ~= nil then var4.noPurchaseMethodRequired else false
	local var16 = reactModule.useCallback(function(p1)
		-- upvalues: fFlagEnableSubscriptionPurchaseFlowEventIngestModule (copy), logSubscriptionPurchaseFlowEventModule (copy), logRobloxSubscriptionUpsellCounterModule (copy), robloxSubscriptionUpsellTelemetryModule (copy)
		if p1 then
			if fFlagEnableSubscriptionPurchaseFlowEventIngestModule then
				logSubscriptionPurchaseFlowEventModule("SubscriptionUpsellModalShown")
			end
			logRobloxSubscriptionUpsellCounterModule(robloxSubscriptionUpsellTelemetryModule.RobloxSubscriptionUpsellModalShownCounter)
		end
	end, {})
	
	local function onSubscribe()
		-- upvalues: fFlagEnableSubscriptionPurchaseFlowEventIngestModule (copy), logSubscriptionPurchaseFlowEventModule (copy), logRobloxSubscriptionUpsellCounterModule (copy), robloxSubscriptionUpsellTelemetryModule (copy), fFlagRobloxPlusFAEFreeTrialModule (copy), var3 (ref), var2 (ref), promptStateModule (copy), finalizeRobloxSubscriptionUpsellFlowModule (copy), completeRobloxSubscriptionUpsellFlowModule (copy), performRobloxSubscriptionPurchaseModule (copy)
		if fFlagEnableSubscriptionPurchaseFlowEventIngestModule then
			logSubscriptionPurchaseFlowEventModule("SubscriptionUpsellSubscribeClicked")
		end
		logRobloxSubscriptionUpsellCounterModule(robloxSubscriptionUpsellTelemetryModule.RobloxSubscriptionUpsellModalBuyButtonClickedCounter)
		
		if fFlagRobloxPlusFAEFreeTrialModule and var3 then
			var2.setPromptState(promptStateModule.SubscriptionPurchaseRequested)
			var3(function()
				-- upvalues: var2 (copy), finalizeRobloxSubscriptionUpsellFlowModule (copy)
				var2.setDidTryPurchasing(true)
				finalizeRobloxSubscriptionUpsellFlowModule(true)
			end, function()
				-- upvalues: completeRobloxSubscriptionUpsellFlowModule (copy)
				completeRobloxSubscriptionUpsellFlowModule()
			end)
			
			return
		end
		performRobloxSubscriptionPurchaseModule()
	end
	
	local var17 = t[var5] == true
	local var18 = fFlagEnablePlusReferralLandingSheet and var11 ~= nil
	
	if fFlagEnablePlusReferralLandingSheet then
		var1 = guiService.ViewportDisplaySize ~= Enum.DisplaySize.Small
		var1 = nil
	else
		var1 = false
	end
	local createElement_2
	local t_1 = {
		Header = reactModule.createElement(sheet.Header, { hasCloseAffordance = true }, {
			View = if not var18 then reactModule.createElement(view, { LayoutOrder = 1, tag = "row gap-small auto-xy" }, {
				BackButton = if var4.showBackButton then reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "gap-small auto-xy text-heading-small text-align-x-center content-emphasis",
					RichText = true,
					Text = `{getIconRichText(iconName.ChevronLargeLeft)}`,
					onActivated = handleBackButtonActionModule
				}) else nil,
				Title = reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "auto-xy text-heading-small text-align-x-center content-emphasis",
					RichText = true,
					Text = `{getIconRichText(iconName.RobloxPlus)} {var4.title or var7.title}`
				})
			}) else nil
		}),
		Content = reactModule.createElement(sheet.Content, { LayoutOrder = 2 }, {
			ContentContainer = reactModule.createElement(view, {
				tag = if var18 and not var1 then "col gap-xsmall size-full-0 auto-y padding-bottom-large" elseif var18 and var1 then "col gap-xsmall size-full-0" elseif fFlagRobloxPlusFAEFreeTrialModule and var12 ~= nil then "col size-full-0 auto-y" else "col",
				Size = if var18 and var1 then UDim2.new(1, 0, 0, 300) elseif var18 or fFlagRobloxPlusFAEFreeTrialModule and var12 ~= nil then nil else UDim2.new(1, 0, 0, 140)
			}, {
				HeroContent = if var18 then reactModule.createElement(plusHeroContentModule, {
					layoutOrder = 1,
					titleRichText = true,
					pictogram = plusRobux,
					title = `{var7.referralTitle} {getIconRichText(iconName.Robux)} {tostring(fIntPlusReferralRewardRobux)}`,
					subtitle = var11
				}) else nil,
				PriceRow = if var18 then reactModule.createElement(robloxSubscriptionPriceRowModule, {
					layoutOrder = if fFlagEnablePlusReferralLandingSheet then 4 else 1,
					isFreeTrial = var9
				}) elseif fFlagRobloxPlusFAEFreeTrialModule and var12 ~= nil then reactModule.createElement(text, {
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
					LayoutOrder = if fFlagEnablePlusReferralLandingSheet then 4 else 1,
					Text = var12
				}) else reactModule.createElement(robloxSubscriptionPriceRowModule, {
					layoutOrder = if fFlagEnablePlusReferralLandingSheet then 4 else 1,
					isFreeTrial = var9
				}),
				FeatureList = reactModule.createElement(robloxSubscriptionFeatureListModule, {
					layoutOrder = if fFlagEnablePlusReferralLandingSheet then 5 else 2,
					noPurchaseMethodRequired = var15,
					compact = var18 and var1
				})
			})
		})
	}
	local createElement = reactModule.createElement
	local actions = sheet.Actions
	local t_2 = { LayoutOrder = 3 }
	local t_3 = {}
	local createElement_1 = reactModule.createElement
	local t_4 = {
		LayoutOrder = 1,
		tag = "row wrap align-x-center gap-medium size-full-0 auto-xy"
	}
	local t_5 = {
		SubscribeButton = reactModule.createElement(button, {
			LayoutOrder = 1,
			ref = var16,
			text = if fFlagRobloxPlusFAEFreeTrialModule and var4.ctaText then var4.ctaText else var13,
			onActivated = onSubscribe,
			fillBehavior = fillBehavior.Fill,
			variant = buttonVariant.Emphasis,
			isLoading = var17
		})
	}
	
	if fFlagRobloxPlusFAEFreeTrialModule and not var14 then
		createElement_2 = nil
	else
		createElement_2 = reactModule.createElement
		createElement_2 = createElement_2(legalDisclosureModule, {
			layoutOrder = 2,
			ctaText = if fFlagRobloxPlusFAEFreeTrialModule and var4.ctaText then var4.ctaText else var13,
			isFreeTrial = if fFlagSupportFreeTrialModule then var9 else nil,
			shortenFreeTrialTerms = if fFlagRobloxPlusFAEFreeTrialModule then var15 else nil,
			trialDuration = if var10 then var10.Duration else nil,
			trialPeriodType = if var10 then var10.PeriodType else nil,
			billingPeriodType = if var10 and var8 then var8.PeriodType else nil
		})
	end
	t_5.LegalDisclosure = createElement_2
	t_3.ActionsContainer = createElement_1(view, t_4, t_5)
	t_1.Actions = createElement(actions, t_2, t_3)
	
	return t_1
end