local Parent = script.Parent.Parent
local PurchaseErrorModule = require(Parent.Enums.PurchaseError)
local ConstantsModule = require(Parent.Misc.Constants)
local PromiseModule = require(Parent.Promise)
local IsGenericChallengeResponseModule = require(Parent.Utils.isGenericChallengeResponse)
local IsEconomicRestrictionResponseFunction = require(Parent.Parent.IAPExperience).Utility.isEconomicRestrictionResponse
local FFlagEnablePriceChangedErrorHandlingModule = require(Parent.Flags.FFlagEnablePriceChangedErrorHandling)

return function(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12) --[[ Line: 17 | Named "performPurchaseV2" ]]
	-- upvalues: PromiseModule (copy), ConstantsModule (copy), PurchaseErrorModule (copy), IsGenericChallengeResponseModule (copy), IsEconomicRestrictionResponseFunction (copy), FFlagEnablePriceChangedErrorHandlingModule (copy)
	return p1.performPurchaseV2(p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12):andThen(function(Result) --[[ Line: 45 ]]
		-- upvalues: PromiseModule (upval), ConstantsModule (upval), PurchaseErrorModule (upval), IsGenericChallengeResponseModule (upval), IsEconomicRestrictionResponseFunction (upval), FFlagEnablePriceChangedErrorHandlingModule (upval)
		return if Result.purchased or Result.reason == "AlreadyOwned" then PromiseModule.resolve(Result) elseif Result.reason == ConstantsModule.PurchaseFailureReason.EconomyDisabled then PromiseModule.reject(PurchaseErrorModule.PurchaseDisabled) elseif Result.reason == ConstantsModule.PurchaseFailureReason.TwoStepVerificationRequired then PromiseModule.reject(PurchaseErrorModule.TwoFactorNeeded) elseif Result.transactionStatus == 24 then PromiseModule.reject(PurchaseErrorModule.TwoFactorNeeded) elseif IsGenericChallengeResponseModule(Result) then PromiseModule.reject(Result) elseif IsEconomicRestrictionResponseFunction(Result) then PromiseModule.reject(Result) elseif FFlagEnablePriceChangedErrorHandlingModule and Result.reason == ConstantsModule.PurchaseFailureReason.PriceChanged then PromiseModule.reject(PurchaseErrorModule.PriceChanged) else PromiseModule.reject(PurchaseErrorModule.UnknownFailure)
	end, function(_) --[[ Line: 73 ]]
		-- upvalues: PromiseModule (upval), PurchaseErrorModule (upval)
		return PromiseModule.reject(PurchaseErrorModule.UnknownFailure)
	end)
end