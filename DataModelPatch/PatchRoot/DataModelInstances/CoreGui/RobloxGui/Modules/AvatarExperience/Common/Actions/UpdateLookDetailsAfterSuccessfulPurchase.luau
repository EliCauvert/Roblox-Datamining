return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(LookId, PurchasedAssetIds, PurchasedBundleIds, IsOwnedAfterPurchase)
	return {
		lookId = LookId,
		purchasedAssetIds = PurchasedAssetIds,
		purchasedBundleIds = PurchasedBundleIds,
		isOwnedAfterPurchase = IsOwnedAfterPurchase
	}
end)