local telemetryService = game:GetService("TelemetryService")
local shareSheet = script:FindFirstAncestor("ShareSheet")
local parent = shareSheet.Parent
local _ = require(parent.AppChat.GetExternalChatMessageSenderStore)
local loggingProtocolModule = require(parent.LoggingProtocol)
local getElapsedTimeMsModule = require(shareSheet.getElapsedTimeMs)
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
	},
	MessageSendResult = {
		eventName = "shareSheetMessageSendResult",
		description = "Per-recipient share sheet message send results",
		backends = { eventIngest },
		throttlingPercentage = shareSheetTelemetryThrottleHundredthsPercent,
		lastUpdated = { 2026, 9, 8 }
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
		CustomMessageSubmitted = "customMessageSubmitted",
		ViewMessage = "viewMessage"
	},
	ViewDestination = {
		Conversation = "conversation",
		ChatLanding = "chatLanding"
	},
	logShareSheetOpened = function(p1)
		-- upvalues: telemetryService (ref), t (ref), list (ref)
		telemetryService:LogEvent(t.shareSheetOpened, { standardizedFields = list, customFields = p1 })
	end,
	logShareSheetLinkCopied = function(p1)
		-- upvalues: telemetryService (ref), t (ref), list (ref)
		telemetryService:LogEvent(t.shareSheetLinkCopied, { standardizedFields = list, customFields = p1 })
	end,
	logShareSheetMessageSent = function(p1)
		-- upvalues: telemetryService (ref), t (ref), list (ref)
		telemetryService:LogEvent(t.shareSheetMessageSent, { standardizedFields = list, customFields = p1 })
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
local t_5 = {
	eventName = "shareSheetMessageSendResult",
	description = "Count of per-recipient share sheet message send results",
	backends = { loggingProtocolModule.TelemetryBackends.Counter },
	throttlingPercentage = shareSheetTelemetryThrottleHundredthsPercent,
	lastUpdated = { 2026, 9, 8 }
}
local t_6 = {
	eventName = "shareSheetMessageSendResultDurationMs",
	description = "Duration in milliseconds from recipient send invocation to result",
	backends = { loggingProtocolModule.TelemetryBackends.Stats },
	throttlingPercentage = shareSheetTelemetryThrottleHundredthsPercent,
	lastUpdated = { 2026, 9, 8 }
}

function t_1.logLifecycle(p1)
	-- upvalues: telemetryService (ref), t (ref), list (ref), t_1 (ref), t_2 (ref), t_3 (ref)
	telemetryService:LogEvent(t.Lifecycle, { standardizedFields = list, customFields = p1 })
	telemetryService:LogCounter(if p1.lifecycleType == t_1.LifecycleType.Open then t_2 else t_3, {
		customFields = { context = p1.context, closeReason = p1.closeReason }
	}, 1)
end

function t_1.logInteraction(p1)
	-- upvalues: telemetryService (ref), t (ref), list (ref), t_4 (ref)
	telemetryService:LogEvent(t.Interaction, { standardizedFields = list, customFields = p1 })
	telemetryService:LogCounter(t_4, {
		customFields = {
			context = p1.context,
			interactionType = p1.interactionType
		}
	}, 1)
end

function t_1.logMessageSendResult(p1)
	-- upvalues: telemetryService (ref), t (ref), list (ref), t_6 (ref), t_5 (ref)
	telemetryService:LogEvent(t.MessageSendResult, { standardizedFields = list, customFields = p1 })
	telemetryService:LogStat(t_6, {
		customFields = {
			context = p1.context,
			sendStatus = p1.sendStatus,
			hasCustomMessage = p1.hasCustomMessage
		}
	}, p1.durationMs)
	telemetryService:LogCounter(t_5, {
		customFields = {
			context = p1.context,
			sendStatus = p1.sendStatus,
			hasCustomMessage = p1.hasCustomMessage
		}
	}, 1)
end

function t_1.startMessageSendResult(p1)
	-- upvalues: t_1 (ref), getElapsedTimeMsModule (ref)
	local processTime = os.clock()
	
	return function(p2)
		-- upvalues: t_1 (copy), p1 (ref), getElapsedTimeMsModule (copy), processTime (ref)
		t_1.logMessageSendResult({
			context = p1.context,
			telemetryId = p1.telemetryId,
			requestedConversationId = p1.requestedConversationId,
			resolvedConversationId = p2.conversationId,
			sendStatus = p2.status,
			hasCustomMessage = p1.hasCustomMessage,
			durationMs = getElapsedTimeMsModule(processTime)
		})
	end
end

return t_1