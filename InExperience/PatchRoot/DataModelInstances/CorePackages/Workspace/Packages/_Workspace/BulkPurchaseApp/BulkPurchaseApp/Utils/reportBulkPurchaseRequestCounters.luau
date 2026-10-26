local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local LoggingProtocolModule = require(BulkPurchaseApp.Parent.LoggingProtocol)
local BulkPurchaseCountersEnumModule = require(BulkPurchaseApp.Enums.BulkPurchaseCountersEnum)
local FFlagAXAddPlusUpsellToBulkPurchaseModule = require(BulkPurchaseApp.Flags.FFlagAXAddPlusUpsellToBulkPurchase)
local FFlagAXMoreBulkPurchaseCountersModule = require(BulkPurchaseApp.Flags.FFlagAXMoreBulkPurchaseCounters)
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
	},
	[BulkPurchaseCountersEnumModule.BulkPurchasePartialSuccessCounter] = {
		throttlingPercentage = 100,
		description = "Counter fired when bulk purchase has partially succeeded",
		links = "",
		eventName = BulkPurchaseCountersEnumModule.BulkPurchasePartialSuccessCounter,
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 10, 26 }
	}
}

return function(p1, List)
	-- upvalues: FFlagAXAddPlusUpsellToBulkPurchaseModule (copy), FFlagAXMoreBulkPurchaseCountersModule (copy), LoggingProtocolModule (copy), config (copy)
	local config1 = {
		FFlagAXAddPlusUpsellToBulkPurchase = tostring(FFlagAXAddPlusUpsellToBulkPurchaseModule)
	}
	
	if FFlagAXMoreBulkPurchaseCountersModule and List then
		for i, value in List do
			config1[i] = value
		end
	end
	LoggingProtocolModule.default:logRobloxTelemetryCounter(config[p1], 1, config1)
end