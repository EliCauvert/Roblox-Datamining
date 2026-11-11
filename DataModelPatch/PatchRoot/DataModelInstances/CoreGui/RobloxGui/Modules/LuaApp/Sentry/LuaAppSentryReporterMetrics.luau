local TelemetryService = game:GetService("TelemetryService")
local config = {
	eventName = "LuaAppSentryReporterInit",
	description = "Counter to track SentryReporter initialization success and failure.",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 2026, 2, 19 }
}
local config1 = {
	eventName = "LuaAppSentryReporterErrorSent",
	description = "Track successful and failed error reports to Sentry",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 2026, 2, 19 }
}
local config2 = {
	eventName = "LuaAppSentryReporterLogAttachment",
	description = "Track successful and failed log attachments to Sentry",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 2026, 2, 19 }
}

return {
	logInitSuccess = function()
		-- upvalues: TelemetryService (copy), config (copy)
		TelemetryService:LogCounter(config, { customFields = { isSuccess = "true" } }, 1)
	end,
	logInitFailure = function()
		-- upvalues: TelemetryService (copy), config (copy)
		TelemetryService:LogCounter(config, { customFields = { isSuccess = "false" } }, 1)
	end,
	logErrorSentSuccess = function()
		-- upvalues: TelemetryService (copy), config1 (copy)
		TelemetryService:LogCounter(config1, { customFields = { isSuccess = "true" } }, 1)
	end,
	logErrorSentFailure = function()
		-- upvalues: TelemetryService (copy), config1 (copy)
		TelemetryService:LogCounter(config1, { customFields = { isSuccess = "false" } }, 1)
	end,
	logLogAttachmentSuccess = function()
		-- upvalues: TelemetryService (copy), config2 (copy)
		TelemetryService:LogCounter(config2, { customFields = { isSuccess = "true" } }, 1)
	end,
	logLogAttachmentFailure = function()
		-- upvalues: TelemetryService (copy), config2 (copy)
		TelemetryService:LogCounter(config2, { customFields = { isSuccess = "false" } }, 1)
	end
}