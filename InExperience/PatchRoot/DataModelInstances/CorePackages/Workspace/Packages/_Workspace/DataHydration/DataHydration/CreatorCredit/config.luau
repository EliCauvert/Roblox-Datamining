local httpModule = require(script:FindFirstAncestor("DataHydration").Parent.Http)

return {
	pollIntervalSeconds = 30,
	quotaSummaryUrl = `{httpModule.Url.APIS_URL}credit-metering-service/v1/quotaSummary`,
	dailyLimitUrl = `{httpModule.Url.APIS_URL}credit-metering-service/v1/dailyLimit`
}