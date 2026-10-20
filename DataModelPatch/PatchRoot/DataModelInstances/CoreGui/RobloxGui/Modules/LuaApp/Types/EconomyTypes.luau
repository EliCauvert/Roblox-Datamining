local TModule = require(game:GetService("CorePackages").Packages.t)

return {
	PurchaseDetail = TModule.strictInterface({
		expectedCurrency = TModule.optional(TModule.integer),
		expectedPrice = TModule.optional(TModule.integer),
		expectedSellerId = TModule.optional(TModule.integer),
		expectedPromoId = TModule.optional(TModule.integer),
		userAssetId = TModule.optional(TModule.integer),
		saleLocationType = TModule.optional(TModule.union(TModule.literal("Website"), TModule.literal("Game"))),
		saleLocationId = TModule.optional(TModule.string)
	})
}