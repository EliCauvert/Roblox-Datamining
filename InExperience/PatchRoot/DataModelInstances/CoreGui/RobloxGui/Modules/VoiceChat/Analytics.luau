local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
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

function t.new(p0) --[[ line: 114 ]]
	-- upvalues: rbxAnalyticsService (ref), t (ref)
	if not p0 then
		p0 = rbxAnalyticsService
	end
	assert(p0, "Analytics impl must not be nil.")
	
	return setmetatable({ _impl = p0 }, t)
end

local function stub() --[[ line: 127 ]] end

function t.stubService() --[[ line: 129 ]]
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

function t:setImpl(p1) --[[ line: 140 ]]
	self._impl = p1
end

function t:_report(p2, p3, p4, p5) --[[ line: 144 ]]
	local text = p2 .. "-" .. p3
	
	if game:GetFastFlag("LuaVoiceChatAnalyticsUsePointsV2") then
		self._impl:ReportInfluxSeries(text, p5, game:GetFastInt("LuaVoiceChatAnalyticsPointsThrottle"))
	end
	if game:GetFastFlag("LuaVoiceChatAnalyticsUseCounterV2") then
		local var4 = text
		
		if p4 then
			var4 ..= "-" .. p4
		end
		local var5 = var4
		
		if p5 and p5.result then
			var5 ..= "-" .. p5.result
		end
		self._impl:ReportCounter(var5, 1)
	end
	if game:GetFastFlag("LuaVoiceChatAnalyticsUseEventsV2") then
		self._impl:SendEventDeferred("client", p2, p3, p5)
	end
end

function t:reportVoiceChatJoinResult(p6, p7, p8) --[[ line: 166 ]]
	-- upvalues: t (ref)
	self:_report("voiceChat", "defaultChannelJoinResults", p7, { success = p6, result = p7, logLevel = p8 or t.INFO })
end

function t:reportBanMessageEvent(p9) --[[ line: 174 ]]
	if game:GetFastFlag("LuaVoiceChatAnalyticsBanMessage") then
		self._impl:ReportCounter("voiceChat-reportBanMessage" .. p9, 1)
	end
end

function t:reportBanMessageEventV2(p10, p11, p12, p13) --[[ line: 180 ]]
	self:_report("voiceChat", "reportBanEvent", nil, {
		eventType = p10,
		banReason = p11,
		userId = p12,
		voiceSessionId = p13
	})
end

function t:reportReconnectDueToMissedSequence() --[[ line: 189 ]]
	if game:GetFastFlag("LuaVoiceChatReconnectMissedSequence") then
		self._impl:ReportCounter("voiceChat-reconnectMissedSequence", 1)
	end
end

function t:reportOutOfOrderSequence() --[[ line: 195 ]]
	self._impl:ReportCounter("voiceChat-outOfOrderSequence", 1)
end

function t:reportClosedNudge(p14, p15) --[[ line: 199 ]]
	self._impl:ReportCounter("voicechat-closednudge", 1)
	self._impl:SendEventDeferred("client", "voiceChat", "closedNudge", { closeType = "CLOSED", userId = p14, voiceSessionId = p15 })
end

function t:reportAcknowledgedNudge(p16, p17) --[[ line: 208 ]]
	self._impl:ReportCounter("voicechat-acknowledgednudge", 1)
	self._impl:SendEventDeferred("client", "voiceChat", "closedNudge", {
		closeType = "ACKNOWLEDGED",
		userId = p16,
		voiceSessionId = p17
	})
end

function t:reportDeniedNudge(p18, p19) --[[ line: 217 ]]
	self._impl:ReportCounter("voicechat-deniednudge", 1)
	self._impl:SendEventDeferred("client", "voiceChat", "closedNudge", { closeType = "DENIED", userId = p18, voiceSessionId = p19 })
end

function t:reportVoiceMuteIndividual(p20) --[[ line: 226 ]]
	self._impl:SendEventDeferred("client", "voice", "voiceUIMuteUnmuteIndividual", {
		user_id = p20.userId,
		client_session_id = p20.clientSessionId,
		target_user_id = p20.targetUserId,
		channel_id = p20.channelId,
		context = p20.context,
		muted = p20.muted
	})
end

function t:reportVoiceMuteGroup(p21) --[[ line: 237 ]]
	self._impl:SendEventDeferred("client", "voice", "voiceUIMuteUnmuteGroup", {
		user_id = p21.userId,
		client_session_id = p21.clientSessionId,
		channel_id = p21.channelId,
		context = p21.context,
		group_type = p21.groupType,
		muted = p21.muted
	})
end

function t:reportVoiceMuteSelf(p22) --[[ line: 248 ]]
	self._impl:SendEventDeferred("client", "voice", "voiceUIMuteUnmuteSelf", {
		user_id = p22.userId,
		client_session_id = p22.clientSessionId,
		channel_id = p22.channelId,
		context = p22.context,
		muted = p22.muted
	})
end

function t:reportJoinVoiceButtonEvent(p23, p24, p25, p26, p27, p28) --[[ line: 258 ]]
	self._impl:SendEventDeferred("client", "voice", "joinVoiceButtonEvent", {
		eventType = p23,
		universeId = p24,
		placeId = p25,
		playSessionId = p26,
		buttonContext = p27,
		buttonConsequence = p28
	})
end

function t:reportJoinVoiceButtonEventWithVoiceSessionId(p29, p30, p31, p32, p33, p34, p35) --[[ line: 276 ]]
	self._impl:SendEventDeferred("client", "voice", "joinVoiceButtonEvent", {
		eventType = p29,
		universeId = p30,
		placeId = p31,
		playSessionId = p32,
		voiceSessionId = p33,
		buttonContext = p34,
		buttonConsequence = p35
	})
end

function t:reportLeaveVoiceButtonEvent(p36, p37, p38, p39, p40) --[[ line: 296 ]]
	self._impl:SendEventDeferred("client", "voice", "leaveVoiceButtonEvent", {
		eventType = p36,
		universeId = p37,
		placeId = p38,
		playSessionId = p39,
		voiceSessionId = p40
	})
end

function t:reportInExpConsent(p41, p42, p43, p44, p45) --[[ line: 312 ]]
	self._impl:SendEventDeferred("client", "voiceChat", "inExpConsentModalEvent", {
		eventType = p41,
		entry = p42,
		universeId = p43,
		placeId = p44,
		playSessionId = p45
	})
end

function t:reportDevicePermissionsModalEvent(p46, p47, p48, p49, p50) --[[ line: 328 ]]
	self._impl:SendEventDeferred("client", "voiceChat", "devicePermissionsModalEvent", {
		eventType = p46,
		universeId = p48,
		placeId = p49,
		playSessionId = string.sub(p50, 2, #p50 - 1),
		voiceSessionId = p47
	})
end

function t:reportConnectDisconnectEvents(p51, p52) --[[ line: 347 ]]
	self._impl:SendEventDeferred("client", "voiceChat", p51, p52)
end

return t