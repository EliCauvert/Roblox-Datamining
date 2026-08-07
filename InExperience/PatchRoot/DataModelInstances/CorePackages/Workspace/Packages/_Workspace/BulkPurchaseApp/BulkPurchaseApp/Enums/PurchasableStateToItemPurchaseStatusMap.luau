local purchasableStateEnumModule = require(script.Parent.PurchasableStateEnum)

return {
	[purchasableStateEnumModule.Unknown] = Enum.MarketplaceItemPurchaseStatus.SystemError,
	[purchasableStateEnumModule.AlreadyOwned] = Enum.MarketplaceItemPurchaseStatus.AlreadyOwned,
	[purchasableStateEnumModule.QuantityLimitExceeded] = Enum.MarketplaceItemPurchaseStatus.QuantityLimitExceeded,
	[purchasableStateEnumModule.NotForSale] = Enum.MarketplaceItemPurchaseStatus.NotForSale,
	[purchasableStateEnumModule.SoldOut] = Enum.MarketplaceItemPurchaseStatus.NotForSale
}