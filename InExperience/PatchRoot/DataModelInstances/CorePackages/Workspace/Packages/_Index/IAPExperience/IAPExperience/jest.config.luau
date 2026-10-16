local JestConfigsModule = require(script.Parent.Parent.Dev.JestConfigs)

return {
	displayName = "IAPExperience",
	testMatch = {
		"**/*.test", "!**/EconomicRestriction/**", "!**/Generic/DiscountRow.test",
		"!**/Generic/DiscountSummary.test", "!**/Generic/PriceLineItem.test",
		"!**/Generic/PriceSummary.test", "!**/Generic/PriceSummaryV2.test",
		"!**/Generic/UnifiedProductDetails.test"
	},
	setupFilesAfterEnv = {
		JestConfigsModule.setupFiles.UIBloxInitializer,
		JestConfigsModule.setupFiles.createPromiseRejectionHandler(),
		JestConfigsModule.setupFiles.RetryTimes
	}
}