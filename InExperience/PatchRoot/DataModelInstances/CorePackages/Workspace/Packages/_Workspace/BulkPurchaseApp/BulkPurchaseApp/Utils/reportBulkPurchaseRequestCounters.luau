local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local loggingProtocolModule = require(bulkPurchaseApp.Parent.LoggingProtocol)
local bulkPurchaseCountersEnumModule = require(bulkPurchaseApp.Enums.BulkPurchaseCountersEnum)
local fFlagAXAddPlusUpsellToBulkPurchaseModule = require(bulkPurchaseApp.Flags.FFlagAXAddPlusUpsellToBulkPurchase)
local t = {
	[bulkPurchaseCountersEnumModule.BulkPurchaseRequestedCounter] = {
		throttlingPercentage = 100,
		description = "Counter fired when bulk purchase is requested",
		links = "",
		eventName = bulkPurchaseCountersEnumModule.BulkPurchaseRequestedCounter,
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 9, 23 }
	},
	[bulkPurchaseCountersEnumModule.BulkPurchaseSucceededCounter] = {
		throttlingPercentage = 100,
		description = "Counter fired when bulk purchase has succeeded",
		links = "",
		eventName = bulkPurchaseCountersEnumModule.BulkPurchaseSucceededCounter,
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 9, 23 }
	},
	[bulkPurchaseCountersEnumModule.BulkPurchaseFailedCounter] = {
		throttlingPercentage = 100,
		description = "Counter fired when bulk purchase has failed",
		links = "",
		eventName = bulkPurchaseCountersEnumModule.BulkPurchaseFailedCounter,
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 9, 23 }
	},
	[bulkPurchaseCountersEnumModule.BulkPurchaseRefreshFailedCounter] = {
		throttlingPercentage = 100,
		description = "Counter fired when bulk purchase refresh has failed",
		links = "",
		eventName = bulkPurchaseCountersEnumModule.BulkPurchaseRefreshFailedCounter,
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 9, 23 }
	},
	[bulkPurchaseCountersEnumModule.BulkPurchasePlusUpsellInitatedCounter] = {
		throttlingPercentage = 100,
		description = "Counter fired when bulk purchase server plus upsell is initiated",
		links = "",
		eventName = bulkPurchaseCountersEnumModule.BulkPurchasePlusUpsellInitatedCounter,
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 9, 23 }
	},
	[bulkPurchaseCountersEnumModule.BulkPurchasePlusUpsellSucceededCounter] = {
		throttlingPercentage = 100,
		description = "Counter fired when bulk purchase server plus upsell is successful",
		links = "",
		eventName = bulkPurchaseCountersEnumModule.BulkPurchasePlusUpsellSucceededCounter,
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 9, 23 }
	},
	[bulkPurchaseCountersEnumModule.BulkPurchasePlusUpsellFailedCounter] = {
		throttlingPercentage = 100,
		description = "Counter fired when bulk purchase server plus upsell has failed",
		links = "",
		eventName = bulkPurchaseCountersEnumModule.BulkPurchasePlusUpsellFailedCounter,
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 9, 23 }
	}
}

return function(p1)
	-- upvalues: loggingProtocolModule (ref), t (ref), fFlagAXAddPlusUpsellToBulkPurchaseModule (ref)
	loggingProtocolModule.default:logRobloxTelemetryCounter(t[p1], 1, {
		FFlagAXAddPlusUpsellToBulkPurchase = tostring(fFlagAXAddPlusUpsellToBulkPurchaseModule)
	})
end