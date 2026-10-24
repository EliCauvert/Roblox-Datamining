local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local SessionService = game:GetService("SessionService")
local TelemetryService = game:GetService("TelemetryService")
game:DefineFastInt("LuaVoiceChatThrottleHundrethsPercent", 10000)
game:DefineFastInt("LuaVoiceVolumeControlsEligibilityThrottleHundredthsPercent", 10000)
game:DefineFastInt("LuaVoiceVolumeControlsImpressionsThrottleHundredthsPercent", 10000)
game:DefineFastInt("LuaVoiceChatAnalyticsPointsThrottle", 0)
game:DefineFastFlag("LuaVoiceChatAnalyticsUsePointsV2", false)
game:DefineFastFlag("LuaVoiceChatAnalyticsUseCounterV2", false)
game:DefineFastFlag("LuaVoiceChatAnalyticsUseEventsV2", false)
game:DefineFastFlag("LuaVoiceChatAnalyticsBanMessage", true)
game:DefineFastFlag("LuaVoiceChatReconnectMissedSequence", false)
local AnalyticsModule = {}
AnalyticsModule.__index = AnalyticsModule
AnalyticsModule.INFO = "info"
AnalyticsModule.WARNING = "warning"
AnalyticsModule.ERROR = "error"
local config = {
	Shown = {
		eventName = "VoiceRewarmShown",
		description = "The voice rewarm join-voice icon became available in the Chrome top bar, at most once per session. Rewarm clicks from VR or the settings menu have no matching Shown. customFields: rearmed (true when the user had already consumed a rewarm and FIntVoiceRewarmReArmCount re-armed it).",
		links = "",
		backends = { "RobloxTelemetryCounter" },
		lastUpdated = { 2026, 10, 22 }
	},
	Clicked = {
		eventName = "VoiceRewarmClicked",
		description = "The user clicked the voice rewarm join-voice icon, consuming the rewarm. customFields: rearmed, consequence (what JoinVoice did, e.g. FirstJoinSession, FaeUpsell, ConsentModal, or none).",
		links = "",
		backends = { "RobloxTelemetryCounter" },
		lastUpdated = { 2026, 10, 22 }
	}
}

function AnalyticsModule.new(_impl)
	-- upvalues: RbxAnalyticsService (copy), AnalyticsModule (copy)
	if not _impl then
		_impl = RbxAnalyticsService
	end
	assert(_impl, "Analytics impl must not be nil.")
	
	return (setmetatable({ _impl = _impl }, AnalyticsModule))
end

local function stub() end

function AnalyticsModule.stubService()
	-- upvalues: stub (copy)
	return {
		SetRBXEvent = stub,
		SetRBXEventStream = stub,
		SendEventDeferred = stub,
		ReportCounter = stub,
		ReportStats = stub,
		ReportInfluxSeries = stub
	}
end

function AnalyticsModule:setImpl(_impl)
	self._impl = _impl
end

function AnalyticsModule:_report(Text, Text1, Text2, AdditionalArgs)
	local Text3 = Text .. "-" .. Text1
	
	if game:GetFastFlag("LuaVoiceChatAnalyticsUsePointsV2") then
		self._impl:ReportInfluxSeries(Text3, AdditionalArgs, game:GetFastInt("LuaVoiceChatAnalyticsPointsThrottle"))
	end
	if game:GetFastFlag("LuaVoiceChatAnalyticsUseCounterV2") then
		local Text4: string = Text3
		
		if Text2 then
			Text4 ..= "-" .. Text2
		end
		local Text5: string = Text4
		
		if AdditionalArgs and AdditionalArgs.result then
			Text5 ..= "-" .. AdditionalArgs.result
		end
		self._impl:ReportCounter(Text5, 1)
	end
	if game:GetFastFlag("LuaVoiceChatAnalyticsUseEventsV2") then
		self._impl:SendEventDeferred("client", Text, Text1, AdditionalArgs)
	end
end

function AnalyticsModule:reportVoiceChatJoinResult(Success, Result, p1)
	-- upvalues: AnalyticsModule (copy)
	self:_report("voiceChat", "defaultChannelJoinResults", Result, {
		success = Success,
		result = Result,
		logLevel = if p1 then p1 else AnalyticsModule.INFO
	})
end

function AnalyticsModule:reportBanMessageEvent(Text)
	if game:GetFastFlag("LuaVoiceChatAnalyticsBanMessage") then
		self._impl:ReportCounter("voiceChat-reportBanMessage" .. Text, 1)
	end
end

function AnalyticsModule:reportBanMessageEventV2(EventType, BanReason, UserId, VoiceSessionId)
	self:_report("voiceChat", "reportBanEvent", nil, {
		eventType = EventType,
		banReason = BanReason,
		userId = UserId,
		voiceSessionId = VoiceSessionId
	})
end

function AnalyticsModule:reportReconnectDueToMissedSequence()
	if game:GetFastFlag("LuaVoiceChatReconnectMissedSequence") then
		self._impl:ReportCounter("voiceChat-reconnectMissedSequence", 1)
	end
end

function AnalyticsModule:reportOutOfOrderSequence()
	self._impl:ReportCounter("voiceChat-outOfOrderSequence", 1)
end

function AnalyticsModule:reportReceivedNudge(p1, UserId, VoiceSessionId)
	local UnixTimestampMillisDelta = DateTime.now().UnixTimestampMillis - DateTime.fromIsoDate(p1.deliveryTime).UnixTimestampMillis
	self._impl:ReportCounter("voicechat-receivednudge", 1)
	self._impl:ReportCounter("voicechat-receivednudgeduration", UnixTimestampMillisDelta)
	self._impl:SendEventDeferred("client", "voiceChat", "receivedNudge", {
		type = p1.type,
		durationInMs = UnixTimestampMillisDelta,
		userId = UserId,
		voiceSessionId = VoiceSessionId
	})
end

function AnalyticsModule:reportClosedNudge(UserId, VoiceSessionId)
	self._impl:ReportCounter("voicechat-closednudge", 1)
	self._impl:SendEventDeferred("client", "voiceChat", "closedNudge", {
		closeType = "CLOSED",
		userId = UserId,
		voiceSessionId = VoiceSessionId
	})
end

function AnalyticsModule:reportAcknowledgedNudge(UserId, VoiceSessionId)
	self._impl:ReportCounter("voicechat-acknowledgednudge", 1)
	self._impl:SendEventDeferred("client", "voiceChat", "closedNudge", {
		closeType = "ACKNOWLEDGED",
		userId = UserId,
		voiceSessionId = VoiceSessionId
	})
end

function AnalyticsModule:reportDeniedNudge(UserId, VoiceSessionId)
	self._impl:ReportCounter("voicechat-deniednudge", 1)
	self._impl:SendEventDeferred("client", "voiceChat", "closedNudge", {
		closeType = "DENIED",
		userId = UserId,
		voiceSessionId = VoiceSessionId
	})
end

function AnalyticsModule:reportVoiceMuteIndividual(p1)
	self._impl:SendEventDeferred("client", "voice", "voiceUIMuteUnmuteIndividual", {
		user_id = p1.userId,
		client_session_id = p1.clientSessionId,
		target_user_id = p1.targetUserId,
		channel_id = p1.channelId,
		context = p1.context,
		muted = p1.muted
	})
end

function AnalyticsModule:reportVoiceMuteGroup(p1)
	self._impl:SendEventDeferred("client", "voice", "voiceUIMuteUnmuteGroup", {
		user_id = p1.userId,
		client_session_id = p1.clientSessionId,
		channel_id = p1.channelId,
		context = p1.context,
		group_type = p1.groupType,
		muted = p1.muted
	})
end

function AnalyticsModule:reportVoiceMuteSelf(p1)
	self._impl:SendEventDeferred("client", "voice", "voiceUIMuteUnmuteSelf", {
		user_id = p1.userId,
		client_session_id = p1.clientSessionId,
		channel_id = p1.channelId,
		context = p1.context,
		muted = p1.muted
	})
end

function AnalyticsModule:reportJoinVoiceButtonEvent(EventType, UniverseId, PlaceId, PlaySessionId, ButtonContext, ButtonConsequence)
	self._impl:SendEventDeferred("client", "voice", "joinVoiceButtonEvent", {
		eventType = EventType,
		universeId = UniverseId,
		placeId = PlaceId,
		playSessionId = PlaySessionId,
		buttonContext = ButtonContext,
		buttonConsequence = ButtonConsequence
	})
end

function AnalyticsModule:reportJoinVoiceButtonEventWithVoiceSessionId(EventType, UniverseId, PlaceId, PlaySessionId, VoiceSessionId, ButtonContext, ButtonConsequence)
	self._impl:SendEventDeferred("client", "voice", "joinVoiceButtonEvent", {
		eventType = EventType,
		universeId = UniverseId,
		placeId = PlaceId,
		playSessionId = PlaySessionId,
		voiceSessionId = VoiceSessionId,
		buttonContext = ButtonContext,
		buttonConsequence = ButtonConsequence
	})
end

function AnalyticsModule:reportJoinVoiceUpsellEvent(Text, PlaySessionId, User_is_age_verified, Button_context, Button_consequence)
	-- upvalues: SessionService (copy), TelemetryService (copy)
	TelemetryService:LogEvent({
		description = "Event fired when user sees or interacts with Join Voice button",
		links = "https://github.rbx.com/Roblox/proto-schemas/pull/8530",
		eventName = "joinVoiceUpsell" .. Text,
		backends = { "EventIngest" },
		throttlingPercentage = game:GetFastInt("LuaVoiceChatThrottleHundrethsPercent"),
		lastUpdated = { 2025, 10, 30 }
	}, {
		customFields = {
			user_is_age_verified = User_is_age_verified,
			button_context = Button_context,
			button_consequence = Button_consequence,
			clientTimeStamp = DateTime.now().UnixTimestampMillis,
			playSessionId = PlaySessionId,
			sd_platform_id = SessionService:GetSessionID("level0"),
			sd_logged_in_id = SessionService:GetSessionID("level1")
		},
		standardizedFields = { "addPlaceId", "addUniverseId", "addSessionInfo" }
	})
end

function AnalyticsModule:reportLeaveVoiceButtonEvent(EventType, UniverseId, PlaceId, PlaySessionId, VoiceSessionId)
	self._impl:SendEventDeferred("client", "voice", "leaveVoiceButtonEvent", {
		eventType = EventType,
		universeId = UniverseId,
		placeId = PlaceId,
		playSessionId = PlaySessionId,
		voiceSessionId = VoiceSessionId
	})
end

function AnalyticsModule:reportInExpConsent(EventType, Entry, UniverseId, PlaceId, PlaySessionId)
	self._impl:SendEventDeferred("client", "voiceChat", "inExpConsentModalEvent", {
		eventType = EventType,
		entry = Entry,
		universeId = UniverseId,
		placeId = PlaceId,
		playSessionId = PlaySessionId
	})
end

function AnalyticsModule:reportDevicePermissionsModalEvent(EventType, VoiceSessionId, UniverseId, PlaceId, Text: string)
	self._impl:SendEventDeferred("client", "voiceChat", "devicePermissionsModalEvent", {
		eventType = EventType,
		universeId = UniverseId,
		placeId = PlaceId,
		playSessionId = string.sub(Text, 2, #Text - 1),
		voiceSessionId = VoiceSessionId
	})
end

function AnalyticsModule:reportConnectDisconnectEvents(EventName, AdditionalArgs)
	self._impl:SendEventDeferred("client", "voiceChat", EventName, AdditionalArgs)
end

function AnalyticsModule:reportVoiceEvents(EventName, AdditionalArgs)
	self._impl:SendEventDeferred("client", "voice", EventName, AdditionalArgs)
end

function AnalyticsModule:reportVoiceVolumeEligibility(p1)
	-- upvalues: TelemetryService (copy)
	TelemetryService:LogEvent({
		eventName = "VoiceVolumeControlsEligibility",
		description = "Records voice volume eligibility state on voice join for VVC telemetry",
		links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/voice/voice_volume_controls_eligibility.proto",
		backends = { "EventIngest" },
		throttlingPercentage = game:GetFastInt("LuaVoiceVolumeControlsEligibilityThrottleHundredthsPercent"),
		lastUpdated = { 2026, 7, 7 }
	}, {
		customFields = {
			playSessionId = p1.playSessionId,
			voiceSessionId = p1.voiceSessionId,
			voiceChatVolume = p1.voiceChatVolume,
			usesNewAudioApi = p1.usesNewAudioApi,
			enablesVoiceVolumeControls = p1.enablesVoiceVolumeControls,
			isEligible = p1.isEligible
		},
		standardizedFields = { "addPlaceId", "addUniverseId" }
	})
end

function AnalyticsModule:reportVoiceVolumeImpressions(p1)
	-- upvalues: TelemetryService (copy)
	TelemetryService:LogEvent({
		eventName = "VoiceVolumeControlsImpressions",
		description = "Records whether the voice volume slider was seen during a voice session for Voice Volume Controls telemetry. Only recorded for voice volume control eligible users",
		links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/voice/voice_volume_controls_impressions.proto",
		backends = { "EventIngest" },
		throttlingPercentage = game:GetFastInt("LuaVoiceVolumeControlsImpressionsThrottleHundredthsPercent"),
		lastUpdated = { 2026, 7, 7 }
	}, {
		customFields = {
			playSessionId = p1.playSessionId,
			voiceSessionId = p1.voiceSessionId,
			sliderSeen = p1.sliderSeen,
			voiceJoinTimestampMs = p1.voiceJoinTimestampMs,
			sliderSeenTimestampMs = p1.sliderSeenTimestampMs
		},
		standardizedFields = { "addPlaceId", "addUniverseId" }
	})
end

function AnalyticsModule:reportVoiceRewarmShown(p1)
	-- upvalues: TelemetryService (copy), config (copy)
	TelemetryService:LogCounter(config.Shown, { customFields = { rearmed = tostring(p1) } }, 1)
end

function AnalyticsModule:reportVoiceRewarmClicked(p1, p2)
	-- upvalues: TelemetryService (copy), config (copy)
	TelemetryService:LogCounter(config.Clicked, {
		customFields = { rearmed = tostring(p1), consequence = p2 or "none" }
	}, 1)
end

return AnalyticsModule