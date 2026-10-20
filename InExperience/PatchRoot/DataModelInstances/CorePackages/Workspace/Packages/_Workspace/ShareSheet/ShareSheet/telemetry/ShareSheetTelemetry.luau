local TelemetryService = game:GetService("TelemetryService")
local ShareSheet = script:FindFirstAncestor("ShareSheet")
local Parent = ShareSheet.Parent
local FFlagShareSheetFriendsSort = require(Parent.SharedFlags).FFlagShareSheetFriendsSort
local _ = require(Parent.AppChat.GetExternalChatMessageSenderStore)
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local _ = require(ShareSheet.Recipients.RecipientSource)
local GetElapsedTimeMsModule = require(ShareSheet.getElapsedTimeMs)
local EventIngest = LoggingProtocolModule.TelemetryBackends.EventIngest
local ShareSheetTelemetryThrottleHundredthsPercent = game:DefineFastInt("ShareSheetTelemetryThrottleHundredthsPercent", 10000)
local config = {
	shareSheetOpened = {
		eventName = "shareSheetOpened",
		description = "Share sheet was opened",
		backends = { EventIngest },
		throttlingPercentage = ShareSheetTelemetryThrottleHundredthsPercent,
		lastUpdated = { 2025, 7, 22 }
	},
	shareSheetLinkCopied = {
		eventName = "shareSheetLinkCopied",
		description = "Link was copied from share sheet",
		backends = { EventIngest },
		throttlingPercentage = ShareSheetTelemetryThrottleHundredthsPercent,
		lastUpdated = { 2025, 7, 22 }
	},
	shareSheetMessageSent = {
		eventName = "shareSheetMessageSent",
		description = "Message was sent from share sheet",
		backends = { EventIngest },
		throttlingPercentage = ShareSheetTelemetryThrottleHundredthsPercent,
		lastUpdated = { 2025, 7, 22 }
	},
	Lifecycle = {
		eventName = "shareSheetLifecycle",
		description = "Share sheet request lifecycle transitions",
		backends = { EventIngest },
		throttlingPercentage = ShareSheetTelemetryThrottleHundredthsPercent,
		lastUpdated = { 2026, 8, 3 }
	},
	Interaction = {
		eventName = "shareSheetInteraction",
		description = "User interactions within the share sheet",
		backends = { EventIngest },
		throttlingPercentage = ShareSheetTelemetryThrottleHundredthsPercent,
		lastUpdated = { 2026, 8, 3 }
	},
	MessageSendResult = {
		eventName = "shareSheetMessageSendResult",
		description = "Per-recipient share sheet message send results",
		backends = { EventIngest },
		throttlingPercentage = ShareSheetTelemetryThrottleHundredthsPercent,
		lastUpdated = { 2026, 9, 8 }
	}
}
local StandardizedFields = {
	"addPlaceId",
	"addUniverseId",
	"addPlaySessionId",
	"addSessionInfo"
}
local ShareSheetTelemetryModule = {
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
	logShareSheetOpened = function(CustomFields)
		-- upvalues: TelemetryService (copy), config (copy), StandardizedFields (copy)
		TelemetryService:LogEvent(config.shareSheetOpened, {
			standardizedFields = StandardizedFields,
			customFields = CustomFields
		})
	end,
	logShareSheetLinkCopied = function(CustomFields)
		-- upvalues: TelemetryService (copy), config (copy), StandardizedFields (copy)
		TelemetryService:LogEvent(config.shareSheetLinkCopied, {
			standardizedFields = StandardizedFields,
			customFields = CustomFields
		})
	end,
	logShareSheetMessageSent = function(CustomFields)
		-- upvalues: TelemetryService (copy), config (copy), StandardizedFields (copy)
		TelemetryService:LogEvent(config.shareSheetMessageSent, {
			standardizedFields = StandardizedFields,
			customFields = CustomFields
		})
	end
}
local config1 = {
	eventName = "shareSheetOpened",
	description = "Count of share sheet requests opened",
	backends = { LoggingProtocolModule.TelemetryBackends.Counter },
	throttlingPercentage = ShareSheetTelemetryThrottleHundredthsPercent,
	lastUpdated = { 2026, 8, 3 }
}
local config2 = {
	eventName = "shareSheetClosed",
	description = "Count of share sheet requests closed",
	backends = { LoggingProtocolModule.TelemetryBackends.Counter },
	throttlingPercentage = ShareSheetTelemetryThrottleHundredthsPercent,
	lastUpdated = { 2026, 8, 3 }
}
local config3 = {
	eventName = "shareSheetInteraction",
	description = "Count of share sheet interactions",
	backends = { LoggingProtocolModule.TelemetryBackends.Counter },
	throttlingPercentage = ShareSheetTelemetryThrottleHundredthsPercent,
	lastUpdated = { 2026, 8, 3 }
}
local config4 = {
	eventName = "shareSheetMessageSendResult",
	description = "Count of per-recipient share sheet message send results",
	backends = { LoggingProtocolModule.TelemetryBackends.Counter },
	throttlingPercentage = ShareSheetTelemetryThrottleHundredthsPercent,
	lastUpdated = { 2026, 9, 8 }
}
local config5 = {
	eventName = "shareSheetMessageSendResultDurationMs",
	description = "Duration in milliseconds from recipient send invocation to result",
	backends = { LoggingProtocolModule.TelemetryBackends.Stats },
	throttlingPercentage = ShareSheetTelemetryThrottleHundredthsPercent,
	lastUpdated = { 2026, 9, 8 }
}

function ShareSheetTelemetryModule.logLifecycle(CustomFields)
	-- upvalues: TelemetryService (copy), config (copy), StandardizedFields (copy), ShareSheetTelemetryModule (copy), config1 (copy), config2 (copy)
	TelemetryService:LogEvent(config.Lifecycle, {
		standardizedFields = StandardizedFields,
		customFields = CustomFields
	})
	TelemetryService:LogCounter(if CustomFields.lifecycleType == ShareSheetTelemetryModule.LifecycleType.Open then config1 else config2, {
		customFields = {
			context = CustomFields.context,
			closeReason = CustomFields.closeReason
		}
	}, 1)
end

function ShareSheetTelemetryModule.logInteraction(CustomFields)
	-- upvalues: TelemetryService (copy), config (copy), StandardizedFields (copy), config3 (copy)
	TelemetryService:LogEvent(config.Interaction, {
		standardizedFields = StandardizedFields,
		customFields = CustomFields
	})
	TelemetryService:LogCounter(config3, {
		customFields = {
			context = CustomFields.context,
			interactionType = CustomFields.interactionType
		}
	}, 1)
end

function ShareSheetTelemetryModule.logMessageSendResult(CustomFields)
	-- upvalues: TelemetryService (copy), config (copy), StandardizedFields (copy), config5 (copy), config4 (copy)
	TelemetryService:LogEvent(config.MessageSendResult, {
		standardizedFields = StandardizedFields,
		customFields = CustomFields
	})
	TelemetryService:LogStat(config5, {
		customFields = {
			context = CustomFields.context,
			sendStatus = CustomFields.sendStatus,
			hasCustomMessage = CustomFields.hasCustomMessage
		}
	}, CustomFields.durationMs)
	TelemetryService:LogCounter(config4, {
		customFields = {
			context = CustomFields.context,
			sendStatus = CustomFields.sendStatus,
			hasCustomMessage = CustomFields.hasCustomMessage
		}
	}, 1)
end

function ShareSheetTelemetryModule.startMessageSendResult(p1)
	-- upvalues: ShareSheetTelemetryModule (copy), FFlagShareSheetFriendsSort (copy), GetElapsedTimeMsModule (copy)
	local ClockTime = os.clock()
	
	return function(p2)
		-- upvalues: ShareSheetTelemetryModule (upval), p1 (copy), FFlagShareSheetFriendsSort (upval), GetElapsedTimeMsModule (upval), ClockTime (copy)
		ShareSheetTelemetryModule.logMessageSendResult({
			context = p1.context,
			recipientSource = if FFlagShareSheetFriendsSort then p1.recipientSource else nil,
			telemetryId = p1.telemetryId,
			requestedConversationId = p1.requestedConversationId,
			resolvedConversationId = p2.conversationId,
			sendStatus = p2.status,
			hasCustomMessage = p1.hasCustomMessage,
			durationMs = GetElapsedTimeMsModule(ClockTime)
		})
	end
end

return ShareSheetTelemetryModule