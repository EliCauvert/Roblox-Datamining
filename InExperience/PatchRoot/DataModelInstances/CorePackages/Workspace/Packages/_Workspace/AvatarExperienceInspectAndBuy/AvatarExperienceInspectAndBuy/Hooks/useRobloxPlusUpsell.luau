local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local Parent = AvatarExperienceInspectAndBuy.Parent
local ReactModule = require(Parent.React)
local RobloxSubscriptionPurchaseAppModule = require(Parent.RobloxSubscriptionPurchaseApp)
local GetAppFeaturePoliciesFunction = require(Parent.UniversalAppPolicy).getAppFeaturePolicies
local SignalsReactModule = require(Parent.SignalsReact)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local _ = require(AvatarExperienceInspectAndBuy.Types)
local PriceStatusModule = require(AvatarExperienceInspectAndBuy.Enums.PriceStatus)
local GetPriceStatusModule = require(AvatarExperienceInspectAndBuy.Utils.getPriceStatus)
local FFlagEnablePlusReferralEntrypointTelemetry = require(Parent.SharedFlags).FFlagEnablePlusReferralEntrypointTelemetry

return function(p1)
	-- upvalues: SignalsReactModule (copy), RobloxSubscriptionPurchaseAppModule (copy), UseLocalizationFunction (copy), ReactModule (copy), FFlagEnablePlusReferralEntrypointTelemetry (copy), GetPriceStatusModule (copy), PriceStatusModule (copy), GetAppFeaturePoliciesFunction (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(RobloxSubscriptionPurchaseAppModule.RobloxSubscriptionSignals.get().getHasRobloxSubscription)
	local UseLocalizationResult = UseLocalizationFunction({
		getRobloxPlus = "Feature.RobloxSubscription.Title.GetBlackbird"
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: RobloxSubscriptionPurchaseAppModule (upval), FFlagEnablePlusReferralEntrypointTelemetry (upval)
		RobloxSubscriptionPurchaseAppModule.initiateRobloxSubscriptionPurchase(nil, nil, nil, RobloxSubscriptionPurchaseAppModule.SurfaceName.AvatarSpawnEffects, RobloxSubscriptionPurchaseAppModule.SurfaceContext.InGame, nil, if FFlagEnablePlusReferralEntrypointTelemetry then {
			entrypoint = RobloxSubscriptionPurchaseAppModule.Entrypoint.InspectAndBuy
		} else nil)
	end, {})
	
	return ReactModule.useMemo(function()
		-- upvalues: p1 (copy), GetPriceStatusModule (upval), PriceStatusModule (upval), UseSignalStateResult (copy), GetAppFeaturePoliciesFunction (upval), UseLocalizationResult (copy), UseResult (copy)
		return if p1 and p1.isPlusExclusive and GetPriceStatusModule(p1) ~= PriceStatusModule.Owned and not UseSignalStateResult and not GetAppFeaturePoliciesFunction().getDisableBlackbirdEntrypoints() then {
			text = UseLocalizationResult.getRobloxPlus,
			onActivated = UseResult
		} else nil
	end, {
		p1,
		UseSignalStateResult,
		UseLocalizationResult,
		UseResult
	})
end