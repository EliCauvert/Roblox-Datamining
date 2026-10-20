local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local PurchaseErrorModule = require(PurchasePrompt.Enums.PurchaseError)
local IsErrorReasonPrefixWithEconomicRestrictionsFunction = require(PurchasePrompt.Parent.IAPExperience).Utility.isErrorReasonPrefixWithEconomicRestrictions

return function(p1)
	-- upvalues: PurchaseErrorModule (copy), IsErrorReasonPrefixWithEconomicRestrictionsFunction (copy)
	return if p1 == "UserHasSpendLimitSet" then PurchaseErrorModule.SubscriptionExceededUserSpendLimit elseif p1 == "UnsupportedLocale" then PurchaseErrorModule.SubscriptionUnsupportedLocale elseif p1 == "RestrictedUser" then PurchaseErrorModule.RestrictedUser elseif p1 == "PurchasePlatformNotSupported" then PurchaseErrorModule.SubscriptionPurchasePlatformNotSupported elseif p1 == "InvalidSaleLocation" then PurchaseErrorModule.SubscriptionInvalidSaleLocation elseif p1 == "UserAlreadySubscribed" then PurchaseErrorModule.AlreadySubscribed elseif p1 == "ProductNotForSale" then PurchaseErrorModule.SubscriptionNotForSale elseif p1 == "VpcRequired" then PurchaseErrorModule.VpcRequired elseif p1 == "ExceedParentalSpendLimit" then PurchaseErrorModule.ExceedParentalSpendLimit elseif IsErrorReasonPrefixWithEconomicRestrictionsFunction(p1) then p1 else PurchaseErrorModule.UnknownFailure
end