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

function t.new(p1)
	-- upvalues: rbxAnalyticsService (ref), t (ref)
	if not p1 then
		p1 = rbxAnalyticsService
	end
	assert(p1, "Analytics impl must not be nil.")
	
	return setmetatable({ _impl = p1 }, t)
end

local function stub() end

function t.stubService()
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

function t:setImpl(p1)
	self._impl = p1
end

function t:_report(p1, p2, p3, p4)
	local text = p1 .. "-" .. p3
	
	if game:GetFastFlag("LuaVoiceChatAnalyticsUsePointsV2") then
		self._impl:ReportInfluxSeries(text, p4, game:GetFastInt("LuaVoiceChatAnalyticsPointsThrottle"))
	end
	if game:GetFastFlag("LuaVoiceChatAnalyticsUseCounterV2") then
		local var1 = text
		
		if p3 then
			var1 ..= "-" .. p4
		end
		local var2 = var1
		
		if p4 and p4.result then
			var2 ..= "-" .. p5.result
		end
		self._impl:ReportCounter(var2, 1)
	end
	if game:GetFastFlag("LuaVoiceChatAnalyticsUseEventsV2") then
		self._impl:SendEventDeferred("client", p1, p2, p4)
	end
end

function t:reportVoiceChatJoinResult(p1, p2, p3)
	-- upvalues: t (ref)
	self:_report("voiceChat", "defaultChannelJoinResults", p2, { success = p1, result = p2, logLevel = p3 or t.INFO })
end

function t:reportBanMessageEvent(p1)
	if game:GetFastFlag("LuaVoiceChatAnalyticsBanMessage") then
		self._impl:ReportCounter("voiceChat-reportBanMessage" .. p9, 1)
	end
end

function t:reportBanMessageEventV2(p1, p2, p3, p4)
	self:_report("voiceChat", "reportBanEvent", nil, {
		eventType = p1,
		banReason = p2,
		userId = p3,
		voiceSessionId = p4
	})
end

function t:reportReconnectDueToMissedSequence()
	if game:GetFastFlag("LuaVoiceChatReconnectMissedSequence") then
		self._impl:ReportCounter("voiceChat-reconnectMissedSequence", 1)
	end
end

function t:reportOutOfOrderSequence()
	self._impl:ReportCounter("voiceChat-outOfOrderSequence", 1)
end

function t:reportClosedNudge(p1, p2)
	self._impl:ReportCounter("voicechat-closednudge", 1)
	self._impl:SendEventDeferred("client", "voiceChat", "closedNudge", { closeType = "CLOSED", userId = p1, voiceSessionId = p2 })
end

function t:reportAcknowledgedNudge(p1, p2)
	self._impl:ReportCounter("voicechat-acknowledgednudge", 1)
	self._impl:SendEventDeferred("client", "voiceChat", "closedNudge", {
		closeType = "ACKNOWLEDGED",
		userId = p1,
		voiceSessionId = p2
	})
end

function t:reportDeniedNudge(p1, p2)
	self._impl:ReportCounter("voicechat-deniednudge", 1)
	self._impl:SendEventDeferred("client", "voiceChat", "closedNudge", { closeType = "DENIED", userId = p1, voiceSessionId = p2 })
end

function t:reportVoiceMuteIndividual(p1)
	self._impl:SendEventDeferred("client", "voice", "voiceUIMuteUnmuteIndividual", {
		user_id = p1.userId,
		client_session_id = p1.clientSessionId,
		target_user_id = p1.targetUserId,
		channel_id = p1.channelId,
		context = p1.context,
		muted = p1.muted
	})
end

function t:reportVoiceMuteGroup(p1)
	self._impl:SendEventDeferred("client", "voice", "voiceUIMuteUnmuteGroup", {
		user_id = p1.userId,
		client_session_id = p1.clientSessionId,
		channel_id = p1.channelId,
		context = p1.context,
		group_type = p1.groupType,
		muted = p1.muted
	})
end

function t:reportVoiceMuteSelf(p1)
	self._impl:SendEventDeferred("client", "voice", "voiceUIMuteUnmuteSelf", {
		user_id = p1.userId,
		client_session_id = p1.clientSessionId,
		channel_id = p1.channelId,
		context = p1.context,
		muted = p1.muted
	})
end

function t:reportJoinVoiceButtonEvent(p1, p2, p3, p4, p5, p6)
	self._impl:SendEventDeferred("client", "voice", "joinVoiceButtonEvent", {
		eventType = p1,
		universeId = p2,
		placeId = p3,
		playSessionId = p4,
		buttonContext = p5,
		buttonConsequence = p6
	})
end

function t:reportJoinVoiceButtonEventWithVoiceSessionId(p1, p2, p3, p4, p5, p6, p7)
	self._impl:SendEventDeferred("client", "voice", "joinVoiceButtonEvent", {
		eventType = p1,
		universeId = p2,
		placeId = p3,
		playSessionId = p4,
		voiceSessionId = p5,
		buttonContext = p6,
		buttonConsequence = p7
	})
end

function t:reportLeaveVoiceButtonEvent(p1, p2, p3, p4, p5)
	self._impl:SendEventDeferred("client", "voice", "leaveVoiceButtonEvent", {
		eventType = p1,
		universeId = p2,
		placeId = p3,
		playSessionId = p4,
		voiceSessionId = p5
	})
end

function t:reportInExpConsent(p1, p2, p3, p4, p5)
	self._impl:SendEventDeferred("client", "voiceChat", "inExpConsentModalEvent", {
		eventType = p1,
		entry = p2,
		universeId = p3,
		placeId = p4,
		playSessionId = p5
	})
end

function t:reportDevicePermissionsModalEvent(p1, p2, p3, p4, p5)
	self._impl:SendEventDeferred("client", "voiceChat", "devicePermissionsModalEvent", {
		eventType = p1,
		universeId = p3,
		placeId = p4,
		playSessionId = string.sub(p5, 2, #p5 - 1),
		voiceSessionId = p2
	})
end

function t:reportConnectDisconnectEvents(p1, p2)
	self._impl:SendEventDeferred("client", "voiceChat", p1, p2)
end

return t