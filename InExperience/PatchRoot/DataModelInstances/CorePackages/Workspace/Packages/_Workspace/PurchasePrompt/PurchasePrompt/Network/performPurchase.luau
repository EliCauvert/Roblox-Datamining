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

return function(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12) --[[ line: 20 | named "performPurchase" ]]
	-- upvalues: fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow (ref), fFlagEnablePurchasePayloadInExperienceShop (ref), promiseModule (ref), constantsModule (ref), purchaseErrorModule (ref), isGenericChallengeResponseModule (ref), isEconomicRestrictionResponse (ref), fFlagEnablePriceChangedErrorHandlingModule (ref)
	return p0.performPurchase(p1, p2, p3, p4, p5, p6, p7, p8, p9, if fFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow then p10 else nil, if fFlagEnablePurchasePayloadInExperienceShop then p11 else nil, p12):andThen(function(p13) --[[ line: 50 ]]
		-- upvalues: promiseModule (copy), constantsModule (copy), purchaseErrorModule (copy), isGenericChallengeResponseModule (copy), isEconomicRestrictionResponse (copy), fFlagEnablePriceChangedErrorHandlingModule (copy)
		return if p13.purchased or p13.reason == "AlreadyOwned" then promiseModule.resolve(p13) elseif p13.reason == constantsModule.PurchaseFailureReason.EconomyDisabled then promiseModule.reject(purchaseErrorModule.PurchaseDisabled) elseif p13.reason == constantsModule.PurchaseFailureReason.TwoStepVerificationRequired then promiseModule.reject(purchaseErrorModule.TwoFactorNeeded) elseif p13.transactionStatus == 24 then promiseModule.reject(purchaseErrorModule.TwoFactorNeeded) elseif isGenericChallengeResponseModule(p13) then promiseModule.reject(p13) elseif isEconomicRestrictionResponse(p13) then promiseModule.reject(p13) elseif fFlagEnablePriceChangedErrorHandlingModule and p13.reason == constantsModule.PurchaseFailureReason.PriceChanged then promiseModule.reject(purchaseErrorModule.PriceChanged) else promiseModule.reject(purchaseErrorModule.UnknownFailure)
	end, function(_) --[[ line: 78 ]]
		-- upvalues: promiseModule (copy), purchaseErrorModule (copy)
		return promiseModule.reject(purchaseErrorModule.UnknownFailure)
	end)
end