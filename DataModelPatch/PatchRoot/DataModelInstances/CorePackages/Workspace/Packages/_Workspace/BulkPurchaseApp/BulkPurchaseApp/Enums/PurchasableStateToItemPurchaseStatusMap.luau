local PurchasableStateEnumModule = require(script.Parent.PurchasableStateEnum)

return {
	[PurchasableStateEnumModule.Unknown] = Enum.MarketplaceItemPurchaseStatus.SystemError,
	[PurchasableStateEnumModule.AlreadyOwned] = Enum.MarketplaceItemPurchaseStatus.AlreadyOwned,
	[PurchasableStateEnumModule.QuantityLimitExceeded] = Enum.MarketplaceItemPurchaseStatus.QuantityLimitExceeded,
	[PurchasableStateEnumModule.NotForSale] = Enum.MarketplaceItemPurchaseStatus.NotForSale,
	[PurchasableStateEnumModule.SoldOut] = Enum.MarketplaceItemPurchaseStatus.NotForSale
}