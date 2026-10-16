local HttpModule = require(script:FindFirstAncestor("DataHydration").Parent.Http)

return {
	pollIntervalSeconds = 30,
	quotaSummaryUrl = `{HttpModule.Url.APIS_URL}credit-metering-service/v1/quotaSummary`,
	dailyLimitUrl = `{HttpModule.Url.APIS_URL}credit-metering-service/v1/dailyLimit`
}