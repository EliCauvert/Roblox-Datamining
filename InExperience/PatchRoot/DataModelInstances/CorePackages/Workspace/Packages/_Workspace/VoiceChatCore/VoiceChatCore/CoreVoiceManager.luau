local parent = script.Parent
local parent_1 = parent.Parent
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
local IXPServiceWrapper = require(parent_1.IXPServiceWrapper).IXPServiceWrapper
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
local promiseModule = require(parent_1.Promise)
local cryoModule = require(parent_1.Cryo)
local default = require(parent_1.CallProtocol).CallProtocol.default
local enums = require(parent_1.CallProtocol).Enums
local permissionsProtocol = require(parent_1.PermissionsProtocol).PermissionsProtocol
local blockingUtilityModule = require(parent_1.BlockingUtility)
local coreGuiService = game:GetService("CoreGui")
local name = require(parent_1.CoreScriptsInitializer).CoreLogger:new(script.Name)
local var23 = require(flags.GetFFlagUpdateDeviceInputPlayerChanged)()
local stringKeyFixForParticipantsTable = game:DefineFastFlag("StringKeyFixForParticipantsTable", false)
local showJoinVoiceRaceConditionFix = game:DefineFastFlag("ShowJoinVoiceRaceConditionFix", false)
local consoleVoiceIXPEnabled = game:DefineFastFlag("ConsoleVoiceIXPEnabled", false)
local fFlagExpChatDictation = require(parent_1.SharedFlags).FFlagExpChatDictation
local consoleVoiceIXPLayerName = game:DefineFastString("ConsoleVoiceIXPLayerName", "User.Communication.ConsoleVoice")
local consoleVoiceEnabledIXPLayerValue = game:DefineFastString("ConsoleVoiceEnabledIXPLayerValue", "ConsoleVoiceEnabled")
local var29 = require(flags.GetFFlagTalkingChangedWithDebounceV2)()
local var30 = require(flags.GetFIntTalkingChangedDebounceTime)()
local sendVoiceCapturedDuringVideoCaptureEvent = game:DefineFastFlag("SendVoiceCapturedDuringVideoCaptureEvent", false)
local getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice = require(parent_1.SharedFlags).GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice
local getFFlagLuaConsumePlayerModeratedModule = require(flags.GetFFlagLuaConsumePlayerModerated)
local getFFlagLocalMutedNilFix = require(parent_1.SharedFlags).GetFFlagLocalMutedNilFix
local getFFlagEnableVoiceReverseNudgeModule = require(flags.GetFFlagEnableVoiceReverseNudge)
local getFFlagClearUserFromRecentVoiceDataOnLeaveModule = require(flags.GetFFlagClearUserFromRecentVoiceDataOnLeave)
local getFIntVoiceUsersInteractionExpiryTimeSecondsModule = require(flags.GetFIntVoiceUsersInteractionExpiryTimeSeconds)
local getFFlagAvatarChatServiceEnabled = require(parent_1.SharedFlags).GetFFlagAvatarChatServiceEnabled
local getFFlagVoiceChatServiceManagerUseAvatarChatModule = require(flags.GetFFlagVoiceChatServiceManagerUseAvatarChat)
local getFFlagJoinWithoutMicPermissions = require(parent_1.SharedFlags).GetFFlagJoinWithoutMicPermissions
local getFFlagBatchVoiceParticipantsUpdatesModule = require(flags.GetFFlagBatchVoiceParticipantsUpdates)
local getFIntThrottleParticipantsUpdateMsModule = require(flags.GetFIntThrottleParticipantsUpdateMs)
local getFFlagSeamlessVoiceFTUX = require(parent_1.SharedFlags).GetFFlagSeamlessVoiceFTUX
local getFFlagNonVoiceFTUX = require(parent_1.SharedFlags).GetFFlagNonVoiceFTUX
local getFFlagEnableFtuxExitOnMuteToggleModule = require(flags.GetFFlagEnableFtuxExitOnMuteToggle)
local getFFlagEnableExpJoinMicPermAnalyticsModule = require(flags.GetFFlagEnableExpJoinMicPermAnalytics)
local getFFlagEnableSeamlessVoiceFeatureModule = require(flags.GetFFlagEnableSeamlessVoiceFeature)
local getFFlagFixGetPlayerByUserIdStringCastModule = require(flags.GetFFlagFixGetPlayerByUserIdStringCast)
local fFlagDebugShowAudioDeviceInputDebugger = require(parent_1.SharedFlags).GetFFlagDebugShowAudioDeviceInputDebugger()
local voicePerformanceThrottlingIXPLayerName = game:DefineFastString("VoicePerformanceThrottlingIXPLayerName", "Voice.Performance")
local throttleParticipantsUpdateIXPLayerValue = game:DefineFastString("ThrottleParticipantsUpdateIXPLayerValue", "ThrottleParticipantsUpdate")
local var46 = require(flags.GetFFlagUseAudioAnalyzerForLocalMetering2)()
local stopModerationConnectionOnLeave = game:DefineFastFlag("StopModerationConnectionOnLeave", false)
local var48 = require(flags.GetFFlagDeactivateAudioDeviceOnVoiceLeave)()
local disableRejoinGroupIdDoubleRead = game:DefineFastFlag("DisableRejoinGroupIdDoubleRead", false)
local voiceVolumeControlsApplyGameSettingsVoiceVolumeEngineFeature = game:GetEngineFeature("VoiceVolumeControlsApplyGameSettingsVoiceVolume")
local voiceVolumeControlsEnableVoiceVolumeEligibilityTelemetry = game:DefineFastFlag("VoiceVolumeControlsEnableVoiceVolumeEligibilityTelemetry", false)
local var52 = require(flags.GetFFlagVoiceVolumeControlsEnableVoiceVolumeImpressionsTelemetry)()
local voiceVolumeControlsEligibilityModule = require(parent.VoiceVolumeControlsEligibility)
local enableMutedByLocalUserEngineFeature = game:GetEngineFeature("EnableMutedByLocalUser")
local voiceChatMuteAllSyncMutedPlayers = game:DefineFastFlag("VoiceChatMuteAllSyncMutedPlayers", false)
local rbxAnalyticsServiceExposePlaySessionIdEngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local getFFlagEnableVoiceChatMuteForVideoCaptures = require(parent_1.SharedFlags).GetFFlagEnableVoiceChatMuteForVideoCaptures
local var57 = sendVoiceCapturedDuringVideoCaptureEvent and getFFlagEnableVoiceChatMuteForVideoCaptures()
local getFFlagDebugVoiceChatMicPermissionCliBypassModule = require(flags.GetFFlagDebugVoiceChatMicPermissionCliBypass)
local getFFlagEnableVoiceSignal = require(parent_1.SharedFlags).GetFFlagEnableVoiceSignal
local getFFlagEnableInExpPhoneVoiceUpsellEntrypoints = require(parent_1.SharedFlags).GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints
local getFFlagVoiceChatClientRewriteMasterLua = require(parent_1.SharedFlags).GetFFlagVoiceChatClientRewriteMasterLua
local getFFlagCheckUniversePlaceBeforeSuspending = require(parent_1.SharedFlags).GetFFlagCheckUniversePlaceBeforeSuspending
local getFFlagDisconnectToastClientRewrite = require(parent_1.SharedFlags).GetFFlagDisconnectToastClientRewrite
local fFlagEnablePartyVoiceChangersInLua = require(parent_1.SharedFlags).FFlagEnablePartyVoiceChangersInLua
local getFFlagEnableVoiceUxUpdates = require(parent_1.SharedFlags).GetFFlagEnableVoiceUxUpdates
local getFFlagCoreMicManagerRefactorModule = require(flags.GetFFlagCoreMicManagerRefactor)
local var60 = if getFFlagCoreMicManagerRefactorModule() then require(script.Parent.MicInputManager) else nil
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
	_voiceVolumeEligibilityReported = false,
	mutedPlayers = {},
	voiceChangerActivePlayers = {},
	BlockStatusChanged = nil,
	AvatarChatService = if getFFlagAvatarChatServiceEnabled() then game:GetService("AvatarChatService") else nil,
	HttpRbxApiService = httpRbxApiService,
	ThirdPartyUserService = thirdPartyUserService,
	CaptureService = if getFFlagEnableVoiceChatMuteForVideoCaptures() then game:GetService("CaptureService") else nil,
	TelemetryService = if var57 then game:GetService("TelemetryService") else nil,
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
	voiceCapturedDuringVideoCapture = false,
	_voiceJoinTimestampMs = nil,
	_voiceVolumeSliderEligibleAtJoin = false,
	_gameSettingsOpenedTimestampMs = nil
}
local t_2 = {
	localMuted = true,
	isTalking = true,
	permissionState = true
}

function t_1:__index(p0) --[[ line: 316 ]]
	-- upvalues: getFFlagCoreMicManagerRefactorModule (ref), t_2 (ref), t_1 (ref)
	if getFFlagCoreMicManagerRefactorModule() then
		local var67 = rawget(self, "micManager")
		
		return if var67 and t_2[p0] then var67[p0] else t_1[p0]
	end
end

function t_1:__newindex(p1, p2) --[[ line: 326 ]]
	-- upvalues: getFFlagCoreMicManagerRefactorModule (ref), t_2 (ref)
	if getFFlagCoreMicManagerRefactorModule() then
		local var68 = rawget(self, "micManager")
		
		if var68 and t_2[p1] then
			var68[p1] = p2
			
			return
		end
	end
	rawset(self, p1, p2)
end

function t_1.new(p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13) --[[ line: 337 ]]
	-- upvalues: utilsModule (ref), analyticsModule (ref), appStorageService (ref), t_1 (ref), WATCHED_MESSAGE_TYPES (ref), getFIntThrottleParticipantsUpdateMsModule (ref), playersService_1 (ref), name (ref), IXPServiceWrapper (ref), voicePerformanceThrottlingIXPLayerName (ref), throttleParticipantsUpdateIXPLayerValue (ref), getFFlagCoreMicManagerRefactorModule (ref), var60 (ref), var57 (ref)
	local tbl = setmetatable({
		previousSessionId = nil,
		HttpRbxApiService = p5,
		eventEmitter = utilsModule.EventEmitter.new(),
		service = p6,
		PermissionsService = p4,
		NotificationService = p8,
		AvatarChatService = p9,
		Analytics = analyticsModule.new(p7),
		SequenceNumbers = {},
		SignalREventTable = {},
		audioDevices = {},
		BlockStatusChanged = p3,
		AppStorageService = p10 or appStorageService,
		ThirdPartyUserService = p11,
		CaptureService = p12,
		AdService = p13
	}, t_1)
	
	for i, v in WATCHED_MESSAGE_TYPES do
		tbl.SignalREventTable[v] = Instance.new("BindableEvent")
	end
	tbl.shouldThrottleParticipantUpdate = false
	tbl.participantsStateThrottleTime = 0
	tbl.lastParticipantsStateUpdate = 0
	tbl.lastStateUpdateCounter = 0
	
	if getFIntThrottleParticipantsUpdateMsModule() > 0 then
		task.spawn(function() --[[ line: 379 ]]
			-- upvalues: playersService_1 (copy), p6 (ref), name (copy), IXPServiceWrapper (copy), voicePerformanceThrottlingIXPLayerName (copy)
			local ok, status = pcall(function() --[[ line: 380 ]]
				-- upvalues: playersService_1 (copy), p6 (copy)
				return if playersService_1.LocalPlayer then p6:IsVoiceEnabledForUserIdAsync(playersService_1.LocalPlayer.UserId) else false
			end)
			
			if not ok then
				name:debug("Unable to get voice enabled status: ", status)
				
				return
			elseif status then
				IXPServiceWrapper:LogUserLayerExposure(voicePerformanceThrottlingIXPLayerName)
			end
		end)
		tbl.participantsStateThrottleTime = getFIntThrottleParticipantsUpdateMsModule() / 1000
		local ok, status = pcall(function() --[[ line: 396 ]]
			-- upvalues: IXPServiceWrapper (copy), voicePerformanceThrottlingIXPLayerName (copy)
			return IXPServiceWrapper:GetLayerData(voicePerformanceThrottlingIXPLayerName)
		end)
		
		if ok and status and status[throttleParticipantsUpdateIXPLayerValue] then
			tbl.shouldThrottleParticipantUpdate = true
		end
	end
	if getFFlagCoreMicManagerRefactorModule() then
		tbl.micManager = var60.new({
			log = name,
			callbacks = {
				emitGetPermissions = function(p14, p15, p16, p17) --[[ line: 408 ]]
					-- upvalues: tbl (ref)
					tbl:emit("GetPermissions", p14, p15, p16, p17)
				end,
				emitOnPermissionRequested = function() --[[ line: 411 ]]
					-- upvalues: tbl (ref)
					tbl:emit("OnPermissionRequested")
				end,
				emitOnRequestMicPermissionResolved = function() --[[ line: 414 ]]
					-- upvalues: tbl (ref)
					tbl:emit("OnRequestMicPermissionResolved")
				end,
				emitOnRequestMicPermissionRejected = function() --[[ line: 417 ]]
					-- upvalues: tbl (ref)
					tbl:emit("OnRequestMicPermissionRejected")
				end,
				emitOnShowDataConsentToast = function() --[[ line: 420 ]]
					-- upvalues: tbl (ref)
					tbl:emit("OnShowDataConsentToast")
				end,
				getAudioDevices = function() --[[ line: 423 ]]
					-- upvalues: tbl (ref)
					return tbl.audioDevices
				end,
				getSendMuteEvent = function() --[[ line: 426 ]]
					-- upvalues: tbl (ref)
					return tbl:GetSendMuteEvent()
				end,
				isSignalActive = function(value) --[[ line: 429 ]]
					-- upvalues: tbl (ref)
					return tbl:IsSignalActive(value)
				end,
				reportVoiceMuteSelf = function(p18) --[[ line: 432 ]]
					-- upvalues: tbl (ref)
					tbl.Analytics:reportVoiceMuteSelf(p18)
				end,
				getJoinWithVoiceMuteData = function(p19) --[[ line: 435 ]]
					-- upvalues: tbl (ref)
					return tbl:JoinWithVoiceMuteData(p19)
				end,
				recordExperienceJoinMicPerm = function(p20) --[[ line: 438 ]]
					-- upvalues: tbl (ref)
					tbl:RecordExperienceJoinMicPermissionStatus(p20)
				end,
				reportJoinFailed = function(p21, p22) --[[ line: 441 ]]
					-- upvalues: tbl (ref), analyticsModule (copy)
					tbl:_reportJoinFailed(p21, p22 or analyticsModule.ERROR)
				end,
				requestPermissions = function(p23) --[[ line: 444 ]]
					-- upvalues: tbl (ref)
					return tbl.PermissionsService:requestPermissions(p23)
				end,
				getPassInitErrorInPromiseReject = function() --[[ line: 447 ]]
					-- upvalues: tbl (ref)
					return tbl.options.passInitErrorInPromiseReject
				end,
				onVoiceCapturedDuringVideoCapture = function(p24) --[[ line: 450 ]]
					-- upvalues: var57 (copy), tbl (ref)
					if var57 and tbl.CaptureService:IsCapturingVideo() then
						tbl.voiceCapturedDuringVideoCapture = tbl.voiceCapturedDuringVideoCapture or p24
					end
				end,
				getService = function() --[[ line: 457 ]]
					-- upvalues: tbl (ref)
					return tbl.service
				end
			}
		})
		tbl.muteChanged = tbl.micManager.muteChanged
		tbl.talkingChanged = tbl.micManager.talkingChanged
	end
	return tbl
end

function t_1:emit(p25, ...) --[[ line: 469 ]]
	self.eventEmitter:emit(p25, ...)
end

function t_1:subscribe(p26, p27) --[[ line: 473 ]]
	self.eventEmitter:addListener(p26, p27)
end

function t_1:unsubscribe(p28, p29) --[[ line: 477 ]]
	self.eventEmitter:removeListener(p28, p29)
end

function t_1:unsubscribeAll() --[[ line: 481 ]]
	self.eventEmitter:removeAllListeners()
end

function t_1.CheckCallStateWithPromise(p30) --[[ line: 485 ]]
	-- upvalues: default (ref), name (ref), enums (ref)
	return default:getCallState():andThen(function(p32) --[[ line: 487 ]]
		-- upvalues: name (copy), enums (copy), p30 (ref)
		name:trace("Got user call state")
		
		if p32.status ~= enums.CallStatus.Idle.rawValue() and p32.status ~= enums.CallStatus.Ringing.rawValue() then
			p30.isInCall = true
			p30.callMutedState = p32.muted
			name:trace("Changing call muted state to {}", p32.muted)
		end
	end):catch(function(p31) --[[ line: 499 ]]
		-- upvalues: name (copy)
		name:trace("User not in call {}", p31)
	end)
end

function t_1.CheckCallState(p33) --[[ line: 505 ]]
	-- upvalues: name (ref), default (ref), enums (ref)
	name:trace("Checking user call state")
	local ok, status = pcall(function() --[[ line: 507 ]]
		-- upvalues: default (copy), name (copy), enums (copy), p33 (ref)
		default:getCallState():andThen(function(p35) --[[ line: 509 ]]
			-- upvalues: name (copy), enums (copy), p33 (copy)
			name:trace("Got user call state")
			
			if p35.status ~= enums.CallStatus.Idle.rawValue() and p35.status ~= enums.CallStatus.Ringing.rawValue() then
				p33.isInCall = true
				p33.callMutedState = p35.muted
				name:trace("Changing call muted state to {}", p35.muted)
			end
		end):catch(function(p34) --[[ line: 521 ]]
			-- upvalues: name (copy)
			name:trace("User not in call {}", p34)
		end)
	end)
	
	if not ok then
		name:debug("Error checking user call state {}", status)
	end
end

function t_1._GetShowAgeVerificationOverlay(p36, p37) --[[ line: 540 ]]
	-- upvalues: getShowAgeVerificationOverlayModule (ref), utilsModule (ref)
	return getShowAgeVerificationOverlayModule(utilsModule.bind(p36, "GetRequest"), tostring(game.GameId), tostring(game.PlaceId), p37)
end

function t_1:FetchAgeVerificationOverlay(p38) --[[ line: 549 ]]
	-- upvalues: promiseModule (ref)
	if not self._getShowAgeVerificationOverlayResult then
		if not self._getShowAgeVerificationOverlayPromise then
			self._getShowAgeVerificationOverlayPromise = promiseModule.new(function(p39, _) --[[ line: 552 ]]
				-- upvalues: self (ref), p38 (ref)
				self._getShowAgeVerificationOverlayResult = self:_GetShowAgeVerificationOverlay(p38)
				p39(self._getShowAgeVerificationOverlayResult)
			end)
		end
		self._getShowAgeVerificationOverlayPromise:await()
	end
	return self._getShowAgeVerificationOverlayResult
end

function t_1._GetShowPhoneVerificationUpsell(p40, p41, p42) --[[ line: 568 ]]
	-- upvalues: getShowPhoneVerificationUpsellModule (ref), utilsModule (ref)
	return getShowPhoneVerificationUpsellModule(utilsModule.bind(p40, "GetRequest"), tostring(game.GameId), p41, p42)
end

function t_1:FetchPhoneVerificationUpsell(p43, p44, p45) --[[ line: 581 ]]
	-- upvalues: promiseModule (ref), constantsModule (ref)
	if not self._getShowPhoneVerificationUpsellResult then
		self._getShowPhoneVerificationUpsellResult = {}
		self._getShowPhoneVerificationUpsellPromise = {}
	end
	if not self._getShowPhoneVerificationUpsellResult[p43] or p45 then
		if not self._getShowPhoneVerificationUpsellPromise[p43] or p45 then
			self._getShowPhoneVerificationUpsellPromise[p43] = promiseModule.new(function(p46, _) --[[ line: 592 ]]
				-- upvalues: self (ref), p43 (ref), p44 (ref), constantsModule (copy)
				local var70 = self:_GetShowPhoneVerificationUpsell(p43, p44)
				self._getShowPhoneVerificationUpsellResult[p43] = if type(var70) == "table" and var70.valueProp ~= nil then var70.valueProp else constantsModule.PHONE_UPSELL_VOICE_CHAT_PROP.None
				p46()
			end)
		end
		self._getShowPhoneVerificationUpsellPromise[p43]:await()
	end
	return self._getShowPhoneVerificationUpsellResult[p43]
end

function t_1:DisablePhoneVerificationUpsell() --[[ line: 606 ]]
	-- upvalues: cryoModule (ref), constantsModule (ref)
	self._getShowPhoneVerificationUpsellResult = cryoModule.Dictionary.map(self._getShowPhoneVerificationUpsellResult, function() --[[ line: 609 ]]
		-- upvalues: constantsModule (copy)
		return constantsModule.PHONE_UPSELL_VOICE_CHAT_PROP.None
	end)
end

function t_1:GetNudgeAnalyticsData() --[[ line: 615 ]]
	-- upvalues: playersService (ref)
	return playersService.LocalPlayer.UserId, self:GetSessionId()
end

function t_1:avatarChatUserAndPlaceSettingsValueOfClientFeatures(p47) --[[ line: 620 ]]
	-- upvalues: getFFlagEnableVoiceSignal (ref)
	return {
		universePlaceVoiceEnabledSettings = {
			isUniverseEnabledForVoice = self.AvatarChatService:IsEnabled(p47, Enum.AvatarChatServiceFeature.UniverseAudio),
			isPlaceEnabledForVoice = self.AvatarChatService:IsEnabled(p47, Enum.AvatarChatServiceFeature.PlaceAudio),
			isUniverseEnabledForAvatarVideo = self.AvatarChatService:IsEnabled(p47, Enum.AvatarChatServiceFeature.UniverseVideo),
			isPlaceEnabledForAvatarVideo = self.AvatarChatService:IsEnabled(p47, Enum.AvatarChatServiceFeature.PlaceVideo)
		},
		voiceSettings = {
			bannedUntil = nil,
			isUserEligible = self.AvatarChatService:IsEnabled(p47, Enum.AvatarChatServiceFeature.UserAudioEligible),
			isVoiceEnabled = self.AvatarChatService:IsEnabled(p47, Enum.AvatarChatServiceFeature.UserAudio),
			isAvatarVideoEligible = self.AvatarChatService:IsEnabled(p47, Enum.AvatarChatServiceFeature.UserVideoEligible),
			isAvatarVideoEnabled = self.AvatarChatService:IsEnabled(p47, Enum.AvatarChatServiceFeature.UserVideo),
			isUserVerifiedForVoice = if getFFlagEnableVoiceSignal() then self.AvatarChatService:IsEnabled(p47, Enum.AvatarChatServiceFeature.UserVerifiedForVoice) else nil,
			isBanned = self.AvatarChatService:IsEnabled(p47, Enum.AvatarChatServiceFeature.UserBanned)
		}
	}
end

function t_1:resolveAvatarChatUserAndPlaceSettings() --[[ line: 667 ]]
	local ok, status = pcall(self.AvatarChatService.GetClientFeaturesAsync, self.AvatarChatService)
	
	return if ok then self:avatarChatUserAndPlaceSettingsValueOfClientFeatures(status) else nil
end

function t_1.GetRequest(p48, p49, _) --[[ line: 677 ]]
	-- upvalues: httpService (ref)
	local ok, status = pcall(function() --[[ line: 678 ]]
		-- upvalues: p48 (ref), p49 (ref), httpService (copy)
		return httpService:JSONDecode(p48.HttpRbxApiService:GetAsyncFullUrl(p49, Enum.ThrottlingPriority.Default, Enum.HttpRequestType.Players))
	end)
	
	return ok and status
end

function t_1.PostUserVoiceConnectionStatus(p50, p51) --[[ line: 686 ]]
	-- upvalues: httpService (ref), constantsModule (ref)
	local ok, _ = pcall(function() --[[ line: 687 ]]
		-- upvalues: httpService (copy), p51 (ref), p50 (ref), constantsModule (copy)
		return httpService:JSONDecode(p50.HttpRbxApiService:PostAsyncFullUrl(constantsModule.VOICE_URL .. "/v1/user-voice-connection-state", httpService:JSONEncode({ IsUserVoiceConnected = p51 })))
	end)
	
	return ok
end

function t_1:GetVoiceAnalyticsData() --[[ line: 696 ]]
	-- upvalues: rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref), rbxAnalyticsService (ref)
	return {
		micAvailability = "",
		universeId = game.GameId,
		placeId = game.PlaceId,
		playSessionId = if rbxAnalyticsServiceExposePlaySessionIdEngineFeature then rbxAnalyticsService:GetPlaySessionId() else "",
		voiceSessionId = if self.service then self:GetSessionId() else ""
	}
end

function t_1:RecordExperienceJoinMicPermissionStatus(p52) --[[ line: 708 ]]
	-- upvalues: permissionsProtocol (ref), PERMISSION_STATE (ref)
	local voiceAnalyticsData = self:GetVoiceAnalyticsData()
	
	if p52 == nil or typeof(p52) ~= "table" then
		if self.permissionState then
			if self.permissionState == PERMISSION_STATE.LISTEN_AND_TALK then
				voiceAnalyticsData.micAvailability = "Granted"
			else
				voiceAnalyticsData.micAvailability = "Denied"
			end
		end
	elseif p52.status == permissionsProtocol.Status.AUTHORIZED then
		voiceAnalyticsData.micAvailability = "Granted"
	else
		voiceAnalyticsData.micAvailability = "Denied"
	end
	self.Analytics:reportVoiceEvents("experienceJoinDeviceMicPermissionEvent", voiceAnalyticsData)
end

function t_1:CheckCaptureMute() --[[ line: 728 ]]
	-- upvalues: getFFlagEnableVoiceChatMuteForVideoCaptures (ref)
	return if getFFlagEnableVoiceChatMuteForVideoCaptures() then self.CaptureService:IsCapturingVideo() else false
end

function t_1:ToggleMuteSome(p53, p54, p55, p56) --[[ line: 737 ]]
	-- upvalues: voiceChatService (ref), enableMutedByLocalUserEngineFeature (ref), playersService (ref)
	self:ensureInitialized("mute some players")
	self._mutedAnyone = true
	local t = {}
	p54 = p54 or self:CheckCaptureMute()
	
	for i, v in p53 do
		if voiceChatService.UseNewAudioApi then
			t[v] = true
			self.mutedPlayers[v] = p54
		else
			self.service:SubscribePause(v, p54)
		end
		local var74 = self.participants[tostring(v)]
		
		if var74 then
			var74.isMutedLocally = p54
			self.participantsUpdate:Fire(self.participants)
		end
	end
	if voiceChatService.UseNewAudioApi then
		for i_1 in self.audioDevices do
			if i_1.Player and t[i_1.Player.UserId] then
				if not enableMutedByLocalUserEngineFeature or i_1.Player == playersService.LocalPlayer then
					i_1.Active = not p54
					continue
				else
					i_1.MutedByLocalUser = p54
				end
			end
		end
	end
	if p55 and p56 then
		self.Analytics:reportVoiceMuteGroup(self:JoinWithVoiceMuteData({ groupType = p55, context = p56, muted = p54 }))
	end
end

function t_1:GetMutedAnyone() --[[ line: 782 ]]
	return self._mutedAnyone
end

function t_1:RecordGameSettingsOpened() --[[ line: 786 ]]
	-- upvalues: var52 (ref), voiceVolumeControlsApplyGameSettingsVoiceVolumeEngineFeature (ref)
	if var52 and voiceVolumeControlsApplyGameSettingsVoiceVolumeEngineFeature and (self._voiceJoinTimestampMs and not self._gameSettingsOpenedTimestampMs) then
		self._gameSettingsOpenedTimestampMs = DateTime.now().UnixTimestampMillis
	end
end

function t_1:ResetVoiceVolumeImpressionsSession() --[[ line: 797 ]]
	-- upvalues: var52 (ref), voiceVolumeControlsApplyGameSettingsVoiceVolumeEngineFeature (ref)
	if var52 and voiceVolumeControlsApplyGameSettingsVoiceVolumeEngineFeature then
		self._voiceJoinTimestampMs = nil
		self._voiceVolumeSliderEligibleAtJoin = false
		self._gameSettingsOpenedTimestampMs = nil
	end
end

function t_1:ReportVoiceVolumeImpressionsIfNeeded() --[[ line: 808 ]]
	-- upvalues: var52 (ref), voiceVolumeControlsApplyGameSettingsVoiceVolumeEngineFeature (ref)
	if var52 and voiceVolumeControlsApplyGameSettingsVoiceVolumeEngineFeature and (self._voiceJoinTimestampMs and self._voiceVolumeSliderEligibleAtJoin) then
		local voiceAnalyticsData = self:GetVoiceAnalyticsData()
		self.Analytics:reportVoiceVolumeImpressions({
			playSessionId = voiceAnalyticsData.playSessionId,
			voiceSessionId = voiceAnalyticsData.voiceSessionId,
			sliderSeen = self._gameSettingsOpenedTimestampMs ~= nil,
			voiceJoinTimestampMs = self._voiceJoinTimestampMs,
			sliderSeenTimestampMs = self._gameSettingsOpenedTimestampMs
		})
		self:ResetVoiceVolumeImpressionsSession()
		
		return
	end
end

function t_1:ToggleMutePlayer(p57, p58) --[[ line: 830 ]]
	-- upvalues: voiceChatService (ref), name (ref), utilsModule (ref), getFFlagEnableFtuxExitOnMuteToggleModule (ref), enableMutedByLocalUserEngineFeature (ref), playersService (ref)
	self:ensureInitialized("mute player " .. p57)
	self._mutedAnyone = true
	local var76 = (if voiceChatService.UseNewAudioApi then not self.mutedPlayers[p57] else not self.service:IsSubscribePaused(p57)) or self:CheckCaptureMute()
	name:trace("Setting mute for {} to {}", utilsModule.shorten(p57), var76)
	
	if getFFlagEnableFtuxExitOnMuteToggleModule() then
		self.onPlayerMuteToggled:Fire()
	end
	if voiceChatService.UseNewAudioApi then
		self.mutedPlayers[p57] = var76
		
		for i in self.audioDevices do
			if i.Player and i.Player.UserId == p57 then
				if enableMutedByLocalUserEngineFeature and i.Player ~= playersService.LocalPlayer then
					i.MutedByLocalUser = var76
					continue
				end
				local var77 = self.participants[tostring(p57)]
				i.Active = not var76 and (var77 and not var77.isMuted)
				continue
			end
		end
		self:emit("OnPlayerMuted")
	else
		self.service:SubscribePause(p57, var76)
	end
	for i, v in pairs(self.participants) do
		if v.userId == p57 then
			v.isMutedLocally = var76
			self.participantsUpdate:Fire(self.participants)
		end
	end
	if p58 then
		self.Analytics:reportVoiceMuteIndividual(self:JoinWithVoiceMuteData({
			targetUserId = tonumber(p57),
			context = p58,
			muted = var76
		}))
	end
end

function t_1:MuteAll(p59, p60) --[[ line: 884 ]]
	-- upvalues: voiceChatService (ref), name (ref), voiceChatMuteAllSyncMutedPlayers (ref), playersService (ref), enableMutedByLocalUserEngineFeature (ref), constantsModule (ref)
	self:ensureInitialized("mute all")
	self._mutedAnyone = true
	p59 = p59 or self:CheckCaptureMute()
	
	if voiceChatService.UseNewAudioApi then
		self.muteAll = p59
		name:trace("Setting self mute all to {} context: {}", p59, p60)
		
		if voiceChatMuteAllSyncMutedPlayers and not p59 then
			table.clear(self.mutedPlayers)
		end
		for i in self.audioDevices do
			if i.Player and i.Player ~= playersService.LocalPlayer then
				name:debug("Local muting {} to '{} = {}'", i.Player.Name, i.Active, p59)
				
				if enableMutedByLocalUserEngineFeature then
					i.MutedByLocalUser = p59
					
					if voiceChatMuteAllSyncMutedPlayers then
						self.mutedPlayers[i.Player.UserId] = p59
					end
				else
					local userId = i.Player.UserId
					self.mutedPlayers[userId] = p59
					local var79 = self.participants[tostring(userId)]
					i.Active = not p59 and (var79 and not var79.isMuted)
				end
			end
		end
	else
		self.service:SubscribePauseAll(p59)
	end
	for i, v in pairs(self.participants) do
		v.isMutedLocally = p59
		self.participantsUpdate:Fire(self.participants)
	end
	self.muteAllChanged:Fire(p59)
	
	if p60 then
		self.Analytics:reportVoiceMuteGroup(self:JoinWithVoiceMuteData({
			groupType = constantsModule.VOICE_GROUP_TYPE.ALL,
			context = p60,
			muted = p59
		}))
	end
end

function t_1:FetchVoicePermissions() --[[ line: 933 ]]
	if not self.communicationPermissionsResult then
		self.communicationPermissionsResult = self:resolveAvatarChatUserAndPlaceSettings()
	end
	return self.communicationPermissionsResult
end

function t_1:verifyUniverseAndPlaceCanUseVoice() --[[ line: 941 ]]
	-- upvalues: getFFlagAvatarChatServiceEnabled (ref), getFFlagVoiceChatServiceManagerUseAvatarChatModule (ref), analyticsModule (ref)
	local var80 = if getFFlagAvatarChatServiceEnabled() and getFFlagVoiceChatServiceManagerUseAvatarChatModule() then self:resolveAvatarChatUserAndPlaceSettings() else self:FetchAgeVerificationOverlay()
	
	if var80 then
		local universePlaceVoiceEnabledSettings = var80.universePlaceVoiceEnabledSettings
		
		return universePlaceVoiceEnabledSettings and (universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice and universePlaceVoiceEnabledSettings.isUniverseEnabledForVoice)
	end
	self:_reportJoinFailed("invalidResponse", analyticsModule.ERROR)
	
	return false
end

function t_1:IsUserInFTUX() --[[ line: 961 ]]
	-- upvalues: getFFlagSeamlessVoiceFTUX (ref), getFFlagCheckUniversePlaceBeforeSuspending (ref), name (ref)
	if not getFFlagSeamlessVoiceFTUX() then
		return false
	elseif getFFlagCheckUniversePlaceBeforeSuspending() and not self:verifyUniverseAndPlaceCanUseVoice() then
		return false
	end
	local appStorageService = game:GetService("AppStorageService")
	local var82 = nil
	
	if not pcall(function() --[[ line: 971 ]]
		-- upvalues: appStorageService (ref), var82 (write)
		var82 = appStorageService:GetItem("SeamlessVoiceFTUX") == "true"
	end) then
		name:warning("Failed to read FTUX/STUX from AppStorage")
		
		return false
	end
	local var83 = self:FetchAgeVerificationOverlay()
	
	if type(var83) == "table" and var83.voiceSettings and var83.voiceSettings.seamlessVoiceStatus ~= 3 then
		name:debug("User not eligible for FTUX/STUX")
		
		return false
	end
	return not var82
end

function t_1.isEnableDefaultVoiceOnForPlace(_) --[[ line: 994 ]]
	-- upvalues: voiceChatService (ref)
	if not game:IsLoaded() then
		game.Loaded:Wait()
	end
	return voiceChatService.UseNewAudioApi or voiceChatService.EnableDefaultVoice
end

function t_1:verifyPlaceCanUseVoice(p61, p62) --[[ line: 1005 ]]
	-- upvalues: analyticsModule (ref)
	if not p61 or not p62 then
		self:_reportJoinFailed("invalidResponse", analyticsModule.ERROR)
		
		return false
	elseif not p61.isUniverseEnabledForVoice then
		self:_reportJoinFailed("universeNotEnabled")
		
		return false
	end
	self:emit("OnUserAndPlaceCanUseVoiceResolved", p62, p61)
	
	if not p61.isPlaceEnabledForVoice then
		self:_reportJoinFailed("placeNotEnabled")
		
		return false
	end
	return self:isEnableDefaultVoiceOnForPlace()
end

function t_1:EligibleForFaeUpsell() --[[ line: 1030 ]]
	-- upvalues: FAE_ENABLED (ref)
	local var84 = self:FetchAgeVerificationOverlay()
	
	return if var84 and type(var84) == "table" then var84.inExperienceFaeUpsell == FAE_ENABLED and var84.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice else false
end

function t_1:OptUserToJoinVoice() --[[ line: 1040 ]]
	-- upvalues: name (ref)
	name:debug("Opting user to join voice on age verification")
	self.hasOptedToJoinVoiceOnAgeVerification = true
end

function t_1:SetupFAECompleteListener() --[[ line: 1045 ]]
	-- upvalues: name (ref)
	name:debug("Setting up FAE complete listener")
	
	if game:GetEngineFeature("ChatReconcileAccess") then
		name:debug("Using ChatService ReconcileCommunicationAccessCompleted event")
		self.ChatService.ReconcileCommunicationAccessCompleted:Connect(function() --[[ line: 1049 ]]
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

function t_1:EligibleForAgeCheckToast() --[[ line: 1069 ]]
	-- upvalues: FAE_SETTINGS_TOAST (ref)
	local var85 = self:FetchAgeVerificationOverlay()
	
	return if var85 and type(var85) == "table" then var85.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice and (self:isEnableDefaultVoiceOnForPlace() and var85.inExperienceFaeUpsell == FAE_SETTINGS_TOAST) else false
end

function t_1:userAndPlaceCanUseVoice() --[[ line: 1079 ]]
	-- upvalues: getFFlagAvatarChatServiceEnabled (ref), getFFlagVoiceChatServiceManagerUseAvatarChatModule (ref), getShowAgeVerificationOverlayModule (ref), utilsModule (ref), analyticsModule (ref), name (ref), getFFlagEnableVoiceSignal (ref), getFFlagEnableInExpPhoneVoiceUpsellEntrypoints (ref), constantsModule (ref), VOICE_JOIN_PROGRESS (ref), getFFlagEnableVoiceUxUpdates (ref), getFFlagNonVoiceFTUX (ref)
	if self.ThirdPartyUserService ~= nil and self.ThirdPartyUserService:IsChatRestrictionSupported() and self.ThirdPartyUserService:GetVoiceChatRestrictionStatus() ~= Enum.ChatRestrictionStatus.NotRestricted then
		return false
	end
	local var86 = if getFFlagAvatarChatServiceEnabled() and getFFlagVoiceChatServiceManagerUseAvatarChatModule() then self:resolveAvatarChatUserAndPlaceSettings() else getShowAgeVerificationOverlayModule(utilsModule.bind(self, "GetRequest"), tostring(game.GameId), tostring(game.PlaceId))
	
	if not var86 then
		self:_reportJoinFailed("invalidResponse", analyticsModule.ERROR)
		
		return false
	elseif self.options.forceVoiceEnabled then
		var86.voiceSettings.isVoiceEnabled = true
		name:debug("bypassing voice permissions check")
	end
	local universePlaceVoiceEnabledSettings = var86.universePlaceVoiceEnabledSettings
	local voiceSettings = var86.voiceSettings
	name:trace("Voice settings endpoint returned {}", var86)
	
	if not self:verifyPlaceCanUseVoice(universePlaceVoiceEnabledSettings, voiceSettings) then
		return false
	elseif getFFlagEnableVoiceSignal() then
		self.communicationPermissionsResult = var86
		local var87 = getFFlagEnableInExpPhoneVoiceUpsellEntrypoints() and os.time()
		
		if self:UserEligibleForInExperienceUpsell() or (getFFlagEnableInExpPhoneVoiceUpsellEntrypoints() and (not self:UserVoiceEnabled() and (not voiceSettings.isUserVerifiedForVoice and (if self:FetchPhoneVerificationUpsell(constantsModule.IN_EXP_PHONE_UPSELL_IXP_LAYER) ~= constantsModule.PHONE_UPSELL_VOICE_CHAT_PROP.VoiceChat then var87 and self:FetchPhoneVerificationUpsell(constantsModule.EXIT_CONFIRMATION_PHONE_UPSELL_IXP_LAYER, var87) == constantsModule.PHONE_UPSELL_VOICE_CHAT_PROP.VoiceChat else true)))) then
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
		elseif self:IsNewSeamlessVoiceUserDisconnect() then
			name:debug("Suspending voice join for new seamless voice user")
			self:ChangeVoiceJoinProgress(VOICE_JOIN_PROGRESS.Suspended)
		elseif self:IsSeamlessVoice() and self:UserOnlyEligibleForVoice() then
			name:debug("Suspending voice join for opt-out user")
			self:ChangeVoiceJoinProgress(VOICE_JOIN_PROGRESS.Suspended)
		end
		task.spawn(function() --[[ line: 1176 ]]
			-- upvalues: self (ref)
			self:FetchAgeVerificationOverlay()
		end)
	end
	if not voiceSettings.isVoiceEnabled then
		self:_reportJoinFailed("userNotEnabled")
	end
	return voiceSettings.isVoiceEnabled
end

function t_1.voicePermissionGranted(_, p63) --[[ line: 1191 ]]
	-- upvalues: permissionsProtocol (ref), cryoModule (ref)
	local _ = false
	
	return if typeof(p63) == "table" then if p63.status ~= permissionsProtocol.Status.AUTHORIZED then not cryoModule.List.find(p63.missingPermissions, permissionsProtocol.Permissions.MICROPHONE_ACCESS) else true else p63 == permissionsProtocol.Status.AUTHORIZED
end

function t_1.RawGetPermissions(p64, p65) --[[ line: 1211 ]]
	-- upvalues: promiseModule (ref)
	return promiseModule.new(function(p66, _) --[[ line: 1212 ]]
		-- upvalues: p64 (ref), p65 (ref)
		p64:emit("GetPermissions", function(p67) --[[ line: 1213 ]]
			-- upvalues: p66 (ref)
			p66(p67)
		end, p65, true, true)
	end)
end

function t_1:requestMicPermission() --[[ line: 1220 ]]
	-- upvalues: getFFlagCoreMicManagerRefactorModule (ref), getFFlagDebugVoiceChatMicPermissionCliBypassModule (ref), PERMISSION_STATE (ref), promiseModule (ref), name (ref), permissionsProtocol (ref), getFFlagEnableExpJoinMicPermAnalyticsModule (ref), analyticsModule (ref)
	if getFFlagCoreMicManagerRefactorModule() then
		return self.micManager:RequestMicPermission()
	elseif getFFlagDebugVoiceChatMicPermissionCliBypassModule() then
		self.permissionState = PERMISSION_STATE.LISTEN_AND_TALK
		
		return promiseModule.resolve()
	elseif self.permissionPromise then
		name:trace("PermissionProtocol already invoked")
		
		return self.permissionPromise
	end
	self.permissionPromise = self.PermissionsService:requestPermissions({ permissionsProtocol.Permissions.MICROPHONE_ACCESS }):andThen(function(p68) --[[ line: 1240 ]]
		-- upvalues: getFFlagEnableExpJoinMicPermAnalyticsModule (copy), self (ref), name (copy), analyticsModule (copy), promiseModule (copy), permissionsProtocol (copy)
		if getFFlagEnableExpJoinMicPermAnalyticsModule() then
			self:RecordExperienceJoinMicPermissionStatus(p68)
		end
		if p68 or p68.status then
			name:debug("Permission status {}", p68.status)
			local var89 = p68.status == permissionsProtocol.Status.AUTHORIZED
			
			return if self.options.passInitErrorInPromiseReject and not var89 then promiseModule.reject({ code = "INIT_ERROR_PERM_NOT_GRANTED" }) else var89 and promiseModule.resolve() or promiseModule.reject()
		end
		name:debug("No permission response, rejecting access")
		self:_reportJoinFailed("noPermissionResponse", analyticsModule.ERROR)
		
		return if self.options.passInitErrorInPromiseReject then promiseModule.reject({ code = "INIT_ERROR_NO_PERM_RESPONSE" }) else promiseModule.reject()
	end):andThen(function() --[[ line: 1260 ]]
		-- upvalues: self (ref), promiseModule (copy)
		self:emit("OnRequestMicPermissionResolved")
		
		return promiseModule.resolve()
	end):catch(function() --[[ line: 1265 ]]
		-- upvalues: self (ref), promiseModule (copy)
		self:emit("OnRequestMicPermissionRejected")
		
		return if self.options.passInitErrorInPromiseReject then promiseModule.reject({ code = "INIT_ERROR_MIC_PERM_REJECTED" }) else promiseModule.reject()
	end)
	
	return self.permissionPromise
end

function t_1:JoinByGroupIdToken(p69, p70) --[[ line: 1275 ]]
	self.previousGroupId = p69
	self.previousMutedState = p70
	
	return self.service:JoinByGroupIdToken(p69, p70)
end

function t_1:EnableVoice() --[[ line: 1281 ]]
	-- upvalues: name (ref)
	name:trace("Enabling voice")
	self.AvatarChatService:GetPropertyChangedSignal("ClientFeatures"):Once(function() --[[ line: 1284 ]]
		-- upvalues: self (ref)
		self.attemptVoiceRejoin:Fire()
	end)
	self.AvatarChatService:EnableVoice()
end

function t_1:ChangeVoiceJoinProgress(p71) --[[ line: 1290 ]]
	self.VoiceJoinProgress = p71
	self.VoiceJoinProgressChanged:Fire(self.VoiceJoinProgress)
end

function t_1:setOptions(p72) --[[ line: 1295 ]]
	self.options = p72
end

function t_1:ShouldShowJoinVoiceOnDisconnect() --[[ line: 1299 ]]
	-- upvalues: VOICE_JOIN_PROGRESS (ref)
	return self:IsSeamlessVoice() and self.VoiceJoinProgress == VOICE_JOIN_PROGRESS.Suspended
end

function t_1:IsSeamlessVoice() --[[ line: 1303 ]]
	-- upvalues: getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (ref), getFFlagCheckUniversePlaceBeforeSuspending (ref), constantsModule (ref)
	if getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() and not self.options.allowSeamlessVoice then
		return false
	end
	local var90 = self:FetchAgeVerificationOverlay()
	
	if type(var90) ~= "table" or not var90 or not var90.voiceSettings then
		return false
	elseif getFFlagCheckUniversePlaceBeforeSuspending() and not self:verifyUniverseAndPlaceCanUseVoice() then
		return false
	end
	local seamlessVoiceStatus = var90.voiceSettings.seamlessVoiceStatus
	
	return if seamlessVoiceStatus ~= constantsModule.SeamlessVoiceStatus.EnabledExistingUser then seamlessVoiceStatus == constantsModule.SeamlessVoiceStatus.EnabledNewUser else true
end

function t_1:HasSeamlessVoiceFeature(p73) --[[ line: 1325 ]]
	-- upvalues: getFFlagEnableSeamlessVoiceFeatureModule (ref), utilsModule (ref), constantsModule (ref)
	if not self.options.allowSeamlessVoice or not self:verifyUniverseAndPlaceCanUseVoice() then
		return false
	end
	local var91 = self:FetchAgeVerificationOverlay()
	
	if not self:_isValidAgeVerificationOverlayData(var91) then
		return false
	end
	local seamlessVoiceVariant = var91.voiceSettings.seamlessVoiceVariant
	
	if not seamlessVoiceVariant then
		return false
	elseif getFFlagEnableSeamlessVoiceFeatureModule() then
		if type(p73) == "string" then
			p73 = { p73 }
		end
		if not getFFlagEnableSeamlessVoiceFeatureModule(p73) then
		end
		local t = {}
		
		for i, v in pairs(utilsModule.jsonDecode(seamlessVoiceVariant)) do
			t[v] = true
		end
		if #p73 == 1 and p73[1] == constantsModule.SeamlessVoiceFeatures.ConnectDisconnect and seamlessVoiceVariant == constantsModule.SeamlessVoiceVariants.OnlyConnectDisconnect then
			return true
		end
		for i, v_1 in pairs(p73) do
			if not t[v_1] then
				return false
			end
		end
		return true
	else
		local var93 = ({
			[constantsModule.SeamlessVoiceFeatures.ConnectDisconnect] = function(p74) --[[ line: 1370 ]]
				-- upvalues: constantsModule (copy)
				return p74 ~= constantsModule.SeamlessVoiceVariants.Control
			end,
			[constantsModule.SeamlessVoiceFeatures.HearingWithoutMicPermissions] = function(p75) --[[ line: 1373 ]]
				-- upvalues: constantsModule (copy)
				return p75 == constantsModule.SeamlessVoiceVariants.HearingWithoutMicPermissions
			end
		})[p73]
		
		return if var93 then var93(seamlessVoiceVariant) else false
	end
end

function t_1:IsNewSeamlessVoiceUserDisconnect() --[[ line: 1387 ]]
	-- upvalues: constantsModule (ref)
	if not self.options.allowSeamlessVoice or not self:verifyUniverseAndPlaceCanUseVoice() then
		return false
	end
	local var94 = self:FetchAgeVerificationOverlay()
	
	if not self:_isValidAgeVerificationOverlayData(var94) then
		return false
	elseif var94.voiceSettings.seamlessVoiceStatus == constantsModule.SeamlessVoiceStatus.EnabledNewUser then
		local ok, status = pcall(function() --[[ line: 1406 ]]
			-- upvalues: self (ref), constantsModule (copy)
			return self.AppStorageService:GetItem(constantsModule.SEAMLESS_VOICE_FTUX_KEY)
		end)
		
		return ok and status == "false"
	end
	return false
end

function t_1._isValidAgeVerificationOverlayData(_, p76) --[[ line: 1414 ]]
	return type(p76) == "table" and (p76 and p76.voiceSettings)
end

function t_1:UserInInExperienceUpsellTreatment() --[[ line: 1418 ]]
	-- upvalues: constantsModule (ref)
	local var95 = self:FetchAgeVerificationOverlay()
	
	if not var95 then
		return false
	end
	local showVoiceInExperienceUpsellVariant = var95.showVoiceInExperienceUpsellVariant
	
	return if showVoiceInExperienceUpsellVariant ~= constantsModule.IN_EXP_UPSELL_VARIANT.VARIANT1 then if showVoiceInExperienceUpsellVariant ~= constantsModule.IN_EXP_UPSELL_VARIANT.VARIANT2 then showVoiceInExperienceUpsellVariant == constantsModule.IN_EXP_UPSELL_VARIANT.VARIANT3 else true else true
end

function t_1:UserOnlyEligibleForVoice() --[[ line: 1430 ]]
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

function t_1:UserOnlyEligibleForVoiceViaOverlay() --[[ line: 1446 ]]
	local var96 = self:FetchAgeVerificationOverlay()
	
	return if self:_isValidAgeVerificationOverlayData(var96) then var96.voiceSettings.isVerifiedForVoice and (not var96.voiceSettings.isVoiceEnabled and var96.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice) else false
end

function t_1:UserVoiceEnabled() --[[ line: 1459 ]]
	local communicationPermissionsResult = self.communicationPermissionsResult
	
	return if communicationPermissionsResult and communicationPermissionsResult.voiceSettings and communicationPermissionsResult.universePlaceVoiceEnabledSettings then communicationPermissionsResult.voiceSettings.isVoiceEnabled and communicationPermissionsResult.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice else false
end

function t_1:UserEligibleForInExperienceUpsell() --[[ line: 1469 ]]
	-- upvalues: getFFlagEnableVoiceSignal (ref)
	local var97 = self:UserOnlyEligibleForVoice()
	
	if not var97 then
		return false
	elseif getFFlagEnableVoiceSignal() then
		return var97 and self:UserInInExperienceUpsellTreatment()
	end
	local var98 = self:FetchAgeVerificationOverlay()
	
	return var97 and (var98 and var98.showVoiceInExperienceUpsell)
end

function t_1:canUseServiceAsync() --[[ line: 1490 ]]
	-- upvalues: name (ref), promiseModule (ref), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (ref), getFFlagEnableVoiceSignal (ref), VOICE_JOIN_PROGRESS (ref), VOICE_CHAT_AVAILABILITY (ref), voiceChatService (ref), consoleVoiceIXPEnabled (ref), IXPServiceWrapper (ref), consoleVoiceIXPLayerName (ref), consoleVoiceEnabledIXPLayerValue (ref)
	if self.available == nil and game:GetEngineFeature("VoiceChatSupported") then
		if not self.canUseServicePromise then
			self.canUseServicePromise = promiseModule.defer(function(p77, p78) --[[ line: 1500 ]]
				-- upvalues: self (ref), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), getFFlagEnableVoiceSignal (copy), VOICE_JOIN_PROGRESS (copy), name (copy), VOICE_CHAT_AVAILABILITY (copy), voiceChatService (copy), consoleVoiceIXPEnabled (copy), IXPServiceWrapper (copy), consoleVoiceIXPLayerName (copy), consoleVoiceEnabledIXPLayerValue (copy)
				local var99 = self:userAndPlaceCanUseVoice()
				
				if getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() then
					self.canUseServiceResult = var99
					self:emit("OnCanUseServiceResult", var99)
				end
				if getFFlagEnableVoiceSignal() and self.VoiceJoinProgress == VOICE_JOIN_PROGRESS.Suspended then
					name:debug("Place is voice enabled but user is not, delaying voice rejection")
					self.attemptVoiceRejoin.Event:Wait()
					name:debug("Attempting voice rejoin")
					self.communicationPermissionsResult.voiceSettings.isVoiceEnabled = true
					self.userEligible = true
					self.initializedPostSuspension = true
					p77()
					self:ChangeVoiceJoinProgress(VOICE_JOIN_PROGRESS.Joining)
					
					return
				elseif var99 then
					if game:GetEngineFeature("VoiceChatEnabledRccProperties") and (not voiceChatService.VoiceChatEnabledForUniverseOnRcc or not voiceChatService.VoiceChatEnabledForPlaceOnRcc) then
						name:debug("Disabling voice chat due to RCC Response. Universe: {}, Place: {}", voiceChatService.VoiceChatEnabledForUniverseOnRcc, voiceChatService.VoiceChatEnabledForPlaceOnRcc)
						
						if not voiceChatService.VoiceChatEnabledForUniverseOnRcc then
							self:_reportJoinFailed("universeNotEnabled")
						elseif not voiceChatService.VoiceChatEnabledForPlaceOnRcc then
							self:_reportJoinFailed("placeNotEnabled")
						end
						self.available = VOICE_CHAT_AVAILABILITY.PlaceNotAvailable
						
						if self.options.passInitErrorInPromiseReject then
							p78({ code = "INIT_ERROR_PLACE_NOT_AVAILABLE" })
							
							return
						end
						p78()
						
						return
					elseif not consoleVoiceIXPEnabled then
						self.userEligible = true
						p77()
						
						return
					end
					IXPServiceWrapper:WaitForInitialization()
					local ok, status = pcall(function() --[[ line: 1560 ]]
						-- upvalues: IXPServiceWrapper (copy), consoleVoiceIXPLayerName (copy)
						return IXPServiceWrapper:GetLayerData(consoleVoiceIXPLayerName)
					end)
					
					if ok and status and status[consoleVoiceEnabledIXPLayerValue] ~= nil then
						self.userEligible = status[consoleVoiceEnabledIXPLayerValue]
						IXPServiceWrapper:LogUserLayerExposure(consoleVoiceIXPLayerName)
					end
					if self.userEligible then
						p77()
						
						return
					elseif self.options.passInitErrorInPromiseReject then
						p78({ code = "INIT_ERROR_IXP_NOT_ELIGIBLE" })
						
						return
					end
					p78()
					
					return
				else
					name:info("Voice access denied")
					self.available = VOICE_CHAT_AVAILABILITY.UserNotAvailable
					
					if self.options.passInitErrorInPromiseReject then
						p78({ code = "INIT_ERROR_USER_NOT_AVAILABLE" })
						
						return
					end
					p78()
				end
			end):andThen(function() --[[ line: 1582 ]]
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

function t_1:_setRecentUserState(p79, p80) --[[ line: 1589 ]]
	-- upvalues: cryoModule (ref)
	self.recentUsersInteractionData = cryoModule.Dictionary.join(self.recentUsersInteractionData, {
		[tostring(p79)] = cryoModule.Dictionary.join(self.recentUsersInteractionData[tostring(p79)] or {}, p80)
	})
end

function t_1:getRecentUsersInteractionData() --[[ line: 1599 ]]
	self:_updateRecentUsersInteractionData()
	
	return self.recentUsersInteractionData
end

function t_1:GetSignalREvent(p81) --[[ line: 1604 ]]
	return self.SignalREventTable[p81].Event
end

function t_1:StartModerationSignal() --[[ line: 1609 ]]
	-- upvalues: name (ref), getFFlagVoiceChatClientRewriteMasterLua (ref), voiceChatService (ref)
	if not self.playerModeratedConnection then
		self.playerModeratedConnection = self:GetSignalREvent("ParticipantModeratedFromVoice"):Connect(function() --[[ line: 1612 ]]
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

function t_1:StopModerationSignal() --[[ line: 1627 ]]
	if self.playerModeratedConnection then
		self.playerModeratedConnection:Disconnect()
		self.playerModeratedConnection = nil
	end
end

function t_1:_updateRecentUsersInteractionData() --[[ line: 1634 ]]
	-- upvalues: stringKeyFixForParticipantsTable (ref), getFFlagClearUserFromRecentVoiceDataOnLeaveModule (ref), playersService (ref), getFIntVoiceUsersInteractionExpiryTimeSecondsModule (ref), cryoModule (ref)
	local timestamp = os.time()
	local t = {}
	
	if self.recentUsersInteractionData then
		for i, v in pairs(self.recentUsersInteractionData) do
			local var102 = if stringKeyFixForParticipantsTable then self.participants[tostring(i)] else self.participants[i]
			
			if getFIntVoiceUsersInteractionExpiryTimeSecondsModule() <= timestamp - v.lastHeardTime and (not var102 or var102.isMuted) or getFFlagClearUserFromRecentVoiceDataOnLeaveModule() and not playersService:GetPlayerByUserId(tonumber(i)) then
				t[i] = cryoModule.None
			end
		end
		self.recentUsersInteractionData = cryoModule.Dictionary.join(self.recentUsersInteractionData, t)
	end
end

function t_1:SetupParticipantListeners() --[[ line: 1658 ]]
	-- upvalues: name (ref), getFFlagClearUserFromRecentVoiceDataOnLeaveModule (ref), stringKeyFixForParticipantsTable (ref), getFFlagFixGetPlayerByUserIdStringCastModule (ref), playersService (ref), voiceChatService (ref), fFlagEnablePartyVoiceChangersInLua (ref), getFFlagBatchVoiceParticipantsUpdatesModule (ref), var57 (ref), getFFlagVoiceChatClientRewriteMasterLua (ref), stopModerationConnectionOnLeave (ref), var48 (ref), disableRejoinGroupIdDoubleRead (ref), voiceVolumeControlsEnableVoiceVolumeEligibilityTelemetry (ref), getFFlagDisconnectToastClientRewrite (ref), var52 (ref), voiceVolumeControlsApplyGameSettingsVoiceVolumeEngineFeature (ref), getFFlagEnableVoiceSignal (ref), VOICE_JOIN_PROGRESS (ref), voiceVolumeControlsEligibilityModule (ref), getFFlagCoreMicManagerRefactorModule (ref), var46 (ref), MIN_VOICE_CHAT_API_VERSION_LOCAL_MIC_ACTIVITY (ref), getFFlagLocalMutedNilFix (ref), var29 (ref), getFFlagLuaConsumePlayerModeratedModule (ref), getFFlagEnableVoiceReverseNudgeModule (ref), utilsModule (ref), t (ref)
	self:ensureInitialized("setup participant listeners")
	
	if not self.participants then
		self.participants = {}
		self.recentUsersInteractionData = {}
		self.updatedParticipants = {}
		self.participantConnection = self.service.ParticipantsStateChanged:Connect(function(p82, p83, p84) --[[ line: 1667 ]]
			-- upvalues: name (copy), getFFlagClearUserFromRecentVoiceDataOnLeaveModule (copy), self (ref), stringKeyFixForParticipantsTable (copy), getFFlagFixGetPlayerByUserIdStringCastModule (copy), playersService (copy), voiceChatService (copy), fFlagEnablePartyVoiceChangersInLua (copy), getFFlagBatchVoiceParticipantsUpdatesModule (copy), var57 (copy)
			name:trace("Participants state changed")
			
			for i, v in ipairs(p82) do
				if not getFFlagClearUserFromRecentVoiceDataOnLeaveModule() and not self.participants[tostring(v)].isMuted then
					self:_setRecentUserState(v, { lastHeardTime = os.time() })
				end
				self.participants[tostring(v)] = nil
				self.participantLeft:Fire(self.participants, v)
				self:emit("OnVoiceParticipantRemoved", v)
			end
			for i, v_1 in ipairs(p83) do
				self.participantJoined:Fire(self.participants, v_1)
				self:emit("OnVoiceParticipantAdded", v_1)
			end
			for i, v_2 in pairs(p84) do
				local userId = v_2.userId
				local var106 = if stringKeyFixForParticipantsTable then self.participants[tostring(userId)] else self.participants[userId]
				
				if not v_2.isMuted or var106 and not var106.isMuted then
					self:_setRecentUserState(userId, {
						lastHeardTime = os.time(),
						player = if getFFlagFixGetPlayerByUserIdStringCastModule() then playersService:GetPlayerByUserId(tonumber(userId)) else playersService:GetPlayerByUserId(userId)
					})
				end
				if not var106 or var106.isMuted ~= v_2.isMuted then
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
				if var57 and self.CaptureService:IsCapturingVideo() then
					self.voiceCapturedDuringVideoCapture = self.voiceCapturedDuringVideoCapture or v_2.isSignalActive
				end
			end
			self:_updateRecentUsersInteractionData()
			
			if self.shouldThrottleParticipantUpdate then
				local currentTime = tick()
				
				if self.participantsStateThrottleTime <= currentTime - self.lastParticipantsStateUpdate and #p84 > 0 then
					self.lastParticipantsStateUpdate = currentTime
					self.participantsUpdate:Fire(if getFFlagBatchVoiceParticipantsUpdatesModule() then self.updatedParticipants else self.participants)
					self.updatedParticipants = {}
					
					return
				elseif #p84 > 0 then
					local var105 = self.participantsStateThrottleTime - (currentTime - self.lastParticipantsStateUpdate)
					self.lastStateUpdateCounter = (self.lastStateUpdateCounter + 1) % 100
					local lastStateUpdateCounter = self.lastStateUpdateCounter
					task.wait(var105)
					
					if lastStateUpdateCounter == self.lastStateUpdateCounter then
						self.participantsUpdate:Fire(if getFFlagBatchVoiceParticipantsUpdatesModule() then self.updatedParticipants else self.participants)
						self.updatedParticipants = {}
						
						return
					end
				end
			elseif #p84 > 0 then
				self.participantsUpdate:Fire(if getFFlagBatchVoiceParticipantsUpdatesModule() then self.updatedParticipants else self.participants)
				self.updatedParticipants = {}
			end
		end)
		
		local function onStateChanged(p85, p86) --[[ line: 1785 ]]
			-- upvalues: self (ref), getFFlagVoiceChatClientRewriteMasterLua (copy), name (copy), stopModerationConnectionOnLeave (copy), var48 (copy), disableRejoinGroupIdDoubleRead (copy), voiceVolumeControlsEnableVoiceVolumeEligibilityTelemetry (copy), getFFlagDisconnectToastClientRewrite (copy), var52 (copy), voiceVolumeControlsApplyGameSettingsVoiceVolumeEngineFeature (copy), getFFlagEnableVoiceSignal (copy), VOICE_JOIN_PROGRESS (copy), voiceVolumeControlsEligibilityModule (copy), voiceChatService (copy)
			self:emit("OnStateChanged", p85, p86)
			local var107 = p86 == Enum.VoiceChatState.Failed
			local var108 = p86 == Enum.VoiceChatState.Joining
			local var109 = p86 == Enum.VoiceChatState.Leaving
			local var110 = p86 == Enum.VoiceChatState.Ended
			local var111 = self.service:IsPublishPaused()
			
			if var111 ~= self.localMuted and not var107 and (not var108 and not var109) and not var110 then
				self.localMuted = var111
				self.muteChanged:Fire(var111)
			elseif var108 or var109 or var110 then
				self.localMuted = nil
			end
			if getFFlagVoiceChatClientRewriteMasterLua() and p86 == Enum.VoiceChatState.Joined and (self.isInCall and var111 ~= self.callMutedState) then
				name:debug("In call, setting local muted to call muted state {}", self.callMutedState)
				self:ToggleMic("InitInCall")
			end
			if stopModerationConnectionOnLeave and p86 == Enum.VoiceChatState.Joined then
				self:StartModerationSignal()
			end
			if var48 and p86 == Enum.VoiceChatState.Joined then
				self:_syncLocalAudioDeviceActive()
			end
			if p86 == Enum.VoiceChatState.Leaving then
				if not disableRejoinGroupIdDoubleRead or not self.previousGroupId then
					self.previousGroupId = self.service:GetGroupId()
				end
				self.previousMutedState = self.service:IsPublishPaused()
			end
			if p86 == Enum.VoiceChatState.Ended or var107 then
				self.participants = {}
				self.localMuted = nil
				
				if voiceVolumeControlsEnableVoiceVolumeEligibilityTelemetry then
					self._voiceVolumeEligibilityReported = false
				end
				self.participantsUpdate:Fire(self.participants)
				
				if stopModerationConnectionOnLeave then
					self:StopModerationSignal()
				end
				if var48 then
					self:_syncLocalAudioDeviceActive()
				end
				if var107 then
					name:debug("State Changed to Failed. Reason: {}", self.service:GetAndClearCallFailureMessage())
				end
				if p85 == Enum.VoiceChatState.Joining or p85 == Enum.VoiceChatState.JoiningRetry or p85 == Enum.VoiceChatState.Joined then
					if p86 == Enum.VoiceChatState.Ended then
						name:debug("State Changed to Ended from {}", p85)
					end
					if not getFFlagDisconnectToastClientRewrite() or not self:IsSeamlessVoice() or self:GetVoiceConnectCookieValue() then
						self:emit("OnRetryRequested")
					end
				end
				if var52 and voiceVolumeControlsApplyGameSettingsVoiceVolumeEngineFeature then
					self:ReportVoiceVolumeImpressionsIfNeeded()
				end
			end
			if getFFlagEnableVoiceSignal() and self.VoiceJoinProgress == VOICE_JOIN_PROGRESS.Joining and p86 == Enum.VoiceChatState.Joined then
				self:ChangeVoiceJoinProgress(VOICE_JOIN_PROGRESS.Joined)
				self:emit("OnVoiceJoin")
			end
			if var52 and voiceVolumeControlsApplyGameSettingsVoiceVolumeEngineFeature and p86 == Enum.VoiceChatState.Joined then
				self._voiceJoinTimestampMs = DateTime.now().UnixTimestampMillis
				self._voiceVolumeSliderEligibleAtJoin = voiceVolumeControlsEligibilityModule.isVoiceChatVolumeSliderVisible(true, voiceChatService.UseNewAudioApi)
			end
			if voiceVolumeControlsEnableVoiceVolumeEligibilityTelemetry and voiceVolumeControlsApplyGameSettingsVoiceVolumeEngineFeature and (p86 == Enum.VoiceChatState.Joined and not self._voiceVolumeEligibilityReported) then
				local ok, status = pcall(function() --[[ line: 1896 ]]
					return UserSettings():GetService("UserGameSettings").VoiceChatVolume
				end)
				local useNewAudioApi = voiceChatService.UseNewAudioApi
				local voiceAnalyticsData = self:GetVoiceAnalyticsData()
				self.Analytics:reportVoiceVolumeEligibility({
					playSessionId = voiceAnalyticsData.playSessionId,
					voiceSessionId = voiceAnalyticsData.voiceSessionId,
					voiceChatVolume = if ok then status else nil,
					usesNewAudioApi = useNewAudioApi,
					enablesVoiceVolumeControls = voiceVolumeControlsEligibilityModule.isCreatorVoiceVolumeControlsEnabled(),
					isEligible = voiceVolumeControlsEligibilityModule.isVoiceChatVolumeSliderVisible(true, useNewAudioApi)
				})
				self._voiceVolumeEligibilityReported = true
			end
		end
		
		if self.service.VoiceChatState and self.service.VoiceChatState == Enum.VoiceChatState.Joined then
			name:debug("Joined voice chat {}", self.service.VoiceChatState)
			onStateChanged(nil, Enum.VoiceChatState.Joined)
		end
		self.stateConnection = self.service.StateChanged:Connect(onStateChanged)
		
		if getFFlagCoreMicManagerRefactorModule() then
			self.micManager:SetupMicActivityListener(self.service)
		elseif var46 and voiceChatService.UseNewAudioApi then
			if not self.localMeteringTask then
				self.localMeteringTask = task.spawn(function() --[[ line: 1925 ]]
					-- upvalues: self (ref)
					while true do
						self:UpdateLocalMetering()
						task.wait()
					end
				end)
			end
		elseif MIN_VOICE_CHAT_API_VERSION_LOCAL_MIC_ACTIVITY <= self.service:GetVoiceChatApiVersion() then
			self.micConnection = self.service.PlayerMicActivitySignalChange:Connect(function(p87) --[[ line: 1934 ]]
				-- upvalues: var57 (copy), self (ref), getFFlagLocalMutedNilFix (copy), var29 (copy)
				if var57 and self.CaptureService:IsCapturingVideo() then
					self.voiceCapturedDuringVideoCapture = self.voiceCapturedDuringVideoCapture or p87.isActive
				end
				self.isTalking = p87.isActive
				
				if getFFlagLocalMutedNilFix() then
					if self.localMuted ~= false then return end
					if var29 then
						self:FireTalkingChangedDebounced(self.isTalking)
						
						return
					end
					self.talkingChanged:Fire(self.isTalking)
					
					return
				elseif not self.localMuted then
					if var29 then
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
			self.playerModeratedConnection = self.service.LocalPlayerModerated:connect(function() --[[ line: 1968 ]]
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
		self.voiceToxicityModalConnection = self:GetSignalREvent("VoiceToxicityModal"):Connect(function(p88) --[[ line: 1981 ]]
			-- upvalues: self (ref)
			self.Analytics:reportReceivedNudge(p88, self:GetNudgeAnalyticsData())
			self:emit("OnVoiceToxicityModal")
		end)
		self.VoiceToxicityToastConnection = self:GetSignalREvent("VoiceToxicityToast"):Connect(function(p89) --[[ line: 1987 ]]
			-- upvalues: self (ref)
			self.Analytics:reportReceivedNudge(p89, self:GetNudgeAnalyticsData())
			self:emit("OnVoiceToxicityToast")
		end)
		
		if getFFlagEnableVoiceReverseNudgeModule() then
			name:trace("Setting up voice reverse nudge handlers")
			self.voiceReverseNudgeConnection = self:GetSignalREvent("VoiceReverseNudgeIconColorChange"):Connect(function(p90) --[[ line: 1994 ]]
				-- upvalues: self (ref)
				self:emit("OnVoiceReverseNudgeIconColorChange", p90)
			end)
		end
		self.blockConnection = self.BlockStatusChanged:Connect(function(p91, p92) --[[ line: 1999 ]]
			-- upvalues: self (ref), name (copy), utilsModule (copy)
			if p92 then
				if self.participants[tostring(p91)] then
					name:debug("Blocking {}", utilsModule.shorten(p91))
					self.service:SubscribeBlock(p91)
					
					return
				end
			else
				name:debug("UnBlocking {}", utilsModule.shorten(p91))
				self.service:SubscribeUnblock(p91)
			end
		end)
		
		if voiceChatService.UseNewAudioApi then
			self:hookupAudioDeviceInputListener()
		end
		if self.service.TempSetMicMutedToggleMic then
			self.tempSetMicMutedToggleMicConnection = self.service.TempSetMicMutedToggleMic:connect(function() --[[ line: 2017 ]]
				-- upvalues: self (ref)
				self:ToggleMic("TempSetMicMutedToggleMic")
			end)
		end
		if var57 then
			self.videoCaptureInProgressConnection = self.CaptureService.VideoCaptureInProgress:connect(function(p93) --[[ line: 2024 ]]
				-- upvalues: self (ref), t (copy)
				if p93 then
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

local var66 = nil

function t_1.CheckAudioInputExists(p94) --[[ line: 2039 ]]
	-- upvalues: name (ref), var66 (write), promiseModule (ref), cryoModule (ref)
	name:trace("Checking for AudioDeviceInput")
	
	if not var66 then
		var66 = promiseModule.new(function(p95, _) --[[ line: 2042 ]]
			-- upvalues: cryoModule (copy), p94 (ref), name (copy)
			if #cryoModule.Dictionary.keys(p94.audioDevices) > 0 then
				name:trace("Found existing AudioDeviceInput")
				p95()
				
				return
			end
			p94.audioDeviceInputAdded.Event:Connect(function() --[[ line: 2047 ]]
				-- upvalues: name (copy), p95 (ref)
				name:trace("Found new AudioDeviceInput")
				p95()
			end)
		end)
	end
	return var66
end

function t_1:checkAndUpdateSequence(p96, p97) --[[ line: 2057 ]]
	if not p97 then
		return 0
	elseif not self.SequenceNumbers[p96] then
		self.SequenceNumbers[p96] = p97
		
		return 0
	end
	local var113 = p97 - self.SequenceNumbers[p96]
	
	if var113 > 0 then
		self.SequenceNumbers[p96] = p97
	end
	return var113 - 1
end

local function _(value) --[[ line: 2084 | named "isIgnoredAudioInput" ]]
	-- upvalues: coreGuiService (ref)
	return value:IsDescendantOf(coreGuiService)
end

function t_1:onInstanceAdded(p98) --[[ line: 2088 ]]
	-- upvalues: fFlagExpChatDictation (ref), coreGuiService (ref), name (ref)
	if p98:IsA("AudioDeviceInput") then
		if fFlagExpChatDictation and p98:IsDescendantOf(coreGuiService) then return end
		name:debug("Found new audio device instance for {}", p98.Player and p98.Player.Name)
		self.audioDevices[p98] = self:CreateAudioDeviceData(p98)
		self:emit("OnAudioDeviceInputAdded")
		self:StartAnalysis(p98)
	end
end

function t_1:GetSendMuteEvent() --[[ line: 2101 ]]
	-- upvalues: robloxReplicatedStorageService (ref)
	if not self.SendMuteEvent then
		self.SendMuteEvent = robloxReplicatedStorageService:WaitForChild("SetUserActive", 10)
	end
	return self.SendMuteEvent
end

function t_1:GetToggleVoiceChangerEvent() --[[ line: 2108 ]]
	-- upvalues: replicatedStorageService (ref)
	if not self.SendVoiceChangerEvent then
		self.SendVoiceChangerEvent = replicatedStorageService:WaitForChild("ToggleUserVoiceChanger", 10)
	end
	return self.SendVoiceChangerEvent
end

function t_1:GetInputToModifierWire() --[[ line: 2115 ]]
	-- upvalues: playersService (ref)
	if not self.InputToModifierWire then
		self.InputToModifierWire = playersService.LocalPlayer:FindFirstChild("InputToModifier")
	end
	return self.InputToModifierWire
end

function t_1:GetPartyVoiceDeviceInput() --[[ line: 2122 ]]
	-- upvalues: playersService (ref)
	if not self.PartyVoiceDeviceInput then
		self.PartyVoiceDeviceInput = playersService.LocalPlayer:FindFirstChild("PartyVoiceDeviceInput")
	end
	return self.PartyVoiceDeviceInput
end

function t_1:GetSetVoicePackEvent() --[[ line: 2130 ]]
	-- upvalues: replicatedStorageService (ref)
	if not self.SetVoicePackEvent then
		self.SetVoicePackEvent = replicatedStorageService:WaitForChild("SetVoicePack", 10)
	end
	return self.SetVoicePackEvent
end

function t_1:GetVoiceChangerWasToggledEvent() --[[ line: 2137 ]]
	-- upvalues: replicatedStorageService (ref)
	if not self.VoiceChangerWasToggledEvent then
		self.VoiceChangerWasToggledEvent = replicatedStorageService:WaitForChild("VoiceChangerWasToggled", 3)
	end
	return self.VoiceChangerWasToggledEvent
end

local _ = function(p99, p100) --[[ line: 2145 | named "WireUp" ]]
	local wire = Instance.new("Wire")
	wire.SourceInstance = p99
	wire.TargetInstance = p100
	wire.Parent = p100
	
	return wire
end

local _ = function() --[[ line: 2154 | named "GetAnalysisHost" ]]
	-- upvalues: robloxReplicatedStorageService (ref)
	return robloxReplicatedStorageService
end

function t_1.GetAnalyzer(_, p101) --[[ line: 2158 ]]
	-- upvalues: robloxReplicatedStorageService (ref)
	local text = p101.Name .. "_Analyzer"
	local var116 = robloxReplicatedStorageService:FindFirstChild(text)
	
	if not var116 then
		var116 = Instance.new("AudioAnalyzer")
		var116.SpectrumEnabled = false
		var116.Name = text
		var116.Parent = robloxReplicatedStorageService
	end
	return var116
end

local _ = function(p102) --[[ line: 2171 | named "toDecibels" ]]
	return math.log10(p102) * 20
end

function t_1:IsSignalActive(p103) --[[ line: 2175 ]]
	-- upvalues: var46 (ref), playersService (ref)
	if not var46 then
		return false
	end
	local var117 = playersService:GetPlayerByUserId(p103)
	
	return if var117 then math.log10(self:GetAnalyzer(var117).PeakLevel) * 20 > -36 else false
end

function t_1.StopAnalysis(_, p104) --[[ line: 2189 ]]
	-- upvalues: var46 (ref), robloxReplicatedStorageService (ref)
	if not var46 then return end
	for i, v in p104:GetConnectedWires("Output") do
		local targetInstance = v.TargetInstance
		
		if targetInstance and targetInstance:IsDescendantOf(robloxReplicatedStorageService) then
			v:Destroy()
		end
	end
end

function t_1:StartAnalysis(p105) --[[ line: 2205 ]]
	-- upvalues: var46 (ref)
	if not var46 then return end
	self:StopAnalysis(p105)
	local player = p105.Player
	
	if player then
		local var118 = self:GetAnalyzer(player)
		local wire = Instance.new("Wire")
		wire.SourceInstance = p105
		wire.TargetInstance = var118
		wire.Parent = var118
		
		return
	end
end

function t_1.GetVoiceConnectCookie(p106) --[[ line: 2219 ]]
	-- upvalues: constantsModule (ref)
	local ok, status = pcall(function() --[[ line: 2220 ]]
		-- upvalues: p106 (ref), constantsModule (copy)
		return p106.AppStorageService:GetItem(constantsModule.VOICE_CONNECT_DISCONNECT_KEY_V3)
	end)
	
	return if ok and status then status else ""
end

function t_1.GetVoiceConnectCookieValue(p107) --[[ line: 2231 ]]
	-- upvalues: getFFlagEnableVoiceUxUpdates (ref), constantsModule (ref)
	if getFFlagEnableVoiceUxUpdates() then
		local ok, status = pcall(function() --[[ line: 2233 ]]
			-- upvalues: p107 (ref), constantsModule (copy)
			return p107.AppStorageService:GetItem(constantsModule.VOICE_CONNECT_DISCONNECT_KEY_V3)
		end)
		
		return if ok then status == "true" else true
	end
	local ok, status = pcall(function() --[[ line: 2239 ]]
		-- upvalues: p107 (ref), constantsModule (copy)
		return p107.AppStorageService:GetItem(constantsModule.VOICE_CONNECT_DISCONNECT_KEY_V2)
	end)
	
	return if ok then status == "true" else true
end

function t_1.SetVoiceConnectCookieValue(value, p108) --[[ line: 2247 ]]
	-- upvalues: getFFlagEnableVoiceUxUpdates (ref), constantsModule (ref)
	return if getFFlagEnableVoiceUxUpdates() then pcall(function() --[[ line: 2249 ]]
		-- upvalues: value (ref), constantsModule (copy), p108 (ref)
		value.AppStorageService:SetItem(constantsModule.VOICE_CONNECT_DISCONNECT_KEY_V3, tostring(p108))
		value.AppStorageService:Flush()
	end) else pcall(function() --[[ line: 2255 ]]
		-- upvalues: value (ref), constantsModule (copy), p108 (ref)
		value.AppStorageService:SetItem(constantsModule.VOICE_CONNECT_DISCONNECT_KEY_V2, tostring(p108))
		value.AppStorageService:Flush()
	end)
end

function t_1.GetVoiceRewarmCookie(p109) --[[ line: 2263 ]]
	-- upvalues: constantsModule (ref), name (ref)
	local ok, status = pcall(function() --[[ line: 2264 ]]
		-- upvalues: p109 (ref), constantsModule (copy)
		return p109.AppStorageService:GetItem(constantsModule.VOICE_REWARM_KEY)
	end)
	
	if ok and status then
		name:debug("Got voice re-warm cookie: {}", status)
		
		return status
	end
	name:debug("Voice re-warm cookie not set, returning empty string")
	
	return ""
end

function t_1.SetVoiceRewarmCookie(value, p110) --[[ line: 2277 ]]
	-- upvalues: name (ref), constantsModule (ref)
	name:debug("Setting voice re-warm cookie to {}", p110)
	pcall(function() --[[ line: 2279 ]]
		-- upvalues: value (ref), constantsModule (copy), p110 (ref)
		value.AppStorageService:SetItem(constantsModule.VOICE_REWARM_KEY, tostring(p110))
		value.AppStorageService:Flush()
	end)
end

function t_1:ShouldRewarmUser() --[[ line: 2285 ]]
	return self:GetVoiceRewarmCookie() == ""
end

function t_1:RewarmUser() --[[ line: 2289 ]]
	self:SetVoiceRewarmCookie("true")
end

function t_1.SetNewUserFTUXCookieValue(value, p111) --[[ line: 2293 ]]
	-- upvalues: constantsModule (ref)
	return pcall(function() --[[ line: 2294 ]]
		-- upvalues: value (ref), constantsModule (copy), p111 (ref)
		value.AppStorageService:SetItem(constantsModule.SEAMLESS_VOICE_FTUX_KEY, tostring(p111))
		value.AppStorageService:Flush()
	end)
end

function t_1:SetAndSyncActive(p112, p113) --[[ line: 2301 ]]
	-- upvalues: getFFlagCoreMicManagerRefactorModule (ref), playersService (ref)
	if getFFlagCoreMicManagerRefactorModule() then
		return self.micManager:SetAndSyncActive(p112, p113)
	end
	p112.Active = p113
	local sendMuteEvent = self:GetSendMuteEvent()
	
	if sendMuteEvent and p112.Player == playersService.LocalPlayer then
		sendMuteEvent:FireServer(p113)
	end
end

function t_1:CreateAudioDeviceData(p114) --[[ line: 2314 ]]
	-- upvalues: playersService (ref), enableMutedByLocalUserEngineFeature (ref), name (ref), var23 (ref), fFlagDebugShowAudioDeviceInputDebugger (ref), var48 (ref), voiceChatService (ref)
	local t = {}
	local var122 = p114.Player == playersService.LocalPlayer
	
	if enableMutedByLocalUserEngineFeature then
		if not p114.MutedByLocalUser then
			if self.muteAll and not var122 then
				p114.MutedByLocalUser = true
			end
			if p114.Player and self.mutedPlayers[p114.Player.UserId] then
				p114.MutedByLocalUser = true
			end
		end
	elseif p114.Active then
		if self.muteAll and not var122 then
			p114.Active = false
		end
		if p114.Player and self.mutedPlayers[p114.Player.UserId] then
			p114.Active = false
		end
	end
	if p114.Active and var122 and self.localMuted == nil then
		self:SetAndSyncActive(p114, false)
	end
	if var122 and self.localMuted ~= nil and (self.localMuted ~= not p114.Active and not self.isInCall) then
		name:debug("Mismatch between LocalMuted and device.Active")
		local var125 = not self.localMuted
		p114.Active = var125
		local sendMuteEvent = self:GetSendMuteEvent()
		
		if sendMuteEvent then
			sendMuteEvent:FireServer(var125)
		end
	elseif self.isInCall and var122 then
		local var123 = not self.callMutedState
		name:debug("Overwriting Active State to match Iris call. .Active = {}", var123)
		p114.Active = var123
		local sendMuteEvent = self:GetSendMuteEvent()
		
		if sendMuteEvent then
			sendMuteEvent:FireServer(var123)
		end
	end
	t.onPlayerChanged = p114:GetPropertyChangedSignal("Player"):Connect(function() --[[ line: 2364 ]]
		-- upvalues: var23 (copy), var122 (write), p114 (ref), playersService (copy), self (ref), name (copy), enableMutedByLocalUserEngineFeature (copy)
		if var23 then
			var122 = p114.Player == playersService.LocalPlayer
			
			if var122 then
				if p114.Active and self.localMuted == nil then
					name:debug("Player is still in connecting state, setting Active to false")
					self:SetAndSyncActive(p114, false)
				elseif self.localMuted ~= nil and self.localMuted ~= not p114.Active then
					name:debug("Mismatch between LocalMuted and device.Active")
					self:SetAndSyncActive(p114, not self.localMuted)
				end
			elseif self.muteAll or p114.Player and self.mutedPlayers[p114.Player.UserId] then
				if enableMutedByLocalUserEngineFeature then
					p114.MutedByLocalUser = true
				else
					p114.Active = false
				end
			end
		end
		self:emit("OnDevicePlayerChanged")
		self:StartAnalysis(p114)
	end)
	t.onMutedChanged = p114:GetPropertyChangedSignal("Muted"):Connect(function() --[[ line: 2390 ]]
		-- upvalues: self (ref)
		self:emit("OnDeviceMuteChanged")
	end)
	
	if not enableMutedByLocalUserEngineFeature then
		t.onActiveChanged = p114:GetPropertyChangedSignal("Active"):Connect(function() --[[ line: 2395 ]]
			-- upvalues: self (ref), var122 (write), p114 (ref)
			self:emit("OnDeviceActiveChanged")
			
			if self.muteAll and not var122 then
				p114.Active = false
			end
			if p114.Player and self.mutedPlayers[p114.Player.UserId] then
				p114.Active = false
			end
		end)
	elseif fFlagDebugShowAudioDeviceInputDebugger then
		t.onActiveChanged = p114:GetPropertyChangedSignal("Active"):Connect(function() --[[ line: 2406 ]]
			-- upvalues: self (ref)
			self:emit("OnDeviceActiveChanged")
		end)
		t.onMutedByLocalUserChanged = p114:GetPropertyChangedSignal("MutedByLocalUser"):Connect(function() --[[ line: 2409 ]]
			-- upvalues: self (ref)
			self:emit("OnDeviceMutedByLocalUserChanged")
		end)
	end
	if var48 and voiceChatService.UseNewAudioApi then
		t.onActiveChangedDisconnectGuard = p114:GetPropertyChangedSignal("Active"):Connect(function() --[[ line: 2415 ]]
			-- upvalues: p114 (ref), playersService (copy), self (ref)
			if p114.Active and p114.Player == playersService.LocalPlayer and self.localMuted == nil then
				self:SetAndSyncActive(p114, false)
			end
		end)
	end
	return t
end

function t_1:onInstanceRemove(p115) --[[ line: 2425 ]]
	-- upvalues: fFlagExpChatDictation (ref), coreGuiService (ref), name (ref), enableMutedByLocalUserEngineFeature (ref), fFlagDebugShowAudioDeviceInputDebugger (ref), var46 (ref)
	if p115:IsA("AudioDeviceInput") then
		if fFlagExpChatDictation and p115:IsDescendantOf(coreGuiService) then return end
		self:StopAnalysis(p115)
		name:trace("Removing AudioDeviceInput {} {} {}", p115, "for user", p115.Player and p115.Player.UserId)
		local var127 = self.audioDevices[p115]
		
		if var127 then
			if not enableMutedByLocalUserEngineFeature then
				var127.onActiveChanged:Disconnect()
			elseif fFlagDebugShowAudioDeviceInputDebugger then
				if var127.onActiveChanged then
					var127.onActiveChanged:Disconnect()
				end
				if var127.onMutedByLocalUserChanged then
					var127.onMutedByLocalUserChanged:Disconnect()
				end
			end
			var127.onMutedChanged:Disconnect()
			var127.onPlayerChanged:Disconnect()
			
			if var127.onActiveChangedDisconnectGuard then
				var127.onActiveChangedDisconnectGuard:Disconnect()
			end
		end
		self.audioDevices[p115] = nil
		self:emit("OnAudioDeviceInputRemoved")
		
		if var46 and p115.Player then
			self:GetAnalyzer(p115.Player):Destroy()
		end
	end
end

function t_1:hookupAudioDeviceInputListener() --[[ line: 2459 ]]
	-- upvalues: name (ref), playersService (ref), soundService (ref), voiceChatService (ref), collectionService (ref), utilsModule (ref)
	name:debug("Hooking up audio device listeners")
	local localPlayer = playersService.LocalPlayer
	soundService.AudioInstanceAdded:Connect(function(p116) --[[ line: 2462 ]]
		-- upvalues: self (ref)
		self:onInstanceAdded(p116)
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
	game.DescendantRemoving:Connect(function(p117) --[[ line: 2497 ]]
		-- upvalues: self (ref)
		self:onInstanceRemove(p117)
	end)
	
	for i, v in game:GetDescendants() do
		self:onInstanceAdded(v)
	end
	playersService.PlayerRemoving:Connect(function(p118) --[[ line: 2506 ]]
		-- upvalues: self (ref)
		for i in self.audioDevices do
			if i.Player and i.Player == p118 then
				self:onInstanceRemove(i)
			end
		end
	end)
end

function t_1.RejoinCurrentChannel(p119) --[[ line: 2516 ]]
	-- upvalues: name (ref)
	pcall(function() --[[ line: 2517 ]]
		-- upvalues: p119 (ref), name (copy)
		local groupId = p119.service:GetGroupId()
		
		if groupId and groupId ~= "" then
			local var133 = p119.service:IsPublishPaused()
			p119.service:Leave()
			name:debug("Rejoining current channel {}", groupId)
			p119.participants = {}
			p119.participantsUpdate:Fire(p119.participants)
			
			if not p119.service:JoinByGroupIdToken(groupId, var133, true) then
				p119:emit("OnInitialJoinFailed")
			end
		end
	end)
end

function t_1.RejoinChannel(p120, p121, p122) --[[ line: 2533 ]]
	-- upvalues: name (ref)
	name:debug("Rejoining previous channel {} with mute status {}", p121, p122)
	
	if p121 and p121 ~= "" then
		pcall(function() --[[ line: 2537 ]]
			-- upvalues: p120 (ref), p121 (ref), p122 (ref)
			p120.service:Leave()
			p120.participants = {}
			p120.participantsUpdate:Fire(p120.participants)
			
			if not p120.service:JoinByGroupIdToken(p121, p122, true) then
				p120:emit("OnInitialJoinFailed")
			end
		end)
	end
end

function t_1:RejoinVoice() --[[ line: 2549 ]]
	-- upvalues: getFFlagVoiceChatClientRewriteMasterLua (ref), name (ref), voiceChatService (ref)
	if getFFlagVoiceChatClientRewriteMasterLua() then
		name:debug("Rejoining voice")
		self.participants = {}
		self.participantsUpdate:Fire(self.participants)
		voiceChatService:rejoinVoice()
	end
end

function t_1:watchSignalR() --[[ line: 2560 ]]
	-- upvalues: WATCHED_NAMESPACES (ref), utilsModule (ref), name (ref)
	self.signalRConnection = self.NotificationService.RobloxEventReceived:Connect(function(p123) --[[ line: 2561 ]]
		-- upvalues: WATCHED_NAMESPACES (copy), utilsModule (copy), self (ref), name (copy)
		local namespace = p123.namespace
		
		if not WATCHED_NAMESPACES[namespace] then return end
		local var134 = utilsModule.jsonDecode(p123.detail)
		local type = self.SignalREventTable[var134.type]
		
		if type then
			type:Fire(var134)
		end
		local sequenceNumber = var134.SequenceNumber
		name:trace("SignalR message {}: {}", namespace, sequenceNumber)
		local var135 = self:checkAndUpdateSequence(namespace, sequenceNumber)
		
		if var135 > 0 then
			self.Analytics:reportReconnectDueToMissedSequence()
			
			return
		elseif var135 < -1 then
			self.Analytics:reportOutOfOrderSequence()
		end
	end)
	self.signalRConnectionChanged = self.NotificationService.RobloxConnectionChanged:Connect(function(p124, p125, _, p126) --[[ line: 2585 ]]
		-- upvalues: name (copy), utilsModule (copy), WATCHED_NAMESPACES (copy), self (ref)
		if p124 == "signalR" then
			if p125 ~= Enum.ConnectionState.Connected then
				name:info("SignalR disconnected")
				
				return
			end
			for i, v in pairs(utilsModule.jsonDecode(p126)) do
				if WATCHED_NAMESPACES[i] then
					name:trace("SignalR message {}: {}", i, v)
					local var136 = self:checkAndUpdateSequence(i, v)
					
					if var136 > 0 then
						self.Analytics:reportReconnectDueToMissedSequence()
					elseif var136 < -1 then
						self.Analytics:reportOutOfOrderSequence()
					end
				end
			end
		end
	end)
end

function t_1:StopSignalRConnection() --[[ line: 2610 ]]
	if self.signalRConnectionChanged then
		self.signalRConnectionChanged:Disconnect()
		self.signalRConnectionChanged = nil
	end
	if self.signalRConnection then
		self.signalRConnection:Disconnect()
		self.signalRConnection = nil
	end
end

function t_1:getService() --[[ line: 2621 ]]
	return self.service
end

function t_1:ToggleMic(p127) --[[ line: 2625 ]]
	-- upvalues: getFFlagCoreMicManagerRefactorModule (ref), name (ref), getFFlagJoinWithoutMicPermissions (ref), PERMISSION_STATE (ref), permissionsProtocol (ref), voiceChatService (ref), playersService (ref)
	self:ensureInitialized("toggle mic")
	
	if getFFlagCoreMicManagerRefactorModule() then
		return self.micManager:SetMicActive(not self.micManager.localMuted, p127)
	elseif self.localMuted == nil then
		name:trace("ToggleMic context: {} - Voice not connected yet", p127)
		
		return
	end
	name:trace("ToggleMic context: {}", p127)
	
	if getFFlagJoinWithoutMicPermissions() then
		if self.permissionState == PERMISSION_STATE.PENDING_MIC then
			name:debug("In pending mic mode, requesting permission")
			self:emit("GetPermissions", function(p128) --[[ line: 2641 ]]
				-- upvalues: self (ref), PERMISSION_STATE (copy), name (copy), p127 (ref)
				self.permissionState = if p128.hasMicPermissions then PERMISSION_STATE.LISTEN_AND_TALK else PERMISSION_STATE.LISTEN_ONLY
				name:debug("Got permissions, setting state to {}", self.permissionState)
				self:ToggleMic(p127)
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
			local var137 = not self.localMuted
			name:trace("Setting self mute to {} context: {}", var137, p127)
			local sendMuteEvent = self:GetSendMuteEvent()
			
			if sendMuteEvent then
				sendMuteEvent:FireServer(var137)
				
				for i in self.audioDevices do
					if i.Player and i.Player == playersService.LocalPlayer then
						i.Active = var137
					end
				end
				self.muteChanged:Fire(self.localMuted)
			else
				name:error("Could not find SendMuteEvent")
			end
		else
			local var139 = not self.service:IsPublishPaused()
			name:trace("Setting self mute to {} context: {}", var139, p127)
			self.service:PublishPause(var139)
			self.localMuted = var139
			self.muteChanged:Fire(var139)
		end
		if not self.localMuted then
			self.talkingChanged:Fire(self.isTalking)
			self:emit("OnShowDataConsentToast")
		end
		if p127 then
			self.Analytics:reportVoiceMuteSelf(self:JoinWithVoiceMuteData({ context = p127, muted = self.localMuted }))
		end
	end
end

function t_1:ToggleVoiceChanger(_) --[[ line: 2703 ]]
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

function t_1:ToggleVoiceChangerHearMyself(_) --[[ line: 2733 ]]
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

function t_1:SetVoicePack(p129) --[[ line: 2758 ]]
	-- upvalues: voiceChatService (ref), name (ref)
	self:ensureInitialized("set voice pack")
	
	if self.localMuted == nil then return end
	if voiceChatService.UseNewAudioApi then
		self.currentVoicePack = p129
		name:trace("setting current voice pack to {}", self.currentVoicePack)
		local setVoicePackEvent = self:GetSetVoicePackEvent()
		
		if setVoicePackEvent then
			setVoicePackEvent:FireServer("VoicePack_" .. self.currentVoicePack)
			
			return
		end
		name:error("Could not find SetVoicePackEvent")
	end
end

function t_1:JoinWithVoiceMuteData(p130) --[[ line: 2777 ]]
	-- upvalues: playersService (ref), cryoModule (ref)
	return cryoModule.Dictionary.join({
		userId = playersService.LocalPlayer.UserId,
		clientSessionId = self:GetSessionId(),
		channelId = self:GetChannelId()
	}, p130)
end

function t_1:_reportJoinFailed(p131, p132) --[[ line: 2786 ]]
	self.Analytics:reportVoiceChatJoinResult(false, p131, p132)
	self:emit("OnReportJoinFailed", p131)
end

function t_1:_syncLocalAudioDeviceActive() --[[ line: 2791 ]]
	-- upvalues: getFFlagCoreMicManagerRefactorModule (ref), voiceChatService (ref), playersService (ref)
	if getFFlagCoreMicManagerRefactorModule() then
		return self.micManager:SyncLocalAudioDeviceActive()
	elseif not voiceChatService.UseNewAudioApi then return end
	local var145 = if self.localMuted == nil then false else not self.localMuted
	
	for i in self.audioDevices do
		if i.Player and i.Player == playersService.LocalPlayer then
			i.Active = var145
		end
	end
end

function t_1:_setupEarlyAudioDeviceGuard() --[[ line: 2807 ]]
	-- upvalues: getFFlagCoreMicManagerRefactorModule (ref), voiceChatService (ref), fFlagExpChatDictation (ref), coreGuiService (ref), playersService (ref), soundService (ref)
	if getFFlagCoreMicManagerRefactorModule() then
		return self.micManager:SetupEarlyAudioDeviceGuard()
	end
	local function _(p133) --[[ line: 2811 | named "shouldDeactivate" ]]
		-- upvalues: voiceChatService (copy), fFlagExpChatDictation (copy), coreGuiService (copy), playersService (copy), self (ref)
		return voiceChatService.UseNewAudioApi and (not (fFlagExpChatDictation and p133:IsDescendantOf(coreGuiService)) and (p133.Player == playersService.LocalPlayer and (p133.Active and self.localMuted == nil)))
	end
	
	local function guardDevice(p134) --[[ line: 2819 ]]
		-- upvalues: voiceChatService (copy), fFlagExpChatDictation (copy), coreGuiService (copy), playersService (copy), self (ref)
		if voiceChatService.UseNewAudioApi and (not (fFlagExpChatDictation and p134:IsDescendantOf(coreGuiService)) and (p134.Player == playersService.LocalPlayer and (p134.Active and self.localMuted == nil))) then
			p134.Active = false
		end
		p134:GetPropertyChangedSignal("Player"):Connect(function() --[[ line: 2824 ]]
			-- upvalues: p134 (ref), voiceChatService (copy), fFlagExpChatDictation (copy), coreGuiService (copy), playersService (copy), self (copy)
			local var147 = p134
			
			if voiceChatService.UseNewAudioApi and (not (fFlagExpChatDictation and var147:IsDescendantOf(coreGuiService)) and (var147.Player == playersService.LocalPlayer and (var147.Active and self.localMuted == nil))) then
				p134.Active = false
			end
		end)
		p134:GetPropertyChangedSignal("Active"):Connect(function() --[[ line: 2830 ]]
			-- upvalues: p134 (ref), voiceChatService (copy), fFlagExpChatDictation (copy), coreGuiService (copy), playersService (copy), self (copy)
			local var148 = p134
			
			if voiceChatService.UseNewAudioApi and (not (fFlagExpChatDictation and var148:IsDescendantOf(coreGuiService)) and (var148.Player == playersService.LocalPlayer and (var148.Active and self.localMuted == nil))) then
				p134.Active = false
			end
		end)
	end
	
	soundService.AudioInstanceAdded:Connect(function(p135) --[[ line: 2837 ]]
		-- upvalues: guardDevice (ref)
		if p135:IsA("AudioDeviceInput") then
			guardDevice(p135)
		end
	end)
	
	for i, v in game:GetDescendants() do
		if v:IsA("AudioDeviceInput") then
			guardDevice(v)
		end
	end
end

function t_1:_asyncInit() --[[ line: 2851 ]]
	-- upvalues: var48 (ref), name (ref), MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED (ref), getFFlagVoiceChatClientRewriteMasterLua (ref), voiceChatService (ref), analyticsModule (ref), promiseModule (ref)
	self:CheckCallState()
	
	if var48 then
		self:_setupEarlyAudioDeviceGuard()
	end
	return self:canUseServiceAsync():andThen(function(_) --[[ line: 2857 ]]
		-- upvalues: name (copy), MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED (copy), self (ref), getFFlagVoiceChatClientRewriteMasterLua (copy), voiceChatService (copy), analyticsModule (copy), promiseModule (copy)
		local var149 = "VoiceChatService"
		
		if game:GetEngineFeature("UseNewVoiceChatService") then
			var149 = "VoiceChatInternal"
			name:debug("Using VoiceChatInternal")
		end
		local ok, status = pcall(function() --[[ line: 2863 ]]
			-- upvalues: var149 (write), MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED (copy), self (copy)
			local var151 = game:GetService(var149)
			
			if var151 and (var151:GetVoiceChatApiVersion() < MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED or var151:IsContextVoiceEnabled()) then
				self.voiceEnabled = true
				self.service = var151
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

function t_1:UpdateLocalMetering() --[[ line: 2913 ]]
	-- upvalues: getFFlagCoreMicManagerRefactorModule (ref), playersService (ref), var29 (ref)
	if getFFlagCoreMicManagerRefactorModule() then
		return self.micManager:UpdateLocalMetering()
	end
	self.isTalking = self:IsSignalActive(playersService.LocalPlayer.UserId)
	
	if self.localMuted == false then
		if var29 then
			self:FireTalkingChangedDebounced(self.isTalking)
			
			return
		end
		self.talkingChanged:Fire(self.isTalking)
	end
end

function t_1:FireTalkingChangedDebounced(p136) --[[ line: 2928 ]]
	-- upvalues: getFFlagCoreMicManagerRefactorModule (ref), var30 (ref)
	if getFFlagCoreMicManagerRefactorModule() then
		return self.micManager:FireTalkingChangedDebounced(p136)
	end
	local var152 = tick() * 1000
	
	if p136 ~= self._lastTalkingChangedFireValue or var30 < var152 - self._lastTalkingChangedFireTime then
		self._lastTalkingChangedFireTime = var152
		self._lastTalkingChangedFireValue = p136
		self.talkingChanged:Fire(p136)
	end
end

function t_1:asyncInit() --[[ line: 2947 ]]
	-- upvalues: name (ref), promiseModule (ref), constantsModule (ref), getFFlagCoreMicManagerRefactorModule (ref), fFlagEnablePartyVoiceChangersInLua (ref), stringKeyFixForParticipantsTable (ref)
	if self.service then
		name:trace("Manager already initialized")
		
		return promiseModule.resolve()
	elseif not self.initPromise then
		self.initPromise = self:_asyncInit()
		
		if self.AdService then
			(function(value) --[[ line: 2957 | named "setupRewardedAdMuting" ]]
				-- upvalues: constantsModule (copy), getFFlagCoreMicManagerRefactorModule (copy)
				local var153 = false
				value.AdService.RewardedVideoAdStarted:Connect(function() --[[ line: 2959 ]]
					-- upvalues: value (ref), var153 (write), constantsModule (copy), getFFlagCoreMicManagerRefactorModule (copy)
					if value.localMuted == nil then return end
					var153 = value.localMuted
					
					if not value.localMuted then
						value:ToggleMic(constantsModule.REWARDED_VIDEO_AD_STARTED)
					end
					value.isPlayerWatchingAd = true
					
					if getFFlagCoreMicManagerRefactorModule() then
						value.micManager:SetAdMuteBlocked(true)
					end
				end)
				value.AdService.RewardedVideoAdEnded:Connect(function() --[[ line: 2978 ]]
					-- upvalues: value (ref), getFFlagCoreMicManagerRefactorModule (copy), var153 (write), constantsModule (copy)
					if value.localMuted == nil then return end
					value.isPlayerWatchingAd = false
					
					if getFFlagCoreMicManagerRefactorModule() then
						value.micManager:SetAdMuteBlocked(false)
					end
					if var153 ~= value.localMuted then
						value:ToggleMic(constantsModule.REWARDED_VIDEO_AD_ENDED)
					end
				end)
			end)(self)
		end
		if fFlagEnablePartyVoiceChangersInLua and not self.voiceChangerWasToggledEvent then
			task.spawn(function() --[[ line: 3001 ]]
				-- upvalues: self (ref), stringKeyFixForParticipantsTable (copy)
				local voiceChangerWasToggledEvent = self:GetVoiceChangerWasToggledEvent()
				
				if voiceChangerWasToggledEvent then
					voiceChangerWasToggledEvent.OnClientEvent:Connect(function(p137, p138) --[[ line: 3005 ]]
						-- upvalues: stringKeyFixForParticipantsTable (copy), self (copy)
						local var155 = if stringKeyFixForParticipantsTable then self.participants[tostring(p137)] else self.participants[p137]
						
						if var155 then
							var155.isVoiceChangerActive = p138
							self.voiceChangerActivePlayers[p137] = p138
							self.participantsUpdate:Fire(self.participants)
						end
					end)
				end
			end)
		end
	end
	return self.initPromise
end

function t_1:IsInitialized() --[[ line: 3025 ]]
	return self.service
end

function t_1:ensureInitialized(p139) --[[ line: 3029 ]]
	if not self.service then
		error("[corescripts VCS Manager] " .. "Attempting to " .. p139 .. " before calling init")
	end
end

function t_1:GetSessionId() --[[ line: 3036 ]]
	self:ensureInitialized("get session id")
	
	return self.service:GetSessionId()
end

function t_1:GetChannelId() --[[ line: 3041 ]]
	self:ensureInitialized("get channel id")
	
	return self.service:GetChannelId()
end

function t_1:Disconnect() --[[ line: 3046 ]]
	-- upvalues: getFFlagCoreMicManagerRefactorModule (ref), var57 (ref)
	if getFFlagCoreMicManagerRefactorModule() then
		self.micManager:Disconnect()
	end
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
	if var57 and self.videoCaptureInProgressConnection then
		self.videoCaptureInProgressConnection:Disconnect()
		self.videoCaptureInProgressConnection = nil
	end
end

function t_1.RequestHidePublicVoiceUI(p140) --[[ line: 3100 ]]
	task.defer(function() --[[ line: 3101 ]]
		-- upvalues: p140 (ref)
		p140.setVoiceUIVisibility:Fire(false)
	end)
end

function t_1.RequestShowPublicVoiceUI(p141) --[[ line: 3106 ]]
	task.defer(function() --[[ line: 3107 ]]
		-- upvalues: p141 (ref)
		p141.setVoiceUIVisibility:Fire(true)
	end)
end

t_1.default = t_1.new(blockingUtilityModule:GetAfterBlockedStatusChangedEvent(), permissionsProtocol.default, httpRbxApiService, nil, nil, nil, nil, nil, thirdPartyUserService, nil, adService)

if var52 and voiceVolumeControlsApplyGameSettingsVoiceVolumeEngineFeature then
	local localPlayer = playersService.LocalPlayer
	
	if localPlayer then
		localPlayer.AncestryChanged:Connect(function(_, p142) --[[ line: 3134 ]]
			-- upvalues: t_1 (ref)
			if p142 == nil then
				t_1.default:ReportVoiceVolumeImpressionsIfNeeded()
			end
		end)
	end
end
return t_1