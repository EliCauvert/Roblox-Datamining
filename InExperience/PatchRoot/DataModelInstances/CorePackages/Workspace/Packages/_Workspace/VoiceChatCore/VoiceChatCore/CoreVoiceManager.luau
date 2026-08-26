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
local var1 = require(flags.GetFFlagUpdateDeviceInputPlayerChanged)()
local stringKeyFixForParticipantsTable = game:DefineFastFlag("StringKeyFixForParticipantsTable", false)
local showJoinVoiceRaceConditionFix = game:DefineFastFlag("ShowJoinVoiceRaceConditionFix", false)
local consoleVoiceIXPEnabled = game:DefineFastFlag("ConsoleVoiceIXPEnabled", false)
local fFlagExpChatDictation = require(parent_1.SharedFlags).FFlagExpChatDictation
local consoleVoiceIXPLayerName = game:DefineFastString("ConsoleVoiceIXPLayerName", "User.Communication.ConsoleVoice")
local consoleVoiceEnabledIXPLayerValue = game:DefineFastString("ConsoleVoiceEnabledIXPLayerValue", "ConsoleVoiceEnabled")
local var2 = require(flags.GetFFlagTalkingChangedWithDebounceV2)()
local var3 = require(flags.GetFIntTalkingChangedDebounceTime)()
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
local var4 = require(flags.GetFFlagUseAudioAnalyzerForLocalMetering2)()
local stopModerationConnectionOnLeave = game:DefineFastFlag("StopModerationConnectionOnLeave", false)
local var5 = require(flags.GetFFlagDeactivateAudioDeviceOnVoiceLeave)()
local disableRejoinGroupIdDoubleRead = game:DefineFastFlag("DisableRejoinGroupIdDoubleRead", false)
local voiceVolumeControlsApplyGameSettingsVoiceVolumeEngineFeature = game:GetEngineFeature("VoiceVolumeControlsApplyGameSettingsVoiceVolume")
local voiceVolumeControlsEnableVoiceVolumeEligibilityTelemetry = game:DefineFastFlag("VoiceVolumeControlsEnableVoiceVolumeEligibilityTelemetry", false)
local var6 = require(flags.GetFFlagVoiceVolumeControlsEnableVoiceVolumeImpressionsTelemetry)()
local voiceVolumeControlsEligibilityModule = require(parent.VoiceVolumeControlsEligibility)
local enableMutedByLocalUserEngineFeature = game:GetEngineFeature("EnableMutedByLocalUser")
local voiceChatMuteAllSyncMutedPlayers = game:DefineFastFlag("VoiceChatMuteAllSyncMutedPlayers", false)
local rbxAnalyticsServiceExposePlaySessionIdEngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local getFFlagEnableVoiceChatMuteForVideoCaptures = require(parent_1.SharedFlags).GetFFlagEnableVoiceChatMuteForVideoCaptures
local var7 = sendVoiceCapturedDuringVideoCaptureEvent and getFFlagEnableVoiceChatMuteForVideoCaptures()
local getFFlagDebugVoiceChatMicPermissionCliBypassModule = require(flags.GetFFlagDebugVoiceChatMicPermissionCliBypass)
local getFFlagEnableVoiceSignal = require(parent_1.SharedFlags).GetFFlagEnableVoiceSignal
local getFFlagEnableInExpPhoneVoiceUpsellEntrypoints = require(parent_1.SharedFlags).GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints
local getFFlagVoiceChatClientRewriteMasterLua = require(parent_1.SharedFlags).GetFFlagVoiceChatClientRewriteMasterLua
local getFFlagCheckUniversePlaceBeforeSuspending = require(parent_1.SharedFlags).GetFFlagCheckUniversePlaceBeforeSuspending
local getFFlagDisconnectToastClientRewrite = require(parent_1.SharedFlags).GetFFlagDisconnectToastClientRewrite
local fFlagEnablePartyVoiceChangersInLua = require(parent_1.SharedFlags).FFlagEnablePartyVoiceChangersInLua
local getFFlagEnableVoiceUxUpdates = require(parent_1.SharedFlags).GetFFlagEnableVoiceUxUpdates
local getFFlagCoreMicManagerRefactorModule = require(flags.GetFFlagCoreMicManagerRefactor)
local var8 = if getFFlagCoreMicManagerRefactorModule() then require(script.Parent.MicInputManager) else nil
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
	TelemetryService = if var7 then game:GetService("TelemetryService") else nil,
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

function t_1:__index(p1)
	-- upvalues: getFFlagCoreMicManagerRefactorModule (ref), t_2 (ref), t_1 (ref)
	if getFFlagCoreMicManagerRefactorModule() then
		local var9 = rawget(self, "micManager")
		
		return if var9 and t_2[p1] then var9[p1] else t_1[p1]
	end
end

function t_1:__newindex(p1, p2)
	-- upvalues: getFFlagCoreMicManagerRefactorModule (ref), t_2 (ref)
	if getFFlagCoreMicManagerRefactorModule() then
		local var9 = rawget(self, "micManager")
		
		if var9 and t_2[p1] then
			var9[p1] = p2
			
			return
		end
	end
	rawset(self, p1, p2)
end

function t_1.new(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11)
	-- upvalues: utilsModule (ref), analyticsModule (ref), appStorageService (ref), t_1 (ref), WATCHED_MESSAGE_TYPES (ref), getFIntThrottleParticipantsUpdateMsModule (ref), playersService_1 (ref), name (ref), IXPServiceWrapper (ref), voicePerformanceThrottlingIXPLayerName (ref), throttleParticipantsUpdateIXPLayerValue (ref), getFFlagCoreMicManagerRefactorModule (ref), var8 (ref), var7 (ref)
	local tbl = setmetatable({
		previousSessionId = nil,
		HttpRbxApiService = p3,
		eventEmitter = utilsModule.EventEmitter.new(),
		service = p4,
		PermissionsService = p2,
		NotificationService = p6,
		AvatarChatService = p7,
		Analytics = analyticsModule.new(p5),
		SequenceNumbers = {},
		SignalREventTable = {},
		audioDevices = {},
		BlockStatusChanged = p1,
		AppStorageService = p8 or appStorageService,
		ThirdPartyUserService = p9,
		CaptureService = p10,
		AdService = p11
	}, t_1)
	
	for i, v in WATCHED_MESSAGE_TYPES do
		tbl.SignalREventTable[v] = Instance.new("BindableEvent")
	end
	tbl.shouldThrottleParticipantUpdate = false
	tbl.participantsStateThrottleTime = 0
	tbl.lastParticipantsStateUpdate = 0
	tbl.lastStateUpdateCounter = 0
	
	if getFIntThrottleParticipantsUpdateMsModule() > 0 then
		task.spawn(function()
			-- upvalues: playersService_1 (copy), p4 (ref), name (copy), IXPServiceWrapper (copy), voicePerformanceThrottlingIXPLayerName (copy)
			local ok, status = pcall(function()
				-- upvalues: playersService_1 (copy), p4 (copy)
				return if playersService_1.LocalPlayer then p4:IsVoiceEnabledForUserIdAsync(playersService_1.LocalPlayer.UserId) else false
			end)
			
			if not ok then
				name:debug("Unable to get voice enabled status: ", status)
				
				return
			elseif status then
				IXPServiceWrapper:LogUserLayerExposure(voicePerformanceThrottlingIXPLayerName)
			end
		end)
		tbl.participantsStateThrottleTime = getFIntThrottleParticipantsUpdateMsModule() / 1000
		local ok, status = pcall(function()
			-- upvalues: IXPServiceWrapper (copy), voicePerformanceThrottlingIXPLayerName (copy)
			return IXPServiceWrapper:GetLayerData(voicePerformanceThrottlingIXPLayerName)
		end)
		
		if ok and status and status[throttleParticipantsUpdateIXPLayerValue] then
			tbl.shouldThrottleParticipantUpdate = true
		end
	end
	if getFFlagCoreMicManagerRefactorModule() then
		tbl.micManager = var8.new({
			log = name,
			callbacks = {
				emitGetPermissions = function(p12, p13, p14, p15)
					-- upvalues: tbl (ref)
					tbl:emit("GetPermissions", p12, p13, p14, p15)
				end,
				emitOnPermissionRequested = function()
					-- upvalues: tbl (ref)
					tbl:emit("OnPermissionRequested")
				end,
				emitOnRequestMicPermissionResolved = function()
					-- upvalues: tbl (ref)
					tbl:emit("OnRequestMicPermissionResolved")
				end,
				emitOnRequestMicPermissionRejected = function()
					-- upvalues: tbl (ref)
					tbl:emit("OnRequestMicPermissionRejected")
				end,
				emitOnShowDataConsentToast = function()
					-- upvalues: tbl (ref)
					tbl:emit("OnShowDataConsentToast")
				end,
				getAudioDevices = function()
					-- upvalues: tbl (ref)
					return tbl.audioDevices
				end,
				getSendMuteEvent = function()
					-- upvalues: tbl (ref)
					return tbl:GetSendMuteEvent()
				end,
				isSignalActive = function(value)
					-- upvalues: tbl (ref)
					return tbl:IsSignalActive(value)
				end,
				reportVoiceMuteSelf = function(p12)
					-- upvalues: tbl (ref)
					tbl.Analytics:reportVoiceMuteSelf(p12)
				end,
				getJoinWithVoiceMuteData = function(p12)
					-- upvalues: tbl (ref)
					return tbl:JoinWithVoiceMuteData(p12)
				end,
				recordExperienceJoinMicPerm = function(p12)
					-- upvalues: tbl (ref)
					tbl:RecordExperienceJoinMicPermissionStatus(p12)
				end,
				reportJoinFailed = function(p12, p13)
					-- upvalues: tbl (ref), analyticsModule (copy)
					tbl:_reportJoinFailed(p12, p13 or analyticsModule.ERROR)
				end,
				requestPermissions = function(p12)
					-- upvalues: tbl (ref)
					return tbl.PermissionsService:requestPermissions(p12)
				end,
				getPassInitErrorInPromiseReject = function()
					-- upvalues: tbl (ref)
					return tbl.options.passInitErrorInPromiseReject
				end,
				onVoiceCapturedDuringVideoCapture = function(p12)
					-- upvalues: var7 (copy), tbl (ref)
					if var7 and tbl.CaptureService:IsCapturingVideo() then
						tbl.voiceCapturedDuringVideoCapture = tbl.voiceCapturedDuringVideoCapture or p12
					end
				end,
				getService = function()
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

function t_1:emit(p12, ...)
	self.eventEmitter:emit(p12, ...)
end

function t_1:subscribe(p12, p13)
	self.eventEmitter:addListener(p12, p13)
end

function t_1:unsubscribe(p12, p13)
	self.eventEmitter:removeListener(p12, p13)
end

function t_1:unsubscribeAll()
	self.eventEmitter:removeAllListeners()
end

function t_1.CheckCallStateWithPromise(p12)
	-- upvalues: default (ref), name (ref), enums (ref)
	return default:getCallState():andThen(function(p13)
		-- upvalues: name (copy), enums (copy), p12 (ref)
		name:trace("Got user call state")
		
		if p13.status ~= enums.CallStatus.Idle.rawValue() and p13.status ~= enums.CallStatus.Ringing.rawValue() then
			p12.isInCall = true
			p12.callMutedState = p13.muted
			name:trace("Changing call muted state to {}", p13.muted)
		end
	end):catch(function(p13)
		-- upvalues: name (copy)
		name:trace("User not in call {}", p13)
	end)
end

function t_1.CheckCallState(p12)
	-- upvalues: name (ref), default (ref), enums (ref)
	name:trace("Checking user call state")
	local ok, status = pcall(function()
		-- upvalues: default (copy), name (copy), enums (copy), p12 (ref)
		default:getCallState():andThen(function(p13)
			-- upvalues: name (copy), enums (copy), p12 (copy)
			name:trace("Got user call state")
			
			if p13.status ~= enums.CallStatus.Idle.rawValue() and p13.status ~= enums.CallStatus.Ringing.rawValue() then
				p12.isInCall = true
				p12.callMutedState = p13.muted
				name:trace("Changing call muted state to {}", p13.muted)
			end
		end):catch(function(p13)
			-- upvalues: name (copy)
			name:trace("User not in call {}", p13)
		end)
	end)
	
	if not ok then
		name:debug("Error checking user call state {}", status)
	end
end

function t_1._GetShowAgeVerificationOverlay(p12, p13)
	-- upvalues: getShowAgeVerificationOverlayModule (ref), utilsModule (ref)
	return getShowAgeVerificationOverlayModule(utilsModule.bind(p12, "GetRequest"), tostring(game.GameId), tostring(game.PlaceId), p13)
end

function t_1:FetchAgeVerificationOverlay(p12)
	-- upvalues: promiseModule (ref)
	if not self._getShowAgeVerificationOverlayResult then
		if not self._getShowAgeVerificationOverlayPromise then
			self._getShowAgeVerificationOverlayPromise = promiseModule.new(function(p13, _)
				-- upvalues: self (ref), p12 (ref)
				self._getShowAgeVerificationOverlayResult = self:_GetShowAgeVerificationOverlay(p12)
				p13(self._getShowAgeVerificationOverlayResult)
			end)
		end
		self._getShowAgeVerificationOverlayPromise:await()
	end
	return self._getShowAgeVerificationOverlayResult
end

function t_1._GetShowPhoneVerificationUpsell(p12, p13, p14)
	-- upvalues: getShowPhoneVerificationUpsellModule (ref), utilsModule (ref)
	return getShowPhoneVerificationUpsellModule(utilsModule.bind(p12, "GetRequest"), tostring(game.GameId), p13, p14)
end

function t_1:FetchPhoneVerificationUpsell(p12, p13, p14)
	-- upvalues: promiseModule (ref), constantsModule (ref)
	if not self._getShowPhoneVerificationUpsellResult then
		self._getShowPhoneVerificationUpsellResult = {}
		self._getShowPhoneVerificationUpsellPromise = {}
	end
	if not self._getShowPhoneVerificationUpsellResult[p12] or p14 then
		if not self._getShowPhoneVerificationUpsellPromise[p12] or p14 then
			self._getShowPhoneVerificationUpsellPromise[p12] = promiseModule.new(function(p15, _)
				-- upvalues: self (ref), p12 (ref), p13 (ref), constantsModule (copy)
				local var9 = self:_GetShowPhoneVerificationUpsell(p12, p13)
				self._getShowPhoneVerificationUpsellResult[p12] = if type(var9) == "table" and var9.valueProp ~= nil then var9.valueProp else constantsModule.PHONE_UPSELL_VOICE_CHAT_PROP.None
				p15()
			end)
		end
		self._getShowPhoneVerificationUpsellPromise[p12]:await()
	end
	return self._getShowPhoneVerificationUpsellResult[p12]
end

function t_1:DisablePhoneVerificationUpsell()
	-- upvalues: cryoModule (ref), constantsModule (ref)
	self._getShowPhoneVerificationUpsellResult = cryoModule.Dictionary.map(self._getShowPhoneVerificationUpsellResult, function()
		-- upvalues: constantsModule (copy)
		return constantsModule.PHONE_UPSELL_VOICE_CHAT_PROP.None
	end)
end

function t_1:GetNudgeAnalyticsData()
	-- upvalues: playersService (ref)
	return playersService.LocalPlayer.UserId, self:GetSessionId()
end

function t_1:avatarChatUserAndPlaceSettingsValueOfClientFeatures(p12)
	-- upvalues: getFFlagEnableVoiceSignal (ref)
	return {
		universePlaceVoiceEnabledSettings = {
			isUniverseEnabledForVoice = self.AvatarChatService:IsEnabled(p12, Enum.AvatarChatServiceFeature.UniverseAudio),
			isPlaceEnabledForVoice = self.AvatarChatService:IsEnabled(p12, Enum.AvatarChatServiceFeature.PlaceAudio),
			isUniverseEnabledForAvatarVideo = self.AvatarChatService:IsEnabled(p12, Enum.AvatarChatServiceFeature.UniverseVideo),
			isPlaceEnabledForAvatarVideo = self.AvatarChatService:IsEnabled(p12, Enum.AvatarChatServiceFeature.PlaceVideo)
		},
		voiceSettings = {
			bannedUntil = nil,
			isUserEligible = self.AvatarChatService:IsEnabled(p12, Enum.AvatarChatServiceFeature.UserAudioEligible),
			isVoiceEnabled = self.AvatarChatService:IsEnabled(p12, Enum.AvatarChatServiceFeature.UserAudio),
			isAvatarVideoEligible = self.AvatarChatService:IsEnabled(p12, Enum.AvatarChatServiceFeature.UserVideoEligible),
			isAvatarVideoEnabled = self.AvatarChatService:IsEnabled(p12, Enum.AvatarChatServiceFeature.UserVideo),
			isUserVerifiedForVoice = if getFFlagEnableVoiceSignal() then self.AvatarChatService:IsEnabled(p12, Enum.AvatarChatServiceFeature.UserVerifiedForVoice) else nil,
			isBanned = self.AvatarChatService:IsEnabled(p12, Enum.AvatarChatServiceFeature.UserBanned)
		}
	}
end

function t_1:resolveAvatarChatUserAndPlaceSettings()
	local ok, status = pcall(self.AvatarChatService.GetClientFeaturesAsync, self.AvatarChatService)
	
	return if ok then self:avatarChatUserAndPlaceSettingsValueOfClientFeatures(status) else nil
end

function t_1.GetRequest(p12, p13, _)
	-- upvalues: httpService (ref)
	local ok, status = pcall(function()
		-- upvalues: p12 (ref), p13 (ref), httpService (copy)
		return httpService:JSONDecode(p12.HttpRbxApiService:GetAsyncFullUrl(p13, Enum.ThrottlingPriority.Default, Enum.HttpRequestType.Players))
	end)
	
	return ok and status
end

function t_1.PostUserVoiceConnectionStatus(p12, p13)
	-- upvalues: httpService (ref), constantsModule (ref)
	local ok, _ = pcall(function()
		-- upvalues: httpService (copy), p13 (ref), p12 (ref), constantsModule (copy)
		return httpService:JSONDecode(p12.HttpRbxApiService:PostAsyncFullUrl(constantsModule.VOICE_URL .. "/v1/user-voice-connection-state", httpService:JSONEncode({ IsUserVoiceConnected = p13 })))
	end)
	
	return ok
end

function t_1:GetVoiceAnalyticsData()
	-- upvalues: rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref), rbxAnalyticsService (ref)
	return {
		micAvailability = "",
		universeId = game.GameId,
		placeId = game.PlaceId,
		playSessionId = if rbxAnalyticsServiceExposePlaySessionIdEngineFeature then rbxAnalyticsService:GetPlaySessionId() else "",
		voiceSessionId = if self.service then self:GetSessionId() else ""
	}
end

function t_1:RecordExperienceJoinMicPermissionStatus(p12)
	-- upvalues: permissionsProtocol (ref), PERMISSION_STATE (ref)
	local voiceAnalyticsData = self:GetVoiceAnalyticsData()
	
	if p12 == nil or typeof(p12) ~= "table" then
		if self.permissionState then
			if self.permissionState == PERMISSION_STATE.LISTEN_AND_TALK then
				voiceAnalyticsData.micAvailability = "Granted"
			else
				voiceAnalyticsData.micAvailability = "Denied"
			end
		end
	elseif p12.status == permissionsProtocol.Status.AUTHORIZED then
		voiceAnalyticsData.micAvailability = "Granted"
	else
		voiceAnalyticsData.micAvailability = "Denied"
	end
	self.Analytics:reportVoiceEvents("experienceJoinDeviceMicPermissionEvent", voiceAnalyticsData)
end

function t_1:CheckCaptureMute()
	-- upvalues: getFFlagEnableVoiceChatMuteForVideoCaptures (ref)
	return if getFFlagEnableVoiceChatMuteForVideoCaptures() then self.CaptureService:IsCapturingVideo() else false
end

function t_1:ToggleMuteSome(p12, p13, p14, p15)
	-- upvalues: voiceChatService (ref), enableMutedByLocalUserEngineFeature (ref), playersService (ref)
	self:ensureInitialized("mute some players")
	self._mutedAnyone = true
	local t = {}
	p13 = p13 or self:CheckCaptureMute()
	
	for i, v in p12 do
		if voiceChatService.UseNewAudioApi then
			t[v] = true
			self.mutedPlayers[v] = p13
		else
			self.service:SubscribePause(v, p13)
		end
		local var9 = self.participants[tostring(v)]
		
		if var9 then
			var9.isMutedLocally = p13
			self.participantsUpdate:Fire(self.participants)
		end
	end
	if voiceChatService.UseNewAudioApi then
		for i_1 in self.audioDevices do
			if i_1.Player and t[i_1.Player.UserId] then
				if not enableMutedByLocalUserEngineFeature or i_1.Player == playersService.LocalPlayer then
					i_1.Active = not p13
					continue
				else
					i_1.MutedByLocalUser = p13
				end
			end
		end
	end
	if p14 and p15 then
		self.Analytics:reportVoiceMuteGroup(self:JoinWithVoiceMuteData({ groupType = p14, context = p15, muted = p13 }))
	end
end

function t_1:GetMutedAnyone()
	return self._mutedAnyone
end

function t_1:RecordGameSettingsOpened()
	-- upvalues: var6 (ref), voiceVolumeControlsApplyGameSettingsVoiceVolumeEngineFeature (ref)
	if var6 and voiceVolumeControlsApplyGameSettingsVoiceVolumeEngineFeature and (self._voiceJoinTimestampMs and not self._gameSettingsOpenedTimestampMs) then
		self._gameSettingsOpenedTimestampMs = DateTime.now().UnixTimestampMillis
	end
end

function t_1:ResetVoiceVolumeImpressionsSession()
	-- upvalues: var6 (ref), voiceVolumeControlsApplyGameSettingsVoiceVolumeEngineFeature (ref)
	if var6 and voiceVolumeControlsApplyGameSettingsVoiceVolumeEngineFeature then
		self._voiceJoinTimestampMs = nil
		self._voiceVolumeSliderEligibleAtJoin = false
		self._gameSettingsOpenedTimestampMs = nil
	end
end

function t_1:ReportVoiceVolumeImpressionsIfNeeded()
	-- upvalues: var6 (ref), voiceVolumeControlsApplyGameSettingsVoiceVolumeEngineFeature (ref)
	if var6 and voiceVolumeControlsApplyGameSettingsVoiceVolumeEngineFeature and (self._voiceJoinTimestampMs and self._voiceVolumeSliderEligibleAtJoin) then
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

function t_1:ToggleMutePlayer(p16, p17)
	-- upvalues: voiceChatService (ref), name (ref), utilsModule (ref), getFFlagEnableFtuxExitOnMuteToggleModule (ref), enableMutedByLocalUserEngineFeature (ref), playersService (ref)
	self:ensureInitialized("mute player " .. p57)
	self._mutedAnyone = true
	local var10 = (if voiceChatService.UseNewAudioApi then not self.mutedPlayers[p16] else not self.service:IsSubscribePaused(p16)) or self:CheckCaptureMute()
	name:trace("Setting mute for {} to {}", utilsModule.shorten(p16), var10)
	
	if getFFlagEnableFtuxExitOnMuteToggleModule() then
		self.onPlayerMuteToggled:Fire()
	end
	if voiceChatService.UseNewAudioApi then
		self.mutedPlayers[p16] = var10
		
		for i in self.audioDevices do
			if i.Player and i.Player.UserId == p16 then
				if enableMutedByLocalUserEngineFeature and i.Player ~= playersService.LocalPlayer then
					i.MutedByLocalUser = var10
					continue
				end
				local var11 = self.participants[tostring(p16)]
				i.Active = not var10 and (var11 and not var11.isMuted)
				continue
			end
		end
		self:emit("OnPlayerMuted")
	else
		self.service:SubscribePause(p16, var10)
	end
	for i, v in pairs(self.participants) do
		if v.userId == p16 then
			v.isMutedLocally = var10
			self.participantsUpdate:Fire(self.participants)
		end
	end
	if p17 then
		self.Analytics:reportVoiceMuteIndividual(self:JoinWithVoiceMuteData({
			targetUserId = tonumber(p16),
			context = p17,
			muted = var10
		}))
	end
end

function t_1:MuteAll(p18, p19)
	-- upvalues: voiceChatService (ref), name (ref), voiceChatMuteAllSyncMutedPlayers (ref), playersService (ref), enableMutedByLocalUserEngineFeature (ref), constantsModule (ref)
	self:ensureInitialized("mute all")
	self._mutedAnyone = true
	p18 = p18 or self:CheckCaptureMute()
	
	if voiceChatService.UseNewAudioApi then
		self.muteAll = p18
		name:trace("Setting self mute all to {} context: {}", p18, p19)
		
		if voiceChatMuteAllSyncMutedPlayers and not p18 then
			table.clear(self.mutedPlayers)
		end
		for i in self.audioDevices do
			if i.Player and i.Player ~= playersService.LocalPlayer then
				name:debug("Local muting {} to '{} = {}'", i.Player.Name, i.Active, p18)
				
				if enableMutedByLocalUserEngineFeature then
					i.MutedByLocalUser = p18
					
					if voiceChatMuteAllSyncMutedPlayers then
						self.mutedPlayers[i.Player.UserId] = p18
					end
				else
					local userId = i.Player.UserId
					self.mutedPlayers[userId] = p18
					local var12 = self.participants[tostring(userId)]
					i.Active = not p18 and (var12 and not var12.isMuted)
				end
			end
		end
	else
		self.service:SubscribePauseAll(p18)
	end
	for i, v in pairs(self.participants) do
		v.isMutedLocally = p18
		self.participantsUpdate:Fire(self.participants)
	end
	self.muteAllChanged:Fire(p18)
	
	if p19 then
		self.Analytics:reportVoiceMuteGroup(self:JoinWithVoiceMuteData({
			groupType = constantsModule.VOICE_GROUP_TYPE.ALL,
			context = p19,
			muted = p18
		}))
	end
end

function t_1:FetchVoicePermissions()
	if not self.communicationPermissionsResult then
		self.communicationPermissionsResult = self:resolveAvatarChatUserAndPlaceSettings()
	end
	return self.communicationPermissionsResult
end

function t_1:verifyUniverseAndPlaceCanUseVoice()
	-- upvalues: getFFlagAvatarChatServiceEnabled (ref), getFFlagVoiceChatServiceManagerUseAvatarChatModule (ref), analyticsModule (ref)
	local var13 = if getFFlagAvatarChatServiceEnabled() and getFFlagVoiceChatServiceManagerUseAvatarChatModule() then self:resolveAvatarChatUserAndPlaceSettings() else self:FetchAgeVerificationOverlay()
	
	if var13 then
		local universePlaceVoiceEnabledSettings = var13.universePlaceVoiceEnabledSettings
		
		return universePlaceVoiceEnabledSettings and (universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice and universePlaceVoiceEnabledSettings.isUniverseEnabledForVoice)
	end
	self:_reportJoinFailed("invalidResponse", analyticsModule.ERROR)
	
	return false
end

function t_1:IsUserInFTUX()
	-- upvalues: getFFlagSeamlessVoiceFTUX (ref), getFFlagCheckUniversePlaceBeforeSuspending (ref), name (ref)
	if not getFFlagSeamlessVoiceFTUX() then
		return false
	elseif getFFlagCheckUniversePlaceBeforeSuspending() and not self:verifyUniverseAndPlaceCanUseVoice() then
		return false
	end
	local appStorageService = game:GetService("AppStorageService")
	local var13 = nil
	
	if not pcall(function()
		-- upvalues: appStorageService (ref), var13 (write)
		var13 = appStorageService:GetItem("SeamlessVoiceFTUX") == "true"
	end) then
		name:warning("Failed to read FTUX/STUX from AppStorage")
		
		return false
	end
	local var14 = self:FetchAgeVerificationOverlay()
	
	if type(var14) == "table" and var14.voiceSettings and var14.voiceSettings.seamlessVoiceStatus ~= 3 then
		name:debug("User not eligible for FTUX/STUX")
		
		return false
	end
	return not var13
end

function t_1.isEnableDefaultVoiceOnForPlace(_)
	-- upvalues: voiceChatService (ref)
	if not game:IsLoaded() then
		game.Loaded:Wait()
	end
	return voiceChatService.UseNewAudioApi or voiceChatService.EnableDefaultVoice
end

function t_1:verifyPlaceCanUseVoice(p20, p21)
	-- upvalues: analyticsModule (ref)
	if not p20 or not p21 then
		self:_reportJoinFailed("invalidResponse", analyticsModule.ERROR)
		
		return false
	elseif not p20.isUniverseEnabledForVoice then
		self:_reportJoinFailed("universeNotEnabled")
		
		return false
	end
	self:emit("OnUserAndPlaceCanUseVoiceResolved", p21, p20)
	
	if not p20.isPlaceEnabledForVoice then
		self:_reportJoinFailed("placeNotEnabled")
		
		return false
	end
	return self:isEnableDefaultVoiceOnForPlace()
end

function t_1:EligibleForFaeUpsell()
	-- upvalues: FAE_ENABLED (ref)
	local var13 = self:FetchAgeVerificationOverlay()
	
	return if var13 and type(var13) == "table" then var13.inExperienceFaeUpsell == FAE_ENABLED and var13.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice else false
end

function t_1:OptUserToJoinVoice()
	-- upvalues: name (ref)
	name:debug("Opting user to join voice on age verification")
	self.hasOptedToJoinVoiceOnAgeVerification = true
end

function t_1:SetupFAECompleteListener()
	-- upvalues: name (ref)
	name:debug("Setting up FAE complete listener")
	
	if game:GetEngineFeature("ChatReconcileAccess") then
		name:debug("Using ChatService ReconcileCommunicationAccessCompleted event")
		self.ChatService.ReconcileCommunicationAccessCompleted:Connect(function()
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

function t_1:EligibleForAgeCheckToast()
	-- upvalues: FAE_SETTINGS_TOAST (ref)
	local var13 = self:FetchAgeVerificationOverlay()
	
	return if var13 and type(var13) == "table" then var13.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice and (self:isEnableDefaultVoiceOnForPlace() and var13.inExperienceFaeUpsell == FAE_SETTINGS_TOAST) else false
end

function t_1:userAndPlaceCanUseVoice()
	-- upvalues: getFFlagAvatarChatServiceEnabled (ref), getFFlagVoiceChatServiceManagerUseAvatarChatModule (ref), getShowAgeVerificationOverlayModule (ref), utilsModule (ref), analyticsModule (ref), name (ref), getFFlagEnableVoiceSignal (ref), getFFlagEnableInExpPhoneVoiceUpsellEntrypoints (ref), constantsModule (ref), VOICE_JOIN_PROGRESS (ref), getFFlagEnableVoiceUxUpdates (ref), getFFlagNonVoiceFTUX (ref)
	if self.ThirdPartyUserService ~= nil and self.ThirdPartyUserService:IsChatRestrictionSupported() and self.ThirdPartyUserService:GetVoiceChatRestrictionStatus() ~= Enum.ChatRestrictionStatus.NotRestricted then
		return false
	end
	local var13 = if getFFlagAvatarChatServiceEnabled() and getFFlagVoiceChatServiceManagerUseAvatarChatModule() then self:resolveAvatarChatUserAndPlaceSettings() else getShowAgeVerificationOverlayModule(utilsModule.bind(self, "GetRequest"), tostring(game.GameId), tostring(game.PlaceId))
	
	if not var13 then
		self:_reportJoinFailed("invalidResponse", analyticsModule.ERROR)
		
		return false
	elseif self.options.forceVoiceEnabled then
		var13.voiceSettings.isVoiceEnabled = true
		name:debug("bypassing voice permissions check")
	end
	local universePlaceVoiceEnabledSettings = var13.universePlaceVoiceEnabledSettings
	local voiceSettings = var13.voiceSettings
	name:trace("Voice settings endpoint returned {}", var13)
	
	if not self:verifyPlaceCanUseVoice(universePlaceVoiceEnabledSettings, voiceSettings) then
		return false
	elseif getFFlagEnableVoiceSignal() then
		self.communicationPermissionsResult = var13
		local var14 = getFFlagEnableInExpPhoneVoiceUpsellEntrypoints() and os.time()
		
		if self:UserEligibleForInExperienceUpsell() or (getFFlagEnableInExpPhoneVoiceUpsellEntrypoints() and (not self:UserVoiceEnabled() and (not voiceSettings.isUserVerifiedForVoice and (if self:FetchPhoneVerificationUpsell(constantsModule.IN_EXP_PHONE_UPSELL_IXP_LAYER) ~= constantsModule.PHONE_UPSELL_VOICE_CHAT_PROP.VoiceChat then var14 and self:FetchPhoneVerificationUpsell(constantsModule.EXIT_CONFIRMATION_PHONE_UPSELL_IXP_LAYER, var14) == constantsModule.PHONE_UPSELL_VOICE_CHAT_PROP.VoiceChat else true)))) then
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
		task.spawn(function()
			-- upvalues: self (ref)
			self:FetchAgeVerificationOverlay()
		end)
	end
	if not voiceSettings.isVoiceEnabled then
		self:_reportJoinFailed("userNotEnabled")
	end
	return voiceSettings.isVoiceEnabled
end

function t_1.voicePermissionGranted(_, p20)
	-- upvalues: permissionsProtocol (ref), cryoModule (ref)
	local _ = false
	
	return if typeof(p20) == "table" then if p20.status ~= permissionsProtocol.Status.AUTHORIZED then not cryoModule.List.find(p20.missingPermissions, permissionsProtocol.Permissions.MICROPHONE_ACCESS) else true else p20 == permissionsProtocol.Status.AUTHORIZED
end

function t_1.RawGetPermissions(p20, p21)
	-- upvalues: promiseModule (ref)
	return promiseModule.new(function(p22, _)
		-- upvalues: p20 (ref), p21 (ref)
		p20:emit("GetPermissions", function(p23)
			-- upvalues: p22 (ref)
			p22(p23)
		end, p21, true, true)
	end)
end

function t_1:requestMicPermission()
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
	self.permissionPromise = self.PermissionsService:requestPermissions({ permissionsProtocol.Permissions.MICROPHONE_ACCESS }):andThen(function(p20)
		-- upvalues: getFFlagEnableExpJoinMicPermAnalyticsModule (copy), self (ref), name (copy), analyticsModule (copy), promiseModule (copy), permissionsProtocol (copy)
		if getFFlagEnableExpJoinMicPermAnalyticsModule() then
			self:RecordExperienceJoinMicPermissionStatus(p20)
		end
		if p20 or p20.status then
			name:debug("Permission status {}", p20.status)
			local var13 = p20.status == permissionsProtocol.Status.AUTHORIZED
			
			return if self.options.passInitErrorInPromiseReject and not var13 then promiseModule.reject({ code = "INIT_ERROR_PERM_NOT_GRANTED" }) else var13 and promiseModule.resolve() or promiseModule.reject()
		end
		name:debug("No permission response, rejecting access")
		self:_reportJoinFailed("noPermissionResponse", analyticsModule.ERROR)
		
		return if self.options.passInitErrorInPromiseReject then promiseModule.reject({ code = "INIT_ERROR_NO_PERM_RESPONSE" }) else promiseModule.reject()
	end):andThen(function()
		-- upvalues: self (ref), promiseModule (copy)
		self:emit("OnRequestMicPermissionResolved")
		
		return promiseModule.resolve()
	end):catch(function()
		-- upvalues: self (ref), promiseModule (copy)
		self:emit("OnRequestMicPermissionRejected")
		
		return if self.options.passInitErrorInPromiseReject then promiseModule.reject({ code = "INIT_ERROR_MIC_PERM_REJECTED" }) else promiseModule.reject()
	end)
	
	return self.permissionPromise
end

function t_1:JoinByGroupIdToken(p20, p21)
	self.previousGroupId = p20
	self.previousMutedState = p21
	
	return self.service:JoinByGroupIdToken(p20, p21)
end

function t_1:EnableVoice()
	-- upvalues: name (ref)
	name:trace("Enabling voice")
	self.AvatarChatService:GetPropertyChangedSignal("ClientFeatures"):Once(function()
		-- upvalues: self (ref)
		self.attemptVoiceRejoin:Fire()
	end)
	self.AvatarChatService:EnableVoice()
end

function t_1:ChangeVoiceJoinProgress(p20)
	self.VoiceJoinProgress = p20
	self.VoiceJoinProgressChanged:Fire(self.VoiceJoinProgress)
end

function t_1:setOptions(p20)
	self.options = p20
end

function t_1:ShouldShowJoinVoiceOnDisconnect()
	-- upvalues: VOICE_JOIN_PROGRESS (ref)
	return self:IsSeamlessVoice() and self.VoiceJoinProgress == VOICE_JOIN_PROGRESS.Suspended
end

function t_1:IsSeamlessVoice()
	-- upvalues: getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (ref), getFFlagCheckUniversePlaceBeforeSuspending (ref), constantsModule (ref)
	if getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() and not self.options.allowSeamlessVoice then
		return false
	end
	local var13 = self:FetchAgeVerificationOverlay()
	
	if type(var13) ~= "table" or not var13 or not var13.voiceSettings then
		return false
	elseif getFFlagCheckUniversePlaceBeforeSuspending() and not self:verifyUniverseAndPlaceCanUseVoice() then
		return false
	end
	local seamlessVoiceStatus = var13.voiceSettings.seamlessVoiceStatus
	
	return if seamlessVoiceStatus ~= constantsModule.SeamlessVoiceStatus.EnabledExistingUser then seamlessVoiceStatus == constantsModule.SeamlessVoiceStatus.EnabledNewUser else true
end

function t_1:HasSeamlessVoiceFeature(p20)
	-- upvalues: getFFlagEnableSeamlessVoiceFeatureModule (ref), utilsModule (ref), constantsModule (ref)
	if not self.options.allowSeamlessVoice or not self:verifyUniverseAndPlaceCanUseVoice() then
		return false
	end
	local var13 = self:FetchAgeVerificationOverlay()
	
	if not self:_isValidAgeVerificationOverlayData(var13) then
		return false
	end
	local seamlessVoiceVariant = var13.voiceSettings.seamlessVoiceVariant
	
	if not seamlessVoiceVariant then
		return false
	elseif getFFlagEnableSeamlessVoiceFeatureModule() then
		if type(p20) == "string" then
			p20 = { p20 }
		end
		if not getFFlagEnableSeamlessVoiceFeatureModule(p20) then
		end
		local t = {}
		
		for i, v in pairs(utilsModule.jsonDecode(seamlessVoiceVariant)) do
			t[v] = true
		end
		if #p20 == 1 and p20[1] == constantsModule.SeamlessVoiceFeatures.ConnectDisconnect and seamlessVoiceVariant == constantsModule.SeamlessVoiceVariants.OnlyConnectDisconnect then
			return true
		end
		for i, v_1 in pairs(p20) do
			if not t[v_1] then
				return false
			end
		end
		return true
	else
		local var14 = ({
			[constantsModule.SeamlessVoiceFeatures.ConnectDisconnect] = function(p21)
				-- upvalues: constantsModule (copy)
				return p21 ~= constantsModule.SeamlessVoiceVariants.Control
			end,
			[constantsModule.SeamlessVoiceFeatures.HearingWithoutMicPermissions] = function(p21)
				-- upvalues: constantsModule (copy)
				return p21 == constantsModule.SeamlessVoiceVariants.HearingWithoutMicPermissions
			end
		})[p20]
		
		return if var14 then var14(seamlessVoiceVariant) else false
	end
end

function t_1:IsNewSeamlessVoiceUserDisconnect()
	-- upvalues: constantsModule (ref)
	if not self.options.allowSeamlessVoice or not self:verifyUniverseAndPlaceCanUseVoice() then
		return false
	end
	local var15 = self:FetchAgeVerificationOverlay()
	
	if not self:_isValidAgeVerificationOverlayData(var15) then
		return false
	elseif var15.voiceSettings.seamlessVoiceStatus == constantsModule.SeamlessVoiceStatus.EnabledNewUser then
		local ok, status = pcall(function()
			-- upvalues: self (ref), constantsModule (copy)
			return self.AppStorageService:GetItem(constantsModule.SEAMLESS_VOICE_FTUX_KEY)
		end)
		
		return ok and status == "false"
	end
	return false
end

function t_1._isValidAgeVerificationOverlayData(_, p21)
	return type(p21) == "table" and (p21 and p21.voiceSettings)
end

function t_1:UserInInExperienceUpsellTreatment()
	-- upvalues: constantsModule (ref)
	local var15 = self:FetchAgeVerificationOverlay()
	
	if not var15 then
		return false
	end
	local showVoiceInExperienceUpsellVariant = var15.showVoiceInExperienceUpsellVariant
	
	return if showVoiceInExperienceUpsellVariant ~= constantsModule.IN_EXP_UPSELL_VARIANT.VARIANT1 then if showVoiceInExperienceUpsellVariant ~= constantsModule.IN_EXP_UPSELL_VARIANT.VARIANT2 then showVoiceInExperienceUpsellVariant == constantsModule.IN_EXP_UPSELL_VARIANT.VARIANT3 else true else true
end

function t_1:UserOnlyEligibleForVoice()
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

function t_1:UserOnlyEligibleForVoiceViaOverlay()
	local var15 = self:FetchAgeVerificationOverlay()
	
	return if self:_isValidAgeVerificationOverlayData(var15) then var15.voiceSettings.isVerifiedForVoice and (not var15.voiceSettings.isVoiceEnabled and var15.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice) else false
end

function t_1:UserVoiceEnabled()
	local communicationPermissionsResult = self.communicationPermissionsResult
	
	return if communicationPermissionsResult and communicationPermissionsResult.voiceSettings and communicationPermissionsResult.universePlaceVoiceEnabledSettings then communicationPermissionsResult.voiceSettings.isVoiceEnabled and communicationPermissionsResult.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice else false
end

function t_1:UserEligibleForInExperienceUpsell()
	-- upvalues: getFFlagEnableVoiceSignal (ref)
	local var15 = self:UserOnlyEligibleForVoice()
	
	if not var15 then
		return false
	elseif getFFlagEnableVoiceSignal() then
		return var15 and self:UserInInExperienceUpsellTreatment()
	end
	local var16 = self:FetchAgeVerificationOverlay()
	
	return var15 and (var16 and var16.showVoiceInExperienceUpsell)
end

function t_1:canUseServiceAsync()
	-- upvalues: name (ref), promiseModule (ref), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (ref), getFFlagEnableVoiceSignal (ref), VOICE_JOIN_PROGRESS (ref), VOICE_CHAT_AVAILABILITY (ref), voiceChatService (ref), consoleVoiceIXPEnabled (ref), IXPServiceWrapper (ref), consoleVoiceIXPLayerName (ref), consoleVoiceEnabledIXPLayerValue (ref)
	if self.available == nil and game:GetEngineFeature("VoiceChatSupported") then
		if not self.canUseServicePromise then
			self.canUseServicePromise = promiseModule.defer(function(p21, p22)
				-- upvalues: self (ref), getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice (copy), getFFlagEnableVoiceSignal (copy), VOICE_JOIN_PROGRESS (copy), name (copy), VOICE_CHAT_AVAILABILITY (copy), voiceChatService (copy), consoleVoiceIXPEnabled (copy), IXPServiceWrapper (copy), consoleVoiceIXPLayerName (copy), consoleVoiceEnabledIXPLayerValue (copy)
				local var15 = self:userAndPlaceCanUseVoice()
				
				if getFFlagFixSeamlessVoiceIntegrationWithPrivateVoice() then
					self.canUseServiceResult = var15
					self:emit("OnCanUseServiceResult", var15)
				end
				if getFFlagEnableVoiceSignal() and self.VoiceJoinProgress == VOICE_JOIN_PROGRESS.Suspended then
					name:debug("Place is voice enabled but user is not, delaying voice rejection")
					self.attemptVoiceRejoin.Event:Wait()
					name:debug("Attempting voice rejoin")
					self.communicationPermissionsResult.voiceSettings.isVoiceEnabled = true
					self.userEligible = true
					self.initializedPostSuspension = true
					p21()
					self:ChangeVoiceJoinProgress(VOICE_JOIN_PROGRESS.Joining)
					
					return
				elseif var15 then
					if game:GetEngineFeature("VoiceChatEnabledRccProperties") and (not voiceChatService.VoiceChatEnabledForUniverseOnRcc or not voiceChatService.VoiceChatEnabledForPlaceOnRcc) then
						name:debug("Disabling voice chat due to RCC Response. Universe: {}, Place: {}", voiceChatService.VoiceChatEnabledForUniverseOnRcc, voiceChatService.VoiceChatEnabledForPlaceOnRcc)
						
						if not voiceChatService.VoiceChatEnabledForUniverseOnRcc then
							self:_reportJoinFailed("universeNotEnabled")
						elseif not voiceChatService.VoiceChatEnabledForPlaceOnRcc then
							self:_reportJoinFailed("placeNotEnabled")
						end
						self.available = VOICE_CHAT_AVAILABILITY.PlaceNotAvailable
						
						if self.options.passInitErrorInPromiseReject then
							p22({ code = "INIT_ERROR_PLACE_NOT_AVAILABLE" })
							
							return
						end
						p22()
						
						return
					elseif not consoleVoiceIXPEnabled then
						self.userEligible = true
						p21()
						
						return
					end
					IXPServiceWrapper:WaitForInitialization()
					local ok, status = pcall(function()
						-- upvalues: IXPServiceWrapper (copy), consoleVoiceIXPLayerName (copy)
						return IXPServiceWrapper:GetLayerData(consoleVoiceIXPLayerName)
					end)
					
					if ok and status and status[consoleVoiceEnabledIXPLayerValue] ~= nil then
						self.userEligible = status[consoleVoiceEnabledIXPLayerValue]
						IXPServiceWrapper:LogUserLayerExposure(consoleVoiceIXPLayerName)
					end
					if self.userEligible then
						p21()
						
						return
					elseif self.options.passInitErrorInPromiseReject then
						p22({ code = "INIT_ERROR_IXP_NOT_ELIGIBLE" })
						
						return
					end
					p22()
					
					return
				else
					name:info("Voice access denied")
					self.available = VOICE_CHAT_AVAILABILITY.UserNotAvailable
					
					if self.options.passInitErrorInPromiseReject then
						p22({ code = "INIT_ERROR_USER_NOT_AVAILABLE" })
						
						return
					end
					p22()
				end
			end):andThen(function()
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

function t_1:_setRecentUserState(p21, p22)
	-- upvalues: cryoModule (ref)
	self.recentUsersInteractionData = cryoModule.Dictionary.join(self.recentUsersInteractionData, {
		[tostring(p21)] = cryoModule.Dictionary.join(self.recentUsersInteractionData[tostring(p21)] or {}, p22)
	})
end

function t_1:getRecentUsersInteractionData()
	self:_updateRecentUsersInteractionData()
	
	return self.recentUsersInteractionData
end

function t_1:GetSignalREvent(p21)
	return self.SignalREventTable[p21].Event
end

function t_1:StartModerationSignal()
	-- upvalues: name (ref), getFFlagVoiceChatClientRewriteMasterLua (ref), voiceChatService (ref)
	if not self.playerModeratedConnection then
		self.playerModeratedConnection = self:GetSignalREvent("ParticipantModeratedFromVoice"):Connect(function()
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

function t_1:StopModerationSignal()
	if self.playerModeratedConnection then
		self.playerModeratedConnection:Disconnect()
		self.playerModeratedConnection = nil
	end
end

function t_1:_updateRecentUsersInteractionData()
	-- upvalues: stringKeyFixForParticipantsTable (ref), getFFlagClearUserFromRecentVoiceDataOnLeaveModule (ref), playersService (ref), getFIntVoiceUsersInteractionExpiryTimeSecondsModule (ref), cryoModule (ref)
	local timestamp = os.time()
	local t = {}
	
	if self.recentUsersInteractionData then
		for i, v in pairs(self.recentUsersInteractionData) do
			local var15 = if stringKeyFixForParticipantsTable then self.participants[tostring(i)] else self.participants[i]
			
			if getFIntVoiceUsersInteractionExpiryTimeSecondsModule() <= timestamp - v.lastHeardTime and (not var15 or var15.isMuted) or getFFlagClearUserFromRecentVoiceDataOnLeaveModule() and not playersService:GetPlayerByUserId(tonumber(i)) then
				t[i] = cryoModule.None
			end
		end
		self.recentUsersInteractionData = cryoModule.Dictionary.join(self.recentUsersInteractionData, t)
	end
end

function t_1:SetupParticipantListeners()
	-- upvalues: name (ref), getFFlagClearUserFromRecentVoiceDataOnLeaveModule (ref), stringKeyFixForParticipantsTable (ref), getFFlagFixGetPlayerByUserIdStringCastModule (ref), playersService (ref), voiceChatService (ref), fFlagEnablePartyVoiceChangersInLua (ref), getFFlagBatchVoiceParticipantsUpdatesModule (ref), var7 (ref), getFFlagVoiceChatClientRewriteMasterLua (ref), stopModerationConnectionOnLeave (ref), var5 (ref), disableRejoinGroupIdDoubleRead (ref), voiceVolumeControlsEnableVoiceVolumeEligibilityTelemetry (ref), getFFlagDisconnectToastClientRewrite (ref), var6 (ref), voiceVolumeControlsApplyGameSettingsVoiceVolumeEngineFeature (ref), getFFlagEnableVoiceSignal (ref), VOICE_JOIN_PROGRESS (ref), voiceVolumeControlsEligibilityModule (ref), getFFlagCoreMicManagerRefactorModule (ref), var4 (ref), MIN_VOICE_CHAT_API_VERSION_LOCAL_MIC_ACTIVITY (ref), getFFlagLocalMutedNilFix (ref), var2 (ref), getFFlagLuaConsumePlayerModeratedModule (ref), getFFlagEnableVoiceReverseNudgeModule (ref), utilsModule (ref), t (ref)
	self:ensureInitialized("setup participant listeners")
	
	if not self.participants then
		self.participants = {}
		self.recentUsersInteractionData = {}
		self.updatedParticipants = {}
		self.participantConnection = self.service.ParticipantsStateChanged:Connect(function(p21, p22, p23)
			-- upvalues: name (copy), getFFlagClearUserFromRecentVoiceDataOnLeaveModule (copy), self (ref), stringKeyFixForParticipantsTable (copy), getFFlagFixGetPlayerByUserIdStringCastModule (copy), playersService (copy), voiceChatService (copy), fFlagEnablePartyVoiceChangersInLua (copy), getFFlagBatchVoiceParticipantsUpdatesModule (copy), var7 (copy)
			name:trace("Participants state changed")
			
			for i, v in ipairs(p21) do
				if not getFFlagClearUserFromRecentVoiceDataOnLeaveModule() and not self.participants[tostring(v)].isMuted then
					self:_setRecentUserState(v, { lastHeardTime = os.time() })
				end
				self.participants[tostring(v)] = nil
				self.participantLeft:Fire(self.participants, v)
				self:emit("OnVoiceParticipantRemoved", v)
			end
			for i, v_1 in ipairs(p22) do
				self.participantJoined:Fire(self.participants, v_1)
				self:emit("OnVoiceParticipantAdded", v_1)
			end
			for i, v_2 in pairs(p23) do
				local userId = v_2.userId
				local var16 = if stringKeyFixForParticipantsTable then self.participants[tostring(userId)] else self.participants[userId]
				
				if not v_2.isMuted or var16 and not var16.isMuted then
					self:_setRecentUserState(userId, {
						lastHeardTime = os.time(),
						player = if getFFlagFixGetPlayerByUserIdStringCastModule() then playersService:GetPlayerByUserId(tonumber(userId)) else playersService:GetPlayerByUserId(userId)
					})
				end
				if not var16 or var16.isMuted ~= v_2.isMuted then
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
				if var7 and self.CaptureService:IsCapturingVideo() then
					self.voiceCapturedDuringVideoCapture = self.voiceCapturedDuringVideoCapture or v_2.isSignalActive
				end
			end
			self:_updateRecentUsersInteractionData()
			
			if self.shouldThrottleParticipantUpdate then
				local currentTime = tick()
				
				if self.participantsStateThrottleTime <= currentTime - self.lastParticipantsStateUpdate and #p23 > 0 then
					self.lastParticipantsStateUpdate = currentTime
					self.participantsUpdate:Fire(if getFFlagBatchVoiceParticipantsUpdatesModule() then self.updatedParticipants else self.participants)
					self.updatedParticipants = {}
					
					return
				elseif #p23 > 0 then
					local var17 = self.participantsStateThrottleTime - (currentTime - self.lastParticipantsStateUpdate)
					self.lastStateUpdateCounter = (self.lastStateUpdateCounter + 1) % 100
					local lastStateUpdateCounter = self.lastStateUpdateCounter
					task.wait(var17)
					
					if lastStateUpdateCounter == self.lastStateUpdateCounter then
						self.participantsUpdate:Fire(if getFFlagBatchVoiceParticipantsUpdatesModule() then self.updatedParticipants else self.participants)
						self.updatedParticipants = {}
						
						return
					end
				end
			elseif #p23 > 0 then
				self.participantsUpdate:Fire(if getFFlagBatchVoiceParticipantsUpdatesModule() then self.updatedParticipants else self.participants)
				self.updatedParticipants = {}
			end
		end)
		
		local function onStateChanged(p24, p25)
			-- upvalues: self (ref), getFFlagVoiceChatClientRewriteMasterLua (copy), name (copy), stopModerationConnectionOnLeave (copy), var5 (copy), disableRejoinGroupIdDoubleRead (copy), voiceVolumeControlsEnableVoiceVolumeEligibilityTelemetry (copy), getFFlagDisconnectToastClientRewrite (copy), var6 (copy), voiceVolumeControlsApplyGameSettingsVoiceVolumeEngineFeature (copy), getFFlagEnableVoiceSignal (copy), VOICE_JOIN_PROGRESS (copy), voiceVolumeControlsEligibilityModule (copy), voiceChatService (copy)
			self:emit("OnStateChanged", p24, p25)
			local var18 = p25 == Enum.VoiceChatState.Failed
			local var19 = p25 == Enum.VoiceChatState.Joining
			local var20 = p25 == Enum.VoiceChatState.Leaving
			local var21 = p25 == Enum.VoiceChatState.Ended
			local var22 = self.service:IsPublishPaused()
			
			if var22 ~= self.localMuted and not var18 and (not var19 and not var20) and not var21 then
				self.localMuted = var22
				self.muteChanged:Fire(var22)
			elseif var19 or var20 or var21 then
				self.localMuted = nil
			end
			if getFFlagVoiceChatClientRewriteMasterLua() and p25 == Enum.VoiceChatState.Joined and (self.isInCall and var22 ~= self.callMutedState) then
				name:debug("In call, setting local muted to call muted state {}", self.callMutedState)
				self:ToggleMic("InitInCall")
			end
			if stopModerationConnectionOnLeave and p25 == Enum.VoiceChatState.Joined then
				self:StartModerationSignal()
			end
			if var5 and p25 == Enum.VoiceChatState.Joined then
				self:_syncLocalAudioDeviceActive()
			end
			if p25 == Enum.VoiceChatState.Leaving then
				if not disableRejoinGroupIdDoubleRead or not self.previousGroupId then
					self.previousGroupId = self.service:GetGroupId()
				end
				self.previousMutedState = self.service:IsPublishPaused()
			end
			if p25 == Enum.VoiceChatState.Ended or var18 then
				self.participants = {}
				self.localMuted = nil
				
				if voiceVolumeControlsEnableVoiceVolumeEligibilityTelemetry then
					self._voiceVolumeEligibilityReported = false
				end
				self.participantsUpdate:Fire(self.participants)
				
				if stopModerationConnectionOnLeave then
					self:StopModerationSignal()
				end
				if var5 then
					self:_syncLocalAudioDeviceActive()
				end
				if var18 then
					name:debug("State Changed to Failed. Reason: {}", self.service:GetAndClearCallFailureMessage())
				end
				if p24 == Enum.VoiceChatState.Joining or p24 == Enum.VoiceChatState.JoiningRetry or p24 == Enum.VoiceChatState.Joined then
					if p25 == Enum.VoiceChatState.Ended then
						name:debug("State Changed to Ended from {}", p24)
					end
					if not getFFlagDisconnectToastClientRewrite() or not self:IsSeamlessVoice() or self:GetVoiceConnectCookieValue() then
						self:emit("OnRetryRequested")
					end
				end
				if var6 and voiceVolumeControlsApplyGameSettingsVoiceVolumeEngineFeature then
					self:ReportVoiceVolumeImpressionsIfNeeded()
				end
			end
			if getFFlagEnableVoiceSignal() and self.VoiceJoinProgress == VOICE_JOIN_PROGRESS.Joining and p25 == Enum.VoiceChatState.Joined then
				self:ChangeVoiceJoinProgress(VOICE_JOIN_PROGRESS.Joined)
				self:emit("OnVoiceJoin")
			end
			if var6 and voiceVolumeControlsApplyGameSettingsVoiceVolumeEngineFeature and p25 == Enum.VoiceChatState.Joined then
				self._voiceJoinTimestampMs = DateTime.now().UnixTimestampMillis
				self._voiceVolumeSliderEligibleAtJoin = voiceVolumeControlsEligibilityModule.isVoiceChatVolumeSliderVisible(true, voiceChatService.UseNewAudioApi)
			end
			if voiceVolumeControlsEnableVoiceVolumeEligibilityTelemetry and voiceVolumeControlsApplyGameSettingsVoiceVolumeEngineFeature and (p25 == Enum.VoiceChatState.Joined and not self._voiceVolumeEligibilityReported) then
				local ok, status = pcall(function()
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
		elseif var4 and voiceChatService.UseNewAudioApi then
			if not self.localMeteringTask then
				self.localMeteringTask = task.spawn(function()
					-- upvalues: self (ref)
					while true do
						self:UpdateLocalMetering()
						task.wait()
					end
				end)
			end
		elseif MIN_VOICE_CHAT_API_VERSION_LOCAL_MIC_ACTIVITY <= self.service:GetVoiceChatApiVersion() then
			self.micConnection = self.service.PlayerMicActivitySignalChange:Connect(function(p24)
				-- upvalues: var7 (copy), self (ref), getFFlagLocalMutedNilFix (copy), var2 (copy)
				if var7 and self.CaptureService:IsCapturingVideo() then
					self.voiceCapturedDuringVideoCapture = self.voiceCapturedDuringVideoCapture or p24.isActive
				end
				self.isTalking = p24.isActive
				
				if getFFlagLocalMutedNilFix() then
					if self.localMuted ~= false then return end
					if var2 then
						self:FireTalkingChangedDebounced(self.isTalking)
						
						return
					end
					self.talkingChanged:Fire(self.isTalking)
					
					return
				elseif not self.localMuted then
					if var2 then
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
			self.playerModeratedConnection = self.service.LocalPlayerModerated:connect(function()
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
		self.voiceToxicityModalConnection = self:GetSignalREvent("VoiceToxicityModal"):Connect(function(p24)
			-- upvalues: self (ref)
			self.Analytics:reportReceivedNudge(p24, self:GetNudgeAnalyticsData())
			self:emit("OnVoiceToxicityModal")
		end)
		self.VoiceToxicityToastConnection = self:GetSignalREvent("VoiceToxicityToast"):Connect(function(p24)
			-- upvalues: self (ref)
			self.Analytics:reportReceivedNudge(p24, self:GetNudgeAnalyticsData())
			self:emit("OnVoiceToxicityToast")
		end)
		
		if getFFlagEnableVoiceReverseNudgeModule() then
			name:trace("Setting up voice reverse nudge handlers")
			self.voiceReverseNudgeConnection = self:GetSignalREvent("VoiceReverseNudgeIconColorChange"):Connect(function(p24)
				-- upvalues: self (ref)
				self:emit("OnVoiceReverseNudgeIconColorChange", p24)
			end)
		end
		self.blockConnection = self.BlockStatusChanged:Connect(function(p24, p25)
			-- upvalues: self (ref), name (copy), utilsModule (copy)
			if p25 then
				if self.participants[tostring(p24)] then
					name:debug("Blocking {}", utilsModule.shorten(p24))
					self.service:SubscribeBlock(p24)
					
					return
				end
			else
				name:debug("UnBlocking {}", utilsModule.shorten(p24))
				self.service:SubscribeUnblock(p24)
			end
		end)
		
		if voiceChatService.UseNewAudioApi then
			self:hookupAudioDeviceInputListener()
		end
		if self.service.TempSetMicMutedToggleMic then
			self.tempSetMicMutedToggleMicConnection = self.service.TempSetMicMutedToggleMic:connect(function()
				-- upvalues: self (ref)
				self:ToggleMic("TempSetMicMutedToggleMic")
			end)
		end
		if var7 then
			self.videoCaptureInProgressConnection = self.CaptureService.VideoCaptureInProgress:connect(function(p24)
				-- upvalues: self (ref), t (copy)
				if p24 then
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

local var18 = nil

function t_1.CheckAudioInputExists(p24)
	-- upvalues: name (ref), var18 (write), promiseModule (ref), cryoModule (ref)
	name:trace("Checking for AudioDeviceInput")
	
	if not var18 then
		var18 = promiseModule.new(function(p25, _)
			-- upvalues: cryoModule (copy), p24 (ref), name (copy)
			if #cryoModule.Dictionary.keys(p24.audioDevices) > 0 then
				name:trace("Found existing AudioDeviceInput")
				p25()
				
				return
			end
			p24.audioDeviceInputAdded.Event:Connect(function()
				-- upvalues: name (copy), p25 (ref)
				name:trace("Found new AudioDeviceInput")
				p25()
			end)
		end)
	end
	return var18
end

function t_1:checkAndUpdateSequence(p24, p25)
	if not p25 then
		return 0
	elseif not self.SequenceNumbers[p24] then
		self.SequenceNumbers[p24] = p25
		
		return 0
	end
	local var19 = p25 - self.SequenceNumbers[p24]
	
	if var19 > 0 then
		self.SequenceNumbers[p24] = p25
	end
	return var19 - 1
end

local function _(value)
	-- upvalues: coreGuiService (ref)
	return value:IsDescendantOf(coreGuiService)
end

function t_1:onInstanceAdded(p24)
	-- upvalues: fFlagExpChatDictation (ref), coreGuiService (ref), name (ref)
	if p24:IsA("AudioDeviceInput") then
		if fFlagExpChatDictation and p24:IsDescendantOf(coreGuiService) then return end
		name:debug("Found new audio device instance for {}", p24.Player and p24.Player.Name)
		self.audioDevices[p24] = self:CreateAudioDeviceData(p24)
		self:emit("OnAudioDeviceInputAdded")
		self:StartAnalysis(p24)
	end
end

function t_1:GetSendMuteEvent()
	-- upvalues: robloxReplicatedStorageService (ref)
	if not self.SendMuteEvent then
		self.SendMuteEvent = robloxReplicatedStorageService:WaitForChild("SetUserActive", 10)
	end
	return self.SendMuteEvent
end

function t_1:GetToggleVoiceChangerEvent()
	-- upvalues: replicatedStorageService (ref)
	if not self.SendVoiceChangerEvent then
		self.SendVoiceChangerEvent = replicatedStorageService:WaitForChild("ToggleUserVoiceChanger", 10)
	end
	return self.SendVoiceChangerEvent
end

function t_1:GetInputToModifierWire()
	-- upvalues: playersService (ref)
	if not self.InputToModifierWire then
		self.InputToModifierWire = playersService.LocalPlayer:FindFirstChild("InputToModifier")
	end
	return self.InputToModifierWire
end

function t_1:GetPartyVoiceDeviceInput()
	-- upvalues: playersService (ref)
	if not self.PartyVoiceDeviceInput then
		self.PartyVoiceDeviceInput = playersService.LocalPlayer:FindFirstChild("PartyVoiceDeviceInput")
	end
	return self.PartyVoiceDeviceInput
end

function t_1:GetSetVoicePackEvent()
	-- upvalues: replicatedStorageService (ref)
	if not self.SetVoicePackEvent then
		self.SetVoicePackEvent = replicatedStorageService:WaitForChild("SetVoicePack", 10)
	end
	return self.SetVoicePackEvent
end

function t_1:GetVoiceChangerWasToggledEvent()
	-- upvalues: replicatedStorageService (ref)
	if not self.VoiceChangerWasToggledEvent then
		self.VoiceChangerWasToggledEvent = replicatedStorageService:WaitForChild("VoiceChangerWasToggled", 3)
	end
	return self.VoiceChangerWasToggledEvent
end

local _ = function(p24, p25)
	local wire = Instance.new("Wire")
	wire.SourceInstance = p24
	wire.TargetInstance = p25
	wire.Parent = p25
	
	return wire
end

local _ = function()
	-- upvalues: robloxReplicatedStorageService (ref)
	return robloxReplicatedStorageService
end

function t_1.GetAnalyzer(_, p24)
	-- upvalues: robloxReplicatedStorageService (ref)
	local text = p24.Name .. "_Analyzer"
	local var19 = robloxReplicatedStorageService:FindFirstChild(text)
	
	if not var19 then
		var19 = Instance.new("AudioAnalyzer")
		var19.SpectrumEnabled = false
		var19.Name = text
		var19.Parent = robloxReplicatedStorageService
	end
	return var19
end

local _ = function(p24)
	return math.log10(p24) * 20
end

function t_1:IsSignalActive(p24)
	-- upvalues: var4 (ref), playersService (ref)
	if not var4 then
		return false
	end
	local var19 = playersService:GetPlayerByUserId(p24)
	
	return if var19 then math.log10(self:GetAnalyzer(var19).PeakLevel) * 20 > -36 else false
end

function t_1.StopAnalysis(_, p24)
	-- upvalues: var4 (ref), robloxReplicatedStorageService (ref)
	if not var4 then return end
	for i, v in p24:GetConnectedWires("Output") do
		local targetInstance = v.TargetInstance
		
		if targetInstance and targetInstance:IsDescendantOf(robloxReplicatedStorageService) then
			v:Destroy()
		end
	end
end

function t_1:StartAnalysis(p25)
	-- upvalues: var4 (ref)
	if not var4 then return end
	self:StopAnalysis(p25)
	local player = p25.Player
	
	if player then
		local var19 = self:GetAnalyzer(player)
		local wire = Instance.new("Wire")
		wire.SourceInstance = p25
		wire.TargetInstance = var19
		wire.Parent = var19
		
		return
	end
end

function t_1.GetVoiceConnectCookie(p25)
	-- upvalues: constantsModule (ref)
	local ok, status = pcall(function()
		-- upvalues: p25 (ref), constantsModule (copy)
		return p25.AppStorageService:GetItem(constantsModule.VOICE_CONNECT_DISCONNECT_KEY_V3)
	end)
	
	return if ok and status then status else ""
end

function t_1.GetVoiceConnectCookieValue(p25)
	-- upvalues: getFFlagEnableVoiceUxUpdates (ref), constantsModule (ref)
	if getFFlagEnableVoiceUxUpdates() then
		local ok, status = pcall(function()
			-- upvalues: p25 (ref), constantsModule (copy)
			return p25.AppStorageService:GetItem(constantsModule.VOICE_CONNECT_DISCONNECT_KEY_V3)
		end)
		
		return if ok then status == "true" else true
	end
	local ok, status = pcall(function()
		-- upvalues: p25 (ref), constantsModule (copy)
		return p25.AppStorageService:GetItem(constantsModule.VOICE_CONNECT_DISCONNECT_KEY_V2)
	end)
	
	return if ok then status == "true" else true
end

function t_1.SetVoiceConnectCookieValue(value, p25)
	-- upvalues: getFFlagEnableVoiceUxUpdates (ref), constantsModule (ref)
	return if getFFlagEnableVoiceUxUpdates() then pcall(function()
		-- upvalues: value (ref), constantsModule (copy), p25 (ref)
		value.AppStorageService:SetItem(constantsModule.VOICE_CONNECT_DISCONNECT_KEY_V3, tostring(p25))
		value.AppStorageService:Flush()
	end) else pcall(function()
		-- upvalues: value (ref), constantsModule (copy), p25 (ref)
		value.AppStorageService:SetItem(constantsModule.VOICE_CONNECT_DISCONNECT_KEY_V2, tostring(p25))
		value.AppStorageService:Flush()
	end)
end

function t_1.GetVoiceRewarmCookie(p25)
	-- upvalues: constantsModule (ref), name (ref)
	local ok, status = pcall(function()
		-- upvalues: p25 (ref), constantsModule (copy)
		return p25.AppStorageService:GetItem(constantsModule.VOICE_REWARM_KEY)
	end)
	
	if ok and status then
		name:debug("Got voice re-warm cookie: {}", status)
		
		return status
	end
	name:debug("Voice re-warm cookie not set, returning empty string")
	
	return ""
end

function t_1.SetVoiceRewarmCookie(value, p25)
	-- upvalues: name (ref), constantsModule (ref)
	name:debug("Setting voice re-warm cookie to {}", p25)
	pcall(function()
		-- upvalues: value (ref), constantsModule (copy), p25 (ref)
		value.AppStorageService:SetItem(constantsModule.VOICE_REWARM_KEY, tostring(p25))
		value.AppStorageService:Flush()
	end)
end

function t_1:ShouldRewarmUser()
	return self:GetVoiceRewarmCookie() == ""
end

function t_1:RewarmUser()
	self:SetVoiceRewarmCookie("true")
end

function t_1.SetNewUserFTUXCookieValue(value, p25)
	-- upvalues: constantsModule (ref)
	return pcall(function()
		-- upvalues: value (ref), constantsModule (copy), p25 (ref)
		value.AppStorageService:SetItem(constantsModule.SEAMLESS_VOICE_FTUX_KEY, tostring(p25))
		value.AppStorageService:Flush()
	end)
end

function t_1:SetAndSyncActive(p25, p26)
	-- upvalues: getFFlagCoreMicManagerRefactorModule (ref), playersService (ref)
	if getFFlagCoreMicManagerRefactorModule() then
		return self.micManager:SetAndSyncActive(p25, p26)
	end
	p25.Active = p26
	local sendMuteEvent = self:GetSendMuteEvent()
	
	if sendMuteEvent and p25.Player == playersService.LocalPlayer then
		sendMuteEvent:FireServer(p26)
	end
end

function t_1:CreateAudioDeviceData(p25)
	-- upvalues: playersService (ref), enableMutedByLocalUserEngineFeature (ref), name (ref), var1 (ref), fFlagDebugShowAudioDeviceInputDebugger (ref), var5 (ref), voiceChatService (ref)
	local t = {}
	local var19 = p25.Player == playersService.LocalPlayer
	
	if enableMutedByLocalUserEngineFeature then
		if not p25.MutedByLocalUser then
			if self.muteAll and not var19 then
				p25.MutedByLocalUser = true
			end
			if p25.Player and self.mutedPlayers[p25.Player.UserId] then
				p25.MutedByLocalUser = true
			end
		end
	elseif p25.Active then
		if self.muteAll and not var19 then
			p25.Active = false
		end
		if p25.Player and self.mutedPlayers[p25.Player.UserId] then
			p25.Active = false
		end
	end
	if p25.Active and var19 and self.localMuted == nil then
		self:SetAndSyncActive(p25, false)
	end
	if var19 and self.localMuted ~= nil and (self.localMuted ~= not p25.Active and not self.isInCall) then
		name:debug("Mismatch between LocalMuted and device.Active")
		local var20 = not self.localMuted
		p25.Active = var20
		local sendMuteEvent = self:GetSendMuteEvent()
		
		if sendMuteEvent then
			sendMuteEvent:FireServer(var20)
		end
	elseif self.isInCall and var19 then
		local var21 = not self.callMutedState
		name:debug("Overwriting Active State to match Iris call. .Active = {}", var21)
		p25.Active = var21
		local sendMuteEvent = self:GetSendMuteEvent()
		
		if sendMuteEvent then
			sendMuteEvent:FireServer(var21)
		end
	end
	t.onPlayerChanged = p25:GetPropertyChangedSignal("Player"):Connect(function()
		-- upvalues: var1 (copy), var19 (write), p25 (ref), playersService (copy), self (ref), name (copy), enableMutedByLocalUserEngineFeature (copy)
		if var1 then
			var19 = p25.Player == playersService.LocalPlayer
			
			if var19 then
				if p25.Active and self.localMuted == nil then
					name:debug("Player is still in connecting state, setting Active to false")
					self:SetAndSyncActive(p25, false)
				elseif self.localMuted ~= nil and self.localMuted ~= not p25.Active then
					name:debug("Mismatch between LocalMuted and device.Active")
					self:SetAndSyncActive(p25, not self.localMuted)
				end
			elseif self.muteAll or p25.Player and self.mutedPlayers[p25.Player.UserId] then
				if enableMutedByLocalUserEngineFeature then
					p25.MutedByLocalUser = true
				else
					p25.Active = false
				end
			end
		end
		self:emit("OnDevicePlayerChanged")
		self:StartAnalysis(p25)
	end)
	t.onMutedChanged = p25:GetPropertyChangedSignal("Muted"):Connect(function()
		-- upvalues: self (ref)
		self:emit("OnDeviceMuteChanged")
	end)
	
	if not enableMutedByLocalUserEngineFeature then
		t.onActiveChanged = p25:GetPropertyChangedSignal("Active"):Connect(function()
			-- upvalues: self (ref), var19 (write), p25 (ref)
			self:emit("OnDeviceActiveChanged")
			
			if self.muteAll and not var19 then
				p25.Active = false
			end
			if p25.Player and self.mutedPlayers[p25.Player.UserId] then
				p25.Active = false
			end
		end)
	elseif fFlagDebugShowAudioDeviceInputDebugger then
		t.onActiveChanged = p25:GetPropertyChangedSignal("Active"):Connect(function()
			-- upvalues: self (ref)
			self:emit("OnDeviceActiveChanged")
		end)
		t.onMutedByLocalUserChanged = p25:GetPropertyChangedSignal("MutedByLocalUser"):Connect(function()
			-- upvalues: self (ref)
			self:emit("OnDeviceMutedByLocalUserChanged")
		end)
	end
	if var5 and voiceChatService.UseNewAudioApi then
		t.onActiveChangedDisconnectGuard = p25:GetPropertyChangedSignal("Active"):Connect(function()
			-- upvalues: p25 (ref), playersService (copy), self (ref)
			if p25.Active and p25.Player == playersService.LocalPlayer and self.localMuted == nil then
				self:SetAndSyncActive(p25, false)
			end
		end)
	end
	return t
end

function t_1:onInstanceRemove(p25)
	-- upvalues: fFlagExpChatDictation (ref), coreGuiService (ref), name (ref), enableMutedByLocalUserEngineFeature (ref), fFlagDebugShowAudioDeviceInputDebugger (ref), var4 (ref)
	if p25:IsA("AudioDeviceInput") then
		if fFlagExpChatDictation and p25:IsDescendantOf(coreGuiService) then return end
		self:StopAnalysis(p25)
		name:trace("Removing AudioDeviceInput {} {} {}", p25, "for user", p25.Player and p25.Player.UserId)
		local var19 = self.audioDevices[p25]
		
		if var19 then
			if not enableMutedByLocalUserEngineFeature then
				var19.onActiveChanged:Disconnect()
			elseif fFlagDebugShowAudioDeviceInputDebugger then
				if var19.onActiveChanged then
					var19.onActiveChanged:Disconnect()
				end
				if var19.onMutedByLocalUserChanged then
					var19.onMutedByLocalUserChanged:Disconnect()
				end
			end
			var19.onMutedChanged:Disconnect()
			var19.onPlayerChanged:Disconnect()
			
			if var19.onActiveChangedDisconnectGuard then
				var19.onActiveChangedDisconnectGuard:Disconnect()
			end
		end
		self.audioDevices[p25] = nil
		self:emit("OnAudioDeviceInputRemoved")
		
		if var4 and p25.Player then
			self:GetAnalyzer(p25.Player):Destroy()
		end
	end
end

function t_1:hookupAudioDeviceInputListener()
	-- upvalues: name (ref), playersService (ref), soundService (ref), voiceChatService (ref), collectionService (ref), utilsModule (ref)
	name:debug("Hooking up audio device listeners")
	local localPlayer = playersService.LocalPlayer
	soundService.AudioInstanceAdded:Connect(function(p25)
		-- upvalues: self (ref)
		self:onInstanceAdded(p25)
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
	game.DescendantRemoving:Connect(function(p25)
		-- upvalues: self (ref)
		self:onInstanceRemove(p25)
	end)
	
	for i, v in game:GetDescendants() do
		self:onInstanceAdded(v)
	end
	playersService.PlayerRemoving:Connect(function(p25)
		-- upvalues: self (ref)
		for i in self.audioDevices do
			if i.Player and i.Player == p25 then
				self:onInstanceRemove(i)
			end
		end
	end)
end

function t_1.RejoinCurrentChannel(p25)
	-- upvalues: name (ref)
	pcall(function()
		-- upvalues: p25 (ref), name (copy)
		local groupId = p25.service:GetGroupId()
		
		if groupId and groupId ~= "" then
			local var19 = p25.service:IsPublishPaused()
			p25.service:Leave()
			name:debug("Rejoining current channel {}", groupId)
			p25.participants = {}
			p25.participantsUpdate:Fire(p25.participants)
			
			if not p25.service:JoinByGroupIdToken(groupId, var19, true) then
				p25:emit("OnInitialJoinFailed")
			end
		end
	end)
end

function t_1.RejoinChannel(p25, p26, p27)
	-- upvalues: name (ref)
	name:debug("Rejoining previous channel {} with mute status {}", p26, p27)
	
	if p26 and p26 ~= "" then
		pcall(function()
			-- upvalues: p25 (ref), p26 (ref), p27 (ref)
			p25.service:Leave()
			p25.participants = {}
			p25.participantsUpdate:Fire(p25.participants)
			
			if not p25.service:JoinByGroupIdToken(p26, p27, true) then
				p25:emit("OnInitialJoinFailed")
			end
		end)
	end
end

function t_1:RejoinVoice()
	-- upvalues: getFFlagVoiceChatClientRewriteMasterLua (ref), name (ref), voiceChatService (ref)
	if getFFlagVoiceChatClientRewriteMasterLua() then
		name:debug("Rejoining voice")
		self.participants = {}
		self.participantsUpdate:Fire(self.participants)
		voiceChatService:rejoinVoice()
	end
end

function t_1:watchSignalR()
	-- upvalues: WATCHED_NAMESPACES (ref), utilsModule (ref), name (ref)
	self.signalRConnection = self.NotificationService.RobloxEventReceived:Connect(function(p25)
		-- upvalues: WATCHED_NAMESPACES (copy), utilsModule (copy), self (ref), name (copy)
		local namespace = p25.namespace
		
		if not WATCHED_NAMESPACES[namespace] then return end
		local var19 = utilsModule.jsonDecode(p25.detail)
		local type = self.SignalREventTable[var19.type]
		
		if type then
			type:Fire(var19)
		end
		local sequenceNumber = var19.SequenceNumber
		name:trace("SignalR message {}: {}", namespace, sequenceNumber)
		local var20 = self:checkAndUpdateSequence(namespace, sequenceNumber)
		
		if var20 > 0 then
			self.Analytics:reportReconnectDueToMissedSequence()
			
			return
		elseif var20 < -1 then
			self.Analytics:reportOutOfOrderSequence()
		end
	end)
	self.signalRConnectionChanged = self.NotificationService.RobloxConnectionChanged:Connect(function(p25, p26, _, p27)
		-- upvalues: name (copy), utilsModule (copy), WATCHED_NAMESPACES (copy), self (ref)
		if p25 == "signalR" then
			if p26 ~= Enum.ConnectionState.Connected then
				name:info("SignalR disconnected")
				
				return
			end
			for i, v in pairs(utilsModule.jsonDecode(p27)) do
				if WATCHED_NAMESPACES[i] then
					name:trace("SignalR message {}: {}", i, v)
					local var19 = self:checkAndUpdateSequence(i, v)
					
					if var19 > 0 then
						self.Analytics:reportReconnectDueToMissedSequence()
					elseif var19 < -1 then
						self.Analytics:reportOutOfOrderSequence()
					end
				end
			end
		end
	end)
end

function t_1:StopSignalRConnection()
	if self.signalRConnectionChanged then
		self.signalRConnectionChanged:Disconnect()
		self.signalRConnectionChanged = nil
	end
	if self.signalRConnection then
		self.signalRConnection:Disconnect()
		self.signalRConnection = nil
	end
end

function t_1:getService()
	return self.service
end

function t_1:ToggleMic(p25)
	-- upvalues: getFFlagCoreMicManagerRefactorModule (ref), name (ref), getFFlagJoinWithoutMicPermissions (ref), PERMISSION_STATE (ref), permissionsProtocol (ref), voiceChatService (ref), playersService (ref)
	self:ensureInitialized("toggle mic")
	
	if getFFlagCoreMicManagerRefactorModule() then
		return self.micManager:SetMicActive(self.micManager.localMuted, p25)
	elseif self.localMuted == nil then
		name:trace("ToggleMic context: {} - Voice not connected yet", p25)
		
		return
	end
	name:trace("ToggleMic context: {}", p25)
	
	if getFFlagJoinWithoutMicPermissions() then
		if self.permissionState == PERMISSION_STATE.PENDING_MIC then
			name:debug("In pending mic mode, requesting permission")
			self:emit("GetPermissions", function(p26)
				-- upvalues: self (ref), PERMISSION_STATE (copy), name (copy), p25 (ref)
				self.permissionState = if p26.hasMicPermissions then PERMISSION_STATE.LISTEN_AND_TALK else PERMISSION_STATE.LISTEN_ONLY
				name:debug("Got permissions, setting state to {}", self.permissionState)
				self:ToggleMic(p25)
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
			local var19 = not self.localMuted
			name:trace("Setting self mute to {} context: {}", var19, p25)
			local sendMuteEvent = self:GetSendMuteEvent()
			
			if sendMuteEvent then
				sendMuteEvent:FireServer(var19)
				
				for i in self.audioDevices do
					if i.Player and i.Player == playersService.LocalPlayer then
						i.Active = var19
					end
				end
				self.muteChanged:Fire(self.localMuted)
			else
				name:error("Could not find SendMuteEvent")
			end
		else
			local var20 = not self.service:IsPublishPaused()
			name:trace("Setting self mute to {} context: {}", var20, p25)
			self.service:PublishPause(var20)
			self.localMuted = var20
			self.muteChanged:Fire(var20)
		end
		if not self.localMuted then
			self.talkingChanged:Fire(self.isTalking)
			self:emit("OnShowDataConsentToast")
		end
		if p25 then
			self.Analytics:reportVoiceMuteSelf(self:JoinWithVoiceMuteData({ context = p25, muted = self.localMuted }))
		end
	end
end

function t_1:ToggleVoiceChanger(_)
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

function t_1:ToggleVoiceChangerHearMyself(_)
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

function t_1:SetVoicePack(p26)
	-- upvalues: voiceChatService (ref), name (ref)
	self:ensureInitialized("set voice pack")
	
	if self.localMuted == nil then return end
	if voiceChatService.UseNewAudioApi then
		self.currentVoicePack = p26
		name:trace("setting current voice pack to {}", self.currentVoicePack)
		local setVoicePackEvent = self:GetSetVoicePackEvent()
		
		if setVoicePackEvent then
			setVoicePackEvent:FireServer("VoicePack_" .. self.currentVoicePack)
			
			return
		end
		name:error("Could not find SetVoicePackEvent")
	end
end

function t_1:JoinWithVoiceMuteData(p26)
	-- upvalues: playersService (ref), cryoModule (ref)
	return cryoModule.Dictionary.join({
		userId = playersService.LocalPlayer.UserId,
		clientSessionId = self:GetSessionId(),
		channelId = self:GetChannelId()
	}, p26)
end

function t_1:_reportJoinFailed(p26, p27)
	self.Analytics:reportVoiceChatJoinResult(false, p26, p27)
	self:emit("OnReportJoinFailed", p26)
end

function t_1:_syncLocalAudioDeviceActive()
	-- upvalues: getFFlagCoreMicManagerRefactorModule (ref), voiceChatService (ref), playersService (ref)
	if getFFlagCoreMicManagerRefactorModule() then
		return self.micManager:SyncLocalAudioDeviceActive()
	elseif not voiceChatService.UseNewAudioApi then return end
	local var21 = if self.localMuted == nil then false else not self.localMuted
	
	for i in self.audioDevices do
		if i.Player and i.Player == playersService.LocalPlayer then
			i.Active = var21
		end
	end
end

function t_1:_setupEarlyAudioDeviceGuard()
	-- upvalues: getFFlagCoreMicManagerRefactorModule (ref), voiceChatService (ref), fFlagExpChatDictation (ref), coreGuiService (ref), playersService (ref), soundService (ref)
	if getFFlagCoreMicManagerRefactorModule() then
		return self.micManager:SetupEarlyAudioDeviceGuard()
	end
	local function _(p26)
		-- upvalues: voiceChatService (copy), fFlagExpChatDictation (copy), coreGuiService (copy), playersService (copy), self (ref)
		return voiceChatService.UseNewAudioApi and (not (fFlagExpChatDictation and p26:IsDescendantOf(coreGuiService)) and (p26.Player == playersService.LocalPlayer and (p26.Active and self.localMuted == nil)))
	end
	
	local function guardDevice(p26)
		-- upvalues: voiceChatService (copy), fFlagExpChatDictation (copy), coreGuiService (copy), playersService (copy), self (ref)
		if voiceChatService.UseNewAudioApi and (not (fFlagExpChatDictation and p26:IsDescendantOf(coreGuiService)) and (p26.Player == playersService.LocalPlayer and (p26.Active and self.localMuted == nil))) then
			p26.Active = false
		end
		p26:GetPropertyChangedSignal("Player"):Connect(function()
			-- upvalues: p26 (ref), voiceChatService (copy), fFlagExpChatDictation (copy), coreGuiService (copy), playersService (copy), self (copy)
			local var22 = p26
			
			if voiceChatService.UseNewAudioApi and (not (fFlagExpChatDictation and var22:IsDescendantOf(coreGuiService)) and (var22.Player == playersService.LocalPlayer and (var22.Active and self.localMuted == nil))) then
				p26.Active = false
			end
		end)
		p26:GetPropertyChangedSignal("Active"):Connect(function()
			-- upvalues: p26 (ref), voiceChatService (copy), fFlagExpChatDictation (copy), coreGuiService (copy), playersService (copy), self (copy)
			local var22 = p26
			
			if voiceChatService.UseNewAudioApi and (not (fFlagExpChatDictation and var22:IsDescendantOf(coreGuiService)) and (var22.Player == playersService.LocalPlayer and (var22.Active and self.localMuted == nil))) then
				p26.Active = false
			end
		end)
	end
	
	soundService.AudioInstanceAdded:Connect(function(p26)
		-- upvalues: guardDevice (ref)
		if p26:IsA("AudioDeviceInput") then
			guardDevice(p26)
		end
	end)
	
	for i, v in game:GetDescendants() do
		if v:IsA("AudioDeviceInput") then
			guardDevice(v)
		end
	end
end

function t_1:_asyncInit()
	-- upvalues: var5 (ref), name (ref), MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED (ref), getFFlagVoiceChatClientRewriteMasterLua (ref), voiceChatService (ref), analyticsModule (ref), promiseModule (ref)
	self:CheckCallState()
	
	if var5 then
		self:_setupEarlyAudioDeviceGuard()
	end
	return self:canUseServiceAsync():andThen(function(_)
		-- upvalues: name (copy), MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED (copy), self (ref), getFFlagVoiceChatClientRewriteMasterLua (copy), voiceChatService (copy), analyticsModule (copy), promiseModule (copy)
		local var22 = "VoiceChatService"
		
		if game:GetEngineFeature("UseNewVoiceChatService") then
			var22 = "VoiceChatInternal"
			name:debug("Using VoiceChatInternal")
		end
		local ok, status = pcall(function()
			-- upvalues: var22 (write), MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED (copy), self (copy)
			local var23 = game:GetService(var22)
			
			if var23 and (var23:GetVoiceChatApiVersion() < MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED or var23:IsContextVoiceEnabled()) then
				self.voiceEnabled = true
				self.service = var23
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

function t_1:UpdateLocalMetering()
	-- upvalues: getFFlagCoreMicManagerRefactorModule (ref), playersService (ref), var2 (ref)
	if getFFlagCoreMicManagerRefactorModule() then
		return self.micManager:UpdateLocalMetering()
	end
	self.isTalking = self:IsSignalActive(playersService.LocalPlayer.UserId)
	
	if self.localMuted == false then
		if var2 then
			self:FireTalkingChangedDebounced(self.isTalking)
			
			return
		end
		self.talkingChanged:Fire(self.isTalking)
	end
end

function t_1:FireTalkingChangedDebounced(p26)
	-- upvalues: getFFlagCoreMicManagerRefactorModule (ref), var3 (ref)
	if getFFlagCoreMicManagerRefactorModule() then
		return self.micManager:FireTalkingChangedDebounced(p26)
	end
	local var22 = tick() * 1000
	
	if p26 ~= self._lastTalkingChangedFireValue or var3 < var22 - self._lastTalkingChangedFireTime then
		self._lastTalkingChangedFireTime = var22
		self._lastTalkingChangedFireValue = p26
		self.talkingChanged:Fire(p26)
	end
end

function t_1:asyncInit()
	-- upvalues: name (ref), promiseModule (ref), constantsModule (ref), getFFlagCoreMicManagerRefactorModule (ref), fFlagEnablePartyVoiceChangersInLua (ref), stringKeyFixForParticipantsTable (ref)
	if self.service then
		name:trace("Manager already initialized")
		
		return promiseModule.resolve()
	elseif not self.initPromise then
		self.initPromise = self:_asyncInit()
		
		if self.AdService then
			(function(value)
				-- upvalues: constantsModule (copy), getFFlagCoreMicManagerRefactorModule (copy)
				local var22 = false
				value.AdService.RewardedVideoAdStarted:Connect(function()
					-- upvalues: value (ref), var22 (write), constantsModule (copy), getFFlagCoreMicManagerRefactorModule (copy)
					if value.localMuted == nil then return end
					var22 = value.localMuted
					
					if not value.localMuted then
						value:ToggleMic(constantsModule.REWARDED_VIDEO_AD_STARTED)
					end
					value.isPlayerWatchingAd = true
					
					if getFFlagCoreMicManagerRefactorModule() then
						value.micManager:SetAdMuteBlocked(true)
					end
				end)
				value.AdService.RewardedVideoAdEnded:Connect(function()
					-- upvalues: value (ref), getFFlagCoreMicManagerRefactorModule (copy), var22 (write), constantsModule (copy)
					if value.localMuted == nil then return end
					value.isPlayerWatchingAd = false
					
					if getFFlagCoreMicManagerRefactorModule() then
						value.micManager:SetAdMuteBlocked(false)
					end
					if var22 ~= value.localMuted then
						value:ToggleMic(constantsModule.REWARDED_VIDEO_AD_ENDED)
					end
				end)
			end)(self)
		end
		if fFlagEnablePartyVoiceChangersInLua and not self.voiceChangerWasToggledEvent then
			task.spawn(function()
				-- upvalues: self (ref), stringKeyFixForParticipantsTable (copy)
				local voiceChangerWasToggledEvent = self:GetVoiceChangerWasToggledEvent()
				
				if voiceChangerWasToggledEvent then
					voiceChangerWasToggledEvent.OnClientEvent:Connect(function(p26, p27)
						-- upvalues: stringKeyFixForParticipantsTable (copy), self (copy)
						local var22 = if stringKeyFixForParticipantsTable then self.participants[tostring(p26)] else self.participants[p26]
						
						if var22 then
							var22.isVoiceChangerActive = p27
							self.voiceChangerActivePlayers[p26] = p27
							self.participantsUpdate:Fire(self.participants)
						end
					end)
				end
			end)
		end
	end
	return self.initPromise
end

function t_1:IsInitialized()
	return self.service
end

function t_1:ensureInitialized(p26)
	if not self.service then
		error("[corescripts VCS Manager] " .. "Attempting to " .. p139 .. " before calling init")
	end
end

function t_1:GetSessionId()
	self:ensureInitialized("get session id")
	
	return self.service:GetSessionId()
end

function t_1:GetChannelId()
	self:ensureInitialized("get channel id")
	
	return self.service:GetChannelId()
end

function t_1:Disconnect()
	-- upvalues: getFFlagCoreMicManagerRefactorModule (ref), var7 (ref)
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
	if var7 and self.videoCaptureInProgressConnection then
		self.videoCaptureInProgressConnection:Disconnect()
		self.videoCaptureInProgressConnection = nil
	end
end

function t_1.RequestHidePublicVoiceUI(p26)
	task.defer(function()
		-- upvalues: p26 (ref)
		p26.setVoiceUIVisibility:Fire(false)
	end)
end

function t_1.RequestShowPublicVoiceUI(p26)
	task.defer(function()
		-- upvalues: p26 (ref)
		p26.setVoiceUIVisibility:Fire(true)
	end)
end

t_1.default = t_1.new(blockingUtilityModule:GetAfterBlockedStatusChangedEvent(), permissionsProtocol.default, httpRbxApiService, nil, nil, nil, nil, nil, thirdPartyUserService, nil, adService)

if var6 and voiceVolumeControlsApplyGameSettingsVoiceVolumeEngineFeature then
	local localPlayer = playersService.LocalPlayer
	
	if localPlayer then
		localPlayer.AncestryChanged:Connect(function(_, p26)
			-- upvalues: t_1 (ref)
			if p26 == nil then
				t_1.default:ReportVoiceVolumeImpressionsIfNeeded()
			end
		end)
	end
end
return t_1