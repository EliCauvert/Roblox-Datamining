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
local fFlagSupportFreeTrialPriceRowModule = require(robloxSubscriptionPurchaseApp.Flags.FFlagSupportFreeTrialPriceRow)
local fFlagRobloxPlusFAEFreeTrialModule = require(robloxSubscriptionPurchaseApp.Flags.FFlagRobloxPlusFAEFreeTrial)
local t = {
	[promptStateModule.SubscriptionPurchaseInProgress] = true,
	[promptStateModule.SubscriptionStatusPolling] = true
}

return function() --[[ line: 57 | named "useBlackbirdSheetSlots" ]]
	-- upvalues: robloxSubscriptionStoreModule (ref), fFlagRobloxPlusFAEFreeTrialModule (ref), signalsReactModule (ref), useLocalization (ref), isRobloxSubscriptionProductFreeTrialModule (ref), reactModule (ref), fFlagEnableSubscriptionPurchaseFlowEventIngestModule (ref), logSubscriptionPurchaseFlowEventModule (ref), logRobloxSubscriptionUpsellCounterModule (ref), robloxSubscriptionUpsellTelemetryModule (ref), promptStateModule (ref), finalizeRobloxSubscriptionUpsellFlowModule (ref), completeRobloxSubscriptionUpsellFlowModule (ref), performRobloxSubscriptionPurchaseModule (ref), t (ref), sheet (ref), view (ref), text (ref), getIconRichText (ref), iconName (ref), handleBackButtonActionModule (ref), robloxSubscriptionPriceRowModule (ref), fFlagSupportFreeTrialPriceRowModule (ref), robloxSubscriptionFeatureListModule (ref), button (ref), fillBehavior (ref), buttonVariant (ref), legalDisclosureModule (ref), fFlagSupportFreeTrialModule (ref)
	local createElement_2
	local var22 = robloxSubscriptionStoreModule.get()
	local var23 = if fFlagRobloxPlusFAEFreeTrialModule then var22.getOnCtaOverride() else nil
	local var24 = signalsReactModule.useSignalState(var22.getPurchaseUIOptions)
	local var25 = signalsReactModule.useSignalState(var22.getPromptState)
	local var26 = useLocalization({
		title = "Feature.RobloxSubscription.Title.GetBlackbird",
		buttonText = "Feature.RobloxSubscription.Action.Subscribe",
		getFreeTrialText = "Feature.RobloxSubscription.Action.TryItForFree"
	})
	local var27 = isRobloxSubscriptionProductFreeTrialModule(signalsReactModule.useSignalState(var22.getRobloxSubscriptionProduct))
	local var28 = if fFlagRobloxPlusFAEFreeTrialModule then var24.description else nil
	local var29 = if var27 then var26.getFreeTrialText else var26.buttonText
	local var30 = var24.showLegalDisclosure ~= nil or var24.showLegalDisclosure
	local var31 = reactModule.useCallback(function(p0) --[[ line: 82 ]]
		-- upvalues: fFlagEnableSubscriptionPurchaseFlowEventIngestModule (copy), logSubscriptionPurchaseFlowEventModule (copy), logRobloxSubscriptionUpsellCounterModule (copy), robloxSubscriptionUpsellTelemetryModule (copy)
		if p0 then
			if fFlagEnableSubscriptionPurchaseFlowEventIngestModule then
				logSubscriptionPurchaseFlowEventModule("SubscriptionUpsellModalShown")
			end
			logRobloxSubscriptionUpsellCounterModule(robloxSubscriptionUpsellTelemetryModule.RobloxSubscriptionUpsellModalShownCounter)
		end
	end, {})
	
	local function onSubscribe() --[[ line: 93 ]]
		-- upvalues: fFlagEnableSubscriptionPurchaseFlowEventIngestModule (copy), logSubscriptionPurchaseFlowEventModule (copy), logRobloxSubscriptionUpsellCounterModule (copy), robloxSubscriptionUpsellTelemetryModule (copy), fFlagRobloxPlusFAEFreeTrialModule (copy), var23 (ref), var22 (ref), promptStateModule (copy), finalizeRobloxSubscriptionUpsellFlowModule (copy), completeRobloxSubscriptionUpsellFlowModule (copy), performRobloxSubscriptionPurchaseModule (copy)
		if fFlagEnableSubscriptionPurchaseFlowEventIngestModule then
			logSubscriptionPurchaseFlowEventModule("SubscriptionUpsellSubscribeClicked")
		end
		logRobloxSubscriptionUpsellCounterModule(robloxSubscriptionUpsellTelemetryModule.RobloxSubscriptionUpsellModalBuyButtonClickedCounter)
		
		if fFlagRobloxPlusFAEFreeTrialModule and var23 then
			var22.setPromptState(promptStateModule.SubscriptionPurchaseRequested)
			var23(function() --[[ line: 105 ]]
				-- upvalues: var22 (copy), finalizeRobloxSubscriptionUpsellFlowModule (copy)
				var22.setDidTryPurchasing(true)
				finalizeRobloxSubscriptionUpsellFlowModule(true)
			end, function() --[[ line: 108 ]]
				-- upvalues: completeRobloxSubscriptionUpsellFlowModule (copy)
				completeRobloxSubscriptionUpsellFlowModule()
			end)
			
			return
		end
		performRobloxSubscriptionPurchaseModule()
	end
	
	local var33 = t[var25] == true
	local t_1 = {
		Header = reactModule.createElement(sheet.Header, { hasCloseAffordance = true }, {
			View = reactModule.createElement(view, { LayoutOrder = 1, tag = "row gap-small auto-xy" }, {
				BackButton = if var24.showBackButton then reactModule.createElement(text, {
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
					Text = `{getIconRichText(iconName.RobloxPlus)} {var24.title or var26.title}`
				})
			})
		}),
		Content = reactModule.createElement(sheet.Content, { LayoutOrder = 2 }, {
			ContentContainer = reactModule.createElement(view, {
				tag = {
					["col size-full-0 auto-y"] = fFlagRobloxPlusFAEFreeTrialModule,
					col = not fFlagRobloxPlusFAEFreeTrialModule
				},
				Size = if fFlagRobloxPlusFAEFreeTrialModule then nil else UDim2.new(1, 0, 0, 140)
			}, {
				PriceRow = if fFlagRobloxPlusFAEFreeTrialModule and var28 ~= nil then reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
					Text = var28
				}) else reactModule.createElement(robloxSubscriptionPriceRowModule, {
					layoutOrder = 1,
					isFreeTrial = if fFlagSupportFreeTrialPriceRowModule then var27 else nil
				}),
				FeatureList = reactModule.createElement(robloxSubscriptionFeatureListModule, { layoutOrder = 2 })
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
			ref = var31,
			text = if fFlagRobloxPlusFAEFreeTrialModule and var24.ctaText then var24.ctaText else var29,
			onActivated = onSubscribe,
			fillBehavior = fillBehavior.Fill,
			variant = buttonVariant.Emphasis,
			isLoading = var33
		})
	}
	
	if fFlagRobloxPlusFAEFreeTrialModule and not var30 then
		createElement_2 = nil
	else
		createElement_2 = reactModule.createElement
		createElement_2 = createElement_2(legalDisclosureModule, {
			layoutOrder = 2,
			ctaText = if fFlagRobloxPlusFAEFreeTrialModule and var24.ctaText then var24.ctaText else var29,
			isFreeTrial = if fFlagSupportFreeTrialModule then var27 else nil
		})
	end
	t_5.LegalDisclosure = createElement_2
	t_3.ActionsContainer = createElement_1(view, t_4, t_5)
	t_1.Actions = createElement(actions, t_2, t_3)
	
	return t_1
end