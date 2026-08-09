local parent = script.Parent.Parent
local playersService = game:GetService("Players")
local collectionService = game:GetService("CollectionService")
local soundService = game:GetService("SoundService")
local voiceChatService = game:GetService("VoiceChatService")
local httpService = game:GetService("HttpService")
local httpRbxApiService = game:GetService("HttpRbxApiService")
local appStorageService = game:GetService("AppStorageService")
local notificationService = game:GetService("NotificationService")
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local replicatedStorageService = game:GetService("ReplicatedStorage")
local IXPServiceWrapper = require(parent.IXPServiceWrapper).IXPServiceWrapper
local playersService_1 = game:GetService("Players")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local thirdPartyUserService = game:GetService("ThirdPartyUserService")
local adService = game:GetService("AdService")
local chatService = game:GetService("Chat")
local constantsModule = require(script.Parent.Constants)
local utilsModule = require(script.Parent.Utils)
local flags = script.Parent.Flags
local analyticsModule = require(script.Parent.Analytics)
local requests = script.Parent.Requests
local promiseModule = require(parent.Promise)
local cryoModule = require(parent.Cryo)
local default = require(parent.CallProtocol).CallProtocol.default
local enums = require(parent.CallProtocol).Enums
local permissionsProtocol = require(parent.PermissionsProtocol).PermissionsProtocol
local blockingUtilityModule = require(parent.BlockingUtility)
local coreGuiService = game:GetService("CoreGui")
local name = require(parent.CoreScriptsInitializer).CoreLogger:new(script.Name)
local var23 = require(flags.GetFFlagUpdateDeviceInputPlayerChanged)()
local stringKeyFixForParticipantsTable = game:DefineFastFlag("StringKeyFixForParticipantsTable", false)
local showJoinVoiceRaceConditionFix = game:DefineFastFlag("ShowJoinVoiceRaceConditionFix", false)
local consoleVoiceIXPEnabled = game:DefineFastFlag("ConsoleVoiceIXPEnabled", false)
local fFlagExpChatDictation = require(parent.SharedFlags).FFlagExpChatDictation
local consoleVoiceIXPLayerName = game:DefineFastString("ConsoleVoiceIXPLayerName", "User.Communication.ConsoleVoice")
local consoleVoiceEnabledIXPLayerValue = game:DefineFastString("ConsoleVoiceEnabledIXPLayerValue", "ConsoleVoiceEnabled")
local talkingChangedWithDebounceV2 = game:DefineFastFlag("TalkingChangedWithDebounceV2", false)
local talkingChangedDebounceTime = game:DefineFastInt("TalkingChangedDebounceTime", 300)
local sendVoiceCapturedDuringVideoCaptureEvent = game:DefineFastFlag("SendVoiceCapturedDuringVideoCaptureEvent", false)
local getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice = require(parent.SharedFlags).GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice
local getFFlagLuaConsumePlayerModeratedModule = require(flags.GetFFlagLuaConsumePlayerModerated)
local getFFlagLocalMutedNilFix = require(parent.SharedFlags).GetFFlagLocalMutedNilFix
local getFFlagEnableVoiceReverseNudgeModule = require(flags.GetFFlagEnableVoiceReverseNudge)
local getFFlagClearUserFromRecentVoiceDataOnLeaveModule = require(flags.GetFFlagClearUserFromRecentVoiceDataOnLeave)
local getFIntVoiceUsersInteractionExpiryTimeSecondsModule = require(flags.GetFIntVoiceUsersInteractionExpiryTimeSeconds)
local getFFlagAvatarChatServiceEnabled = require(parent.SharedFlags).GetFFlagAvatarChatServiceEnabled
local getFFlagVoiceChatServiceManagerUseAvatarChatModule = require(flags.GetFFlagVoiceChatServiceManagerUseAvatarChat)
local getFFlagJoinWithoutMicPermissions = require(parent.SharedFlags).GetFFlagJoinWithoutMicPermissions
local getFFlagBatchVoiceParticipantsUpdatesModule = require(flags.GetFFlagBatchVoiceParticipantsUpdates)
local getFIntThrottleParticipantsUpdateMsModule = require(flags.GetFIntThrottleParticipantsUpdateMs)
local getFFlagSeamlessVoiceFTUX = require(parent.SharedFlags).GetFFlagSeamlessVoiceFTUX
local getFFlagNonVoiceFTUX = require(parent.SharedFlags).GetFFlagNonVoiceFTUX
local getFFlagEnableFtuxExitOnMuteToggleModule = require(flags.GetFFlagEnableFtuxExitOnMuteToggle)
local getFFlagEnableExpJoinMicPermAnalyticsModule = require(flags.GetFFlagEnableExpJoinMicPermAnalytics)
local getFFlagEnableSeamlessVoiceFeatureModule = require(flags.GetFFlagEnableSeamlessVoiceFeature)
local getFFlagFixGetPlayerByUserIdStringCastModule = require(flags.GetFFlagFixGetPlayerByUserIdStringCast)
local fFlagDebugShowAudioDeviceInputDebugger = require(parent.SharedFlags).GetFFlagDebugShowAudioDeviceInputDebugger()
local voicePerformanceThrottlingIXPLayerName = game:DefineFastString("VoicePerformanceThrottlingIXPLayerName", "Voice.Performance")
local throttleParticipantsUpdateIXPLayerValue = game:DefineFastString("ThrottleParticipantsUpdateIXPLayerValue", "ThrottleParticipantsUpdate")
local useAudioAnalyzerForLocalMetering2 = game:DefineFastFlag("UseAudioAnalyzerForLocalMetering2", false)
local stopModerationConnectionOnLeave = game:DefineFastFlag("StopModerationConnectionOnLeave", false)
local disableRejoinGroupIdDoubleRead = game:DefineFastFlag("DisableRejoinGroupIdDoubleRead", false)
local enableMutedByLocalUserEngineFeature = game:GetEngineFeature("EnableMutedByLocalUser")
local rbxAnalyticsServiceExposePlaySessionIdEngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local getFFlagEnableVoiceChatMuteForVideoCaptures = require(parent.SharedFlags).GetFFlagEnableVoiceChatMuteForVideoCaptures
local var51 = sendVoiceCapturedDuringVideoCaptureEvent and getFFlagEnableVoiceChatMuteForVideoCaptures()
local getFFlagEnableVoiceSignal = require(parent.SharedFlags).GetFFlagEnableVoiceSignal
local getFFlagEnableInExpPhoneVoiceUpsellEntrypoints = require(parent.SharedFlags).GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints
local getFFlagVoiceChatClientRewriteMasterLua = require(parent.SharedFlags).GetFFlagVoiceChatClientRewriteMasterLua
local getFFlagCheckUniversePlaceBeforeSuspending = require(parent.SharedFlags).GetFFlagCheckUniversePlaceBeforeSuspending
local getFFlagEnableSeamlessVoiceV2 = require(parent.SharedFlags).GetFFlagEnableSeamlessVoiceV2
local getFFlagDisconnectToastClientRewrite = require(parent.SharedFlags).GetFFlagDisconnectToastClientRewrite
local fFlagEnablePartyVoiceChangersInLua = require(parent.SharedFlags).FFlagEnablePartyVoiceChangersInLua
local getFFlagEnableVoiceUxUpdates = require(parent.SharedFlags).GetFFlagEnableVoiceUxUpdates
local WATCHED_NAMESPACES = constantsModule.WATCHED_NAMESPACES
local WATCHED_MESSAGE_TYPES = constantsModule.WATCHED_MESSAGE_TYPES
local VOICE_CHAT_AVAILABILITY = constantsModule.VOICE_CHAT_AVAILABILITY
local MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED = constantsModule.MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED
local MIN_VOICE_CHAT_API_VERSION_LOCAL_MIC_ACTIVITY = constantsModule.MIN_VOICE_CHAT_API_VERSION_LOCAL_MIC_ACTIVITY
local PERMISSION_STATE = constantsModule.PERMISSION_STATE
local VOICE_JOIN_PROGRESS = constantsModule.VOICE_JOIN_PROGRESS
local FAE_ENABLED = constantsModule.FAE_ENABLED
local FAE_SETTINGS_TOAST = constantsModule.FAE_SETTINGS_TOAST
local getShowAgeVerificationOverlayModule = require(requests.GetShowAgeVerificationOverlay)
local getShowPhoneVerificationUpsellModule = require(requests.GetShowPhoneVerificationUpsell)
local t = {
	eventName = "VoiceCapturedDuringVideoCapture",
	description = "Event fired when a video capture has stopped logging if voice was captured",
	links = "",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("VoiceCapturedDuringVideoCaptureThrottlingPercentage", 10000),
	lastUpdated = { 26, 1, 28 }
}
local t_1 = {
	available = nil,
	canUseServicePromise = nil,
	userEligible = false,
	participants = nil,
	localMuted = nil,
	isVoiceChangerActive = false,
	isVoiceChangerHearMyselfActive = false,
	currentVoicePack = nil,
	isTalking = false,
	previousGroupId = nil,
	muteAll = false,
	previousMutedState = nil,
	permissionPromise = nil,
	hasOptedToJoinVoiceOnAgeVerification = false,
	permissionState = if getFFlagJoinWithoutMicPermissions() then PERMISSION_STATE.IDLE else nil,
	recentUsersInteractionData = nil,
	NotificationService = notificationService,
	PermissionsService = permissionsProtocol.default,
	ChatService = chatService,
	voiceEnabled = false,
	service = nil,
	SignalREventTable = {},
	isInCall = false,
	callMutedState = false,
	audioDeviceInputAdded = nil,
	muteChanged = Instance.new("BindableEvent"),
	voiceChangerChanged = Instance.new("BindableEvent"),
	voiceChangerHearMyselfChanged = Instance.new("BindableEvent"),
	muteAllChanged = Instance.new("BindableEvent"),
	participantLeft = Instance.new("BindableEvent"),
	participantJoined = Instance.new("BindableEvent"),
	participantsUpdate = Instance.new("BindableEvent"),
	talkingChanged = Instance.new("BindableEvent"),
	_lastTalkingChangedFireTime = 0,
	_lastTalkingChangedFireValue = nil,
	attemptVoiceRejoin = Instance.new("BindableEvent"),
	onPlayerMuteToggled = Instance.new("BindableEvent"),
	setVoiceUIVisibility = Instance.new("BindableEvent"),
	communicationPermissionsResult = nil,
	VoiceJoinProgress = VOICE_JOIN_PROGRESS.Idle,
	VoiceJoinProgressChanged = Instance.new("BindableEvent"),
	mutedPlayers = {},
	voiceChangerActivePlayers = {},
	BlockStatusChanged = nil,
	AvatarChatService = if getFFlagAvatarChatServiceEnabled() then game:GetService("AvatarChatService") else nil,
	HttpRbxApiService = httpRbxApiService,
	ThirdPartyUserService = thirdPartyUserService,
	CaptureService = if getFFlagEnableVoiceChatMuteForVideoCaptures() then game:GetService("CaptureService") else nil,
	TelemetryService = if var51 then game:GetService("TelemetryService") else nil,
	SendMuteEvent = nil,
	SetVoicePackEvent = nil,
	VoiceChangerWasToggledEvent = nil,
	InputToModifierWire = nil,
	PartyVoiceDeviceInput = nil,
	_mutedAnyone = false,
	canUseServiceResult = nil,
	signalRConnectionChanged = nil,
	signalRConnection = nil,
	AdService = adService,
	isPlayerWatchingAd = false,
	options = {
		allowSeamlessVoice = true,
		passInitErrorInPromiseReject = false,
		forceVoiceEnabled = false
	},
	initializedPostSuspension = false,
	voiceCapturedDuringVideoCapture = false
}
t_1.__index = t_1

function t_1.new(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10) --[[ line: 298 ]]
	-- upvalues: utilsModule (ref), analyticsModule (ref), appStorageService (ref), t_1 (ref), WATCHED_MESSAGE_TYPES (ref), getFIntThrottleParticipantsUpdateMsModule (ref), playersService_1 (ref), name (ref), IXPServiceWrapper (ref), voicePerformanceThrottlingIXPLayerName (ref), throttleParticipantsUpdateIXPLayerValue (ref)
	local tbl = setmetatable({
		previousSessionId = nil,
		HttpRbxApiService = p2,
		eventEmitter = utilsModule.EventEmitter.new(),
		service = p3,
		PermissionsService = p1,
		NotificationService = p5,
		AvatarChatService = p6,
		Analytics = analyticsModule.new(p4),
		SequenceNumbers = {},
		SignalREventTable = {},
		audioDevices = {},
		BlockStatusChanged = p0,
		AppStorageService = p7 or appStorageService,
		ThirdPartyUserService = p8,
		CaptureService = p9,
		AdService = p10
	}, t_1)
	
	for i, v in WATCHED_MESSAGE_TYPES do
		tbl.SignalREventTable[v] = Instance.new("BindableEvent")
	end
	tbl.shouldThrottleParticipantUpdate = false
	tbl.participantsStateThrottleTime = 0
	tbl.lastParticipantsStateUpdate = 0
	tbl.lastStateUpdateCounter = 0
	
	if getFIntThrottleParticipantsUpdateMsModule() > 0 then
		task.spawn(function() --[[ line: 340 ]]
			-- upvalues: playersService_1 (copy), p3 (ref), name (copy), IXPServiceWrapper (copy), voicePerformanceThrottlingIXPLayerName (copy)
			local ok, status = pcall(function() --[[ line: 341 ]]
				-- upvalues: playersService_1 (copy), p3 (copy)
				return if playersService_1.LocalPlayer then p3:IsVoiceEnabledForUserIdAsync(playersService_1.LocalPlayer.UserId) else false
			end)
			
			if not ok then
				name:debug("Unable to get voice enabled status: ", status)
				
				return
			elseif status then
				IXPServiceWrapper:LogUserLayerExposure(voicePerformanceThrottlingIXPLayerName)
			end
		end)
		tbl.participantsStateThrottleTime = getFIntThrottleParticipantsUpdateMsModule() / 1000
		local ok, status = pcall(function() --[[ line: 357 ]]
			-- upvalues: IXPServiceWrapper (copy), voicePerformanceThrottlingIXPLayerName (copy)
			return IXPServiceWrapper:GetLayerData(voicePerformanceThrottlingIXPLayerName)
		end)
		
		if ok and status and status[throttleParticipantsUpdateIXPLayerValue] then
			tbl.shouldThrottleParticipantUpdate = true
		end
	end
	return tbl
end

function t_1:emit(p11, ...) --[[ line: 368 ]]
	self.eventEmitter:emit(p11, ...)
end

function t_1:subscribe(p12, p13) --[[ line: 372 ]]
	self.eventEmitter:addListener(p12, p13)
end

function t_1:unsubscribeAll() --[[ line: 376 ]]
	self.eventEmitter:removeAllListeners()
end

function t_1.CheckCallStateWithPromise(p14) --[[ line: 380 ]]
	-- upvalues: default (ref), name (ref), enums (ref)
	return default:getCallState():andThen(function(p16) --[[ line: 382 ]]
		-- upvalues: name (copy), enums (copy), p14 (ref)
		name:trace("Got user call state")
		
		if p16.status ~= enums.CallStatus.Idle.rawValue() and p16.status ~= enums.CallStatus.Ringing.rawValue() then
			p14.isInCall = true
			p14.callMutedState = p16.muted
			name:trace("Changing call muted state to {}", p16.muted)
		end
	end):catch(function(p15) --[[ line: 394 ]]
		-- upvalues: name (copy)
		name:trace("User not in call {}", p15)
	end)
end

function t_1.CheckCallState(p17) --[[ line: 400 ]]
	-- upvalues: name (ref), default (ref), enums (ref)
	name:trace("Checking user call state")
	local ok, status = pcall(function() --[[ line: 402 ]]
		-- upvalues: default (copy), name (copy), enums (copy), p17 (ref)
		default:getCallState():andThen(function(p19) --[[ line: 404 ]]
			-- upvalues: name (copy), enums (copy), p17 (copy)
			name:trace("Got user call state")
			
			if p19.status ~= enums.CallStatus.Idle.rawValue() and p19.status ~= enums.CallStatus.Ringing.rawValue() then
				p17.isInCall = true
				p17.callMutedState = p19.muted
				name:trace("Changing call muted state to {}", p19.muted)
			end
		end):catch(function(p18) --[[ line: 416 ]]
			-- upvalues: name (copy)
			name:trace("User not in call {}", p18)
		end)
	end)
	
	if not ok then
		name:debug("Error checking user call state {}", status)
	end
end

function t_1._GetShowAgeVerificationOverlay(p20, p21) --[[ line: 435 ]]
	-- upvalues: getShowAgeVerificationOverlayModule (ref), utilsModule (ref)
	return getShowAgeVerificationOverlayModule(utilsModule.bind(p20, "GetRequest"), tostring(game.GameId), tostring(game.PlaceId), p21)
end

function t_1:FetchAgeVerificationOverlay(p22) --[[ line: 444 ]]
	-- upvalues: promiseModule (ref)
	if not self._getShowAgeVerificationOverlayResult then
		if not self._getShowAgeVerificationOverlayPromise then
			self._getShowAgeVerificationOverlayPromise = promiseModule.new(function(p23, _) --[[ line: 447 ]]
				-- upvalues: self (ref), p22 (ref)
				self._getShowAgeVerificationOverlayResult = self:_GetShowAgeVerificationOverlay(p22)
				p23(self._getShowAgeVerificationOverlayResult)
			end)
		end
		self._getShowAgeVerificationOverlayPromise:await()
	end
	return self._getShowAgeVerificationOverlayResult
end

function t_1._GetShowPhoneVerificationUpsell(p24, p25, p26) --[[ line: 463 ]]
	-- upvalues: getShowPhoneVerificationUpsellModule (ref), utilsModule (ref)
	return getShowPhoneVerificationUpsellModule(utilsModule.bind(p24, "GetRequest"), tostring(game.GameId), p25, p26)
end

function t_1:FetchPhoneVerificationUpsell(p27, p28, p29) --[[ line: 476 ]]
	-- upvalues: promiseModule (ref), constantsModule (ref)
	if not self._getShowPhoneVerificationUpsellResult then
		self._getShowPhoneVerificationUpsellResult = {}
		self._getShowPhoneVerificationUpsellPromise = {}
	end
	if not self._getShowPhoneVerificationUpsellResult[p27] or p29 then
		if not self._getShowPhoneVerificationUpsellPromise[p27] or p29 then
			self._getShowPhoneVerificationUpsellPromise[p27] = promiseModule.new(function(p30, _) --[[ line: 487 ]]
				-- upvalues: self (ref), p27 (ref), p28 (ref), constantsModule (copy)
				local var58 = self:_GetShowPhoneVerificationUpsell(p27, p28)
				self._getShowPhoneVerificationUpsellResult[p27] = if type(var58) == "table" and var58.valueProp ~= nil then var58.valueProp else constantsModule.PHONE_UPSELL_VOICE_CHAT_PROP.None
				p30()
			end)
		end
		self._getShowPhoneVerificationUpsellPromise[p27]:await()
	end
	return self._getShowPhoneVerificationUpsellResult[p27]
end

function t_1:DisablePhoneVerificationUpsell() --[[ line: 501 ]]
	-- upvalues: cryoModule (ref), constantsModule (ref)
	self._getShowPhoneVerificationUpsellResult = cryoModule.Dictionary.map(self._getShowPhoneVerificationUpsellResult, function() --[[ line: 504 ]]
		-- upvalues: constantsModule (copy)
		return constantsModule.PHONE_UPSELL_VOICE_CHAT_PROP.None
	end)
end

function t_1:GetNudgeAnalyticsData() --[[ line: 510 ]]
	-- upvalues: playersService (ref)
	return playersService.LocalPlayer.UserId, self:GetSessionId()
end

function t_1:avatarChatUserAndPlaceSettingsValueOfClientFeatures(p31) --[[ line: 515 ]]
	-- upvalues: getFFlagEnableVoiceSignal (ref)
	return {
		universePlaceVoiceEnabledSettings = {
			isUniverseEnabledForVoice = self.AvatarChatService:IsEnabled(p31, Enum.AvatarChatServiceFeature.UniverseAudio),
			isPlaceEnabledForVoice = self.AvatarChatService:IsEnabled(p31, Enum.AvatarChatServiceFeature.PlaceAudio),
			isUniverseEnabledForAvatarVideo = self.AvatarChatService:IsEnabled(p31, Enum.AvatarChatServiceFeature.UniverseVideo),
			isPlaceEnabledForAvatarVideo = self.AvatarChatService:IsEnabled(p31, Enum.AvatarChatServiceFeature.PlaceVideo)
		},
		voiceSettings = {
			bannedUntil = nil,
			isUserEligible = self.AvatarChatService:IsEnabled(p31, Enum.AvatarChatServiceFeature.UserAudioEligible),
			isVoiceEnabled = self.AvatarChatService:IsEnabled(p31, Enum.AvatarChatServiceFeature.UserAudio),
			isAvatarVideoEligible = self.AvatarChatService:IsEnabled(p31, Enum.AvatarChatServiceFeature.UserVideoEligible),
			isAvatarVideoEnabled = self.AvatarChatService:IsEnabled(p31, Enum.AvatarChatServiceFeature.UserVideo),
			isUserVerifiedForVoice = if getFFlagEnableVoiceSignal() then self.AvatarChatService:IsEnabled(p31, Enum.AvatarChatServiceFeature.UserVerifiedForVoice) else nil,
			isBanned = self.AvatarChatService:IsEnabled(p31, Enum.AvatarChatServiceFeature.UserBanned)
		}
	}
end

function t_1:resolveAvatarChatUserAndPlaceSettings() --[[ line: 562 ]]
	local ok, status = pcall(self.AvatarChatService.GetClientFeaturesAsync, self.AvatarChatService)
	
	return if ok then self:avatarChatUserAndPlaceSettingsValueOfClientFeatures(status) else nil
end

function t_1.GetRequest(p32, p33, _) --[[ line: 572 ]]
	-- upvalues: httpService (ref)
	local ok, status = pcall(function() --[[ line: 573 ]]
		-- upvalues: p32 (ref), p33 (ref), httpService (copy)
		return httpService:JSONDecode(p32.HttpRbxApiService:GetAsyncFullUrl(p33, Enum.ThrottlingPriority.Default, Enum.HttpRequestType.Players))
	end)
	
	return ok and status
end

function t_1.PostUserVoiceConnectionStatus(p34, p35) --[[ line: 581 ]]
	-- upvalues: httpService (ref), constantsModule (ref)
	local ok, _ = pcall(function() --[[ line: 582 ]]
		-- upvalues: httpService (copy), p35 (ref), p34 (ref), constantsModule (copy)
		return httpService:JSONDecode(p34.HttpRbxApiService:PostAsyncFullUrl(constantsModule.VOICE_URL .. "/v1/user-voice-connection-state", httpService:JSONEncode({ IsUserVoiceConnected = p35 })))
	end)
	
	return ok
end

function t_1:GetVoiceAnalyticsData() --[[ line: 591 ]]
	-- upvalues: rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref), rbxAnalyticsService (ref)
	return {
		micAvailability = "",
		universeId = game.GameId,
		placeId = game.PlaceId,
		playSessionId = if rbxAnalyticsServiceExposePlaySessionIdEngineFeature then rbxAnalyticsService:GetPlaySessionId() else "",
		voiceSessionId = if self.service then self:GetSessionId() else ""
	}
end

function t_1:RecordExperienceJoinMicPermissionStatus(p36) --[[ line: 603 ]]
	-- upvalues: permissionsProtocol (ref), PERMISSION_STATE (ref)
	local voiceAnalyticsData = self:GetVoiceAnalyticsData()
	
	if p36 == nil or typeof(p36) ~= "table" then
		if self.permissionState then
			if self.permissionState == PERMISSION_STATE.LISTEN_AND_TALK then
				voiceAnalyticsData.micAvailability = "Granted"
			else
				voiceAnalyticsData.micAvailability = "Denied"
			end
		end
	elseif p36.status == permissionsProtocol.Status.AUTHORIZED then
		voiceAnalyticsData.micAvailability = "Granted"
	else
		voiceAnalyticsData.micAvailability = "Denied"
	end
	self.Analytics:reportVoiceEvents("experienceJoinDeviceMicPermissionEvent", voiceAnalyticsData)
end

function t_1:CheckCaptureMute() --[[ line: 623 ]]
	-- upvalues: getFFlagEnableVoiceChatMuteForVideoCaptures (ref)
	return if getFFlagEnableVoiceChatMuteForVideoCaptures() then self.CaptureService:IsCapturingVideo() else false
end

function t_1:ToggleMuteSome(p37, p38, p39, p40) --[[ line: 632 ]]
	-- upvalues: voiceChatService (ref), enableMutedByLocalUserEngineFeature (ref), playersService (ref)
	self:ensureInitialized("mute some players")
	self._mutedAnyone = true
	local t = {}
	p38 = p38 or self:CheckCaptureMute()
	
	for i, v in p37 do
		if voiceChatService.UseNewAudioApi then
			t[v] = true
			self.mutedPlayers[v] = p38
		else
			self.service:SubscribePause(v, p38)
		end
		local var62 = self.participants[tostring(v)]
		
		if var62 then
			var62.isMutedLocally = p38
			self.participantsUpdate:Fire(self.participants)
		end
	end
	if voiceChatService.UseNewAudioApi then
		for i_1 in self.audioDevices do
			if i_1.Player and t[i_1.Player.UserId] then
				if not enableMutedByLocalUserEngineFeature or i_1.Player == playersService.LocalPlayer then
					i_1.Active = not p38
					continue
				else
					i_1.MutedByLocalUser = p38
				end
			end
		end
	end
	if p39 and p40 then
		self.Analytics:reportVoiceMuteGroup(self:JoinWithVoiceMuteData({ groupType = p39, context = p40, muted = p38 }))
	end
end

function t_1:GetMutedAnyone() --[[ line: 677 ]]
	return self._mutedAnyone
end

function t_1:ToggleMutePlayer(p41, p42) --[[ line: 681 ]]
	-- upvalues: voiceChatService (ref), name (ref), utilsModule (ref), getFFlagEnableFtuxExitOnMuteToggleModule (ref), enableMutedByLocalUserEngineFeature (ref), playersService (ref)
	self:ensureInitialized("mute player " .. p41)
	self._mutedAnyone = true
	local var63 = (if voiceChatService.UseNewAudioApi then not self.mutedPlayers[p41] else not self.service:IsSubscribePaused(p41)) or self:CheckCaptureMute()
	name:trace("Setting mute for {} to {}", utilsModule.shorten(p41), var63)
	
	if getFFlagEnableFtuxExitOnMuteToggleModule() then
		self.onPlayerMuteToggled:Fire()
	end
	if voiceChatService.UseNewAudioApi then
		self.mutedPlayers[p41] = var63
		
		for i in self.audioDevices do
			if i.Player and i.Player.UserId == p41 then
				if enableMutedByLocalUserEngineFeature and i.Player ~= playersService.LocalPlayer then
					i.MutedByLocalUser = var63
					continue
				end
				local var64 = self.participants[tostring(p41)]
				i.Active = not var63 and (var64 and not var64.isMuted)
				continue
			end
		end
		self:emit("OnPlayerMuted")
	else
		self.service:SubscribePause(p41, var63)
	end
	for i, v in pairs(self.participants) do
		if v.userId == p41 then
			v.isMutedLocally = var63
			self.participantsUpdate:Fire(self.participants)
		end
	end
	if p42 then
		self.Analytics:reportVoiceMuteIndividual(self:JoinWithVoiceMuteData({
			targetUserId = tonumber(p41),
			context = p42,
			muted = var63
		}))
	end
end

function t_1:MuteAll(p43, p44) --[[ line: 735 ]]
	-- upvalues: voiceChatService (ref), name (ref), playersService (ref), enableMutedByLocalUserEngineFeature (ref), constantsModule (ref)
	self:ensureInitialized("mute all")
	self._mutedAnyone = true
	p43 = p43 or self:CheckCaptureMute()
	
	if voiceChatService.UseNewAudioApi then
		self.muteAll = p43
		name:trace("Setting self mute all to {} context: {}", p43, p44)
		
		for i in self.audioDevices do
			if i.Player and i.Player ~= playersService.LocalPlayer then
				name:debug("Local muting {} to '{} = {}'", i.Player.Name, i.Active, p43)
				
				if enableMutedByLocalUserEngineFeature then
					i.MutedByLocalUser = p43
				else
					local userId = i.Player.UserId
					self.mutedPlayers[userId] = p43
					local var66 = self.participants[tostring(userId)]
					i.Active = not p43 and (var66 and not var66.isMuted)
				end
			end
		end
	else
		self.service:SubscribePauseAll(p43)
	end
	for i, v in pairs(self.participants) do
		v.isMutedLocally = p43
		self.participantsUpdate:Fire(self.participants)
	end
	self.muteAllChanged:Fire(p43)
	
	if p44 then
		self.Analytics:reportVoiceMuteGroup(self:JoinWithVoiceMuteData({
			groupType = constantsModule.VOICE_GROUP_TYPE.ALL,
			context = p44,
			muted = p43
		}))
	end
end

function t_1:FetchVoicePermissions() --[[ line: 778 ]]
	if not self.communicationPermissionsResult then
		self.communicationPermissionsResult = self:resolveAvatarChatUserAndPlaceSettings()
	end
	return self.communicationPermissionsResult
end

function t_1:verifyUniverseAndPlaceCanUseVoice() --[[ line: 786 ]]
	-- upvalues: getFFlagAvatarChatServiceEnabled (ref), getFFlagVoiceChatServiceManagerUseAvatarChatModule (ref), analyticsModule (ref)
	local var67 = if getFFlagAvatarChatServiceEnabled() and getFFlagVoiceChatServiceManagerUseAvatarChatModule() then self:resolveAvatarChatUserAndPlaceSettings() else self:FetchAgeVerificationOverlay()
	
	if var67 then
		local universePlaceVoiceEnabledSettings = var67.universePlaceVoiceEnabledSettings
		
		return universePlaceVoiceEnabledSettings and (universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice and universePlaceVoiceEnabledSettings.isUniverseEnabledForVoice)
	end
	self:_reportJoinFailed("invalidResponse", analyticsModule.ERROR)
	
	return false
end

function t_1:IsUserInFTUX() --[[ line: 806 ]]
	-- upvalues: getFFlagSeamlessVoiceFTUX (ref), getFFlagCheckUniversePlaceBeforeSuspending (ref), name (ref)
	if not getFFlagSeamlessVoiceFTUX() then
		return false
	elseif getFFlagCheckUniversePlaceBeforeSuspending() and not self:verifyUniverseAndPlaceCanUseVoice() then
		return false
	end
	local appStorageService = game:GetService("AppStorageService")
	local var69 = nil
	
	if not pcall(function() --[[ line: 816 ]]
		-- upvalues: appStorageService (ref), var69 (write)
		var69 = appStorageService:GetItem("SeamlessVoiceFTUX") == "true"
	end) then
		name:warning("Failed to read FTUX/STUX from AppStorage")
		
		return false
	end
	local var70 = self:FetchAgeVerificationOverlay()
	
	if type(var70) == "table" and var70.voiceSettings and var70.voiceSettings.seamlessVoiceStatus ~= 3 then
		name:debug("User not eligible for FTUX/STUX")
		
		return false
	end
	return not var69
end

function t_1.isEnableDefaultVoiceOnForPlace(_) --[[ line: 839 ]]
	-- upvalues: voiceChatService (ref)
	if not game:IsLoaded() then
		game.Loaded:Wait()
	end
	return voiceChatService.UseNewAudioApi or voiceChatService.EnableDefaultVoice
end

function t_1:verifyPlaceCanUseVoice(p45, p46) --[[ line: 850 ]]
	-- upvalues: analyticsModule (ref)
	if not p45 or not p46 then
		self:_reportJoinFailed("invalidResponse", analyticsModule.ERROR)
		
		return false
	elseif not p45.isUniverseEnabledForVoice then
		self:_reportJoinFailed("universeNotEnabled")
		
		return false
	end
	self:emit("OnUserAndPlaceCanUseVoiceResolved", p46, p45)
	
	if not p45.isPlaceEnabledForVoice then
		self:_reportJoinFailed("placeNotEnabled")
		
		return false
	end
	return self:isEnableDefaultVoiceOnForPlace()
end

function t_1:EligibleForFaeUpsell() --[[ line: 875 ]]
	-- upvalues: FAE_ENABLED (ref)
	local var71 = self:FetchAgeVerificationOverlay()
	
	return if var71 and type(var71) == "table" then var71.inExperienceFaeUpsell == FAE_ENABLED and var71.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice else false
end

function t_1:OptUserToJoinVoice() --[[ line: 885 ]]
	-- upvalues: name (ref)
	name:debug("Opting user to join voice on age verification")
	self.hasOptedToJoinVoiceOnAgeVerification = true
end

function t_1:SetupFAECompleteListener() --[[ line: 890 ]]
	-- upvalues: name (ref)
	name:debug("Setting up FAE complete listener")
	
	if game:GetEngineFeature("ChatReconcileAccess") then
		name:debug("Using ChatService ReconcileCommunicationAccessCompleted event")
		self.ChatService.ReconcileCommunicationAccessCompleted:Connect(function() --[[ line: 894 ]]
			-- upvalues: name (copy), self (ref)
			name:debug("FAE complete listener triggered, re-fetching voice permissions")
			self.communicationPermissionsResult = nil
			self:FetchVoicePermissions()
			self._getShowAgeVerificationOverlayResult = self:_GetShowAgeVerificationOverlay()
			
			if self.hasOptedToJoinVoiceOnAgeVerification then
				name:debug("FAE complete listener triggered, attempting voice rejoin")
				
				if self:IsSeamlessVoice() then
					name:debug("Opting-in user to voice")
					self.AvatarChatService:EnableVoice()
					self.attemptVoiceRejoin:Fire()
				end
			end
		end)
	end
end

function t_1:EligibleForAgeCheckToast() --[[ line: 914 ]]
	-- upvalues: FAE_SETTINGS_TOAST (ref)
	local var72 = self:FetchAgeVerificationOverlay()
	
	return if var72 and type(var72) == "table" then var72.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice and (self:isEnableDefaultVoiceOnForPlace() and var72.inExperienceFaeUpsell == FAE_SETTINGS_TOAST) else false
end

function t_1:userAndPlaceCanUseVoice() --[[ line: 924 ]]
	-- upvalues: getFFlagAvatarChatServiceEnabled (ref), getFFlagVoiceChatServiceManagerUseAvatarChatModule (ref), getShowAgeVerificationOverlayModule (ref), utilsModule (ref), analyticsModule (ref), name (ref), getFFlagEnableVoiceSignal (ref), getFFlagEnableInExpPhoneVoiceUpsellEntrypoints (ref), constantsModule (ref), VOICE_JOIN_PROGRESS (ref), getFFlagEnableVoiceUxUpdates (ref), getFFlagNonVoiceFTUX (ref), getFFlagEnableSeamlessVoiceV2 (ref)
	if self.ThirdPartyUserService ~= nil and self.ThirdPartyUserService:IsChatRestrictionSupported() and self.ThirdPartyUserService:GetVoiceChatRestrictionStatus() ~= Enum.ChatRestrictionStatus.NotRestricted then
		return false
	end
	local var73 = if getFFlagAvatarChatServiceEnabled() and getFFlagVoiceChatServiceManagerUseAvatarChatModule() then self:resolveAvatarChatUserAndPlaceSettings() else getShowAgeVerificationOverlayModule(utilsModule.bind(self, "GetRequest"), tostring(game.GameId), tostring(game.PlaceId))
	
	if not var73 then
		self:_reportJoinFailed("invalidResponse", analyticsModule.ERROR)
		
		return false
	elseif self.options.forceVoiceEnabled then
		var73.voiceSettings.isVoiceEnabled = true
		name:debug("bypassing voice permissions check")
	end
	local universePlaceVoiceEnabledSettings = var73.universePlaceVoiceEnabledSettings
	local voiceSettings = var73.voiceSettings
	name:trace("Voice settings endpoint returned {}", var73)
	
	if not self:verifyPlaceCanUseVoice(universePlaceVoiceEnabledSettings, voiceSettings) then
		return false
	elseif getFFlagEnableVoiceSignal() then
		self.communicationPermissionsResult = var73
		local var74 = getFFlagEnableInExpPhoneVoiceUpsellEntrypoints() and os.time()
		
		if self:UserEligibleForInExperienceUpsell() or (getFFlagEnableInExpPhoneVoiceUpsellEntrypoints() and (not self:UserVoiceEnabled() and (not voiceSettings.isUserVerifiedForVoice and (if self:FetchPhoneVerificationUpsell(constantsModule.IN_EXP_PHONE_UPSELL_IXP_LAYER) ~= constantsModule.PHONE_UPSELL_VOICE_CHAT_PROP.VoiceChat then var74 and self:FetchPhoneVerificationUpsell(constantsModule.EXIT_CONFIRMATION_PHONE_UPSELL_IXP_LAYER, var74) == constantsModule.PHONE_UPSELL_VOICE_CHAT_PROP.VoiceChat else true)))) then
			self:ChangeVoiceJoinProgress(VOICE_JOIN_PROGRESS.Suspended)
		end
		if getFFlagEnableVoiceUxUpdates() then
			local voiceConnectCookie = self:GetVoiceConnectCookie()
			
			if self:HasSeamlessVoiceFeature(constantsModule.SeamlessVoiceFeatures.DeferConnection) and voiceConnectCookie == "" or self:IsSeamlessVoice() and voiceConnectCookie == "false" then
				self:ChangeVoiceJoinProgress(VOICE_JOIN_PROGRESS.Suspended)
			elseif self:EligibleForFaeUpsell() then
				name:debug("Suspending voice join for FAE Eligible user")
				self:ChangeVoiceJoinProgress(VOICE_JOIN_PROGRESS.Suspended)
				self:SetupFAECompleteListener()
			end
		elseif getFFlagNonVoiceFTUX() and self:IsUserInFTUX() then
			self:ChangeVoiceJoinProgress(VOICE_JOIN_PROGRESS.Suspended)
		end
		if self:IsSeamlessVoice() and not self:GetVoiceConnectCookieValue() then
			name:debug("Suspending voice join due to voice connect cookie")
			self:ChangeVoiceJoinProgress(VOICE_JOIN_PROGRESS.Suspended)
		elseif getFFlagEnableSeamlessVoiceV2() and self:IsNewSeamlessVoiceUserDisconnect() then
			name:debug("Suspending voice join for new seamless voice user")
			self:ChangeVoiceJoinProgress(VOICE_JOIN_PROGRESS.Suspended)
		elseif self:IsSeamlessVoice() and self:UserOnlyEligibleForVoice() then
			name:debug("Suspending voice join for opt-out user")
			self:ChangeVoiceJoinProgress(VOICE_JOIN_PROGRESS.Suspended)
		end
		task.spawn(function() --[[ line: 1021 ]]
			-- upvalues: self (ref)
			self:FetchAgeVerificationOverlay()
		end)
	end
	if not voiceSettings.isVoiceEnabled then
		self:_reportJoinFailed("userNotEnabled")
	end
	return voiceSettings.isVoiceEnabled
end

function t_1.voicePermissionGranted(_, p47) --[[ line: 1036 ]]
	-- upvalues: permissionsProtocol (ref), cryoModule (ref)
	local _ = false
	
	return if typeof(p47) == "table" then if p47.status ~= permissionsProtocol.Status.AUTHORIZED then not cryoModule.List.find(p47.missingPermissions, permissionsProtocol.Permissions.MICROPHONE_ACCESS) else true else p47 == permissionsProtocol.Status.AUTHORIZED
end

function t_1.RawGetPermissions(p48, p49) --[[ line: 1056 ]]
	-- upvalues: promiseModule (ref)
	return promiseModule.new(function(p50, _) --[[ line: 1057 ]]
		-- upvalues: p48 (ref), p49 (ref)
		p48:emit("GetPermissions", function(p51) --[[ line: 1058 ]]
			-- upvalues: p50 (ref)
			p50(p51)
		end, p49, true, true)
	end)
end

function t_1:requestMicPermission() --[[ line: 1065 ]]
	-- upvalues: name (ref), permissionsProtocol (ref), getFFlagEnableSeamlessVoiceV2 (ref), getFFlagJoinWithoutMicPermissions (ref), PERMISSION_STATE (ref), promiseModule (ref), getFFlagEnableExpJoinMicPermAnalyticsModule (ref), analyticsModule (ref)
	if self.permissionPromise then
		name:trace("PermissionProtocol already invoked")
		
		return self.permissionPromise
	end
	local var79
	local list = { permissionsProtocol.Permissions.MICROPHONE_ACCESS }
	local _ = nil
	
	if getFFlagEnableSeamlessVoiceV2() or not getFFlagJoinWithoutMicPermissions(self:IsSeamlessVoice()) then
		var79 = self.PermissionsService:requestPermissions(list)
	else
		name:debug("Requesting device permission")
		local _ = nil
		local _ = nil
		local ok, status, var77 = pcall(function() --[[ line: 1079 ]]
			-- upvalues: self (ref), list (ref)
			return self:RawGetPermissions(list):await()
		end)
		local var78 = var77
		
		if not ok or not status then
			name:error("PermissionsService call failed.")
			self.permissionState = PERMISSION_STATE.LISTEN_ONLY
		elseif var78.status == permissionsProtocol.Status.AUTHORIZED then
			self.permissionState = PERMISSION_STATE.LISTEN_AND_TALK
		elseif var78.missingPermissions then
			self.permissionState = PERMISSION_STATE.PENDING_MIC
		elseif var78.deniedPermissions then
			self.permissionState = PERMISSION_STATE.LISTEN_ONLY
		else
			name:error("PermissionsService returned unknown permission state. Defaulting to listen only.")
			self.permissionState = PERMISSION_STATE.LISTEN_ONLY
		end
		name:debug("Joining without mic permissions. Permission State: {}", self.permissionState)
		var79 = promiseModule.resolve()
	end
	self.permissionPromise = var79:andThen(function(p52) --[[ line: 1108 ]]
		-- upvalues: getFFlagEnableExpJoinMicPermAnalyticsModule (copy), self (ref), getFFlagEnableSeamlessVoiceV2 (copy), getFFlagJoinWithoutMicPermissions (copy), promiseModule (copy), name (copy), analyticsModule (copy), permissionsProtocol (copy)
		if getFFlagEnableExpJoinMicPermAnalyticsModule() then
			self:RecordExperienceJoinMicPermissionStatus(p52)
		end
		if not getFFlagEnableSeamlessVoiceV2() and getFFlagJoinWithoutMicPermissions() then
			return promiseModule.resolve()
		elseif p52 or p52.status then
			name:debug("Permission status {}", p52.status)
			local var80 = p52.status == permissionsProtocol.Status.AUTHORIZED
			
			return if self.options.passInitErrorInPromiseReject and not var80 then promiseModule.reject({ code = "INIT_ERROR_PERM_NOT_GRANTED" }) else var80 and promiseModule.resolve() or promiseModule.reject()
		end
		name:debug("No permission response, rejecting access")
		self:_reportJoinFailed("noPermissionResponse", analyticsModule.ERROR)
		
		return if self.options.passInitErrorInPromiseReject then promiseModule.reject({ code = "INIT_ERROR_NO_PERM_RESPONSE" }) else promiseModule.reject()
	end):andThen(function() --[[ line: 1132 ]]
		-- upvalues: self (ref), promiseModule (copy)
		self:emit("OnRequestMicPermissionResolved")
		
		return promiseModule.resolve()
	end):catch(function() --[[ line: 1137 ]]
		-- upvalues: self (ref), promiseModule (copy)
		self:emit("OnRequestMicPermissionRejected")
		
		return if self.options.passInitErrorInPromiseReject then promiseModule.reject({ code = "INIT_ERROR_MIC_PERM_REJECTED" }) else promiseModule.reject()
	end)
	
	return self.permissionPromise
end

function t_1:JoinByGroupIdToken(p53, p54) --[[ line: 1147 ]]
	self.previousGroupId = p53
	self.previousMutedState = p54
	
	return self.service:JoinByGroupIdToken(p53, p54)
end

function t_1:EnableVoice() --[[ line: 1153 ]]
	-- upvalues: name (ref)
	name:trace("Enabling voice")
	self.AvatarChatService:GetPropertyChangedSignal("ClientFeatures"):Once(function() --[[ line: 1156 ]]
		-- upvalues: self (ref)
		self.attemptVoiceRejoin:Fire()
	end)
	self.AvatarChatService:EnableVoice()
end

function t_1:ChangeVoiceJoinProgress(p55) --[[ line: 1162 ]]
	self.VoiceJoinProgress = p55
	self.VoiceJoinProgressChanged:Fire(self.VoiceJoinProgress)
end

function t_1:setOptions(p56) --[[ line: 1167 ]]
	self.options = p56
end

function t_1:ShouldShowJoinVoiceOnDisconnect() --[[ line: 1171 ]]
	-- upvalues: VOICE_JOIN_PROGRESS (ref)
	return self:IsSeamlessVoice() and self.VoiceJoinProgress == VOICE_JOIN_PROGRESS.Suspended
end

function t_1:IsSeamlessVoice() --[[ line: 1175 ]]
	-- upvalues: getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (ref), getFFlagCheckUniversePlaceBeforeSuspending (ref), constantsModule (ref)
	if getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() and not self.options.allowSeamlessVoice then
		return false
	end
	local var81 = self:FetchAgeVerificationOverlay()
	
	if type(var81) ~= "table" or not var81 or not var81.voiceSettings then
		return false
	elseif getFFlagCheckUniversePlaceBeforeSuspending() and not self:verifyUniverseAndPlaceCanUseVoice() then
		return false
	end
	local seamlessVoiceStatus = var81.voiceSettings.seamlessVoiceStatus
	
	return if seamlessVoiceStatus ~= constantsModule.SeamlessVoiceStatus.EnabledExistingUser then seamlessVoiceStatus == constantsModule.SeamlessVoiceStatus.EnabledNewUser else true
end

function t_1:HasSeamlessVoiceFeature(p57) --[[ line: 1197 ]]
	-- upvalues: getFFlagEnableSeamlessVoiceFeatureModule (ref), utilsModule (ref), constantsModule (ref)
	if not self.options.allowSeamlessVoice or not self:verifyUniverseAndPlaceCanUseVoice() then
		return false
	end
	local var82 = self:FetchAgeVerificationOverlay()
	
	if not self:_isValidAgeVerificationOverlayData(var82) then
		return false
	end
	local seamlessVoiceVariant = var82.voiceSettings.seamlessVoiceVariant
	
	if not seamlessVoiceVariant then
		return false
	elseif getFFlagEnableSeamlessVoiceFeatureModule() then
		if type(p57) == "string" then
			p57 = { p57 }
		end
		if not getFFlagEnableSeamlessVoiceFeatureModule(p57) then
		end
		local t = {}
		
		for i, v in pairs(utilsModule.jsonDecode(seamlessVoiceVariant)) do
			t[v] = true
		end
		if #p57 == 1 and p57[1] == constantsModule.SeamlessVoiceFeatures.ConnectDisconnect and seamlessVoiceVariant == constantsModule.SeamlessVoiceVariants.OnlyConnectDisconnect then
			return true
		end
		for i, v_1 in pairs(p57) do
			if not t[v_1] then
				return false
			end
		end
		return true
	else
		local var84 = ({
			[constantsModule.SeamlessVoiceFeatures.ConnectDisconnect] = function(p58) --[[ line: 1242 ]]
				-- upvalues: constantsModule (copy)
				return p58 ~= constantsModule.SeamlessVoiceVariants.Control
			end,
			[constantsModule.SeamlessVoiceFeatures.HearingWithoutMicPermissions] = function(p59) --[[ line: 1245 ]]
				-- upvalues: constantsModule (copy)
				return p59 == constantsModule.SeamlessVoiceVariants.HearingWithoutMicPermissions
			end
		})[p57]
		
		return if var84 then var84(seamlessVoiceVariant) else false
	end
end

function t_1:IsNewSeamlessVoiceUserDisconnect() --[[ line: 1259 ]]
	-- upvalues: constantsModule (ref)
	if not self.options.allowSeamlessVoice or not self:verifyUniverseAndPlaceCanUseVoice() then
		return false
	end
	local var85 = self:FetchAgeVerificationOverlay()
	
	if not self:_isValidAgeVerificationOverlayData(var85) then
		return false
	elseif var85.voiceSettings.seamlessVoiceStatus == constantsModule.SeamlessVoiceStatus.EnabledNewUser then
		local ok, status = pcall(function() --[[ line: 1278 ]]
			-- upvalues: self (ref), constantsModule (copy)
			return self.AppStorageService:GetItem(constantsModule.SEAMLESS_VOICE_FTUX_KEY)
		end)
		
		return ok and status == "false"
	end
	return false
end

function t_1._isValidAgeVerificationOverlayData(_, p60) --[[ line: 1286 ]]
	return type(p60) == "table" and (p60 and p60.voiceSettings)
end

function t_1:UserInInExperienceUpsellTreatment() --[[ line: 1290 ]]
	-- upvalues: constantsModule (ref)
	local var86 = self:FetchAgeVerificationOverlay()
	
	if not var86 then
		return false
	end
	local showVoiceInExperienceUpsellVariant = var86.showVoiceInExperienceUpsellVariant
	
	return if showVoiceInExperienceUpsellVariant ~= constantsModule.IN_EXP_UPSELL_VARIANT.VARIANT1 then if showVoiceInExperienceUpsellVariant ~= constantsModule.IN_EXP_UPSELL_VARIANT.VARIANT2 then showVoiceInExperienceUpsellVariant == constantsModule.IN_EXP_UPSELL_VARIANT.VARIANT3 else true else true
end

function t_1:UserOnlyEligibleForVoice() --[[ line: 1302 ]]
	-- upvalues: showJoinVoiceRaceConditionFix (ref)
	local communicationPermissionsResult = self.communicationPermissionsResult
	
	if not communicationPermissionsResult or not communicationPermissionsResult.voiceSettings or not communicationPermissionsResult.universePlaceVoiceEnabledSettings then
		if showJoinVoiceRaceConditionFix then
			self:FetchVoicePermissions()
			communicationPermissionsResult = self.communicationPermissionsResult
		else
			return false
		end
	end
	return communicationPermissionsResult.voiceSettings.isUserVerifiedForVoice and (not communicationPermissionsResult.voiceSettings.isVoiceEnabled and communicationPermissionsResult.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice)
end

function t_1:UserOnlyEligibleForVoiceViaOverlay() --[[ line: 1318 ]]
	local var87 = self:FetchAgeVerificationOverlay()
	
	return if self:_isValidAgeVerificationOverlayData(var87) then var87.voiceSettings.isVerifiedForVoice and (not var87.voiceSettings.isVoiceEnabled and var87.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice) else false
end

function t_1:UserVoiceEnabled() --[[ line: 1331 ]]
	local communicationPermissionsResult = self.communicationPermissionsResult
	
	return if communicationPermissionsResult and communicationPermissionsResult.voiceSettings and communicationPermissionsResult.universePlaceVoiceEnabledSettings then communicationPermissionsResult.voiceSettings.isVoiceEnabled and communicationPermissionsResult.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice else false
end

function t_1:UserEligibleForInExperienceUpsell() --[[ line: 1341 ]]
	-- upvalues: getFFlagEnableVoiceSignal (ref)
	local var88 = self:UserOnlyEligibleForVoice()
	
	if not var88 then
		return false
	elseif getFFlagEnableVoiceSignal() then
		return var88 and self:UserInInExperienceUpsellTreatment()
	end
	local var89 = self:FetchAgeVerificationOverlay()
	
	return var88 and (var89 and var89.showVoiceInExperienceUpsell)
end

function t_1:canUseServiceAsync() --[[ line: 1362 ]]
	-- upvalues: name (ref), promiseModule (ref), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (ref), getFFlagEnableVoiceSignal (ref), VOICE_JOIN_PROGRESS (ref), VOICE_CHAT_AVAILABILITY (ref), voiceChatService (ref), consoleVoiceIXPEnabled (ref), IXPServiceWrapper (ref), consoleVoiceIXPLayerName (ref), consoleVoiceEnabledIXPLayerValue (ref)
	if self.available == nil and game:GetEngineFeature("VoiceChatSupported") then
		if not self.canUseServicePromise then
			self.canUseServicePromise = promiseModule.defer(function(p61, p62) --[[ line: 1372 ]]
				-- upvalues: self (ref), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), getFFlagEnableVoiceSignal (copy), VOICE_JOIN_PROGRESS (copy), name (copy), VOICE_CHAT_AVAILABILITY (copy), voiceChatService (copy), consoleVoiceIXPEnabled (copy), IXPServiceWrapper (copy), consoleVoiceIXPLayerName (copy), consoleVoiceEnabledIXPLayerValue (copy)
				local var90 = self:userAndPlaceCanUseVoice()
				
				if getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() then
					self.canUseServiceResult = var90
					self:emit("OnCanUseServiceResult", var90)
				end
				if getFFlagEnableVoiceSignal() and self.VoiceJoinProgress == VOICE_JOIN_PROGRESS.Suspended then
					name:debug("Place is voice enabled but user is not, delaying voice rejection")
					self.attemptVoiceRejoin.Event:Wait()
					name:debug("Attempting voice rejoin")
					self.communicationPermissionsResult.voiceSettings.isVoiceEnabled = true
					self.userEligible = true
					self.initializedPostSuspension = true
					p61()
					self:ChangeVoiceJoinProgress(VOICE_JOIN_PROGRESS.Joining)
					
					return
				elseif var90 then
					if game:GetEngineFeature("VoiceChatEnabledRccProperties") and (not voiceChatService.VoiceChatEnabledForUniverseOnRcc or not voiceChatService.VoiceChatEnabledForPlaceOnRcc) then
						name:debug("Disabling voice chat due to RCC Response. Universe: {}, Place: {}", voiceChatService.VoiceChatEnabledForUniverseOnRcc, voiceChatService.VoiceChatEnabledForPlaceOnRcc)
						
						if not voiceChatService.VoiceChatEnabledForUniverseOnRcc then
							self:_reportJoinFailed("universeNotEnabled")
						elseif not voiceChatService.VoiceChatEnabledForPlaceOnRcc then
							self:_reportJoinFailed("placeNotEnabled")
						end
						self.available = VOICE_CHAT_AVAILABILITY.PlaceNotAvailable
						
						if self.options.passInitErrorInPromiseReject then
							p62({ code = "INIT_ERROR_PLACE_NOT_AVAILABLE" })
							
							return
						end
						p62()
						
						return
					elseif not consoleVoiceIXPEnabled then
						self.userEligible = true
						p61()
						
						return
					end
					IXPServiceWrapper:WaitForInitialization()
					local ok, status = pcall(function() --[[ line: 1432 ]]
						-- upvalues: IXPServiceWrapper (copy), consoleVoiceIXPLayerName (copy)
						return IXPServiceWrapper:GetLayerData(consoleVoiceIXPLayerName)
					end)
					
					if ok and status and status[consoleVoiceEnabledIXPLayerValue] ~= nil then
						self.userEligible = status[consoleVoiceEnabledIXPLayerValue]
						IXPServiceWrapper:LogUserLayerExposure(consoleVoiceIXPLayerName)
					end
					if self.userEligible then
						p61()
						
						return
					elseif self.options.passInitErrorInPromiseReject then
						p62({ code = "INIT_ERROR_IXP_NOT_ELIGIBLE" })
						
						return
					end
					p62()
					
					return
				else
					name:info("Voice access denied")
					self.available = VOICE_CHAT_AVAILABILITY.UserNotAvailable
					
					if self.options.passInitErrorInPromiseReject then
						p62({ code = "INIT_ERROR_USER_NOT_AVAILABLE" })
						
						return
					end
					p62()
				end
			end):andThen(function() --[[ line: 1454 ]]
				-- upvalues: self (ref)
				return self:requestMicPermission()
			end)
		end
		return self.canUseServicePromise
	else
		name:debug("Voice Chat is not Available, rejecting canUseService promise")
		
		return if self.options.passInitErrorInPromiseReject then promiseModule.reject({ code = "INIT_ERROR_VOICE_NOT_SUPPORTED" }) else promiseModule.reject()
	end
end

function t_1:_setRecentUserState(p63, p64) --[[ line: 1461 ]]
	-- upvalues: cryoModule (ref)
	self.recentUsersInteractionData = cryoModule.Dictionary.join(self.recentUsersInteractionData, {
		[tostring(p63)] = cryoModule.Dictionary.join(self.recentUsersInteractionData[tostring(p63)] or {}, p64)
	})
end

function t_1:getRecentUsersInteractionData() --[[ line: 1471 ]]
	self:_updateRecentUsersInteractionData()
	
	return self.recentUsersInteractionData
end

function t_1:GetSignalREvent(p65) --[[ line: 1476 ]]
	return self.SignalREventTable[p65].Event
end

function t_1:StartModerationSignal() --[[ line: 1481 ]]
	-- upvalues: name (ref), getFFlagVoiceChatClientRewriteMasterLua (ref), voiceChatService (ref)
	if not self.playerModeratedConnection then
		self.playerModeratedConnection = self:GetSignalREvent("ParticipantModeratedFromVoice"):Connect(function() --[[ line: 1484 ]]
			-- upvalues: name (copy), self (ref), getFFlagVoiceChatClientRewriteMasterLua (copy), voiceChatService (copy)
			name:debug("User Moderated")
			self.previousSessionId = self.service:GetSessionId()
			self:emit("OnPlayerModerated")
			
			if getFFlagVoiceChatClientRewriteMasterLua() then
				voiceChatService:notifyServerACSCleanup()
				voiceChatService:leaveVoice()
				
				return
			end
			voiceChatService:notifyServerACSCleanup()
			self.service:Leave()
		end)
	end
end

function t_1:StopModerationSignal() --[[ line: 1499 ]]
	if self.playerModeratedConnection then
		self.playerModeratedConnection:Disconnect()
		self.playerModeratedConnection = nil
	end
end

function t_1:_updateRecentUsersInteractionData() --[[ line: 1506 ]]
	-- upvalues: stringKeyFixForParticipantsTable (ref), getFFlagClearUserFromRecentVoiceDataOnLeaveModule (ref), playersService (ref), getFIntVoiceUsersInteractionExpiryTimeSecondsModule (ref), cryoModule (ref)
	local timestamp = os.time()
	local t = {}
	
	if self.recentUsersInteractionData then
		for i, v in pairs(self.recentUsersInteractionData) do
			local var93 = if stringKeyFixForParticipantsTable then self.participants[tostring(i)] else self.participants[i]
			
			if getFIntVoiceUsersInteractionExpiryTimeSecondsModule() <= timestamp - v.lastHeardTime and (not var93 or var93.isMuted) or getFFlagClearUserFromRecentVoiceDataOnLeaveModule() and not playersService:GetPlayerByUserId(tonumber(i)) then
				t[i] = cryoModule.None
			end
		end
		self.recentUsersInteractionData = cryoModule.Dictionary.join(self.recentUsersInteractionData, t)
	end
end

function t_1:SetupParticipantListeners() --[[ line: 1530 ]]
	-- upvalues: name (ref), getFFlagClearUserFromRecentVoiceDataOnLeaveModule (ref), stringKeyFixForParticipantsTable (ref), getFFlagFixGetPlayerByUserIdStringCastModule (ref), playersService (ref), voiceChatService (ref), fFlagEnablePartyVoiceChangersInLua (ref), getFFlagBatchVoiceParticipantsUpdatesModule (ref), var51 (ref), getFFlagVoiceChatClientRewriteMasterLua (ref), stopModerationConnectionOnLeave (ref), disableRejoinGroupIdDoubleRead (ref), getFFlagDisconnectToastClientRewrite (ref), getFFlagEnableVoiceSignal (ref), VOICE_JOIN_PROGRESS (ref), useAudioAnalyzerForLocalMetering2 (ref), MIN_VOICE_CHAT_API_VERSION_LOCAL_MIC_ACTIVITY (ref), getFFlagLocalMutedNilFix (ref), talkingChangedWithDebounceV2 (ref), getFFlagLuaConsumePlayerModeratedModule (ref), getFFlagEnableVoiceReverseNudgeModule (ref), utilsModule (ref), t (ref)
	self:ensureInitialized("setup participant listeners")
	
	if not self.participants then
		self.participants = {}
		self.recentUsersInteractionData = {}
		self.updatedParticipants = {}
		self.participantConnection = self.service.ParticipantsStateChanged:Connect(function(p66, p67, p68) --[[ line: 1539 ]]
			-- upvalues: name (copy), getFFlagClearUserFromRecentVoiceDataOnLeaveModule (copy), self (ref), stringKeyFixForParticipantsTable (copy), getFFlagFixGetPlayerByUserIdStringCastModule (copy), playersService (copy), voiceChatService (copy), fFlagEnablePartyVoiceChangersInLua (copy), getFFlagBatchVoiceParticipantsUpdatesModule (copy), var51 (copy)
			name:trace("Participants state changed")
			
			for i, v in ipairs(p66) do
				if not getFFlagClearUserFromRecentVoiceDataOnLeaveModule() and not self.participants[tostring(v)].isMuted then
					self:_setRecentUserState(v, { lastHeardTime = os.time() })
				end
				self.participants[tostring(v)] = nil
				self.participantLeft:Fire(self.participants, v)
				self:emit("OnVoiceParticipantRemoved", v)
			end
			for i, v_1 in ipairs(p67) do
				self.participantJoined:Fire(self.participants, v_1)
				self:emit("OnVoiceParticipantAdded", v_1)
			end
			for i, v_2 in pairs(p68) do
				local userId = v_2.userId
				local var97 = if stringKeyFixForParticipantsTable then self.participants[tostring(userId)] else self.participants[userId]
				
				if not v_2.isMuted or var97 and not var97.isMuted then
					self:_setRecentUserState(userId, {
						lastHeardTime = os.time(),
						player = if getFFlagFixGetPlayerByUserIdStringCastModule() then playersService:GetPlayerByUserId(tonumber(userId)) else playersService:GetPlayerByUserId(userId)
					})
				end
				if not var97 or var97.isMuted ~= v_2.isMuted then
					self:emit("OnVoiceParticipantToggleMuted", userId, v_2.isMuted)
				end
				if voiceChatService.UseNewAudioApi then
					v_2.isMutedLocally = not not self.mutedPlayers[userId]
				end
				if voiceChatService.UseNewAudioApi then
					v_2.isMutedLocally = if self.mutedPlayers[userId] then not not self.mutedPlayers[userId] else v_2.isMutedLocally
				end
				if fFlagEnablePartyVoiceChangersInLua and voiceChatService.UseNewAudioApi then
					v_2.isVoiceChangerActive = if self.voiceChangerActivePlayers[userId] then self.voiceChangerActivePlayers[userId] else v_2.isVoiceChangerActive
				end
				if self.muteAll then
					v_2.isMutedLocally = true
				end
				self.participants[tostring(userId)] = v_2
				
				if getFFlagBatchVoiceParticipantsUpdatesModule() then
					self.updatedParticipants[tostring(userId)] = v_2
				end
				if var51 and self.CaptureService:IsCapturingVideo() then
					self.voiceCapturedDuringVideoCapture = self.voiceCapturedDuringVideoCapture or v_2.isSignalActive
				end
			end
			self:_updateRecentUsersInteractionData()
			
			if self.shouldThrottleParticipantUpdate then
				local currentTime = tick()
				
				if self.participantsStateThrottleTime <= currentTime - self.lastParticipantsStateUpdate and #p68 > 0 then
					self.lastParticipantsStateUpdate = currentTime
					self.participantsUpdate:Fire(if getFFlagBatchVoiceParticipantsUpdatesModule() then self.updatedParticipants else self.participants)
					self.updatedParticipants = {}
					
					return
				elseif #p68 > 0 then
					local var96 = self.participantsStateThrottleTime - (currentTime - self.lastParticipantsStateUpdate)
					self.lastStateUpdateCounter = (self.lastStateUpdateCounter + 1) % 100
					local lastStateUpdateCounter = self.lastStateUpdateCounter
					task.wait(var96)
					
					if lastStateUpdateCounter == self.lastStateUpdateCounter then
						self.participantsUpdate:Fire(if getFFlagBatchVoiceParticipantsUpdatesModule() then self.updatedParticipants else self.participants)
						self.updatedParticipants = {}
						
						return
					end
				end
			elseif #p68 > 0 then
				self.participantsUpdate:Fire(if getFFlagBatchVoiceParticipantsUpdatesModule() then self.updatedParticipants else self.participants)
				self.updatedParticipants = {}
			end
		end)
		
		local function onStateChanged(p69, p70) --[[ line: 1657 ]]
			-- upvalues: self (ref), getFFlagVoiceChatClientRewriteMasterLua (copy), name (copy), stopModerationConnectionOnLeave (copy), disableRejoinGroupIdDoubleRead (copy), getFFlagDisconnectToastClientRewrite (copy), getFFlagEnableVoiceSignal (copy), VOICE_JOIN_PROGRESS (copy)
			self:emit("OnStateChanged", p69, p70)
			local var98 = p70 == Enum.VoiceChatState.Failed
			local var99 = p70 == Enum.VoiceChatState.Joining
			local var100 = p70 == Enum.VoiceChatState.Leaving
			local var101 = p70 == Enum.VoiceChatState.Ended
			local var102 = self.service:IsPublishPaused()
			
			if var102 ~= self.localMuted and not var98 and (not var99 and not var100) and not var101 then
				self.localMuted = var102
				self.muteChanged:Fire(var102)
			elseif var99 or var100 or var101 then
				self.localMuted = nil
			end
			if getFFlagVoiceChatClientRewriteMasterLua() and p70 == Enum.VoiceChatState.Joined and (self.isInCall and var102 ~= self.callMutedState) then
				name:debug("In call, setting local muted to call muted state {}", self.callMutedState)
				self:ToggleMic("InitInCall")
			end
			if stopModerationConnectionOnLeave and p70 == Enum.VoiceChatState.Joined then
				self:StartModerationSignal()
			end
			if p70 == Enum.VoiceChatState.Leaving then
				if not disableRejoinGroupIdDoubleRead or not self.previousGroupId then
					self.previousGroupId = self.service:GetGroupId()
				end
				self.previousMutedState = self.service:IsPublishPaused()
			end
			if p70 == Enum.VoiceChatState.Ended or var98 then
				self.participants = {}
				self.localMuted = nil
				self.participantsUpdate:Fire(self.participants)
				
				if stopModerationConnectionOnLeave then
					self:StopModerationSignal()
				end
				if var98 then
					name:debug("State Changed to Failed. Reason: {}", self.service:GetAndClearCallFailureMessage())
				end
				if p69 == Enum.VoiceChatState.Joining or p69 == Enum.VoiceChatState.JoiningRetry or p69 == Enum.VoiceChatState.Joined then
					if p70 == Enum.VoiceChatState.Ended then
						name:debug("State Changed to Ended from {}", p69)
					end
					if not getFFlagDisconnectToastClientRewrite() or not self:IsSeamlessVoice() or self:GetVoiceConnectCookieValue() then
						self:emit("OnRetryRequested")
					end
				end
			end
			if getFFlagEnableVoiceSignal() and self.VoiceJoinProgress == VOICE_JOIN_PROGRESS.Joining and p70 == Enum.VoiceChatState.Joined then
				self:ChangeVoiceJoinProgress(VOICE_JOIN_PROGRESS.Joined)
				self:emit("OnVoiceJoin")
			end
		end
		
		if self.service.VoiceChatState and self.service.VoiceChatState == Enum.VoiceChatState.Joined then
			name:debug("Joined voice chat {}", self.service.VoiceChatState)
			onStateChanged(nil, Enum.VoiceChatState.Joined)
		end
		self.stateConnection = self.service.StateChanged:Connect(onStateChanged)
		
		if useAudioAnalyzerForLocalMetering2 and voiceChatService.UseNewAudioApi then
			if not self.localMeteringTask then
				self.localMeteringTask = task.spawn(function() --[[ line: 1744 ]]
					-- upvalues: self (ref)
					while true do
						self:UpdateLocalMetering()
						task.wait()
					end
				end)
			end
		elseif MIN_VOICE_CHAT_API_VERSION_LOCAL_MIC_ACTIVITY <= self.service:GetVoiceChatApiVersion() then
			self.micConnection = self.service.PlayerMicActivitySignalChange:Connect(function(p71) --[[ line: 1753 ]]
				-- upvalues: var51 (copy), self (ref), getFFlagLocalMutedNilFix (copy), talkingChangedWithDebounceV2 (copy)
				if var51 and self.CaptureService:IsCapturingVideo() then
					self.voiceCapturedDuringVideoCapture = self.voiceCapturedDuringVideoCapture or p71.isActive
				end
				self.isTalking = p71.isActive
				
				if getFFlagLocalMutedNilFix() then
					if self.localMuted ~= false then return end
					if talkingChangedWithDebounceV2 then
						self:FireTalkingChangedDebounced(self.isTalking)
						
						return
					end
					self.talkingChanged:Fire(self.isTalking)
					
					return
				elseif not self.localMuted then
					if talkingChangedWithDebounceV2 then
						self:FireTalkingChangedDebounced(self.isTalking)
						
						return
					end
					self.talkingChanged:Fire(self.isTalking)
				end
			end)
		end
		if getFFlagLuaConsumePlayerModeratedModule() then
			self:StartModerationSignal()
		elseif game:GetEngineFeature("VoiceChatServicePlayerModeratedEvent") then
			self.playerModeratedConnection = self.service.LocalPlayerModerated:connect(function() --[[ line: 1786 ]]
				-- upvalues: name (copy), self (ref), getFFlagVoiceChatClientRewriteMasterLua (copy), voiceChatService (copy)
				name:debug("User Moderated old")
				self.previousSessionId = self.service:GetSessionId()
				self:emit("OnPlayerModerated")
				
				if getFFlagVoiceChatClientRewriteMasterLua() then
					voiceChatService:leaveVoice()
					
					return
				end
				self.service:Leave()
			end)
		end
		name:trace("Setting up voice nudge handlers")
		self.voiceToxicityModalConnection = self:GetSignalREvent("VoiceToxicityModal"):Connect(function(p72) --[[ line: 1799 ]]
			-- upvalues: self (ref)
			self.Analytics:reportReceivedNudge(p72, self:GetNudgeAnalyticsData())
			self:emit("OnVoiceToxicityModal")
		end)
		self.VoiceToxicityToastConnection = self:GetSignalREvent("VoiceToxicityToast"):Connect(function(p73) --[[ line: 1805 ]]
			-- upvalues: self (ref)
			self.Analytics:reportReceivedNudge(p73, self:GetNudgeAnalyticsData())
			self:emit("OnVoiceToxicityToast")
		end)
		
		if getFFlagEnableVoiceReverseNudgeModule() then
			name:trace("Setting up voice reverse nudge handlers")
			self.voiceReverseNudgeConnection = self:GetSignalREvent("VoiceReverseNudgeIconColorChange"):Connect(function(p74) --[[ line: 1812 ]]
				-- upvalues: self (ref)
				self:emit("OnVoiceReverseNudgeIconColorChange", p74)
			end)
		end
		self.blockConnection = self.BlockStatusChanged:Connect(function(p75, p76) --[[ line: 1817 ]]
			-- upvalues: self (ref), name (copy), utilsModule (copy)
			if p76 then
				if self.participants[tostring(p75)] then
					name:debug("Blocking {}", utilsModule.shorten(p75))
					self.service:SubscribeBlock(p75)
					
					return
				end
			else
				name:debug("UnBlocking {}", utilsModule.shorten(p75))
				self.service:SubscribeUnblock(p75)
			end
		end)
		
		if voiceChatService.UseNewAudioApi then
			self:hookupAudioDeviceInputListener()
		end
		if self.service.TempSetMicMutedToggleMic then
			self.tempSetMicMutedToggleMicConnection = self.service.TempSetMicMutedToggleMic:connect(function() --[[ line: 1835 ]]
				-- upvalues: self (ref)
				self:ToggleMic("TempSetMicMutedToggleMic")
			end)
		end
		if var51 then
			self.videoCaptureInProgressConnection = self.CaptureService.VideoCaptureInProgress:connect(function(p77) --[[ line: 1842 ]]
				-- upvalues: self (ref), t (copy)
				if p77 then
					self.voiceCapturedDuringVideoCapture = false
					
					return
				end
				self.TelemetryService:LogEvent(t, {
					customFields = { voiceCaptured = self.voiceCapturedDuringVideoCapture }
				})
			end)
		end
	end
end

local var56 = nil

function t_1.CheckAudioInputExists(p78) --[[ line: 1857 ]]
	-- upvalues: name (ref), var56 (write), promiseModule (ref), cryoModule (ref)
	name:trace("Checking for AudioDeviceInput")
	
	if not var56 then
		var56 = promiseModule.new(function(p79, _) --[[ line: 1860 ]]
			-- upvalues: cryoModule (copy), p78 (ref), name (copy)
			if #cryoModule.Dictionary.keys(p78.audioDevices) > 0 then
				name:trace("Found existing AudioDeviceInput")
				p79()
				
				return
			end
			p78.audioDeviceInputAdded.Event:Connect(function() --[[ line: 1865 ]]
				-- upvalues: name (copy), p79 (ref)
				name:trace("Found new AudioDeviceInput")
				p79()
			end)
		end)
	end
	return var56
end

function t_1:checkAndUpdateSequence(p80, p81) --[[ line: 1875 ]]
	if not p81 then
		return 0
	elseif not self.SequenceNumbers[p80] then
		self.SequenceNumbers[p80] = p81
		
		return 0
	end
	local var103 = p81 - self.SequenceNumbers[p80]
	
	if var103 > 0 then
		self.SequenceNumbers[p80] = p81
	end
	return var103 - 1
end

local function _(value) --[[ line: 1902 | named "isIgnoredAudioInput" ]]
	-- upvalues: coreGuiService (ref)
	return value:IsDescendantOf(coreGuiService)
end

function t_1:onInstanceAdded(p82) --[[ line: 1906 ]]
	-- upvalues: fFlagExpChatDictation (ref), coreGuiService (ref), name (ref)
	if p82:IsA("AudioDeviceInput") then
		if fFlagExpChatDictation and p82:IsDescendantOf(coreGuiService) then return end
		name:debug("Found new audio device instance for {}", p82.Player and p82.Player.Name)
		self.audioDevices[p82] = self:CreateAudioDeviceData(p82)
		self:emit("OnAudioDeviceInputAdded")
		self:StartAnalysis(p82)
	end
end

function t_1:GetSendMuteEvent() --[[ line: 1919 ]]
	-- upvalues: robloxReplicatedStorageService (ref)
	if not self.SendMuteEvent then
		self.SendMuteEvent = robloxReplicatedStorageService:WaitForChild("SetUserActive", 10)
	end
	return self.SendMuteEvent
end

function t_1:GetToggleVoiceChangerEvent() --[[ line: 1926 ]]
	-- upvalues: replicatedStorageService (ref)
	if not self.SendVoiceChangerEvent then
		self.SendVoiceChangerEvent = replicatedStorageService:WaitForChild("ToggleUserVoiceChanger", 10)
	end
	return self.SendVoiceChangerEvent
end

function t_1:GetInputToModifierWire() --[[ line: 1933 ]]
	-- upvalues: playersService (ref)
	if not self.InputToModifierWire then
		self.InputToModifierWire = playersService.LocalPlayer:FindFirstChild("InputToModifier")
	end
	return self.InputToModifierWire
end

function t_1:GetPartyVoiceDeviceInput() --[[ line: 1940 ]]
	-- upvalues: playersService (ref)
	if not self.PartyVoiceDeviceInput then
		self.PartyVoiceDeviceInput = playersService.LocalPlayer:FindFirstChild("PartyVoiceDeviceInput")
	end
	return self.PartyVoiceDeviceInput
end

function t_1:GetSetVoicePackEvent() --[[ line: 1948 ]]
	-- upvalues: replicatedStorageService (ref)
	if not self.SetVoicePackEvent then
		self.SetVoicePackEvent = replicatedStorageService:WaitForChild("SetVoicePack", 10)
	end
	return self.SetVoicePackEvent
end

function t_1:GetVoiceChangerWasToggledEvent() --[[ line: 1955 ]]
	-- upvalues: replicatedStorageService (ref)
	if not self.VoiceChangerWasToggledEvent then
		self.VoiceChangerWasToggledEvent = replicatedStorageService:WaitForChild("VoiceChangerWasToggled", 3)
	end
	return self.VoiceChangerWasToggledEvent
end

local _ = function(p83, p84) --[[ line: 1963 | named "WireUp" ]]
	local wire = Instance.new("Wire")
	wire.SourceInstance = p83
	wire.TargetInstance = p84
	wire.Parent = p84
	
	return wire
end

local _ = function() --[[ line: 1972 | named "GetAnalysisHost" ]]
	-- upvalues: robloxReplicatedStorageService (ref)
	return robloxReplicatedStorageService
end

function t_1.GetAnalyzer(_, p85) --[[ line: 1976 ]]
	-- upvalues: robloxReplicatedStorageService (ref)
	local text = p85.Name .. "_Analyzer"
	local var106 = robloxReplicatedStorageService:FindFirstChild(text)
	
	if not var106 then
		var106 = Instance.new("AudioAnalyzer")
		var106.SpectrumEnabled = false
		var106.Name = text
		var106.Parent = robloxReplicatedStorageService
	end
	return var106
end

local _ = function(p86) --[[ line: 1989 | named "toDecibels" ]]
	return math.log10(p86) * 20
end

function t_1:IsSignalActive(p87) --[[ line: 1993 ]]
	-- upvalues: useAudioAnalyzerForLocalMetering2 (ref), playersService (ref)
	if not useAudioAnalyzerForLocalMetering2 then
		return false
	end
	local var107 = playersService:GetPlayerByUserId(p87)
	
	return if var107 then math.log10(self:GetAnalyzer(var107).PeakLevel) * 20 > -36 else false
end

function t_1.StopAnalysis(_, p88) --[[ line: 2007 ]]
	-- upvalues: useAudioAnalyzerForLocalMetering2 (ref), robloxReplicatedStorageService (ref)
	if not useAudioAnalyzerForLocalMetering2 then return end
	for i, v in p88:GetConnectedWires("Output") do
		local targetInstance = v.TargetInstance
		
		if targetInstance and targetInstance:IsDescendantOf(robloxReplicatedStorageService) then
			v:Destroy()
		end
	end
end

function t_1:StartAnalysis(p89) --[[ line: 2023 ]]
	-- upvalues: useAudioAnalyzerForLocalMetering2 (ref)
	if not useAudioAnalyzerForLocalMetering2 then return end
	self:StopAnalysis(p89)
	local player = p89.Player
	
	if player then
		local var108 = self:GetAnalyzer(player)
		local wire = Instance.new("Wire")
		wire.SourceInstance = p89
		wire.TargetInstance = var108
		wire.Parent = var108
		
		return
	end
end

function t_1.GetVoiceConnectCookie(p90) --[[ line: 2037 ]]
	-- upvalues: constantsModule (ref)
	local ok, status = pcall(function() --[[ line: 2038 ]]
		-- upvalues: p90 (ref), constantsModule (copy)
		return p90.AppStorageService:GetItem(constantsModule.VOICE_CONNECT_DISCONNECT_KEY_V3)
	end)
	
	return if ok and status then status else ""
end

function t_1.GetVoiceConnectCookieValue(p91) --[[ line: 2049 ]]
	-- upvalues: getFFlagEnableVoiceUxUpdates (ref), constantsModule (ref), getFFlagEnableSeamlessVoiceV2 (ref)
	if getFFlagEnableVoiceUxUpdates() then
		local ok, status = pcall(function() --[[ line: 2051 ]]
			-- upvalues: p91 (ref), constantsModule (copy)
			return p91.AppStorageService:GetItem(constantsModule.VOICE_CONNECT_DISCONNECT_KEY_V3)
		end)
		
		return if ok then status == "true" else true
	end
	local ok, status = pcall(function() --[[ line: 2057 ]]
		-- upvalues: p91 (ref), getFFlagEnableSeamlessVoiceV2 (copy), constantsModule (copy)
		return p91.AppStorageService:GetItem(if getFFlagEnableSeamlessVoiceV2() then constantsModule.VOICE_CONNECT_DISCONNECT_KEY_V2 else constantsModule.VOICE_CONNECT_DISCONNECT_KEY)
	end)
	
	return if ok then status == "true" else true
end

function t_1.SetVoiceConnectCookieValue(value, p92) --[[ line: 2069 ]]
	-- upvalues: getFFlagEnableVoiceUxUpdates (ref), constantsModule (ref), getFFlagEnableSeamlessVoiceV2 (ref)
	return if getFFlagEnableVoiceUxUpdates() then pcall(function() --[[ line: 2071 ]]
		-- upvalues: value (ref), constantsModule (copy), p92 (ref)
		value.AppStorageService:SetItem(constantsModule.VOICE_CONNECT_DISCONNECT_KEY_V3, tostring(p92))
		value.AppStorageService:Flush()
	end) else pcall(function() --[[ line: 2077 ]]
		-- upvalues: value (ref), getFFlagEnableSeamlessVoiceV2 (copy), constantsModule (copy), p92 (ref)
		value.AppStorageService:SetItem(if getFFlagEnableSeamlessVoiceV2() then constantsModule.VOICE_CONNECT_DISCONNECT_KEY_V2 else constantsModule.VOICE_CONNECT_DISCONNECT_KEY, tostring(p92))
		value.AppStorageService:Flush()
	end)
end

function t_1.GetVoiceRewarmCookie(p93) --[[ line: 2090 ]]
	-- upvalues: constantsModule (ref), name (ref)
	local ok, status = pcall(function() --[[ line: 2091 ]]
		-- upvalues: p93 (ref), constantsModule (copy)
		return p93.AppStorageService:GetItem(constantsModule.VOICE_REWARM_KEY)
	end)
	
	if ok and status then
		name:debug("Got voice re-warm cookie: {}", status)
		
		return status
	end
	name:debug("Voice re-warm cookie not set, returning empty string")
	
	return ""
end

function t_1.SetVoiceRewarmCookie(value, p94) --[[ line: 2104 ]]
	-- upvalues: name (ref), constantsModule (ref)
	name:debug("Setting voice re-warm cookie to {}", p94)
	pcall(function() --[[ line: 2106 ]]
		-- upvalues: value (ref), constantsModule (copy), p94 (ref)
		value.AppStorageService:SetItem(constantsModule.VOICE_REWARM_KEY, tostring(p94))
		value.AppStorageService:Flush()
	end)
end

function t_1:ShouldRewarmUser() --[[ line: 2112 ]]
	return self:GetVoiceRewarmCookie() == ""
end

function t_1:RewarmUser() --[[ line: 2116 ]]
	self:SetVoiceRewarmCookie("true")
end

function t_1.SetNewUserFTUXCookieValue(value, p95) --[[ line: 2120 ]]
	-- upvalues: constantsModule (ref)
	return pcall(function() --[[ line: 2121 ]]
		-- upvalues: value (ref), constantsModule (copy), p95 (ref)
		value.AppStorageService:SetItem(constantsModule.SEAMLESS_VOICE_FTUX_KEY, tostring(p95))
		value.AppStorageService:Flush()
	end)
end

function t_1:SetAndSyncActive(p96, p97) --[[ line: 2128 ]]
	-- upvalues: playersService (ref)
	p96.Active = p97
	local sendMuteEvent = self:GetSendMuteEvent()
	
	if sendMuteEvent and p96.Player == playersService.LocalPlayer then
		sendMuteEvent:FireServer(p97)
	end
end

function t_1:CreateAudioDeviceData(p98) --[[ line: 2137 ]]
	-- upvalues: playersService (ref), enableMutedByLocalUserEngineFeature (ref), name (ref), var23 (ref), fFlagDebugShowAudioDeviceInputDebugger (ref)
	local t = {}
	local var112 = p98.Player == playersService.LocalPlayer
	
	if enableMutedByLocalUserEngineFeature then
		if not p98.MutedByLocalUser then
			if self.muteAll and not var112 then
				p98.MutedByLocalUser = true
			end
			if p98.Player and self.mutedPlayers[p98.Player.UserId] then
				p98.MutedByLocalUser = true
			end
		end
	elseif p98.Active then
		if self.muteAll and not var112 then
			p98.Active = false
		end
		if p98.Player and self.mutedPlayers[p98.Player.UserId] then
			p98.Active = false
		end
	end
	if p98.Active and var112 and self.localMuted == nil then
		self:SetAndSyncActive(p98, false)
	end
	if var112 and self.localMuted ~= nil and (self.localMuted ~= not p98.Active and not self.isInCall) then
		name:debug("Mismatch between LocalMuted and device.Active")
		local var115 = not self.localMuted
		p98.Active = var115
		local sendMuteEvent = self:GetSendMuteEvent()
		
		if sendMuteEvent then
			sendMuteEvent:FireServer(var115)
		end
	elseif self.isInCall and var112 then
		local var113 = not self.callMutedState
		name:debug("Overwriting Active State to match Iris call. .Active = {}", var113)
		p98.Active = var113
		local sendMuteEvent = self:GetSendMuteEvent()
		
		if sendMuteEvent then
			sendMuteEvent:FireServer(var113)
		end
	end
	t.onPlayerChanged = p98:GetPropertyChangedSignal("Player"):Connect(function() --[[ line: 2187 ]]
		-- upvalues: var23 (copy), var112 (write), p98 (ref), playersService (copy), self (ref), name (copy), enableMutedByLocalUserEngineFeature (copy)
		if var23 then
			var112 = p98.Player == playersService.LocalPlayer
			
			if var112 then
				if p98.Active and self.localMuted == nil then
					name:debug("Player is still in connecting state, setting Active to false")
					self:SetAndSyncActive(p98, false)
				elseif self.localMuted ~= nil and self.localMuted ~= not p98.Active then
					name:debug("Mismatch between LocalMuted and device.Active")
					self:SetAndSyncActive(p98, not self.localMuted)
				end
			elseif self.muteAll or p98.Player and self.mutedPlayers[p98.Player.UserId] then
				if enableMutedByLocalUserEngineFeature then
					p98.MutedByLocalUser = true
				else
					p98.Active = false
				end
			end
		end
		self:emit("OnDevicePlayerChanged")
		self:StartAnalysis(p98)
	end)
	t.onMutedChanged = p98:GetPropertyChangedSignal("Muted"):Connect(function() --[[ line: 2213 ]]
		-- upvalues: self (ref)
		self:emit("OnDeviceMuteChanged")
	end)
	
	if not enableMutedByLocalUserEngineFeature then
		t.onActiveChanged = p98:GetPropertyChangedSignal("Active"):Connect(function() --[[ line: 2218 ]]
			-- upvalues: self (ref), var112 (write), p98 (ref)
			self:emit("OnDeviceActiveChanged")
			
			if self.muteAll and not var112 then
				p98.Active = false
			end
			if p98.Player and self.mutedPlayers[p98.Player.UserId] then
				p98.Active = false
			end
		end)
	elseif fFlagDebugShowAudioDeviceInputDebugger then
		t.onActiveChanged = p98:GetPropertyChangedSignal("Active"):Connect(function() --[[ line: 2229 ]]
			-- upvalues: self (ref)
			self:emit("OnDeviceActiveChanged")
		end)
		t.onMutedByLocalUserChanged = p98:GetPropertyChangedSignal("MutedByLocalUser"):Connect(function() --[[ line: 2232 ]]
			-- upvalues: self (ref)
			self:emit("OnDeviceMutedByLocalUserChanged")
		end)
	end
	return t
end

function t_1:onInstanceRemove(p99) --[[ line: 2240 ]]
	-- upvalues: fFlagExpChatDictation (ref), coreGuiService (ref), name (ref), enableMutedByLocalUserEngineFeature (ref), fFlagDebugShowAudioDeviceInputDebugger (ref), useAudioAnalyzerForLocalMetering2 (ref)
	if p99:IsA("AudioDeviceInput") then
		if fFlagExpChatDictation and p99:IsDescendantOf(coreGuiService) then return end
		self:StopAnalysis(p99)
		name:trace("Removing AudioDeviceInput {} {} {}", p99, "for user", p99.Player and p99.Player.UserId)
		local var117 = self.audioDevices[p99]
		
		if var117 then
			if not enableMutedByLocalUserEngineFeature then
				var117.onActiveChanged:Disconnect()
			elseif fFlagDebugShowAudioDeviceInputDebugger then
				if var117.onActiveChanged then
					var117.onActiveChanged:Disconnect()
				end
				if var117.onMutedByLocalUserChanged then
					var117.onMutedByLocalUserChanged:Disconnect()
				end
			end
			var117.onMutedChanged:Disconnect()
			var117.onPlayerChanged:Disconnect()
		end
		self.audioDevices[p99] = nil
		self:emit("OnAudioDeviceInputRemoved")
		
		if useAudioAnalyzerForLocalMetering2 and p99.Player then
			self:GetAnalyzer(p99.Player):Destroy()
		end
	end
end

function t_1:hookupAudioDeviceInputListener() --[[ line: 2271 ]]
	-- upvalues: name (ref), playersService (ref), soundService (ref), voiceChatService (ref), collectionService (ref), utilsModule (ref)
	name:debug("Hooking up audio device listeners")
	local localPlayer = playersService.LocalPlayer
	soundService.AudioInstanceAdded:Connect(function(p100) --[[ line: 2274 ]]
		-- upvalues: self (ref)
		self:onInstanceAdded(p100)
	end)
	local audioDeviceInput = localPlayer:FindFirstChildOfClass("AudioDeviceInput")
	name:debug("Found local user audio device {}", audioDeviceInput)
	
	if audioDeviceInput then
		self:onInstanceAdded(audioDeviceInput)
	end
	if voiceChatService.EnableDefaultVoice then
		name:debug("Creating default voice listener")
		
		if not game:GetEngineFeature("SoundServiceControlsDefaultListenerLocation") then
			local audioListener = Instance.new("AudioListener")
			audioListener.Parent = workspace.CurrentCamera
			local wire = Instance.new("Wire")
			wire.Parent = audioListener
			local audioDeviceOutput = Instance.new("AudioDeviceOutput")
			audioDeviceOutput.Parent = wire
			wire.SourceInstance = audioListener
			wire.TargetInstance = audioDeviceOutput
		end
		for i, v in collectionService:GetTagged("RbxDefaultVoiceEmitter") do
			utilsModule.destroyDefaultEmitter(v)
		end
		collectionService:GetInstanceAddedSignal("RbxDefaultVoiceEmitter"):Connect(utilsModule.destroyDefaultEmitter)
		localPlayer.CharacterAdded:Connect(utilsModule.avoidEmitting)
		
		if localPlayer.Character then
			utilsModule.avoidEmitting(localPlayer.Character)
		end
	end
	game.DescendantRemoving:Connect(function(p101) --[[ line: 2309 ]]
		-- upvalues: self (ref)
		self:onInstanceRemove(p101)
	end)
	
	for i, v in game:GetDescendants() do
		self:onInstanceAdded(v)
	end
	playersService.PlayerRemoving:Connect(function(p102) --[[ line: 2318 ]]
		-- upvalues: self (ref)
		for i in self.audioDevices do
			if i.Player and i.Player == p102 then
				self:onInstanceRemove(i)
			end
		end
	end)
end

function t_1.RejoinCurrentChannel(p103) --[[ line: 2328 ]]
	-- upvalues: name (ref)
	pcall(function() --[[ line: 2329 ]]
		-- upvalues: p103 (ref), name (copy)
		local groupId = p103.service:GetGroupId()
		
		if groupId and groupId ~= "" then
			local var123 = p103.service:IsPublishPaused()
			p103.service:Leave()
			name:debug("Rejoining current channel {}", groupId)
			p103.participants = {}
			p103.participantsUpdate:Fire(p103.participants)
			
			if not p103.service:JoinByGroupIdToken(groupId, var123, true) then
				p103:emit("OnInitialJoinFailed")
			end
		end
	end)
end

function t_1.RejoinChannel(p104, p105, p106) --[[ line: 2345 ]]
	-- upvalues: name (ref)
	name:debug("Rejoining previous channel {} with mute status {}", p105, p106)
	
	if p105 and p105 ~= "" then
		pcall(function() --[[ line: 2349 ]]
			-- upvalues: p104 (ref), p105 (ref), p106 (ref)
			p104.service:Leave()
			p104.participants = {}
			p104.participantsUpdate:Fire(p104.participants)
			
			if not p104.service:JoinByGroupIdToken(p105, p106, true) then
				p104:emit("OnInitialJoinFailed")
			end
		end)
	end
end

function t_1:RejoinVoice() --[[ line: 2361 ]]
	-- upvalues: getFFlagVoiceChatClientRewriteMasterLua (ref), name (ref), voiceChatService (ref)
	if getFFlagVoiceChatClientRewriteMasterLua() then
		name:debug("Rejoining voice")
		self.participants = {}
		self.participantsUpdate:Fire(self.participants)
		voiceChatService:rejoinVoice()
	end
end

function t_1:watchSignalR() --[[ line: 2372 ]]
	-- upvalues: WATCHED_NAMESPACES (ref), utilsModule (ref), name (ref)
	self.signalRConnection = self.NotificationService.RobloxEventReceived:Connect(function(p107) --[[ line: 2373 ]]
		-- upvalues: WATCHED_NAMESPACES (copy), utilsModule (copy), self (ref), name (copy)
		local namespace = p107.namespace
		
		if not WATCHED_NAMESPACES[namespace] then return end
		local var124 = utilsModule.jsonDecode(p107.detail)
		local type = self.SignalREventTable[var124.type]
		
		if type then
			type:Fire(var124)
		end
		local sequenceNumber = var124.SequenceNumber
		name:trace("SignalR message {}: {}", namespace, sequenceNumber)
		local var125 = self:checkAndUpdateSequence(namespace, sequenceNumber)
		
		if var125 > 0 then
			self.Analytics:reportReconnectDueToMissedSequence()
			
			return
		elseif var125 < -1 then
			self.Analytics:reportOutOfOrderSequence()
		end
	end)
	self.signalRConnectionChanged = self.NotificationService.RobloxConnectionChanged:Connect(function(p108, p109, _, p110) --[[ line: 2397 ]]
		-- upvalues: name (copy), utilsModule (copy), WATCHED_NAMESPACES (copy), self (ref)
		if p108 == "signalR" then
			if p109 ~= Enum.ConnectionState.Connected then
				name:info("SignalR disconnected")
				
				return
			end
			for i, v in pairs(utilsModule.jsonDecode(p110)) do
				if WATCHED_NAMESPACES[i] then
					name:trace("SignalR message {}: {}", i, v)
					local var126 = self:checkAndUpdateSequence(i, v)
					
					if var126 > 0 then
						self.Analytics:reportReconnectDueToMissedSequence()
					elseif var126 < -1 then
						self.Analytics:reportOutOfOrderSequence()
					end
				end
			end
		end
	end)
end

function t_1:StopSignalRConnection() --[[ line: 2422 ]]
	if self.signalRConnectionChanged then
		self.signalRConnectionChanged:Disconnect()
		self.signalRConnectionChanged = nil
	end
	if self.signalRConnection then
		self.signalRConnection:Disconnect()
		self.signalRConnection = nil
	end
end

function t_1:getService() --[[ line: 2433 ]]
	return self.service
end

function t_1:ToggleMic(p111) --[[ line: 2437 ]]
	-- upvalues: name (ref), getFFlagJoinWithoutMicPermissions (ref), PERMISSION_STATE (ref), permissionsProtocol (ref), voiceChatService (ref), playersService (ref)
	self:ensureInitialized("toggle mic")
	
	if self.localMuted == nil then
		name:trace("ToggleMic context: {} - Voice not connected yet", p111)
		
		return
	end
	name:trace("ToggleMic context: {}", p111)
	
	if getFFlagJoinWithoutMicPermissions() then
		if self.permissionState == PERMISSION_STATE.PENDING_MIC then
			name:debug("In pending mic mode, requesting permission")
			self:emit("GetPermissions", function(p112) --[[ line: 2450 ]]
				-- upvalues: self (ref), PERMISSION_STATE (copy), name (copy), p111 (ref)
				self.permissionState = if p112.hasMicPermissions then PERMISSION_STATE.LISTEN_AND_TALK else PERMISSION_STATE.LISTEN_ONLY
				name:debug("Got permissions, setting state to {}", self.permissionState)
				self:ToggleMic(p111)
			end, { permissionsProtocol.Permissions.MICROPHONE_ACCESS }, false)
			
			return
		elseif self.permissionState == PERMISSION_STATE.LISTEN_ONLY then
			name:debug("User tried to unmute despite being in listen only mode")
			self:emit("OnPermissionRequested")
			
			return
		elseif self.isPlayerWatchingAd then
			name:trace("User is watching an ad, skipping toggling mic")
			
			return
		elseif voiceChatService.UseNewAudioApi then
			self.localMuted = not self.localMuted
			local var127 = not self.localMuted
			name:trace("Setting self mute to {} context: {}", var127, p111)
			local sendMuteEvent = self:GetSendMuteEvent()
			
			if sendMuteEvent then
				sendMuteEvent:FireServer(var127)
				
				for i in self.audioDevices do
					if i.Player and i.Player == playersService.LocalPlayer then
						i.Active = var127
					end
				end
				self.muteChanged:Fire(self.localMuted)
			else
				name:error("Could not find SendMuteEvent")
			end
		else
			local var129 = not self.service:IsPublishPaused()
			name:trace("Setting self mute to {} context: {}", var129, p111)
			self.service:PublishPause(var129)
			self.localMuted = var129
			self.muteChanged:Fire(var129)
		end
		if not self.localMuted then
			self.talkingChanged:Fire(self.isTalking)
			self:emit("OnShowDataConsentToast")
		end
		if p111 then
			self.Analytics:reportVoiceMuteSelf(self:JoinWithVoiceMuteData({ context = p111, muted = self.localMuted }))
		end
	end
end

function t_1:ToggleVoiceChanger(_) --[[ line: 2511 ]]
	-- upvalues: voiceChatService (ref), name (ref)
	self:ensureInitialized("toggle voice changer")
	
	if self.localMuted == nil then return end
	if voiceChatService.UseNewAudioApi then
		self.isVoiceChangerActive = not self.isVoiceChangerActive
		name:trace("setting voice changer active to {}", self.isVoiceChangerActive)
		local toggleVoiceChangerEvent = self:GetToggleVoiceChangerEvent()
		
		if toggleVoiceChangerEvent then
			toggleVoiceChangerEvent:FireServer(self.isVoiceChangerActive)
			self.voiceChangerChanged:Fire(self.isVoiceChangerActive)
			
			return
		end
		name:error("Could not find ToggleVoiceChangerEvent")
		
		return
	else
		self.isVoiceChangerActive = false
		name:trace("forcibly disabling voice changer since using old audio api", self.isVoiceChangerActive)
		local toggleVoiceChangerEvent = self:GetToggleVoiceChangerEvent()
		
		if toggleVoiceChangerEvent then
			toggleVoiceChangerEvent:FireServer(self.isVoiceChangerActive)
			self.voiceChangerChanged:Fire(self.isVoiceChangerActive)
			
			return
		end
		name:error("Could not find ToggleVoiceChangerEvent")
	end
end

function t_1:ToggleVoiceChangerHearMyself(_) --[[ line: 2541 ]]
	-- upvalues: voiceChatService (ref), name (ref)
	if self.localMuted == nil then return end
	if voiceChatService.UseNewAudioApi then
		self.isVoiceChangerHearMyselfActive = not self.isVoiceChangerHearMyselfActive
		local inputToModifierWire = self:GetInputToModifierWire()
		local partyVoiceDeviceInput = self:GetPartyVoiceDeviceInput()
		
		if inputToModifierWire and partyVoiceDeviceInput then
			name:trace("setting voice changer hear myself active to {}", self.isVoiceChangerHearMyselfActive)
			
			if self.isVoiceChangerHearMyselfActive then
				inputToModifierWire.SourceInstance = partyVoiceDeviceInput
			else
				inputToModifierWire.SourceInstance = nil
			end
			self.voiceChangerHearMyselfChanged:Fire(self.isVoiceChangerHearMyselfActive)
			
			return
		else
			name:error("Could not find InputToModifierWire or PartyVoiceDeviceInput")
		end
	end
end

function t_1:SetVoicePack(p113) --[[ line: 2566 ]]
	-- upvalues: voiceChatService (ref), name (ref)
	self:ensureInitialized("set voice pack")
	
	if self.localMuted == nil then return end
	if voiceChatService.UseNewAudioApi then
		self.currentVoicePack = p113
		name:trace("setting current voice pack to {}", self.currentVoicePack)
		local setVoicePackEvent = self:GetSetVoicePackEvent()
		
		if setVoicePackEvent then
			setVoicePackEvent:FireServer("VoicePack_" .. self.currentVoicePack)
			
			return
		end
		name:error("Could not find SetVoicePackEvent")
	end
end

function t_1:JoinWithVoiceMuteData(p114) --[[ line: 2585 ]]
	-- upvalues: playersService (ref), cryoModule (ref)
	return cryoModule.Dictionary.join({
		userId = playersService.LocalPlayer.UserId,
		clientSessionId = self:GetSessionId(),
		channelId = self:GetChannelId()
	}, p114)
end

function t_1:_reportJoinFailed(p115, p116) --[[ line: 2594 ]]
	self.Analytics:reportVoiceChatJoinResult(false, p115, p116)
	self:emit("OnReportJoinFailed", p115)
end

function t_1:_asyncInit() --[[ line: 2599 ]]
	-- upvalues: name (ref), MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED (ref), getFFlagVoiceChatClientRewriteMasterLua (ref), voiceChatService (ref), analyticsModule (ref), promiseModule (ref)
	self:CheckCallState()
	
	return self:canUseServiceAsync():andThen(function(_) --[[ line: 2602 ]]
		-- upvalues: name (copy), MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED (copy), self (ref), getFFlagVoiceChatClientRewriteMasterLua (copy), voiceChatService (copy), analyticsModule (copy), promiseModule (copy)
		local var135 = "VoiceChatService"
		
		if game:GetEngineFeature("UseNewVoiceChatService") then
			var135 = "VoiceChatInternal"
			name:debug("Using VoiceChatInternal")
		end
		local ok, status = pcall(function() --[[ line: 2608 ]]
			-- upvalues: var135 (write), MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED (copy), self (copy)
			local var137 = game:GetService(var135)
			
			if var137 and (var137:GetVoiceChatApiVersion() < MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED or var137:IsContextVoiceEnabled()) then
				self.voiceEnabled = true
				self.service = var137
				self:SetupParticipantListeners()
			end
		end)
		
		if getFFlagVoiceChatClientRewriteMasterLua() then
			voiceChatService:joinVoice()
			name:debug("Starting Voice Chat Client Join Operation")
		else
			local voiceChatService_1 = game:GetService("VoiceChatService")
			
			if voiceChatService_1 then
				voiceChatService_1:joinVoice()
				name:debug("Starting Voice Chat Client Join Operation")
			end
		end
		if ok then
			if self.service then
				self:emit("OnVoiceChatServiceInitialized")
				self:watchSignalR()
				
				return promiseModule.resolve()
			end
			name:debug("VoiceChatService is not set after init")
			self:_reportJoinFailed("contextNotEnabled")
			
			return if self.options.passInitErrorInPromiseReject then promiseModule.reject({ code = "INIT_ERROR_CONTEXT_NOT_ENABLED" }) else promiseModule.reject()
		else
			name:warning("EnableVoiceChat flag is enabled but GetService panicked {}", status)
			self:_reportJoinFailed("getServiceFailed", analyticsModule.ERROR)
			
			return if self.options.passInitErrorInPromiseReject then promiseModule.reject({ code = "INIT_ERROR_GET_SERVICE_FAILED" }) else promiseModule.reject()
		end
	end)
end

function t_1:UpdateLocalMetering() --[[ line: 2658 ]]
	-- upvalues: playersService (ref), talkingChangedWithDebounceV2 (ref)
	self.isTalking = self:IsSignalActive(playersService.LocalPlayer.UserId)
	
	if self.localMuted == false then
		if talkingChangedWithDebounceV2 then
			self:FireTalkingChangedDebounced(self.isTalking)
			
			return
		end
		self.talkingChanged:Fire(self.isTalking)
	end
end

function t_1:FireTalkingChangedDebounced(p117) --[[ line: 2669 ]]
	-- upvalues: talkingChangedDebounceTime (ref)
	local var138 = tick() * 1000
	
	if p117 ~= self._lastTalkingChangedFireValue or talkingChangedDebounceTime < var138 - self._lastTalkingChangedFireTime then
		self._lastTalkingChangedFireTime = var138
		self._lastTalkingChangedFireValue = p117
		self.talkingChanged:Fire(p117)
	end
end

function t_1:asyncInit() --[[ line: 2684 ]]
	-- upvalues: name (ref), promiseModule (ref), constantsModule (ref), fFlagEnablePartyVoiceChangersInLua (ref), stringKeyFixForParticipantsTable (ref)
	if self.service then
		name:trace("Manager already initialized")
		
		return promiseModule.resolve()
	elseif not self.initPromise then
		self.initPromise = self:_asyncInit()
		
		if self.AdService then
			(function(value) --[[ line: 2694 | named "setupRewardedAdMuting" ]]
				-- upvalues: constantsModule (copy)
				local var139 = false
				value.AdService.RewardedVideoAdStarted:Connect(function() --[[ line: 2696 ]]
					-- upvalues: value (ref), var139 (write), constantsModule (copy)
					if value.localMuted == nil then return end
					var139 = value.localMuted
					
					if not value.localMuted then
						value:ToggleMic(constantsModule.REWARDED_VIDEO_AD_STARTED)
					end
					value.isPlayerWatchingAd = true
				end)
				value.AdService.RewardedVideoAdEnded:Connect(function() --[[ line: 2712 ]]
					-- upvalues: value (ref), var139 (write), constantsModule (copy)
					if value.localMuted == nil then return end
					value.isPlayerWatchingAd = false
					
					if var139 ~= value.localMuted then
						value:ToggleMic(constantsModule.REWARDED_VIDEO_AD_ENDED)
					end
				end)
			end)(self)
		end
		if fFlagEnablePartyVoiceChangersInLua and not self.voiceChangerWasToggledEvent then
			task.spawn(function() --[[ line: 2732 ]]
				-- upvalues: self (ref), stringKeyFixForParticipantsTable (copy)
				local voiceChangerWasToggledEvent = self:GetVoiceChangerWasToggledEvent()
				
				if voiceChangerWasToggledEvent then
					voiceChangerWasToggledEvent.OnClientEvent:Connect(function(p118, p119) --[[ line: 2736 ]]
						-- upvalues: stringKeyFixForParticipantsTable (copy), self (copy)
						local var141 = if stringKeyFixForParticipantsTable then self.participants[tostring(p118)] else self.participants[p118]
						
						if var141 then
							var141.isVoiceChangerActive = p119
							self.voiceChangerActivePlayers[p118] = p119
							self.participantsUpdate:Fire(self.participants)
						end
					end)
				end
			end)
		end
	end
	return self.initPromise
end

function t_1:IsInitialized() --[[ line: 2756 ]]
	return self.service
end

function t_1:ensureInitialized(p120) --[[ line: 2760 ]]
	if not self.service then
		error("[corescripts VCS Manager] " .. "Attempting to " .. p120 .. " before calling init")
	end
end

function t_1:GetSessionId() --[[ line: 2767 ]]
	self:ensureInitialized("get session id")
	
	return self.service:GetSessionId()
end

function t_1:GetChannelId() --[[ line: 2772 ]]
	self:ensureInitialized("get channel id")
	
	return self.service:GetChannelId()
end

function t_1:Disconnect() --[[ line: 2777 ]]
	-- upvalues: var51 (ref)
	if self.participantConnection then
		self.participantConnection:Disconnect()
		self.participantConnection = nil
	end
	if self.stateConnection then
		self.stateConnection:Disconnect()
		self.stateConnection = nil
	end
	if self.micConnection then
		self.micConnection:Disconnect()
		self.micConnection = nil
	end
	if self.blockConnection then
		self.blockConnection:Disconnect()
		self.blockConnection = nil
	end
	if self.playerModeratedConnection then
		self.playerModeratedConnection:Disconnect()
		self.playerModeratedConnection = nil
	end
	if self.voiceToxicityModalConnection then
		self.voiceToxicityModalConnection:Disconnect()
		self.voiceToxicityModalConnection = nil
	end
	if self.VoiceToxicityToastConnection then
		self.VoiceToxicityToastConnection:Disconnect()
		self.VoiceToxicityToastConnection = nil
	end
	if self.voiceReverseNudgeConnection then
		self.voiceReverseNudgeConnection:Disconnect()
		self.voiceReverseNudgeConnection = nil
	end
	if self.tempSetMicMutedToggleMicConnection then
		self.tempSetMicMutedToggleMicConnection:Disconnect()
		self.tempSetMicMutedToggleMicConnection = nil
	end
	if var51 and self.videoCaptureInProgressConnection then
		self.videoCaptureInProgressConnection:Disconnect()
		self.videoCaptureInProgressConnection = nil
	end
end

function t_1.RequestHidePublicVoiceUI(p121) --[[ line: 2828 ]]
	task.defer(function() --[[ line: 2829 ]]
		-- upvalues: p121 (ref)
		p121.setVoiceUIVisibility:Fire(false)
	end)
end

function t_1.RequestShowPublicVoiceUI(p122) --[[ line: 2834 ]]
	task.defer(function() --[[ line: 2835 ]]
		-- upvalues: p122 (ref)
		p122.setVoiceUIVisibility:Fire(true)
	end)
end

t_1.default = t_1.new(blockingUtilityModule:GetAfterBlockedStatusChangedEvent(), permissionsProtocol.default, httpRbxApiService, nil, nil, nil, nil, nil, thirdPartyUserService, nil, adService)

return t_1