local config = {
	INSUFFICIENT_ROBUX = Enum.MarketplaceItemPurchaseStatus.InsufficientRobux,
	QUOTA_EXCEEDED = Enum.MarketplaceItemPurchaseStatus.QuotaExceeded,
	NOT_FOR_SALE = Enum.MarketplaceItemPurchaseStatus.NotForSale,
	NOT_AVAILABLE_FOR_PURCHASER = Enum.MarketplaceItemPurchaseStatus.NotAvailableForPurchaser,
	PRICE_MISMATCH = Enum.MarketplaceItemPurchaseStatus.PriceMismatch,
	SOLD_OUT = Enum.MarketplaceItemPurchaseStatus.SoldOut,
	PURCHASER_IS_SELLER = Enum.MarketplaceItemPurchaseStatus.PurchaserIsSeller,
	QUANTITY_LIMIT_EXCEEDED = Enum.MarketplaceItemPurchaseStatus.QuantityLimitExceeded,
	ALREADY_OWNED = Enum.MarketplaceItemPurchaseStatus.AlreadyOwned,
	INSUFFICIENT_MEMBERSHIP = Enum.MarketplaceItemPurchaseStatus.InsufficientMembership,
	PURCHASE_PLACE_INVALID = Enum.MarketplaceItemPurchaseStatus.PlaceInvalid
}

return function(p1) --[[ Line: 20 | Named "lineItemToStatus" ]]
	-- upvalues: config (copy)
	local Entry = config[p1.errorReason]
	
	return if p1.status == "SUCCEEDED" then Enum.MarketplaceItemPurchaseStatus.Success elseif Entry then Entry else Enum.MarketplaceItemPurchaseStatus.SystemError
end