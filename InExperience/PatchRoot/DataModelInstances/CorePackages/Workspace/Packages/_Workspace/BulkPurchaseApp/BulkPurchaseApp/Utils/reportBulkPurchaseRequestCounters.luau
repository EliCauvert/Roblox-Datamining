local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local LoggingProtocolModule = require(BulkPurchaseApp.Parent.LoggingProtocol)
local BulkPurchaseCountersEnumModule = require(BulkPurchaseApp.Enums.BulkPurchaseCountersEnum)
local FFlagAXAddPlusUpsellToBulkPurchaseModule = require(BulkPurchaseApp.Flags.FFlagAXAddPlusUpsellToBulkPurchase)
local config = {
	[BulkPurchaseCountersEnumModule.BulkPurchaseRequestedCounter] = {
		throttlingPercentage = 100,
		description = "Counter fired when bulk purchase is requested",
		links = "",
		eventName = BulkPurchaseCountersEnumModule.BulkPurchaseRequestedCounter,
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 9, 23 }
	},
	[BulkPurchaseCountersEnumModule.BulkPurchaseSucceededCounter] = {
		throttlingPercentage = 100,
		description = "Counter fired when bulk purchase has succeeded",
		links = "",
		eventName = BulkPurchaseCountersEnumModule.BulkPurchaseSucceededCounter,
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 9, 23 }
	},
	[BulkPurchaseCountersEnumModule.BulkPurchaseFailedCounter] = {
		throttlingPercentage = 100,
		description = "Counter fired when bulk purchase has failed",
		links = "",
		eventName = BulkPurchaseCountersEnumModule.BulkPurchaseFailedCounter,
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 9, 23 }
	},
	[BulkPurchaseCountersEnumModule.BulkPurchaseRefreshFailedCounter] = {
		throttlingPercentage = 100,
		description = "Counter fired when bulk purchase refresh has failed",
		links = "",
		eventName = BulkPurchaseCountersEnumModule.BulkPurchaseRefreshFailedCounter,
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 9, 23 }
	},
	[BulkPurchaseCountersEnumModule.BulkPurchasePlusUpsellInitatedCounter] = {
		throttlingPercentage = 100,
		description = "Counter fired when bulk purchase server plus upsell is initiated",
		links = "",
		eventName = BulkPurchaseCountersEnumModule.BulkPurchasePlusUpsellInitatedCounter,
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 9, 23 }
	},
	[BulkPurchaseCountersEnumModule.BulkPurchasePlusUpsellSucceededCounter] = {
		throttlingPercentage = 100,
		description = "Counter fired when bulk purchase server plus upsell is successful",
		links = "",
		eventName = BulkPurchaseCountersEnumModule.BulkPurchasePlusUpsellSucceededCounter,
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 9, 23 }
	},
	[BulkPurchaseCountersEnumModule.BulkPurchasePlusUpsellFailedCounter] = {
		throttlingPercentage = 100,
		description = "Counter fired when bulk purchase server plus upsell has failed",
		links = "",
		eventName = BulkPurchaseCountersEnumModule.BulkPurchasePlusUpsellFailedCounter,
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 9, 23 }
	}
}

return function(p1)
	-- upvalues: LoggingProtocolModule (copy), config (copy), FFlagAXAddPlusUpsellToBulkPurchaseModule (copy)
	LoggingProtocolModule.default:logRobloxTelemetryCounter(config[p1], 1, {
		FFlagAXAddPlusUpsellToBulkPurchase = tostring(FFlagAXAddPlusUpsellToBulkPurchaseModule)
	})
end