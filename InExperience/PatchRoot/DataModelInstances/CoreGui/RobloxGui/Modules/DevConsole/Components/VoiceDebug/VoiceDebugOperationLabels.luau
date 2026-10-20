local config = {
	ice = "ICE",
	sdp = "SDP",
	ssrc = "SSRC",
	acs = "ACS",
	rtc = "RTC"
}
local Segments = { "State", "Operation", "Event" }

local function stripTrailingSuffix(Text: string): string
	-- upvalues: Segments (copy)
	local v1 = nil
	for _, segment in Segments do
		v1 = #Text - #segment
		
		if v1 > 0 and Text:sub(v1 + 1) == segment then
			return Text:sub(1, v1)
		end
	end
	return Text
end

local function splitPascalCase(Text: string)
	local t = {}
	local Text1 = ""
	
	for i = 1, #Text do
		local Segment = Text:sub(i, i)
		Text1 ..= Segment
		local HasU = Segment:match("%u") ~= nil
		local HasU1 = Text:sub(i + 1, i + 1):match("%u") ~= nil
		
		if HasU or not HasU1 then
			if HasU and HasU1 and Text:sub(i + 2, i + 2):match("%l") then
				t[#t + 1] = Text1
				Text1 = ""
			end
		else
			t[#t + 1] = Text1
			Text1 = ""
		end
	end
	if Text1 ~= "" then
		t[#t + 1] = Text1
	end
	return t
end

local function _(Text: string)
	-- upvalues: config (copy)
	return config[Text:lower()] or Text
end

local function humanizeName(p1): string
	-- upvalues: splitPascalCase (copy), stripTrailingSuffix (copy), config (copy)
	local SplitPascalCaseResult = splitPascalCase(stripTrailingSuffix(p1))
	
	for i, Text in SplitPascalCaseResult do
		SplitPascalCaseResult[i] = config[Text:lower()] or Text
	end
	return table.concat(SplitPascalCaseResult, " ")
end

local OperationTypeLabels = {
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
local EventNameLabels = {
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
	operationTypeLabels = OperationTypeLabels,
	eventNameLabels = EventNameLabels,
	humanizeName = humanizeName,
	labelForOperationType = function(p2)
		-- upvalues: OperationTypeLabels (copy), humanizeName (copy)
		return OperationTypeLabels[p2] or humanizeName(p2)
	end,
	labelForEventName = function(p2)
		-- upvalues: EventNameLabels (copy), humanizeName (copy)
		return EventNameLabels[p2] or humanizeName(p2)
	end
}