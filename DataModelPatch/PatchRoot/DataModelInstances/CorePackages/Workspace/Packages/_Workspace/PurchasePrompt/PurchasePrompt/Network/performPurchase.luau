local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local PurchaseErrorModule = require(PurchasePrompt.Enums.PurchaseError)
local ConstantsModule = require(PurchasePrompt.Misc.Constants)
local PromiseModule = require(PurchasePrompt.Promise)
local IsGenericChallengeResponseModule = require(PurchasePrompt.Utils.isGenericChallengeResponse)
local Parent = PurchasePrompt.Parent
local IsEconomicRestrictionResponseFunction = require(Parent.IAPExperience).Utility.isEconomicRestrictionResponse
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow = SharedFlagsModule.FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow
local FFlagEnablePurchasePayloadInExperienceShop = SharedFlagsModule.FFlagEnablePurchasePayloadInExperienceShop
local FFlagEnablePriceChangedErrorHandlingModule = require(PurchasePrompt.Flags.FFlagEnablePriceChangedErrorHandling)

return function(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13)
	-- upvalues: FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow (copy), FFlagEnablePurchasePayloadInExperienceShop (copy), PromiseModule (copy), ConstantsModule (copy), PurchaseErrorModule (copy), IsGenericChallengeResponseModule (copy), IsEconomicRestrictionResponseFunction (copy), FFlagEnablePriceChangedErrorHandlingModule (copy)
	return p1.performPurchase(p2, p3, p4, p5, p6, p7, p8, p9, p10, if FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow then p11 else nil, if FFlagEnablePurchasePayloadInExperienceShop then p12 else nil, p13):andThen(function(Result)
		-- upvalues: PromiseModule (upval), ConstantsModule (upval), PurchaseErrorModule (upval), IsGenericChallengeResponseModule (upval), IsEconomicRestrictionResponseFunction (upval), FFlagEnablePriceChangedErrorHandlingModule (upval)
		return if Result.purchased or Result.reason == "AlreadyOwned" then PromiseModule.resolve(Result) elseif Result.reason == ConstantsModule.PurchaseFailureReason.EconomyDisabled then PromiseModule.reject(PurchaseErrorModule.PurchaseDisabled) elseif Result.reason == ConstantsModule.PurchaseFailureReason.TwoStepVerificationRequired then PromiseModule.reject(PurchaseErrorModule.TwoFactorNeeded) elseif Result.transactionStatus == 24 then PromiseModule.reject(PurchaseErrorModule.TwoFactorNeeded) elseif IsGenericChallengeResponseModule(Result) then PromiseModule.reject(Result) elseif IsEconomicRestrictionResponseFunction(Result) then PromiseModule.reject(Result) elseif FFlagEnablePriceChangedErrorHandlingModule and Result.reason == ConstantsModule.PurchaseFailureReason.PriceChanged then PromiseModule.reject(PurchaseErrorModule.PriceChanged) else PromiseModule.reject(PurchaseErrorModule.UnknownFailure)
	end, function(_)
		-- upvalues: PromiseModule (upval), PurchaseErrorModule (upval)
		return PromiseModule.reject(PurchaseErrorModule.UnknownFailure)
	end)
end