local parent = script.Parent.Parent
local purchaseErrorModule = require(parent.Enums.PurchaseError)
local constantsModule = require(parent.Misc.Constants)
local promiseModule = require(parent.Promise)
local isGenericChallengeResponseModule = require(parent.Utils.isGenericChallengeResponse)
local isEconomicRestrictionResponse = require(parent.Parent.IAPExperience).Utility.isEconomicRestrictionResponse
local fFlagEnablePriceChangedErrorHandlingModule = require(parent.Flags.FFlagEnablePriceChangedErrorHandling)

return function(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12)
	-- upvalues: promiseModule (ref), constantsModule (ref), purchaseErrorModule (ref), isGenericChallengeResponseModule (ref), isEconomicRestrictionResponse (ref), fFlagEnablePriceChangedErrorHandlingModule (ref)
	return p1.performPurchaseV2(p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12):andThen(function(p13)
		-- upvalues: promiseModule (copy), constantsModule (copy), purchaseErrorModule (copy), isGenericChallengeResponseModule (copy), isEconomicRestrictionResponse (copy), fFlagEnablePriceChangedErrorHandlingModule (copy)
		return if p13.purchased or p13.reason == "AlreadyOwned" then promiseModule.resolve(p13) elseif p13.reason == constantsModule.PurchaseFailureReason.EconomyDisabled then promiseModule.reject(purchaseErrorModule.PurchaseDisabled) elseif p13.reason == constantsModule.PurchaseFailureReason.TwoStepVerificationRequired then promiseModule.reject(purchaseErrorModule.TwoFactorNeeded) elseif p13.transactionStatus == 24 then promiseModule.reject(purchaseErrorModule.TwoFactorNeeded) elseif isGenericChallengeResponseModule(p13) then promiseModule.reject(p13) elseif isEconomicRestrictionResponse(p13) then promiseModule.reject(p13) elseif fFlagEnablePriceChangedErrorHandlingModule and p13.reason == constantsModule.PurchaseFailureReason.PriceChanged then promiseModule.reject(purchaseErrorModule.PriceChanged) else promiseModule.reject(purchaseErrorModule.UnknownFailure)
	end, function(_)
		-- upvalues: promiseModule (copy), purchaseErrorModule (copy)
		return promiseModule.reject(purchaseErrorModule.UnknownFailure)
	end)
end