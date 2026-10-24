local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local VoiceChatService = game:GetService("VoiceChatService")
local Workspace = game:GetService("Workspace")
local LocalizationService = game:GetService("LocalizationService")
local PromiseModule = require(CorePackages.Packages.Promise)
local RoactModule = require(CorePackages.Packages.Roact)
local LuauPolyfillModule = require(CorePackages.Packages.LuauPolyfill)
local PermissionsProtocol = require(CorePackages.Workspace.Packages.PermissionsProtocol).PermissionsProtocol
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local RobloxGui = CoreGui:WaitForChild("RobloxGui")
local NotificationService = game:GetService("NotificationService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local AppStorageService = game:GetService("AppStorageService")
local SocialUpsellModule = require(CorePackages.Workspace.Packages.SocialUpsell)
local Default = require(CorePackages.Workspace.Packages.LoggingProtocol).default
local NewResult = require(CorePackages.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local IXPServiceWrapper = require(CorePackages.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local VoiceChatCoreModule = require(CorePackages.Workspace.Packages.VoiceChatCore)
local Default1 = require(CorePackages.Workspace.Packages.VoiceChat).GlobalVoiceManager.default
local CreateVoiceRestrictionControllerModule = require(CorePackages.Workspace.Packages.VoiceChat.createVoiceRestrictionController)
local ShowLegacyVoiceRestrictionModule = require(script.Parent.Helpers.showLegacyVoiceRestriction)
local FFlagVoiceChatBanDurationUseServerTimeModule = require(script.Parent.Flags.FFlagVoiceChatBanDurationUseServerTime)
local FFlagProactiveVoiceRestrictionsUFR = require(CorePackages.Workspace.Packages.SharedFlags).FFlagProactiveVoiceRestrictionsUFR
local FFlagProactiveVoiceRestrictionsUFRIXPExposureModule = require(script.Parent.Flags.FFlagProactiveVoiceRestrictionsUFRIXPExposure)
local GetFFlagDisableConsentModalForExistingUsersModule = require(script.Parent.Flags.GetFFlagDisableConsentModalForExistingUsers)
local GetFFlagOnlyEnableJoinVoiceInVoiceEnabledUniversesModule = require(script.Parent.Flags.GetFFlagOnlyEnableJoinVoiceInVoiceEnabledUniverses)
local GetFFlagEnableUniveralVoiceToastsModule = require(RobloxGui.Modules.Flags.GetFFlagEnableUniveralVoiceToasts)
local GetFFlagEnableVoicePromptReasonTextModule = require(RobloxGui.Modules.Flags.GetFFlagEnableVoicePromptReasonText)
local GetFFlagAvatarChatServiceEnabledFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagAvatarChatServiceEnabled
local GetFFlagVoiceChatServiceManagerUseAvatarChatFunction = VoiceChatCoreModule.Flags.GetFFlagVoiceChatServiceManagerUseAvatarChat
local GetFFlagNonVoiceFTUXFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagNonVoiceFTUX
local GetFFlagJoinWithoutMicPermissionsFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagJoinWithoutMicPermissions
local GetFIntVoiceReverseNudgeUXDisplayTimeSecondsModule = require(RobloxGui.Modules.Flags.GetFIntVoiceReverseNudgeUXDisplayTimeSeconds)
local RbxAnalyticsServiceExposePlaySessionIdEngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local GetFFlagEnableSeamlessVoiceDataConsentToastModule = require(RobloxGui.Modules.Flags.GetFFlagEnableSeamlessVoiceDataConsentToast)
local GetFFlagSeamlessVoiceConsentToastPolicyFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagSeamlessVoiceConsentToastPolicy
local GetFFlagEnableFtuxExitOnMuteToggleFunction = VoiceChatCoreModule.Flags.GetFFlagEnableFtuxExitOnMuteToggle
local GetFFlagMicConsumerRegistryFunction = VoiceChatCoreModule.Flags.GetFFlagMicConsumerRegistry
local GetFFlagEnableVoiceChatMuteForVideoCapturesFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableVoiceChatMuteForVideoCaptures
local GetFFlagEnableCrossExperienceVoiceCaptureMuteFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableCrossExperienceVoiceCaptureMute
local GetFFlagExpChatUseVoiceParticipantsStoreFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagExpChatUseVoiceParticipantsStore
local GetFFlagEnableVoiceUxUpdatesFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableVoiceUxUpdates
local FFlagDebugShowAudioDeviceInputDebugger = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagDebugShowAudioDeviceInputDebugger()
local GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module = require(script.Parent.Flags.GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2)
local VoiceNudgeUseNewDACopyModule = require(script.Parent.Helpers.VoiceNudgeUseNewDACopy)
local DebugSkipVoicePermissionCheck = game:DefineFastFlag("DebugSkipVoicePermissionCheck", false)
local DebugSimulateConnectDisconnect = game:DefineFastFlag("DebugSimulateConnectDisconnect", false)
local DebugSkipSeamlessVoiceAPICheck = game:DefineFastFlag("DebugSkipSeamlessVoiceAPICheck", false)
local FixSTUXShowingIncorrectly = game:DefineFastFlag("FixSTUXShowingIncorrectly", false)
local SendUserConnectionStatus = game:DefineFastFlag("SendUserConnectionStatus", false)
local DebugConnectDisconnectInterval = game:DefineFastInt("DebugConnectDisconnectInterval", 15)
local SeamlessVoiceV2JoinVoiceToast = game:DefineFastFlag("SeamlessVoiceV2JoinVoiceToast", false)
local DisablePermissionPromptDeeplink = game:DefineFastFlag("DisablePermissionPromptDeeplink", false)
local VoiceChatPermissionPromptUseMicrophoneRoute = game:DefineFastFlag("VoiceChatPermissionPromptUseMicrophoneRoute", false)
local VoiceEndedCheckDisregardIdleState = game:DefineFastFlag("VoiceEndedCheckDisregardIdleState", false)
local DisableLeaveToastInStudio = game:DefineFastFlag("DisableLeaveToastInStudio", false)
local EnableVerifiedCheckViaOverlay = game:DefineFastFlag("EnableVerifiedCheckViaOverlay", false)
local GetFIntThrottleParticipantsUpdateMsFunction = VoiceChatCoreModule.Flags.GetFIntThrottleParticipantsUpdateMs
local VoiceUIImprovementsIXPLayerName = game:DefineFastString("VoiceUIImprovementsIXPLayerName", "Voice.Exposure")
local ThrottleParticipantsUpdateIXPLayerValue = game:DefineFastString("ThrottleParticipantsUpdateIXPLayerValue", "ThrottleParticipantsUpdate")
local VoiceVolumeControlsGlobalVoiceVolumeSliderIxpExposure = game:DefineFastFlag("VoiceVolumeControlsGlobalVoiceVolumeSliderIxpExposure", false)
local VoiceVolumeControlsGlobalVoiceVolumeSliderIxpLayer = game:DefineFastString("VoiceVolumeControlsGlobalVoiceVolumeSliderIxpLayer", "Voice.VolumeControls")
local SeamlessVoiceSTUXDisplayCount = game:DefineFastInt("SeamlessVoiceSTUXDisplayCount", 3)
local GetFFlagEnableInExpPhoneVoiceUpsellEntrypointsFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints
local GetFFlagShowDevicePermissionsModalFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagShowDevicePermissionsModal
local FFlagEnableRetryForLinkingProtocolFetch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableRetryForLinkingProtocolFetch
local ShowJoinVoiceWhenDisconnectedV3 = game:DefineFastFlag("ShowJoinVoiceWhenDisconnectedV3", false)
local EnableVoiceRewarmReArmV2 = game:DefineFastFlag("EnableVoiceRewarmReArmV2", false)
local FFlagVoiceRewarmGrafanaMetricsModule = require(script.Parent.Flags.FFlagVoiceRewarmGrafanaMetrics)
local FFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule = require(RobloxGui.Modules.Settings.Flags.FFlagVoiceVolumeControlsEnableVoiceChatVolumeSlider)
local FFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule = require(script.Parent.Flags.FFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToast)
local FFlagVoiceRewarmTelemetry = require(CorePackages.Workspace.Packages.SharedFlags).FFlagVoiceRewarmTelemetry
local GuardVoiceInExpUpsellVariant = game:DefineFastFlag("GuardVoiceInExpUpsellVariant", false)
local AlwaysSetJoinVoiceButtonContext = game:DefineFastFlag("AlwaysSetJoinVoiceButtonContext", false)
local GetFFlagIntegratePhoneUpsellJoinVoiceFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagIntegratePhoneUpsellJoinVoice
local GetFFlagInExperiencePhoneUpsellNewCopyFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagInExperiencePhoneUpsellNewCopy
local GetFFlagCheckUniversePlaceBeforeSuspendingFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagCheckUniversePlaceBeforeSuspending
local FIntLinkingProtocolFetchRetries = require(CorePackages.Workspace.Packages.SharedFlags).FIntLinkingProtocolFetchRetries
local FIntLinkingProtocolFetchTimeoutMS = require(CorePackages.Workspace.Packages.SharedFlags).FIntLinkingProtocolFetchTimeoutMS
local VoiceChatModule = require(CorePackages.Workspace.Packages.VoiceChat)
local Constants = VoiceChatModule.Constants
local PostRecordUserSeenGeneralModalFunction = VoiceChatModule.AgeVerificationOverlay.PostRecordUserSeenGeneralModal
local ConstantsModule = require(RobloxGui.Modules.VoiceChat.Constants)
local VoiceChatPromptModule = require(RobloxGui.Modules.VoiceChatPrompt.Components.VoiceChatPrompt)
local AudioDeviceInputDebuggerModule = require(RobloxGui.Modules.VoiceChat.Components.AudioDeviceInputDebugger)
local PromptTypeModule = require(RobloxGui.Modules.VoiceChatPrompt.PromptType)
local GetUserSettingsFunction = VoiceChatModule.GetUserSettings
local GetInformedOfBanFunction = VoiceChatModule.GetInformedOfBan
local PostInformedOfBanFunction = VoiceChatModule.PostInformedOfBan
local GetCamMicPermissionsModule = require(RobloxGui.Modules.Settings.getCamMicPermissions)
local BANREASON = ConstantsModule.BAN_REASON
local SeamlessVoiceStatusModule = require(RobloxGui.Modules.Settings.Enum.SeamlessVoiceStatus)
local UniversalAppPolicyModule = require(CorePackages.Workspace.Packages.UniversalAppPolicy)
local GetFFlagVoiceChatClientRewriteMasterLuaFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagVoiceChatClientRewriteMasterLua
local GetFFlagDisconnectToastClientRewriteFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagDisconnectToastClientRewrite
local Analytics = VoiceChatCoreModule.Analytics
local HttpService = game:GetService("HttpService")
local HttpRbxApiService = game:GetService("HttpRbxApiService")
local BlockingUtilityModule = require(CorePackages.Workspace.Packages.BlockingUtility)
local MicrophoneDevicePermissionsLoggingModule = require(RobloxGui.Modules.Settings.Resources.MicrophoneDevicePermissionsLogging)
local ExpChatModule = require(CorePackages.Workspace.Packages.ExpChat)
local Default2 = require(CorePackages.Workspace.Packages.LinkingProtocol).LinkingProtocol.default
local SettingsRoute = require(CorePackages.Workspace.Packages.LinkingProtocol).Enums.SettingsRoute
local PhoneUpsellController = if GetFFlagEnableInExpPhoneVoiceUpsellEntrypointsFunction() then require(CorePackages.Workspace.Packages.PhoneUpsell).PhoneUpsellController else nil
local PostPhoneUpsellDisplayed = if GetFFlagEnableInExpPhoneVoiceUpsellEntrypointsFunction() then require(CorePackages.Workspace.Packages.PhoneUpsell).Http.Requests.PostPhoneUpsellDisplayed else nil
local CoreVoiceManager = VoiceChatCoreModule.CoreVoiceManager
local GetOverlayStoreFunction = SocialUpsellModule.Overlay.getOverlayStore
local OverlayTypes = SocialUpsellModule.Overlay.OverlayTypes
local SocialUpsellType = SocialUpsellModule.Enum.SocialUpsellType
local AnalyticsEnum = SocialUpsellModule.Analytics.Enum
local SocialExperimentsModule = require(CorePackages.Workspace.Packages.SocialExperiments)
local FFlagTestDeviceForFAEUpsell = SocialExperimentsModule.FFlagTestDeviceForFAEUpsell
local DeviceMeetsRequirementsForFAEFunction = SocialExperimentsModule.deviceMeetsRequirementsForFAE
local EnableMutedByLocalUserEngineFeature = game:GetEngineFeature("EnableMutedByLocalUser")
local FFlagEnablePartyVoiceChangersInLua = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnablePartyVoiceChangersInLua
local VoiceVolumeControlsEligibility = VoiceChatCoreModule.VoiceVolumeControlsEligibility
local VOICESTATE = Constants.VOICE_STATE
local VOICECHATDEVICETYPE = Constants.VOICE_CHAT_DEVICE_TYPE
local VOICECHATAVAILABILITY = Constants.VOICE_CHAT_AVAILABILITY
local MINVOICECHATAPIVERSION = Constants.MIN_VOICE_CHAT_API_VERSION
local WATCHEDMESSAGETYPES = Constants.WATCHED_MESSAGE_TYPES
local PERMISSIONSTATE = Constants.PERMISSION_STATE
local VOICEJOINPROGRESS = VoiceChatCoreModule.Constants.VOICE_JOIN_PROGRESS
local VoiceChatServiceManager = {
	available = nil,
	version = nil,
	participants = nil,
	recentUsersInteractionData = nil,
	permissionPromise = nil,
	canUseServicePromise = nil,
	localMuted = nil,
	isTalking = false,
	previousGroupId = nil,
	previousMutedState = nil,
	pendingDisconnectReason = nil,
	userEligible = false,
	HttpRbxApiService = HttpRbxApiService,
	NotificationService = NotificationService,
	runService = RunService,
	PermissionsService = PermissionsProtocol.default,
	communicationPermissionsResult = nil,
	VoiceJoinProgress = VOICEJOINPROGRESS.Idle,
	VoiceJoinProgressChanged = Instance.new("BindableEvent"),
	participantJoined = Instance.new("BindableEvent"),
	participantLeft = Instance.new("BindableEvent"),
	participantsUpdate = Instance.new("BindableEvent"),
	muteChanged = Instance.new("BindableEvent"),
	muteAllChanged = Instance.new("BindableEvent"),
	attemptVoiceRejoin = Instance.new("BindableEvent"),
	showVoiceUI = Instance.new("BindableEvent"),
	hideVoiceUI = Instance.new("BindableEvent"),
	voiceUIVisible = false,
	mutedNonFriends = Instance.new("BindableEvent"),
	userAgencySelected = Instance.new("BindableEvent"),
	sendMuteEvent = nil,
	muteAll = false,
	mutedPlayers = {},
	talkingChanged = Instance.new("BindableEvent"),
	SignalREventTable = {},
	audioDevices = {},
	service = nil,
	previousSessionId = nil,
	voiceEnabled = false,
	VOICE_STATE = VOICESTATE,
	permissionState = if GetFFlagJoinWithoutMicPermissionsFunction() then PERMISSIONSTATE.IDLE else nil,
	isBanned = false,
	bannedUntil = nil,
	errorText = nil,
	BlockStatusChanged = nil,
	isInCall = false,
	callMutedState = false,
	banReason = nil,
	_mutedAnyone = false,
	VOICE_CHAT_DEVICE_TYPE = VOICECHATDEVICETYPE,
	getPermissionsFunction = GetCamMicPermissionsModule,
	AvatarChatService = if GetFFlagAvatarChatServiceEnabledFunction() then game:GetService("AvatarChatService") else nil,
	inExpUpsellEntrypoint = nil,
	seamlessVoiceStatus = nil,
	isShowingFTUX = false,
	hideFTUXSignal = Instance.new("BindableEvent"),
	settingsAppAvailable = nil,
	hasLeftFTUX = false,
	deniedMicPermissions = nil,
	isInitialJoin = false,
	joinVoiceButtonContext = nil,
	hasReportedRewarmShown = false,
	pendingConnectionSource = nil,
	joinVoiceButtonConsequence = nil,
	CaptureService = if GetFFlagEnableVoiceChatMuteForVideoCapturesFunction() then game:GetService("CaptureService") else nil
}
local NewResult1 = LuauPolyfillModule.Set.new({
	"available", "participants", "recentUsersInteractionData", "permissionPromise",
	"canUseServicePromise", "localMuted", "isTalking", "previousGroupId",
	"previousMutedState", "userEligible", "sendMuteEvent", "mutedPlayers",
	"SignalREventTable", "audioDevices", "service", "previousSessionId",
	"voiceEnabled", "permissionState", "BlockStatusChanged", "isInCall",
	"callMutedState", "attemptVoiceRejoin", "VoiceJoinProgressChanged",
	"participantJoined", "participantLeft", "participantsUpdate", "muteChanged",
	"audioDeviceInputAdded", "talkingChanged", "canUseServiceResult"
})
NewResult1:add("_mutedAnyone")
NewResult1:add("muteAllChanged")
local t = {}
local config = {
	[ConstantsModule.IN_EXP_UPSELL_VARIANT.VARIANT1] = PromptTypeModule.VoiceConsentModalV1,
	[ConstantsModule.IN_EXP_UPSELL_VARIANT.VARIANT2] = PromptTypeModule.VoiceConsentModalV2,
	[ConstantsModule.IN_EXP_UPSELL_VARIANT.VARIANT3] = PromptTypeModule.VoiceConsentModalV3
}

function getIconSrc(Text, Text1): string
	return "rbxasset://textures/ui/VoiceChat/" .. (Text1 and Text1 .. "/" or "") .. Text .. ".png"
end

function getIcon(CONNECTING, p1, p2)
	-- upvalues: VOICESTATE (copy)
	if CONNECTING == VOICESTATE.MUTED then
		return getIconSrc("Muted", p2)
	elseif CONNECTING == VOICESTATE.CONNECTING then
		return getIconSrc("Connecting", p2)
	elseif CONNECTING == VOICESTATE.INACTIVE then
		return getIconSrc("Blank", p2)
	elseif CONNECTING == VOICESTATE.TALKING then
		local ScaledFloored = math.floor(0.5 + 5 * (p1 or math.random())) * 20
		
		return p1 and getIconSrc("Unmuted" .. tostring(ScaledFloored), p2) or getIconSrc("Blank", p2)
	else
		return getIconSrc("Error", p2)
	end
end

VoiceChatServiceManager.__index = VoiceChatServiceManager

function VoiceChatServiceManager.__index(p1, p2)
	-- upvalues: NewResult1 (copy), VoiceChatServiceManager (copy)
	return if NewResult1:has(p2) then p1.coreVoiceManager[p2] else rawget(VoiceChatServiceManager, p2)
end

function VoiceChatServiceManager:__newindex(p1, p2)
	-- upvalues: NewResult1 (copy), VoiceChatServiceManager (copy)
	if NewResult1:has(p1) then
		self.coreVoiceManager[p1] = p2
		
		return
	else
		rawset(VoiceChatServiceManager, p1, p2)
	end
end

local function _(p1, p2)
	return function(...)
		-- upvalues: p1 (copy), p2 (copy)
		return p1[p2](p1, ...)
	end
end

function VoiceChatServiceManager.new(CoreVoiceManager, Service, HttpRbxApiService, PermissionsService, BlockStatusChanged, CoreVoiceManager1, NotificationService, p1, AvatarChatService, CaptureService)
	-- upvalues: Analytics (copy), GetCamMicPermissionsModule (copy), VoiceChatServiceManager (copy), FFlagProactiveVoiceRestrictionsUFR (copy), CreateVoiceRestrictionControllerModule (copy), GetUserSettingsFunction (copy), GetInformedOfBanFunction (copy), ShowLegacyVoiceRestrictionModule (copy), WATCHEDMESSAGETYPES (copy), GetFIntThrottleParticipantsUpdateMsFunction (copy), IXPServiceWrapper (copy), VoiceUIImprovementsIXPLayerName (copy), ThrottleParticipantsUpdateIXPLayerValue (copy), GetFFlagExpChatUseVoiceParticipantsStoreFunction (copy), ExpChatModule (copy), GetFFlagEnableUniveralVoiceToastsModule (copy), FFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule (copy), FFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule (copy), DebugSkipVoicePermissionCheck (copy), GetFFlagMicConsumerRegistryFunction (copy), FFlagDebugShowAudioDeviceInputDebugger (copy), FFlagEnablePartyVoiceChangersInLua (copy), MicrophoneDevicePermissionsLoggingModule (copy), VoiceVolumeControlsGlobalVoiceVolumeSliderIxpExposure (copy), VoiceVolumeControlsEligibility (copy), VoiceVolumeControlsGlobalVoiceVolumeSliderIxpLayer (copy), ShowJoinVoiceWhenDisconnectedV3 (copy), EnableVoiceRewarmReArmV2 (copy), VOICEJOINPROGRESS (copy), ConstantsModule (copy), DisableLeaveToastInStudio (copy), PromptTypeModule (copy), DebugSimulateConnectDisconnect (copy), NewResult (copy), AppStorageService (copy), FFlagProactiveVoiceRestrictionsUFRIXPExposureModule (copy), AppUserLayers (copy), GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (copy), VoiceNudgeUseNewDACopyModule (copy), GetFFlagShowDevicePermissionsModalFunction (copy), GetFFlagEnableSeamlessVoiceDataConsentToastModule (copy), GetFFlagNonVoiceFTUXFunction (copy), GetFFlagEnableVoiceChatMuteForVideoCapturesFunction (copy), GetFFlagEnableCrossExperienceVoiceCaptureMuteFunction (copy), Default1 (copy)
	local self = setmetatable({
		_mutedAnyone = false,
		voiceConnectEventReportedForActiveSession = false,
		service = Service,
		HttpRbxApiService = HttpRbxApiService,
		NotificationService = NotificationService,
		PermissionsService = PermissionsService,
		BlockStatusChanged = BlockStatusChanged,
		Analytics = Analytics.new(CoreVoiceManager1),
		getPermissionsFunction = if p1 then p1 else GetCamMicPermissionsModule,
		AvatarChatService = AvatarChatService,
		SequenceNumbers = {},
		SignalREventTable = {},
		coreVoiceManager = CoreVoiceManager,
		CaptureService = CaptureService
	}, VoiceChatServiceManager)
	
	if FFlagProactiveVoiceRestrictionsUFR then
		rawset(self, "voiceRestrictionController", CreateVoiceRestrictionControllerModule({
			getSettings = function()
				-- upvalues: GetUserSettingsFunction (upval), self (copy)
				local v1 = "GetRequest"
				
				return GetUserSettingsFunction(function(...)
					-- upvalues: self (copy), v1 (copy)
					return self[v1](self, ...)
				end) or nil
			end,
			getInformedOfBan = function()
				-- upvalues: GetInformedOfBanFunction (upval), self (copy)
				local v1 = "GetRequest"
				local InformedOfBan = GetInformedOfBanFunction(function(...)
					-- upvalues: self (copy), v1 (copy)
					return self[v1](self, ...)
				end)
				
				return if InformedOfBan then InformedOfBan.informedOfBan else nil
			end,
			showLegacyRestriction = function(Settings, Trigger, IsCurrent)
				-- upvalues: self (copy), ShowLegacyVoiceRestrictionModule (upval)
				self.bannedUntil = Settings.bannedUntil
				self.banReason = Settings.banReason
				ShowLegacyVoiceRestrictionModule({
					manager = self,
					settings = Settings,
					trigger = Trigger,
					isCurrent = IsCurrent
				})
			end,
			onError = function(p2)
				-- upvalues: self (copy), Analytics (upval)
				self:_reportJoinFailed(p2, Analytics.ERROR)
			end
		}))
	end
	for _, wATCHEDMESSAGETYPE in WATCHEDMESSAGETYPES do
		self.SignalREventTable[wATCHEDMESSAGETYPE] = Instance.new("BindableEvent")
	end
	self.shouldThrottleParticipantUpdate = false
	self.participantsStateThrottleTime = 0
	self.lastParticipantsStateUpdate = 0
	self.lastStateUpdateCounter = 0
	self.reverseNudgeToxicUserRemovalCallbacks = {}
	
	if GetFIntThrottleParticipantsUpdateMsFunction() > 0 then
		self.participantsStateThrottleTime = GetFIntThrottleParticipantsUpdateMsFunction() / 1000
		local Success, Result = pcall(function()
			-- upvalues: IXPServiceWrapper (upval), VoiceUIImprovementsIXPLayerName (upval)
			return IXPServiceWrapper:GetLayerData(VoiceUIImprovementsIXPLayerName)
		end)
		
		if Success and Result and Result[ThrottleParticipantsUpdateIXPLayerValue] then
			self.shouldThrottleParticipantUpdate = true
		end
	end
	self.MuteStatusIcons = {
		MicOn = self:GetIcon("Unmuted0", "SpeakerLight"),
		MicOff = self:GetIcon("Muted", "SpeakerLight"),
		MicDisabled = self:GetIcon("Muted", "SpeakerLight"),
		Loading = self:GetIcon("Connecting", "SpeakerLight"),
		Error = self:GetIcon("Error", "SpeakerLight")
	}
	self.PlayerMuteStatusIcons = {
		MicOn = self:GetIcon("Unmuted0", "MicLight"),
		MicOff = self:GetIcon("Muted", "MicLight"),
		MicDisabled = self:GetIcon("Muted", "MicLight"),
		Loading = self:GetIcon("Connecting", "MicLight"),
		Error = self:GetIcon("Error", "MicLight")
	}
	local Flag = false
	local EventConnection = self.attemptVoiceRejoin.Event:Connect(function()
		-- upvalues: Flag (ref)
		Flag = true
	end)
	local VoiceStore = if GetFFlagExpChatUseVoiceParticipantsStoreFunction() then ExpChatModule.Stores.GetVoiceStore(false) else nil
	self.coreVoiceManager:subscribe("GetPermissions", function(p2, p3, p4, p5)
		-- upvalues: self (copy)
		self.getPermissionsFunction(p2, p3, p4, if self.inExpUpsellEntrypoint == nil then "VoiceChatServiceManager.requestMicPermission" else self.inExpUpsellEntrypoint, p5)
	end)
	self.coreVoiceManager:subscribe("OnVoiceParticipantRemoved", function(p2)
		-- upvalues: GetFFlagExpChatUseVoiceParticipantsStoreFunction (upval), VoiceStore (copy), ExpChatModule (upval)
		if GetFFlagExpChatUseVoiceParticipantsStoreFunction() then
			VoiceStore.handleVoiceParticipantRemoved(p2)
			
			return
		end
		if ExpChatModule.Events.VoiceParticipantRemoved then
			ExpChatModule.Events.VoiceParticipantRemoved((tostring(p2)))
		end
	end)
	self.coreVoiceManager:subscribe("OnVoiceParticipantAdded", function(p2)
		-- upvalues: GetFFlagExpChatUseVoiceParticipantsStoreFunction (upval), VoiceStore (copy), ExpChatModule (upval)
		if GetFFlagExpChatUseVoiceParticipantsStoreFunction() then
			VoiceStore.handleVoiceParticipantAdded(p2)
			
			return
		end
		if ExpChatModule.Events.VoiceParticipantAdded then
			ExpChatModule.Events.VoiceParticipantAdded((tostring(p2)))
		end
	end)
	self.coreVoiceManager:subscribe("OnVoiceParticipantToggleMuted", function(p2, p3)
		-- upvalues: ExpChatModule (upval)
		if ExpChatModule.Events.VoiceParticipantToggleMuted then
			ExpChatModule.Events.VoiceParticipantToggleMuted(tostring(p2), p3)
		end
	end)
	self.coreVoiceManager:subscribe("OnUserAndPlaceCanUseVoiceResolved", function(p2, p3)
		-- upvalues: self (copy)
		self:_onUserAndPlaceCanUseVoiceResolved(p2, p3)
	end)
	self.coreVoiceManager:subscribe("OnRequestMicPermissionResolved", function()
		-- upvalues: GetFFlagEnableUniveralVoiceToastsModule (upval), FFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule (upval), FFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule (upval), self (copy)
		if not GetFFlagEnableUniveralVoiceToastsModule() then return end
		return if FFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule and FFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule then self:CheckAndShowNotAudiblePrompt():andThen(function()
			-- upvalues: self (upval)
			return self:ShowNotAudiblePromptVoiceChatVolume()
		end) else self:CheckAndShowNotAudiblePrompt()
	end)
	self.coreVoiceManager:subscribe("OnRequestMicPermissionRejected", function()
		-- upvalues: self (copy), GetFFlagEnableUniveralVoiceToastsModule (upval), DebugSkipVoicePermissionCheck (upval)
		if self:IsSeamlessVoice() then
			self.deniedMicPermissions = true
		end
		if not GetFFlagEnableUniveralVoiceToastsModule() or DebugSkipVoicePermissionCheck then return end
		return self:CheckAndShowPermissionPrompt()
	end)
	
	if GetFFlagMicConsumerRegistryFunction() then
		self.coreVoiceManager:subscribe("OnMicPermissionDeniedToast", function()
			-- upvalues: self (copy)
			self:showPrompt("MicPermissionDenied")
		end)
		self.coreVoiceManager:subscribe("OnMicFirstUnmutePrivacy", function()
			-- upvalues: self (copy)
			self:showPrompt("MicFirstUnmutePrivacy")
		end)
	end
	if FFlagDebugShowAudioDeviceInputDebugger then
		self.coreVoiceManager:subscribe("OnDevicePlayerChanged", function()
			-- upvalues: self (copy)
			self:UpdateAudioDeviceInputDebugger()
		end)
		self.coreVoiceManager:subscribe("OnDeviceActiveChanged", function()
			-- upvalues: self (copy)
			self:UpdateAudioDeviceInputDebugger()
		end)
		self.coreVoiceManager:subscribe("OnDeviceMuteChanged", function()
			-- upvalues: self (copy)
			self:UpdateAudioDeviceInputDebugger()
		end)
		
		if FFlagEnablePartyVoiceChangersInLua then
			self.coreVoiceManager:subscribe("OnVoiceChangerChanged", function()
				-- upvalues: self (copy)
				self:UpdateAudioDeviceInputDebugger()
			end)
		end
		self.coreVoiceManager:subscribe("OnPlayerMuted", function()
			-- upvalues: self (copy)
			self:UpdateAudioDeviceInputDebugger()
		end)
		self.coreVoiceManager:subscribe("OnAudioDeviceInputAdded", function()
			-- upvalues: self (copy)
			self:UpdateAudioDeviceInputDebugger()
		end)
		self.coreVoiceManager:subscribe("OnAudioDeviceInputRemoved", function()
			-- upvalues: self (copy)
			self:UpdateAudioDeviceInputDebugger()
		end)
		self.coreVoiceManager:subscribe("OnDeviceMutedByLocalUserChanged", function()
			-- upvalues: self (copy)
			self:UpdateAudioDeviceInputDebugger()
		end)
	end
	self.coreVoiceManager:subscribe("OnStateChanged", function(_, VoiceChatState)
		-- upvalues: MicrophoneDevicePermissionsLoggingModule (upval), self (copy), VoiceVolumeControlsGlobalVoiceVolumeSliderIxpExposure (upval), VoiceVolumeControlsEligibility (upval), IXPServiceWrapper (upval), VoiceVolumeControlsGlobalVoiceVolumeSliderIxpLayer (upval), ShowJoinVoiceWhenDisconnectedV3 (upval), EnableVoiceRewarmReArmV2 (upval), VOICEJOINPROGRESS (upval), ConstantsModule (upval), Flag (ref), EventConnection (copy), FFlagProactiveVoiceRestrictionsUFR (upval), DisableLeaveToastInStudio (upval), PromptTypeModule (upval)
		MicrophoneDevicePermissionsLoggingModule:setClientSessionId(self.coreVoiceManager:GetSessionId())
		
		if VoiceChatState == Enum.VoiceChatState.Ended or VoiceChatState == Enum.VoiceChatState.Failed then
			self.voiceConnectEventReportedForActiveSession = false
		end
		if VoiceChatState == Enum.VoiceChatState.Joined and VoiceVolumeControlsGlobalVoiceVolumeSliderIxpExposure and VoiceVolumeControlsEligibility.isVoiceChatVolumeSliderVisible(true, game:GetService("VoiceChatService").UseNewAudioApi) then
			IXPServiceWrapper:LogFlagLinkedUserLayerExposure(VoiceVolumeControlsGlobalVoiceVolumeSliderIxpLayer)
		end
		if ShowJoinVoiceWhenDisconnectedV3 and EnableVoiceRewarmReArmV2 and VoiceChatState == Enum.VoiceChatState.Joined and self:ShouldRewarmUser() then
			self:ConsumeVoiceRewarm()
		end
		if VoiceChatState == Enum.VoiceChatState.Joined and self:GetVoiceJoinProgress() == VOICEJOINPROGRESS.Idle and not self.voiceConnectEventReportedForActiveSession then
			local ConnectDisconnectAnalyticsData = self:GetConnectDisconnectAnalyticsData()
			ConnectDisconnectAnalyticsData.connectionSource = ConstantsModule.VOICE_CONNECTION_SOURCE.AUTO_CONNECT
			self.pendingConnectionSource = nil
			self.Analytics:reportConnectDisconnectEvents("voiceConnectEvent", ConnectDisconnectAnalyticsData)
			self.voiceConnectEventReportedForActiveSession = true
			Flag = false
			EventConnection:Disconnect()
		end
		local IsVoiceChatStateMatch = VoiceChatState == Enum.VoiceChatState.Ended
		
		if IsVoiceChatStateMatch then
			local ConnectDisconnectAnalyticsData = self:GetConnectDisconnectAnalyticsData()
			ConnectDisconnectAnalyticsData.disconnectReason = self.pendingDisconnectReason or ConstantsModule.VOICE_DISCONNECT_REASON.SYSTEM
			self.Analytics:reportConnectDisconnectEvents("voiceDisconnectReasonEvent", ConnectDisconnectAnalyticsData)
			self.pendingDisconnectReason = nil
		end
		if IsVoiceChatStateMatch and self.bannedUntil == nil and (not FFlagProactiveVoiceRestrictionsUFR or self:GetVoiceRestrictionState(false) == "normal") then
			if DisableLeaveToastInStudio and self.runService:IsStudio() then return end
			self:showPrompt(PromptTypeModule.LeaveVoice)
		end
	end)
	self.coreVoiceManager:subscribe("OnVoiceChatServiceInitialized", function()
		-- upvalues: self (copy), DebugSimulateConnectDisconnect (upval), NewResult (upval), AppStorageService (upval), ConstantsModule (upval), PromptTypeModule (upval)
		self:ShowVoiceUI()
		
		if DebugSimulateConnectDisconnect then
			NewResult:debug("Simulating join voice")
			self:simulateVoiceConnectDisconnect()
		end
		if not self.coreVoiceManager.initializedPostSuspension then
			local Success, Result = pcall(function(): boolean
				-- upvalues: AppStorageService (upval), ConstantsModule (upval)
				return AppStorageService:GetItem(ConstantsModule.VOICE_WITH_TC_TOAST_KEY) == "true"
			end)
			
			if Success and not Result then
				self:showPrompt(PromptTypeModule.UpdateOnAutoJoinToast)
				pcall(function()
					-- upvalues: AppStorageService (upval), ConstantsModule (upval)
					AppStorageService:SetItem(ConstantsModule.VOICE_WITH_TC_TOAST_KEY, "true")
					AppStorageService:Flush()
				end)
			end
		end
	end)
	self.coreVoiceManager:subscribe("OnInitialJoinFailed", function()
		-- upvalues: self (copy)
		self:InitialJoinFailedPrompt()
	end)
	self.coreVoiceManager:subscribe("OnPlayerModerated", function()
		-- upvalues: self (copy), ConstantsModule (upval)
		self.pendingDisconnectReason = ConstantsModule.VOICE_DISCONNECT_REASON.MODERATED
		self:ShowPlayerModeratedMessage()
	end)
	self.coreVoiceManager:subscribe("OnRetryRequested", function()
		-- upvalues: self (copy), PromptTypeModule (upval)
		self:showPrompt(PromptTypeModule.Retry)
	end)
	self.coreVoiceManager:subscribe("OnVoiceToxicityModal", function()
		-- upvalues: NewResult (upval), FFlagProactiveVoiceRestrictionsUFRIXPExposureModule (upval), IXPServiceWrapper (upval), AppUserLayers (upval), FFlagProactiveVoiceRestrictionsUFR (upval), ShowLegacyVoiceRestrictionModule (upval), self (copy), GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (upval), VoiceNudgeUseNewDACopyModule (upval), PromptTypeModule (upval)
		NewResult:debug("Showing Voice Toxicity Modal")
		
		if FFlagProactiveVoiceRestrictionsUFRIXPExposureModule then
			IXPServiceWrapper:LogFlagLinkedUserLayerExposure(AppUserLayers.VoiceUserIDLayer)
		end
		if FFlagProactiveVoiceRestrictionsUFR then
			ShowLegacyVoiceRestrictionModule({
				settings = nil,
				trigger = "toxicityModal",
				manager = self,
				isCurrent = function(): boolean
					return true
				end
			})
			
			return
		end
		if GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and VoiceNudgeUseNewDACopyModule() then
			self:showPrompt(PromptTypeModule.VoiceToxicityModalV2)
			
			return
		else
			self:showPrompt(PromptTypeModule.VoiceToxicityModal)
		end
	end)
	self.coreVoiceManager:subscribe("OnVoiceToxicityToast", function()
		-- upvalues: NewResult (upval), GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (upval), VoiceNudgeUseNewDACopyModule (upval), self (copy), PromptTypeModule (upval)
		NewResult:debug("Showing Voice Toxicity Toast")
		
		if GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and VoiceNudgeUseNewDACopyModule() then
			self:showPrompt(PromptTypeModule.VoiceToxicityToastV2)
			
			return
		else
			self:showPrompt(PromptTypeModule.VoiceToxicityToast)
		end
	end)
	self.coreVoiceManager:subscribe("OnPermissionRequested", function()
		-- upvalues: GetFFlagShowDevicePermissionsModalFunction (upval), self (copy), PromptTypeModule (upval)
		if GetFFlagShowDevicePermissionsModalFunction() then
			self:showPrompt(PromptTypeModule.DevicePermissionsModal)
			
			return
		else
			self:showPrompt(PromptTypeModule.Permission)
		end
	end)
	self.coreVoiceManager:subscribe("OnShowDataConsentToast", function()
		-- upvalues: GetFFlagEnableSeamlessVoiceDataConsentToastModule (upval), self (copy)
		if GetFFlagEnableSeamlessVoiceDataConsentToastModule() then
			self:showDataConsentToast()
		end
	end)
	self.coreVoiceManager:subscribe("OnVoiceReverseNudgeIconColorChange", function(p2)
		-- upvalues: NewResult (upval), ExpChatModule (upval), self (copy)
		NewResult:debug("Showing Reverse Nudge Icon Color Change")
		
		if ExpChatModule.Events.AddReverseNudgeToxicUser and ExpChatModule.Events.RemoveReverseNudgeToxicUser then
			self:AddReverseNudgeToxicUser(p2.toxicUserId, ExpChatModule.Events.AddReverseNudgeToxicUser, ExpChatModule.Events.RemoveReverseNudgeToxicUser)
		end
	end)
	self.coreVoiceManager.setVoiceUIVisibility.Event:Connect(function(p2)
		-- upvalues: self (copy)
		if p2 then
			self:ShowVoiceUI()
			
			return
		else
			self:HideVoiceUI()
		end
	end)
	self.coreVoiceManager:subscribe("OnVoiceJoin", function()
		-- upvalues: GetFFlagNonVoiceFTUXFunction (upval), self (copy), PromptTypeModule (upval), GetFFlagEnableVoiceChatMuteForVideoCapturesFunction (upval), GetFFlagEnableCrossExperienceVoiceCaptureMuteFunction (upval), Default1 (upval), Flag (ref), EventConnection (copy)
		if GetFFlagNonVoiceFTUXFunction() and self.hasLeftFTUX then
			self.hasLeftFTUX = false
			self:showJoinVoicePrompt()
			self.Analytics:reportConnectDisconnectEvents("voiceConnectFtuxLeaveEvent", self:GetConnectDisconnectAnalyticsData())
		elseif self:IsSeamlessVoice() then
			self:showJoinVoicePrompt()
			self:SetVoiceConnectCookieValue(true)
		else
			self:showPrompt(PromptTypeModule.VoiceConsentAcceptedToast)
		end
		if GetFFlagEnableVoiceChatMuteForVideoCapturesFunction() and self.CaptureService:IsCapturingVideo() then
			if GetFFlagEnableCrossExperienceVoiceCaptureMuteFunction() then
				Default1:MuteAll("Capture")
				self:HideVoiceUI()
			else
				self:MuteAll(true, "Capture")
				self:HideVoiceUI()
			end
		end
		if Flag then
			local ConnectDisconnectAnalyticsData = self:GetConnectDisconnectAnalyticsData()
			ConnectDisconnectAnalyticsData.connectionSource = self.pendingConnectionSource
			self.pendingConnectionSource = nil
			self.Analytics:reportConnectDisconnectEvents("voiceConnectEvent", ConnectDisconnectAnalyticsData)
			self.voiceConnectEventReportedForActiveSession = true
			Flag = false
			EventConnection:Disconnect()
		end
	end)
	
	return self
end

local _ = function(p2): string
	return "..." .. string.sub(tostring(p2), -4)
end

function VoiceChatServiceManager:subscribe(p2, p3)
	return self.coreVoiceManager:subscribe(p2, p3)
end

function VoiceChatServiceManager:unsubscribe(p2, p3)
	self.coreVoiceManager:unsubscribe(p2, p3)
end

function VoiceChatServiceManager:_reportJoinFailed(p2, ERROR)
	return self.coreVoiceManager:_reportJoinFailed(p2, ERROR)
end

function VoiceChatServiceManager:_asyncInit()
	return self.coreVoiceManager:_asyncInit()
end

function VoiceChatServiceManager:asyncInit()
	return self.coreVoiceManager:asyncInit()
end

function VoiceChatServiceManager:CheckAudioInputExists()
	return self.coreVoiceManager:CheckAudioInputExists()
end

function VoiceChatServiceManager:getService()
	return self.service
end

function VoiceChatServiceManager:GetMicManager()
	return self.coreVoiceManager and self.coreVoiceManager.micManager or nil
end

function VoiceChatServiceManager:GetMutedAnyone()
	return self.coreVoiceManager:GetMutedAnyone()
end

function VoiceChatServiceManager:RecordGameSettingsOpened()
	self.coreVoiceManager:RecordGameSettingsOpened()
end

function VoiceChatServiceManager:ReportVoiceVolumeImpressionsIfNeeded()
	self.coreVoiceManager:ReportVoiceVolumeImpressionsIfNeeded()
end

function VoiceChatServiceManager:GetRequest(p2, p3)
	return self.coreVoiceManager:GetRequest(p2, p3)
end

function VoiceChatServiceManager.PostRequest(p2, ApiUrl, _, p3)
	-- upvalues: HttpService (copy)
	local Success, Result = pcall(function()
		-- upvalues: p2 (copy), ApiUrl (copy), p3 (copy), HttpService (upval)
		return HttpService:JSONDecode((p2.HttpRbxApiService:PostAsyncFullUrl(ApiUrl, p3, Enum.ThrottlingPriority.Default, Enum.HttpContentType.ApplicationJson, Enum.HttpRequestType.Players)))
	end)
	
	return Success and Result
end

function VoiceChatServiceManager:_GetShowAgeVerificationOverlay(p2)
	return self.coreVoiceManager:_GetShowAgeVerificationOverlay(p2)
end

function VoiceChatServiceManager.simulateVoiceConnectDisconnect(p2)
	-- upvalues: DebugConnectDisconnectInterval (copy), NewResult (copy)
	task.spawn(function()
		-- upvalues: DebugConnectDisconnectInterval (upval), p2 (copy), NewResult (upval)
		while true do
			task.wait(DebugConnectDisconnectInterval)
			if p2.voiceUIVisible then
				NewResult:debug("Hiding Voice")
				p2:HideVoiceUI()
			else
				NewResult:debug("Showing Voice")
				p2:ShowVoiceUI()
			end
		end
	end)
end

function VoiceChatServiceManager:FetchAgeVerificationOverlay(p3)
	return self.coreVoiceManager:FetchAgeVerificationOverlay(p3)
end

function VoiceChatServiceManager:FetchPhoneVerificationUpsell(INEXPPHONEUPSELLIXPLAYER, p3, p4)
	return self.coreVoiceManager:FetchPhoneVerificationUpsell(INEXPPHONEUPSELLIXPLAYER, p3, p4)
end

function VoiceChatServiceManager.RecordUserSeenModal(p3, DATACONSENTTOAST)
	-- upvalues: PostRecordUserSeenGeneralModalFunction (copy)
	local v1 = "PostRequest"
	
	return PostRecordUserSeenGeneralModalFunction(function(...)
		-- upvalues: p3 (copy), v1 (copy)
		return p3[v1](p3, ...)
	end, DATACONSENTTOAST)
end

function VoiceChatServiceManager:checkAndUpdateSequence(p3, p4)
	return self.coreVoiceManager:checkAndUpdateSequence(p3, p4)
end

function VoiceChatServiceManager:onMissedSequence(p3)
	return self.coreVoiceManager:onMissedSequence(p3)
end

function VoiceChatServiceManager:watchSignalR()
	return self.coreVoiceManager:watchSignalR()
end

function VoiceChatServiceManager:voicePermissionGranted(p3)
	return self.coreVoiceManager:voicePermissionGranted(p3)
end

function VoiceChatServiceManager:GetSignalREvent(p3)
	return self.coreVoiceManager:GetSignalREvent(p3)
end

function VoiceChatServiceManager:avatarChatUserAndPlaceSettingsValueOfClientFeatures(p3)
	return self.coreVoiceManager:avatarChatUserAndPlaceSettingsValueOfClientFeatures(p3)
end

function VoiceChatServiceManager:resolveAvatarChatUserAndPlaceSettings()
	return self.coreVoiceManager:resolveAvatarChatUserAndPlaceSettings()
end

function VoiceChatServiceManager:EnableVoice()
	return self.coreVoiceManager:EnableVoice()
end

function VoiceChatServiceManager:_VoiceChatFirstTimeUX(p3)
	-- upvalues: ConstantsModule (copy), NewResult (copy), GetFFlagNonVoiceFTUXFunction (copy), ExpChatModule (copy), GetFFlagEnableFtuxExitOnMuteToggleFunction (copy), SeamlessVoiceSTUXDisplayCount (copy), FixSTUXShowingIncorrectly (copy), PromptTypeModule (copy)
	local IsTrue = nil
	local Number = nil
	
	if not pcall(function()
		-- upvalues: p3 (copy), ConstantsModule (upval), IsTrue (ref), Number (ref)
		local Item = p3:GetItem(ConstantsModule.SEAMLESS_VOICE_STUX_KEY)
		IsTrue = p3:GetItem(ConstantsModule.SEAMLESS_VOICE_FTUX_KEY) == "true"
		Number = if Item == nil then 0 else tonumber(Item)
	end) then
		NewResult:warning("Failed to read FTUX/STUX from AppStorage")
		
		return
	end
	NewResult:trace("hasShownFTUX: {}. STUXCount: {}", IsTrue, Number)
	
	if not IsTrue then
		NewResult:debug("Showing FTUX")
		self.isShowingFTUX = true
		self.Analytics:reportConnectDisconnectEvents("voiceConnectFtuxJoinEvent", self:GetConnectDisconnectAnalyticsData())
		
		if GetFFlagNonVoiceFTUXFunction() then
			ExpChatModule.Events.VoiceUIVisibilityChanged(true)
		else
			self:MuteAll(true, "FTUX")
			self.muteAllChanged.Event:Once(function()
				-- upvalues: self (copy), p3 (copy)
				self:HideFTUX(p3)
				self.Analytics:reportConnectDisconnectEvents("voiceConnectFtuxLeaveEvent", self:GetConnectDisconnectAnalyticsData())
			end)
			self.talkingChanged.Event:Once(function()
				-- upvalues: self (copy), p3 (copy)
				self:HideFTUX(p3)
			end)
			
			if GetFFlagEnableFtuxExitOnMuteToggleFunction() then
				self.coreVoiceManager.onPlayerMuteToggled.Event:Once(function()
					-- upvalues: self (copy), p3 (copy)
					self:HideFTUX(p3)
				end)
			end
		end
	elseif Number < SeamlessVoiceSTUXDisplayCount and (not FixSTUXShowingIncorrectly or self:GetVoiceConnectCookieValue()) then
		NewResult:debug("Showing STUX")
		self:showPrompt(PromptTypeModule.JoinVoiceSTUX)
		pcall(function()
			-- upvalues: p3 (copy), ConstantsModule (upval), Number (ref)
			p3:SetItem(ConstantsModule.SEAMLESS_VOICE_STUX_KEY, (tostring(Number + 1)))
			p3:Flush()
		end)
	end
end

function VoiceChatServiceManager:VoiceChatFirstTimeUX(p3)
	-- upvalues: FixSTUXShowingIncorrectly (copy), NewResult (copy), DebugSkipSeamlessVoiceAPICheck (copy), ConstantsModule (copy), GetFFlagNonVoiceFTUXFunction (copy)
	if FixSTUXShowingIncorrectly and not self:verifyUniverseAndPlaceCanUseVoice() then
		NewResult:debug("Universe/place is not voice enabled, do not run FTUX/STUX")
		
		return
	end
	if not DebugSkipSeamlessVoiceAPICheck then
		local AgeVerificationOverlay = self:FetchAgeVerificationOverlay()
		
		if type(AgeVerificationOverlay) == "table" and AgeVerificationOverlay.voiceSettings and AgeVerificationOverlay.voiceSettings.seamlessVoiceStatus ~= ConstantsModule.SEAMLESS_VOICE_STATUS_ENABLED_NEW_USER then
			NewResult:debug("User not eligible for FTUX/STUX")
			
			return
		end
	end
	local function _()
		-- upvalues: NewResult (upval), self (copy), p3 (copy)
		NewResult:debug("Starting FTUX")
		self:_VoiceChatFirstTimeUX(p3)
	end
	
	if GetFFlagNonVoiceFTUXFunction() then
		NewResult:debug("Starting FTUX")
		self:_VoiceChatFirstTimeUX(p3)
		
		return
	else
		self:asyncInit():andThen(function()
			-- upvalues: self (copy), NewResult (upval), p3 (copy)
			local Connection = nil
			
			if self.service.VoiceChatState and self.service.VoiceChatState == Enum.VoiceChatState.Joined then
				NewResult:debug("Starting FTUX")
				self:_VoiceChatFirstTimeUX(p3)
			end
			Connection = self.service.StateChanged:Connect(function(_, NewState)
				-- upvalues: NewResult (upval), self (upval), p3 (upval), Connection (ref)
				if NewState == Enum.VoiceChatState.Joined then
					NewResult:debug("Starting FTUX")
					self:_VoiceChatFirstTimeUX(p3)
					Connection:Disconnect()
				end
			end)
		end):catch(function(Err)
			-- upvalues: NewResult (upval)
			NewResult:trace("Failed to start FTUX: {}", Err)
		end)
	end
end

function VoiceChatServiceManager:HideFTUX(AppStorageService)
	-- upvalues: ConstantsModule (copy), GetFFlagNonVoiceFTUXFunction (copy), PromptTypeModule (copy)
	self.isShowingFTUX = false
	self.hideFTUXSignal:Fire()
	pcall(function()
		-- upvalues: AppStorageService (copy), ConstantsModule (upval)
		AppStorageService:SetItem(ConstantsModule.SEAMLESS_VOICE_FTUX_KEY, "true")
		AppStorageService:Flush()
	end)
	
	if GetFFlagNonVoiceFTUXFunction() then
		self.hasLeftFTUX = true
		self.attemptVoiceRejoin:Fire()
	end
	if not GetFFlagNonVoiceFTUXFunction() then
		self:MuteAll(false, "FTUX")
		self:showPrompt(PromptTypeModule.JoinedVoiceToast)
	end
end

function VoiceChatServiceManager:_onUserAndPlaceCanUseVoiceResolved(p3, p4)
	-- upvalues: FFlagProactiveVoiceRestrictionsUFRIXPExposureModule (copy), IXPServiceWrapper (copy), AppUserLayers (copy), FFlagProactiveVoiceRestrictionsUFR (copy), GetInformedOfBanFunction (copy), GetFFlagAvatarChatServiceEnabledFunction (copy), GetFFlagVoiceChatServiceManagerUseAvatarChatFunction (copy), PromptTypeModule (copy), BANREASON (copy), GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (copy), VoiceNudgeUseNewDACopyModule (copy), GetFFlagEnableVoicePromptReasonTextModule (copy)
	self.bannedUntil = nil
	
	if p3 and p3.isBanned then
		if FFlagProactiveVoiceRestrictionsUFRIXPExposureModule then
			IXPServiceWrapper:LogFlagLinkedUserLayerExposure(AppUserLayers.VoiceUserIDLayer)
		end
		if FFlagProactiveVoiceRestrictionsUFR then
			self.voiceRestrictionController.check("gameJoin", p3)
			
			return
		end
		local v1 = "GetRequest"
		local InformedOfBan = GetInformedOfBanFunction(function(...)
			-- upvalues: self (copy), v1 (copy)
			return self[v1](self, ...)
		end)
		
		if InformedOfBan and not InformedOfBan.informedOfBan then
			if GetFFlagAvatarChatServiceEnabledFunction() and GetFFlagVoiceChatServiceManagerUseAvatarChatFunction() and p3.bannedUntil == nil then
				self:ShowPlayerModeratedMessage()
			elseif p3.bannedUntil == nil then
				self:showPrompt(PromptTypeModule.VoiceChatSuspendedPermanent)
			else
				self.bannedUntil = p3.bannedUntil
				
				if p3.banReason == BANREASON.NUDGE_V3 then
					if GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and VoiceNudgeUseNewDACopyModule() then
						self:showPrompt(PromptTypeModule.VoiceChatSuspendedTemporaryBV2)
					else
						self:showPrompt(PromptTypeModule.VoiceChatSuspendedTemporaryB)
					end
				else
					self:showPrompt(PromptTypeModule.VoiceChatSuspendedTemporary)
				end
			end
		end
		if InformedOfBan and InformedOfBan.informedOfBan then
			self:ShowPlayerModeratedMessage(true)
			
			return
		end
	elseif self.runService:IsStudio() and p3 and not p3.isVoiceEnabled then
		self:showPrompt(PromptTypeModule.User)
		
		return
	else
		if self.runService:IsStudio() and p4 and not p4.isPlaceEnabledForVoice then
			self:showPrompt(PromptTypeModule.Place, GetFFlagEnableVoicePromptReasonTextModule() and table.concat(p4.reasons or {}, "") or nil)
		end
	end
end

function VoiceChatServiceManager:ChangeVoiceJoinProgress(p3)
	return self.coreVoiceManager:ChangeVoiceJoinProgress(p3)
end

function VoiceChatServiceManager:GetVoiceJoinProgress()
	return self.coreVoiceManager.VoiceJoinProgress
end

function VoiceChatServiceManager:UserOnlyEligibleForVoice()
	return self.coreVoiceManager:UserOnlyEligibleForVoice()
end

function VoiceChatServiceManager:UserOnlyEligibleForVoiceViaOverlay()
	return self.coreVoiceManager:UserOnlyEligibleForVoiceViaOverlay()
end

function VoiceChatServiceManager:UserVoiceEnabled()
	return self.coreVoiceManager:UserVoiceEnabled()
end

function VoiceChatServiceManager:UserInInExperienceUpsellTreatment()
	return self.coreVoiceManager:UserInInExperienceUpsellTreatment()
end

function VoiceChatServiceManager:UserEligibleForInExperienceUpsell()
	return self.coreVoiceManager:UserEligibleForInExperienceUpsell()
end

function VoiceChatServiceManager:ShowInExperienceVoiceUpsell(InExpUpsellEntrypoint)
	-- upvalues: GuardVoiceInExpUpsellVariant (copy)
	local AgeVerificationOverlay = self:FetchAgeVerificationOverlay()
	
	if not GuardVoiceInExpUpsellVariant or type(AgeVerificationOverlay) == "table" then
		local ShowVoiceInExperienceUpsellVariant = AgeVerificationOverlay.showVoiceInExperienceUpsellVariant
		self:SetInExpUpsellEntrypoint(InExpUpsellEntrypoint)
		self:showPrompt((self:GetInExpUpsellPromptFromEnum(ShowVoiceInExperienceUpsellVariant)))
		
		return
	end
end

function VoiceChatServiceManager:ShowInExperiencePhoneVoiceUpsell(JOINVOICE, INEXPPHONEUPSELLIXPLAYER)
	-- upvalues: PhoneUpsellController (copy), GetFFlagInExperiencePhoneUpsellNewCopyFunction (copy), PostPhoneUpsellDisplayed (copy), ConstantsModule (copy), PromptTypeModule (copy)
	self:SetInExpUpsellEntrypoint(JOINVOICE)
	PhoneUpsellController.openPhoneUpsell({
		origin = "inExperience",
		eventContext = "verificationUpsell",
		entryConfig = {
			titleKey = "Feature.VerificationUpsell.Heading.UnlockVoiceChat",
			descriptionKey = "Feature.VerificationUpsell.Description.UnlockVoiceChatBody",
			legalTextKey = "Feature.VerificationUpsell.Description.VoiceLegalDisclaimer2",
			buttonKey = if GetFFlagInExperiencePhoneUpsellNewCopyFunction() then "Feature.AccountSettings.Action.Verify" else "Feature.VerificationUpsell.Action.AddPhoneNumber",
			extraButtonConfig = {
				extraButtonKey = "Feature.VerificationUpsell.Action.NotNow"
			}
		},
		onSuccessBeforeToast = function()
			-- upvalues: self (copy), PostPhoneUpsellDisplayed (upval), INEXPPHONEUPSELLIXPLAYER (copy)
			self.coreVoiceManager:DisablePhoneVerificationUpsell()
			local v1 = "PostRequest"
			PostPhoneUpsellDisplayed(function(...)
				-- upvalues: self (copy), v1 (copy)
				return self[v1](self, ...)
			end, INEXPPHONEUPSELLIXPLAYER, os.time(), false)
		end,
		onSuccess = function()
			-- upvalues: self (copy), ConstantsModule (upval)
			if self.pendingConnectionSource == nil then
				self.pendingConnectionSource = ConstantsModule.VOICE_CONNECTION_SOURCE.IN_EXPERIENCE
			end
			self:EnableVoice()
		end,
		closeUpsell = function()
			-- upvalues: JOINVOICE (copy), ConstantsModule (upval), self (copy), PromptTypeModule (upval), PostPhoneUpsellDisplayed (upval), INEXPPHONEUPSELLIXPLAYER (copy)
			if JOINVOICE ~= ConstantsModule.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE then
				self:showPrompt(PromptTypeModule.VoiceConsentDeclinedToast)
			end
			local v1 = "PostRequest"
			PostPhoneUpsellDisplayed(function(...)
				-- upvalues: self (copy), v1 (copy)
				return self[v1](self, ...)
			end, INEXPPHONEUPSELLIXPLAYER, os.time(), true)
		end
	})
end

function VoiceChatServiceManager:DisablePhoneVerificationUpsell()
	self.coreVoiceManager:DisablePhoneVerificationUpsell()
end

function VoiceChatServiceManager:SetInExpUpsellEntrypoint(InExpUpsellEntrypoint)
	self.inExpUpsellEntrypoint = InExpUpsellEntrypoint
end

function VoiceChatServiceManager:userAndPlaceCanUseVoice()
	return self.coreVoiceManager:userAndPlaceCanUseVoice()
end

function VoiceChatServiceManager:verifyUniverseAndPlaceCanUseVoice()
	return self.coreVoiceManager:verifyUniverseAndPlaceCanUseVoice()
end

function VoiceChatServiceManager:GetVoiceConnectCookieValue()
	return self.coreVoiceManager:GetVoiceConnectCookieValue()
end

function VoiceChatServiceManager:GetVoiceConnectCookie()
	return self.coreVoiceManager:GetVoiceConnectCookie()
end

function VoiceChatServiceManager:SetVoiceConnectCookieValue(p3)
	return self.coreVoiceManager:SetVoiceConnectCookieValue(p3)
end

function VoiceChatServiceManager:GetVoiceRewarmCookie()
	return self.coreVoiceManager:GetVoiceRewarmCookie()
end

function VoiceChatServiceManager:SetVoiceRewarmCookie(p3)
	self.coreVoiceManager:SetVoiceRewarmCookie(p3)
end

function VoiceChatServiceManager:ShouldRewarmUser()
	return self.coreVoiceManager:ShouldRewarmUser()
end

function VoiceChatServiceManager:ConsumeVoiceRewarm()
	self.coreVoiceManager:ConsumeVoiceRewarm()
end

function VoiceChatServiceManager:SetNewUserFTUXCookieValue(p3)
	return self.coreVoiceManager:SetNewUserFTUXCookieValue(p3)
end

function VoiceChatServiceManager:ShowPlayerModeratedMessage(p3)
	-- upvalues: FFlagProactiveVoiceRestrictionsUFRIXPExposureModule (copy), IXPServiceWrapper (copy), AppUserLayers (copy), FFlagProactiveVoiceRestrictionsUFR (copy), GetUserSettingsFunction (copy), Analytics (copy), PromptTypeModule (copy), BANREASON (copy), GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (copy), VoiceNudgeUseNewDACopyModule (copy)
	if FFlagProactiveVoiceRestrictionsUFRIXPExposureModule then
		IXPServiceWrapper:LogFlagLinkedUserLayerExposure(AppUserLayers.VoiceUserIDLayer)
	end
	if FFlagProactiveVoiceRestrictionsUFR then
		self.voiceRestrictionController.check("removedFromVoice")
		
		return
	end
	local v1 = "GetRequest"
	local UserSettings = GetUserSettingsFunction(function(...)
		-- upvalues: self (copy), v1 (copy)
		return self[v1](self, ...)
	end)
	
	if not UserSettings or not UserSettings.isBanned then
		self:_reportJoinFailed("PlayerModeratedBadState", Analytics.ERROR)
		
		return
	end
	self.banReason = UserSettings.banReason
	
	if UserSettings.bannedUntil == nil then
		self:showPrompt(PromptTypeModule.VoiceChatSuspendedPermanent)
		
		return
	end
	self.bannedUntil = UserSettings.bannedUntil
	
	if p3 then
		self:showPrompt(PromptTypeModule.VoiceChatSuspendedTemporaryToast)
		
		return
	end
	if self.banReason ~= BANREASON.NUDGE_V3 then
		self:showPrompt(PromptTypeModule.VoiceChatSuspendedTemporary)
		
		return
	end
	if GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and VoiceNudgeUseNewDACopyModule() then
		self:showPrompt(PromptTypeModule.VoiceChatSuspendedTemporaryBV2)
		
		return
	else
		self:showPrompt(PromptTypeModule.VoiceChatSuspendedTemporaryB)
	end
end

function VoiceChatServiceManager:GetVoiceRestrictionState(p3)
	return self.voiceRestrictionController.getPresentationState(p3)
end

function VoiceChatServiceManager:ShowVoiceRestriction()
	self.voiceRestrictionController.check("micTap")
end

function VoiceChatServiceManager:CheckCallState()
	return self.coreVoiceManager:CheckCallState()
end

function VoiceChatServiceManager:ShowVoiceChatLoadingMessage()
	-- upvalues: PromptTypeModule (copy)
	self:showPrompt(PromptTypeModule.VoiceLoading)
end

function VoiceChatServiceManager:requestMicPermission()
	return self.coreVoiceManager:requestMicPermission()
end

function VoiceChatServiceManager:canUseServiceAsync()
	return self.coreVoiceManager:canUseServiceAsync()
end

function VoiceChatServiceManager:canUseService()
	-- upvalues: HttpRbxApiService (copy), HttpService (copy), VOICECHATAVAILABILITY (copy)
	if self.available ~= nil or not game:GetEngineFeature("VoiceChatSupported") then
		return false
	end
	local Success, Result = pcall(function()
		-- upvalues: HttpRbxApiService (upval), HttpService (upval)
		return HttpService:JSONDecode((HttpRbxApiService:GetAsyncFullUrl("https://voice.roblox.com/v1/settings", Enum.ThrottlingPriority.Default, Enum.HttpRequestType.Players)))
	end)
	
	if Success then
		Success = Result.isVoiceEnabled
	end
	if not Success then
		self.available = VOICECHATAVAILABILITY.UserNotAvailable
	end
	return Success
end

function VoiceChatServiceManager:ensureInitialized(p3)
	return self.coreVoiceManager:ensureInitialized(p3)
end

function VoiceChatServiceManager:GetSessionId()
	return self.coreVoiceManager:GetSessionId()
end

function VoiceChatServiceManager:GetChannelId()
	return self.coreVoiceManager:GetChannelId()
end

function VoiceChatServiceManager:JoinWithVoiceMuteData(p3)
	return self.coreVoiceManager:JoinWithVoiceMuteData(p3)
end

function VoiceChatServiceManager:calculateBanDuration(UnixTimestamp, AbsoluteSeconds): number
	return (math.ceil((AbsoluteSeconds - UnixTimestamp) / 60))
end

function VoiceChatServiceManager:getBanEnd(ServerTimeNow, AbsoluteSeconds)
	return {
		minutes = self:calculateBanDuration(ServerTimeNow, AbsoluteSeconds),
		absoluteSeconds = AbsoluteSeconds
	}
end

function VoiceChatServiceManager:ShowVoiceUI()
	-- upvalues: ExpChatModule (copy)
	self.voiceUIVisible = true
	self.showVoiceUI:Fire()
	
	if ExpChatModule.Events.VoiceUIVisibilityChanged then
		ExpChatModule.Events.VoiceUIVisibilityChanged(true)
	end
end

function VoiceChatServiceManager:HideVoiceUI()
	-- upvalues: ExpChatModule (copy)
	self.voiceUIVisible = false
	self.hideVoiceUI:Fire()
	
	if ExpChatModule.Events.VoiceUIVisibilityChanged then
		ExpChatModule.Events.VoiceUIVisibilityChanged(false)
	end
end

function VoiceChatServiceManager:createPromptInstance(OnReadyForSignal, DevicePermissionsModal)
	-- upvalues: GetFFlagEnableVoicePromptReasonTextModule (copy), PromptTypeModule (copy), GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (copy), FFlagVoiceChatBanDurationUseServerTimeModule (copy), Workspace (copy), LocalizationService (copy), GetFFlagShowDevicePermissionsModalFunction (copy), FFlagEnableRetryForLinkingProtocolFetch (copy), FIntLinkingProtocolFetchRetries (copy), Default2 (copy), SettingsRoute (copy), FIntLinkingProtocolFetchTimeoutMS (copy), RoactModule (copy), VoiceChatPromptModule (copy), Analytics (copy), PostInformedOfBanFunction (copy), ConstantsModule (copy), DisablePermissionPromptDeeplink (copy), GetFFlagJoinWithoutMicPermissionsFunction (copy), VoiceChatPermissionPromptUseMicrophoneRoute (copy), NewResult (copy), CoreGui (copy)
	if self.promptSignal then
		self.promptSignal:Destroy()
		self.promptSignal = nil
	end
	self.promptSignal = Instance.new("BindableEvent")
	local ErrorText = if GetFFlagEnableVoicePromptReasonTextModule() then self.errorText else nil
	local IsDevicePermissionsModalMatch = DevicePermissionsModal == PromptTypeModule.VoiceChatSuspendedTemporaryB
	
	if GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() then
		IsDevicePermissionsModalMatch = IsDevicePermissionsModalMatch or DevicePermissionsModal == PromptTypeModule.VoiceChatSuspendedTemporaryBV2
	end
	local BanEnd = if self.bannedUntil == nil then if FFlagVoiceChatBanDurationUseServerTimeModule then nil else "" elseif FFlagVoiceChatBanDurationUseServerTimeModule then self:getBanEnd(Workspace:GetServerTimeNow(), self.bannedUntil.Seconds) elseif IsDevicePermissionsModalMatch then tostring((self:calculateBanDuration(DateTime.now().UnixTimestamp, self.bannedUntil.Seconds))) else DateTime.fromUnixTimestamp(self.bannedUntil.Seconds):FormatLocalTime("l LT", LocalizationService.RobloxLocaleId)
	local IsDevicePermissionsModalMatch1: boolean = DevicePermissionsModal == PromptTypeModule.VoiceToxicityModal or (DevicePermissionsModal == PromptTypeModule.VoiceToxicityToast or GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and (DevicePermissionsModal == PromptTypeModule.VoiceToxicityModalV2 or DevicePermissionsModal == PromptTypeModule.VoiceToxicityToastV2))
	local IsDevicePermissionsModalMatch2: boolean = DevicePermissionsModal == PromptTypeModule.VoiceConsentModalV1 or (DevicePermissionsModal == PromptTypeModule.VoiceConsentModalV2 or DevicePermissionsModal == PromptTypeModule.VoiceConsentModalV3)
	local v1 = false
	local v2 = nil
	
	if GetFFlagShowDevicePermissionsModalFunction() and DevicePermissionsModal == PromptTypeModule.DevicePermissionsModal and self.settingsAppAvailable == nil then
		if FFlagEnableRetryForLinkingProtocolFetch then
			for _ = 0, FIntLinkingProtocolFetchRetries do
				local SpawnedThread = task.spawn(function()
					-- upvalues: v1 (ref), v2 (ref), Default2 (upval), SettingsRoute (upval)
					v1, v148 = Default2:supportsSwitchToSettingsApp(SettingsRoute.Microphone):await()
				end)
				task.wait(FIntLinkingProtocolFetchTimeoutMS / 1000)
				task.cancel(SpawnedThread)
				
				if v2 ~= nil then break end
			end
		else
			v1, v148 = Default2:supportsSwitchToSettingsApp(SettingsRoute.Microphone):await()
		end
		self.settingsAppAvailable = v1 and v2
	end
	self.voiceChatPromptInstance = RoactModule.mount(RoactModule.createElement(VoiceChatPromptModule, {
		Analytics = Analytics.new(),
		promptSignal = self.promptSignal.Event,
		bannedUntil = BanEnd,
		policyMapper = self.policyMapper,
		errorText = ErrorText,
		onReadyForSignal = OnReadyForSignal,
		VoiceChatServiceManager = self,
		settingsAppAvailable = self.settingsAppAvailable ~= nil and self.settingsAppAvailable,
		onContinueFunc = if DevicePermissionsModal == PromptTypeModule.VoiceChatSuspendedTemporary or IsDevicePermissionsModalMatch then function()
			-- upvalues: PostInformedOfBanFunction (upval), self (copy)
			local v3 = "PostRequest"
			PostInformedOfBanFunction(function(...)
				-- upvalues: self (copy), v3 (copy)
				return self[v3](self, ...)
			end, true)
		end elseif IsDevicePermissionsModalMatch1 then function()
			-- upvalues: self (copy)
			self.Analytics:reportClosedNudge(self:GetNudgeAnalyticsData())
		end elseif IsDevicePermissionsModalMatch2 then function()
			-- upvalues: self (copy), ConstantsModule (upval)
			self:RecordUserSeenModal(ConstantsModule.MODAL_IDS.IN_EXP_UPSELL)
		end else nil,
		onPrimaryActivated = if IsDevicePermissionsModalMatch1 then function()
			-- upvalues: self (copy)
			self.Analytics:reportAcknowledgedNudge(self:GetNudgeAnalyticsData())
		end elseif DisablePermissionPromptDeeplink or (not GetFFlagJoinWithoutMicPermissionsFunction() or DevicePermissionsModal ~= PromptTypeModule.Permission) then if GetFFlagJoinWithoutMicPermissionsFunction() and GetFFlagShowDevicePermissionsModalFunction() and DevicePermissionsModal == PromptTypeModule.DevicePermissionsModal then function()
			-- upvalues: NewResult (upval), self (copy), Default2 (upval), SettingsRoute (upval)
			NewResult:debug("Settings app available: {}", self.settingsAppAvailable)
			self.Analytics:reportDevicePermissionsModalEvent(if self.settingsAppAvailable then "OpenedSettings" else "Acknowledged", self:GetSessionId(), self:GetInExpUpsellAnalyticsData())
			
			if self.settingsAppAvailable then
				NewResult:debug("Switching to settings app")
				Default2:switchToSettingsApp(SettingsRoute.Microphone):andThen(function()
					-- upvalues: NewResult (upval)
					NewResult:debug("Successfully switched to settings app")
				end):catch(function()
					-- upvalues: NewResult (upval)
					NewResult:error("Error switching to settings app")
				end)
				
				return
			else
				NewResult:debug("Current platform does not support switching to settings app")
			end
		end elseif IsDevicePermissionsModalMatch then function()
			-- upvalues: self (copy)
			self:reportBanMessage("Understood")
			self.Analytics:reportBanMessageEvent("Understood")
		end elseif IsDevicePermissionsModalMatch2 then function()
			-- upvalues: self (copy), ConstantsModule (upval)
			self.Analytics:reportInExpConsent("accepted", self.inExpUpsellEntrypoint, self:GetInExpUpsellAnalyticsData())
			
			if self.pendingConnectionSource == nil then
				self.pendingConnectionSource = ConstantsModule.VOICE_CONNECTION_SOURCE.IN_EXPERIENCE
			end
			self:EnableVoice()
		end else nil else function()
			-- upvalues: VoiceChatPermissionPromptUseMicrophoneRoute (upval), SettingsRoute (upval), Default2 (upval), NewResult (upval)
			local Microphone = if VoiceChatPermissionPromptUseMicrophoneRoute then SettingsRoute.Microphone else nil
			local v3 = Default2:supportsSwitchToSettingsApp(Microphone):await()
			NewResult:debug("Settings app available: {}", v3)
			
			if v3 then
				NewResult:debug("Switching to settings app")
				Default2:switchToSettingsApp(Microphone):andThen(function()
					-- upvalues: NewResult (upval)
					NewResult:debug("Successfully switched to settings app")
				end):catch(function()
					-- upvalues: NewResult (upval)
					NewResult:error("Error switching to settings app")
				end)
				
				return
			else
				NewResult:debug("Current platform does not support switching to settings app")
			end
		end,
		onSecondaryActivated = if DevicePermissionsModal == PromptTypeModule.VoiceToxicityModal or GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and DevicePermissionsModal == PromptTypeModule.VoiceToxicityModalV2 then function()
			-- upvalues: self (copy)
			self:ShowVoiceToxicityFeedbackToast()
			self.Analytics:reportDeniedNudge(self:GetNudgeAnalyticsData())
		end elseif IsDevicePermissionsModalMatch1 then function()
			-- upvalues: self (copy)
			self.Analytics:reportDeniedNudge(self:GetNudgeAnalyticsData())
		end elseif IsDevicePermissionsModalMatch then function()
			-- upvalues: self (copy)
			self:ShowVoiceToxicityFeedbackToast()
			self:reportBanMessage("Denied")
			self.Analytics:reportBanMessageEvent("Denied")
		end elseif IsDevicePermissionsModalMatch2 then function()
			-- upvalues: self (copy), ConstantsModule (upval), PromptTypeModule (upval)
			self.Analytics:reportInExpConsent("denied", self.inExpUpsellEntrypoint, self:GetInExpUpsellAnalyticsData())
			
			if self.inExpUpsellEntrypoint ~= ConstantsModule.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE then
				self:showPrompt(PromptTypeModule.VoiceConsentDeclinedToast)
			end
		end elseif DevicePermissionsModal == PromptTypeModule.DevicePermissionsModal then function()
			-- upvalues: self (copy)
			self.Analytics:reportDevicePermissionsModalEvent("Denied", self:GetSessionId(), self:GetInExpUpsellAnalyticsData())
		end else nil
	}), CoreGui, "RobloxVoiceChatPromptGui")
end

function VoiceChatServiceManager:showPrompt(DevicePermissionsModal, Joined)
	-- upvalues: GetFFlagEnableVoicePromptReasonTextModule (copy), NewResult (copy)
	if GetFFlagEnableVoicePromptReasonTextModule() then
		self.errorText = Joined or nil
	end
	self:createPromptInstance(function()
		-- upvalues: NewResult (upval), DevicePermissionsModal (copy), self (copy)
		NewResult:debug("Show Prompt: {}", DevicePermissionsModal)
		self.promptSignal:fire(DevicePermissionsModal)
	end, DevicePermissionsModal)
end

function VoiceChatServiceManager:showJoinVoicePrompt()
	-- upvalues: PromptTypeModule (copy), AppStorageService (copy), ConstantsModule (copy)
	self:showPrompt(PromptTypeModule.UnifiedJoinVoiceToast)
	pcall(function()
		-- upvalues: AppStorageService (upval), ConstantsModule (upval)
		AppStorageService:SetItem(ConstantsModule.VOICE_WITH_TC_TOAST_KEY, "true")
		AppStorageService:Flush()
	end)
end

function VoiceChatServiceManager.CheckAndShowPermissionPrompt(p3)
	-- upvalues: PermissionsProtocol (copy), PromptTypeModule (copy), PromiseModule (copy), GetFFlagEnableUniveralVoiceToastsModule (copy)
	local function showPrompt()
		-- upvalues: p3 (copy), PermissionsProtocol (upval), PromptTypeModule (upval), PromiseModule (upval)
		local UserEligible = p3.userEligible
		
		return if p3.voiceEnabled or UserEligible then p3.PermissionsService:hasPermissions({ PermissionsProtocol.Permissions.MICROPHONE_ACCESS }):andThen(function(Result)
			-- upvalues: PermissionsProtocol (upval), p3 (upval), PromptTypeModule (upval)
			if Result and Result.status == PermissionsProtocol.Status.DENIED then
				p3:showPrompt(PromptTypeModule.Permission)
			end
		end) else PromiseModule.resolve()
	end
	
	return if GetFFlagEnableUniveralVoiceToastsModule() then showPrompt() else p3:asyncInit():andThen(function() end):catch(function()
		-- upvalues: showPrompt (copy)
		return showPrompt()
	end)
end

function VoiceChatServiceManager:showDataConsentToast()
	-- upvalues: GetFFlagSeamlessVoiceConsentToastPolicyFunction (copy), UniversalAppPolicyModule (copy), SeamlessVoiceStatusModule (copy), ConstantsModule (copy), PromptTypeModule (copy)
	local AgeVerificationOverlay = self:FetchAgeVerificationOverlay()
	local DisplayCheckboxInVoiceConsent = GetFFlagSeamlessVoiceConsentToastPolicyFunction() and UniversalAppPolicyModule.getAppFeaturePolicies().getDisplayCheckboxInVoiceConsent() or false
	local SeamlessVoiceStatus = nil
	local ShowDataConsentToast = nil
	
	if type(AgeVerificationOverlay) == "table" then
		SeamlessVoiceStatus = if AgeVerificationOverlay.voiceSettings then AgeVerificationOverlay.voiceSettings.seamlessVoiceStatus else SeamlessVoiceStatusModule.Invalid
		ShowDataConsentToast = AgeVerificationOverlay.showDataConsentToast
	else
		ShowDataConsentToast = false
		SeamlessVoiceStatus = SeamlessVoiceStatusModule.Invalid
	end
	if ShowDataConsentToast and DisplayCheckboxInVoiceConsent then
		ShowDataConsentToast = type(self:_GetShowAgeVerificationOverlay()) == "table" and self:_GetShowAgeVerificationOverlay().showDataConsentToast
	end
	if SeamlessVoiceStatus ~= SeamlessVoiceStatusModule.EnabledExistingUser or not ShowDataConsentToast or not DisplayCheckboxInVoiceConsent then return end
	self:RecordUserSeenModal(ConstantsModule.MODAL_IDS.DATA_CONSENT_TOAST)
	
	return self:showPrompt(PromptTypeModule.VoiceDataConsentOptOutToast)
end

function VoiceChatServiceManager.CheckAndShowNotAudiblePrompt(p3)
	-- upvalues: PromptTypeModule (copy), PromiseModule (copy)
	return if game:GetEngineFeature("VoiceChatSupported") then p3:asyncInit():andThen(function()
		-- upvalues: p3 (copy), PromptTypeModule (upval)
		if UserSettings().GameSettings.MasterVolume == 0 then
			p3:showPrompt(PromptTypeModule.NotAudible)
		end
	end):catch(function() end) else PromiseModule.resolve()
end

function VoiceChatServiceManager.ShowNotAudiblePromptVoiceChatVolume(p3)
	-- upvalues: FFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule (copy), FFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule (copy), PromiseModule (copy), VoiceVolumeControlsEligibility (copy), VoiceChatService (copy), PromptTypeModule (copy)
	return if FFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule and FFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule and game:GetEngineFeature("VoiceChatSupported") then p3:asyncInit():andThen(function()
		-- upvalues: VoiceVolumeControlsEligibility (upval), VoiceChatService (upval), p3 (copy), PromptTypeModule (upval)
		if UserSettings().GameSettings.MasterVolume > 0 and VoiceVolumeControlsEligibility.isVoiceChatVolumeSliderVisible(true, VoiceChatService.UseNewAudioApi) and UserSettings().GameSettings.VoiceChatVolume == 0 then
			p3:showPrompt(PromptTypeModule.NotAudibleVoiceChatVolume)
		end
	end):catch(function() end) else PromiseModule.resolve()
end

function VoiceChatServiceManager:InitialJoinFailedPrompt()
	-- upvalues: NewResult (copy), GetFFlagVoiceChatClientRewriteMasterLuaFunction (copy), PromptTypeModule (copy)
	NewResult:debug("JoinByGroupIdToken returns false")
	
	if not GetFFlagVoiceChatClientRewriteMasterLuaFunction then
		self:showPrompt(PromptTypeModule.Retry)
	end
end

function VoiceChatServiceManager:ShowVoiceToxicityFeedbackToast()
	-- upvalues: NewResult (copy), PromptTypeModule (copy)
	NewResult:debug("Sending feedback toast")
	self:showPrompt(PromptTypeModule.VoiceToxicityFeedbackToast)
end

function VoiceChatServiceManager:GetNudgeAnalyticsData()
	-- upvalues: Players (copy)
	return Players.LocalPlayer.UserId, self:GetSessionId()
end

function VoiceChatServiceManager:GetInExpUpsellAnalyticsData()
	-- upvalues: RbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy), RbxAnalyticsService (copy)
	return game.GameId, game.PlaceId, if RbxAnalyticsServiceExposePlaySessionIdEngineFeature then RbxAnalyticsService:GetPlaySessionId() else ""
end

function VoiceChatServiceManager:reportBanMessage(p3)
	-- upvalues: Players (copy)
	self.Analytics:reportBanMessageEventV2(p3, self.banReason, Players.LocalPlayer.UserId, if self.service then self.previousSessionId else "")
end

function VoiceChatServiceManager:reportJoinVoiceUpsellEvent(p3, JoinVoiceButtonContext, p4)
	-- upvalues: RbxAnalyticsService (copy), FFlagVoiceRewarmTelemetry (copy)
	local PlaySessionId = RbxAnalyticsService:GetPlaySessionId()
	
	if FFlagVoiceRewarmTelemetry then
		self.Analytics:reportJoinVoiceUpsellEvent(p3, PlaySessionId, self:UserVoiceEnabled(), JoinVoiceButtonContext, p4)
		
		return
	else
		self.Analytics:reportJoinVoiceUpsellEvent(p3, PlaySessionId, self:UserVoiceEnabled())
	end
end

function VoiceChatServiceManager:reportVoiceRewarmShown()
	if self.joinVoiceButtonContext == "Rewarm" and not self.hasReportedRewarmShown then
		self.hasReportedRewarmShown = true
		self.Analytics:reportVoiceRewarmShown(self:GetVoiceRewarmCookie() ~= "")
		
		return
	end
end

function VoiceChatServiceManager:SetAndSyncActive(p3, p4)
	self.coreVoiceManager:SetAndSyncActive(p3, p4)
end

function VoiceChatServiceManager:CreateAudioDeviceData(p3)
	return self.coreVoiceManager:CreateAudioDeviceData(p3)
end

function VoiceChatServiceManager:onInstanceAdded(p3)
	return self.coreVoiceManager:onInstanceAdded(p3)
end

function VoiceChatServiceManager:UpdateAudioDeviceInputDebugger()
	-- upvalues: FFlagDebugShowAudioDeviceInputDebugger (copy), NewResult (copy), RoactModule (copy), AudioDeviceInputDebuggerModule (copy), CoreGui (copy)
	if FFlagDebugShowAudioDeviceInputDebugger then
		if self.voiceDebuggerInstance then
			RoactModule.update(self.voiceDebuggerInstance, RoactModule.createElement(AudioDeviceInputDebuggerModule, {
				instances = self.audioDevices,
				mutedPlayers = self.mutedPlayers
			}))
		else
			NewResult:debug("Mounting AudioDeviceInput Debugger")
			self.voiceDebuggerInstance = RoactModule.mount(RoactModule.createElement(AudioDeviceInputDebuggerModule, {
				instances = self.audioDevices,
				mutedPlayers = self.mutedPlayers
			}), CoreGui, "RobloxVoiceChatPromptGui")
			
			return
		end
	end
end

function VoiceChatServiceManager:AddReverseNudgeToxicUser(ToxicUserId, Callback: (any, any) -> (), Callback1)
	-- upvalues: GetFIntVoiceReverseNudgeUXDisplayTimeSecondsModule (copy)
	Callback(ToxicUserId, "iconColorChange")
	local ReverseNudgeToxicUserRemovalCallback = self.reverseNudgeToxicUserRemovalCallbacks[ToxicUserId]
	
	if ReverseNudgeToxicUserRemovalCallback ~= nil then
		task.cancel(ReverseNudgeToxicUserRemovalCallback)
	end
	self.reverseNudgeToxicUserRemovalCallbacks[ToxicUserId] = task.delay(GetFIntVoiceReverseNudgeUXDisplayTimeSecondsModule(), function()
		-- upvalues: Callback1 (copy), ToxicUserId (copy), self (copy)
		Callback1(ToxicUserId)
		self.reverseNudgeToxicUserRemovalCallbacks[ToxicUserId] = nil
	end)
end

function VoiceChatServiceManager:onInstanceRemove(p3)
	return self.coreVoiceManager:onInstanceRemove(p3)
end

function VoiceChatServiceManager:hookupAudioDeviceInputListener()
	return self.coreVoiceManager:hookupAudioDeviceInputListener()
end

function VoiceChatServiceManager:ToggleMutePlayer(p3, p4)
	return self.coreVoiceManager:ToggleMutePlayer(p3, p4)
end

function VoiceChatServiceManager:MuteAll(p3, p4)
	return self.coreVoiceManager:MuteAll(p3, p4)
end

function VoiceChatServiceManager:ToggleMuteSome(p3, p4, p5, p6)
	return self.coreVoiceManager:ToggleMuteSome(p3, p4, p5, p6)
end

function VoiceChatServiceManager:FireMuteNonFriendsEvent()
	self.mutedNonFriends:Fire()
end

function VoiceChatServiceManager:EnsureCorrectMuteState(List, IsMutedLocally)
	-- upvalues: VoiceChatService (copy), EnableMutedByLocalUserEngineFeature (copy), Players (copy)
	local t = {}
	
	for i, value in List do
		local Participant = self.participants[tostring(value)]
		
		if Participant and Participant.isMutedLocally ~= IsMutedLocally then
			if VoiceChatService.UseNewAudioApi then
				t[value] = true
				self.mutedPlayers[value] = IsMutedLocally
			else
				self.service:SubscribePause(value, IsMutedLocally)
			end
			Participant.isMutedLocally = IsMutedLocally
			self.participantsUpdate:Fire(self.participants)
		end
	end
	if VoiceChatService.UseNewAudioApi then
		for i in self.audioDevices do
			if i.Player and t[i.Player.UserId] then
				if EnableMutedByLocalUserEngineFeature and i.Player ~= Players.LocalPlayer then
					i.MutedByLocalUser = IsMutedLocally
				else
					i.Active = not IsMutedLocally
				end
			end
		end
	end
end

function VoiceChatServiceManager:FireUserAgencySelectedEvent(p3)
	self.userAgencySelected:Fire(p3)
end

function VoiceChatServiceManager:ParticipantStateToIcon(p3, p4)
	-- upvalues: VOICESTATE (copy)
	return getIcon(if p3.subscriptionCompleted then if p3.isMutedLocally then VOICESTATE.LOCAL_MUTED elseif p3.isMuted then VOICESTATE.MUTED elseif p3.isSignalActive then VOICESTATE.TALKING else VOICESTATE.INACTIVE else VOICESTATE.CONNECTING, p4)
end

function VoiceChatServiceManager:VoiceStateToIcon(p3, p4, p5)
	return getIcon(p3, p4, p5)
end

function VoiceChatServiceManager:GetIcon(p3, p4)
	return getIconSrc(p3, p4)
end

function VoiceChatServiceManager:JoinVoice(p3)
	-- upvalues: FFlagVoiceRewarmTelemetry (copy), FFlagVoiceRewarmGrafanaMetricsModule (copy), ShowJoinVoiceWhenDisconnectedV3 (copy), EnableVoiceRewarmReArmV2 (copy), NewResult (copy), GuardVoiceInExpUpsellVariant (copy), ConstantsModule (copy), GetFFlagNonVoiceFTUXFunction (copy), AppStorageService (copy), SeamlessVoiceV2JoinVoiceToast (copy), EnableVerifiedCheckViaOverlay (copy), GetFFlagDisableConsentModalForExistingUsersModule (copy), PromptTypeModule (copy), GetFFlagIntegratePhoneUpsellJoinVoiceFunction (copy), GetFFlagEnableInExpPhoneVoiceUpsellEntrypointsFunction (copy), GetOverlayStoreFunction (copy), OverlayTypes (copy), SocialUpsellType (copy), AnalyticsEnum (copy), SendUserConnectionStatus (copy)
	local JoinVoiceButtonContext = nil
	local v3: string? = nil
	
	if FFlagVoiceRewarmTelemetry then
		JoinVoiceButtonContext = self.joinVoiceButtonContext
		self.joinVoiceButtonContext = nil
	end
	local IsNotVoiceRewarmCookieMatch = if FFlagVoiceRewarmGrafanaMetricsModule and JoinVoiceButtonContext == "Rewarm" then self:GetVoiceRewarmCookie() ~= "" else nil
	
	if ShowJoinVoiceWhenDisconnectedV3 and not EnableVoiceRewarmReArmV2 then
		NewResult:debug("Consuming voice re-warm cookie on JoinVoice")
		self:SetVoiceRewarmCookie("true")
	end
	local AgeVerificationOverlay = self:FetchAgeVerificationOverlay()
	local ShowVoiceInExperienceUpsellVariant = (if GuardVoiceInExpUpsellVariant then if type(AgeVerificationOverlay) == "table" then AgeVerificationOverlay.showVoiceInExperienceUpsellVariant else nil else AgeVerificationOverlay.showVoiceInExperienceUpsellVariant) or ConstantsModule.IN_EXP_UPSELL_VARIANT.VARIANT3
	
	if not FFlagVoiceRewarmTelemetry then
		self.Analytics:reportJoinVoiceButtonEvent("clicked", self:GetInExpUpsellAnalyticsData())
	end
	if self.previousGroupId then
		if FFlagVoiceRewarmTelemetry then
			v3 = "RejoinPreviousChannel"
		end
		self:RejoinPreviousChannel()
		self:showJoinVoicePrompt()
		self:ShowVoiceUI()
		self:SetVoiceConnectCookieValue(true)
	elseif GetFFlagNonVoiceFTUXFunction() and self.isShowingFTUX then
		if FFlagVoiceRewarmTelemetry then
			v3 = "ExitFtux"
		end
		self:HideFTUX(AppStorageService)
	elseif self.deniedMicPermissions then
		if FFlagVoiceRewarmTelemetry then
			v3 = "MicPermissionPrompt"
		end
		self:CheckAndShowPermissionPrompt()
	elseif self:UserVoiceEnabled() then
		if FFlagVoiceRewarmTelemetry then
			v3 = "FirstJoinSession"
		end
		if SeamlessVoiceV2JoinVoiceToast then
			self.isInitialJoin = true
		end
		self.attemptVoiceRejoin:Fire()
		
		if self:IsNewSeamlessVoiceUserDisconnect() then
			self:SetVoiceConnectCookieValue(true)
			self:SetNewUserFTUXCookieValue(true)
		end
	elseif EnableVerifiedCheckViaOverlay and self:UserOnlyEligibleForVoiceViaOverlay() or self:UserOnlyEligibleForVoice() then
		if FFlagVoiceRewarmTelemetry then
			v3 = "ConsentModal"
		end
		if GetFFlagDisableConsentModalForExistingUsersModule() and self:IsSeamlessVoice() then
			self:EnableVoice()
		else
			self:SetInExpUpsellEntrypoint(ConstantsModule.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE)
			self:showPrompt((self:GetInExpUpsellPromptFromEnum(ShowVoiceInExperienceUpsellVariant)))
		end
	elseif self:EligibleForAgeCheckToast() then
		if FFlagVoiceRewarmTelemetry then
			v3 = "AgeCheckToast"
		end
		self:showPrompt(PromptTypeModule.AgeCheckForVoiceToast)
	elseif GetFFlagIntegratePhoneUpsellJoinVoiceFunction() and GetFFlagEnableInExpPhoneVoiceUpsellEntrypointsFunction() and not self:UserVoiceEnabled() and self:FetchPhoneVerificationUpsell(ConstantsModule.IN_EXP_PHONE_UPSELL_IXP_LAYER) == ConstantsModule.PHONE_UPSELL_VALUE_PROP.VoiceChat then
		if FFlagVoiceRewarmTelemetry then
			v3 = "PhoneUpsell"
		end
		if p3 then
			p3:SetVisibility(false, true)
		end
		self:ShowInExperiencePhoneVoiceUpsell(ConstantsModule.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE, ConstantsModule.IN_EXP_PHONE_UPSELL_IXP_LAYER)
	elseif self:EligibleForFaeUpsell() then
		if FFlagVoiceRewarmTelemetry then
			v3 = "FaeUpsell"
		end
		if self.pendingConnectionSource == nil then
			self.pendingConnectionSource = ConstantsModule.VOICE_CONNECTION_SOURCE.IN_EXPERIENCE
		end
		self.coreVoiceManager:OptUserToJoinVoice()
		local OverlayStore = GetOverlayStoreFunction(false)
		
		if not FFlagVoiceRewarmTelemetry then
			self:reportJoinVoiceUpsellEvent("Click")
		end
		OverlayStore.setCurrentOverlay(OverlayTypes.SocialUpsell, {
			upsellType = SocialUpsellType.FacialAgeEstimation,
			data = {
				isInExperience = true,
				countDownBadgeText = nil,
				isPhase2 = true,
				upsellEntrySurface = AnalyticsEnum.UpsellEntrySurfaceType.InExperienceVoiceChatIcon,
				upsellEntryComponent = AnalyticsEnum.UpsellComponent.Modal,
				upsellPurpose = AnalyticsEnum.UpsellStage.Fae
			}
		})
	end
	if FFlagVoiceRewarmTelemetry then
		local InExpUpsellAnalyticsData, InExpUpsellAnalyticsData2, InExpUpsellAnalyticsData3 = self:GetInExpUpsellAnalyticsData()
		self.Analytics:reportJoinVoiceButtonEvent("clicked", InExpUpsellAnalyticsData, InExpUpsellAnalyticsData2, InExpUpsellAnalyticsData3, JoinVoiceButtonContext, v3)
		self:reportJoinVoiceUpsellEvent("Click", JoinVoiceButtonContext, v3)
	end
	if FFlagVoiceRewarmGrafanaMetricsModule and IsNotVoiceRewarmCookieMatch ~= nil then
		self.Analytics:reportVoiceRewarmClicked(IsNotVoiceRewarmCookieMatch, v3)
	end
	if SendUserConnectionStatus and self:IsSeamlessVoice() then
		task.spawn(function()
			-- upvalues: self (copy)
			self.coreVoiceManager:PostUserVoiceConnectionStatus(true)
		end)
	end
end

function VoiceChatServiceManager:EligibleForFaeUpsell()
	-- upvalues: GetFFlagEnableVoiceUxUpdatesFunction (copy), FFlagTestDeviceForFAEUpsell (copy), DeviceMeetsRequirementsForFAEFunction (copy)
	local FFlagEnableVoiceUxUpdates = GetFFlagEnableVoiceUxUpdatesFunction()
	
	if FFlagEnableVoiceUxUpdates then
		FFlagEnableVoiceUxUpdates = self.coreVoiceManager:EligibleForFaeUpsell()
		
		if FFlagEnableVoiceUxUpdates then
			FFlagEnableVoiceUxUpdates = self.AvatarChatService:deviceMeetsRequirementsForFeature(Enum.DeviceFeatureType.InExperienceFAE)
			
			if FFlagEnableVoiceUxUpdates then
				if FFlagTestDeviceForFAEUpsell then
					return (DeviceMeetsRequirementsForFAEFunction())
				end
				FFlagEnableVoiceUxUpdates = true
			end
		end
	end
	return FFlagEnableVoiceUxUpdates
end

function VoiceChatServiceManager:EligibleForAgeCheckToast()
	return self.coreVoiceManager:EligibleForAgeCheckToast()
end

function VoiceChatServiceManager:ShouldShowJoinVoice()
	-- upvalues: GetFFlagEnableVoiceUxUpdatesFunction (copy), FFlagVoiceRewarmTelemetry (copy), VoiceChatCoreModule (copy), ShowJoinVoiceWhenDisconnectedV3 (copy), EnableVoiceRewarmReArmV2 (copy), GetFFlagOnlyEnableJoinVoiceInVoiceEnabledUniversesModule (copy), AlwaysSetJoinVoiceButtonContext (copy), GetFFlagIntegratePhoneUpsellJoinVoiceFunction (copy), GetFFlagEnableInExpPhoneVoiceUpsellEntrypointsFunction (copy), ConstantsModule (copy)
	if GetFFlagEnableVoiceUxUpdatesFunction() then
		if FFlagVoiceRewarmTelemetry then
			if self:EligibleForFaeUpsell() then
				self.joinVoiceButtonContext = "FaeUpsell"
				
				return true
			end
			if self:HasSeamlessVoiceFeature(VoiceChatCoreModule.Constants.SeamlessVoiceFeatures.InitialJoinVoice) and self:GetVoiceConnectCookie() == "" then
				self.joinVoiceButtonContext = "VoiceFtux"
				
				return true
			end
			if ShowJoinVoiceWhenDisconnectedV3 and ((if EnableVoiceRewarmReArmV2 then self:ShouldRewarmUser() else self:GetVoiceRewarmCookie() == "") and self:GetVoiceConnectCookie() == "false" and self:UserVoiceEnabled()) then
				self.joinVoiceButtonContext = "Rewarm"
				
				return true
			end
		elseif self:EligibleForFaeUpsell() or self:HasSeamlessVoiceFeature(VoiceChatCoreModule.Constants.SeamlessVoiceFeatures.InitialJoinVoice) and self:GetVoiceConnectCookie() == "" or ShowJoinVoiceWhenDisconnectedV3 and ((if EnableVoiceRewarmReArmV2 then self:ShouldRewarmUser() else self:GetVoiceRewarmCookie() == "") and self:VoiceChatEnded()) then
			return true
		end
	elseif GetFFlagOnlyEnableJoinVoiceInVoiceEnabledUniversesModule() then
		if self:IsSeamlessVoice() and self:verifyUniverseAndPlaceCanUseVoice() then
			return not self.voiceUIVisible
		end
	elseif self:IsSeamlessVoice() then
		return not self.voiceUIVisible
	end
	if self:EligibleForAgeCheckToast() then
		if AlwaysSetJoinVoiceButtonContext then
			self.joinVoiceButtonContext = "AgeCheckToast"
		end
		return true
	else
		local UserInInExperienceUpsellTreatmentResult = self:UserInInExperienceUpsellTreatment()
		local UserOnlyEligibleForVoiceResult = self:UserOnlyEligibleForVoice() or self:UserVoiceEnabled()
		
		if GetFFlagIntegratePhoneUpsellJoinVoiceFunction() and GetFFlagEnableInExpPhoneVoiceUpsellEntrypointsFunction() and not UserOnlyEligibleForVoiceResult and not self:UserVoiceEnabled() and self:FetchPhoneVerificationUpsell(ConstantsModule.IN_EXP_PHONE_UPSELL_IXP_LAYER) == ConstantsModule.PHONE_UPSELL_VALUE_PROP.VoiceChat then
			if AlwaysSetJoinVoiceButtonContext then
				self.joinVoiceButtonContext = "PhoneUpsell"
			end
			return true
		else
			if AlwaysSetJoinVoiceButtonContext and UserInInExperienceUpsellTreatmentResult and UserOnlyEligibleForVoiceResult then
				self.joinVoiceButtonContext = "InExpUpsell"
			end
			return UserInInExperienceUpsellTreatmentResult and UserOnlyEligibleForVoiceResult
		end
	end
end

function VoiceChatServiceManager:ShouldShowJoinVoiceOnDisconnect()
	return self.coreVoiceManager:ShouldShowJoinVoiceOnDisconnect()
end

function VoiceChatServiceManager:IsSeamlessVoice()
	-- upvalues: GetFFlagCheckUniversePlaceBeforeSuspendingFunction (copy), NewResult (copy), SeamlessVoiceStatusModule (copy)
	if GetFFlagCheckUniversePlaceBeforeSuspendingFunction() then
		return self.coreVoiceManager:IsSeamlessVoice()
	end
	local AgeVerificationOverlay = self:FetchAgeVerificationOverlay()
	
	if AgeVerificationOverlay and AgeVerificationOverlay.voiceSettings then
		local SeamlessVoiceStatus = AgeVerificationOverlay.voiceSettings.seamlessVoiceStatus
		
		return SeamlessVoiceStatus == SeamlessVoiceStatusModule.EnabledExistingUser or SeamlessVoiceStatus == SeamlessVoiceStatusModule.EnabledNewUser
	else
		NewResult:error("VoiceChatServiceManager:IsSeamlessVoice() - ageVerificationOverlayData or voiceSettings is nil")
		
		return false
	end
end

function VoiceChatServiceManager:HasSeamlessVoiceFeature(InitialJoinVoice)
	return self.coreVoiceManager:HasSeamlessVoiceFeature(InitialJoinVoice)
end

function VoiceChatServiceManager:IsNewSeamlessVoiceUserDisconnect()
	return self.coreVoiceManager:IsNewSeamlessVoiceUserDisconnect()
end

function VoiceChatServiceManager:GetConnectDisconnectButtonAnalyticsData(p3)
	-- upvalues: RbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy), RbxAnalyticsService (copy)
	local List = {
		game.GameId,
		game.PlaceId,
		if RbxAnalyticsServiceExposePlaySessionIdEngineFeature then RbxAnalyticsService:GetPlaySessionId() else ""
	}
	
	if p3 and self:getService() then
		table.insert(List, self:GetSessionId())
	end
	return unpack(List)
end

function VoiceChatServiceManager:GetConnectDisconnectAnalyticsData()
	-- upvalues: RbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy), RbxAnalyticsService (copy), GetFFlagNonVoiceFTUXFunction (copy), Default (copy)
	local config = {
		universeId = game.GameId,
		placeId = game.PlaceId,
		playSessionId = if RbxAnalyticsServiceExposePlaySessionIdEngineFeature then RbxAnalyticsService:GetPlaySessionId() else ""
	}
	
	if GetFFlagNonVoiceFTUXFunction() then
		config.voiceSessionId = if self.service then self:GetSessionId() else ""
	else
		config.voiceSessionId = self:GetSessionId()
	end
	config.durationTimestamp = Default:getTimestamp()
	
	return config
end

function VoiceChatServiceManager:Leave()
	-- upvalues: GetFFlagDisconnectToastClientRewriteFunction (copy), GetFFlagVoiceChatClientRewriteMasterLuaFunction (copy), SendUserConnectionStatus (copy)
	self:ensureInitialized("leave")
	
	if GetFFlagDisconnectToastClientRewriteFunction() then
		self:SetVoiceConnectCookieValue(false)
	end
	self.Analytics:reportConnectDisconnectEvents("voiceDisconnectEvent", self:GetConnectDisconnectAnalyticsData())
	local GroupId = self.service:GetGroupId()
	local IsPublishPaused = self.service:IsPublishPaused()
	
	if GetFFlagVoiceChatClientRewriteMasterLuaFunction() then
		local VoiceChatService = game:GetService("VoiceChatService")
		
		if VoiceChatService then
			VoiceChatService:leaveVoice()
		end
	else
		self.service:Leave()
	end
	self:HideVoiceUI()
	self.previousGroupId = GroupId
	self.previousMutedState = IsPublishPaused
	
	if not GetFFlagDisconnectToastClientRewriteFunction() then
		self:SetVoiceConnectCookieValue(false)
	end
	if SendUserConnectionStatus and self:IsSeamlessVoice() then
		task.spawn(function()
			-- upvalues: self (copy)
			self.coreVoiceManager:PostUserVoiceConnectionStatus(false)
		end)
	end
end

function VoiceChatServiceManager:GetVoiceStateFromEnum(p3)
	-- upvalues: t (ref), VOICESTATE (copy)
	if not t[p3] then
		t = {
			[Enum.VoiceChatState.Idle] = VOICESTATE.HIDDEN,
			[Enum.VoiceChatState.Joining] = VOICESTATE.CONNECTING,
			[Enum.VoiceChatState.JoiningRetry] = VOICESTATE.CONNECTING,
			[Enum.VoiceChatState.Joined] = VOICESTATE.MUTED,
			[Enum.VoiceChatState.Leaving] = VOICESTATE.MUTED,
			[Enum.VoiceChatState.Ended] = VOICESTATE.HIDDEN,
			[Enum.VoiceChatState.Failed] = VOICESTATE.ERROR
		}
	end
	return t[p3]
end

function VoiceChatServiceManager:GetInExpUpsellPromptFromEnum(ShowVoiceInExperienceUpsellVariant)
	-- upvalues: config (copy)
	return config[ShowVoiceInExperienceUpsellVariant]
end

function VoiceChatServiceManager:getRecentUsersInteractionData()
	return self.coreVoiceManager:getRecentUsersInteractionData()
end

function VoiceChatServiceManager:_setRecentUserState(p3, p4)
	return self.coreVoiceManager:_setRecentUserState(p3, p4)
end

function VoiceChatServiceManager:_updateRecentUsersInteractionData()
	return self.coreVoiceManager:_updateRecentUsersInteractionData()
end

function VoiceChatServiceManager:SetupParticipantListeners()
	return self.coreVoiceManager:SetupParticipantListeners()
end

function VoiceChatServiceManager:Disconnect()
	-- upvalues: FFlagProactiveVoiceRestrictionsUFR (copy)
	if FFlagProactiveVoiceRestrictionsUFR then
		self.voiceRestrictionController.dispose()
	end
	self.coreVoiceManager:Disconnect()
	self.coreVoiceManager:unsubscribeAll()
end

function VoiceChatServiceManager:GetSendMuteEvent()
	return self.coreVoiceManager:GetSendMuteEvent()
end

function VoiceChatServiceManager:ToggleMic(p3)
	return self.coreVoiceManager:ToggleMic(p3)
end

function VoiceChatServiceManager:SubscribeRetry(UserId)
	-- upvalues: NewResult (copy)
	self:ensureInitialized("subscribe retry")
	NewResult:debug("Attempting to retry connection to user: {}", "..." .. string.sub(tostring(UserId), -4))
	self.service:SubscribeRetry(UserId)
end

function VoiceChatServiceManager:JoinByGroupIdToken(GroupId, IsMicMuted)
	return self.coreVoiceManager:JoinByGroupIdToken(GroupId, IsMicMuted)
end

function VoiceChatServiceManager:RejoinPreviousChannel()
	-- upvalues: NewResult (copy), GetFFlagVoiceChatClientRewriteMasterLuaFunction (copy)
	local PreviousGroupId = self.previousGroupId
	local PreviousMutedState = self.previousMutedState
	NewResult:debug("Rejoining previous channel {} with mute status {}", PreviousGroupId, PreviousMutedState)
	pcall(function()
		-- upvalues: GetFFlagVoiceChatClientRewriteMasterLuaFunction (upval), self (copy), PreviousGroupId (copy), PreviousMutedState (copy)
		if GetFFlagVoiceChatClientRewriteMasterLuaFunction() then
			self.coreVoiceManager:RejoinVoice()
			local ConnectDisconnectAnalyticsData = self:GetConnectDisconnectAnalyticsData()
			ConnectDisconnectAnalyticsData.connectionSource = self.pendingConnectionSource
			self.pendingConnectionSource = nil
			self.Analytics:reportConnectDisconnectEvents("voiceConnectEvent", ConnectDisconnectAnalyticsData)
			self.voiceConnectEventReportedForActiveSession = true
			
			return
		end
		if PreviousGroupId and PreviousGroupId ~= "" then
			self.service:Leave()
			
			if not self.service:JoinByGroupIdToken(PreviousGroupId, PreviousMutedState, true) then
				self:InitialJoinFailedPrompt()
				
				return
			end
			local ConnectDisconnectAnalyticsData = self:GetConnectDisconnectAnalyticsData()
			ConnectDisconnectAnalyticsData.connectionSource = self.pendingConnectionSource
			self.pendingConnectionSource = nil
			self.Analytics:reportConnectDisconnectEvents("voiceConnectEvent", ConnectDisconnectAnalyticsData)
			self.voiceConnectEventReportedForActiveSession = true
		end
	end)
end

function VoiceChatServiceManager:SwitchDevice(Input, NameOrInstance, Guid)
	-- upvalues: VOICECHATDEVICETYPE (copy), SoundService (copy), NewResult (copy)
	if Input == VOICECHATDEVICETYPE.Input then
		SoundService:SetInputDevice(NameOrInstance, Guid)
		NewResult:info("[InputDeviceSelection] Setting SS Mic Device To {} {}", NameOrInstance, Guid)
		
		return
	else
		SoundService:SetOutputDevice(NameOrInstance, Guid)
		NewResult:info("[OutputDeviceSelection] Setting SS Speaker Device To {} {}", NameOrInstance, Guid)
	end
end

function VoiceChatServiceManager:GetDevices(Input)
	-- upvalues: VOICECHATDEVICETYPE (copy), SoundService (copy)
	local Success, Result, Result3, Result4 = pcall(function()
		-- upvalues: Input (copy), VOICECHATDEVICETYPE (upval), SoundService (upval)
		return if Input == VOICECHATDEVICETYPE.Input then SoundService:GetInputDevices() else SoundService:GetOutputDevices()
	end)
	
	return Success, Result, Result3, Result4
end

function VoiceChatServiceManager:VoiceChatAvailable(): boolean
	-- upvalues: MINVOICECHATAPIVERSION (copy), VOICECHATAVAILABILITY (copy)
	local Service = self.service
	
	if self.available == nil and Service then
		self.version = Service:GetVoiceChatApiVersion()
		
		if MINVOICECHATAPIVERSION <= self.version then
			self.available = Service:GetVoiceChatAvailable()
			while self.available == VOICECHATAVAILABILITY.Checking do
				wait(1)
				self.available = Service:GetVoiceChatAvailable()
			end
		end
	end
	return if Service then MINVOICECHATAPIVERSION <= self.version and self.available == VOICECHATAVAILABILITY.Available else false
end

function VoiceChatServiceManager:VoiceChatEnded(): boolean
	-- upvalues: VoiceEndedCheckDisregardIdleState (copy)
	if self.service then
		local VoiceChatState = self.service.VoiceChatState
		
		return if VoiceEndedCheckDisregardIdleState then VoiceChatState == Enum.VoiceChatState.Ended else VoiceChatState == Enum.VoiceChatState.Ended or VoiceChatState == Enum.VoiceChatState.Idle
	else
		return true
	end
end

function VoiceChatServiceManager:UnmountPrompt()
	-- upvalues: RoactModule (copy)
	if self.voiceChatPromptInstance ~= nil then
		RoactModule.unmount(self.voiceChatPromptInstance)
		self.voiceChatPromptInstance = nil
	end
end

VoiceChatServiceManager.default = VoiceChatServiceManager.new(CoreVoiceManager.default, nil, HttpRbxApiService, PermissionsProtocol.default, BlockingUtilityModule:GetAfterBlockedStatusChangedEvent())

return VoiceChatServiceManager