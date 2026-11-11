local Parent = script.Parent.Parent
local config = {
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
local v1 = require(Parent.Parent.enumerate)(script.Name, config)
require(Parent.Utility.addRawValueMethodToEnum)(v1, config)

return v1