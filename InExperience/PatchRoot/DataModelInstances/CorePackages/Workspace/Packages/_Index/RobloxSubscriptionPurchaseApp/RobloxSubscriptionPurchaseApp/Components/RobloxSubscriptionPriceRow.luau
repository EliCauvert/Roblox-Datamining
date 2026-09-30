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
local getFreeTrialOfferModule = require(robloxSubscriptionPurchaseApp.Utils.getFreeTrialOffer)
local isSupportedTrialPeriodTypeModule = require(robloxSubscriptionPurchaseApp.Utils.isSupportedTrialPeriodType)
local fFlagRobloxPlusDynamicFreeTrialLengthModule = require(robloxSubscriptionPurchaseApp.Flags.FFlagRobloxPlusDynamicFreeTrialLength)

return function(p1)
	-- upvalues: robloxSubscriptionStoreModule (ref), signalsReactModule (ref), getPeriodTypeDisplayLabelModule (ref), fFlagRobloxPlusDynamicFreeTrialLengthModule (ref), getFreeTrialOfferModule (ref), isSupportedTrialPeriodTypeModule (ref), useLocalization (ref), reactModule (ref), view (ref), text (ref)
	local var1 = signalsReactModule.useSignalState(robloxSubscriptionStoreModule.get().getRobloxSubscriptionProduct)
	local localizedPriceDisplayString = var1 and var1.LocalizedPriceDisplayString
	local periodType = var1 and var1.PeriodType
	local var2 = p1.isFreeTrial == true
	local var3 = getPeriodTypeDisplayLabelModule(periodType or "", false)
	local var4 = if fFlagRobloxPlusDynamicFreeTrialLengthModule and var2 then getFreeTrialOfferModule(var1) else nil
	local var5 = if var4 == nil or not isSupportedTrialPeriodTypeModule(var4.PeriodType) then nil else var4
	local var6 = if var5 then var5.Duration else 1
	local t = { periodType = var3 }
	
	if var5 then
		t.trialPeriodLabel = getPeriodTypeDisplayLabelModule(var5.PeriodType, var6 > 1)
	end
	local var7 = useLocalization(t)
	local var8 = useLocalization({
		price = {
			"Feature.RobloxSubscription.Label.BlackbirdPriceTag",
			price = localizedPriceDisplayString or "",
			periodType = var7.periodType
		},
		freeTrialPrice = {
			"Feature.RobloxSubscription.Label.RobloxPlusPriceRowV2",
			boldStart = "<b>",
			boldEnd = "</b>",
			price = localizedPriceDisplayString or "",
			periodType = var7.periodType
		},
		freeTrialPriceV3 = if var5 then {
			"Feature.RobloxSubscription.Label.RobloxPlusPriceRowV3",
			boldStart = "<b>",
			boldEnd = "</b>",
			price = localizedPriceDisplayString or "",
			periodType = var7.periodType,
			trialDuration = var6,
			trialPeriodLabel = var7.trialPeriodLabel
		} else nil
	})
	
	return if localizedPriceDisplayString and periodType then reactModule.createElement(view, {
		tag = "row auto-y size-full-0 align-y-center align-x-left gap-small",
		LayoutOrder = p1.layoutOrder
	}, {
		Price = reactModule.createElement(text, {
			tag = "size-full-0 auto-y text-title-medium content-emphasis text-align-x-left",
			Text = if var2 then if var5 then var8.freeTrialPriceV3 else var8.freeTrialPrice else var8.price,
			RichText = if var2 then true else nil
		})
	}) else nil
end