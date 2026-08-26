local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local purchaseErrorModule = require(purchasePrompt.Enums.PurchaseError)
local isErrorReasonPrefixWithEconomicRestrictions = require(purchasePrompt.Parent.IAPExperience).Utility.isErrorReasonPrefixWithEconomicRestrictions

return function(p1)
	-- upvalues: purchaseErrorModule (ref), isErrorReasonPrefixWithEconomicRestrictions (ref)
	return if p1 == "UserHasSpendLimitSet" then purchaseErrorModule.SubscriptionExceededUserSpendLimit elseif p1 == "UnsupportedLocale" then purchaseErrorModule.SubscriptionUnsupportedLocale elseif p1 == "RestrictedUser" then purchaseErrorModule.RestrictedUser elseif p1 == "PurchasePlatformNotSupported" then purchaseErrorModule.SubscriptionPurchasePlatformNotSupported elseif p1 == "InvalidSaleLocation" then purchaseErrorModule.SubscriptionInvalidSaleLocation elseif p1 == "UserAlreadySubscribed" then purchaseErrorModule.AlreadySubscribed elseif p1 == "ProductNotForSale" then purchaseErrorModule.SubscriptionNotForSale elseif p1 == "VpcRequired" then purchaseErrorModule.VpcRequired elseif p1 == "ExceedParentalSpendLimit" then purchaseErrorModule.ExceedParentalSpendLimit elseif isErrorReasonPrefixWithEconomicRestrictions(p1) then p1 else purchaseErrorModule.UnknownFailure
end