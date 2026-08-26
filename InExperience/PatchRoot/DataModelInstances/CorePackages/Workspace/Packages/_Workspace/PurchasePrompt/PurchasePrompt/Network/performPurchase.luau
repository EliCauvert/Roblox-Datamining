local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local purchaseErrorModule = require(purchasePrompt.Enums.PurchaseError)
local constantsModule = require(purchasePrompt.Misc.Constants)
local promiseModule = require(purchasePrompt.Promise)
local isGenericChallengeResponseModule = require(purchasePrompt.Utils.isGenericChallengeResponse)
local parent = purchasePrompt.Parent
local isEconomicRestrictionResponse = require(parent.IAPExperience).Utility.isEconomicRestrictionResponse
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow = sharedFlagsModule.FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow
local fFlagEnablePurchasePayloadInExperienceShop = sharedFlagsModule.FFlagEnablePurchasePayloadInExperienceShop
local fFlagEnablePriceChangedErrorHandlingModule = require(purchasePrompt.Flags.FFlagEnablePriceChangedErrorHandling)

return function(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13)
	-- upvalues: fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow (ref), fFlagEnablePurchasePayloadInExperienceShop (ref), promiseModule (ref), constantsModule (ref), purchaseErrorModule (ref), isGenericChallengeResponseModule (ref), isEconomicRestrictionResponse (ref), fFlagEnablePriceChangedErrorHandlingModule (ref)
	return p1.performPurchase(p2, p3, p4, p5, p6, p7, p8, p9, p10, if fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow then p11 else nil, if fFlagEnablePurchasePayloadInExperienceShop then p12 else nil, p13):andThen(function(p14)
		-- upvalues: promiseModule (copy), constantsModule (copy), purchaseErrorModule (copy), isGenericChallengeResponseModule (copy), isEconomicRestrictionResponse (copy), fFlagEnablePriceChangedErrorHandlingModule (copy)
		return if p14.purchased or p14.reason == "AlreadyOwned" then promiseModule.resolve(p14) elseif p14.reason == constantsModule.PurchaseFailureReason.EconomyDisabled then promiseModule.reject(purchaseErrorModule.PurchaseDisabled) elseif p14.reason == constantsModule.PurchaseFailureReason.TwoStepVerificationRequired then promiseModule.reject(purchaseErrorModule.TwoFactorNeeded) elseif p14.transactionStatus == 24 then promiseModule.reject(purchaseErrorModule.TwoFactorNeeded) elseif isGenericChallengeResponseModule(p14) then promiseModule.reject(p14) elseif isEconomicRestrictionResponse(p14) then promiseModule.reject(p14) elseif fFlagEnablePriceChangedErrorHandlingModule and p14.reason == constantsModule.PurchaseFailureReason.PriceChanged then promiseModule.reject(purchaseErrorModule.PriceChanged) else promiseModule.reject(purchaseErrorModule.UnknownFailure)
	end, function(_)
		-- upvalues: promiseModule (copy), purchaseErrorModule (copy)
		return promiseModule.reject(purchaseErrorModule.UnknownFailure)
	end)
end