local telemetryService = game:GetService("TelemetryService")
local loggingProtocolModule = require(script:FindFirstAncestor("ShareSheet").Parent.LoggingProtocol)
local eventIngest = loggingProtocolModule.TelemetryBackends.EventIngest
local shareSheetTelemetryThrottleHundredthsPercent = game:DefineFastInt("ShareSheetTelemetryThrottleHundredthsPercent", 10000)
local t = {
	shareSheetOpened = {
		eventName = "shareSheetOpened",
		description = "Share sheet was opened",
		backends = { eventIngest },
		throttlingPercentage = shareSheetTelemetryThrottleHundredthsPercent,
		lastUpdated = { 2025, 7, 22 }
	},
	shareSheetLinkCopied = {
		eventName = "shareSheetLinkCopied",
		description = "Link was copied from share sheet",
		backends = { eventIngest },
		throttlingPercentage = shareSheetTelemetryThrottleHundredthsPercent,
		lastUpdated = { 2025, 7, 22 }
	},
	shareSheetMessageSent = {
		eventName = "shareSheetMessageSent",
		description = "Message was sent from share sheet",
		backends = { eventIngest },
		throttlingPercentage = shareSheetTelemetryThrottleHundredthsPercent,
		lastUpdated = { 2025, 7, 22 }
	},
	Lifecycle = {
		eventName = "shareSheetLifecycle",
		description = "Share sheet request lifecycle transitions",
		backends = { eventIngest },
		throttlingPercentage = shareSheetTelemetryThrottleHundredthsPercent,
		lastUpdated = { 2026, 8, 3 }
	},
	Interaction = {
		eventName = "shareSheetInteraction",
		description = "User interactions within the share sheet",
		backends = { eventIngest },
		throttlingPercentage = shareSheetTelemetryThrottleHundredthsPercent,
		lastUpdated = { 2026, 8, 3 }
	}
}
local list = {
	"addPlaceId",
	"addUniverseId",
	"addPlaySessionId",
	"addSessionInfo"
}
local t_1 = {
	LifecycleType = { Open = "open", Close = "close" },
	CloseReason = {
		UserDismissed = "userDismissed",
		SendSuccess = "sendSuccess",
		Programmatic = "programmatic",
		Replaced = "replaced"
	},
	InteractionType = {
		CopyLink = "copyLink",
		NativeShare = "nativeShare",
		ConversationSelected = "conversationSelected",
		ConversationDeselected = "conversationDeselected",
		CustomMessageComposerFocused = "customMessageComposerFocused",
		CustomMessageSubmitted = "customMessageSubmitted"
	},
	logShareSheetOpened = function(p0)
		-- upvalues: telemetryService (ref), t (ref), list (ref)
		telemetryService:LogEvent(t.shareSheetOpened, { standardizedFields = list, customFields = p0 })
	end,
	logShareSheetLinkCopied = function(p1)
		-- upvalues: telemetryService (ref), t (ref), list (ref)
		telemetryService:LogEvent(t.shareSheetLinkCopied, { standardizedFields = list, customFields = p1 })
	end,
	logShareSheetMessageSent = function(p2)
		-- upvalues: telemetryService (ref), t (ref), list (ref)
		telemetryService:LogEvent(t.shareSheetMessageSent, { standardizedFields = list, customFields = p2 })
	end
}
local t_2 = {
	eventName = "shareSheetOpened",
	description = "Count of share sheet requests opened",
	backends = { loggingProtocolModule.TelemetryBackends.Counter },
	throttlingPercentage = shareSheetTelemetryThrottleHundredthsPercent,
	lastUpdated = { 2026, 8, 3 }
}
local t_3 = {
	eventName = "shareSheetClosed",
	description = "Count of share sheet requests closed",
	backends = { loggingProtocolModule.TelemetryBackends.Counter },
	throttlingPercentage = shareSheetTelemetryThrottleHundredthsPercent,
	lastUpdated = { 2026, 8, 3 }
}
local t_4 = {
	eventName = "shareSheetInteraction",
	description = "Count of share sheet interactions",
	backends = { loggingProtocolModule.TelemetryBackends.Counter },
	throttlingPercentage = shareSheetTelemetryThrottleHundredthsPercent,
	lastUpdated = { 2026, 8, 3 }
}

function t_1.logLifecycle(p3)
	-- upvalues: telemetryService (ref), t (ref), list (ref), t_1 (ref), t_2 (ref), t_3 (ref)
	telemetryService:LogEvent(t.Lifecycle, { standardizedFields = list, customFields = p3 })
	telemetryService:LogCounter(if p3.lifecycleType == t_1.LifecycleType.Open then t_2 else t_3, {
		customFields = { context = p3.context, closeReason = p3.closeReason }
	}, 1)
end

function t_1.logInteraction(p4)
	-- upvalues: telemetryService (ref), t (ref), list (ref), t_4 (ref)
	telemetryService:LogEvent(t.Interaction, { standardizedFields = list, customFields = p4 })
	telemetryService:LogCounter(t_4, {
		customFields = {
			context = p4.context,
			interactionType = p4.interactionType
		}
	}, 1)
end

return t_1