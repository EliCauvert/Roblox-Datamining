local RunService = game:GetService("RunService")
local Parent = script.Parent
local Parent1 = Parent.Parent
local Players = game:GetService("Players")
local CollectionService = game:GetService("CollectionService")
local SoundService = game:GetService("SoundService")
local VoiceChatService = game:GetService("VoiceChatService")
local HttpService = game:GetService("HttpService")
local HttpRbxApiService = game:GetService("HttpRbxApiService")
local AppStorageService = game:GetService("AppStorageService")
local NotificationService = game:GetService("NotificationService")
local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local IXPServiceWrapper = require(Parent1.IXPServiceWrapper).IXPServiceWrapper
local Players1 = game:GetService("Players")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local ThirdPartyUserService = game:GetService("ThirdPartyUserService")
local AdService = game:GetService("AdService")
local Chat = game:GetService("Chat")
local ConstantsModule = require(script.Parent.Constants)
local UtilsModule = require(script.Parent.Utils)
local Flags = script.Parent.Flags
local AnalyticsModule = require(script.Parent.Analytics)
local Requests = script.Parent.Requests
local PromiseModule = require(Parent1.Promise)
local CryoModule = require(Parent1.Cryo)
local Default = require(Parent1.CallProtocol).CallProtocol.default
local Enums = require(Parent1.CallProtocol).Enums
local PermissionsProtocol = require(Parent1.PermissionsProtocol).PermissionsProtocol
local BlockingUtilityModule = require(Parent1.BlockingUtility)
local CoreGui = game:GetService("CoreGui")
local NewResult = require(Parent1.CoreScriptsInitializer).CoreLogger:new(script.Name)
local StringKeyFixForParticipantsTable = game:DefineFastFlag("StringKeyFixForParticipantsTable", false)
local ShowJoinVoiceRaceConditionFix = game:DefineFastFlag("ShowJoinVoiceRaceConditionFix", false)
local ConsoleVoiceIXPEnabled = game:DefineFastFlag("ConsoleVoiceIXPEnabled", false)
local FFlagExpChatDictation = require(Parent1.SharedFlags).FFlagExpChatDictation
local ConsoleVoiceIXPLayerName = game:DefineFastString("ConsoleVoiceIXPLayerName", "User.Communication.ConsoleVoice")
local ConsoleVoiceEnabledIXPLayerValue = game:DefineFastString("ConsoleVoiceEnabledIXPLayerValue", "ConsoleVoiceEnabled")
local GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoiceFunction = require(Parent1.SharedFlags).GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice
local GetFFlagLuaConsumePlayerModeratedModule = require(Flags.GetFFlagLuaConsumePlayerModerated)
local GetFFlagLocalMutedNilFixFunction = require(Parent1.SharedFlags).GetFFlagLocalMutedNilFix
local GetFFlagEnableVoiceReverseNudgeModule = require(Flags.GetFFlagEnableVoiceReverseNudge)
local GetFFlagClearUserFromRecentVoiceDataOnLeaveModule = require(Flags.GetFFlagClearUserFromRecentVoiceDataOnLeave)
local GetFIntVoiceUsersInteractionExpiryTimeSecondsModule = require(Flags.GetFIntVoiceUsersInteractionExpiryTimeSeconds)
local GetFFlagAvatarChatServiceEnabledFunction = require(Parent1.SharedFlags).GetFFlagAvatarChatServiceEnabled
local GetFFlagVoiceChatServiceManagerUseAvatarChatModule = require(Flags.GetFFlagVoiceChatServiceManagerUseAvatarChat)
local GetFFlagJoinWithoutMicPermissionsFunction = require(Parent1.SharedFlags).GetFFlagJoinWithoutMicPermissions
local GetFFlagBatchVoiceParticipantsUpdatesModule = require(Flags.GetFFlagBatchVoiceParticipantsUpdates)
local GetFIntThrottleParticipantsUpdateMsModule = require(Flags.GetFIntThrottleParticipantsUpdateMs)
local GetFFlagSeamlessVoiceFTUXFunction = require(Parent1.SharedFlags).GetFFlagSeamlessVoiceFTUX
local GetFFlagNonVoiceFTUXFunction = require(Parent1.SharedFlags).GetFFlagNonVoiceFTUX
local GetFFlagEnableFtuxExitOnMuteToggleModule = require(Flags.GetFFlagEnableFtuxExitOnMuteToggle)
local GetFFlagEnableExpJoinMicPermAnalyticsModule = require(Flags.GetFFlagEnableExpJoinMicPermAnalytics)
local GetFFlagEnableSeamlessVoiceFeatureModule = require(Flags.GetFFlagEnableSeamlessVoiceFeature)
local GetFFlagFixGetPlayerByUserIdStringCastModule = require(Flags.GetFFlagFixGetPlayerByUserIdStringCast)
local FFlagDebugShowAudioDeviceInputDebugger = require(Parent1.SharedFlags).GetFFlagDebugShowAudioDeviceInputDebugger()
local VoicePerformanceThrottlingIXPLayerName = game:DefineFastString("VoicePerformanceThrottlingIXPLayerName", "Voice.Performance")
local ThrottleParticipantsUpdateIXPLayerValue = game:DefineFastString("ThrottleParticipantsUpdateIXPLayerValue", "ThrottleParticipantsUpdate")
local v1 = require(Flags.GetFFlagUseAudioAnalyzerForLocalMetering2)()
local StopModerationConnectionOnLeave = game:DefineFastFlag("StopModerationConnectionOnLeave", false)
local v2 = require(Flags.GetFFlagDeactivateAudioDeviceOnVoiceLeave)()
local DisableRejoinGroupIdDoubleRead = game:DefineFastFlag("DisableRejoinGroupIdDoubleRead", false)
local VoiceVolumeControlsApplyGameSettingsVoiceVolumeEngineFeature = game:GetEngineFeature("VoiceVolumeControlsApplyGameSettingsVoiceVolume")
local VoiceVolumeControlsEnableVoiceVolumeEligibilityTelemetry = game:DefineFastFlag("VoiceVolumeControlsEnableVoiceVolumeEligibilityTelemetry", false)
local v3 = require(Flags.GetFFlagVoiceVolumeControlsEnableVoiceVolumeImpressionsTelemetry)()
local VoiceVolumeControlsEligibilityModule = require(Parent.VoiceVolumeControlsEligibility)
local EnableMutedByLocalUserEngineFeature = game:GetEngineFeature("EnableMutedByLocalUser")
local VoiceChatMuteAllSyncMutedPlayers = game:DefineFastFlag("VoiceChatMuteAllSyncMutedPlayers", false)
local RbxAnalyticsServiceExposePlaySessionIdEngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local GetFFlagEnableVoiceChatMuteForVideoCapturesFunction = require(Parent1.SharedFlags).GetFFlagEnableVoiceChatMuteForVideoCaptures
local FFlagEnableVoiceChatMuteForVideoCaptures = game:DefineFastFlag("SendVoiceCapturedDuringVideoCaptureEvent", false) and GetFFlagEnableVoiceChatMuteForVideoCapturesFunction()
local GetFFlagDebugVoiceChatMicPermissionCliBypassModule = require(Flags.GetFFlagDebugVoiceChatMicPermissionCliBypass)
local GetFFlagEnableVoiceSignalFunction = require(Parent1.SharedFlags).GetFFlagEnableVoiceSignal
local GetFFlagEnableInExpPhoneVoiceUpsellEntrypointsFunction = require(Parent1.SharedFlags).GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints
local GetFFlagVoiceChatClientRewriteMasterLuaFunction = require(Parent1.SharedFlags).GetFFlagVoiceChatClientRewriteMasterLua
local GetFFlagCheckUniversePlaceBeforeSuspendingFunction = require(Parent1.SharedFlags).GetFFlagCheckUniversePlaceBeforeSuspending
local GetFFlagDisconnectToastClientRewriteFunction = require(Parent1.SharedFlags).GetFFlagDisconnectToastClientRewrite
local FFlagEnablePartyVoiceChangersInLua = require(Parent1.SharedFlags).FFlagEnablePartyVoiceChangersInLua
local FFlagSkipVoiceInTeamCreateViewerModule = require(Flags.FFlagSkipVoiceInTeamCreateViewer)
local GetFFlagEnableVoiceUxUpdatesFunction = require(Parent1.SharedFlags).GetFFlagEnableVoiceUxUpdates
local GetFFlagCoreMicManagerRefactorModule = require(Flags.GetFFlagCoreMicManagerRefactor)
local GetFFlagMicConsumerRegistryModule = require(Flags.GetFFlagMicConsumerRegistry)
local MicInputManagerModule = if GetFFlagCoreMicManagerRefactorModule() then require(script.Parent.MicInputManager) else nil
local WATCHEDNAMESPACES = ConstantsModule.WATCHED_NAMESPACES
local WATCHEDMESSAGETYPES = ConstantsModule.WATCHED_MESSAGE_TYPES
local VOICECHATAVAILABILITY = ConstantsModule.VOICE_CHAT_AVAILABILITY
local MINVOICECHATAPIVERSIONISCONTEXTENABLED = ConstantsModule.MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED
local MINVOICECHATAPIVERSIONLOCALMICACTIVITY = ConstantsModule.MIN_VOICE_CHAT_API_VERSION_LOCAL_MIC_ACTIVITY
local PERMISSIONSTATE = ConstantsModule.PERMISSION_STATE
local VOICEJOINPROGRESS = ConstantsModule.VOICE_JOIN_PROGRESS
local FAEENABLED = ConstantsModule.FAE_ENABLED
local FAESETTINGSTOAST = ConstantsModule.FAE_SETTINGS_TOAST
local GetShowAgeVerificationOverlayModule = require(Requests.GetShowAgeVerificationOverlay)
local GetShowPhoneVerificationUpsellModule = require(Requests.GetShowPhoneVerificationUpsell)
local config = {
	eventName = "VoiceCapturedDuringVideoCapture",
	description = "Event fired when a video capture has stopped logging if voice was captured",
	links = "",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("VoiceCapturedDuringVideoCaptureThrottlingPercentage", 10000),
	lastUpdated = { 26, 1, 28 }
}
local config1 = {
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
	permissionState = if GetFFlagJoinWithoutMicPermissionsFunction() then PERMISSIONSTATE.IDLE else nil,
	recentUsersInteractionData = nil,
	NotificationService = NotificationService,
	PermissionsService = PermissionsProtocol.default,
	ChatService = Chat,
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
	attemptVoiceRejoin = Instance.new("BindableEvent"),
	onPlayerMuteToggled = Instance.new("BindableEvent"),
	setVoiceUIVisibility = Instance.new("BindableEvent"),
	communicationPermissionsResult = nil,
	VoiceJoinProgress = VOICEJOINPROGRESS.Idle,
	VoiceJoinProgressChanged = Instance.new("BindableEvent"),
	_voiceVolumeEligibilityReported = false,
	mutedPlayers = {},
	voiceChangerActivePlayers = {},
	BlockStatusChanged = nil,
	AvatarChatService = if GetFFlagAvatarChatServiceEnabledFunction() then game:GetService("AvatarChatService") else nil,
	HttpRbxApiService = HttpRbxApiService,
	ThirdPartyUserService = ThirdPartyUserService,
	CaptureService = if GetFFlagEnableVoiceChatMuteForVideoCapturesFunction() then game:GetService("CaptureService") else nil,
	TelemetryService = if FFlagEnableVoiceChatMuteForVideoCaptures then game:GetService("TelemetryService") else nil,
	SendMuteEvent = nil,
	SetVoicePackEvent = nil,
	VoiceChangerWasToggledEvent = nil,
	InputToModifierWire = nil,
	PartyVoiceDeviceInput = nil,
	_mutedAnyone = false,
	canUseServiceResult = nil,
	signalRConnectionChanged = nil,
	signalRConnection = nil,
	AdService = AdService,
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
local config2 = {
	localMuted = true,
	isTalking = true,
	permissionState = true
}

function config1.__index(p1, p2)
	-- upvalues: GetFFlagCoreMicManagerRefactorModule (copy), config2 (copy), config1 (copy)
	if GetFFlagCoreMicManagerRefactorModule() then
		local RawValue = rawget(p1, "micManager")
		
		if RawValue and config2[p2] then
			return RawValue[p2]
		end
	end
	return config1[p2]
end

function config1.__newindex(p1, Key, p2)
	-- upvalues: GetFFlagCoreMicManagerRefactorModule (copy), config2 (copy)
	if GetFFlagCoreMicManagerRefactorModule() then
		local RawValue = rawget(p1, "micManager")
		
		if RawValue and config2[Key] then
			RawValue[Key] = p2
			
			return
		end
	end
	rawset(p1, Key, p2)
end

function config1.new(BlockStatusChanged, PermissionsService, HttpRbxApiService, Service, BlockStatusChanged1, NotificationService, AvatarChatService, p1, ThirdPartyUserService, CaptureService, AdService)
	-- upvalues: UtilsModule (copy), AnalyticsModule (copy), AppStorageService (copy), config1 (copy), WATCHEDMESSAGETYPES (copy), GetFIntThrottleParticipantsUpdateMsModule (copy), Players1 (copy), NewResult (copy), IXPServiceWrapper (copy), VoicePerformanceThrottlingIXPLayerName (copy), ThrottleParticipantsUpdateIXPLayerValue (copy), GetFFlagCoreMicManagerRefactorModule (copy), MicInputManagerModule (copy), FFlagEnableVoiceChatMuteForVideoCaptures (copy), GetFFlagMicConsumerRegistryModule (copy)
	local self = setmetatable({
		previousSessionId = nil,
		HttpRbxApiService = HttpRbxApiService,
		eventEmitter = UtilsModule.EventEmitter.new(),
		service = Service,
		PermissionsService = PermissionsService,
		NotificationService = NotificationService,
		AvatarChatService = AvatarChatService,
		Analytics = AnalyticsModule.new(BlockStatusChanged1),
		SequenceNumbers = {},
		SignalREventTable = {},
		audioDevices = {},
		BlockStatusChanged = BlockStatusChanged,
		AppStorageService = p1 or AppStorageService,
		ThirdPartyUserService = ThirdPartyUserService,
		CaptureService = CaptureService,
		AdService = AdService
	}, config1)
	
	for _, wATCHEDMESSAGETYPE in WATCHEDMESSAGETYPES do
		self.SignalREventTable[wATCHEDMESSAGETYPE] = Instance.new("BindableEvent")
	end
	self.shouldThrottleParticipantUpdate = false
	self.participantsStateThrottleTime = 0
	self.lastParticipantsStateUpdate = 0
	self.lastStateUpdateCounter = 0
	
	if GetFIntThrottleParticipantsUpdateMsModule() > 0 then
		task.spawn(function()
			-- upvalues: Players1 (upval), Service (copy), NewResult (upval), IXPServiceWrapper (upval), VoicePerformanceThrottlingIXPLayerName (upval)
			local Success, Result = pcall(function()
				-- upvalues: Players1 (upval), Service (upval)
				return if Players1.LocalPlayer then Service:IsVoiceEnabledForUserIdAsync(Players1.LocalPlayer.UserId) else false
			end)
			
			if not Success then
				NewResult:debug("Unable to get voice enabled status: ", Result)
				
				return
			end
			if Result then
				IXPServiceWrapper:LogUserLayerExposure(VoicePerformanceThrottlingIXPLayerName)
			end
		end)
		self.participantsStateThrottleTime = GetFIntThrottleParticipantsUpdateMsModule() / 1000
		local Success, Result = pcall(function()
			-- upvalues: IXPServiceWrapper (upval), VoicePerformanceThrottlingIXPLayerName (upval)
			return IXPServiceWrapper:GetLayerData(VoicePerformanceThrottlingIXPLayerName)
		end)
		
		if Success and Result and Result[ThrottleParticipantsUpdateIXPLayerValue] then
			self.shouldThrottleParticipantUpdate = true
		end
	end
	if GetFFlagCoreMicManagerRefactorModule() then
		self.micManager = MicInputManagerModule.new({
			log = NewResult,
			callbacks = {
				emitGetPermissions = function(p2, p3, p4, p5)
					-- upvalues: self (copy)
					self:emit("GetPermissions", p2, p3, p4, p5)
				end,
				emitOnPermissionRequested = function()
					-- upvalues: self (copy)
					self:emit("OnPermissionRequested")
				end,
				emitOnRequestMicPermissionResolved = function()
					-- upvalues: self (copy)
					self:emit("OnRequestMicPermissionResolved")
				end,
				emitOnRequestMicPermissionRejected = function()
					-- upvalues: self (copy)
					self:emit("OnRequestMicPermissionRejected")
				end,
				emitOnShowDataConsentToast = function()
					-- upvalues: self (copy)
					self:emit("OnShowDataConsentToast")
				end,
				emitOnMicPermissionDeniedToast = function()
					-- upvalues: self (copy)
					self:emit("OnMicPermissionDeniedToast")
				end,
				emitOnMicFirstUnmutePrivacy = function()
					-- upvalues: self (copy)
					self:emit("OnMicFirstUnmutePrivacy")
				end,
				getAudioDevices = function()
					-- upvalues: self (copy)
					return self.audioDevices
				end,
				getSendMuteEvent = function()
					-- upvalues: self (copy)
					return self:GetSendMuteEvent()
				end,
				isSignalActive = function(UserId)
					-- upvalues: self (copy)
					return self:IsSignalActive(UserId)
				end,
				reportVoiceMuteSelf = function(p2)
					-- upvalues: self (copy)
					self.Analytics:reportVoiceMuteSelf(p2)
				end,
				getJoinWithVoiceMuteData = function(p2)
					-- upvalues: self (copy)
					return self:JoinWithVoiceMuteData(p2)
				end,
				recordExperienceJoinMicPerm = function(p2)
					-- upvalues: self (copy)
					self:RecordExperienceJoinMicPermissionStatus(p2)
				end,
				reportJoinFailed = function(p2, p3)
					-- upvalues: self (copy), AnalyticsModule (upval)
					self:_reportJoinFailed(p2, p3 or AnalyticsModule.ERROR)
				end,
				requestPermissions = function(p2)
					-- upvalues: self (copy)
					return self.PermissionsService:requestPermissions(p2)
				end,
				getPassInitErrorInPromiseReject = function()
					-- upvalues: self (copy)
					return self.options.passInitErrorInPromiseReject
				end,
				onVoiceCapturedDuringVideoCapture = function(p2)
					-- upvalues: FFlagEnableVoiceChatMuteForVideoCaptures (upval), self (copy)
					if FFlagEnableVoiceChatMuteForVideoCaptures and self.CaptureService:IsCapturingVideo() then
						self.voiceCapturedDuringVideoCapture = self.voiceCapturedDuringVideoCapture or p2
					end
				end,
				getService = function()
					-- upvalues: self (copy)
					return self.service
				end
			}
		})
		self.muteChanged = self.micManager.muteChanged
		self.talkingChanged = self.micManager.talkingChanged
		
		if GetFFlagMicConsumerRegistryModule() then
			self.hasConsumersChanged = self.micManager.hasConsumersChanged
			self.micManager:SetupDeveloperDeviceTracking()
		end
	end
	return self
end

function config1:emit(p2, ...)
	self.eventEmitter:emit(p2, ...)
end

function config1:subscribe(p2, p3)
	self.eventEmitter:addListener(p2, p3)
end

function config1:unsubscribe(p2, p3)
	self.eventEmitter:removeListener(p2, p3)
end

function config1:unsubscribeAll()
	self.eventEmitter:removeAllListeners()
end

function config1.CheckCallStateWithPromise(p2)
	-- upvalues: Default (copy), NewResult (copy), Enums (copy)
	return Default:getCallState():andThen(function(Result)
		-- upvalues: NewResult (upval), Enums (upval), p2 (copy)
		NewResult:trace("Got user call state")
		
		if Result.status ~= Enums.CallStatus.Idle.rawValue() and Result.status ~= Enums.CallStatus.Ringing.rawValue() then
			p2.isInCall = true
			p2.callMutedState = Result.muted
			NewResult:trace("Changing call muted state to {}", Result.muted)
		end
	end):catch(function(Err)
		-- upvalues: NewResult (upval)
		NewResult:trace("User not in call {}", Err)
	end)
end

function config1.CheckCallState(p2)
	-- upvalues: NewResult (copy), Default (copy), Enums (copy)
	NewResult:trace("Checking user call state")
	local Success, Result = pcall(function()
		-- upvalues: Default (upval), NewResult (upval), Enums (upval), p2 (copy)
		Default:getCallState():andThen(function(Result)
			-- upvalues: NewResult (upval), Enums (upval), p2 (upval)
			NewResult:trace("Got user call state")
			
			if Result.status ~= Enums.CallStatus.Idle.rawValue() and Result.status ~= Enums.CallStatus.Ringing.rawValue() then
				p2.isInCall = true
				p2.callMutedState = Result.muted
				NewResult:trace("Changing call muted state to {}", Result.muted)
			end
		end):catch(function(Err)
			-- upvalues: NewResult (upval)
			NewResult:trace("User not in call {}", Err)
		end)
	end)
	
	if not Success then
		NewResult:debug("Error checking user call state {}", Result)
	end
end

function config1._GetShowAgeVerificationOverlay(p2, p3)
	-- upvalues: GetShowAgeVerificationOverlayModule (copy), UtilsModule (copy)
	return GetShowAgeVerificationOverlayModule(UtilsModule.bind(p2, "GetRequest"), tostring(game.GameId), tostring(game.PlaceId), p3)
end

function config1:FetchAgeVerificationOverlay(p2)
	-- upvalues: PromiseModule (copy)
	if not self._getShowAgeVerificationOverlayResult then
		if not self._getShowAgeVerificationOverlayPromise then
			self._getShowAgeVerificationOverlayPromise = PromiseModule.new(function(Callback: (any) -> (), _)
				-- upvalues: self (copy), p2 (copy)
				self._getShowAgeVerificationOverlayResult = self:_GetShowAgeVerificationOverlay(p2)
				Callback(self._getShowAgeVerificationOverlayResult)
			end)
		end
		self._getShowAgeVerificationOverlayPromise:await()
	end
	return self._getShowAgeVerificationOverlayResult
end

function config1._GetShowPhoneVerificationUpsell(p2, p3, p4)
	-- upvalues: GetShowPhoneVerificationUpsellModule (copy), UtilsModule (copy)
	return (GetShowPhoneVerificationUpsellModule(UtilsModule.bind(p2, "GetRequest"), tostring(game.GameId), p3, p4))
end

function config1:FetchPhoneVerificationUpsell(EXITCONFIRMATIONPHONEUPSELLIXPLAYER, Timestamp, p2)
	-- upvalues: PromiseModule (copy), ConstantsModule (copy)
	if not self._getShowPhoneVerificationUpsellResult then
		self._getShowPhoneVerificationUpsellResult = {}
		self._getShowPhoneVerificationUpsellPromise = {}
	end
	if not self._getShowPhoneVerificationUpsellResult[EXITCONFIRMATIONPHONEUPSELLIXPLAYER] or p2 then
		if not self._getShowPhoneVerificationUpsellPromise[EXITCONFIRMATIONPHONEUPSELLIXPLAYER] or p2 then
			self._getShowPhoneVerificationUpsellPromise[EXITCONFIRMATIONPHONEUPSELLIXPLAYER] = PromiseModule.new(function(Callback: () -> (), _)
				-- upvalues: self (copy), EXITCONFIRMATIONPHONEUPSELLIXPLAYER (copy), Timestamp (copy), ConstantsModule (upval)
				local ShowPhoneVerificationUpsell = self:_GetShowPhoneVerificationUpsell(EXITCONFIRMATIONPHONEUPSELLIXPLAYER, Timestamp)
				self._getShowPhoneVerificationUpsellResult[EXITCONFIRMATIONPHONEUPSELLIXPLAYER] = if type(ShowPhoneVerificationUpsell) == "table" and ShowPhoneVerificationUpsell.valueProp ~= nil then ShowPhoneVerificationUpsell.valueProp else ConstantsModule.PHONE_UPSELL_VOICE_CHAT_PROP.None
				Callback()
			end)
		end
		self._getShowPhoneVerificationUpsellPromise[EXITCONFIRMATIONPHONEUPSELLIXPLAYER]:await()
	end
	return self._getShowPhoneVerificationUpsellResult[EXITCONFIRMATIONPHONEUPSELLIXPLAYER]
end

function config1:DisablePhoneVerificationUpsell()
	-- upvalues: CryoModule (copy), ConstantsModule (copy)
	self._getShowPhoneVerificationUpsellResult = CryoModule.Dictionary.map(self._getShowPhoneVerificationUpsellResult, function()
		-- upvalues: ConstantsModule (upval)
		return ConstantsModule.PHONE_UPSELL_VOICE_CHAT_PROP.None
	end)
end

function config1:GetNudgeAnalyticsData()
	-- upvalues: Players (copy)
	return Players.LocalPlayer.UserId, self:GetSessionId()
end

function config1:avatarChatUserAndPlaceSettingsValueOfClientFeatures(p2)
	-- upvalues: GetFFlagEnableVoiceSignalFunction (copy)
	return {
		universePlaceVoiceEnabledSettings = {
			isUniverseEnabledForVoice = self.AvatarChatService:IsEnabled(p2, Enum.AvatarChatServiceFeature.UniverseAudio),
			isPlaceEnabledForVoice = self.AvatarChatService:IsEnabled(p2, Enum.AvatarChatServiceFeature.PlaceAudio),
			isUniverseEnabledForAvatarVideo = self.AvatarChatService:IsEnabled(p2, Enum.AvatarChatServiceFeature.UniverseVideo),
			isPlaceEnabledForAvatarVideo = self.AvatarChatService:IsEnabled(p2, Enum.AvatarChatServiceFeature.PlaceVideo)
		},
		voiceSettings = {
			bannedUntil = nil,
			isUserEligible = self.AvatarChatService:IsEnabled(p2, Enum.AvatarChatServiceFeature.UserAudioEligible),
			isVoiceEnabled = self.AvatarChatService:IsEnabled(p2, Enum.AvatarChatServiceFeature.UserAudio),
			isAvatarVideoEligible = self.AvatarChatService:IsEnabled(p2, Enum.AvatarChatServiceFeature.UserVideoEligible),
			isAvatarVideoEnabled = self.AvatarChatService:IsEnabled(p2, Enum.AvatarChatServiceFeature.UserVideo),
			isUserVerifiedForVoice = if GetFFlagEnableVoiceSignalFunction() then self.AvatarChatService:IsEnabled(p2, Enum.AvatarChatServiceFeature.UserVerifiedForVoice) else nil,
			isBanned = self.AvatarChatService:IsEnabled(p2, Enum.AvatarChatServiceFeature.UserBanned)
		}
	}
end

function config1:resolveAvatarChatUserAndPlaceSettings()
	local Success, Result = pcall(self.AvatarChatService.GetClientFeaturesAsync, self.AvatarChatService)
	
	return if Success then self:avatarChatUserAndPlaceSettingsValueOfClientFeatures(Result) else nil
end

function config1.GetRequest(p2, ApiUrl, _)
	-- upvalues: HttpService (copy)
	local Success, Result = pcall(function()
		-- upvalues: p2 (copy), ApiUrl (copy), HttpService (upval)
		return HttpService:JSONDecode((p2.HttpRbxApiService:GetAsyncFullUrl(ApiUrl, Enum.ThrottlingPriority.Default, Enum.HttpRequestType.Players)))
	end)
	
	return Success and Result
end

function config1.PostUserVoiceConnectionStatus(p2, IsUserVoiceConnected)
	-- upvalues: HttpService (copy), ConstantsModule (copy)
	local Success, _ = pcall(function()
		-- upvalues: HttpService (upval), IsUserVoiceConnected (copy), p2 (copy), ConstantsModule (upval)
		return HttpService:JSONDecode((p2.HttpRbxApiService:PostAsyncFullUrl(ConstantsModule.VOICE_URL .. "/v1/user-voice-connection-state", (HttpService:JSONEncode({ IsUserVoiceConnected = IsUserVoiceConnected })))))
	end)
	
	return Success
end

function config1.GetVoiceAnalyticsData(p2)
	-- upvalues: RbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy), RbxAnalyticsService (copy)
	return {
		micAvailability = "",
		universeId = game.GameId,
		placeId = game.PlaceId,
		playSessionId = if RbxAnalyticsServiceExposePlaySessionIdEngineFeature then RbxAnalyticsService:GetPlaySessionId() else "",
		voiceSessionId = if p2.service then p2:GetSessionId() else ""
	}
end

function config1:RecordExperienceJoinMicPermissionStatus(p2)
	-- upvalues: PermissionsProtocol (copy), PERMISSIONSTATE (copy)
	local VoiceAnalyticsData = self:GetVoiceAnalyticsData()
	
	if p2 == nil or typeof(p2) ~= "table" then
		if self.permissionState then
			if self.permissionState == PERMISSIONSTATE.LISTEN_AND_TALK then
				VoiceAnalyticsData.micAvailability = "Granted"
			else
				VoiceAnalyticsData.micAvailability = "Denied"
			end
		end
	elseif p2.status == PermissionsProtocol.Status.AUTHORIZED then
		VoiceAnalyticsData.micAvailability = "Granted"
	else
		VoiceAnalyticsData.micAvailability = "Denied"
	end
	self.Analytics:reportVoiceEvents("experienceJoinDeviceMicPermissionEvent", VoiceAnalyticsData)
end

function config1.CheckCaptureMute(p2)
	-- upvalues: GetFFlagEnableVoiceChatMuteForVideoCapturesFunction (copy)
	return if GetFFlagEnableVoiceChatMuteForVideoCapturesFunction() then p2.CaptureService:IsCapturingVideo() else false
end

function config1:ToggleMuteSome(List, p2, GroupType, Context)
	-- upvalues: VoiceChatService (copy), EnableMutedByLocalUserEngineFeature (copy), Players (copy)
	self:ensureInitialized("mute some players")
	self._mutedAnyone = true
	local t = {}
	local P72 = p2 or self:CheckCaptureMute()
	
	for i, value in List do
		if VoiceChatService.UseNewAudioApi then
			t[value] = true
			self.mutedPlayers[value] = P72
		else
			self.service:SubscribePause(value, P72)
		end
		local Participant = self.participants[tostring(value)]
		
		if Participant then
			Participant.isMutedLocally = P72
			self.participantsUpdate:Fire(self.participants)
		end
	end
	if VoiceChatService.UseNewAudioApi then
		for i in self.audioDevices do
			if i.Player and t[i.Player.UserId] then
				if EnableMutedByLocalUserEngineFeature and i.Player ~= Players.LocalPlayer then
					i.MutedByLocalUser = P72
				else
					i.Active = not P72
				end
			end
		end
	end
	if GroupType and Context then
		self.Analytics:reportVoiceMuteGroup((self:JoinWithVoiceMuteData({ groupType = GroupType, context = Context, muted = P72 })))
	end
end

function config1:GetMutedAnyone()
	return self._mutedAnyone
end

function config1:RecordGameSettingsOpened()
	-- upvalues: v3 (copy), VoiceVolumeControlsApplyGameSettingsVoiceVolumeEngineFeature (copy)
	if v3 and VoiceVolumeControlsApplyGameSettingsVoiceVolumeEngineFeature and self._voiceJoinTimestampMs and not self._gameSettingsOpenedTimestampMs then
		self._gameSettingsOpenedTimestampMs = DateTime.now().UnixTimestampMillis
	end
end

function config1:ResetVoiceVolumeImpressionsSession()
	-- upvalues: v3 (copy), VoiceVolumeControlsApplyGameSettingsVoiceVolumeEngineFeature (copy)
	if v3 and VoiceVolumeControlsApplyGameSettingsVoiceVolumeEngineFeature then
		self._voiceJoinTimestampMs = nil
		self._voiceVolumeSliderEligibleAtJoin = false
		self._gameSettingsOpenedTimestampMs = nil
	end
end

function config1:ReportVoiceVolumeImpressionsIfNeeded()
	-- upvalues: v3 (copy), VoiceVolumeControlsApplyGameSettingsVoiceVolumeEngineFeature (copy)
	if v3 and VoiceVolumeControlsApplyGameSettingsVoiceVolumeEngineFeature and self._voiceJoinTimestampMs and self._voiceVolumeSliderEligibleAtJoin then
		local VoiceAnalyticsData = self:GetVoiceAnalyticsData()
		self.Analytics:reportVoiceVolumeImpressions({
			playSessionId = VoiceAnalyticsData.playSessionId,
			voiceSessionId = VoiceAnalyticsData.voiceSessionId,
			sliderSeen = self._gameSettingsOpenedTimestampMs ~= nil,
			voiceJoinTimestampMs = self._voiceJoinTimestampMs,
			sliderSeenTimestampMs = self._gameSettingsOpenedTimestampMs
		})
		self:ResetVoiceVolumeImpressionsSession()
		
		return
	end
end

function config1:ToggleMutePlayer(UserId, Context)
	-- upvalues: VoiceChatService (copy), NewResult (copy), UtilsModule (copy), GetFFlagEnableFtuxExitOnMuteToggleModule (copy), EnableMutedByLocalUserEngineFeature (copy), Players (copy)
	self:ensureInitialized("mute player " .. UserId)
	self._mutedAnyone = true
	local Inverted = (if VoiceChatService.UseNewAudioApi then not self.mutedPlayers[UserId] else not self.service:IsSubscribePaused(UserId)) or self:CheckCaptureMute()
	NewResult:trace("Setting mute for {} to {}", UtilsModule.shorten(UserId), Inverted)
	
	if GetFFlagEnableFtuxExitOnMuteToggleModule() then
		self.onPlayerMuteToggled:Fire()
	end
	if VoiceChatService.UseNewAudioApi then
		self.mutedPlayers[UserId] = Inverted
		
		for audioDevice in self.audioDevices do
			if audioDevice.Player and audioDevice.Player.UserId == UserId then
				if EnableMutedByLocalUserEngineFeature and audioDevice.Player ~= Players.LocalPlayer then
					audioDevice.MutedByLocalUser = Inverted
				else
					local Participant = self.participants[tostring(UserId)]
					local NoIsMuted: boolean = Participant and not Participant.isMuted
					audioDevice.Active = not Inverted and NoIsMuted
				end
			end
		end
		self:emit("OnPlayerMuted")
	else
		self.service:SubscribePause(UserId, Inverted)
	end
	for _, participant in pairs(self.participants) do
		if participant.userId == UserId then
			participant.isMutedLocally = Inverted
			self.participantsUpdate:Fire(self.participants)
		end
	end
	if Context then
		self.Analytics:reportVoiceMuteIndividual((self:JoinWithVoiceMuteData({
			targetUserId = tonumber(UserId),
			context = Context,
			muted = Inverted
		})))
	end
end

function config1:MuteAll(p3, Context)
	-- upvalues: VoiceChatService (copy), NewResult (copy), VoiceChatMuteAllSyncMutedPlayers (copy), Players (copy), EnableMutedByLocalUserEngineFeature (copy), ConstantsModule (copy)
	self:ensureInitialized("mute all")
	self._mutedAnyone = true
	local P83 = p3 or self:CheckCaptureMute()
	
	if VoiceChatService.UseNewAudioApi then
		self.muteAll = P83
		NewResult:trace("Setting self mute all to {} context: {}", P83, Context)
		
		if VoiceChatMuteAllSyncMutedPlayers and not P83 then
			table.clear(self.mutedPlayers)
		end
		for audioDevice in self.audioDevices do
			if audioDevice.Player and audioDevice.Player ~= Players.LocalPlayer then
				NewResult:debug("Local muting {} to '{} = {}'", audioDevice.Player.Name, audioDevice.Active, P83)
				
				if EnableMutedByLocalUserEngineFeature then
					audioDevice.MutedByLocalUser = P83
					
					if VoiceChatMuteAllSyncMutedPlayers then
						self.mutedPlayers[audioDevice.Player.UserId] = P83
					end
				else
					local UserId = audioDevice.Player.UserId
					self.mutedPlayers[UserId] = P83
					local Participant = self.participants[tostring(UserId)]
					local NoIsMuted: boolean = Participant and not Participant.isMuted
					audioDevice.Active = not P83 and NoIsMuted
				end
			end
		end
	else
		self.service:SubscribePauseAll(P83)
	end
	for _, participant in pairs(self.participants) do
		participant.isMutedLocally = P83
		self.participantsUpdate:Fire(self.participants)
	end
	self.muteAllChanged:Fire(P83)
	
	if Context then
		self.Analytics:reportVoiceMuteGroup((self:JoinWithVoiceMuteData({
			groupType = ConstantsModule.VOICE_GROUP_TYPE.ALL,
			context = Context,
			muted = P83
		})))
	end
end

function config1:FetchVoicePermissions()
	if not self.communicationPermissionsResult then
		self.communicationPermissionsResult = self:resolveAvatarChatUserAndPlaceSettings()
	end
	return self.communicationPermissionsResult
end

function config1:verifyUniverseAndPlaceCanUseVoice()
	-- upvalues: GetFFlagAvatarChatServiceEnabledFunction (copy), GetFFlagVoiceChatServiceManagerUseAvatarChatModule (copy), AnalyticsModule (copy)
	local ResolveAvatarChatUserAndPlaceSettingsResult = if GetFFlagAvatarChatServiceEnabledFunction() and GetFFlagVoiceChatServiceManagerUseAvatarChatModule() then self:resolveAvatarChatUserAndPlaceSettings() else self:FetchAgeVerificationOverlay()
	
	if ResolveAvatarChatUserAndPlaceSettingsResult then
		local UniversePlaceVoiceEnabledSettings = ResolveAvatarChatUserAndPlaceSettingsResult.universePlaceVoiceEnabledSettings
		
		return UniversePlaceVoiceEnabledSettings and (UniversePlaceVoiceEnabledSettings.isPlaceEnabledForVoice and UniversePlaceVoiceEnabledSettings.isUniverseEnabledForVoice)
	else
		self:_reportJoinFailed("invalidResponse", AnalyticsModule.ERROR)
		
		return false
	end
end

function config1:IsUserInFTUX(): boolean
	-- upvalues: GetFFlagSeamlessVoiceFTUXFunction (copy), GetFFlagCheckUniversePlaceBeforeSuspendingFunction (copy), NewResult (copy)
	if not GetFFlagSeamlessVoiceFTUXFunction() then
		return false
	elseif GetFFlagCheckUniversePlaceBeforeSuspendingFunction() and not self:verifyUniverseAndPlaceCanUseVoice() then
		return false
	else
		local AppStorageService = game:GetService("AppStorageService")
		local IsTrue = nil
		
		if not pcall(function()
			-- upvalues: AppStorageService (copy), IsTrue (ref)
			IsTrue = AppStorageService:GetItem("SeamlessVoiceFTUX") == "true"
		end) then
			NewResult:warning("Failed to read FTUX/STUX from AppStorage")
			
			return false
		end
		local AgeVerificationOverlay = self:FetchAgeVerificationOverlay()
		
		if type(AgeVerificationOverlay) == "table" and AgeVerificationOverlay.voiceSettings and AgeVerificationOverlay.voiceSettings.seamlessVoiceStatus ~= 3 then
			NewResult:debug("User not eligible for FTUX/STUX")
			
			return false
		else
			return not IsTrue
		end
	end
end

function config1:isEnableDefaultVoiceOnForPlace()
	-- upvalues: VoiceChatService (copy)
	if not game:IsLoaded() then
		game.Loaded:Wait()
	end
	return VoiceChatService.UseNewAudioApi or VoiceChatService.EnableDefaultVoice
end

function config1:verifyPlaceCanUseVoice(UniversePlaceVoiceEnabledSettings, VoiceSettings): boolean
	-- upvalues: AnalyticsModule (copy)
	if not UniversePlaceVoiceEnabledSettings or not VoiceSettings then
		self:_reportJoinFailed("invalidResponse", AnalyticsModule.ERROR)
		
		return false
	elseif not UniversePlaceVoiceEnabledSettings.isUniverseEnabledForVoice then
		self:_reportJoinFailed("universeNotEnabled")
		
		return false
	else
		self:emit("OnUserAndPlaceCanUseVoiceResolved", VoiceSettings, UniversePlaceVoiceEnabledSettings)
		
		if UniversePlaceVoiceEnabledSettings.isPlaceEnabledForVoice then
			return if self:isEnableDefaultVoiceOnForPlace() then true else false
		else
			self:_reportJoinFailed("placeNotEnabled")
			
			return false
		end
	end
end

function config1:EligibleForFaeUpsell()
	-- upvalues: FAEENABLED (copy)
	local AgeVerificationOverlay = self:FetchAgeVerificationOverlay()
	
	if AgeVerificationOverlay and type(AgeVerificationOverlay) == "table" then
		local IsPlaceEnabledForVoice = AgeVerificationOverlay.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice
		
		return AgeVerificationOverlay.inExperienceFaeUpsell == FAEENABLED and IsPlaceEnabledForVoice
	else
		return false
	end
end

function config1:OptUserToJoinVoice()
	-- upvalues: NewResult (copy)
	NewResult:debug("Opting user to join voice on age verification")
	self.hasOptedToJoinVoiceOnAgeVerification = true
end

function config1:SetupFAECompleteListener()
	-- upvalues: NewResult (copy)
	NewResult:debug("Setting up FAE complete listener")
	
	if game:GetEngineFeature("ChatReconcileAccess") then
		NewResult:debug("Using ChatService ReconcileCommunicationAccessCompleted event")
		self.ChatService.ReconcileCommunicationAccessCompleted:Connect(function()
			-- upvalues: NewResult (upval), self (copy)
			NewResult:debug("FAE complete listener triggered, re-fetching voice permissions")
			self.communicationPermissionsResult = nil
			self:FetchVoicePermissions()
			self._getShowAgeVerificationOverlayResult = self:_GetShowAgeVerificationOverlay()
			
			if self.hasOptedToJoinVoiceOnAgeVerification then
				NewResult:debug("FAE complete listener triggered, attempting voice rejoin")
				
				if self:IsSeamlessVoice() then
					NewResult:debug("Opting-in user to voice")
					self.AvatarChatService:EnableVoice()
					self.attemptVoiceRejoin:Fire()
				end
			end
		end)
	end
end

function config1:EligibleForAgeCheckToast(): boolean
	-- upvalues: FAESETTINGSTOAST (copy)
	local AgeVerificationOverlay = self:FetchAgeVerificationOverlay()
	
	if AgeVerificationOverlay and type(AgeVerificationOverlay) == "table" then
		local IsInExperienceFaeUpsellMatch = AgeVerificationOverlay.inExperienceFaeUpsell == FAESETTINGSTOAST
		
		return AgeVerificationOverlay.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice and (self:isEnableDefaultVoiceOnForPlace() and IsInExperienceFaeUpsellMatch)
	else
		return false
	end
end

function config1:userAndPlaceCanUseVoice()
	-- upvalues: GetFFlagAvatarChatServiceEnabledFunction (copy), GetFFlagVoiceChatServiceManagerUseAvatarChatModule (copy), GetShowAgeVerificationOverlayModule (copy), UtilsModule (copy), AnalyticsModule (copy), NewResult (copy), GetFFlagEnableVoiceSignalFunction (copy), GetFFlagEnableInExpPhoneVoiceUpsellEntrypointsFunction (copy), ConstantsModule (copy), VOICEJOINPROGRESS (copy), GetFFlagEnableVoiceUxUpdatesFunction (copy), GetFFlagNonVoiceFTUXFunction (copy)
	if self.ThirdPartyUserService ~= nil and self.ThirdPartyUserService:IsChatRestrictionSupported() and self.ThirdPartyUserService:GetVoiceChatRestrictionStatus() ~= Enum.ChatRestrictionStatus.NotRestricted then
		return false
	end
	local ResolveAvatarChatUserAndPlaceSettingsResult = if GetFFlagAvatarChatServiceEnabledFunction() and GetFFlagVoiceChatServiceManagerUseAvatarChatModule() then self:resolveAvatarChatUserAndPlaceSettings() else GetShowAgeVerificationOverlayModule(UtilsModule.bind(self, "GetRequest"), tostring(game.GameId), (tostring(game.PlaceId)))
	
	if not ResolveAvatarChatUserAndPlaceSettingsResult then
		self:_reportJoinFailed("invalidResponse", AnalyticsModule.ERROR)
		
		return false
	end
	if self.options.forceVoiceEnabled then
		ResolveAvatarChatUserAndPlaceSettingsResult.voiceSettings.isVoiceEnabled = true
		NewResult:debug("bypassing voice permissions check")
	end
	local UniversePlaceVoiceEnabledSettings = ResolveAvatarChatUserAndPlaceSettingsResult.universePlaceVoiceEnabledSettings
	local VoiceSettings = ResolveAvatarChatUserAndPlaceSettingsResult.voiceSettings
	NewResult:trace("Voice settings endpoint returned {}", ResolveAvatarChatUserAndPlaceSettingsResult)
	
	if not self:verifyPlaceCanUseVoice(UniversePlaceVoiceEnabledSettings, VoiceSettings) then
		return false
	end
	if GetFFlagEnableVoiceSignalFunction() then
		self.communicationPermissionsResult = ResolveAvatarChatUserAndPlaceSettingsResult
		local Timestamp = GetFFlagEnableInExpPhoneVoiceUpsellEntrypointsFunction() and os.time()
		local IsPhoneVerificationUpsellMatch: boolean = GetFFlagEnableInExpPhoneVoiceUpsellEntrypointsFunction() and (not self:UserVoiceEnabled() and (not VoiceSettings.isUserVerifiedForVoice and (self:FetchPhoneVerificationUpsell(ConstantsModule.IN_EXP_PHONE_UPSELL_IXP_LAYER) == ConstantsModule.PHONE_UPSELL_VOICE_CHAT_PROP.VoiceChat or Timestamp and self:FetchPhoneVerificationUpsell(ConstantsModule.EXIT_CONFIRMATION_PHONE_UPSELL_IXP_LAYER, Timestamp) == ConstantsModule.PHONE_UPSELL_VOICE_CHAT_PROP.VoiceChat)))
		
		if self:UserEligibleForInExperienceUpsell() or IsPhoneVerificationUpsellMatch then
			self:ChangeVoiceJoinProgress(VOICEJOINPROGRESS.Suspended)
		end
		if GetFFlagEnableVoiceUxUpdatesFunction() then
			local VoiceConnectCookie = self:GetVoiceConnectCookie()
			local IsFalse: boolean = self:IsSeamlessVoice() and VoiceConnectCookie == "false"
			
			if self:HasSeamlessVoiceFeature(ConstantsModule.SeamlessVoiceFeatures.DeferConnection) and VoiceConnectCookie == "" or IsFalse then
				self:ChangeVoiceJoinProgress(VOICEJOINPROGRESS.Suspended)
			elseif self:EligibleForFaeUpsell() then
				NewResult:debug("Suspending voice join for FAE Eligible user")
				self:ChangeVoiceJoinProgress(VOICEJOINPROGRESS.Suspended)
				self:SetupFAECompleteListener()
			end
		else
			if GetFFlagNonVoiceFTUXFunction() and self:IsUserInFTUX() then
				self:ChangeVoiceJoinProgress(VOICEJOINPROGRESS.Suspended)
			end
			if self:IsSeamlessVoice() and not self:GetVoiceConnectCookieValue() then
				NewResult:debug("Suspending voice join due to voice connect cookie")
				self:ChangeVoiceJoinProgress(VOICEJOINPROGRESS.Suspended)
			elseif self:IsNewSeamlessVoiceUserDisconnect() then
				NewResult:debug("Suspending voice join for new seamless voice user")
				self:ChangeVoiceJoinProgress(VOICEJOINPROGRESS.Suspended)
			elseif self:IsSeamlessVoice() and self:UserOnlyEligibleForVoice() then
				NewResult:debug("Suspending voice join for opt-out user")
				self:ChangeVoiceJoinProgress(VOICEJOINPROGRESS.Suspended)
			end
		end
		task.spawn(function()
			-- upvalues: self (copy)
			self:FetchAgeVerificationOverlay()
		end)
	end
	if not VoiceSettings.isVoiceEnabled then
		self:_reportJoinFailed("userNotEnabled")
	end
	return VoiceSettings.isVoiceEnabled
end

function config1:voicePermissionGranted(AUTHORIZED): boolean
	-- upvalues: PermissionsProtocol (copy), CryoModule (copy)
	return if typeof(AUTHORIZED) == "table" then AUTHORIZED.status == PermissionsProtocol.Status.AUTHORIZED or not CryoModule.List.find(AUTHORIZED.missingPermissions, PermissionsProtocol.Permissions.MICROPHONE_ACCESS) else AUTHORIZED == PermissionsProtocol.Status.AUTHORIZED
end

function config1.RawGetPermissions(p4, p5)
	-- upvalues: PromiseModule (copy)
	return PromiseModule.new(function(Callback, _)
		-- upvalues: p4 (copy), p5 (copy)
		p4:emit("GetPermissions", function(p6)
			-- upvalues: Callback (copy)
			Callback(p6)
		end, p5, true, true)
	end)
end

function config1:requestMicPermission()
	-- upvalues: GetFFlagCoreMicManagerRefactorModule (copy), GetFFlagDebugVoiceChatMicPermissionCliBypassModule (copy), PERMISSIONSTATE (copy), PromiseModule (copy), NewResult (copy), PermissionsProtocol (copy), GetFFlagEnableExpJoinMicPermAnalyticsModule (copy), AnalyticsModule (copy)
	if GetFFlagCoreMicManagerRefactorModule() then
		return self.micManager:RequestMicPermission()
	elseif GetFFlagDebugVoiceChatMicPermissionCliBypassModule() then
		self.permissionState = PERMISSIONSTATE.LISTEN_AND_TALK
		
		return PromiseModule.resolve()
	elseif self.permissionPromise then
		NewResult:trace("PermissionProtocol already invoked")
		
		return self.permissionPromise
	else
		self.permissionPromise = self.PermissionsService:requestPermissions({ PermissionsProtocol.Permissions.MICROPHONE_ACCESS }):andThen(function(Result)
			-- upvalues: GetFFlagEnableExpJoinMicPermAnalyticsModule (upval), self (copy), NewResult (upval), AnalyticsModule (upval), PromiseModule (upval), PermissionsProtocol (upval)
			if GetFFlagEnableExpJoinMicPermAnalyticsModule() then
				self:RecordExperienceJoinMicPermissionStatus(Result)
			end
			if Result or Result.status then
				NewResult:debug("Permission status {}", Result.status)
				local IsStatusMatch = Result.status == PermissionsProtocol.Status.AUTHORIZED
				
				return if self.options.passInitErrorInPromiseReject and not IsStatusMatch then PromiseModule.reject({ code = "INIT_ERROR_PERM_NOT_GRANTED" }) else IsStatusMatch and PromiseModule.resolve() or PromiseModule.reject()
			else
				NewResult:debug("No permission response, rejecting access")
				self:_reportJoinFailed("noPermissionResponse", AnalyticsModule.ERROR)
				
				return if self.options.passInitErrorInPromiseReject then PromiseModule.reject({ code = "INIT_ERROR_NO_PERM_RESPONSE" }) else PromiseModule.reject()
			end
		end):andThen(function()
			-- upvalues: self (copy), PromiseModule (upval)
			self:emit("OnRequestMicPermissionResolved")
			
			return PromiseModule.resolve()
		end):catch(function()
			-- upvalues: self (copy), PromiseModule (upval)
			self:emit("OnRequestMicPermissionRejected")
			
			return if self.options.passInitErrorInPromiseReject then PromiseModule.reject({ code = "INIT_ERROR_MIC_PERM_REJECTED" }) else PromiseModule.reject()
		end)
		
		return self.permissionPromise
	end
end

function config1:JoinByGroupIdToken(PreviousGroupId, PreviousMutedState)
	self.previousGroupId = PreviousGroupId
	self.previousMutedState = PreviousMutedState
	
	return self.service:JoinByGroupIdToken(PreviousGroupId, PreviousMutedState)
end

function config1:EnableVoice()
	-- upvalues: NewResult (copy)
	NewResult:trace("Enabling voice")
	self.AvatarChatService:GetPropertyChangedSignal("ClientFeatures"):Once(function()
		-- upvalues: self (copy)
		self.attemptVoiceRejoin:Fire()
	end)
	self.AvatarChatService:EnableVoice()
end

function config1:ChangeVoiceJoinProgress(Suspended)
	self.VoiceJoinProgress = Suspended
	self.VoiceJoinProgressChanged:Fire(self.VoiceJoinProgress)
end

function config1:setOptions(Options)
	self.options = Options
end

function config1:ShouldShowJoinVoiceOnDisconnect(): boolean
	-- upvalues: VOICEJOINPROGRESS (copy)
	return self:IsSeamlessVoice() and self.VoiceJoinProgress == VOICEJOINPROGRESS.Suspended
end

function config1:IsSeamlessVoice(): boolean
	-- upvalues: GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoiceFunction (copy), GetFFlagCheckUniversePlaceBeforeSuspendingFunction (copy), ConstantsModule (copy)
	if GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoiceFunction() and not self.options.allowSeamlessVoice then
		return false
	end
	local AgeVerificationOverlay = self:FetchAgeVerificationOverlay()
	
	if type(AgeVerificationOverlay) ~= "table" or not AgeVerificationOverlay or not AgeVerificationOverlay.voiceSettings then
		return false
	elseif GetFFlagCheckUniversePlaceBeforeSuspendingFunction() and not self:verifyUniverseAndPlaceCanUseVoice() then
		return false
	else
		local SeamlessVoiceStatus = AgeVerificationOverlay.voiceSettings.seamlessVoiceStatus
		
		return SeamlessVoiceStatus == ConstantsModule.SeamlessVoiceStatus.EnabledExistingUser or SeamlessVoiceStatus == ConstantsModule.SeamlessVoiceStatus.EnabledNewUser
	end
end

function config1:HasSeamlessVoiceFeature(Entry)
	-- upvalues: GetFFlagEnableSeamlessVoiceFeatureModule (copy), UtilsModule (copy), ConstantsModule (copy)
	if not self.options.allowSeamlessVoice or not self:verifyUniverseAndPlaceCanUseVoice() then
		return false
	end
	local AgeVerificationOverlay = self:FetchAgeVerificationOverlay()
	
	if not self:_isValidAgeVerificationOverlayData(AgeVerificationOverlay) then
		return false
	end
	local SeamlessVoiceVariant = AgeVerificationOverlay.voiceSettings.seamlessVoiceVariant
	
	if not SeamlessVoiceVariant then
		return false
	end
	if GetFFlagEnableSeamlessVoiceFeatureModule() then
		if type(Entry) == "string" then
			Entry = { Entry }
		end
		if GetFFlagEnableSeamlessVoiceFeatureModule(Entry) then
			local t = {}
			
			for _, value in pairs((UtilsModule.jsonDecode(SeamlessVoiceVariant))) do
				t[value] = true
			end
			if #Entry == 1 and Entry[1] == ConstantsModule.SeamlessVoiceFeatures.ConnectDisconnect and SeamlessVoiceVariant == ConstantsModule.SeamlessVoiceVariants.OnlyConnectDisconnect then
				return true
			end
			for _, value1 in pairs(Entry) do
				if not t[value1] then
					return false
				end
			end
			return true
		end
	else
		local Entry1 = ({
			[ConstantsModule.SeamlessVoiceFeatures.ConnectDisconnect] = function(Control): boolean
				-- upvalues: ConstantsModule (upval)
				return Control ~= ConstantsModule.SeamlessVoiceVariants.Control
			end,
			[ConstantsModule.SeamlessVoiceFeatures.HearingWithoutMicPermissions] = function(HearingWithoutMicPermissions): boolean
				-- upvalues: ConstantsModule (upval)
				return HearingWithoutMicPermissions == ConstantsModule.SeamlessVoiceVariants.HearingWithoutMicPermissions
			end
		})[Entry]
		
		if Entry1 then
			return Entry1(SeamlessVoiceVariant)
		end
	end
	return false
end

function config1:IsNewSeamlessVoiceUserDisconnect(): boolean
	-- upvalues: ConstantsModule (copy)
	if not self.options.allowSeamlessVoice or not self:verifyUniverseAndPlaceCanUseVoice() then
		return false
	end
	local AgeVerificationOverlay = self:FetchAgeVerificationOverlay()
	
	if not self:_isValidAgeVerificationOverlayData(AgeVerificationOverlay) then
		return false
	elseif AgeVerificationOverlay.voiceSettings.seamlessVoiceStatus == ConstantsModule.SeamlessVoiceStatus.EnabledNewUser then
		local Success, Result = pcall(function()
			-- upvalues: self (copy), ConstantsModule (upval)
			return self.AppStorageService:GetItem(ConstantsModule.SEAMLESS_VOICE_FTUX_KEY)
		end)
		
		return Success and Result == "false"
	else
		return false
	end
end

function config1:_isValidAgeVerificationOverlayData(AgeVerificationOverlay)
	return type(AgeVerificationOverlay) == "table" and (AgeVerificationOverlay and AgeVerificationOverlay.voiceSettings)
end

function config1:UserInInExperienceUpsellTreatment(): boolean
	-- upvalues: ConstantsModule (copy)
	local AgeVerificationOverlay = self:FetchAgeVerificationOverlay()
	
	if AgeVerificationOverlay then
		local ShowVoiceInExperienceUpsellVariant = AgeVerificationOverlay.showVoiceInExperienceUpsellVariant
		
		return ShowVoiceInExperienceUpsellVariant == ConstantsModule.IN_EXP_UPSELL_VARIANT.VARIANT1 or (ShowVoiceInExperienceUpsellVariant == ConstantsModule.IN_EXP_UPSELL_VARIANT.VARIANT2 or ShowVoiceInExperienceUpsellVariant == ConstantsModule.IN_EXP_UPSELL_VARIANT.VARIANT3)
	else
		return false
	end
end

function config1:UserOnlyEligibleForVoice()
	-- upvalues: ShowJoinVoiceRaceConditionFix (copy)
	local CommunicationPermissionsResult = self.communicationPermissionsResult
	
	if not CommunicationPermissionsResult or not CommunicationPermissionsResult.voiceSettings or not CommunicationPermissionsResult.universePlaceVoiceEnabledSettings then
		if not ShowJoinVoiceRaceConditionFix then
			return false
		end
		self:FetchVoicePermissions()
		CommunicationPermissionsResult = self.communicationPermissionsResult
	end
	return CommunicationPermissionsResult.voiceSettings.isUserVerifiedForVoice and (not CommunicationPermissionsResult.voiceSettings.isVoiceEnabled and CommunicationPermissionsResult.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice)
end

function config1:UserOnlyEligibleForVoiceViaOverlay()
	local AgeVerificationOverlay = self:FetchAgeVerificationOverlay()
	
	return if self:_isValidAgeVerificationOverlayData(AgeVerificationOverlay) then AgeVerificationOverlay.voiceSettings.isVerifiedForVoice and (not AgeVerificationOverlay.voiceSettings.isVoiceEnabled and AgeVerificationOverlay.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice) else false
end

function config1:UserVoiceEnabled()
	local CommunicationPermissionsResult = self.communicationPermissionsResult
	
	return if CommunicationPermissionsResult and CommunicationPermissionsResult.voiceSettings and CommunicationPermissionsResult.universePlaceVoiceEnabledSettings then CommunicationPermissionsResult.voiceSettings.isVoiceEnabled and CommunicationPermissionsResult.universePlaceVoiceEnabledSettings.isPlaceEnabledForVoice else false
end

function config1:UserEligibleForInExperienceUpsell()
	-- upvalues: GetFFlagEnableVoiceSignalFunction (copy)
	local UserOnlyEligibleForVoiceResult = self:UserOnlyEligibleForVoice()
	
	if not UserOnlyEligibleForVoiceResult then
		return false
	elseif GetFFlagEnableVoiceSignalFunction() then
		local UserInInExperienceUpsellTreatmentResult = self:UserInInExperienceUpsellTreatment()
		
		return UserOnlyEligibleForVoiceResult and UserInInExperienceUpsellTreatmentResult
	else
		local AgeVerificationOverlay = self:FetchAgeVerificationOverlay()
		
		return UserOnlyEligibleForVoiceResult and (AgeVerificationOverlay and AgeVerificationOverlay.showVoiceInExperienceUpsell)
	end
end

function config1:canUseServiceAsync()
	-- upvalues: FFlagSkipVoiceInTeamCreateViewerModule (copy), RunService (copy), PromiseModule (copy), NewResult (copy), GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoiceFunction (copy), GetFFlagEnableVoiceSignalFunction (copy), VOICEJOINPROGRESS (copy), VOICECHATAVAILABILITY (copy), VoiceChatService (copy), ConsoleVoiceIXPEnabled (copy), IXPServiceWrapper (copy), ConsoleVoiceIXPLayerName (copy), ConsoleVoiceEnabledIXPLayerValue (copy)
	if FFlagSkipVoiceInTeamCreateViewerModule and RunService:IsTeamCreateViewer() then
		return if self.options.passInitErrorInPromiseReject then PromiseModule.reject({ code = "INIT_ERROR_CONTEXT_NOT_ENABLED" }) else PromiseModule.reject()
	end
	if self.available ~= nil or not game:GetEngineFeature("VoiceChatSupported") then
		NewResult:debug("Voice Chat is not Available, rejecting canUseService promise")
		
		return if self.options.passInitErrorInPromiseReject then PromiseModule.reject({ code = "INIT_ERROR_VOICE_NOT_SUPPORTED" }) else PromiseModule.reject()
	end
	if not self.canUseServicePromise then
		self.canUseServicePromise = PromiseModule.defer(function(Callback: () -> (), Callback1: (any) -> ())
			-- upvalues: self (copy), GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoiceFunction (upval), GetFFlagEnableVoiceSignalFunction (upval), VOICEJOINPROGRESS (upval), NewResult (upval), VOICECHATAVAILABILITY (upval), VoiceChatService (upval), ConsoleVoiceIXPEnabled (upval), IXPServiceWrapper (upval), ConsoleVoiceIXPLayerName (upval), ConsoleVoiceEnabledIXPLayerValue (upval)
			local UserAndPlaceCanUseVoiceResult = self:userAndPlaceCanUseVoice()
			
			if GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoiceFunction() then
				self.canUseServiceResult = UserAndPlaceCanUseVoiceResult
				self:emit("OnCanUseServiceResult", UserAndPlaceCanUseVoiceResult)
			end
			if GetFFlagEnableVoiceSignalFunction() and self.VoiceJoinProgress == VOICEJOINPROGRESS.Suspended then
				NewResult:debug("Place is voice enabled but user is not, delaying voice rejection")
				self.attemptVoiceRejoin.Event:Wait()
				NewResult:debug("Attempting voice rejoin")
				self.communicationPermissionsResult.voiceSettings.isVoiceEnabled = true
				self.userEligible = true
				self.initializedPostSuspension = true
				Callback()
				self:ChangeVoiceJoinProgress(VOICEJOINPROGRESS.Joining)
				
				return
			end
			if UserAndPlaceCanUseVoiceResult then
				if game:GetEngineFeature("VoiceChatEnabledRccProperties") and (not VoiceChatService.VoiceChatEnabledForUniverseOnRcc or not VoiceChatService.VoiceChatEnabledForPlaceOnRcc) then
					NewResult:debug("Disabling voice chat due to RCC Response. Universe: {}, Place: {}", VoiceChatService.VoiceChatEnabledForUniverseOnRcc, VoiceChatService.VoiceChatEnabledForPlaceOnRcc)
					
					if VoiceChatService.VoiceChatEnabledForUniverseOnRcc then
						if not VoiceChatService.VoiceChatEnabledForPlaceOnRcc then
							self:_reportJoinFailed("placeNotEnabled")
						end
					else
						self:_reportJoinFailed("universeNotEnabled")
					end
					self.available = VOICECHATAVAILABILITY.PlaceNotAvailable
					
					if self.options.passInitErrorInPromiseReject then
						Callback1({ code = "INIT_ERROR_PLACE_NOT_AVAILABLE" })
						
						return
					else
						Callback1()
						
						return
					end
				else
					if not ConsoleVoiceIXPEnabled then
						self.userEligible = true
						Callback()
						
						return
					end
					IXPServiceWrapper:WaitForInitialization()
					local Success, Result = pcall(function()
						-- upvalues: IXPServiceWrapper (upval), ConsoleVoiceIXPLayerName (upval)
						return IXPServiceWrapper:GetLayerData(ConsoleVoiceIXPLayerName)
					end)
					
					if Success and Result and Result[ConsoleVoiceEnabledIXPLayerValue] ~= nil then
						self.userEligible = Result[ConsoleVoiceEnabledIXPLayerValue]
						IXPServiceWrapper:LogUserLayerExposure(ConsoleVoiceIXPLayerName)
					end
					if self.userEligible then
						Callback()
						
						return
					end
					if self.options.passInitErrorInPromiseReject then
						Callback1({ code = "INIT_ERROR_IXP_NOT_ELIGIBLE" })
						
						return
					else
						Callback1()
						
						return
					end
				end
			else
				NewResult:info("Voice access denied")
				self.available = VOICECHATAVAILABILITY.UserNotAvailable
				
				if self.options.passInitErrorInPromiseReject then
					Callback1({ code = "INIT_ERROR_USER_NOT_AVAILABLE" })
					
					return
				else
					Callback1()
				end
			end
		end):andThen(function()
			-- upvalues: self (copy)
			return self:requestMicPermission()
		end)
	end
	return self.canUseServicePromise
end

function config1:_setRecentUserState(UserId, p4)
	-- upvalues: CryoModule (copy)
	self.recentUsersInteractionData = CryoModule.Dictionary.join(self.recentUsersInteractionData, {
		[tostring(UserId)] = CryoModule.Dictionary.join(self.recentUsersInteractionData[tostring(UserId)] or {}, p4)
	})
end

function config1:getRecentUsersInteractionData()
	self:_updateRecentUsersInteractionData()
	
	return self.recentUsersInteractionData
end

function config1:GetSignalREvent(p4)
	return self.SignalREventTable[p4].Event
end

function config1:StartModerationSignal()
	-- upvalues: NewResult (copy), GetFFlagVoiceChatClientRewriteMasterLuaFunction (copy), VoiceChatService (copy)
	if not self.playerModeratedConnection then
		self.playerModeratedConnection = self:GetSignalREvent("ParticipantModeratedFromVoice"):Connect(function()
			-- upvalues: NewResult (upval), self (copy), GetFFlagVoiceChatClientRewriteMasterLuaFunction (upval), VoiceChatService (upval)
			NewResult:debug("User Moderated")
			self.previousSessionId = self.service:GetSessionId()
			self:emit("OnPlayerModerated")
			
			if GetFFlagVoiceChatClientRewriteMasterLuaFunction() then
				VoiceChatService:notifyServerACSCleanup()
				VoiceChatService:leaveVoice()
				
				return
			else
				VoiceChatService:notifyServerACSCleanup()
				self.service:Leave()
			end
		end)
	end
end

function config1:StopModerationSignal()
	if self.playerModeratedConnection then
		self.playerModeratedConnection:Disconnect()
		self.playerModeratedConnection = nil
	end
end

function config1:_updateRecentUsersInteractionData()
	-- upvalues: StringKeyFixForParticipantsTable (copy), GetFFlagClearUserFromRecentVoiceDataOnLeaveModule (copy), Players (copy), GetFIntVoiceUsersInteractionExpiryTimeSecondsModule (copy), CryoModule (copy)
	local Timestamp = os.time()
	local Nones = {}
	
	if self.recentUsersInteractionData then
		for i, value in pairs(self.recentUsersInteractionData) do
			local Participant = if StringKeyFixForParticipantsTable then self.participants[tostring(i)] else self.participants[i]
			local Inverted: boolean = GetFFlagClearUserFromRecentVoiceDataOnLeaveModule() and not Players:GetPlayerByUserId((tonumber(i)))
			local NoParticipant = not Participant or Participant.isMuted
			
			if GetFIntVoiceUsersInteractionExpiryTimeSecondsModule() <= Timestamp - value.lastHeardTime and NoParticipant or Inverted then
				Nones[i] = CryoModule.None
			end
		end
		self.recentUsersInteractionData = CryoModule.Dictionary.join(self.recentUsersInteractionData, Nones)
	end
end

function config1:SetupParticipantListeners()
	-- upvalues: NewResult (copy), GetFFlagClearUserFromRecentVoiceDataOnLeaveModule (copy), StringKeyFixForParticipantsTable (copy), GetFFlagFixGetPlayerByUserIdStringCastModule (copy), Players (copy), VoiceChatService (copy), FFlagEnablePartyVoiceChangersInLua (copy), GetFFlagBatchVoiceParticipantsUpdatesModule (copy), FFlagEnableVoiceChatMuteForVideoCaptures (copy), GetFFlagMicConsumerRegistryModule (copy), GetFFlagCoreMicManagerRefactorModule (copy), GetFFlagVoiceChatClientRewriteMasterLuaFunction (copy), StopModerationConnectionOnLeave (copy), v2 (copy), DisableRejoinGroupIdDoubleRead (copy), VoiceVolumeControlsEnableVoiceVolumeEligibilityTelemetry (copy), GetFFlagDisconnectToastClientRewriteFunction (copy), v3 (copy), VoiceVolumeControlsApplyGameSettingsVoiceVolumeEngineFeature (copy), GetFFlagEnableVoiceSignalFunction (copy), VOICEJOINPROGRESS (copy), VoiceVolumeControlsEligibilityModule (copy), v1 (copy), MINVOICECHATAPIVERSIONLOCALMICACTIVITY (copy), GetFFlagLocalMutedNilFixFunction (copy), GetFFlagLuaConsumePlayerModeratedModule (copy), GetFFlagEnableVoiceReverseNudgeModule (copy), UtilsModule (copy), config (copy)
	self:ensureInitialized("setup participant listeners")
	
	if not self.participants then
		self.participants = {}
		self.recentUsersInteractionData = {}
		self.updatedParticipants = {}
		self.participantConnection = self.service.ParticipantsStateChanged:Connect(function(ParticipantsLeft, ParticipantsJoined, UpdatedStates)
			-- upvalues: NewResult (upval), GetFFlagClearUserFromRecentVoiceDataOnLeaveModule (upval), self (copy), StringKeyFixForParticipantsTable (upval), GetFFlagFixGetPlayerByUserIdStringCastModule (upval), Players (upval), VoiceChatService (upval), FFlagEnablePartyVoiceChangersInLua (upval), GetFFlagBatchVoiceParticipantsUpdatesModule (upval), FFlagEnableVoiceChatMuteForVideoCaptures (upval)
			NewResult:trace("Participants state changed")
			
			for _, value in ipairs(ParticipantsLeft) do
				if not GetFFlagClearUserFromRecentVoiceDataOnLeaveModule() and not self.participants[tostring(value)].isMuted then
					self:_setRecentUserState(value, { lastHeardTime = os.time() })
				end
				self.participants[tostring(value)] = nil
				self.participantLeft:Fire(self.participants, value)
				self:emit("OnVoiceParticipantRemoved", value)
			end
			for _, value1 in ipairs(ParticipantsJoined) do
				self.participantJoined:Fire(self.participants, value1)
				self:emit("OnVoiceParticipantAdded", value1)
			end
			for _, updatedState in pairs(UpdatedStates) do
				local UserId = updatedState.userId
				local Participant = if StringKeyFixForParticipantsTable then self.participants[tostring(UserId)] else self.participants[UserId]
				
				if not updatedState.isMuted or Participant and not Participant.isMuted then
					self:_setRecentUserState(UserId, {
						lastHeardTime = os.time(),
						player = if GetFFlagFixGetPlayerByUserIdStringCastModule() then Players:GetPlayerByUserId((tonumber(UserId))) else Players:GetPlayerByUserId(UserId)
					})
				end
				if not Participant or Participant.isMuted ~= updatedState.isMuted then
					self:emit("OnVoiceParticipantToggleMuted", UserId, updatedState.isMuted)
				end
				if VoiceChatService.UseNewAudioApi then
					updatedState.isMutedLocally = not not self.mutedPlayers[UserId]
				end
				if VoiceChatService.UseNewAudioApi then
					updatedState.isMutedLocally = if self.mutedPlayers[UserId] then not not self.mutedPlayers[UserId] else updatedState.isMutedLocally
				end
				if FFlagEnablePartyVoiceChangersInLua and VoiceChatService.UseNewAudioApi then
					updatedState.isVoiceChangerActive = if self.voiceChangerActivePlayers[UserId] then self.voiceChangerActivePlayers[UserId] else updatedState.isVoiceChangerActive
				end
				if self.muteAll then
					updatedState.isMutedLocally = true
				end
				self.participants[tostring(UserId)] = updatedState
				
				if GetFFlagBatchVoiceParticipantsUpdatesModule() then
					self.updatedParticipants[tostring(UserId)] = updatedState
				end
				if FFlagEnableVoiceChatMuteForVideoCaptures and self.CaptureService:IsCapturingVideo() then
					self.voiceCapturedDuringVideoCapture = self.voiceCapturedDuringVideoCapture or updatedState.isSignalActive
				end
			end
			self:_updateRecentUsersInteractionData()
			
			if self.shouldThrottleParticipantUpdate then
				local CurrentTime = tick()
				
				if self.participantsStateThrottleTime <= CurrentTime - self.lastParticipantsStateUpdate and #UpdatedStates > 0 then
					self.lastParticipantsStateUpdate = CurrentTime
					self.participantsUpdate:Fire(if GetFFlagBatchVoiceParticipantsUpdatesModule() then self.updatedParticipants else self.participants)
					self.updatedParticipants = {}
					
					return
				end
				if #UpdatedStates > 0 then
					local ParticipantsStateThrottleTimeDelta = self.participantsStateThrottleTime - (CurrentTime - self.lastParticipantsStateUpdate)
					self.lastStateUpdateCounter = (self.lastStateUpdateCounter + 1) % 100
					local LastStateUpdateCounter = self.lastStateUpdateCounter
					task.wait(ParticipantsStateThrottleTimeDelta)
					
					if LastStateUpdateCounter == self.lastStateUpdateCounter then
						self.participantsUpdate:Fire(if GetFFlagBatchVoiceParticipantsUpdatesModule() then self.updatedParticipants else self.participants)
						self.updatedParticipants = {}
						
						return
					end
				end
			elseif #UpdatedStates > 0 then
				self.participantsUpdate:Fire(if GetFFlagBatchVoiceParticipantsUpdatesModule() then self.updatedParticipants else self.participants)
				self.updatedParticipants = {}
			end
		end)
		local FFlagCoreMicManagerRefactorModule = GetFFlagMicConsumerRegistryModule() and GetFFlagCoreMicManagerRefactorModule()
		
		local function onStateChanged(OldState, NewState)
			-- upvalues: self (copy), GetFFlagVoiceChatClientRewriteMasterLuaFunction (upval), NewResult (upval), StopModerationConnectionOnLeave (upval), v2 (upval), DisableRejoinGroupIdDoubleRead (upval), FFlagCoreMicManagerRefactorModule (copy), VoiceVolumeControlsEnableVoiceVolumeEligibilityTelemetry (upval), GetFFlagDisconnectToastClientRewriteFunction (upval), v3 (upval), VoiceVolumeControlsApplyGameSettingsVoiceVolumeEngineFeature (upval), GetFFlagEnableVoiceSignalFunction (upval), VOICEJOINPROGRESS (upval), VoiceVolumeControlsEligibilityModule (upval), VoiceChatService (upval)
			self:emit("OnStateChanged", OldState, NewState)
			local IsNewStateMatch = NewState == Enum.VoiceChatState.Failed
			local IsNewStateMatch1 = NewState == Enum.VoiceChatState.Joining
			local IsNewStateMatch2 = NewState == Enum.VoiceChatState.Leaving
			local IsNewStateMatch3 = NewState == Enum.VoiceChatState.Ended
			local IsPublishPaused = self.service:IsPublishPaused()
			
			if IsPublishPaused == self.localMuted or IsNewStateMatch or IsNewStateMatch1 or IsNewStateMatch2 or IsNewStateMatch3 then
				if IsNewStateMatch1 or IsNewStateMatch2 or IsNewStateMatch3 then
					self.localMuted = nil
				end
			else
				self.localMuted = IsPublishPaused
				self.muteChanged:Fire(IsPublishPaused)
			end
			if GetFFlagVoiceChatClientRewriteMasterLuaFunction() and NewState == Enum.VoiceChatState.Joined and self.isInCall and IsPublishPaused ~= self.callMutedState then
				NewResult:debug("In call, setting local muted to call muted state {}", self.callMutedState)
				self:ToggleMic("InitInCall")
			end
			if StopModerationConnectionOnLeave and NewState == Enum.VoiceChatState.Joined then
				self:StartModerationSignal()
			end
			if v2 and NewState == Enum.VoiceChatState.Joined then
				self:_syncLocalAudioDeviceActive()
			end
			if NewState == Enum.VoiceChatState.Leaving then
				if not DisableRejoinGroupIdDoubleRead or not self.previousGroupId then
					self.previousGroupId = self.service:GetGroupId()
				end
				self.previousMutedState = self.service:IsPublishPaused()
			end
			if NewState == Enum.VoiceChatState.Ended or IsNewStateMatch then
				self.participants = {}
				self.localMuted = nil
				
				if FFlagCoreMicManagerRefactorModule then
					self.micManager:UnregisterConsumer("voice_chat")
				end
				if VoiceVolumeControlsEnableVoiceVolumeEligibilityTelemetry then
					self._voiceVolumeEligibilityReported = false
				end
				self.participantsUpdate:Fire(self.participants)
				
				if StopModerationConnectionOnLeave then
					self:StopModerationSignal()
				end
				if v2 then
					self:_syncLocalAudioDeviceActive()
				end
				if IsNewStateMatch then
					NewResult:debug("State Changed to Failed. Reason: {}", self.service:GetAndClearCallFailureMessage())
				end
				if OldState == Enum.VoiceChatState.Joining or OldState == Enum.VoiceChatState.JoiningRetry or OldState == Enum.VoiceChatState.Joined then
					if NewState == Enum.VoiceChatState.Ended then
						NewResult:debug("State Changed to Ended from {}", OldState)
					end
					if not GetFFlagDisconnectToastClientRewriteFunction() or not self:IsSeamlessVoice() or self:GetVoiceConnectCookieValue() then
						self:emit("OnRetryRequested")
					end
				end
				if v3 and VoiceVolumeControlsApplyGameSettingsVoiceVolumeEngineFeature then
					self:ReportVoiceVolumeImpressionsIfNeeded()
				end
			end
			if GetFFlagEnableVoiceSignalFunction() and self.VoiceJoinProgress == VOICEJOINPROGRESS.Joining and NewState == Enum.VoiceChatState.Joined then
				self:ChangeVoiceJoinProgress(VOICEJOINPROGRESS.Joined)
				self:emit("OnVoiceJoin")
			end
			if v3 and VoiceVolumeControlsApplyGameSettingsVoiceVolumeEngineFeature and NewState == Enum.VoiceChatState.Joined then
				self._voiceJoinTimestampMs = DateTime.now().UnixTimestampMillis
				self._voiceVolumeSliderEligibleAtJoin = VoiceVolumeControlsEligibilityModule.isVoiceChatVolumeSliderVisible(true, VoiceChatService.UseNewAudioApi)
			end
			if VoiceVolumeControlsEnableVoiceVolumeEligibilityTelemetry and (VoiceVolumeControlsApplyGameSettingsVoiceVolumeEngineFeature and NewState == Enum.VoiceChatState.Joined and not self._voiceVolumeEligibilityReported) then
				local Success, Result = pcall(function()
					return UserSettings():GetService("UserGameSettings").VoiceChatVolume
				end)
				local UseNewAudioApi = VoiceChatService.UseNewAudioApi
				local VoiceAnalyticsData = self:GetVoiceAnalyticsData()
				self.Analytics:reportVoiceVolumeEligibility({
					playSessionId = VoiceAnalyticsData.playSessionId,
					voiceSessionId = VoiceAnalyticsData.voiceSessionId,
					voiceChatVolume = if Success then Result else nil,
					usesNewAudioApi = UseNewAudioApi,
					enablesVoiceVolumeControls = VoiceVolumeControlsEligibilityModule.isCreatorVoiceVolumeControlsEnabled(),
					isEligible = VoiceVolumeControlsEligibilityModule.isVoiceChatVolumeSliderVisible(true, UseNewAudioApi)
				})
				self._voiceVolumeEligibilityReported = true
			end
		end
		
		if self.service.VoiceChatState and self.service.VoiceChatState == Enum.VoiceChatState.Joined then
			NewResult:debug("Joined voice chat {}", self.service.VoiceChatState)
			onStateChanged(nil, Enum.VoiceChatState.Joined)
		end
		self.stateConnection = self.service.StateChanged:Connect(onStateChanged)
		
		if GetFFlagCoreMicManagerRefactorModule() then
			self.micManager:SetupMicActivityListener(self.service)
			
			if GetFFlagMicConsumerRegistryModule() then
				local LocalPlayer = Players.LocalPlayer
				self.micManager:RegisterConsumer({
					id = "voice_chat",
					consumerType = "VoiceChat",
					device = if LocalPlayer then LocalPlayer:FindFirstChildOfClass("AudioDeviceInput") else nil
				})
			end
		elseif v1 and VoiceChatService.UseNewAudioApi then
			if not self.localMeteringTask then
				self.localMeteringTask = task.spawn(function()
					-- upvalues: self (copy)
					while true do
						self:UpdateLocalMetering()
						task.wait()
					end
				end)
			end
		elseif MINVOICECHATAPIVERSIONLOCALMICACTIVITY <= self.service:GetVoiceChatApiVersion() then
			self.micConnection = self.service.PlayerMicActivitySignalChange:Connect(function(ActivityInfo)
				-- upvalues: FFlagEnableVoiceChatMuteForVideoCaptures (upval), self (copy), GetFFlagLocalMutedNilFixFunction (upval)
				if FFlagEnableVoiceChatMuteForVideoCaptures and self.CaptureService:IsCapturingVideo() then
					self.voiceCapturedDuringVideoCapture = self.voiceCapturedDuringVideoCapture or ActivityInfo.isActive
				end
				self.isTalking = ActivityInfo.isActive
				
				if GetFFlagLocalMutedNilFixFunction() then
					if self.localMuted == false then
						self.talkingChanged:Fire(self.isTalking)
						
						return
					end
				elseif not self.localMuted then
					self.talkingChanged:Fire(self.isTalking)
				end
			end)
		end
		if GetFFlagLuaConsumePlayerModeratedModule() then
			self:StartModerationSignal()
		elseif game:GetEngineFeature("VoiceChatServicePlayerModeratedEvent") then
			self.playerModeratedConnection = self.service.LocalPlayerModerated:connect(function()
				-- upvalues: NewResult (upval), self (copy), GetFFlagVoiceChatClientRewriteMasterLuaFunction (upval), VoiceChatService (upval)
				NewResult:debug("User Moderated old")
				self.previousSessionId = self.service:GetSessionId()
				self:emit("OnPlayerModerated")
				
				if GetFFlagVoiceChatClientRewriteMasterLuaFunction() then
					VoiceChatService:leaveVoice()
					
					return
				else
					self.service:Leave()
				end
			end)
		end
		NewResult:trace("Setting up voice nudge handlers")
		self.voiceToxicityModalConnection = self:GetSignalREvent("VoiceToxicityModal"):Connect(function(p4)
			-- upvalues: self (copy)
			self.Analytics:reportReceivedNudge(p4, self:GetNudgeAnalyticsData())
			self:emit("OnVoiceToxicityModal")
		end)
		self.VoiceToxicityToastConnection = self:GetSignalREvent("VoiceToxicityToast"):Connect(function(p4)
			-- upvalues: self (copy)
			self.Analytics:reportReceivedNudge(p4, self:GetNudgeAnalyticsData())
			self:emit("OnVoiceToxicityToast")
		end)
		
		if GetFFlagEnableVoiceReverseNudgeModule() then
			NewResult:trace("Setting up voice reverse nudge handlers")
			self.voiceReverseNudgeConnection = self:GetSignalREvent("VoiceReverseNudgeIconColorChange"):Connect(function(p4)
				-- upvalues: self (copy)
				self:emit("OnVoiceReverseNudgeIconColorChange", p4)
			end)
		end
		self.blockConnection = self.BlockStatusChanged:Connect(function(UserId, p4)
			-- upvalues: self (copy), NewResult (upval), UtilsModule (upval)
			if not p4 then
				NewResult:debug("UnBlocking {}", UtilsModule.shorten(UserId))
				self.service:SubscribeUnblock(UserId)
			elseif self.participants[tostring(UserId)] then
				NewResult:debug("Blocking {}", UtilsModule.shorten(UserId))
				self.service:SubscribeBlock(UserId)
				
				return
			end
		end)
		
		if VoiceChatService.UseNewAudioApi then
			self:hookupAudioDeviceInputListener()
		end
		if self.service.TempSetMicMutedToggleMic then
			self.tempSetMicMutedToggleMicConnection = self.service.TempSetMicMutedToggleMic:connect(function()
				-- upvalues: self (copy)
				self:ToggleMic("TempSetMicMutedToggleMic")
			end)
		end
		if FFlagEnableVoiceChatMuteForVideoCaptures then
			self.videoCaptureInProgressConnection = self.CaptureService.VideoCaptureInProgress:connect(function(IsInProgress)
				-- upvalues: self (copy), config (upval)
				if IsInProgress then
					self.voiceCapturedDuringVideoCapture = false
					
					return
				else
					self.TelemetryService:LogEvent(config, {
						customFields = { voiceCaptured = self.voiceCapturedDuringVideoCapture }
					})
				end
			end)
		end
	end
end

local NewResult1 = nil

function config1.CheckAudioInputExists(p4)
	-- upvalues: NewResult (copy), NewResult1 (ref), PromiseModule (copy), CryoModule (copy)
	NewResult:trace("Checking for AudioDeviceInput")
	
	if not NewResult1 then
		NewResult1 = PromiseModule.new(function(Callback: () -> (), _)
			-- upvalues: CryoModule (upval), p4 (copy), NewResult (upval)
			if #CryoModule.Dictionary.keys(p4.audioDevices) > 0 then
				NewResult:trace("Found existing AudioDeviceInput")
				Callback()
				
				return
			else
				p4.audioDeviceInputAdded.Event:Connect(function()
					-- upvalues: NewResult (upval), Callback (copy)
					NewResult:trace("Found new AudioDeviceInput")
					Callback()
				end)
			end
		end)
	end
	return NewResult1
end

function config1:checkAndUpdateSequence(Namespace, SequenceNumber): number
	if not SequenceNumber then
		return 0
	end
	if not self.SequenceNumbers[Namespace] then
		self.SequenceNumbers[Namespace] = SequenceNumber
		
		return 0
	end
	local SequenceNumberDelta = SequenceNumber - self.SequenceNumbers[Namespace]
	
	if SequenceNumberDelta > 0 then
		self.SequenceNumbers[Namespace] = SequenceNumber
	end
	return SequenceNumberDelta - 1
end

local function _(Object)
	-- upvalues: CoreGui (copy)
	return Object:IsDescendantOf(CoreGui)
end

function config1:onInstanceAdded(AudioDeviceInput)
	-- upvalues: FFlagExpChatDictation (copy), CoreGui (copy), NewResult (copy)
	if AudioDeviceInput:IsA("AudioDeviceInput") then
		if FFlagExpChatDictation and AudioDeviceInput:IsDescendantOf(CoreGui) then return end
		NewResult:debug("Found new audio device instance for {}", AudioDeviceInput.Player and AudioDeviceInput.Player.Name)
		self.audioDevices[AudioDeviceInput] = self:CreateAudioDeviceData(AudioDeviceInput)
		self:emit("OnAudioDeviceInputAdded")
		self:StartAnalysis(AudioDeviceInput)
	end
end

function config1:GetSendMuteEvent()
	-- upvalues: RobloxReplicatedStorage (copy)
	if not self.SendMuteEvent then
		self.SendMuteEvent = RobloxReplicatedStorage:WaitForChild("SetUserActive", 10)
	end
	return self.SendMuteEvent
end

function config1:GetToggleVoiceChangerEvent()
	-- upvalues: ReplicatedStorage (copy)
	if not self.SendVoiceChangerEvent then
		self.SendVoiceChangerEvent = ReplicatedStorage:WaitForChild("ToggleUserVoiceChanger", 10)
	end
	return self.SendVoiceChangerEvent
end

function config1:GetInputToModifierWire()
	-- upvalues: Players (copy)
	if not self.InputToModifierWire then
		self.InputToModifierWire = Players.LocalPlayer:FindFirstChild("InputToModifier")
	end
	return self.InputToModifierWire
end

function config1:GetPartyVoiceDeviceInput()
	-- upvalues: Players (copy)
	if not self.PartyVoiceDeviceInput then
		self.PartyVoiceDeviceInput = Players.LocalPlayer:FindFirstChild("PartyVoiceDeviceInput")
	end
	return self.PartyVoiceDeviceInput
end

function config1:GetSetVoicePackEvent()
	-- upvalues: ReplicatedStorage (copy)
	if not self.SetVoicePackEvent then
		self.SetVoicePackEvent = ReplicatedStorage:WaitForChild("SetVoicePack", 10)
	end
	return self.SetVoicePackEvent
end

function config1:GetVoiceChangerWasToggledEvent()
	-- upvalues: ReplicatedStorage (copy)
	if not self.VoiceChangerWasToggledEvent then
		self.VoiceChangerWasToggledEvent = ReplicatedStorage:WaitForChild("VoiceChangerWasToggled", 3)
	end
	return self.VoiceChangerWasToggledEvent
end

local _ = function(SourceInstance, Parent)
	local Wire = Instance.new("Wire")
	Wire.SourceInstance = SourceInstance
	Wire.TargetInstance = Parent
	Wire.Parent = Parent
	
	return Wire
end

local _ = function()
	-- upvalues: RobloxReplicatedStorage (copy)
	return RobloxReplicatedStorage
end

function config1:GetAnalyzer(Player)
	-- upvalues: RobloxReplicatedStorage (copy)
	local Text = Player.Name .. "_Analyzer"
	local Text1 = RobloxReplicatedStorage:FindFirstChild(Text)
	
	if not Text1 then
		Text1 = Instance.new("AudioAnalyzer")
		Text1.SpectrumEnabled = false
		Text1.Name = Text
		Text1.Parent = RobloxReplicatedStorage
	end
	return Text1
end

local _ = function(p4: number): number
	return math.log10(p4) * 20
end

function config1.IsSignalActive(p4, UserId): boolean
	-- upvalues: v1 (copy), Players (copy)
	if v1 then
		local Player = Players:GetPlayerByUserId(UserId)
		
		return if Player then math.log10(p4:GetAnalyzer(Player).PeakLevel) * 20 > -36 else false
	else
		return false
	end
end

function config1:StopAnalysis(AudioDeviceInput)
	-- upvalues: v1 (copy), RobloxReplicatedStorage (copy)
	if not v1 then return end
	for _, connectedWire in AudioDeviceInput:GetConnectedWires("Output") do
		local TargetInstance = connectedWire.TargetInstance
		
		if TargetInstance and TargetInstance:IsDescendantOf(RobloxReplicatedStorage) then
			connectedWire:Destroy()
		end
	end
end

function config1:StartAnalysis(SourceInstance)
	-- upvalues: v1 (copy)
	if not v1 then return end
	self:StopAnalysis(SourceInstance)
	local Player = SourceInstance.Player
	
	if Player then
		local Analyzer = self:GetAnalyzer(Player)
		local Wire = Instance.new("Wire")
		Wire.SourceInstance = SourceInstance
		Wire.TargetInstance = Analyzer
		Wire.Parent = Analyzer
		
		return
	end
end

function config1.GetVoiceConnectCookie(p4)
	-- upvalues: ConstantsModule (copy)
	local Success, Result = pcall(function()
		-- upvalues: p4 (copy), ConstantsModule (upval)
		return p4.AppStorageService:GetItem(ConstantsModule.VOICE_CONNECT_DISCONNECT_KEY_V3)
	end)
	
	return if Success and Result then Result else ""
end

function config1.GetVoiceConnectCookieValue(p4): boolean
	-- upvalues: GetFFlagEnableVoiceUxUpdatesFunction (copy), ConstantsModule (copy)
	if GetFFlagEnableVoiceUxUpdatesFunction() then
		local Success, Result = pcall(function()
			-- upvalues: p4 (copy), ConstantsModule (upval)
			return p4.AppStorageService:GetItem(ConstantsModule.VOICE_CONNECT_DISCONNECT_KEY_V3)
		end)
		
		return not Success or Result == "true"
	else
		local Success1, Result1 = pcall(function()
			-- upvalues: p4 (copy), ConstantsModule (upval)
			return p4.AppStorageService:GetItem(ConstantsModule.VOICE_CONNECT_DISCONNECT_KEY_V2)
		end)
		
		return not Success1 or Result1 == "true"
	end
end

function config1.SetVoiceConnectCookieValue(p4, p5)
	-- upvalues: GetFFlagEnableVoiceUxUpdatesFunction (copy), ConstantsModule (copy)
	return if GetFFlagEnableVoiceUxUpdatesFunction() then pcall(function()
		-- upvalues: p4 (copy), ConstantsModule (upval), p5 (copy)
		p4.AppStorageService:SetItem(ConstantsModule.VOICE_CONNECT_DISCONNECT_KEY_V3, (tostring(p5)))
		p4.AppStorageService:Flush()
	end) else pcall(function()
		-- upvalues: p4 (copy), ConstantsModule (upval), p5 (copy)
		p4.AppStorageService:SetItem(ConstantsModule.VOICE_CONNECT_DISCONNECT_KEY_V2, (tostring(p5)))
		p4.AppStorageService:Flush()
	end)
end

function config1.GetVoiceRewarmCookie(p4)
	-- upvalues: ConstantsModule (copy), NewResult (copy)
	local Success, Result = pcall(function()
		-- upvalues: p4 (copy), ConstantsModule (upval)
		return p4.AppStorageService:GetItem(ConstantsModule.VOICE_REWARM_KEY)
	end)
	
	if Success and Result then
		NewResult:debug("Got voice re-warm cookie: {}", Result)
		
		return Result
	else
		NewResult:debug("Voice re-warm cookie not set, returning empty string")
		
		return ""
	end
end

function config1.SetVoiceRewarmCookie(p4, p5)
	-- upvalues: NewResult (copy), ConstantsModule (copy)
	NewResult:debug("Setting voice re-warm cookie to {}", p5)
	pcall(function()
		-- upvalues: p4 (copy), ConstantsModule (upval), p5 (copy)
		p4.AppStorageService:SetItem(ConstantsModule.VOICE_REWARM_KEY, (tostring(p5)))
		p4.AppStorageService:Flush()
	end)
end

function config1:ShouldRewarmUser(): boolean
	return self:GetVoiceRewarmCookie() == ""
end

function config1:RewarmUser()
	self:SetVoiceRewarmCookie("true")
end

function config1.SetNewUserFTUXCookieValue(p4, p5)
	-- upvalues: ConstantsModule (copy)
	return (pcall(function()
		-- upvalues: p4 (copy), ConstantsModule (upval), p5 (copy)
		p4.AppStorageService:SetItem(ConstantsModule.SEAMLESS_VOICE_FTUX_KEY, (tostring(p5)))
		p4.AppStorageService:Flush()
	end))
end

function config1:SetAndSyncActive(p4, Active)
	-- upvalues: GetFFlagCoreMicManagerRefactorModule (copy), Players (copy)
	if GetFFlagCoreMicManagerRefactorModule() then
		return self.micManager:SetAndSyncActive(p4, Active)
	end
	p4.Active = Active
	local SendMuteEvent = self:GetSendMuteEvent()
	
	if SendMuteEvent and p4.Player == Players.LocalPlayer then
		SendMuteEvent:FireServer(Active)
	end
end

function config1:CreateAudioDeviceData(Object)
	-- upvalues: Players (copy), EnableMutedByLocalUserEngineFeature (copy), NewResult (copy), FFlagDebugShowAudioDeviceInputDebugger (copy), v2 (copy), VoiceChatService (copy)
	local t = {}
	local IsPlayerMatch = Object.Player == Players.LocalPlayer
	
	if EnableMutedByLocalUserEngineFeature then
		if not Object.MutedByLocalUser then
			if self.muteAll and not IsPlayerMatch then
				Object.MutedByLocalUser = true
			end
			if Object.Player and self.mutedPlayers[Object.Player.UserId] then
				Object.MutedByLocalUser = true
			end
		end
	elseif Object.Active then
		if self.muteAll and not IsPlayerMatch then
			Object.Active = false
		end
		if Object.Player and self.mutedPlayers[Object.Player.UserId] then
			Object.Active = false
		end
	end
	if Object.Active and IsPlayerMatch and self.localMuted == nil then
		self:SetAndSyncActive(Object, false)
	end
	if IsPlayerMatch and self.localMuted ~= nil and self.localMuted ~= not Object.Active and not self.isInCall then
		NewResult:debug("Mismatch between LocalMuted and device.Active")
		local NoLocalMuted = not self.localMuted
		Object.Active = NoLocalMuted
		local SendMuteEvent = self:GetSendMuteEvent()
		
		if SendMuteEvent then
			SendMuteEvent:FireServer(NoLocalMuted)
		end
	elseif self.isInCall and IsPlayerMatch then
		local NoCallMutedState = not self.callMutedState
		NewResult:debug("Overwriting Active State to match Iris call. .Active = {}", NoCallMutedState)
		Object.Active = NoCallMutedState
		local SendMuteEvent = self:GetSendMuteEvent()
		
		if SendMuteEvent then
			SendMuteEvent:FireServer(NoCallMutedState)
		end
	end
	t.onPlayerChanged = Object:GetPropertyChangedSignal("Player"):Connect(function()
		-- upvalues: IsPlayerMatch (ref), Object (copy), Players (upval), self (copy), NewResult (upval), EnableMutedByLocalUserEngineFeature (upval)
		IsPlayerMatch = Object.Player == Players.LocalPlayer
		
		if IsPlayerMatch then
			if Object.Active and self.localMuted == nil then
				NewResult:debug("Player is still in connecting state, setting Active to false")
				self:SetAndSyncActive(Object, false)
			elseif self.localMuted ~= nil and self.localMuted ~= not Object.Active then
				NewResult:debug("Mismatch between LocalMuted and device.Active")
				self:SetAndSyncActive(Object, not self.localMuted)
			end
		elseif self.muteAll or Object.Player and self.mutedPlayers[Object.Player.UserId] then
			if EnableMutedByLocalUserEngineFeature then
				Object.MutedByLocalUser = true
			else
				Object.Active = false
			end
		end
		self:emit("OnDevicePlayerChanged")
		self:StartAnalysis(Object)
	end)
	t.onMutedChanged = Object:GetPropertyChangedSignal("Muted"):Connect(function()
		-- upvalues: self (copy)
		self:emit("OnDeviceMuteChanged")
	end)
	
	if EnableMutedByLocalUserEngineFeature then
		if FFlagDebugShowAudioDeviceInputDebugger then
			t.onActiveChanged = Object:GetPropertyChangedSignal("Active"):Connect(function()
				-- upvalues: self (copy)
				self:emit("OnDeviceActiveChanged")
			end)
			t.onMutedByLocalUserChanged = Object:GetPropertyChangedSignal("MutedByLocalUser"):Connect(function()
				-- upvalues: self (copy)
				self:emit("OnDeviceMutedByLocalUserChanged")
			end)
		end
	else
		t.onActiveChanged = Object:GetPropertyChangedSignal("Active"):Connect(function()
			-- upvalues: self (copy), IsPlayerMatch (ref), Object (copy)
			self:emit("OnDeviceActiveChanged")
			
			if self.muteAll and not IsPlayerMatch then
				Object.Active = false
			end
			if Object.Player and self.mutedPlayers[Object.Player.UserId] then
				Object.Active = false
			end
		end)
	end
	if v2 and VoiceChatService.UseNewAudioApi then
		t.onActiveChangedDisconnectGuard = Object:GetPropertyChangedSignal("Active"):Connect(function()
			-- upvalues: Object (copy), Players (upval), self (copy)
			if Object.Active and Object.Player == Players.LocalPlayer and self.localMuted == nil then
				self:SetAndSyncActive(Object, false)
			end
		end)
	end
	return t
end

function config1:onInstanceRemove(AudioDeviceInput)
	-- upvalues: FFlagExpChatDictation (copy), CoreGui (copy), NewResult (copy), EnableMutedByLocalUserEngineFeature (copy), FFlagDebugShowAudioDeviceInputDebugger (copy), v1 (copy)
	if AudioDeviceInput:IsA("AudioDeviceInput") then
		if FFlagExpChatDictation and AudioDeviceInput:IsDescendantOf(CoreGui) then return end
		self:StopAnalysis(AudioDeviceInput)
		NewResult:trace("Removing AudioDeviceInput {} {} {}", AudioDeviceInput, "for user", AudioDeviceInput.Player and AudioDeviceInput.Player.UserId)
		local AudioDevice = self.audioDevices[AudioDeviceInput]
		
		if AudioDevice then
			if EnableMutedByLocalUserEngineFeature then
				if FFlagDebugShowAudioDeviceInputDebugger then
					if AudioDevice.onActiveChanged then
						AudioDevice.onActiveChanged:Disconnect()
					end
					if AudioDevice.onMutedByLocalUserChanged then
						AudioDevice.onMutedByLocalUserChanged:Disconnect()
					end
				end
			else
				AudioDevice.onActiveChanged:Disconnect()
			end
			AudioDevice.onMutedChanged:Disconnect()
			AudioDevice.onPlayerChanged:Disconnect()
			
			if AudioDevice.onActiveChangedDisconnectGuard then
				AudioDevice.onActiveChangedDisconnectGuard:Disconnect()
			end
		end
		self.audioDevices[AudioDeviceInput] = nil
		self:emit("OnAudioDeviceInputRemoved")
		
		if v1 and AudioDeviceInput.Player then
			self:GetAnalyzer(AudioDeviceInput.Player):Destroy()
		end
	end
end

function config1:hookupAudioDeviceInputListener()
	-- upvalues: NewResult (copy), Players (copy), SoundService (copy), VoiceChatService (copy), CollectionService (copy), UtilsModule (copy)
	NewResult:debug("Hooking up audio device listeners")
	local LocalPlayer = Players.LocalPlayer
	SoundService.AudioInstanceAdded:Connect(function(AudioDeviceInput)
		-- upvalues: self (copy)
		self:onInstanceAdded(AudioDeviceInput)
	end)
	local AudioDeviceInput = LocalPlayer:FindFirstChildOfClass("AudioDeviceInput")
	NewResult:debug("Found local user audio device {}", AudioDeviceInput)
	
	if AudioDeviceInput then
		self:onInstanceAdded(AudioDeviceInput)
	end
	if VoiceChatService.EnableDefaultVoice then
		NewResult:debug("Creating default voice listener")
		
		if not game:GetEngineFeature("SoundServiceControlsDefaultListenerLocation") then
			local AudioListener = Instance.new("AudioListener")
			AudioListener.Parent = workspace.CurrentCamera
			local Wire = Instance.new("Wire")
			Wire.Parent = AudioListener
			local AudioDeviceOutput = Instance.new("AudioDeviceOutput")
			AudioDeviceOutput.Parent = Wire
			Wire.SourceInstance = AudioListener
			Wire.TargetInstance = AudioDeviceOutput
		end
		for _, value in CollectionService:GetTagged("RbxDefaultVoiceEmitter") do
			UtilsModule.destroyDefaultEmitter(value)
		end
		CollectionService:GetInstanceAddedSignal("RbxDefaultVoiceEmitter"):Connect(UtilsModule.destroyDefaultEmitter)
		LocalPlayer.CharacterAdded:Connect(UtilsModule.avoidEmitting)
		
		if LocalPlayer.Character then
			UtilsModule.avoidEmitting(LocalPlayer.Character)
		end
	end
	game.DescendantRemoving:Connect(function(Descendant)
		-- upvalues: self (copy)
		self:onInstanceRemove(Descendant)
	end)
	
	for _, descendant in game:GetDescendants() do
		self:onInstanceAdded(descendant)
	end
	Players.PlayerRemoving:Connect(function(Player)
		-- upvalues: self (copy)
		for audioDevice in self.audioDevices do
			if audioDevice.Player and audioDevice.Player == Player then
				self:onInstanceRemove(audioDevice)
			end
		end
	end)
end

function config1.RejoinCurrentChannel(p4)
	-- upvalues: NewResult (copy)
	pcall(function()
		-- upvalues: p4 (copy), NewResult (upval)
		local GroupId = p4.service:GetGroupId()
		
		if GroupId and GroupId ~= "" then
			local IsPublishPaused = p4.service:IsPublishPaused()
			p4.service:Leave()
			NewResult:debug("Rejoining current channel {}", GroupId)
			p4.participants = {}
			p4.participantsUpdate:Fire(p4.participants)
			
			if not p4.service:JoinByGroupIdToken(GroupId, IsPublishPaused, true) then
				p4:emit("OnInitialJoinFailed")
			end
		end
	end)
end

function config1.RejoinChannel(p4, GroupId, IsMicMuted)
	-- upvalues: NewResult (copy)
	NewResult:debug("Rejoining previous channel {} with mute status {}", GroupId, IsMicMuted)
	
	if GroupId and GroupId ~= "" then
		pcall(function()
			-- upvalues: p4 (copy), GroupId (copy), IsMicMuted (copy)
			p4.service:Leave()
			p4.participants = {}
			p4.participantsUpdate:Fire(p4.participants)
			
			if not p4.service:JoinByGroupIdToken(GroupId, IsMicMuted, true) then
				p4:emit("OnInitialJoinFailed")
			end
		end)
	end
end

function config1:RejoinVoice()
	-- upvalues: GetFFlagVoiceChatClientRewriteMasterLuaFunction (copy), NewResult (copy), VoiceChatService (copy)
	if GetFFlagVoiceChatClientRewriteMasterLuaFunction() then
		NewResult:debug("Rejoining voice")
		self.participants = {}
		self.participantsUpdate:Fire(self.participants)
		VoiceChatService:rejoinVoice()
	end
end

function config1:watchSignalR()
	-- upvalues: WATCHEDNAMESPACES (copy), UtilsModule (copy), NewResult (copy)
	self.signalRConnection = self.NotificationService.RobloxEventReceived:Connect(function(EventData)
		-- upvalues: WATCHEDNAMESPACES (upval), UtilsModule (upval), self (copy), NewResult (upval)
		local Namespace = EventData.namespace
		
		if not WATCHEDNAMESPACES[Namespace] then return end
		local JsonDecodeResult = UtilsModule.jsonDecode(EventData.detail)
		local SignalREvent = self.SignalREventTable[JsonDecodeResult.type]
		
		if SignalREvent then
			SignalREvent:Fire(JsonDecodeResult)
		end
		local SequenceNumber = JsonDecodeResult.SequenceNumber
		NewResult:trace("SignalR message {}: {}", Namespace, SequenceNumber)
		local CheckAndUpdateSequenceResult: number = self:checkAndUpdateSequence(Namespace, SequenceNumber)
		
		if CheckAndUpdateSequenceResult > 0 then
			self.Analytics:reportReconnectDueToMissedSequence()
			
			return
		end
		if CheckAndUpdateSequenceResult < -1 then
			self.Analytics:reportOutOfOrderSequence()
		end
	end)
	self.signalRConnectionChanged = self.NotificationService.RobloxConnectionChanged:Connect(function(ConnectionName, ConnectionState, _, NamespaceSequenceNumbers)
		-- upvalues: NewResult (upval), UtilsModule (upval), WATCHEDNAMESPACES (upval), self (copy)
		if ConnectionName == "signalR" then
			if ConnectionState ~= Enum.ConnectionState.Connected then
				NewResult:info("SignalR disconnected")
				
				return
			end
			for i, value in pairs(UtilsModule.jsonDecode(NamespaceSequenceNumbers)) do
				if WATCHEDNAMESPACES[i] then
					NewResult:trace("SignalR message {}: {}", i, value)
					local CheckAndUpdateSequenceResult: number = self:checkAndUpdateSequence(i, value)
					
					if CheckAndUpdateSequenceResult > 0 then
						self.Analytics:reportReconnectDueToMissedSequence()
					elseif CheckAndUpdateSequenceResult < -1 then
						self.Analytics:reportOutOfOrderSequence()
					end
				end
			end
		end
	end)
end

function config1:StopSignalRConnection()
	if self.signalRConnectionChanged then
		self.signalRConnectionChanged:Disconnect()
		self.signalRConnectionChanged = nil
	end
	if self.signalRConnection then
		self.signalRConnection:Disconnect()
		self.signalRConnection = nil
	end
end

function config1:getService()
	return self.service
end

function config1:ToggleMic(Context)
	-- upvalues: GetFFlagCoreMicManagerRefactorModule (copy), NewResult (copy), GetFFlagJoinWithoutMicPermissionsFunction (copy), PERMISSIONSTATE (copy), PermissionsProtocol (copy), VoiceChatService (copy), Players (copy)
	self:ensureInitialized("toggle mic")
	
	if GetFFlagCoreMicManagerRefactorModule() then
		return self.micManager:SetMicActive(self.micManager.localMuted, Context)
	end
	if self.localMuted == nil then
		NewResult:trace("ToggleMic context: {} - Voice not connected yet", Context)
		
		return
	end
	NewResult:trace("ToggleMic context: {}", Context)
	
	if GetFFlagJoinWithoutMicPermissionsFunction() then
		if self.permissionState == PERMISSIONSTATE.PENDING_MIC then
			NewResult:debug("In pending mic mode, requesting permission")
			self:emit("GetPermissions", function(p4)
				-- upvalues: self (copy), PERMISSIONSTATE (upval), NewResult (upval), Context (copy)
				self.permissionState = if p4.hasMicPermissions then PERMISSIONSTATE.LISTEN_AND_TALK else PERMISSIONSTATE.LISTEN_ONLY
				NewResult:debug("Got permissions, setting state to {}", self.permissionState)
				self:ToggleMic(Context)
			end, { PermissionsProtocol.Permissions.MICROPHONE_ACCESS }, false)
			
			return
		end
		if self.permissionState == PERMISSIONSTATE.LISTEN_ONLY then
			NewResult:debug("User tried to unmute despite being in listen only mode")
			self:emit("OnPermissionRequested")
			
			return
		end
	end
	if self.isPlayerWatchingAd then
		NewResult:trace("User is watching an ad, skipping toggling mic")
		
		return
	end
	if VoiceChatService.UseNewAudioApi then
		self.localMuted = not self.localMuted
		local NoLocalMuted = not self.localMuted
		NewResult:trace("Setting self mute to {} context: {}", NoLocalMuted, Context)
		local SendMuteEvent = self:GetSendMuteEvent()
		
		if SendMuteEvent then
			SendMuteEvent:FireServer(NoLocalMuted)
			
			for audioDevice in self.audioDevices do
				if audioDevice.Player and audioDevice.Player == Players.LocalPlayer then
					audioDevice.Active = NoLocalMuted
				end
			end
			self.muteChanged:Fire(self.localMuted)
		else
			NewResult:error("Could not find SendMuteEvent")
		end
	else
		local Inverted = not self.service:IsPublishPaused()
		NewResult:trace("Setting self mute to {} context: {}", Inverted, Context)
		self.service:PublishPause(Inverted)
		self.localMuted = Inverted
		self.muteChanged:Fire(Inverted)
	end
	if not self.localMuted then
		self.talkingChanged:Fire(self.isTalking)
		self:emit("OnShowDataConsentToast")
	end
	if Context then
		self.Analytics:reportVoiceMuteSelf((self:JoinWithVoiceMuteData({ context = Context, muted = self.localMuted })))
	end
end

function config1:ToggleVoiceChanger(_)
	-- upvalues: VoiceChatService (copy), NewResult (copy)
	self:ensureInitialized("toggle voice changer")
	
	if self.localMuted == nil then return end
	if VoiceChatService.UseNewAudioApi then
		self.isVoiceChangerActive = not self.isVoiceChangerActive
		NewResult:trace("setting voice changer active to {}", self.isVoiceChangerActive)
		local ToggleVoiceChangerEvent = self:GetToggleVoiceChangerEvent()
		
		if ToggleVoiceChangerEvent then
			ToggleVoiceChangerEvent:FireServer(self.isVoiceChangerActive)
			self.voiceChangerChanged:Fire(self.isVoiceChangerActive)
			
			return
		else
			NewResult:error("Could not find ToggleVoiceChangerEvent")
			
			return
		end
	else
		self.isVoiceChangerActive = false
		NewResult:trace("forcibly disabling voice changer since using old audio api", self.isVoiceChangerActive)
		local ToggleVoiceChangerEvent1 = self:GetToggleVoiceChangerEvent()
		
		if ToggleVoiceChangerEvent1 then
			ToggleVoiceChangerEvent1:FireServer(self.isVoiceChangerActive)
			self.voiceChangerChanged:Fire(self.isVoiceChangerActive)
			
			return
		else
			NewResult:error("Could not find ToggleVoiceChangerEvent")
		end
	end
end

function config1:ToggleVoiceChangerHearMyself(_)
	-- upvalues: VoiceChatService (copy), NewResult (copy)
	if self.localMuted == nil then return end
	if VoiceChatService.UseNewAudioApi then
		self.isVoiceChangerHearMyselfActive = not self.isVoiceChangerHearMyselfActive
		local InputToModifierWire = self:GetInputToModifierWire()
		local PartyVoiceDeviceInput = self:GetPartyVoiceDeviceInput()
		
		if InputToModifierWire and PartyVoiceDeviceInput then
			NewResult:trace("setting voice changer hear myself active to {}", self.isVoiceChangerHearMyselfActive)
			
			if self.isVoiceChangerHearMyselfActive then
				InputToModifierWire.SourceInstance = PartyVoiceDeviceInput
			else
				InputToModifierWire.SourceInstance = nil
			end
			self.voiceChangerHearMyselfChanged:Fire(self.isVoiceChangerHearMyselfActive)
			
			return
		else
			NewResult:error("Could not find InputToModifierWire or PartyVoiceDeviceInput")
		end
	end
end

function config1:SetVoicePack(CurrentVoicePack)
	-- upvalues: VoiceChatService (copy), NewResult (copy)
	self:ensureInitialized("set voice pack")
	
	if self.localMuted == nil then return end
	if VoiceChatService.UseNewAudioApi then
		self.currentVoicePack = CurrentVoicePack
		NewResult:trace("setting current voice pack to {}", self.currentVoicePack)
		local SetVoicePackEvent = self:GetSetVoicePackEvent()
		
		if SetVoicePackEvent then
			SetVoicePackEvent:FireServer("VoicePack_" .. self.currentVoicePack)
			
			return
		end
		NewResult:error("Could not find SetVoicePackEvent")
	end
end

function config1:JoinWithVoiceMuteData(p4)
	-- upvalues: Players (copy), CryoModule (copy)
	return CryoModule.Dictionary.join({
		userId = Players.LocalPlayer.UserId,
		clientSessionId = self:GetSessionId(),
		channelId = self:GetChannelId()
	}, p4)
end

function config1:_reportJoinFailed(p4, ERROR)
	self.Analytics:reportVoiceChatJoinResult(false, p4, ERROR)
	self:emit("OnReportJoinFailed", p4)
end

function config1:_syncLocalAudioDeviceActive()
	-- upvalues: GetFFlagCoreMicManagerRefactorModule (copy), VoiceChatService (copy), Players (copy)
	if GetFFlagCoreMicManagerRefactorModule() then
		return self.micManager:SyncLocalAudioDeviceActive()
	end
	if not VoiceChatService.UseNewAudioApi then return end
	local NoLocalMuted: boolean = self.localMuted ~= nil and not self.localMuted
	for audioDevice in self.audioDevices do
		if audioDevice.Player and audioDevice.Player == Players.LocalPlayer then
			audioDevice.Active = NoLocalMuted
		end
	end
end

function config1:_setupEarlyAudioDeviceGuard()
	-- upvalues: GetFFlagCoreMicManagerRefactorModule (copy), VoiceChatService (copy), FFlagExpChatDictation (copy), CoreGui (copy), Players (copy), SoundService (copy)
	if GetFFlagCoreMicManagerRefactorModule() then
		return self.micManager:SetupEarlyAudioDeviceGuard()
	end
	local function _(Object): boolean
		-- upvalues: VoiceChatService (upval), FFlagExpChatDictation (upval), CoreGui (upval), Players (upval), self (copy)
		return VoiceChatService.UseNewAudioApi and (not (FFlagExpChatDictation and Object:IsDescendantOf(CoreGui)) and (Object.Player == Players.LocalPlayer and (Object.Active and self.localMuted == nil)))
	end
	
	local function guardDevice(Object)
		-- upvalues: VoiceChatService (upval), FFlagExpChatDictation (upval), CoreGui (upval), Players (upval), self (copy)
		if VoiceChatService.UseNewAudioApi and (not (FFlagExpChatDictation and Object:IsDescendantOf(CoreGui)) and (Object.Player == Players.LocalPlayer and (Object.Active and self.localMuted == nil))) then
			Object.Active = false
		end
		Object:GetPropertyChangedSignal("Player"):Connect(function()
			-- upvalues: Object (copy), VoiceChatService (upval), FFlagExpChatDictation (upval), CoreGui (upval), Players (upval), self (upval)
			if VoiceChatService.UseNewAudioApi and (not (FFlagExpChatDictation and Object:IsDescendantOf(CoreGui)) and (Object.Player == Players.LocalPlayer and (Object.Active and self.localMuted == nil))) then
				Object.Active = false
			end
		end)
		Object:GetPropertyChangedSignal("Active"):Connect(function()
			-- upvalues: Object (copy), VoiceChatService (upval), FFlagExpChatDictation (upval), CoreGui (upval), Players (upval), self (upval)
			if VoiceChatService.UseNewAudioApi and (not (FFlagExpChatDictation and Object:IsDescendantOf(CoreGui)) and (Object.Player == Players.LocalPlayer and (Object.Active and self.localMuted == nil))) then
				Object.Active = false
			end
		end)
	end
	
	SoundService.AudioInstanceAdded:Connect(function(AudioDeviceInput)
		-- upvalues: guardDevice (copy)
		if AudioDeviceInput:IsA("AudioDeviceInput") then
			guardDevice(AudioDeviceInput)
		end
	end)
	
	for _, AudioDeviceInput in game:GetDescendants() do
		if AudioDeviceInput:IsA("AudioDeviceInput") then
			guardDevice(AudioDeviceInput)
		end
	end
end

function config1:_asyncInit()
	-- upvalues: v2 (copy), NewResult (copy), MINVOICECHATAPIVERSIONISCONTEXTENABLED (copy), GetFFlagVoiceChatClientRewriteMasterLuaFunction (copy), VoiceChatService (copy), AnalyticsModule (copy), PromiseModule (copy)
	self:CheckCallState()
	
	if v2 then
		self:_setupEarlyAudioDeviceGuard()
	end
	return self:canUseServiceAsync():andThen(function(_)
		-- upvalues: NewResult (upval), MINVOICECHATAPIVERSIONISCONTEXTENABLED (upval), self (copy), GetFFlagVoiceChatClientRewriteMasterLuaFunction (upval), VoiceChatService (upval), AnalyticsModule (upval), PromiseModule (upval)
		local ServiceName = "VoiceChatService"
		
		if game:GetEngineFeature("UseNewVoiceChatService") then
			ServiceName = "VoiceChatInternal"
			NewResult:debug("Using VoiceChatInternal")
		end
		local Success, Result = pcall(function()
			-- upvalues: ServiceName (ref), MINVOICECHATAPIVERSIONISCONTEXTENABLED (upval), self (upval)
			local ServiceName1 = game:GetService(ServiceName)
			
			if ServiceName1 and (ServiceName1:GetVoiceChatApiVersion() < MINVOICECHATAPIVERSIONISCONTEXTENABLED or ServiceName1:IsContextVoiceEnabled()) then
				self.voiceEnabled = true
				self.service = ServiceName1
				self:SetupParticipantListeners()
			end
		end)
		
		if GetFFlagVoiceChatClientRewriteMasterLuaFunction() then
			VoiceChatService:joinVoice()
			NewResult:debug("Starting Voice Chat Client Join Operation")
		else
			local VoiceChatService1 = game:GetService("VoiceChatService")
			
			if VoiceChatService1 then
				VoiceChatService1:joinVoice()
				NewResult:debug("Starting Voice Chat Client Join Operation")
			end
		end
		if not Success then
			NewResult:warning("EnableVoiceChat flag is enabled but GetService panicked {}", Result)
			self:_reportJoinFailed("getServiceFailed", AnalyticsModule.ERROR)
			
			return if self.options.passInitErrorInPromiseReject then PromiseModule.reject({ code = "INIT_ERROR_GET_SERVICE_FAILED" }) else PromiseModule.reject()
		elseif self.service then
			self:emit("OnVoiceChatServiceInitialized")
			self:watchSignalR()
			
			return PromiseModule.resolve()
		else
			NewResult:debug("VoiceChatService is not set after init")
			self:_reportJoinFailed("contextNotEnabled")
			
			return if self.options.passInitErrorInPromiseReject then PromiseModule.reject({ code = "INIT_ERROR_CONTEXT_NOT_ENABLED" }) else PromiseModule.reject()
		end
	end)
end

function config1:UpdateLocalMetering()
	-- upvalues: GetFFlagCoreMicManagerRefactorModule (copy), Players (copy)
	if GetFFlagCoreMicManagerRefactorModule() then
		return self.micManager:UpdateLocalMetering()
	end
	self.isTalking = self:IsSignalActive(Players.LocalPlayer.UserId)
	
	if self.localMuted == false then
		self.talkingChanged:Fire(self.isTalking)
	end
end

function config1:asyncInit()
	-- upvalues: NewResult (copy), PromiseModule (copy), ConstantsModule (copy), GetFFlagCoreMicManagerRefactorModule (copy), FFlagEnablePartyVoiceChangersInLua (copy), StringKeyFixForParticipantsTable (copy)
	if self.service then
		NewResult:trace("Manager already initialized")
		
		return PromiseModule.resolve()
	end
	if not self.initPromise then
		self.initPromise = self:_asyncInit()
		
		if self.AdService then
			(function(p4)
				-- upvalues: ConstantsModule (upval), GetFFlagCoreMicManagerRefactorModule (upval)
				local LocalMuted = false
				p4.AdService.RewardedVideoAdStarted:Connect(function()
					-- upvalues: p4 (copy), LocalMuted (ref), ConstantsModule (upval), GetFFlagCoreMicManagerRefactorModule (upval)
					if p4.localMuted == nil then return end
					LocalMuted = p4.localMuted
					
					if not p4.localMuted then
						p4:ToggleMic(ConstantsModule.REWARDED_VIDEO_AD_STARTED)
					end
					p4.isPlayerWatchingAd = true
					
					if GetFFlagCoreMicManagerRefactorModule() then
						p4.micManager:SetAdMuteBlocked(true)
					end
				end)
				p4.AdService.RewardedVideoAdEnded:Connect(function()
					-- upvalues: p4 (copy), GetFFlagCoreMicManagerRefactorModule (upval), LocalMuted (ref), ConstantsModule (upval)
					if p4.localMuted == nil then return end
					p4.isPlayerWatchingAd = false
					
					if GetFFlagCoreMicManagerRefactorModule() then
						p4.micManager:SetAdMuteBlocked(false)
					end
					if LocalMuted ~= p4.localMuted then
						p4:ToggleMic(ConstantsModule.REWARDED_VIDEO_AD_ENDED)
					end
				end)
			end)(self)
		end
		if FFlagEnablePartyVoiceChangersInLua and not self.voiceChangerWasToggledEvent then
			task.spawn(function()
				-- upvalues: self (copy), StringKeyFixForParticipantsTable (upval)
				local VoiceChangerWasToggledEvent = self:GetVoiceChangerWasToggledEvent()
				
				if VoiceChangerWasToggledEvent then
					VoiceChangerWasToggledEvent.OnClientEvent:Connect(function(p4, IsVoiceChangerActive)
						-- upvalues: StringKeyFixForParticipantsTable (upval), self (upval)
						local Participant = if StringKeyFixForParticipantsTable then self.participants[tostring(p4)] else self.participants[p4]
						
						if Participant then
							Participant.isVoiceChangerActive = IsVoiceChangerActive
							self.voiceChangerActivePlayers[p4] = IsVoiceChangerActive
							self.participantsUpdate:Fire(self.participants)
						end
					end)
				end
			end)
		end
	end
	return self.initPromise
end

function config1.IsInitialized(p4): boolean
	return if p4.service then true else false
end

function config1:ensureInitialized(Text)
	if not self.service then
		error("[corescripts VCS Manager] " .. "Attempting to " .. Text .. " before calling init")
	end
end

function config1:GetSessionId()
	self:ensureInitialized("get session id")
	
	return self.service:GetSessionId()
end

function config1:GetChannelId()
	self:ensureInitialized("get channel id")
	
	return self.service:GetChannelId()
end

function config1:Disconnect()
	-- upvalues: GetFFlagCoreMicManagerRefactorModule (copy), GetFFlagMicConsumerRegistryModule (copy), FFlagEnableVoiceChatMuteForVideoCaptures (copy)
	if GetFFlagCoreMicManagerRefactorModule() then
		if GetFFlagMicConsumerRegistryModule() then
			self.micManager:UnregisterConsumer("voice_chat")
		end
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
	if FFlagEnableVoiceChatMuteForVideoCaptures and self.videoCaptureInProgressConnection then
		self.videoCaptureInProgressConnection:Disconnect()
		self.videoCaptureInProgressConnection = nil
	end
end

function config1.RequestHidePublicVoiceUI(p4)
	task.defer(function()
		-- upvalues: p4 (copy)
		p4.setVoiceUIVisibility:Fire(false)
	end)
end

function config1.RequestShowPublicVoiceUI(p4)
	task.defer(function()
		-- upvalues: p4 (copy)
		p4.setVoiceUIVisibility:Fire(true)
	end)
end

config1.default = config1.new(BlockingUtilityModule:GetAfterBlockedStatusChangedEvent(), PermissionsProtocol.default, HttpRbxApiService, nil, nil, nil, nil, nil, ThirdPartyUserService, nil, AdService)

if v3 and VoiceVolumeControlsApplyGameSettingsVoiceVolumeEngineFeature then
	local LocalPlayer = Players.LocalPlayer
	
	if LocalPlayer then
		LocalPlayer.AncestryChanged:Connect(function(_, NewParent)
			-- upvalues: config1 (copy)
			if NewParent == nil then
				config1.default:ReportVoiceVolumeImpressionsIfNeeded()
			end
		end)
	end
end
return config1