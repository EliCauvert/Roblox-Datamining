local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local parent = robloxSubscriptionPurchaseApp.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local robloxSubscriptionStoreModule = require(robloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(robloxSubscriptionPurchaseApp.Models.GetRobloxSubscriptionProductsModel)
local view = foundationModule.View
local text = foundationModule.Text
local useLocalization = require(parent.Localization).Hooks.useLocalization
local getPeriodTypeDisplayLabelModule = require(robloxSubscriptionPurchaseApp.Utils.getPeriodTypeDisplayLabel)
local fFlagSupportFreeTrialPriceRowModule = require(robloxSubscriptionPurchaseApp.Flags.FFlagSupportFreeTrialPriceRow)

return function(p1)
	-- upvalues: robloxSubscriptionStoreModule (ref), signalsReactModule (ref), fFlagSupportFreeTrialPriceRowModule (ref), getPeriodTypeDisplayLabelModule (ref), useLocalization (ref), reactModule (ref), view (ref), text (ref)
	local var1
	local var2 = signalsReactModule.useSignalState(robloxSubscriptionStoreModule.get().getRobloxSubscriptionProduct)
	local localizedPriceDisplayString = var2 and var2.LocalizedPriceDisplayString
	local periodType = var2 and var2.PeriodType
	
	if fFlagSupportFreeTrialPriceRowModule then
		var1 = p1.isFreeTrial == true
		var1 = nil
	else
		var1 = false
	end
	local var3 = useLocalization({
		periodType = getPeriodTypeDisplayLabelModule(periodType or "", false)
	})
	local var4 = useLocalization({
		price = {
			"Feature.RobloxSubscription.Label.BlackbirdPriceTag",
			price = localizedPriceDisplayString or "",
			periodType = var3.periodType
		},
		freeTrialPrice = if fFlagSupportFreeTrialPriceRowModule then {
			"Feature.RobloxSubscription.Label.RobloxPlusPriceRowV2",
			boldStart = "<b>",
			boldEnd = "</b>",
			price = localizedPriceDisplayString or "",
			periodType = var3.periodType
		} else nil
	})
	
	return if not (not localizedPriceDisplayString or not periodType) then reactModule.createElement(view, {
		tag = "row auto-y size-full-0 align-y-center align-x-left gap-small",
		LayoutOrder = p1.layoutOrder
	}, {
		Price = reactModule.createElement(text, {
			tag = "size-full-0 auto-y text-title-medium content-emphasis text-align-x-left",
			Text = if fFlagSupportFreeTrialPriceRowModule and var1 then var4.freeTrialPrice else var4.price,
			RichText = if fFlagSupportFreeTrialPriceRowModule and var1 then true else nil
		})
	}) else nil
end