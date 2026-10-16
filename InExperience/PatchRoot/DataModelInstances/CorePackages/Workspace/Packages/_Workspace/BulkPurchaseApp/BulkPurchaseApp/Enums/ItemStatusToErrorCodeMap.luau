local ErrorCodeEnumModule = require(script.Parent.ErrorCodeEnum)

return {
	[Enum.MarketplaceItemPurchaseStatus.NotForSale] = ErrorCodeEnumModule.NotForSale,
	[Enum.MarketplaceItemPurchaseStatus.PriceMismatch] = ErrorCodeEnumModule.PriceMismatch,
	[Enum.MarketplaceItemPurchaseStatus.SoldOut] = ErrorCodeEnumModule.SoldOut,
	[Enum.MarketplaceItemPurchaseStatus.InsufficientRobux] = ErrorCodeEnumModule.InsufficientRobux,
	[Enum.MarketplaceItemPurchaseStatus.QuotaExceeded] = ErrorCodeEnumModule.QuotaExceeded,
	[Enum.MarketplaceItemPurchaseStatus.NotAvailableForPurchaser] = ErrorCodeEnumModule.NotAvailableForPurchaser,
	[Enum.MarketplaceItemPurchaseStatus.AlreadyOwned] = ErrorCodeEnumModule.AlreadyOwned,
	[Enum.MarketplaceItemPurchaseStatus.PurchaserIsSeller] = ErrorCodeEnumModule.PurchaserIsSeller,
	[Enum.MarketplaceItemPurchaseStatus.QuantityLimitExceeded] = ErrorCodeEnumModule.QuantityLimitExceeded,
	[Enum.MarketplaceItemPurchaseStatus.InsufficientMembership] = ErrorCodeEnumModule.InsufficientMembership,
	[Enum.MarketplaceItemPurchaseStatus.Success] = ErrorCodeEnumModule.Generic,
	[Enum.MarketplaceItemPurchaseStatus.SystemError] = ErrorCodeEnumModule.Generic,
	[Enum.MarketplaceItemPurchaseStatus.PlaceInvalid] = ErrorCodeEnumModule.PlaceInvalid
}