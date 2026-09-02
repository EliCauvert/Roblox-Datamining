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
local robloxSubscriptionUpsellTelemetryModule = require(robloxSubscriptionPurchaseApp.Events.RobloxSubscriptionUpsellTelemetry)
local promptStateModule = require(robloxSubscriptionPurchaseApp.Enums.PromptState)
local signalsReactModule = require(parent.SignalsReact)
local fFlagSupportFreeTrialModule = require(robloxSubscriptionPurchaseApp.Flags.FFlagSupportFreeTrial)
local fFlagRobloxPlusFAEFreeTrialModule = require(robloxSubscriptionPurchaseApp.Flags.FFlagRobloxPlusFAEFreeTrial)
local t = {
	[promptStateModule.SubscriptionPurchaseInProgress] = true,
	[promptStateModule.SubscriptionStatusPolling] = true
}

return function()
	-- upvalues: robloxSubscriptionStoreModule (ref), fFlagRobloxPlusFAEFreeTrialModule (ref), signalsReactModule (ref), useLocalization (ref), isRobloxSubscriptionProductFreeTrialModule (ref), reactModule (ref), fFlagEnableSubscriptionPurchaseFlowEventIngestModule (ref), logSubscriptionPurchaseFlowEventModule (ref), logRobloxSubscriptionUpsellCounterModule (ref), robloxSubscriptionUpsellTelemetryModule (ref), promptStateModule (ref), finalizeRobloxSubscriptionUpsellFlowModule (ref), completeRobloxSubscriptionUpsellFlowModule (ref), performRobloxSubscriptionPurchaseModule (ref), t (ref), sheet (ref), view (ref), text (ref), getIconRichText (ref), iconName (ref), handleBackButtonActionModule (ref), robloxSubscriptionPriceRowModule (ref), robloxSubscriptionFeatureListModule (ref), button (ref), fillBehavior (ref), buttonVariant (ref), legalDisclosureModule (ref), fFlagSupportFreeTrialModule (ref)
	local createElement_2
	local var1 = robloxSubscriptionStoreModule.get()
	local var2 = if fFlagRobloxPlusFAEFreeTrialModule then var1.getOnCtaOverride() else nil
	local var3 = signalsReactModule.useSignalState(var1.getPurchaseUIOptions)
	local var4 = signalsReactModule.useSignalState(var1.getPromptState)
	local var5 = useLocalization({
		title = "Feature.RobloxSubscription.Title.GetBlackbird",
		buttonText = "Feature.RobloxSubscription.Action.Subscribe",
		getFreeTrialText = "Feature.RobloxSubscription.Action.TryItForFree"
	})
	local var6 = isRobloxSubscriptionProductFreeTrialModule(signalsReactModule.useSignalState(var1.getRobloxSubscriptionProduct))
	local var7 = if fFlagRobloxPlusFAEFreeTrialModule then var3.description else nil
	local var8 = if var6 then var5.getFreeTrialText else var5.buttonText
	local var9 = var3.showLegalDisclosure ~= nil or var3.showLegalDisclosure
	local var10 = if fFlagRobloxPlusFAEFreeTrialModule and var3.noPurchaseMethodRequired ~= nil then var3.noPurchaseMethodRequired else false
	local var11 = reactModule.useCallback(function(p1)
		-- upvalues: fFlagEnableSubscriptionPurchaseFlowEventIngestModule (copy), logSubscriptionPurchaseFlowEventModule (copy), logRobloxSubscriptionUpsellCounterModule (copy), robloxSubscriptionUpsellTelemetryModule (copy)
		if p1 then
			if fFlagEnableSubscriptionPurchaseFlowEventIngestModule then
				logSubscriptionPurchaseFlowEventModule("SubscriptionUpsellModalShown")
			end
			logRobloxSubscriptionUpsellCounterModule(robloxSubscriptionUpsellTelemetryModule.RobloxSubscriptionUpsellModalShownCounter)
		end
	end, {})
	
	local function onSubscribe()
		-- upvalues: fFlagEnableSubscriptionPurchaseFlowEventIngestModule (copy), logSubscriptionPurchaseFlowEventModule (copy), logRobloxSubscriptionUpsellCounterModule (copy), robloxSubscriptionUpsellTelemetryModule (copy), fFlagRobloxPlusFAEFreeTrialModule (copy), var2 (ref), var1 (ref), promptStateModule (copy), finalizeRobloxSubscriptionUpsellFlowModule (copy), completeRobloxSubscriptionUpsellFlowModule (copy), performRobloxSubscriptionPurchaseModule (copy)
		if fFlagEnableSubscriptionPurchaseFlowEventIngestModule then
			logSubscriptionPurchaseFlowEventModule("SubscriptionUpsellSubscribeClicked")
		end
		logRobloxSubscriptionUpsellCounterModule(robloxSubscriptionUpsellTelemetryModule.RobloxSubscriptionUpsellModalBuyButtonClickedCounter)
		
		if fFlagRobloxPlusFAEFreeTrialModule and var2 then
			var1.setPromptState(promptStateModule.SubscriptionPurchaseRequested)
			var2(function()
				-- upvalues: var1 (copy), finalizeRobloxSubscriptionUpsellFlowModule (copy)
				var1.setDidTryPurchasing(true)
				finalizeRobloxSubscriptionUpsellFlowModule(true)
			end, function()
				-- upvalues: completeRobloxSubscriptionUpsellFlowModule (copy)
				completeRobloxSubscriptionUpsellFlowModule()
			end)
			
			return
		end
		performRobloxSubscriptionPurchaseModule()
	end
	
	local var12 = t[var4] == true
	local t_1 = {
		Header = reactModule.createElement(sheet.Header, { hasCloseAffordance = true }, {
			View = reactModule.createElement(view, { LayoutOrder = 1, tag = "row gap-small auto-xy" }, {
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
					Text = `{getIconRichText(iconName.RobloxPlus)} {var3.title or var5.title}`
				})
			})
		}),
		Content = reactModule.createElement(sheet.Content, { LayoutOrder = 2 }, {
			ContentContainer = reactModule.createElement(view, {
				tag = {
					["col size-full-0 auto-y"] = fFlagRobloxPlusFAEFreeTrialModule and var7 ~= nil,
					col = not (fFlagRobloxPlusFAEFreeTrialModule and var7 ~= nil)
				},
				Size = if fFlagRobloxPlusFAEFreeTrialModule and var7 ~= nil then nil else UDim2.new(1, 0, 0, 140)
			}, {
				PriceRow = if fFlagRobloxPlusFAEFreeTrialModule and var7 ~= nil then reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
					Text = var7
				}) else reactModule.createElement(robloxSubscriptionPriceRowModule, { layoutOrder = 1, isFreeTrial = var6 }),
				FeatureList = reactModule.createElement(robloxSubscriptionFeatureListModule, { layoutOrder = 2, noPurchaseMethodRequired = var10 })
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
			ref = var11,
			text = if fFlagRobloxPlusFAEFreeTrialModule and var3.ctaText then var3.ctaText else var8,
			onActivated = onSubscribe,
			fillBehavior = fillBehavior.Fill,
			variant = buttonVariant.Emphasis,
			isLoading = var12
		})
	}
	
	if fFlagRobloxPlusFAEFreeTrialModule and not var9 then
		createElement_2 = nil
	else
		createElement_2 = reactModule.createElement
		createElement_2 = createElement_2(legalDisclosureModule, {
			layoutOrder = 2,
			ctaText = if fFlagRobloxPlusFAEFreeTrialModule and var3.ctaText then var3.ctaText else var8,
			isFreeTrial = if fFlagSupportFreeTrialModule then var6 else nil,
			shortenFreeTrialTerms = if fFlagRobloxPlusFAEFreeTrialModule then var10 else nil
		})
	end
	t_5.LegalDisclosure = createElement_2
	t_3.ActionsContainer = createElement_1(view, t_4, t_5)
	t_1.Actions = createElement(actions, t_2, t_3)
	
	return t_1
end