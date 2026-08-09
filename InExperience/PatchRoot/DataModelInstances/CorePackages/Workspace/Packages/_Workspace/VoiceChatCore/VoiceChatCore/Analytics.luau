local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local sessionService = game:GetService("SessionService")
local telemetryService = game:GetService("TelemetryService")
game:DefineFastInt("LuaVoiceChatThrottleHundrethsPercent", 10000)
game:DefineFastInt("LuaVoiceChatAnalyticsPointsThrottle", 0)
game:DefineFastFlag("LuaVoiceChatAnalyticsUsePointsV2", false)
game:DefineFastFlag("LuaVoiceChatAnalyticsUseCounterV2", false)
game:DefineFastFlag("LuaVoiceChatAnalyticsUseEventsV2", false)
game:DefineFastFlag("LuaVoiceChatAnalyticsBanMessage", true)
game:DefineFastFlag("LuaVoiceChatReconnectMissedSequence", false)
local t = {}
t.__index = t
t.INFO = "info"
t.WARNING = "warning"
t.ERROR = "error"

function t.new(p0) --[[ line: 137 ]]
	-- upvalues: rbxAnalyticsService (ref), t (ref)
	if not p0 then
		p0 = rbxAnalyticsService
	end
	assert(p0, "Analytics impl must not be nil.")
	
	return setmetatable({ _impl = p0 }, t)
end

local function stub() --[[ line: 150 ]] end

function t.stubService() --[[ line: 152 ]]
	-- upvalues: stub (ref)
	return {
		SetRBXEvent = stub,
		SetRBXEventStream = stub,
		SendEventDeferred = stub,
		ReportCounter = stub,
		ReportStats = stub,
		ReportInfluxSeries = stub
	}
end

function t:setImpl(p1) --[[ line: 163 ]]
	self._impl = p1
end

function t:_report(p2, p3, p4, p5) --[[ line: 167 ]]
	local text = p2 .. "-" .. p3
	
	if game:GetFastFlag("LuaVoiceChatAnalyticsUsePointsV2") then
		self._impl:ReportInfluxSeries(text, p5, game:GetFastInt("LuaVoiceChatAnalyticsPointsThrottle"))
	end
	if game:GetFastFlag("LuaVoiceChatAnalyticsUseCounterV2") then
		local var6 = text
		
		if p4 then
			var6 ..= "-" .. p4
		end
		local var7 = var6
		
		if p5 and p5.result then
			var7 ..= "-" .. p5.result
		end
		self._impl:ReportCounter(var7, 1)
	end
	if game:GetFastFlag("LuaVoiceChatAnalyticsUseEventsV2") then
		self._impl:SendEventDeferred("client", p2, p3, p5)
	end
end

function t:reportVoiceChatJoinResult(p6, p7, p8) --[[ line: 189 ]]
	-- upvalues: t (ref)
	self:_report("voiceChat", "defaultChannelJoinResults", p7, { success = p6, result = p7, logLevel = p8 or t.INFO })
end

function t:reportBanMessageEvent(p9) --[[ line: 197 ]]
	if game:GetFastFlag("LuaVoiceChatAnalyticsBanMessage") then
		self._impl:ReportCounter("voiceChat-reportBanMessage" .. p9, 1)
	end
end

function t:reportBanMessageEventV2(p10, p11, p12, p13) --[[ line: 203 ]]
	self:_report("voiceChat", "reportBanEvent", nil, {
		eventType = p10,
		banReason = p11,
		userId = p12,
		voiceSessionId = p13
	})
end

function t:reportReconnectDueToMissedSequence() --[[ line: 212 ]]
	if game:GetFastFlag("LuaVoiceChatReconnectMissedSequence") then
		self._impl:ReportCounter("voiceChat-reconnectMissedSequence", 1)
	end
end

function t:reportOutOfOrderSequence() --[[ line: 218 ]]
	self._impl:ReportCounter("voiceChat-outOfOrderSequence", 1)
end

function t:reportReceivedNudge(p14, p15, p16) --[[ line: 222 ]]
	local var8 = DateTime.now().UnixTimestampMillis - DateTime.fromIsoDate(p14.deliveryTime).UnixTimestampMillis
	self._impl:ReportCounter("voicechat-receivednudge", 1)
	self._impl:ReportCounter("voicechat-receivednudgeduration", var8)
	self._impl:SendEventDeferred("client", "voiceChat", "receivedNudge", {
		type = p14.type,
		durationInMs = var8,
		userId = p15,
		voiceSessionId = p16
	})
end

function t:reportClosedNudge(p17, p18) --[[ line: 239 ]]
	self._impl:ReportCounter("voicechat-closednudge", 1)
	self._impl:SendEventDeferred("client", "voiceChat", "closedNudge", { closeType = "CLOSED", userId = p17, voiceSessionId = p18 })
end

function t:reportAcknowledgedNudge(p19, p20) --[[ line: 248 ]]
	self._impl:ReportCounter("voicechat-acknowledgednudge", 1)
	self._impl:SendEventDeferred("client", "voiceChat", "closedNudge", {
		closeType = "ACKNOWLEDGED",
		userId = p19,
		voiceSessionId = p20
	})
end

function t:reportDeniedNudge(p21, p22) --[[ line: 257 ]]
	self._impl:ReportCounter("voicechat-deniednudge", 1)
	self._impl:SendEventDeferred("client", "voiceChat", "closedNudge", { closeType = "DENIED", userId = p21, voiceSessionId = p22 })
end

function t:reportVoiceMuteIndividual(p23) --[[ line: 266 ]]
	self._impl:SendEventDeferred("client", "voice", "voiceUIMuteUnmuteIndividual", {
		user_id = p23.userId,
		client_session_id = p23.clientSessionId,
		target_user_id = p23.targetUserId,
		channel_id = p23.channelId,
		context = p23.context,
		muted = p23.muted
	})
end

function t:reportVoiceMuteGroup(p24) --[[ line: 277 ]]
	self._impl:SendEventDeferred("client", "voice", "voiceUIMuteUnmuteGroup", {
		user_id = p24.userId,
		client_session_id = p24.clientSessionId,
		channel_id = p24.channelId,
		context = p24.context,
		group_type = p24.groupType,
		muted = p24.muted
	})
end

function t:reportVoiceMuteSelf(p25) --[[ line: 288 ]]
	self._impl:SendEventDeferred("client", "voice", "voiceUIMuteUnmuteSelf", {
		user_id = p25.userId,
		client_session_id = p25.clientSessionId,
		channel_id = p25.channelId,
		context = p25.context,
		muted = p25.muted
	})
end

function t:reportJoinVoiceButtonEvent(p26, p27, p28, p29, p30, p31) --[[ line: 298 ]]
	self._impl:SendEventDeferred("client", "voice", "joinVoiceButtonEvent", {
		eventType = p26,
		universeId = p27,
		placeId = p28,
		playSessionId = p29,
		buttonContext = p30,
		buttonConsequence = p31
	})
end

function t:reportJoinVoiceButtonEventWithVoiceSessionId(p32, p33, p34, p35, p36, p37, p38) --[[ line: 316 ]]
	self._impl:SendEventDeferred("client", "voice", "joinVoiceButtonEvent", {
		eventType = p32,
		universeId = p33,
		placeId = p34,
		playSessionId = p35,
		voiceSessionId = p36,
		buttonContext = p37,
		buttonConsequence = p38
	})
end

function t.reportJoinVoiceUpsellEvent(_, p39, p40, p41, p42, p43) --[[ line: 336 ]]
	-- upvalues: sessionService (ref), telemetryService (ref)
	telemetryService:LogEvent({
		description = "Event fired when user sees or interacts with Join Voice button",
		links = "https://github.rbx.com/Roblox/proto-schemas/pull/8530",
		eventName = "joinVoiceUpsell" .. p39,
		backends = { "EventIngest" },
		throttlingPercentage = game:GetFastInt("LuaVoiceChatThrottleHundrethsPercent"),
		lastUpdated = { 2025, 10, 30 }
	}, {
		customFields = {
			user_is_age_verified = p41,
			button_context = p42,
			button_consequence = p43,
			clientTimeStamp = DateTime.now().UnixTimestampMillis,
			playSessionId = p40,
			sd_platform_id = sessionService:GetSessionID("level0"),
			sd_logged_in_id = sessionService:GetSessionID("level1")
		},
		standardizedFields = { "addPlaceId", "addUniverseId", "addSessionInfo" }
	})
end

function t:reportLeaveVoiceButtonEvent(p44, p45, p46, p47, p48) --[[ line: 369 ]]
	self._impl:SendEventDeferred("client", "voice", "leaveVoiceButtonEvent", {
		eventType = p44,
		universeId = p45,
		placeId = p46,
		playSessionId = p47,
		voiceSessionId = p48
	})
end

function t:reportInExpConsent(p49, p50, p51, p52, p53) --[[ line: 385 ]]
	self._impl:SendEventDeferred("client", "voiceChat", "inExpConsentModalEvent", {
		eventType = p49,
		entry = p50,
		universeId = p51,
		placeId = p52,
		playSessionId = p53
	})
end

function t:reportDevicePermissionsModalEvent(p54, p55, p56, p57, p58) --[[ line: 401 ]]
	self._impl:SendEventDeferred("client", "voiceChat", "devicePermissionsModalEvent", {
		eventType = p54,
		universeId = p56,
		placeId = p57,
		playSessionId = string.sub(p58, 2, #p58 - 1),
		voiceSessionId = p55
	})
end

function t:reportConnectDisconnectEvents(p59, p60) --[[ line: 420 ]]
	self._impl:SendEventDeferred("client", "voiceChat", p59, p60)
end

function t:reportVoiceEvents(p61, p62) --[[ line: 424 ]]
	self._impl:SendEventDeferred("client", "voice", p61, p62)
end

return t