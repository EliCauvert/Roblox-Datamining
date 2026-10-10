local t = {
	ice = "ICE",
	sdp = "SDP",
	ssrc = "SSRC",
	acs = "ACS",
	rtc = "RTC"
}
local list = { "State", "Operation", "Event" }

local function stripTrailingSuffix(p1)
	-- upvalues: list (ref)
	for i, v in list do
		local var1 = #p1 - #v
		
		if var1 > 0 and p1:sub(var1 + 1) == v then
			return p1:sub(1, var1)
		end
	end
	return p1
end

local function splitPascalCase(p2)
	local t = {}
	local var2 = ""
	
	for i = 1, #p2 do
		local var3 = p2:sub(i, i)
		local var4 = p2:sub(i + 1, i + 1)
		var2 ..= var3
		local var5 = var3:match("%u") ~= nil
		local var6 = var4:match("%u") ~= nil
		
		if not var5 and var6 then
			t[#t + 1] = var2
			var2 = ""
		elseif var5 and var6 and p2:sub(i + 2, i + 2):match("%l") then
			t[#t + 1] = var2
			var2 = ""
		end
	end
	if var2 ~= "" then
		t[#t + 1] = var2
	end
	return t
end

local function _(p3)
	-- upvalues: t (ref)
	return t[p3:lower()] or p3
end

local function humanizeName(p3)
	-- upvalues: splitPascalCase (ref), stripTrailingSuffix (ref), t (ref)
	local var7 = splitPascalCase(stripTrailingSuffix(p3))
	
	for i, v in var7 do
		var7[i] = t[v:lower()] or v
	end
	return table.concat(var7, " ")
end

local t_1 = {
	ClientJoinOperation = "Join",
	ClientLeaveOperation = "Leave",
	ClientPublishOperation = "Publish",
	ClientSubscribeOperation = "Subscribe",
	ClientMuteUnmuteOperation = "Mute/Unmute",
	ClientPeerLocalMuteUnmuteOperation = "Peer Local Mute/Unmute",
	ClientPeerRemoteMuteUnmuteOperation = "Peer Remote Mute/Unmute",
	ClientCullingOperation = "Culling",
	ClientICETrickleOperation = "ICE Trickle",
	ClientTurnAuthOperation = "TURN Auth",
	ClientSubscriberAudioQualityOperation = "Subscriber Audio Quality",
	ClientVoiceRtcStatsOperation = "Voice RTC Stats",
	ClientVoiceRtcStatsMonitorOperation = "Voice RTC Stats Monitor",
	ClientVoiceWebrtcConnectionChangesOperation = "WebRTC Connection Changes",
	ClientRebootOperation = "Reboot",
	ClientContextParsingOperation = "Context Parsing",
	ConnectOperation = "Connect"
}
local t_2 = {
	ClientRetryJoin = "Client Retry Join",
	ClientRetryJoinWithConfig = "Client Retry Join With Config",
	VoiceChatplayerMuteStatusChangedEvent = "Player Mute Status Changed",
	SubscribeStateChange = "Subscribe State Change",
	PublishStateChange = "Publish State Change",
	JoinedVoice = "Joined Voice",
	JoinedVoiceV2 = "Joined Voice V2",
	PublishingHandshakeAcked = "Publishing Handshake Acked",
	PublishingHandshakeCompleted = "Publishing Handshake Completed",
	PublishingHandshakeInitiated = "Publishing Handshake Initiated",
	PublishingHandshakeInitiatedWithBothSdp = "Publishing Handshake Initiated (Both SDP)",
	PublishingHandshakeAckedWithBothSdp = "Publishing Handshake Acked (Both SDP)",
	PublishingHandshakeInitiatedWithCompressedSdp = "Publishing Handshake Initiated (Compressed SDP)",
	PublishingHandshakeAckedWithCompressedSdp = "Publishing Handshake Acked (Compressed SDP)",
	UpdateTurnAuthInfoRequest = "Update TURN Auth Info Request",
	ACSCleanup = "ACS Cleanup",
	ReJoinedVoice = "Rejoined Voice",
	ReJoinedVoiceV2 = "Rejoined Voice V2",
	UserTurnAuth = "User TURN Auth",
	UserTurnAuthV2 = "User TURN Auth V2",
	FetchUserTurnAuthOperationFailed = "Fetch User TURN Auth Failed",
	RelayCandidatesGathered = "Relay Candidates Gathered",
	VoiceChatClientVoiceCapability = "Client Voice Capability",
	VoiceChatClientVoiceCapabilityWithConfig = "Client Voice Capability (With Config)",
	VoiceChatPlayerMuteStateChangedClientToServer = "Player Mute State Changed (Client to Server)",
	VoiceChatPlayerMuteStateChangedServerToClient = "Player Mute State Changed (Server to Client)",
	VoiceChatSampleTaggedEventClientToServer = "Sample Tagged Event (Client to Server)",
	VoiceChatSampleTaggedEventServerToClient = "Sample Tagged Event (Server to Client)",
	VoiceSetupFailed = "Voice Setup Failed",
	SubscriptionReset = "Subscription Reset",
	SsrcUserIdMappingUpdate = "SSRC/User ID Mapping Update",
	ClientStreamSwitchAck = "Client Stream Switch Ack",
	SubscriptionHandshakeInitiated = "Subscription Handshake Initiated",
	SubscriptionHandshakeAcked = "Subscription Handshake Acked",
	SubscriptionHandshakeInitiatedWithBothSdp = "Subscription Handshake Initiated (Both SDP)",
	SubscriptionHandshakeAckedWithBothSdp = "Subscription Handshake Acked (Both SDP)",
	SubscriptionHandshakeInitiatedWithCompressedSdp = "Subscription Handshake Initiated (Compressed SDP)",
	SubscriptionHandshakeAckedWithCompressedSdp = "Subscription Handshake Acked (Compressed SDP)",
	SubscriptionHandshakeCompleted = "Subscription Handshake Completed",
	VoiceChatSubscriptionInitialBatchEmpty = "Subscription Initial Batch Empty",
	SubscriptionFeedStarted = "Subscription Feed Started",
	VoiceMigration = "Voice Migration",
	SubscriberAudioQualitySample = "Subscriber Audio Quality Sample"
}

return {
	operationTypeLabels = t_1,
	eventNameLabels = t_2,
	humanizeName = humanizeName,
	labelForOperationType = function(p4)
		-- upvalues: t_1 (ref), humanizeName (ref)
		return t_1[p4] or humanizeName(p4)
	end,
	labelForEventName = function(p4)
		-- upvalues: t_2 (ref), humanizeName (ref)
		return t_2[p4] or humanizeName(p4)
	end
}