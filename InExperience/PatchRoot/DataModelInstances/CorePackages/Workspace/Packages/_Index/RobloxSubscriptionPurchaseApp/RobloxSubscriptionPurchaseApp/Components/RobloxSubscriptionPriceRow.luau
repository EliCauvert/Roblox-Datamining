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
local GetFreeTrialOfferModule = require(RobloxSubscriptionPurchaseApp.Utils.getFreeTrialOffer)
local IsSupportedTrialPeriodTypeModule = require(RobloxSubscriptionPurchaseApp.Utils.isSupportedTrialPeriodType)
local FFlagRobloxPlusDynamicFreeTrialLengthModule = require(RobloxSubscriptionPurchaseApp.Flags.FFlagRobloxPlusDynamicFreeTrialLength)

return function(p1)
	-- upvalues: RobloxSubscriptionStoreModule (copy), SignalsReactModule (copy), GetPeriodTypeDisplayLabelModule (copy), FFlagRobloxPlusDynamicFreeTrialLengthModule (copy), GetFreeTrialOfferModule (copy), IsSupportedTrialPeriodTypeModule (copy), UseLocalizationFunction (copy), ReactModule (copy), View (copy), Text (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(RobloxSubscriptionStoreModule.get().getRobloxSubscriptionProduct)
	local LocalizedPriceDisplayString = UseSignalStateResult and UseSignalStateResult.LocalizedPriceDisplayString
	local PeriodType = UseSignalStateResult and UseSignalStateResult.PeriodType
	local IsIsFreeTrial = p1.isFreeTrial == true
	local FreeTrialOfferModule = if FFlagRobloxPlusDynamicFreeTrialLengthModule and IsIsFreeTrial then GetFreeTrialOfferModule(UseSignalStateResult) else nil
	local FreeTrialOfferModule1 = if FreeTrialOfferModule == nil or not IsSupportedTrialPeriodTypeModule(FreeTrialOfferModule.PeriodType) then nil else FreeTrialOfferModule
	local Duration = if FreeTrialOfferModule1 then FreeTrialOfferModule1.Duration else 1
	local config = {
		periodType = GetPeriodTypeDisplayLabelModule(PeriodType or "", false)
	}
	
	if FreeTrialOfferModule1 then
		config.trialPeriodLabel = GetPeriodTypeDisplayLabelModule(FreeTrialOfferModule1.PeriodType, Duration > 1)
	end
	local UseLocalizationResult = UseLocalizationFunction(config)
	local UseLocalizationResult1 = UseLocalizationFunction({
		price = {
			"Feature.RobloxSubscription.Label.BlackbirdPriceTag",
			price = LocalizedPriceDisplayString or "",
			periodType = UseLocalizationResult.periodType
		},
		freeTrialPrice = {
			"Feature.RobloxSubscription.Label.RobloxPlusPriceRowV2",
			boldStart = "<b>",
			boldEnd = "</b>",
			price = LocalizedPriceDisplayString or "",
			periodType = UseLocalizationResult.periodType
		},
		freeTrialPriceV3 = if FreeTrialOfferModule1 then {
			"Feature.RobloxSubscription.Label.RobloxPlusPriceRowV3",
			boldStart = "<b>",
			boldEnd = "</b>",
			price = LocalizedPriceDisplayString or "",
			periodType = UseLocalizationResult.periodType,
			trialDuration = Duration,
			trialPeriodLabel = UseLocalizationResult.trialPeriodLabel
		} else nil
	})
	
	if LocalizedPriceDisplayString and PeriodType then
		local FreeTrialPriceV3 = if FreeTrialOfferModule1 then UseLocalizationResult1.freeTrialPriceV3 else UseLocalizationResult1.freeTrialPrice
		
		return ReactModule.createElement(View, {
			tag = "row auto-y size-full-0 align-y-center align-x-left gap-small",
			LayoutOrder = p1.layoutOrder
		}, {
			Price = ReactModule.createElement(Text, {
				tag = "size-full-0 auto-y text-title-medium content-emphasis text-align-x-left",
				Text = if IsIsFreeTrial then FreeTrialPriceV3 else UseLocalizationResult1.price,
				RichText = if IsIsFreeTrial then true else nil
			})
		})
	else
		return nil
	end
end