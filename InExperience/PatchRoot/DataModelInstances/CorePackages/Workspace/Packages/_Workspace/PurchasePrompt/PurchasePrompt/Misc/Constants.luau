local strictModule = require(script.Parent.Parent.strict)

return strictModule({
	ABTests = strictModule({
		PRODUCT_PURCHASE = "AllUsers.Payments.ProductPurchaseABTest",
		PRODUCT_PURCHASE_UPSELL = "AllUsers.Payments.ProductPurchaseRobuxUpsellABTest",
		PRODUCT_PURCHASE_UPSELL_UWP = "AllUsers.Payments.ProductPurchaseRobuxUpsellABTestUWP",
		PRODUCT_PURCHASE_UPSELL_AMAZON = "AllUsers.Payments.ProductPurchaseRobuxUpsellABTestAmazon",
		PRODUCT_PURCHASE_UPSELL_XBOX = "AllUsers.Payments.ProductPurchaseRobuxUpsellABTestXbox"
	}, "Constants.ABTests"),
	PlatformPurchaseResult = strictModule({
		PurchaseResult_Error = -1,
		PurchaseResult_Success = 0,
		PurchaseResult_UserCancelled = 1,
		PurchaseResult_ConsumeRequestFail = 2,
		PurchaseResult_RobuxUpdated = 3,
		PurcahseResult_NoActionNeeded = 4
	}, "Constants.PlatformPurchaseResult"),
	PurchaseFailureReason = strictModule({
		TwoStepVerificationRequired = "TwoStepVerificationRequired",
		EconomyDisabled = "EconomyDisabled",
		PriceChanged = "PriceChanged"
	}, "Constants.TransactionStatus"),
	ProductType = strictModule({
		CollectibleItem = "Collectible Item",
		DeveloperProduct = "Developer Product",
		Asset = "Asset",
		Bundle = "Bundle"
	}, "Constants.ProductType"),
	Currency = strictModule({ Robux = 1 }, "Constants.Currency"),
	TermsOfUse = strictModule({
		DMCCAUrl = "https://en.help.roblox.com/hc/en-us/articles/115004647846-Roblox-Terms-of-Use#robux-and-premium-membership"
	}, "Constants.TermsOfUse"),
	PerformanceMetrics = strictModule({
		Prefix = strictModule({
			UnifiedPurchaseModal = "UnifiedPurchaseModal",
			PurchaseModal = "PurchaseModal",
			RobuxUpsellModal = "RobuxUpsellModal"
		}, "Constants.PerformanceMetrics.Prefix"),
		IntervalName = strictModule({
			ProductPurchaseContainerShown = "ProductPurchaseContainerShown",
			RobuxUpsellModalShown = "RobuxUpsellModalShown"
		}, "Constants.PerformanceMetrics.IntervalName")
	}, "Constants.PerformanceMetrics")
}, "Constants")