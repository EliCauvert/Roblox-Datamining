local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local purchaseErrorModule = require(purchasePrompt.Enums.PurchaseError)
local isErrorReasonPrefixWithEconomicRestrictions = require(purchasePrompt.Parent.IAPExperience).Utility.isErrorReasonPrefixWithEconomicRestrictions

return function(p0) --[[ line: 8 | named "parseSubscriptionError" ]]
	-- upvalues: purchaseErrorModule (ref), isErrorReasonPrefixWithEconomicRestrictions (ref)
	return if p0 == "UserHasSpendLimitSet" then purchaseErrorModule.SubscriptionExceededUserSpendLimit elseif p0 == "UnsupportedLocale" then purchaseErrorModule.SubscriptionUnsupportedLocale elseif p0 == "RestrictedUser" then purchaseErrorModule.RestrictedUser elseif p0 == "PurchasePlatformNotSupported" then purchaseErrorModule.SubscriptionPurchasePlatformNotSupported elseif p0 == "InvalidSaleLocation" then purchaseErrorModule.SubscriptionInvalidSaleLocation elseif p0 == "UserAlreadySubscribed" then purchaseErrorModule.AlreadySubscribed elseif p0 == "ProductNotForSale" then purchaseErrorModule.SubscriptionNotForSale elseif p0 == "VpcRequired" then purchaseErrorModule.VpcRequired elseif p0 == "ExceedParentalSpendLimit" then purchaseErrorModule.ExceedParentalSpendLimit elseif isErrorReasonPrefixWithEconomicRestrictions(p0) then p0 else purchaseErrorModule.UnknownFailure
end