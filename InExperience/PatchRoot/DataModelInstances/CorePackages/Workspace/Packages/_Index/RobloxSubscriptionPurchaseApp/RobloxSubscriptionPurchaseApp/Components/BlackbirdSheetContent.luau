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
local fFlagEnablePlusReferralLandingSheet = require(parent.SharedFlags).FFlagEnablePlusReferralLandingSheet
local fIntPlusReferralRewardRobux = require(parent.SharedFlags).FIntPlusReferralRewardRobux
local useReferrerNameModule = require(robloxSubscriptionPurchaseApp.Hooks.useReferrerName)
local plusHeroContentModule = require(script.Parent.PlusHeroContent)
local foundationCloudAssetsModule = require(parent.FoundationCloudAssets)
local plusRobux = foundationCloudAssetsModule.Assets["pictograms/plus_robux"]
foundationCloudAssetsModule.preloadAsset("pictograms/plus_robux")
local fFlagRobloxPlusDynamicFreeTrialLengthModule = require(robloxSubscriptionPurchaseApp.Flags.FFlagRobloxPlusDynamicFreeTrialLength)
local fFlagEnablePlusReferralLegalDisclosureModule = require(robloxSubscriptionPurchaseApp.Flags.FFlagEnablePlusReferralLegalDisclosure)
local guiService = game:GetService("GuiService")
local t = {
	[promptStateModule.SubscriptionPurchaseInProgress] = true,
	[promptStateModule.SubscriptionStatusPolling] = true
}

return function()
	-- upvalues: robloxSubscriptionStoreModule (ref), signalsReactModule (ref), fFlagEnablePlusReferralLandingSheet (ref), useReferrerNameModule (ref), useLocalization (ref), fIntPlusReferralRewardRobux (ref), isRobloxSubscriptionProductFreeTrialModule (ref), fFlagRobloxPlusDynamicFreeTrialLengthModule (ref), getFreeTrialOfferModule (ref), reactModule (ref), fFlagEnableSubscriptionPurchaseFlowEventIngestModule (ref), logSubscriptionPurchaseFlowEventModule (ref), logRobloxSubscriptionUpsellCounterModule (ref), robloxSubscriptionUpsellTelemetryModule (ref), promptStateModule (ref), finalizeRobloxSubscriptionUpsellFlowModule (ref), completeRobloxSubscriptionUpsellFlowModule (ref), performRobloxSubscriptionPurchaseModule (ref), t (ref), guiService (ref), sheet (ref), view (ref), text (ref), getIconRichText (ref), iconName (ref), handleBackButtonActionModule (ref), plusHeroContentModule (ref), plusRobux (ref), robloxSubscriptionPriceRowModule (ref), robloxSubscriptionFeatureListModule (ref), button (ref), fillBehavior (ref), buttonVariant (ref), legalDisclosureModule (ref), fFlagSupportFreeTrialModule (ref), fFlagEnablePlusReferralLegalDisclosureModule (ref)
	local var1
	local var2 = robloxSubscriptionStoreModule.get()
	local onCtaOverride = var2.getOnCtaOverride()
	local var3 = signalsReactModule.useSignalState(var2.getPurchaseUIOptions)
	local var4 = signalsReactModule.useSignalState(var2.getPromptState)
	local var5 = if fFlagEnablePlusReferralLandingSheet then useReferrerNameModule(if fFlagEnablePlusReferralLandingSheet then signalsReactModule.useSignalState(var2.getReferrerId) else nil) else nil
	local var6 = useLocalization({
		title = "Feature.RobloxSubscription.Title.GetBlackbird",
		buttonText = "Feature.RobloxSubscription.Action.Subscribe",
		getFreeTrialText = "Feature.RobloxSubscription.Action.TryItForFree",
		referralTitle = if fFlagEnablePlusReferralLandingSheet then "Feature.RobloxSubscription.Heading.ReferralRecipientJoin" else nil,
		referralInvite = if fFlagEnablePlusReferralLandingSheet then {
			"Feature.RobloxSubscription.Description.ReferralRecipientInvite",
			username = var5 or "",
			amount = tostring(fIntPlusReferralRewardRobux)
		} else nil
	})
	local var7 = signalsReactModule.useSignalState(var2.getRobloxSubscriptionProduct)
	local var8 = isRobloxSubscriptionProductFreeTrialModule(var7)
	local var9 = if fFlagRobloxPlusDynamicFreeTrialLengthModule then getFreeTrialOfferModule(var7) else nil
	local var10 = if fFlagEnablePlusReferralLandingSheet and var5 and var5 ~= "" then var6.referralInvite else nil
	local var11 = if var3.description then var3.description elseif fFlagEnablePlusReferralLandingSheet and var10 then var10 else nil
	local var12 = if var8 then var6.getFreeTrialText else var6.buttonText
	local var13 = var3.showLegalDisclosure ~= nil or var3.showLegalDisclosure
	local var14 = if var3.noPurchaseMethodRequired ~= nil then false else var3.noPurchaseMethodRequired
	local var15 = reactModule.useCallback(function(p1)
		-- upvalues: fFlagEnableSubscriptionPurchaseFlowEventIngestModule (copy), logSubscriptionPurchaseFlowEventModule (copy), logRobloxSubscriptionUpsellCounterModule (copy), robloxSubscriptionUpsellTelemetryModule (copy)
		if p1 then
			if fFlagEnableSubscriptionPurchaseFlowEventIngestModule then
				logSubscriptionPurchaseFlowEventModule("SubscriptionUpsellModalShown")
			end
			logRobloxSubscriptionUpsellCounterModule(robloxSubscriptionUpsellTelemetryModule.RobloxSubscriptionUpsellModalShownCounter)
		end
	end, {})
	
	local function onSubscribe()
		-- upvalues: fFlagEnableSubscriptionPurchaseFlowEventIngestModule (copy), logSubscriptionPurchaseFlowEventModule (copy), logRobloxSubscriptionUpsellCounterModule (copy), robloxSubscriptionUpsellTelemetryModule (copy), onCtaOverride (ref), var2 (ref), promptStateModule (copy), finalizeRobloxSubscriptionUpsellFlowModule (copy), completeRobloxSubscriptionUpsellFlowModule (copy), performRobloxSubscriptionPurchaseModule (copy)
		if fFlagEnableSubscriptionPurchaseFlowEventIngestModule then
			logSubscriptionPurchaseFlowEventModule("SubscriptionUpsellSubscribeClicked")
		end
		logRobloxSubscriptionUpsellCounterModule(robloxSubscriptionUpsellTelemetryModule.RobloxSubscriptionUpsellModalBuyButtonClickedCounter)
		
		if onCtaOverride then
			var2.setPromptState(promptStateModule.SubscriptionPurchaseRequested)
			onCtaOverride(function()
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
	
	local var16 = t[var4] == true
	local var17 = fFlagEnablePlusReferralLandingSheet and var10 ~= nil
	
	if fFlagEnablePlusReferralLandingSheet then
		var1 = guiService.ViewportDisplaySize ~= Enum.DisplaySize.Small
		var1 = nil
	else
		var1 = false
	end
	local var18
	local t_1 = {
		Header = reactModule.createElement(sheet.Header, { hasCloseAffordance = true }, {
			View = if not var17 then reactModule.createElement(view, { LayoutOrder = 1, tag = "row gap-small auto-xy" }, {
				BackButton = if var3.showBackButton then reactModule.createElement(text, {
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
					Text = `{getIconRichText(iconName.RobloxPlus)} {var3.title or var6.title}`
				})
			}) else nil
		}),
		Content = reactModule.createElement(sheet.Content, { LayoutOrder = 2 }, {
			ContentContainer = reactModule.createElement(view, {
				tag = if var17 and not var1 then "col gap-xsmall size-full-0 auto-y padding-bottom-large" elseif var17 and var1 then "col gap-xsmall size-full-0" elseif var11 ~= nil then "col" else "col size-full-0 auto-y",
				Size = if var17 and var1 then UDim2.new(1, 0, 0, 300) elseif var17 or var11 ~= nil then nil else UDim2.new(1, 0, 0, 140)
			}, {
				HeroContent = if var17 then reactModule.createElement(plusHeroContentModule, {
					layoutOrder = 1,
					titleRichText = true,
					pictogram = plusRobux,
					title = `{var6.referralTitle} {getIconRichText(iconName.Robux)} {tostring(fIntPlusReferralRewardRobux)}`,
					subtitle = var10
				}) else nil,
				PriceRow = if var17 then reactModule.createElement(robloxSubscriptionPriceRowModule, {
					layoutOrder = if fFlagEnablePlusReferralLandingSheet then 4 else 1,
					isFreeTrial = var8
				}) elseif var11 ~= nil then reactModule.createElement(robloxSubscriptionPriceRowModule, {
					layoutOrder = if fFlagEnablePlusReferralLandingSheet then 4 else 1,
					isFreeTrial = var8
				}) else reactModule.createElement(text, {
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
					LayoutOrder = if fFlagEnablePlusReferralLandingSheet then 4 else 1,
					Text = var11
				}),
				FeatureList = reactModule.createElement(robloxSubscriptionFeatureListModule, {
					layoutOrder = if fFlagEnablePlusReferralLandingSheet then 5 else 2,
					noPurchaseMethodRequired = var14,
					compact = var17 and var1
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
			ref = var15,
			text = if var3.ctaText then var3.ctaText else var12,
			onActivated = onSubscribe,
			fillBehavior = fillBehavior.Fill,
			variant = buttonVariant.Emphasis,
			isLoading = var16
		})
	}
	
	if var13 then
		var18 = reactModule.createElement
		var18 = var18(legalDisclosureModule, {
			layoutOrder = 2,
			ctaText = if var3.ctaText then var3.ctaText else var12,
			isFreeTrial = if fFlagSupportFreeTrialModule then var8 else nil,
			isReferral = if fFlagEnablePlusReferralLegalDisclosureModule then var17 else nil,
			shortenFreeTrialTerms = var14,
			trialDuration = if var9 then var9.Duration else nil,
			trialPeriodType = if var9 then var9.PeriodType else nil,
			billingPeriodType = if var9 and var7 then var7.PeriodType else nil
		})
	else
		var18 = nil
	end
	t_5.LegalDisclosure = var18
	t_3.ActionsContainer = createElement_1(view, t_4, t_5)
	t_1.Actions = createElement(actions, t_2, t_3)
	
	return t_1
end