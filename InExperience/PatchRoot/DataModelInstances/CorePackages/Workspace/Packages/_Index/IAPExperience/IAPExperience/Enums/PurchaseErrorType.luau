local parent = script.Parent.Parent
local parent_1 = parent.Parent
local addRawValueMethodToEnumModule = require(parent.Utility.addRawValueMethodToEnum)
local t = {
	None = "None",
	Unknown = "Unknown",
	AlreadyOwn = "AlreadyOwn",
	FailedGrant = "FailedGrant",
	FailedGrantUnknown = "FailedGrantUnknown",
	Limited = "Limited",
	NotEnoughRobux = "NotEnoughRobux",
	NotEnoughRobuxInApp = "NotEnoughRobuxInApp",
	NotForSale = "NotForSale",
	NotForSaleExperience = "NotForSaleExperience",
	PremiumOnly = "PremiumOnly",
	ThirdPartyDisabled = "ThirdPartyDisabled",
	Under13 = "Under13",
	PremiumPlatformUnavailable = "PremiumPlatformUnavailable",
	AlreadyPremium = "AlreadyPremium",
	PurchaseLimit = "PurchaseLimit",
	ParentalLimit = "ParentalLimit",
	AlreadySubscribed = "AlreadySubscribed",
	SubscriptionNotForSale = "SubscriptionNotForSale",
	SubscriptionExceededUserSpendLimit = "SubscriptionExceededUserSpendLimit",
	SubscriptionUnsupportedLocale = "SubscriptionUnsupportedLocale",
	RestrictedUser = "RestrictedUser",
	SubscriptionPurchasePlatformNotSupported = "SubscriptionPurchasePlatformNotSupported",
	SubscriptionInvalidSaleLocation = "SubscriptionInvalidSaleLocation",
	VpcRequired = "VpcRequired",
	FailedRobuxPurchase = "FailedRobuxPurchase",
	ExceedParentalSpendLimit = "ExceedParentalSpendLimit",
	EconomicRestriction = "EconomicRestriction"
}
local var1 = require(parent_1.enumerate)(script.Name, t)
addRawValueMethodToEnumModule(var1, t)

return var1