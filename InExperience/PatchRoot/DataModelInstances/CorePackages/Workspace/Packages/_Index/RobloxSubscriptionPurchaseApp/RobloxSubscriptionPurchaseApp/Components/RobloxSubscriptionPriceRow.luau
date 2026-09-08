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

return function(p1)
	-- upvalues: robloxSubscriptionStoreModule (ref), signalsReactModule (ref), getPeriodTypeDisplayLabelModule (ref), useLocalization (ref), reactModule (ref), view (ref), text (ref)
	local var1 = signalsReactModule.useSignalState(robloxSubscriptionStoreModule.get().getRobloxSubscriptionProduct)
	local localizedPriceDisplayString = var1 and var1.LocalizedPriceDisplayString
	local periodType = var1 and var1.PeriodType
	local var2 = p1.isFreeTrial == true
	local var3 = useLocalization({
		periodType = getPeriodTypeDisplayLabelModule(periodType or "", false)
	})
	local var4 = useLocalization({
		price = {
			"Feature.RobloxSubscription.Label.BlackbirdPriceTag",
			price = localizedPriceDisplayString or "",
			periodType = var3.periodType
		},
		freeTrialPrice = {
			"Feature.RobloxSubscription.Label.RobloxPlusPriceRowV2",
			boldStart = "<b>",
			boldEnd = "</b>",
			price = localizedPriceDisplayString or "",
			periodType = var3.periodType
		}
	})
	
	return if localizedPriceDisplayString and periodType then reactModule.createElement(view, {
		tag = "row auto-y size-full-0 align-y-center align-x-left gap-small",
		LayoutOrder = p1.layoutOrder
	}, {
		Price = reactModule.createElement(text, {
			tag = "size-full-0 auto-y text-title-medium content-emphasis text-align-x-left",
			Text = if var2 then var4.freeTrialPrice else var4.price,
			RichText = if var2 then true else nil
		})
	}) else nil
end