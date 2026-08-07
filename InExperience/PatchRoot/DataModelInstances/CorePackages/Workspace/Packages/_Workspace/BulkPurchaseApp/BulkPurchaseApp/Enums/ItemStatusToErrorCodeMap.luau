local errorCodeEnumModule = require(script.Parent.ErrorCodeEnum)

return {
	[Enum.MarketplaceItemPurchaseStatus.NotForSale] = errorCodeEnumModule.NotForSale,
	[Enum.MarketplaceItemPurchaseStatus.PriceMismatch] = errorCodeEnumModule.PriceMismatch,
	[Enum.MarketplaceItemPurchaseStatus.SoldOut] = errorCodeEnumModule.SoldOut,
	[Enum.MarketplaceItemPurchaseStatus.InsufficientRobux] = errorCodeEnumModule.InsufficientRobux,
	[Enum.MarketplaceItemPurchaseStatus.QuotaExceeded] = errorCodeEnumModule.QuotaExceeded,
	[Enum.MarketplaceItemPurchaseStatus.NotAvailableForPurchaser] = errorCodeEnumModule.NotAvailableForPurchaser,
	[Enum.MarketplaceItemPurchaseStatus.AlreadyOwned] = errorCodeEnumModule.AlreadyOwned,
	[Enum.MarketplaceItemPurchaseStatus.PurchaserIsSeller] = errorCodeEnumModule.PurchaserIsSeller,
	[Enum.MarketplaceItemPurchaseStatus.QuantityLimitExceeded] = errorCodeEnumModule.QuantityLimitExceeded,
	[Enum.MarketplaceItemPurchaseStatus.InsufficientMembership] = errorCodeEnumModule.InsufficientMembership,
	[Enum.MarketplaceItemPurchaseStatus.Success] = errorCodeEnumModule.Generic,
	[Enum.MarketplaceItemPurchaseStatus.SystemError] = errorCodeEnumModule.Generic,
	[Enum.MarketplaceItemPurchaseStatus.PlaceInvalid] = errorCodeEnumModule.PlaceInvalid
}