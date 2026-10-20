local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local Parent = RobloxSubscriptionPurchaseApp.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local RobloxSubscriptionStoreModule = require(RobloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(RobloxSubscriptionPurchaseApp.Models.GetRobloxSubscriptionProductsModel)
local View = FoundationModule.View
local Text = FoundationModule.Text
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local GetPeriodTypeDisplayLabelModule = require(RobloxSubscriptionPurchaseApp.Utils.getPeriodTypeDisplayLabel)
local FFlagSupportFreeTrialPriceRowModule = require(RobloxSubscriptionPurchaseApp.Flags.FFlagSupportFreeTrialPriceRow)

return function(p1)
	-- upvalues: RobloxSubscriptionStoreModule (copy), SignalsReactModule (copy), FFlagSupportFreeTrialPriceRowModule (copy), GetPeriodTypeDisplayLabelModule (copy), UseLocalizationFunction (copy), ReactModule (copy), View (copy), Text (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(RobloxSubscriptionStoreModule.get().getRobloxSubscriptionProduct)
	local LocalizedPriceDisplayString = UseSignalStateResult and UseSignalStateResult.LocalizedPriceDisplayString
	local PeriodType = UseSignalStateResult and UseSignalStateResult.PeriodType
	local IsIsFreeTrial: boolean = if FFlagSupportFreeTrialPriceRowModule then p1.isFreeTrial == true else false
	local UseLocalizationResult = UseLocalizationFunction({
		periodType = GetPeriodTypeDisplayLabelModule(PeriodType or "", false)
	})
	local UseLocalizationResult1 = UseLocalizationFunction({
		price = {
			"Feature.RobloxSubscription.Label.BlackbirdPriceTag",
			price = LocalizedPriceDisplayString or "",
			periodType = UseLocalizationResult.periodType
		},
		freeTrialPrice = if FFlagSupportFreeTrialPriceRowModule then {
			"Feature.RobloxSubscription.Label.RobloxPlusPriceRowV2",
			boldStart = "<b>",
			boldEnd = "</b>",
			price = LocalizedPriceDisplayString or "",
			periodType = UseLocalizationResult.periodType
		} else nil
	})
	
	return if LocalizedPriceDisplayString and PeriodType then ReactModule.createElement(View, {
		tag = "row auto-y size-full-0 align-y-center align-x-left gap-small",
		LayoutOrder = p1.layoutOrder
	}, {
		Price = ReactModule.createElement(Text, {
			tag = "size-full-0 auto-y text-title-medium content-emphasis text-align-x-left",
			Text = if FFlagSupportFreeTrialPriceRowModule and IsIsFreeTrial then UseLocalizationResult1.freeTrialPrice else UseLocalizationResult1.price,
			RichText = if FFlagSupportFreeTrialPriceRowModule and IsIsFreeTrial then true else nil
		})
	}) else nil
end