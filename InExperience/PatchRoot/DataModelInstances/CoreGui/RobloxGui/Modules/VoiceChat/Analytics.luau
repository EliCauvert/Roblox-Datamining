local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
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

function AnalyticsModule.new(_impl) --[[ Line: 114 ]]
	-- upvalues: RbxAnalyticsService (copy), AnalyticsModule (copy)
	if not _impl then
		_impl = RbxAnalyticsService
	end
	assert(_impl, "Analytics impl must not be nil.")
	
	return (setmetatable({ _impl = _impl }, AnalyticsModule))
end

local function stub() --[[ Line: 127 ]] end

function AnalyticsModule.stubService() --[[ Line: 129 ]]
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

function AnalyticsModule:setImpl(_impl) --[[ Line: 140 ]]
	self._impl = _impl
end

function AnalyticsModule:_report(Text, Text1, Text2, AdditionalArgs) --[[ Line: 144 ]]
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

function AnalyticsModule:reportVoiceChatJoinResult(Success, Result, p1) --[[ Line: 166 ]]
	-- upvalues: AnalyticsModule (copy)
	self:_report("voiceChat", "defaultChannelJoinResults", Result, {
		success = Success,
		result = Result,
		logLevel = if p1 then p1 else AnalyticsModule.INFO
	})
end

function AnalyticsModule:reportBanMessageEvent(Text) --[[ Line: 174 ]]
	if game:GetFastFlag("LuaVoiceChatAnalyticsBanMessage") then
		self._impl:ReportCounter("voiceChat-reportBanMessage" .. Text, 1)
	end
end

function AnalyticsModule:reportBanMessageEventV2(EventType, BanReason, UserId, VoiceSessionId) --[[ Line: 180 ]]
	self:_report("voiceChat", "reportBanEvent", nil, {
		eventType = EventType,
		banReason = BanReason,
		userId = UserId,
		voiceSessionId = VoiceSessionId
	})
end

function AnalyticsModule:reportReconnectDueToMissedSequence() --[[ Line: 189 ]]
	if game:GetFastFlag("LuaVoiceChatReconnectMissedSequence") then
		self._impl:ReportCounter("voiceChat-reconnectMissedSequence", 1)
	end
end

function AnalyticsModule:reportOutOfOrderSequence() --[[ Line: 195 ]]
	self._impl:ReportCounter("voiceChat-outOfOrderSequence", 1)
end

function AnalyticsModule:reportClosedNudge(UserId, VoiceSessionId) --[[ Line: 199 ]]
	self._impl:ReportCounter("voicechat-closednudge", 1)
	self._impl:SendEventDeferred("client", "voiceChat", "closedNudge", {
		closeType = "CLOSED",
		userId = UserId,
		voiceSessionId = VoiceSessionId
	})
end

function AnalyticsModule:reportAcknowledgedNudge(UserId, VoiceSessionId) --[[ Line: 208 ]]
	self._impl:ReportCounter("voicechat-acknowledgednudge", 1)
	self._impl:SendEventDeferred("client", "voiceChat", "closedNudge", {
		closeType = "ACKNOWLEDGED",
		userId = UserId,
		voiceSessionId = VoiceSessionId
	})
end

function AnalyticsModule:reportDeniedNudge(UserId, VoiceSessionId) --[[ Line: 217 ]]
	self._impl:ReportCounter("voicechat-deniednudge", 1)
	self._impl:SendEventDeferred("client", "voiceChat", "closedNudge", {
		closeType = "DENIED",
		userId = UserId,
		voiceSessionId = VoiceSessionId
	})
end

function AnalyticsModule:reportVoiceMuteIndividual(p1) --[[ Line: 226 ]]
	self._impl:SendEventDeferred("client", "voice", "voiceUIMuteUnmuteIndividual", {
		user_id = p1.userId,
		client_session_id = p1.clientSessionId,
		target_user_id = p1.targetUserId,
		channel_id = p1.channelId,
		context = p1.context,
		muted = p1.muted
	})
end

function AnalyticsModule:reportVoiceMuteGroup(p1) --[[ Line: 237 ]]
	self._impl:SendEventDeferred("client", "voice", "voiceUIMuteUnmuteGroup", {
		user_id = p1.userId,
		client_session_id = p1.clientSessionId,
		channel_id = p1.channelId,
		context = p1.context,
		group_type = p1.groupType,
		muted = p1.muted
	})
end

function AnalyticsModule:reportVoiceMuteSelf(p1) --[[ Line: 248 ]]
	self._impl:SendEventDeferred("client", "voice", "voiceUIMuteUnmuteSelf", {
		user_id = p1.userId,
		client_session_id = p1.clientSessionId,
		channel_id = p1.channelId,
		context = p1.context,
		muted = p1.muted
	})
end

function AnalyticsModule:reportJoinVoiceButtonEvent(EventType, UniverseId, PlaceId, PlaySessionId, ButtonContext, ButtonConsequence) --[[ Line: 258 ]]
	self._impl:SendEventDeferred("client", "voice", "joinVoiceButtonEvent", {
		eventType = EventType,
		universeId = UniverseId,
		placeId = PlaceId,
		playSessionId = PlaySessionId,
		buttonContext = ButtonContext,
		buttonConsequence = ButtonConsequence
	})
end

function AnalyticsModule:reportJoinVoiceButtonEventWithVoiceSessionId(EventType, UniverseId, PlaceId, PlaySessionId, VoiceSessionId, ButtonContext, ButtonConsequence) --[[ Line: 276 ]]
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

function AnalyticsModule:reportLeaveVoiceButtonEvent(EventType, UniverseId, PlaceId, PlaySessionId, VoiceSessionId) --[[ Line: 296 ]]
	self._impl:SendEventDeferred("client", "voice", "leaveVoiceButtonEvent", {
		eventType = EventType,
		universeId = UniverseId,
		placeId = PlaceId,
		playSessionId = PlaySessionId,
		voiceSessionId = VoiceSessionId
	})
end

function AnalyticsModule:reportInExpConsent(EventType, Entry, UniverseId, PlaceId, PlaySessionId) --[[ Line: 312 ]]
	self._impl:SendEventDeferred("client", "voiceChat", "inExpConsentModalEvent", {
		eventType = EventType,
		entry = Entry,
		universeId = UniverseId,
		placeId = PlaceId,
		playSessionId = PlaySessionId
	})
end

function AnalyticsModule:reportDevicePermissionsModalEvent(EventType, VoiceSessionId, UniverseId, PlaceId, Text: string) --[[ Line: 328 ]]
	self._impl:SendEventDeferred("client", "voiceChat", "devicePermissionsModalEvent", {
		eventType = EventType,
		universeId = UniverseId,
		placeId = PlaceId,
		playSessionId = string.sub(Text, 2, #Text - 1),
		voiceSessionId = VoiceSessionId
	})
end

function AnalyticsModule:reportConnectDisconnectEvents(EventName, AdditionalArgs) --[[ Line: 347 ]]
	self._impl:SendEventDeferred("client", "voiceChat", EventName, AdditionalArgs)
end

return AnalyticsModule