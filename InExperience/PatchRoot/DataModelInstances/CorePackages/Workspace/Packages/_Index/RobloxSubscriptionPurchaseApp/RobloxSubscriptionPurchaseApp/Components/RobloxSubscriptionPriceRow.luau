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

return function(p0) --[[ line: 22 | named "RobloxSubscriptionPriceRow" ]]
	-- upvalues: robloxSubscriptionStoreModule (ref), signalsReactModule (ref), fFlagSupportFreeTrialPriceRowModule (ref), getPeriodTypeDisplayLabelModule (ref), useLocalization (ref), reactModule (ref), view (ref), text (ref)
	local var10
	local var7 = signalsReactModule.useSignalState(robloxSubscriptionStoreModule.get().getRobloxSubscriptionProduct)
	local localizedPriceDisplayString = var7 and var7.LocalizedPriceDisplayString
	local periodType = var7 and var7.PeriodType
	
	if fFlagSupportFreeTrialPriceRowModule then
		var10 = p0.isFreeTrial == true
		var10 = nil
	else
		var10 = false
	end
	local var11 = useLocalization({
		periodType = getPeriodTypeDisplayLabelModule(periodType or "", false)
	})
	local var12 = useLocalization({
		price = {
			"Feature.RobloxSubscription.Label.BlackbirdPriceTag",
			price = localizedPriceDisplayString or "",
			periodType = var11.periodType
		},
		freeTrialPrice = if fFlagSupportFreeTrialPriceRowModule then {
			"Feature.RobloxSubscription.Label.RobloxPlusPriceRowV2",
			boldStart = "<b>",
			boldEnd = "</b>",
			price = localizedPriceDisplayString or "",
			periodType = var11.periodType
		} else nil
	})
	
	return if not (not localizedPriceDisplayString or not periodType) then reactModule.createElement(view, {
		tag = "row auto-y size-full-0 align-y-center align-x-left gap-small",
		LayoutOrder = p0.layoutOrder
	}, {
		Price = reactModule.createElement(text, {
			tag = "size-full-0 auto-y text-title-medium content-emphasis text-align-x-left",
			Text = if fFlagSupportFreeTrialPriceRowModule and var10 then var12.freeTrialPrice else var12.price,
			RichText = if fFlagSupportFreeTrialPriceRowModule and var10 then true else nil
		})
	}) else nil
end