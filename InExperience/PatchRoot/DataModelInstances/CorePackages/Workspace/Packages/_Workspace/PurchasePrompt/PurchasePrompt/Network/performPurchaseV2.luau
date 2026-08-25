local parent = script.Parent.Parent
local purchaseErrorModule = require(parent.Enums.PurchaseError)
local constantsModule = require(parent.Misc.Constants)
local promiseModule = require(parent.Promise)
local isGenericChallengeResponseModule = require(parent.Utils.isGenericChallengeResponse)
local isEconomicRestrictionResponse = require(parent.Parent.IAPExperience).Utility.isEconomicRestrictionResponse
local fFlagEnablePriceChangedErrorHandlingModule = require(parent.Flags.FFlagEnablePriceChangedErrorHandling)

return function(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11)
	-- upvalues: promiseModule (ref), constantsModule (ref), purchaseErrorModule (ref), isGenericChallengeResponseModule (ref), isEconomicRestrictionResponse (ref), fFlagEnablePriceChangedErrorHandlingModule (ref)
	return p0.performPurchaseV2(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11):andThen(function(p12)
		-- upvalues: promiseModule (copy), constantsModule (copy), purchaseErrorModule (copy), isGenericChallengeResponseModule (copy), isEconomicRestrictionResponse (copy), fFlagEnablePriceChangedErrorHandlingModule (copy)
		return if p12.purchased or p12.reason == "AlreadyOwned" then promiseModule.resolve(p12) elseif p12.reason == constantsModule.PurchaseFailureReason.EconomyDisabled then promiseModule.reject(purchaseErrorModule.PurchaseDisabled) elseif p12.reason == constantsModule.PurchaseFailureReason.TwoStepVerificationRequired then promiseModule.reject(purchaseErrorModule.TwoFactorNeeded) elseif p12.transactionStatus == 24 then promiseModule.reject(purchaseErrorModule.TwoFactorNeeded) elseif isGenericChallengeResponseModule(p12) then promiseModule.reject(p12) elseif isEconomicRestrictionResponse(p12) then promiseModule.reject(p12) elseif fFlagEnablePriceChangedErrorHandlingModule and p12.reason == constantsModule.PurchaseFailureReason.PriceChanged then promiseModule.reject(purchaseErrorModule.PriceChanged) else promiseModule.reject(purchaseErrorModule.UnknownFailure)
	end, function(_)
		-- upvalues: promiseModule (copy), purchaseErrorModule (copy)
		return promiseModule.reject(purchaseErrorModule.UnknownFailure)
	end)
end