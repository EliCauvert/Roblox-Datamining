local corePackagesService = game:GetService("CorePackages")
local playersService = game:GetService("Players")
local voiceChatService = game:GetService("VoiceChatService")
local promiseModule = require(corePackagesService.Packages.Promise)
local roactModule = require(corePackagesService.Packages.Roact)
local luauPolyfillModule = require(corePackagesService.Packages.LuauPolyfill)
local permissionsProtocol = require(corePackagesService.Workspace.Packages.PermissionsProtocol).PermissionsProtocol
local coreGuiService = game:GetService("CoreGui")
local runService = game:GetService("RunService")
local soundService = game:GetService("SoundService")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local notificationService = game:GetService("NotificationService")
local localizationService = game:GetService("LocalizationService")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local appStorageService = game:GetService("AppStorageService")
local socialUpsellModule = require(corePackagesService.Workspace.Packages.SocialUpsell)
local default = require(corePackagesService.Workspace.Packages.LoggingProtocol).default
local name = require(corePackagesService.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)
local IXPServiceWrapper = require(corePackagesService.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local voiceChatCoreModule = require(corePackagesService.Workspace.Packages.VoiceChatCore)
local default_1 = require(corePackagesService.Workspace.Packages.VoiceChat).GlobalVoiceManager.default
local getFFlagDisableConsentModalForExistingUsersModule = require(script.Parent.Flags.GetFFlagDisableConsentModalForExistingUsers)
local getFFlagOnlyEnableJoinVoiceInVoiceEnabledUniversesModule = require(script.Parent.Flags.GetFFlagOnlyEnableJoinVoiceInVoiceEnabledUniverses)
local getFFlagUpdateVoiceConnectionToastsModule = require(script.Parent.Flags.GetFFlagUpdateVoiceConnectionToasts)
local getFFlagEnableUniveralVoiceToastsModule = require(robloxGui.Modules.Flags.GetFFlagEnableUniveralVoiceToasts)
local getFFlagEnableVoicePromptReasonTextModule = require(robloxGui.Modules.Flags.GetFFlagEnableVoicePromptReasonText)
local getFFlagAvatarChatServiceEnabled = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagAvatarChatServiceEnabled
local getFFlagVoiceChatServiceManagerUseAvatarChat = voiceChatCoreModule.Flags.GetFFlagVoiceChatServiceManagerUseAvatarChat
local getFFlagNonVoiceFTUX = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagNonVoiceFTUX
local getFFlagJoinWithoutMicPermissions = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagJoinWithoutMicPermissions
local getFIntVoiceReverseNudgeUXDisplayTimeSecondsModule = require(robloxGui.Modules.Flags.GetFIntVoiceReverseNudgeUXDisplayTimeSeconds)
local rbxAnalyticsServiceExposePlaySessionIdEngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local getFFlagEnableSeamlessVoiceDataConsentToastModule = require(robloxGui.Modules.Flags.GetFFlagEnableSeamlessVoiceDataConsentToast)
local getFFlagSeamlessVoiceConsentToastPolicy = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagSeamlessVoiceConsentToastPolicy
local getFFlagEnableFtuxExitOnMuteToggle = voiceChatCoreModule.Flags.GetFFlagEnableFtuxExitOnMuteToggle
local getFFlagEnableVoiceChatMuteForVideoCaptures = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagEnableVoiceChatMuteForVideoCaptures
local getFFlagEnableCrossExperienceVoiceCaptureMute = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagEnableCrossExperienceVoiceCaptureMute
local getFFlagExpChatUseVoiceParticipantsStore = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagExpChatUseVoiceParticipantsStore
local getFFlagEnableVoiceUxUpdates = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagEnableVoiceUxUpdates
local getFFlagEnableVoiceTrustedConnectionsToastsModule = require(script.Parent.Flags.GetFFlagEnableVoiceTrustedConnectionsToasts)
local fFlagDebugShowAudioDeviceInputDebugger = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagDebugShowAudioDeviceInputDebugger()
local getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module = require(script.Parent.Flags.GetFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2)
local voiceNudgeUseNewDACopyModule = require(script.Parent.Helpers.VoiceNudgeUseNewDACopy)
local debugSkipVoicePermissionCheck = game:DefineFastFlag("DebugSkipVoicePermissionCheck", false)
local debugSimulateConnectDisconnect = game:DefineFastFlag("DebugSimulateConnectDisconnect", false)
local debugSkipSeamlessVoiceAPICheck = game:DefineFastFlag("DebugSkipSeamlessVoiceAPICheck", false)
local fixSTUXShowingIncorrectly = game:DefineFastFlag("FixSTUXShowingIncorrectly", false)
local sendUserConnectionStatus = game:DefineFastFlag("SendUserConnectionStatus", false)
local debugConnectDisconnectInterval = game:DefineFastInt("DebugConnectDisconnectInterval", 15)
local seamlessVoiceV2JoinVoiceToast = game:DefineFastFlag("SeamlessVoiceV2JoinVoiceToast", false)
local disablePermissionPromptDeeplink = game:DefineFastFlag("DisablePermissionPromptDeeplink", false)
local voiceChatPermissionPromptUseMicrophoneRoute = game:DefineFastFlag("VoiceChatPermissionPromptUseMicrophoneRoute", false)
local voiceEndedCheckDisregardIdleState = game:DefineFastFlag("VoiceEndedCheckDisregardIdleState", false)
local disableLeaveToastInStudio = game:DefineFastFlag("DisableLeaveToastInStudio", false)
local enableVerifiedCheckViaOverlay = game:DefineFastFlag("EnableVerifiedCheckViaOverlay", false)
local getFIntThrottleParticipantsUpdateMs = voiceChatCoreModule.Flags.GetFIntThrottleParticipantsUpdateMs
local getFFlagEnableConnectDisconnectInSettingsAndChromeModule = require(robloxGui.Modules.Flags.GetFFlagEnableConnectDisconnectInSettingsAndChrome)
local voiceUIImprovementsIXPLayerName = game:DefineFastString("VoiceUIImprovementsIXPLayerName", "Voice.Exposure")
local throttleParticipantsUpdateIXPLayerValue = game:DefineFastString("ThrottleParticipantsUpdateIXPLayerValue", "ThrottleParticipantsUpdate")
local voiceVolumeControlsGlobalVoiceVolumeSliderIxpExposure = game:DefineFastFlag("VoiceVolumeControlsGlobalVoiceVolumeSliderIxpExposure", false)
local voiceVolumeControlsGlobalVoiceVolumeSliderIxpLayer = game:DefineFastString("VoiceVolumeControlsGlobalVoiceVolumeSliderIxpLayer", "Voice.VolumeControls")
local seamlessVoiceSTUXDisplayCount = game:DefineFastInt("SeamlessVoiceSTUXDisplayCount", 3)
local getFFlagEnableInExpPhoneVoiceUpsellEntrypoints = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints
local getFFlagShowDevicePermissionsModal = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagShowDevicePermissionsModal
local fFlagEnableRetryForLinkingProtocolFetch = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableRetryForLinkingProtocolFetch
local showJoinVoiceWhenDisconnectedV3 = game:DefineFastFlag("ShowJoinVoiceWhenDisconnectedV3", false)
local fFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule = require(robloxGui.Modules.Settings.Flags.FFlagVoiceVolumeControlsEnableVoiceChatVolumeSlider)
local fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule = require(script.Parent.Flags.FFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToast)
local fFlagVoiceRewarmTelemetry = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagVoiceRewarmTelemetry
local guardVoiceInExpUpsellVariant = game:DefineFastFlag("GuardVoiceInExpUpsellVariant", false)
local _ = {
	FAE_UPSELL = "FaeUpsell",
	VOICE_FTUX = "VoiceFtux",
	REWARM = "Rewarm"
}
local _ = {
	REJOIN_PREVIOUS_CHANNEL = "RejoinPreviousChannel",
	EXIT_FTUX = "ExitFtux",
	MIC_PERMISSION_PROMPT = "MicPermissionPrompt",
	FIRST_JOIN_SESSION = "FirstJoinSession",
	CONSENT_MODAL = "ConsentModal",
	AGE_CHECK_TOAST = "AgeCheckToast",
	PHONE_UPSELL = "PhoneUpsell",
	FAE_UPSELL = "FaeUpsell"
}
local getFFlagIntegratePhoneUpsellJoinVoice = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagIntegratePhoneUpsellJoinVoice
local getFFlagInExperiencePhoneUpsellNewCopy = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagInExperiencePhoneUpsellNewCopy
local getFFlagCheckUniversePlaceBeforeSuspending = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagCheckUniversePlaceBeforeSuspending
local fIntLinkingProtocolFetchRetries = require(corePackagesService.Workspace.Packages.SharedFlags).FIntLinkingProtocolFetchRetries
local fIntLinkingProtocolFetchTimeoutMS = require(corePackagesService.Workspace.Packages.SharedFlags).FIntLinkingProtocolFetchTimeoutMS
local voiceChatModule = require(corePackagesService.Workspace.Packages.VoiceChat)
local constants = voiceChatModule.Constants
local postRecordUserSeenGeneralModal = voiceChatModule.AgeVerificationOverlay.PostRecordUserSeenGeneralModal
local constantsModule = require(robloxGui.Modules.VoiceChat.Constants)
local voiceChatPromptModule = require(robloxGui.Modules.VoiceChatPrompt.Components.VoiceChatPrompt)
local audioDeviceInputDebuggerModule = require(robloxGui.Modules.VoiceChat.Components.AudioDeviceInputDebugger)
local promptTypeModule = require(robloxGui.Modules.VoiceChatPrompt.PromptType)
local getUserSettings = voiceChatModule.GetUserSettings
local getInformedOfBan = voiceChatModule.GetInformedOfBan
local postInformedOfBan = voiceChatModule.PostInformedOfBan
local getCamMicPermissionsModule = require(robloxGui.Modules.Settings.getCamMicPermissions)
local BAN_REASON = constantsModule.BAN_REASON
local seamlessVoiceStatusModule = require(robloxGui.Modules.Settings.Enum.SeamlessVoiceStatus)
local universalAppPolicyModule = require(corePackagesService.Workspace.Packages.UniversalAppPolicy)
local getFFlagVoiceChatClientRewriteMasterLua = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagVoiceChatClientRewriteMasterLua
local getFFlagDisconnectToastClientRewrite = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagDisconnectToastClientRewrite
local getFFlagEnableVrVoiceParity = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagEnableVrVoiceParity
local analytics = voiceChatCoreModule.Analytics
local httpService = game:GetService("HttpService")
local httpRbxApiService = game:GetService("HttpRbxApiService")
local blockingUtilityModule = require(corePackagesService.Workspace.Packages.BlockingUtility)
local microphoneDevicePermissionsLoggingModule = require(robloxGui.Modules.Settings.Resources.MicrophoneDevicePermissionsLogging)
local var63 = if getFFlagAvatarChatServiceEnabled() then game:GetService("AvatarChatService") else nil
local var64 = if getFFlagEnableVoiceChatMuteForVideoCaptures() then game:GetService("CaptureService") else nil
local expChatModule = require(corePackagesService.Workspace.Packages.ExpChat)
local default_2 = require(corePackagesService.Workspace.Packages.LinkingProtocol).LinkingProtocol.default
local settingsRoute = require(corePackagesService.Workspace.Packages.LinkingProtocol).Enums.SettingsRoute
local var66 = if getFFlagEnableInExpPhoneVoiceUpsellEntrypoints() then require(corePackagesService.Workspace.Packages.PhoneUpsell).PhoneUpsellController else nil
local var67 = if getFFlagEnableInExpPhoneVoiceUpsellEntrypoints() then require(corePackagesService.Workspace.Packages.PhoneUpsell).Http.Requests.PostPhoneUpsellDisplayed else nil
local coreVoiceManager = voiceChatCoreModule.CoreVoiceManager
local constants_1 = voiceChatCoreModule.Constants
local getOverlayStore = socialUpsellModule.Overlay.getOverlayStore
local overlayTypes = socialUpsellModule.Overlay.OverlayTypes
local socialUpsellType = socialUpsellModule.Enum.SocialUpsellType
local enum = socialUpsellModule.Analytics.Enum
local socialExperimentsModule = require(corePackagesService.Workspace.Packages.SocialExperiments)
local fFlagTestDeviceForFAEUpsell = socialExperimentsModule.FFlagTestDeviceForFAEUpsell
local deviceMeetsRequirementsForFAE = socialExperimentsModule.deviceMeetsRequirementsForFAE
local enableMutedByLocalUserEngineFeature = game:GetEngineFeature("EnableMutedByLocalUser")
local fFlagEnablePartyVoiceChangersInLua = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnablePartyVoiceChangersInLua
local voiceVolumeControlsEligibility = voiceChatCoreModule.VoiceVolumeControlsEligibility
local VOICE_STATE = constants.VOICE_STATE
local VOICE_CHAT_DEVICE_TYPE = constants.VOICE_CHAT_DEVICE_TYPE
local VOICE_CHAT_AVAILABILITY = constants.VOICE_CHAT_AVAILABILITY
local MIN_VOICE_CHAT_API_VERSION = constants.MIN_VOICE_CHAT_API_VERSION
local WATCHED_MESSAGE_TYPES = constants.WATCHED_MESSAGE_TYPES
local VOICE_JOIN_PROGRESS = constants_1.VOICE_JOIN_PROGRESS
local t = {
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
	HttpRbxApiService = httpRbxApiService,
	NotificationService = notificationService,
	runService = runService,
	PermissionsService = permissionsProtocol.default,
	communicationPermissionsResult = nil,
	VoiceJoinProgress = VOICE_JOIN_PROGRESS.Idle,
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
	VOICE_STATE = VOICE_STATE,
	permissionState = if getFFlagJoinWithoutMicPermissions() then constants.PERMISSION_STATE.IDLE else nil,
	isBanned = false,
	bannedUntil = nil,
	errorText = nil,
	BlockStatusChanged = nil,
	isInCall = false,
	callMutedState = false,
	banReason = nil,
	_mutedAnyone = false,
	VOICE_CHAT_DEVICE_TYPE = VOICE_CHAT_DEVICE_TYPE,
	getPermissionsFunction = getCamMicPermissionsModule,
	AvatarChatService = var63,
	inExpUpsellEntrypoint = nil,
	seamlessVoiceStatus = nil,
	isShowingFTUX = false,
	hideFTUXSignal = Instance.new("BindableEvent"),
	settingsAppAvailable = nil,
	hasLeftFTUX = false,
	deniedMicPermissions = nil,
	isInitialJoin = false,
	joinVoiceButtonContext = nil,
	pendingConnectionSource = nil,
	joinVoiceButtonConsequence = nil,
	CaptureService = var64
}
local var71 = luauPolyfillModule.Set.new({
	"available", "participants", "recentUsersInteractionData", "permissionPromise",
	"canUseServicePromise", "localMuted", "isTalking", "previousGroupId",
	"previousMutedState", "userEligible", "sendMuteEvent", "mutedPlayers",
	"SignalREventTable", "audioDevices", "service", "previousSessionId",
	"voiceEnabled", "permissionState", "BlockStatusChanged", "isInCall",
	"callMutedState", "attemptVoiceRejoin", "VoiceJoinProgressChanged",
	"participantJoined", "participantLeft", "participantsUpdate", "muteChanged",
	"audioDeviceInputAdded", "talkingChanged", "canUseServiceResult"
})
var71:add("_mutedAnyone")
var71:add("muteAllChanged")
local t_1 = {}
local t_2 = {
	[constantsModule.IN_EXP_UPSELL_VARIANT.VARIANT1] = promptTypeModule.VoiceConsentModalV1,
	[constantsModule.IN_EXP_UPSELL_VARIANT.VARIANT2] = promptTypeModule.VoiceConsentModalV2,
	[constantsModule.IN_EXP_UPSELL_VARIANT.VARIANT3] = promptTypeModule.VoiceConsentModalV3
}

function getIconSrc(p0, p1) --[[ line: 355 ]]
	return "rbxasset://textures/ui/VoiceChat/" .. (if p1 then p1 .. "/" else "") .. p0 .. ".png"
end

function getIcon(p2, p3, p4) --[[ line: 360 ]]
	-- upvalues: VOICE_STATE (ref)
	return if p2 == VOICE_STATE.MUTED then getIconSrc("Muted", p4) elseif p2 == VOICE_STATE.CONNECTING then getIconSrc("Connecting", p4) elseif p2 == VOICE_STATE.INACTIVE then getIconSrc("Blank", p4) elseif p2 == VOICE_STATE.TALKING then p3 and getIconSrc("Unmuted" .. tostring(math.floor(0.5 + 5 * (p3 or math.random())) * 20), p4) or getIconSrc("Blank", p4) else getIconSrc("Error", p4)
end

t.__index = t

function t:__index(p5) --[[ line: 378 ]]
	-- upvalues: var71 (ref), t (ref)
	return if var71:has(p5) then self.coreVoiceManager[p5] else rawget(t, p5)
end

function t:__newindex(p6, p7) --[[ line: 385 ]]
	-- upvalues: var71 (ref), t (ref)
	if var71:has(p6) then
		self.coreVoiceManager[p6] = p7
		
		return
	end
	rawset(t, p6, p7)
end

function t.new(p8, p9, p10, p11, p12, p13, p14, p15, p16, p17) --[[ line: 393 ]]
	-- upvalues: analytics (ref), getCamMicPermissionsModule (ref), t (ref), WATCHED_MESSAGE_TYPES (ref), getFIntThrottleParticipantsUpdateMs (ref), IXPServiceWrapper (ref), voiceUIImprovementsIXPLayerName (ref), throttleParticipantsUpdateIXPLayerValue (ref), getFFlagExpChatUseVoiceParticipantsStore (ref), expChatModule (ref), getFFlagEnableUniveralVoiceToastsModule (ref), fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule (ref), fFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule (ref), debugSkipVoicePermissionCheck (ref), fFlagDebugShowAudioDeviceInputDebugger (ref), fFlagEnablePartyVoiceChangersInLua (ref), microphoneDevicePermissionsLoggingModule (ref), voiceVolumeControlsGlobalVoiceVolumeSliderIxpExposure (ref), voiceVolumeControlsEligibility (ref), voiceVolumeControlsGlobalVoiceVolumeSliderIxpLayer (ref), VOICE_JOIN_PROGRESS (ref), constantsModule (ref), getFFlagEnableConnectDisconnectInSettingsAndChromeModule (ref), disableLeaveToastInStudio (ref), promptTypeModule (ref), debugSimulateConnectDisconnect (ref), name (ref), getFFlagEnableVoiceTrustedConnectionsToastsModule (ref), appStorageService (ref), getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (ref), voiceNudgeUseNewDACopyModule (ref), getFFlagShowDevicePermissionsModal (ref), getFFlagEnableSeamlessVoiceDataConsentToastModule (ref), getFFlagNonVoiceFTUX (ref), getFFlagUpdateVoiceConnectionToastsModule (ref), seamlessVoiceV2JoinVoiceToast (ref), getFFlagEnableVoiceChatMuteForVideoCaptures (ref), getFFlagEnableCrossExperienceVoiceCaptureMute (ref), default_1 (ref)
	local tbl = setmetatable({
		_mutedAnyone = false,
		voiceConnectEventReportedForActiveSession = false,
		service = p9,
		HttpRbxApiService = p10,
		NotificationService = p14,
		PermissionsService = p11,
		BlockStatusChanged = p12,
		Analytics = analytics.new(p13),
		getPermissionsFunction = p15 or getCamMicPermissionsModule,
		AvatarChatService = p16,
		SequenceNumbers = {},
		SignalREventTable = {},
		coreVoiceManager = p8,
		CaptureService = p17
	}, t)
	
	for i, v in WATCHED_MESSAGE_TYPES do
		tbl.SignalREventTable[v] = Instance.new("BindableEvent")
	end
	tbl.shouldThrottleParticipantUpdate = false
	tbl.participantsStateThrottleTime = 0
	tbl.lastParticipantsStateUpdate = 0
	tbl.lastStateUpdateCounter = 0
	tbl.reverseNudgeToxicUserRemovalCallbacks = {}
	
	if getFIntThrottleParticipantsUpdateMs() > 0 then
		tbl.participantsStateThrottleTime = getFIntThrottleParticipantsUpdateMs() / 1000
		local ok, status = pcall(function() --[[ line: 434 ]]
			-- upvalues: IXPServiceWrapper (copy), voiceUIImprovementsIXPLayerName (copy)
			return IXPServiceWrapper:GetLayerData(voiceUIImprovementsIXPLayerName)
		end)
		
		if ok and status and status[throttleParticipantsUpdateIXPLayerValue] then
			tbl.shouldThrottleParticipantUpdate = true
		end
	end
	tbl.MuteStatusIcons = {
		MicOn = tbl:GetIcon("Unmuted0", "SpeakerLight"),
		MicOff = tbl:GetIcon("Muted", "SpeakerLight"),
		MicDisabled = tbl:GetIcon("Muted", "SpeakerLight"),
		Loading = tbl:GetIcon("Connecting", "SpeakerLight"),
		Error = tbl:GetIcon("Error", "SpeakerLight")
	}
	tbl.PlayerMuteStatusIcons = {
		MicOn = tbl:GetIcon("Unmuted0", "MicLight"),
		MicOff = tbl:GetIcon("Muted", "MicLight"),
		MicDisabled = tbl:GetIcon("Muted", "MicLight"),
		Loading = tbl:GetIcon("Connecting", "MicLight"),
		Error = tbl:GetIcon("Error", "MicLight")
	}
	local var75 = false
	local eventConnection = tbl.attemptVoiceRejoin.Event:Connect(function() --[[ line: 460 ]]
		-- upvalues: var75 (write)
		var75 = true
	end)
	local var77 = if getFFlagExpChatUseVoiceParticipantsStore() then expChatModule.Stores.GetVoiceStore(false) else nil
	tbl.coreVoiceManager:subscribe("GetPermissions", function(p18, p19, p20, p21) --[[ line: 467 ]]
		-- upvalues: tbl (ref)
		tbl.getPermissionsFunction(p18, p19, p20, if tbl.inExpUpsellEntrypoint ~= nil then tbl.inExpUpsellEntrypoint else "VoiceChatServiceManager.requestMicPermission", p21)
	end)
	tbl.coreVoiceManager:subscribe("OnVoiceParticipantRemoved", function(p22) --[[ line: 474 ]]
		-- upvalues: getFFlagExpChatUseVoiceParticipantsStore (copy), var77 (ref), expChatModule (copy)
		if getFFlagExpChatUseVoiceParticipantsStore() then
			var77.handleVoiceParticipantRemoved(p22)
			
			return
		elseif expChatModule.Events.VoiceParticipantRemoved then
			expChatModule.Events.VoiceParticipantRemoved(tostring(p22))
		end
	end)
	tbl.coreVoiceManager:subscribe("OnVoiceParticipantAdded", function(p23) --[[ line: 481 ]]
		-- upvalues: getFFlagExpChatUseVoiceParticipantsStore (copy), var77 (ref), expChatModule (copy)
		if getFFlagExpChatUseVoiceParticipantsStore() then
			var77.handleVoiceParticipantAdded(p23)
			
			return
		elseif expChatModule.Events.VoiceParticipantAdded then
			expChatModule.Events.VoiceParticipantAdded(tostring(p23))
		end
	end)
	tbl.coreVoiceManager:subscribe("OnVoiceParticipantToggleMuted", function(p24, p25) --[[ line: 488 ]]
		-- upvalues: expChatModule (copy)
		if expChatModule.Events.VoiceParticipantToggleMuted then
			expChatModule.Events.VoiceParticipantToggleMuted(tostring(p24), p25)
		end
	end)
	tbl.coreVoiceManager:subscribe("OnUserAndPlaceCanUseVoiceResolved", function(p26, p27) --[[ line: 493 ]]
		-- upvalues: tbl (ref)
		tbl:_onUserAndPlaceCanUseVoiceResolved(p26, p27)
	end)
	tbl.coreVoiceManager:subscribe("OnRequestMicPermissionResolved", function() --[[ line: 496 ]]
		-- upvalues: getFFlagEnableUniveralVoiceToastsModule (copy), fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule (copy), fFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule (copy), tbl (ref)
		if not getFFlagEnableUniveralVoiceToastsModule() then return end
		return if fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule and fFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule then tbl:CheckAndShowNotAudiblePrompt():andThen(function() --[[ line: 499 ]]
			-- upvalues: tbl (copy)
			return tbl:ShowNotAudiblePromptVoiceChatVolume()
		end) else tbl:CheckAndShowNotAudiblePrompt()
	end)
	tbl.coreVoiceManager:subscribe("OnRequestMicPermissionRejected", function() --[[ line: 507 ]]
		-- upvalues: tbl (ref), getFFlagEnableUniveralVoiceToastsModule (copy), debugSkipVoicePermissionCheck (copy)
		if tbl:IsSeamlessVoice() then
			tbl.deniedMicPermissions = true
		end
		if getFFlagEnableUniveralVoiceToastsModule() and not debugSkipVoicePermissionCheck then
			return tbl:CheckAndShowPermissionPrompt()
		end
	end)
	
	if fFlagDebugShowAudioDeviceInputDebugger then
		tbl.coreVoiceManager:subscribe("OnDevicePlayerChanged", function() --[[ line: 518 ]]
			-- upvalues: tbl (ref)
			tbl:UpdateAudioDeviceInputDebugger()
		end)
		tbl.coreVoiceManager:subscribe("OnDeviceActiveChanged", function() --[[ line: 521 ]]
			-- upvalues: tbl (ref)
			tbl:UpdateAudioDeviceInputDebugger()
		end)
		tbl.coreVoiceManager:subscribe("OnDeviceMuteChanged", function() --[[ line: 524 ]]
			-- upvalues: tbl (ref)
			tbl:UpdateAudioDeviceInputDebugger()
		end)
		
		if fFlagEnablePartyVoiceChangersInLua then
			tbl.coreVoiceManager:subscribe("OnVoiceChangerChanged", function() --[[ line: 528 ]]
				-- upvalues: tbl (ref)
				tbl:UpdateAudioDeviceInputDebugger()
			end)
		end
		tbl.coreVoiceManager:subscribe("OnPlayerMuted", function() --[[ line: 532 ]]
			-- upvalues: tbl (ref)
			tbl:UpdateAudioDeviceInputDebugger()
		end)
		tbl.coreVoiceManager:subscribe("OnAudioDeviceInputAdded", function() --[[ line: 535 ]]
			-- upvalues: tbl (ref)
			tbl:UpdateAudioDeviceInputDebugger()
		end)
		tbl.coreVoiceManager:subscribe("OnAudioDeviceInputRemoved", function() --[[ line: 538 ]]
			-- upvalues: tbl (ref)
			tbl:UpdateAudioDeviceInputDebugger()
		end)
		tbl.coreVoiceManager:subscribe("OnDeviceMutedByLocalUserChanged", function() --[[ line: 541 ]]
			-- upvalues: tbl (ref)
			tbl:UpdateAudioDeviceInputDebugger()
		end)
	end
	tbl.coreVoiceManager:subscribe("OnStateChanged", function(_, p28) --[[ line: 545 ]]
		-- upvalues: microphoneDevicePermissionsLoggingModule (copy), tbl (ref), voiceVolumeControlsGlobalVoiceVolumeSliderIxpExposure (copy), voiceVolumeControlsEligibility (copy), IXPServiceWrapper (copy), voiceVolumeControlsGlobalVoiceVolumeSliderIxpLayer (copy), VOICE_JOIN_PROGRESS (copy), constantsModule (copy), var75 (write), eventConnection (ref), getFFlagEnableConnectDisconnectInSettingsAndChromeModule (copy), disableLeaveToastInStudio (copy), promptTypeModule (copy)
		microphoneDevicePermissionsLoggingModule:setClientSessionId(tbl.coreVoiceManager:GetSessionId())
		
		if p28 == Enum.VoiceChatState.Ended or p28 == Enum.VoiceChatState.Failed then
			tbl.voiceConnectEventReportedForActiveSession = false
		end
		if p28 == Enum.VoiceChatState.Joined and voiceVolumeControlsGlobalVoiceVolumeSliderIxpExposure and voiceVolumeControlsEligibility.isVoiceChatVolumeSliderVisible(true, game:GetService("VoiceChatService").UseNewAudioApi) then
			IXPServiceWrapper:LogFlagLinkedUserLayerExposure(voiceVolumeControlsGlobalVoiceVolumeSliderIxpLayer)
		end
		if p28 == Enum.VoiceChatState.Joined and tbl:GetVoiceJoinProgress() == VOICE_JOIN_PROGRESS.Idle and not tbl.voiceConnectEventReportedForActiveSession then
			local connectDisconnectAnalyticsData = tbl:GetConnectDisconnectAnalyticsData()
			connectDisconnectAnalyticsData.connectionSource = constantsModule.VOICE_CONNECTION_SOURCE.AUTO_CONNECT
			tbl.pendingConnectionSource = nil
			tbl.Analytics:reportConnectDisconnectEvents("voiceConnectEvent", connectDisconnectAnalyticsData)
			tbl.voiceConnectEventReportedForActiveSession = true
			var75 = false
			eventConnection:Disconnect()
		end
		local var79 = p28 == Enum.VoiceChatState.Ended
		
		if var79 then
			local connectDisconnectAnalyticsData = tbl:GetConnectDisconnectAnalyticsData()
			connectDisconnectAnalyticsData.disconnectReason = tbl.pendingDisconnectReason or constantsModule.VOICE_DISCONNECT_REASON.SYSTEM
			tbl.Analytics:reportConnectDisconnectEvents("voiceDisconnectReasonEvent", connectDisconnectAnalyticsData)
			tbl.pendingDisconnectReason = nil
		end
		if var79 and tbl.bannedUntil == nil then
			if not getFFlagEnableConnectDisconnectInSettingsAndChromeModule() then
				tbl:HideVoiceUI()
			end
			if disableLeaveToastInStudio and tbl.runService:IsStudio() then return end
			tbl:showPrompt(promptTypeModule.LeaveVoice)
		end
	end)
	tbl.coreVoiceManager:subscribe("OnVoiceChatServiceInitialized", function() --[[ line: 596 ]]
		-- upvalues: tbl (ref), debugSimulateConnectDisconnect (copy), name (copy), getFFlagEnableVoiceTrustedConnectionsToastsModule (copy), appStorageService (copy), constantsModule (copy), promptTypeModule (copy)
		tbl:ShowVoiceUI()
		
		if debugSimulateConnectDisconnect then
			name:debug("Simulating join voice")
			tbl:simulateVoiceConnectDisconnect()
		end
		if getFFlagEnableVoiceTrustedConnectionsToastsModule() and not tbl.coreVoiceManager.initializedPostSuspension then
			local ok, status = pcall(function() --[[ line: 604 ]]
				-- upvalues: appStorageService (copy), constantsModule (copy)
				return appStorageService:GetItem(constantsModule.VOICE_WITH_TC_TOAST_KEY) == "true"
			end)
			
			if not (if ok then status else true) then
				tbl:showPrompt(promptTypeModule.UpdateOnAutoJoinToast)
				pcall(function() --[[ line: 611 ]]
					-- upvalues: appStorageService (copy), constantsModule (copy)
					appStorageService:SetItem(constantsModule.VOICE_WITH_TC_TOAST_KEY, "true")
					appStorageService:Flush()
				end)
			end
		end
	end)
	tbl.coreVoiceManager:subscribe("OnInitialJoinFailed", function() --[[ line: 619 ]]
		-- upvalues: tbl (ref)
		tbl:InitialJoinFailedPrompt()
	end)
	tbl.coreVoiceManager:subscribe("OnPlayerModerated", function() --[[ line: 622 ]]
		-- upvalues: tbl (ref), constantsModule (copy)
		tbl.pendingDisconnectReason = constantsModule.VOICE_DISCONNECT_REASON.MODERATED
		tbl:ShowPlayerModeratedMessage()
	end)
	tbl.coreVoiceManager:subscribe("OnRetryRequested", function() --[[ line: 627 ]]
		-- upvalues: tbl (ref), promptTypeModule (copy)
		tbl:showPrompt(promptTypeModule.Retry)
	end)
	tbl.coreVoiceManager:subscribe("OnVoiceToxicityModal", function() --[[ line: 630 ]]
		-- upvalues: name (copy), getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (copy), voiceNudgeUseNewDACopyModule (copy), tbl (ref), promptTypeModule (copy)
		name:debug("Showing Voice Toxicity Modal")
		
		if getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and voiceNudgeUseNewDACopyModule() then
			tbl:showPrompt(promptTypeModule.VoiceToxicityModalV2)
			
			return
		end
		tbl:showPrompt(promptTypeModule.VoiceToxicityModal)
	end)
	tbl.coreVoiceManager:subscribe("OnVoiceToxicityToast", function() --[[ line: 638 ]]
		-- upvalues: name (copy), getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (copy), voiceNudgeUseNewDACopyModule (copy), tbl (ref), promptTypeModule (copy)
		name:debug("Showing Voice Toxicity Toast")
		
		if getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and voiceNudgeUseNewDACopyModule() then
			tbl:showPrompt(promptTypeModule.VoiceToxicityToastV2)
			
			return
		end
		tbl:showPrompt(promptTypeModule.VoiceToxicityToast)
	end)
	tbl.coreVoiceManager:subscribe("OnPermissionRequested", function() --[[ line: 646 ]]
		-- upvalues: getFFlagShowDevicePermissionsModal (copy), tbl (ref), promptTypeModule (copy)
		if getFFlagShowDevicePermissionsModal() then
			tbl:showPrompt(promptTypeModule.DevicePermissionsModal)
			
			return
		end
		tbl:showPrompt(promptTypeModule.Permission)
	end)
	tbl.coreVoiceManager:subscribe("OnShowDataConsentToast", function() --[[ line: 653 ]]
		-- upvalues: getFFlagEnableSeamlessVoiceDataConsentToastModule (copy), tbl (ref)
		if getFFlagEnableSeamlessVoiceDataConsentToastModule() then
			tbl:showDataConsentToast()
		end
	end)
	tbl.coreVoiceManager:subscribe("OnVoiceReverseNudgeIconColorChange", function(p29) --[[ line: 658 ]]
		-- upvalues: name (copy), expChatModule (copy), tbl (ref)
		name:debug("Showing Reverse Nudge Icon Color Change")
		
		if expChatModule.Events.AddReverseNudgeToxicUser and expChatModule.Events.RemoveReverseNudgeToxicUser then
			tbl:AddReverseNudgeToxicUser(p29.toxicUserId, expChatModule.Events.AddReverseNudgeToxicUser, expChatModule.Events.RemoveReverseNudgeToxicUser)
		end
	end)
	tbl.coreVoiceManager.setVoiceUIVisibility.Event:Connect(function(p30) --[[ line: 668 ]]
		-- upvalues: tbl (ref)
		if p30 then
			tbl:ShowVoiceUI()
			
			return
		end
		tbl:HideVoiceUI()
	end)
	tbl.coreVoiceManager:subscribe("OnVoiceJoin", function() --[[ line: 675 ]]
		-- upvalues: getFFlagNonVoiceFTUX (copy), tbl (ref), getFFlagEnableVoiceTrustedConnectionsToastsModule (copy), getFFlagUpdateVoiceConnectionToastsModule (copy), promptTypeModule (copy), seamlessVoiceV2JoinVoiceToast (copy), getFFlagEnableVoiceChatMuteForVideoCaptures (copy), getFFlagEnableCrossExperienceVoiceCaptureMute (copy), default_1 (copy), var75 (write), eventConnection (ref)
		if getFFlagNonVoiceFTUX() and tbl.hasLeftFTUX then
			tbl.hasLeftFTUX = false
			
			if getFFlagEnableVoiceTrustedConnectionsToastsModule() then
				tbl:showJoinVoicePrompt()
			elseif getFFlagUpdateVoiceConnectionToastsModule() then
				tbl:showPrompt(promptTypeModule.UnifiedJoinVoiceToast)
			else
				tbl:showPrompt(promptTypeModule.JoinedVoiceToast)
			end
			tbl.Analytics:reportConnectDisconnectEvents("voiceConnectFtuxLeaveEvent", tbl:GetConnectDisconnectAnalyticsData())
		elseif tbl:IsSeamlessVoice() then
			if getFFlagEnableVoiceTrustedConnectionsToastsModule() then
				tbl:showJoinVoicePrompt()
			elseif getFFlagUpdateVoiceConnectionToastsModule() then
				tbl:showPrompt(promptTypeModule.UnifiedJoinVoiceToast)
			elseif seamlessVoiceV2JoinVoiceToast and tbl.isInitialJoin then
				tbl:showPrompt(promptTypeModule.JoinedVoiceToast)
			else
				tbl:showPrompt(promptTypeModule.JoinVoice)
			end
			tbl:SetVoiceConnectCookieValue(true)
		else
			tbl:showPrompt(promptTypeModule.VoiceConsentAcceptedToast)
		end
		if getFFlagEnableVoiceChatMuteForVideoCaptures() and tbl.CaptureService:IsCapturingVideo() then
			if getFFlagEnableCrossExperienceVoiceCaptureMute() then
				default_1:MuteAll("Capture")
				tbl:HideVoiceUI()
			else
				tbl:MuteAll(true, "Capture")
				tbl:HideVoiceUI()
			end
		end
		if var75 then
			local connectDisconnectAnalyticsData = tbl:GetConnectDisconnectAnalyticsData()
			connectDisconnectAnalyticsData.connectionSource = tbl.pendingConnectionSource
			tbl.pendingConnectionSource = nil
			tbl.Analytics:reportConnectDisconnectEvents("voiceConnectEvent", connectDisconnectAnalyticsData)
			tbl.voiceConnectEventReportedForActiveSession = true
			var75 = false
			eventConnection:Disconnect()
		end
	end)
	
	return tbl
end

local function _(p31) --[[ line: 728 | named "shorten" ]]
	return "..." .. string.sub(tostring(p31), -4)
end

local _ = function(p32, p33) --[[ line: 732 | named "bind" ]]
	return function(...) --[[ line: 733 ]]
		-- upvalues: p32 (ref), p33 (ref)
		return p32[p33](p32, ...)
	end
end

function t:subscribe(p34, p35) --[[ line: 738 ]]
	return self.coreVoiceManager:subscribe(p34, p35)
end

function t:unsubscribe(p36, p37) --[[ line: 742 ]]
	self.coreVoiceManager:unsubscribe(p36, p37)
end

function t:_reportJoinFailed(p38, p39) --[[ line: 746 ]]
	return self.coreVoiceManager:_reportJoinFailed(p38, p39)
end

function t:_asyncInit() --[[ line: 750 ]]
	return self.coreVoiceManager:_asyncInit()
end

function t:asyncInit() --[[ line: 754 ]]
	return self.coreVoiceManager:asyncInit()
end

function t:CheckAudioInputExists() --[[ line: 758 ]]
	return self.coreVoiceManager:CheckAudioInputExists()
end

function t:getService() --[[ line: 762 ]]
	return self.service
end

function t:GetMutedAnyone() --[[ line: 766 ]]
	return self.coreVoiceManager:GetMutedAnyone()
end

function t:RecordGameSettingsOpened() --[[ line: 770 ]]
	self.coreVoiceManager:RecordGameSettingsOpened()
end

function t:ReportVoiceVolumeImpressionsIfNeeded() --[[ line: 774 ]]
	self.coreVoiceManager:ReportVoiceVolumeImpressionsIfNeeded()
end

function t:GetRequest(p40, p41) --[[ line: 778 ]]
	return self.coreVoiceManager:GetRequest(p40, p41)
end

function t.PostRequest(p42, p43, _, p44) --[[ line: 782 ]]
	-- upvalues: httpService (ref)
	local ok, status = pcall(function() --[[ line: 783 ]]
		-- upvalues: p42 (ref), p43 (ref), p44 (ref), httpService (copy)
		return httpService:JSONDecode(p42.HttpRbxApiService:PostAsyncFullUrl(p43, p44, Enum.ThrottlingPriority.Default, Enum.HttpContentType.ApplicationJson, Enum.HttpRequestType.Players))
	end)
	
	return ok and status
end

function t:_GetShowAgeVerificationOverlay(p45) --[[ line: 804 ]]
	return self.coreVoiceManager:_GetShowAgeVerificationOverlay(p45)
end

function t.simulateVoiceConnectDisconnect(p46) --[[ line: 808 ]]
	-- upvalues: debugConnectDisconnectInterval (ref), name (ref)
	task.spawn(function() --[[ line: 809 ]]
		-- upvalues: debugConnectDisconnectInterval (copy), p46 (ref), name (copy)
		while true do
			task.wait(debugConnectDisconnectInterval)
			if p46.voiceUIVisible then
				name:debug("Hiding Voice")
				p46:HideVoiceUI()
			else
				name:debug("Showing Voice")
				p46:ShowVoiceUI()
			end
		end
	end)
end

function t:FetchAgeVerificationOverlay(p47) --[[ line: 823 ]]
	return self.coreVoiceManager:FetchAgeVerificationOverlay(p47)
end

function t:FetchPhoneVerificationUpsell(p48, p49, p50) --[[ line: 827 ]]
	return self.coreVoiceManager:FetchPhoneVerificationUpsell(p48, p49, p50)
end

function t.RecordUserSeenModal(p51, p52) --[[ line: 835 ]]
	-- upvalues: postRecordUserSeenGeneralModal (ref)
	local var82 = "PostRequest"
	
	return postRecordUserSeenGeneralModal(function(...) --[[ line: 733 ]]
		-- upvalues: p51 (ref), var82 (ref)
		return p51[var82](p51, ...)
	end, p52)
end

function t:checkAndUpdateSequence(p53, p54) --[[ line: 839 ]]
	return self.coreVoiceManager:checkAndUpdateSequence(p53, p54)
end

function t:onMissedSequence(p55) --[[ line: 843 ]]
	return self.coreVoiceManager:onMissedSequence(p55)
end

function t:watchSignalR() --[[ line: 847 ]]
	return self.coreVoiceManager:watchSignalR()
end

function t:voicePermissionGranted(p56) --[[ line: 855 ]]
	return self.coreVoiceManager:voicePermissionGranted(p56)
end

function t:GetSignalREvent(p57) --[[ line: 859 ]]
	return self.coreVoiceManager:GetSignalREvent(p57)
end

function t:avatarChatUserAndPlaceSettingsValueOfClientFeatures(p58) --[[ line: 864 ]]
	return self.coreVoiceManager:avatarChatUserAndPlaceSettingsValueOfClientFeatures(p58)
end

function t:resolveAvatarChatUserAndPlaceSettings() --[[ line: 868 ]]
	return self.coreVoiceManager:resolveAvatarChatUserAndPlaceSettings()
end

function t:EnableVoice() --[[ line: 872 ]]
	return self.coreVoiceManager:EnableVoice()
end

function t:_VoiceChatFirstTimeUX(p59) --[[ line: 876 ]]
	-- upvalues: constantsModule (ref), name (ref), getFFlagNonVoiceFTUX (ref), expChatModule (ref), getFFlagEnableFtuxExitOnMuteToggle (ref), seamlessVoiceSTUXDisplayCount (ref), fixSTUXShowingIncorrectly (ref), promptTypeModule (ref)
	local var83 = nil
	local var84 = nil
	
	if not pcall(function() --[[ line: 878 ]]
		-- upvalues: p59 (ref), constantsModule (copy), var83 (write), var84 (write)
		local seamless_voice_stux_keyItem = p59:GetItem(constantsModule.SEAMLESS_VOICE_STUX_KEY)
		var83 = p59:GetItem(constantsModule.SEAMLESS_VOICE_FTUX_KEY) == "true"
		var84 = if seamless_voice_stux_keyItem == nil then 0 else tonumber(seamless_voice_stux_keyItem)
	end) then
		name:warning("Failed to read FTUX/STUX from AppStorage")
		
		return
	end
	name:trace("hasShownFTUX: {}. STUXCount: {}", var83, var84)
	name:debug("Showing FTUX")
	self.isShowingFTUX = true
	self.Analytics:reportConnectDisconnectEvents("voiceConnectFtuxJoinEvent", self:GetConnectDisconnectAnalyticsData())
	
	if getFFlagNonVoiceFTUX() then
		expChatModule.Events.VoiceUIVisibilityChanged(true)
	else
		self:MuteAll(true, "FTUX")
		self.muteAllChanged.Event:Once(function() --[[ line: 904 ]]
			-- upvalues: self (ref), p59 (ref)
			self:HideFTUX(p59)
			self.Analytics:reportConnectDisconnectEvents("voiceConnectFtuxLeaveEvent", self:GetConnectDisconnectAnalyticsData())
		end)
		self.talkingChanged.Event:Once(function() --[[ line: 911 ]]
			-- upvalues: self (ref), p59 (ref)
			self:HideFTUX(p59)
		end)
		
		if getFFlagEnableFtuxExitOnMuteToggle() then
			self.coreVoiceManager.onPlayerMuteToggled.Event:Once(function() --[[ line: 915 ]]
				-- upvalues: self (ref), p59 (ref)
				self:HideFTUX(p59)
			end)
		end
	end
end

function t:VoiceChatFirstTimeUX(p60) --[[ line: 933 ]]
	-- upvalues: fixSTUXShowingIncorrectly (ref), name (ref), debugSkipSeamlessVoiceAPICheck (ref), constantsModule (ref), getFFlagNonVoiceFTUX (ref)
	if fixSTUXShowingIncorrectly and not self:verifyUniverseAndPlaceCanUseVoice() then
		name:debug("Universe/place is not voice enabled, do not run FTUX/STUX")
		
		return
	elseif not debugSkipSeamlessVoiceAPICheck then
		local var86 = self:FetchAgeVerificationOverlay()
		
		if type(var86) == "table" and var86.voiceSettings and var86.voiceSettings.seamlessVoiceStatus ~= constantsModule.SEAMLESS_VOICE_STATUS_ENABLED_NEW_USER then
			name:debug("User not eligible for FTUX/STUX")
			
			return
		end
	end
	local function _() --[[ line: 953 | named "startFTUX" ]]
		-- upvalues: name (copy), self (ref), p60 (ref)
		name:debug("Starting FTUX")
		self:_VoiceChatFirstTimeUX(p60)
	end
	
	if getFFlagNonVoiceFTUX() then
		name:debug("Starting FTUX")
		self:_VoiceChatFirstTimeUX(p60)
		
		return
	end
	self:asyncInit():andThen(function() --[[ line: 961 ]]
		-- upvalues: self (ref), name (copy), p60 (ref)
		local stateChangedConnection = nil
		
		if self.service.VoiceChatState and self.service.VoiceChatState == Enum.VoiceChatState.Joined then
			name:debug("Starting FTUX")
			self:_VoiceChatFirstTimeUX(p60)
		end
		stateChangedConnection = self.service.StateChanged:Connect(function(_, p62) --[[ line: 969 ]]
			-- upvalues: name (copy), self (copy), p60 (copy), stateChangedConnection (write)
			if p62 == Enum.VoiceChatState.Joined then
				name:debug("Starting FTUX")
				self:_VoiceChatFirstTimeUX(p60)
				stateChangedConnection:Disconnect()
			end
		end)
	end):catch(function(p61) --[[ line: 976 ]]
		-- upvalues: name (copy)
		name:trace("Failed to start FTUX: {}", p61)
	end)
end

function t:HideFTUX(p63) --[[ line: 982 ]]
	-- upvalues: constantsModule (ref), getFFlagNonVoiceFTUX (ref), promptTypeModule (ref)
	self.isShowingFTUX = false
	self.hideFTUXSignal:Fire()
	pcall(function() --[[ line: 985 ]]
		-- upvalues: p63 (ref), constantsModule (copy)
		p63:SetItem(constantsModule.SEAMLESS_VOICE_FTUX_KEY, "true")
		p63:Flush()
	end)
	
	if getFFlagNonVoiceFTUX() then
		self.hasLeftFTUX = true
		self.attemptVoiceRejoin:Fire()
	end
	if not getFFlagNonVoiceFTUX() then
		self:MuteAll(false, "FTUX")
		self:showPrompt(promptTypeModule.JoinedVoiceToast)
	end
end

function t:_onUserAndPlaceCanUseVoiceResolved(p64, p65) --[[ line: 999 ]]
	-- upvalues: getInformedOfBan (ref), getFFlagAvatarChatServiceEnabled (ref), getFFlagVoiceChatServiceManagerUseAvatarChat (ref), promptTypeModule (ref), BAN_REASON (ref), getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (ref), voiceNudgeUseNewDACopyModule (ref), getFFlagEnableVoicePromptReasonTextModule (ref)
	self.bannedUntil = nil
	
	if p64 and p64.isBanned then
		local var88 = "GetRequest"
		local var89 = getInformedOfBan(function(...) --[[ line: 733 ]]
			-- upvalues: self (ref), var88 (ref)
			return self[var88](self, ...)
		end)
		
		if var89 and not var89.informedOfBan then
			if getFFlagAvatarChatServiceEnabled() and getFFlagVoiceChatServiceManagerUseAvatarChat() and p64.bannedUntil == nil then
				self:ShowPlayerModeratedMessage()
			elseif p64.bannedUntil == nil then
				self:showPrompt(promptTypeModule.VoiceChatSuspendedPermanent)
			else
				self.bannedUntil = p64.bannedUntil
				
				if p64.banReason ~= BAN_REASON.NUDGE_V3 then
					self:showPrompt(promptTypeModule.VoiceChatSuspendedTemporary)
				elseif getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and voiceNudgeUseNewDACopyModule() then
					self:showPrompt(promptTypeModule.VoiceChatSuspendedTemporaryBV2)
				else
					self:showPrompt(promptTypeModule.VoiceChatSuspendedTemporaryB)
				end
			end
		end
		if var89 and var89.informedOfBan then
			self:ShowPlayerModeratedMessage(true)
			
			return
		end
	elseif self.runService:IsStudio() and p64 and not p64.isVoiceEnabled then
		self:showPrompt(promptTypeModule.User)
		
		return
	elseif self.runService:IsStudio() and p65 and not p65.isPlaceEnabledForVoice then
		self:showPrompt(promptTypeModule.Place, getFFlagEnableVoicePromptReasonTextModule() and (table.concat(p65.reasons or {}, "") or nil))
	end
end

function t:ChangeVoiceJoinProgress(p66) --[[ line: 1047 ]]
	return self.coreVoiceManager:ChangeVoiceJoinProgress(p66)
end

function t:GetVoiceJoinProgress() --[[ line: 1051 ]]
	return self.coreVoiceManager.VoiceJoinProgress
end

function t:UserOnlyEligibleForVoice() --[[ line: 1055 ]]
	return self.coreVoiceManager:UserOnlyEligibleForVoice()
end

function t:UserOnlyEligibleForVoiceViaOverlay() --[[ line: 1059 ]]
	return self.coreVoiceManager:UserOnlyEligibleForVoiceViaOverlay()
end

function t:UserVoiceEnabled() --[[ line: 1063 ]]
	return self.coreVoiceManager:UserVoiceEnabled()
end

function t:UserInInExperienceUpsellTreatment() --[[ line: 1067 ]]
	return self.coreVoiceManager:UserInInExperienceUpsellTreatment()
end

function t:UserEligibleForInExperienceUpsell() --[[ line: 1071 ]]
	return self.coreVoiceManager:UserEligibleForInExperienceUpsell()
end

function t:ShowInExperienceVoiceUpsell(p67) --[[ line: 1076 ]]
	-- upvalues: guardVoiceInExpUpsellVariant (ref)
	local var90 = self:FetchAgeVerificationOverlay()
	
	if guardVoiceInExpUpsellVariant and type(var90) ~= "table" then
		return
	end
	local showVoiceInExperienceUpsellVariant = var90.showVoiceInExperienceUpsellVariant
	self:SetInExpUpsellEntrypoint(p67)
	self:showPrompt(self:GetInExpUpsellPromptFromEnum(showVoiceInExperienceUpsellVariant))
end

function t:ShowInExperiencePhoneVoiceUpsell(p68, p69) --[[ line: 1090 ]]
	-- upvalues: var66 (ref), getFFlagInExperiencePhoneUpsellNewCopy (ref), var67 (ref), constantsModule (ref), promptTypeModule (ref)
	self:SetInExpUpsellEntrypoint(p68)
	var66.openPhoneUpsell({
		origin = "inExperience",
		eventContext = "verificationUpsell",
		entryConfig = {
			titleKey = "Feature.VerificationUpsell.Heading.UnlockVoiceChat",
			descriptionKey = "Feature.VerificationUpsell.Description.UnlockVoiceChatBody",
			legalTextKey = "Feature.VerificationUpsell.Description.VoiceLegalDisclaimer2",
			buttonKey = if getFFlagInExperiencePhoneUpsellNewCopy() then "Feature.AccountSettings.Action.Verify" else "Feature.VerificationUpsell.Action.AddPhoneNumber",
			extraButtonConfig = {
				extraButtonKey = "Feature.VerificationUpsell.Action.NotNow"
			}
		},
		onSuccessBeforeToast = function() --[[ line: 1107 ]]
			-- upvalues: self (ref), var67 (copy), p69 (ref)
			self.coreVoiceManager:DisablePhoneVerificationUpsell()
			local var91 = "PostRequest"
			var67(function(...) --[[ line: 733 ]]
				-- upvalues: self (ref), var91 (ref)
				return self[var91](self, ...)
			end, p69, os.time(), false)
		end,
		onSuccess = function() --[[ line: 1111 ]]
			-- upvalues: self (ref), constantsModule (copy)
			if self.pendingConnectionSource == nil then
				self.pendingConnectionSource = constantsModule.VOICE_CONNECTION_SOURCE.IN_EXPERIENCE
			end
			self:EnableVoice()
		end,
		closeUpsell = function() --[[ line: 1117 ]]
			-- upvalues: p68 (ref), constantsModule (copy), self (ref), promptTypeModule (copy), var67 (copy), p69 (ref)
			if p68 ~= constantsModule.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE then
				self:showPrompt(promptTypeModule.VoiceConsentDeclinedToast)
			end
			local var92 = "PostRequest"
			var67(function(...) --[[ line: 733 ]]
				-- upvalues: self (ref), var92 (ref)
				return self[var92](self, ...)
			end, p69, os.time(), true)
		end
	})
end

function t:DisablePhoneVerificationUpsell() --[[ line: 1126 ]]
	self.coreVoiceManager:DisablePhoneVerificationUpsell()
end

function t:SetInExpUpsellEntrypoint(p70) --[[ line: 1130 ]]
	self.inExpUpsellEntrypoint = p70
end

function t:userAndPlaceCanUseVoice() --[[ line: 1134 ]]
	return self.coreVoiceManager:userAndPlaceCanUseVoice()
end

function t:verifyUniverseAndPlaceCanUseVoice() --[[ line: 1138 ]]
	return self.coreVoiceManager:verifyUniverseAndPlaceCanUseVoice()
end

function t:GetVoiceConnectCookieValue() --[[ line: 1142 ]]
	return self.coreVoiceManager:GetVoiceConnectCookieValue()
end

function t:GetVoiceConnectCookie() --[[ line: 1146 ]]
	return self.coreVoiceManager:GetVoiceConnectCookie()
end

function t:SetVoiceConnectCookieValue(p71) --[[ line: 1150 ]]
	return self.coreVoiceManager:SetVoiceConnectCookieValue(p71)
end

function t:GetVoiceRewarmCookie() --[[ line: 1154 ]]
	return self.coreVoiceManager:GetVoiceRewarmCookie()
end

function t:SetVoiceRewarmCookie(p72) --[[ line: 1158 ]]
	self.coreVoiceManager:SetVoiceRewarmCookie(p72)
end

function t:SetNewUserFTUXCookieValue(p73) --[[ line: 1162 ]]
	return self.coreVoiceManager:SetNewUserFTUXCookieValue(p73)
end

function t:ShowPlayerModeratedMessage(p74) --[[ line: 1166 ]]
	-- upvalues: getUserSettings (ref), analytics (ref), promptTypeModule (ref), BAN_REASON (ref), getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (ref), voiceNudgeUseNewDACopyModule (ref)
	local var93 = "GetRequest"
	local var94 = getUserSettings(function(...) --[[ line: 733 ]]
		-- upvalues: self (ref), var93 (ref)
		return self[var93](self, ...)
	end)
	
	if not var94 or not var94.isBanned then
		self:_reportJoinFailed("PlayerModeratedBadState", analytics.ERROR)
		
		return
	end
	self.banReason = var94.banReason
	
	if var94.bannedUntil == nil then
		self:showPrompt(promptTypeModule.VoiceChatSuspendedPermanent)
		
		return
	end
	self.bannedUntil = var94.bannedUntil
	
	if p74 then
		self:showPrompt(promptTypeModule.VoiceChatSuspendedTemporaryToast)
		
		return
	elseif self.banReason ~= BAN_REASON.NUDGE_V3 then
		self:showPrompt(promptTypeModule.VoiceChatSuspendedTemporary)
		
		return
	elseif getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and voiceNudgeUseNewDACopyModule() then
		self:showPrompt(promptTypeModule.VoiceChatSuspendedTemporaryBV2)
		
		return
	end
	self:showPrompt(promptTypeModule.VoiceChatSuspendedTemporaryB)
end

function t:CheckCallState() --[[ line: 1195 ]]
	return self.coreVoiceManager:CheckCallState()
end

function t:ShowVoiceChatLoadingMessage() --[[ line: 1199 ]]
	-- upvalues: promptTypeModule (ref)
	self:showPrompt(promptTypeModule.VoiceLoading)
end

function t:requestMicPermission() --[[ line: 1203 ]]
	return self.coreVoiceManager:requestMicPermission()
end

function t:canUseServiceAsync() --[[ line: 1207 ]]
	return self.coreVoiceManager:canUseServiceAsync()
end

function t:canUseService() --[[ line: 1212 ]]
	-- upvalues: httpRbxApiService (ref), httpService (ref), VOICE_CHAT_AVAILABILITY (ref)
	if self.available ~= nil or not game:GetEngineFeature("VoiceChatSupported") then
		return false
	end
	local ok, status = pcall(function() --[[ line: 1216 ]]
		-- upvalues: httpRbxApiService (copy), httpService (copy)
		return httpService:JSONDecode(httpRbxApiService:GetAsyncFullUrl("https://voice.roblox.com/v1/settings", Enum.ThrottlingPriority.Default, Enum.HttpRequestType.Players))
	end)
	local isVoiceEnabled = ok and status.isVoiceEnabled
	
	if not isVoiceEnabled then
		self.available = VOICE_CHAT_AVAILABILITY.UserNotAvailable
	end
	return isVoiceEnabled
end

function t:ensureInitialized(p75) --[[ line: 1232 ]]
	return self.coreVoiceManager:ensureInitialized(p75)
end

function t:GetSessionId() --[[ line: 1237 ]]
	return self.coreVoiceManager:GetSessionId()
end

function t:GetChannelId() --[[ line: 1241 ]]
	return self.coreVoiceManager:GetChannelId()
end

function t:JoinWithVoiceMuteData(p76) --[[ line: 1245 ]]
	return self.coreVoiceManager:JoinWithVoiceMuteData(p76)
end

function t.calculateBanDuration(_, p77, p78) --[[ line: 1249 ]]
	return math.ceil((p78 - p77) / 60)
end

function t:ShowVoiceUI() --[[ line: 1253 ]]
	-- upvalues: expChatModule (ref)
	self.voiceUIVisible = true
	self.showVoiceUI:Fire()
	
	if expChatModule.Events.VoiceUIVisibilityChanged then
		expChatModule.Events.VoiceUIVisibilityChanged(true)
	end
end

function t:HideVoiceUI() --[[ line: 1262 ]]
	-- upvalues: expChatModule (ref)
	self.voiceUIVisible = false
	self.hideVoiceUI:Fire()
	
	if expChatModule.Events.VoiceUIVisibilityChanged then
		expChatModule.Events.VoiceUIVisibilityChanged(false)
	end
end

function t:createPromptInstance(p79, p80) --[[ line: 1271 ]]
	-- upvalues: getFFlagEnableVoicePromptReasonTextModule (ref), promptTypeModule (ref), getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (ref), localizationService (ref), getFFlagShowDevicePermissionsModal (ref), fFlagEnableRetryForLinkingProtocolFetch (ref), fIntLinkingProtocolFetchRetries (ref), default_2 (ref), settingsRoute (ref), fIntLinkingProtocolFetchTimeoutMS (ref), roactModule (ref), voiceChatPromptModule (ref), analytics (ref), postInformedOfBan (ref), constantsModule (ref), disablePermissionPromptDeeplink (ref), getFFlagJoinWithoutMicPermissions (ref), voiceChatPermissionPromptUseMicrophoneRoute (ref), name (ref), coreGuiService (ref)
	if self.promptSignal then
		self.promptSignal:Destroy()
		self.promptSignal = nil
	end
	self.promptSignal = Instance.new("BindableEvent")
	local var96 = if getFFlagEnableVoicePromptReasonTextModule() then self.errorText else nil
	local var97 = p80 == promptTypeModule.VoiceChatSuspendedTemporaryB
	
	if getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() then
		var97 = var97 or p80 == promptTypeModule.VoiceChatSuspendedTemporaryBV2
	end
	local var98 = if self.bannedUntil ~= nil then if var97 then tostring(self:calculateBanDuration(DateTime.now().UnixTimestamp, self.bannedUntil.Seconds)) else DateTime.fromUnixTimestamp(self.bannedUntil.Seconds):FormatLocalTime("l LT", localizationService.RobloxLocaleId) else ""
	local var99 = if p80 ~= promptTypeModule.VoiceToxicityModal then if p80 ~= promptTypeModule.VoiceToxicityToast then getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and (if p80 ~= promptTypeModule.VoiceToxicityModalV2 then p80 == promptTypeModule.VoiceToxicityToastV2 else true) else true else true
	local var100 = if p80 ~= promptTypeModule.VoiceConsentModalV1 then if p80 ~= promptTypeModule.VoiceConsentModalV2 then p80 == promptTypeModule.VoiceConsentModalV3 else true else true
	local var101 = false
	local var102 = nil
	
	if getFFlagShowDevicePermissionsModal() and p80 == promptTypeModule.DevicePermissionsModal and self.settingsAppAvailable == nil then
		if fFlagEnableRetryForLinkingProtocolFetch then
			for _ = 0, fIntLinkingProtocolFetchRetries do
				local thread = task.spawn(function() --[[ line: 1320 ]]
					-- upvalues: var101 (write), var102 (write), default_2 (copy), settingsRoute (copy)
					local var106, var107 = default_2:supportsSwitchToSettingsApp(settingsRoute.Microphone):await()
					var101 = var106
					var102 = var107
				end)
				task.wait(fIntLinkingProtocolFetchTimeoutMS / 1000)
				task.cancel(thread)
				
				if var102 == nil then
					continue
				end
			end
		else
			local var104, var105 = default_2:supportsSwitchToSettingsApp(settingsRoute.Microphone):await()
			var101 = var104
			var102 = var105
		end
		self.settingsAppAvailable = var101 and var102
	end
	self.voiceChatPromptInstance = roactModule.mount(roactModule.createElement(voiceChatPromptModule, {
		Analytics = analytics.new(),
		promptSignal = self.promptSignal.Event,
		bannedUntil = var98,
		policyMapper = self.policyMapper,
		errorText = var96,
		onReadyForSignal = p79,
		VoiceChatServiceManager = self,
		settingsAppAvailable = if self.settingsAppAvailable == nil then false else self.settingsAppAvailable,
		onContinueFunc = if p80 == promptTypeModule.VoiceChatSuspendedTemporary or var97 then function() --[[ line: 1353 ]]
			-- upvalues: postInformedOfBan (copy), self (ref)
			local var108 = "PostRequest"
			postInformedOfBan(function(...) --[[ line: 733 ]]
				-- upvalues: self (ref), var108 (ref)
				return self[var108](self, ...)
			end, true)
		end elseif var99 then function() --[[ line: 1356 ]]
			-- upvalues: self (ref)
			self.Analytics:reportClosedNudge(self:GetNudgeAnalyticsData())
		end elseif var100 then function() --[[ line: 1359 ]]
			-- upvalues: self (ref), constantsModule (copy)
			self:RecordUserSeenModal(constantsModule.MODAL_IDS.IN_EXP_UPSELL)
		end else nil,
		onPrimaryActivated = if var99 then function() --[[ line: 1364 ]]
			-- upvalues: self (ref)
			self.Analytics:reportAcknowledgedNudge(self:GetNudgeAnalyticsData())
		end elseif not disablePermissionPromptDeeplink and getFFlagJoinWithoutMicPermissions() and p80 == promptTypeModule.Permission then if getFFlagJoinWithoutMicPermissions() and getFFlagShowDevicePermissionsModal() and p80 == promptTypeModule.DevicePermissionsModal then function() --[[ line: 1395 ]]
			-- upvalues: name (copy), self (ref), default_2 (copy), settingsRoute (copy)
			name:debug("Settings app available: {}", self.settingsAppAvailable)
			self.Analytics:reportDevicePermissionsModalEvent(if self.settingsAppAvailable then "OpenedSettings" else "Acknowledged", self:GetSessionId(), self:GetInExpUpsellAnalyticsData())
			
			if self.settingsAppAvailable then
				name:debug("Switching to settings app")
				default_2:switchToSettingsApp(settingsRoute.Microphone):andThen(function() --[[ line: 1406 ]]
					-- upvalues: name (copy)
					name:debug("Successfully switched to settings app")
				end):catch(function() --[[ line: 1409 ]]
					-- upvalues: name (copy)
					name:error("Error switching to settings app")
				end)
				
				return
			end
			name:debug("Current platform does not support switching to settings app")
		end elseif var97 then function() --[[ line: 1416 ]]
			-- upvalues: self (ref)
			self:reportBanMessage("Understood")
			self.Analytics:reportBanMessageEvent("Understood")
		end elseif var100 then function() --[[ line: 1420 ]]
			-- upvalues: self (ref), constantsModule (copy)
			self.Analytics:reportInExpConsent("accepted", self.inExpUpsellEntrypoint, self:GetInExpUpsellAnalyticsData())
			
			if self.pendingConnectionSource == nil then
				self.pendingConnectionSource = constantsModule.VOICE_CONNECTION_SOURCE.IN_EXPERIENCE
			end
			self:EnableVoice()
		end else nil else function() --[[ line: 1371 ]]
			-- upvalues: voiceChatPermissionPromptUseMicrophoneRoute (copy), settingsRoute (copy), default_2 (copy), name (copy)
			local var109 = if voiceChatPermissionPromptUseMicrophoneRoute then settingsRoute.Microphone else nil
			local var110 = default_2:supportsSwitchToSettingsApp(var109):await()
			name:debug("Settings app available: {}", var110)
			
			if var110 then
				name:debug("Switching to settings app")
				default_2:switchToSettingsApp(var109):andThen(function() --[[ line: 1381 ]]
					-- upvalues: name (copy)
					name:debug("Successfully switched to settings app")
				end):catch(function() --[[ line: 1384 ]]
					-- upvalues: name (copy)
					name:error("Error switching to settings app")
				end)
				
				return
			end
			name:debug("Current platform does not support switching to settings app")
		end,
		onSecondaryActivated = if p80 == promptTypeModule.VoiceToxicityModal or getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and p80 == promptTypeModule.VoiceToxicityModalV2 then function() --[[ line: 1433 ]]
			-- upvalues: self (ref)
			self:ShowVoiceToxicityFeedbackToast()
			self.Analytics:reportDeniedNudge(self:GetNudgeAnalyticsData())
		end elseif var99 then function() --[[ line: 1437 ]]
			-- upvalues: self (ref)
			self.Analytics:reportDeniedNudge(self:GetNudgeAnalyticsData())
		end elseif var97 then function() --[[ line: 1440 ]]
			-- upvalues: self (ref)
			self:ShowVoiceToxicityFeedbackToast()
			self:reportBanMessage("Denied")
			self.Analytics:reportBanMessageEvent("Denied")
		end elseif var100 then function() --[[ line: 1445 ]]
			-- upvalues: self (ref), constantsModule (copy), promptTypeModule (copy)
			self.Analytics:reportInExpConsent("denied", self.inExpUpsellEntrypoint, self:GetInExpUpsellAnalyticsData())
			
			if self.inExpUpsellEntrypoint ~= constantsModule.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE then
				self:showPrompt(promptTypeModule.VoiceConsentDeclinedToast)
			end
		end elseif p80 == promptTypeModule.DevicePermissionsModal then function() --[[ line: 1455 ]]
			-- upvalues: self (ref)
			self.Analytics:reportDevicePermissionsModalEvent("Denied", self:GetSessionId(), self:GetInExpUpsellAnalyticsData())
		end else nil
	}), coreGuiService, "RobloxVoiceChatPromptGui")
end

function t:showPrompt(p81, p82) --[[ line: 1469 ]]
	-- upvalues: getFFlagEnableVoicePromptReasonTextModule (ref), name (ref)
	if getFFlagEnableVoicePromptReasonTextModule() then
		self.errorText = p82 or nil
	end
	self:createPromptInstance(function() --[[ line: 1473 ]]
		-- upvalues: name (copy), p81 (ref), self (ref)
		name:debug("Show Prompt: {}", p81)
		self.promptSignal:fire(p81)
	end, p81)
end

function t:showJoinVoicePrompt() --[[ line: 1479 ]]
	-- upvalues: promptTypeModule (ref), appStorageService (ref), constantsModule (ref)
	self:showPrompt(promptTypeModule.UnifiedJoinVoiceToast)
	pcall(function() --[[ line: 1481 ]]
		-- upvalues: appStorageService (copy), constantsModule (copy)
		appStorageService:SetItem(constantsModule.VOICE_WITH_TC_TOAST_KEY, "true")
		appStorageService:Flush()
	end)
end

function t:CheckAndShowPermissionPrompt() --[[ line: 1487 ]]
	-- upvalues: permissionsProtocol (ref), promptTypeModule (ref), promiseModule (ref), getFFlagEnableUniveralVoiceToastsModule (ref)
	local function showPrompt() --[[ line: 1488 ]]
		-- upvalues: self (ref), permissionsProtocol (copy), promptTypeModule (copy), promiseModule (copy)
		return if self.voiceEnabled or self.userEligible then self.PermissionsService:hasPermissions({ permissionsProtocol.Permissions.MICROPHONE_ACCESS }):andThen(function(p83) --[[ line: 1495 ]]
			-- upvalues: permissionsProtocol (copy), self (copy), promptTypeModule (copy)
			if p83 and p83.status == permissionsProtocol.Status.DENIED then
				self:showPrompt(promptTypeModule.Permission)
			end
		end) else promiseModule.resolve()
	end
	
	return if getFFlagEnableUniveralVoiceToastsModule() then showPrompt() else self:asyncInit():andThen(function() --[[ line: 1507 ]] end):catch(function() --[[ line: 1507 ]]
		-- upvalues: showPrompt (ref)
		return showPrompt()
	end)
end

function t:showDataConsentToast() --[[ line: 1513 ]]
	-- upvalues: getFFlagSeamlessVoiceConsentToastPolicy (ref), universalAppPolicyModule (ref), seamlessVoiceStatusModule (ref), constantsModule (ref), promptTypeModule (ref)
	local var114, showDataConsentToast
	local var112 = self:FetchAgeVerificationOverlay()
	local _ = nil
	local _ = nil
	local var113 = if getFFlagSeamlessVoiceConsentToastPolicy() then universalAppPolicyModule.getAppFeaturePolicies().getDisplayCheckboxInVoiceConsent() or false else false
	
	if type(var112) == "table" then
		var114 = if var112.voiceSettings then var112.voiceSettings.seamlessVoiceStatus else seamlessVoiceStatusModule.Invalid
		showDataConsentToast = var112.showDataConsentToast
	else
		showDataConsentToast = false
		var114 = seamlessVoiceStatusModule.Invalid
	end
	if showDataConsentToast and var113 then
		showDataConsentToast = type(self:_GetShowAgeVerificationOverlay()) == "table" and self:_GetShowAgeVerificationOverlay().showDataConsentToast
	end
	if var114 == seamlessVoiceStatusModule.EnabledExistingUser and showDataConsentToast and var113 then
		self:RecordUserSeenModal(constantsModule.MODAL_IDS.DATA_CONSENT_TOAST)
		
		return self:showPrompt(promptTypeModule.VoiceDataConsentOptOutToast)
	end
end

function t:CheckAndShowNotAudiblePrompt() --[[ line: 1547 ]]
	-- upvalues: promptTypeModule (ref), promiseModule (ref)
	return if game:GetEngineFeature("VoiceChatSupported") then self:asyncInit():andThen(function() --[[ line: 1550 ]]
		-- upvalues: self (ref), promptTypeModule (copy)
		if UserSettings().GameSettings.MasterVolume == 0 then
			self:showPrompt(promptTypeModule.NotAudible)
		end
	end):catch(function() --[[ line: 1556 ]] end) else promiseModule.resolve()
end

function t:ShowNotAudiblePromptVoiceChatVolume() --[[ line: 1562 ]]
	-- upvalues: fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule (ref), fFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule (ref), promiseModule (ref), voiceVolumeControlsEligibility (ref), voiceChatService (ref), promptTypeModule (ref)
	return if not (not fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule or not fFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule) then if game:GetEngineFeature("VoiceChatSupported") then self:asyncInit():andThen(function() --[[ line: 1572 ]]
		-- upvalues: voiceVolumeControlsEligibility (copy), voiceChatService (copy), self (ref), promptTypeModule (copy)
		if UserSettings().GameSettings.MasterVolume > 0 and voiceVolumeControlsEligibility.isVoiceChatVolumeSliderVisible(true, voiceChatService.UseNewAudioApi) and UserSettings().GameSettings.VoiceChatVolume == 0 then
			self:showPrompt(promptTypeModule.NotAudibleVoiceChatVolume)
		end
	end):catch(function() --[[ line: 1580 ]] end) else promiseModule.resolve() else promiseModule.resolve()
end

function t:InitialJoinFailedPrompt() --[[ line: 1585 ]]
	-- upvalues: name (ref), getFFlagVoiceChatClientRewriteMasterLua (ref), promptTypeModule (ref)
	name:debug("JoinByGroupIdToken returns false")
	
	if not getFFlagVoiceChatClientRewriteMasterLua then
		self:showPrompt(promptTypeModule.Retry)
	end
end

function t:ShowVoiceToxicityFeedbackToast() --[[ line: 1592 ]]
	-- upvalues: name (ref), promptTypeModule (ref)
	name:debug("Sending feedback toast")
	self:showPrompt(promptTypeModule.VoiceToxicityFeedbackToast)
end

function t:GetNudgeAnalyticsData() --[[ line: 1597 ]]
	-- upvalues: playersService (ref)
	return playersService.LocalPlayer.UserId, self:GetSessionId()
end

function t.GetInExpUpsellAnalyticsData(_) --[[ line: 1601 ]]
	-- upvalues: rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref), rbxAnalyticsService (ref)
	return game.GameId, game.PlaceId, if rbxAnalyticsServiceExposePlaySessionIdEngineFeature then rbxAnalyticsService:GetPlaySessionId() else ""
end

function t:reportBanMessage(p84) --[[ line: 1609 ]]
	-- upvalues: playersService (ref)
	self.Analytics:reportBanMessageEventV2(p84, self.banReason, playersService.LocalPlayer.UserId, if self.service then self.previousSessionId else "")
end

function t:reportJoinVoiceUpsellEvent(p85, p86, p87) --[[ line: 1618 ]]
	-- upvalues: rbxAnalyticsService (ref), fFlagVoiceRewarmTelemetry (ref)
	local playSessionId = rbxAnalyticsService:GetPlaySessionId()
	
	if fFlagVoiceRewarmTelemetry then
		self.Analytics:reportJoinVoiceUpsellEvent(p85, playSessionId, self:UserVoiceEnabled(), p86, p87)
		
		return
	end
	self.Analytics:reportJoinVoiceUpsellEvent(p85, playSessionId, self:UserVoiceEnabled())
end

function t:SetAndSyncActive(p88, p89) --[[ line: 1637 ]]
	self.coreVoiceManager:SetAndSyncActive(p88, p89)
end

function t:CreateAudioDeviceData(p90) --[[ line: 1641 ]]
	return self.coreVoiceManager:CreateAudioDeviceData(p90)
end

function t:onInstanceAdded(p91) --[[ line: 1645 ]]
	return self.coreVoiceManager:onInstanceAdded(p91)
end

function t:UpdateAudioDeviceInputDebugger() --[[ line: 1649 ]]
	-- upvalues: fFlagDebugShowAudioDeviceInputDebugger (ref), name (ref), roactModule (ref), audioDeviceInputDebuggerModule (ref), coreGuiService (ref)
	if fFlagDebugShowAudioDeviceInputDebugger then
		if self.voiceDebuggerInstance then
			roactModule.update(self.voiceDebuggerInstance, roactModule.createElement(audioDeviceInputDebuggerModule, {
				instances = self.audioDevices,
				mutedPlayers = self.mutedPlayers
			}))
		else
			name:debug("Mounting AudioDeviceInput Debugger")
			self.voiceDebuggerInstance = roactModule.mount(roactModule.createElement(audioDeviceInputDebuggerModule, {
				instances = self.audioDevices,
				mutedPlayers = self.mutedPlayers
			}), coreGuiService, "RobloxVoiceChatPromptGui")
			
			return
		end
	end
end

function t:AddReverseNudgeToxicUser(p92, p93, p94) --[[ line: 1673 ]]
	-- upvalues: getFIntVoiceReverseNudgeUXDisplayTimeSecondsModule (ref)
	p93(p92, "iconColorChange")
	local var116 = self.reverseNudgeToxicUserRemovalCallbacks[p92]
	
	if var116 ~= nil then
		task.cancel(var116)
	end
	self.reverseNudgeToxicUserRemovalCallbacks[p92] = task.delay(getFIntVoiceReverseNudgeUXDisplayTimeSecondsModule(), function() --[[ line: 1687 ]]
		-- upvalues: p94 (ref), p92 (ref), self (ref)
		p94(p92)
		self.reverseNudgeToxicUserRemovalCallbacks[p92] = nil
	end)
end

function t:onInstanceRemove(p95) --[[ line: 1694 ]]
	return self.coreVoiceManager:onInstanceRemove(p95)
end

function t:hookupAudioDeviceInputListener() --[[ line: 1698 ]]
	return self.coreVoiceManager:hookupAudioDeviceInputListener()
end

function t:ToggleMutePlayer(p96, p97) --[[ line: 1702 ]]
	return self.coreVoiceManager:ToggleMutePlayer(p96, p97)
end

function t:MuteAll(p98, p99) --[[ line: 1706 ]]
	return self.coreVoiceManager:MuteAll(p98, p99)
end

function t:ToggleMuteSome(p100, p101, p102, p103) --[[ line: 1710 ]]
	return self.coreVoiceManager:ToggleMuteSome(p100, p101, p102, p103)
end

function t:FireMuteNonFriendsEvent() --[[ line: 1719 ]]
	self.mutedNonFriends:Fire()
end

function t:EnsureCorrectMuteState(p104, p105) --[[ line: 1723 ]]
	-- upvalues: voiceChatService (ref), enableMutedByLocalUserEngineFeature (ref), playersService (ref)
	local t = {}
	
	for i, v in p104 do
		local var118 = self.participants[tostring(v)]
		
		if var118 and var118.isMutedLocally ~= p105 then
			if voiceChatService.UseNewAudioApi then
				t[v] = true
				self.mutedPlayers[v] = p105
			else
				self.service:SubscribePause(v, p105)
			end
			var118.isMutedLocally = p105
			self.participantsUpdate:Fire(self.participants)
		end
	end
	if voiceChatService.UseNewAudioApi then
		for i_1 in self.audioDevices do
			if i_1.Player and t[i_1.Player.UserId] then
				if enableMutedByLocalUserEngineFeature and i_1.Player ~= playersService.LocalPlayer then
					i_1.MutedByLocalUser = p105
				else
					i_1.Active = not p105
				end
			end
		end
	end
end

function t:FireUserAgencySelectedEvent(p106) --[[ line: 1755 ]]
	self.userAgencySelected:Fire(p106)
end

function t.ParticipantStateToIcon(_, p107, p108) --[[ line: 1759 ]]
	-- upvalues: VOICE_STATE (ref)
	local INACTIVE = VOICE_STATE.INACTIVE
	
	if not p107.subscriptionCompleted then
		INACTIVE = VOICE_STATE.CONNECTING
	elseif p107.isMutedLocally then
		INACTIVE = VOICE_STATE.LOCAL_MUTED
	elseif p107.isMuted then
		INACTIVE = VOICE_STATE.MUTED
	elseif p107.isSignalActive then
		INACTIVE = VOICE_STATE.TALKING
	end
	return getIcon(INACTIVE, p108)
end

function t.VoiceStateToIcon(_, p109, p110, p111) --[[ line: 1774 ]]
	return getIcon(p109, p110, p111)
end

function t.GetIcon(_, p112, p113) --[[ line: 1778 ]]
	return getIconSrc(p112, p113)
end

function t:JoinVoice(p114) --[[ line: 1782 ]]
	-- upvalues: fFlagVoiceRewarmTelemetry (ref), showJoinVoiceWhenDisconnectedV3 (ref), name (ref), guardVoiceInExpUpsellVariant (ref), constantsModule (ref), getFFlagEnableConnectDisconnectInSettingsAndChromeModule (ref), getFFlagEnableVoiceTrustedConnectionsToastsModule (ref), getFFlagUpdateVoiceConnectionToastsModule (ref), promptTypeModule (ref), getFFlagNonVoiceFTUX (ref), appStorageService (ref), getFFlagEnableVrVoiceParity (ref), promiseModule (ref), seamlessVoiceV2JoinVoiceToast (ref), enableVerifiedCheckViaOverlay (ref), getFFlagDisableConsentModalForExistingUsersModule (ref), getFFlagIntegratePhoneUpsellJoinVoice (ref), getFFlagEnableInExpPhoneVoiceUpsellEntrypoints (ref), getOverlayStore (ref), overlayTypes (ref), socialUpsellType (ref), enum (ref), sendUserConnectionStatus (ref)
	local joinVoiceButtonContext = nil
	local var119 = nil
	
	if fFlagVoiceRewarmTelemetry then
		joinVoiceButtonContext = self.joinVoiceButtonContext
		self.joinVoiceButtonContext = nil
	end
	if showJoinVoiceWhenDisconnectedV3 then
		name:debug("Consuming voice re-warm cookie on JoinVoice")
		self:SetVoiceRewarmCookie("true")
	end
	local var120 = self:FetchAgeVerificationOverlay()
	local var121 = (if guardVoiceInExpUpsellVariant then if type(var120) == "table" then var120.showVoiceInExperienceUpsellVariant else nil else var120.showVoiceInExperienceUpsellVariant) or constantsModule.IN_EXP_UPSELL_VARIANT.VARIANT3
	
	if not fFlagVoiceRewarmTelemetry then
		self.Analytics:reportJoinVoiceButtonEvent("clicked", self:GetInExpUpsellAnalyticsData())
	end
	if getFFlagEnableConnectDisconnectInSettingsAndChromeModule() and self.previousGroupId then
		if fFlagVoiceRewarmTelemetry then
			var119 = "RejoinPreviousChannel"
		end
		self:RejoinPreviousChannel()
		
		if getFFlagEnableVoiceTrustedConnectionsToastsModule() then
			self:showJoinVoicePrompt()
		elseif getFFlagUpdateVoiceConnectionToastsModule() then
			self:showPrompt(promptTypeModule.UnifiedJoinVoiceToast)
		else
			self:showPrompt(promptTypeModule.JoinVoice)
		end
		self:ShowVoiceUI()
		self:SetVoiceConnectCookieValue(true)
	elseif getFFlagNonVoiceFTUX() and self.isShowingFTUX then
		if fFlagVoiceRewarmTelemetry then
			var119 = "ExitFtux"
		end
		self:HideFTUX(appStorageService)
	elseif self.deniedMicPermissions then
		if fFlagVoiceRewarmTelemetry then
			var119 = "MicPermissionPrompt"
		end
		if getFFlagEnableVrVoiceParity() then
			self:CheckAndShowPermissionPrompt()
		else
			self:CheckAndShowPermissionPrompt():finallyReturn(promiseModule.reject())
		end
	elseif getFFlagEnableConnectDisconnectInSettingsAndChromeModule() and self:UserVoiceEnabled() then
		if fFlagVoiceRewarmTelemetry then
			var119 = "FirstJoinSession"
		end
		if seamlessVoiceV2JoinVoiceToast then
			self.isInitialJoin = true
		end
		self.attemptVoiceRejoin:Fire()
		
		if self:IsNewSeamlessVoiceUserDisconnect() then
			self:SetVoiceConnectCookieValue(true)
			self:SetNewUserFTUXCookieValue(true)
		end
	elseif enableVerifiedCheckViaOverlay and self:UserOnlyEligibleForVoiceViaOverlay() or self:UserOnlyEligibleForVoice() then
		if fFlagVoiceRewarmTelemetry then
			var119 = "ConsentModal"
		end
		if getFFlagDisableConsentModalForExistingUsersModule() and self:IsSeamlessVoice() then
			self:EnableVoice()
		else
			self:SetInExpUpsellEntrypoint(constantsModule.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE)
			self:showPrompt(self:GetInExpUpsellPromptFromEnum(var121))
		end
	elseif self:EligibleForAgeCheckToast() then
		if fFlagVoiceRewarmTelemetry then
			var119 = "AgeCheckToast"
		end
		self:showPrompt(promptTypeModule.AgeCheckForVoiceToast)
	elseif getFFlagIntegratePhoneUpsellJoinVoice() and getFFlagEnableInExpPhoneVoiceUpsellEntrypoints() and (not self:UserVoiceEnabled() and self:FetchPhoneVerificationUpsell(constantsModule.IN_EXP_PHONE_UPSELL_IXP_LAYER) == constantsModule.PHONE_UPSELL_VALUE_PROP.VoiceChat) then
		if fFlagVoiceRewarmTelemetry then
			var119 = "PhoneUpsell"
		end
		if p114 then
			p114:SetVisibility(false, true)
		end
		self:ShowInExperiencePhoneVoiceUpsell(constantsModule.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE, constantsModule.IN_EXP_PHONE_UPSELL_IXP_LAYER)
	elseif self:EligibleForFaeUpsell() then
		if fFlagVoiceRewarmTelemetry then
			var119 = "FaeUpsell"
		end
		if self.pendingConnectionSource == nil then
			self.pendingConnectionSource = constantsModule.VOICE_CONNECTION_SOURCE.IN_EXPERIENCE
		end
		self.coreVoiceManager:OptUserToJoinVoice()
		local var122 = getOverlayStore(false)
		
		if not fFlagVoiceRewarmTelemetry then
			self:reportJoinVoiceUpsellEvent("Click")
		end
		var122.setCurrentOverlay(overlayTypes.SocialUpsell, {
			upsellType = socialUpsellType.FacialAgeEstimation,
			data = {
				isInExperience = true,
				countDownBadgeText = nil,
				isPhase2 = true,
				upsellEntrySurface = enum.UpsellEntrySurfaceType.InExperienceVoiceChatIcon,
				upsellEntryComponent = enum.UpsellComponent.Modal,
				upsellPurpose = enum.UpsellStage.Fae
			}
		})
	end
	if fFlagVoiceRewarmTelemetry then
		local inExpUpsellAnalyticsData, inExpUpsellAnalyticsData_1, inExpUpsellAnalyticsData_2 = self:GetInExpUpsellAnalyticsData()
		self.Analytics:reportJoinVoiceButtonEvent("clicked", inExpUpsellAnalyticsData, inExpUpsellAnalyticsData_1, inExpUpsellAnalyticsData_2, joinVoiceButtonContext, var119)
		self:reportJoinVoiceUpsellEvent("Click", joinVoiceButtonContext, var119)
	end
	if sendUserConnectionStatus and self:IsSeamlessVoice() then
		task.spawn(function() --[[ line: 1924 ]]
			-- upvalues: self (ref)
			self.coreVoiceManager:PostUserVoiceConnectionStatus(true)
		end)
	end
end

function t:EligibleForFaeUpsell() --[[ line: 1930 ]]
	-- upvalues: getFFlagEnableVoiceUxUpdates (ref), fFlagTestDeviceForFAEUpsell (ref), deviceMeetsRequirementsForFAE (ref)
	local var126 = getFFlagEnableVoiceUxUpdates()
	
	if var126 then
		var126 = self.coreVoiceManager:EligibleForFaeUpsell()
		
		if var126 then
			var126 = self.AvatarChatService:deviceMeetsRequirementsForFeature(Enum.DeviceFeatureType.InExperienceFAE)
			
			if var126 then
				if fFlagTestDeviceForFAEUpsell then
					return deviceMeetsRequirementsForFAE()
				end
				var126 = true
			end
		end
	end
	return var126
end

function t:EligibleForAgeCheckToast() --[[ line: 1937 ]]
	return self.coreVoiceManager:EligibleForAgeCheckToast()
end

function t:ShouldShowJoinVoice() --[[ line: 1942 ]]
	-- upvalues: getFFlagEnableVoiceUxUpdates (ref), fFlagVoiceRewarmTelemetry (ref), voiceChatCoreModule (ref), showJoinVoiceWhenDisconnectedV3 (ref), getFFlagOnlyEnableJoinVoiceInVoiceEnabledUniversesModule (ref), getFFlagEnableConnectDisconnectInSettingsAndChromeModule (ref), getFFlagIntegratePhoneUpsellJoinVoice (ref), getFFlagEnableInExpPhoneVoiceUpsellEntrypoints (ref), constantsModule (ref)
	if getFFlagEnableVoiceUxUpdates() then
		if fFlagVoiceRewarmTelemetry then
			if self:EligibleForFaeUpsell() then
				self.joinVoiceButtonContext = "FaeUpsell"
				
				return true
			elseif self:HasSeamlessVoiceFeature(voiceChatCoreModule.Constants.SeamlessVoiceFeatures.InitialJoinVoice) and self:GetVoiceConnectCookie() == "" then
				self.joinVoiceButtonContext = "VoiceFtux"
				
				return true
			elseif showJoinVoiceWhenDisconnectedV3 and self:GetVoiceRewarmCookie() == "" and (self:GetVoiceConnectCookie() == "false" and self:UserVoiceEnabled()) then
				self.joinVoiceButtonContext = "Rewarm"
				
				return true
			elseif self:EligibleForAgeCheckToast() then
				return true
			end
			local var127 = self:UserOnlyEligibleForVoice() or self:UserVoiceEnabled()
			
			return if getFFlagIntegratePhoneUpsellJoinVoice() and getFFlagEnableInExpPhoneVoiceUpsellEntrypoints() and (not var127 and not self:UserVoiceEnabled()) and self:FetchPhoneVerificationUpsell(constantsModule.IN_EXP_PHONE_UPSELL_IXP_LAYER) == constantsModule.PHONE_UPSELL_VALUE_PROP.VoiceChat then true else self:UserInInExperienceUpsellTreatment() and var127
		elseif self:EligibleForFaeUpsell() or self:HasSeamlessVoiceFeature(voiceChatCoreModule.Constants.SeamlessVoiceFeatures.InitialJoinVoice) and self:GetVoiceConnectCookie() == "" or showJoinVoiceWhenDisconnectedV3 and self:GetVoiceRewarmCookie() == "" and self:VoiceChatEnded() then
			return true
		end
	elseif getFFlagOnlyEnableJoinVoiceInVoiceEnabledUniversesModule() then
		if getFFlagEnableConnectDisconnectInSettingsAndChromeModule() and self:IsSeamlessVoice() and self:verifyUniverseAndPlaceCanUseVoice() then
			return not self.voiceUIVisible
		end
	elseif getFFlagEnableConnectDisconnectInSettingsAndChromeModule() and self:IsSeamlessVoice() then
		return not self.voiceUIVisible
	end
end

function t:ShouldShowJoinVoiceOnDisconnect() --[[ line: 2021 ]]
	return self.coreVoiceManager:ShouldShowJoinVoiceOnDisconnect()
end

function t:IsSeamlessVoice() --[[ line: 2025 ]]
	-- upvalues: getFFlagCheckUniversePlaceBeforeSuspending (ref), name (ref), seamlessVoiceStatusModule (ref)
	if getFFlagCheckUniversePlaceBeforeSuspending() then
		return self.coreVoiceManager:IsSeamlessVoice()
	end
	local var128 = self:FetchAgeVerificationOverlay()
	
	if not var128 or not var128.voiceSettings then
		name:error("VoiceChatServiceManager:IsSeamlessVoice() - ageVerificationOverlayData or voiceSettings is nil")
		
		return false
	end
	local seamlessVoiceStatus = var128.voiceSettings.seamlessVoiceStatus
	
	return if seamlessVoiceStatus ~= seamlessVoiceStatusModule.EnabledExistingUser then seamlessVoiceStatus == seamlessVoiceStatusModule.EnabledNewUser else true
end

function t:HasSeamlessVoiceFeature(p115) --[[ line: 2041 ]]
	return self.coreVoiceManager:HasSeamlessVoiceFeature(p115)
end

function t:IsNewSeamlessVoiceUserDisconnect() --[[ line: 2045 ]]
	return self.coreVoiceManager:IsNewSeamlessVoiceUserDisconnect()
end

function t:GetConnectDisconnectButtonAnalyticsData(p116) --[[ line: 2049 ]]
	-- upvalues: rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref), rbxAnalyticsService (ref)
	local list = {
		game.GameId,
		game.PlaceId,
		if rbxAnalyticsServiceExposePlaySessionIdEngineFeature then rbxAnalyticsService:GetPlaySessionId() else ""
	}
	
	if p116 and self:getService() then
		table.insert(list, self:GetSessionId())
	end
	return unpack(list)
end

function t:GetConnectDisconnectAnalyticsData() --[[ line: 2061 ]]
	-- upvalues: rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref), rbxAnalyticsService (ref), getFFlagNonVoiceFTUX (ref), default (ref)
	local t = {
		universeId = game.GameId,
		placeId = game.PlaceId,
		playSessionId = if rbxAnalyticsServiceExposePlaySessionIdEngineFeature then rbxAnalyticsService:GetPlaySessionId() else ""
	}
	
	if getFFlagNonVoiceFTUX() then
		t.voiceSessionId = if self.service then self:GetSessionId() else ""
	else
		t.voiceSessionId = self:GetSessionId()
	end
	t.durationTimestamp = default:getTimestamp()
	
	return t
end

function t:Leave() --[[ line: 2081 ]]
	-- upvalues: getFFlagDisconnectToastClientRewrite (ref), getFFlagEnableConnectDisconnectInSettingsAndChromeModule (ref), getFFlagVoiceChatClientRewriteMasterLua (ref), sendUserConnectionStatus (ref)
	self:ensureInitialized("leave")
	
	if getFFlagDisconnectToastClientRewrite() and getFFlagEnableConnectDisconnectInSettingsAndChromeModule() then
		self:SetVoiceConnectCookieValue(false)
	end
	self.Analytics:reportConnectDisconnectEvents("voiceDisconnectEvent", self:GetConnectDisconnectAnalyticsData())
	local groupId = self.service:GetGroupId()
	local var132 = self.service:IsPublishPaused()
	
	if getFFlagVoiceChatClientRewriteMasterLua() then
		local voiceChatService = game:GetService("VoiceChatService")
		
		if voiceChatService then
			voiceChatService:leaveVoice()
		end
	else
		self.service:Leave()
	end
	self:HideVoiceUI()
	self.previousGroupId = groupId
	self.previousMutedState = var132
	
	if not getFFlagDisconnectToastClientRewrite() and getFFlagEnableConnectDisconnectInSettingsAndChromeModule() then
		self:SetVoiceConnectCookieValue(false)
	end
	if sendUserConnectionStatus and self:IsSeamlessVoice() then
		task.spawn(function() --[[ line: 2104 ]]
			-- upvalues: self (ref)
			self.coreVoiceManager:PostUserVoiceConnectionStatus(false)
		end)
	end
end

function t.GetVoiceStateFromEnum(_, p117) --[[ line: 2110 ]]
	-- upvalues: t_1 (write), VOICE_STATE (ref)
	if not t_1[p117] then
		t_1 = {
			[Enum.VoiceChatState.Idle] = VOICE_STATE.HIDDEN,
			[Enum.VoiceChatState.Joining] = VOICE_STATE.CONNECTING,
			[Enum.VoiceChatState.JoiningRetry] = VOICE_STATE.CONNECTING,
			[Enum.VoiceChatState.Joined] = VOICE_STATE.MUTED,
			[Enum.VoiceChatState.Leaving] = VOICE_STATE.MUTED,
			[Enum.VoiceChatState.Ended] = VOICE_STATE.HIDDEN,
			[Enum.VoiceChatState.Failed] = VOICE_STATE.ERROR
		}
	end
	return t_1[p117]
end

function t.GetInExpUpsellPromptFromEnum(_, p118) --[[ line: 2130 ]]
	-- upvalues: t_2 (ref)
	return t_2[p118]
end

function t:getRecentUsersInteractionData() --[[ line: 2135 ]]
	return self.coreVoiceManager:getRecentUsersInteractionData()
end

function t:_setRecentUserState(p119, p120) --[[ line: 2139 ]]
	return self.coreVoiceManager:_setRecentUserState(p119, p120)
end

function t:_updateRecentUsersInteractionData() --[[ line: 2143 ]]
	return self.coreVoiceManager:_updateRecentUsersInteractionData()
end

function t:SetupParticipantListeners() --[[ line: 2147 ]]
	return self.coreVoiceManager:SetupParticipantListeners()
end

function t:Disconnect() --[[ line: 2151 ]]
	self.coreVoiceManager:Disconnect()
	self.coreVoiceManager:unsubscribeAll()
end

function t:GetSendMuteEvent() --[[ line: 2156 ]]
	return self.coreVoiceManager:GetSendMuteEvent()
end

function t:ToggleMic(p121) --[[ line: 2161 ]]
	return self.coreVoiceManager:ToggleMic(p121)
end

function t:SubscribeRetry(p122) --[[ line: 2165 ]]
	-- upvalues: name (ref)
	self:ensureInitialized("subscribe retry")
	name:debug("Attempting to retry connection to user: {}", "..." .. string.sub(tostring(p122), -4))
	self.service:SubscribeRetry(p122)
end

function t:JoinByGroupIdToken(p123, p124) --[[ line: 2171 ]]
	return self.coreVoiceManager:JoinByGroupIdToken(p123, p124)
end

function t:RejoinPreviousChannel() --[[ line: 2175 ]]
	-- upvalues: name (ref), getFFlagVoiceChatClientRewriteMasterLua (ref)
	local previousGroupId = self.previousGroupId
	local previousMutedState = self.previousMutedState
	name:debug("Rejoining previous channel {} with mute status {}", previousGroupId, previousMutedState)
	pcall(function() --[[ line: 2180 ]]
		-- upvalues: getFFlagVoiceChatClientRewriteMasterLua (copy), self (ref), previousGroupId (ref), previousMutedState (ref)
		if getFFlagVoiceChatClientRewriteMasterLua() then
			self.coreVoiceManager:RejoinVoice()
			local connectDisconnectAnalyticsData = self:GetConnectDisconnectAnalyticsData()
			connectDisconnectAnalyticsData.connectionSource = self.pendingConnectionSource
			self.pendingConnectionSource = nil
			self.Analytics:reportConnectDisconnectEvents("voiceConnectEvent", connectDisconnectAnalyticsData)
			self.voiceConnectEventReportedForActiveSession = true
			
			return
		elseif previousGroupId and previousGroupId ~= "" then
			self.service:Leave()
			
			if not self.service:JoinByGroupIdToken(previousGroupId, previousMutedState, true) then
				self:InitialJoinFailedPrompt()
				
				return
			end
			local connectDisconnectAnalyticsData = self:GetConnectDisconnectAnalyticsData()
			connectDisconnectAnalyticsData.connectionSource = self.pendingConnectionSource
			self.pendingConnectionSource = nil
			self.Analytics:reportConnectDisconnectEvents("voiceConnectEvent", connectDisconnectAnalyticsData)
			self.voiceConnectEventReportedForActiveSession = true
		end
	end)
end

function t.SwitchDevice(_, p125, p126, p127) --[[ line: 2206 ]]
	-- upvalues: VOICE_CHAT_DEVICE_TYPE (ref), soundService (ref), name (ref)
	if p125 == VOICE_CHAT_DEVICE_TYPE.Input then
		soundService:SetInputDevice(p126, p127)
		name:info("[InputDeviceSelection] Setting SS Mic Device To {} {}", p126, p127)
		
		return
	end
	soundService:SetOutputDevice(p126, p127)
	name:info("[OutputDeviceSelection] Setting SS Speaker Device To {} {}", p126, p127)
end

function t.GetDevices(_, p128) --[[ line: 2216 ]]
	-- upvalues: VOICE_CHAT_DEVICE_TYPE (ref), soundService (ref)
	local ok, status, var136, var137 = pcall(function() --[[ line: 2217 ]]
		-- upvalues: p128 (ref), VOICE_CHAT_DEVICE_TYPE (copy), soundService (copy)
		return if p128 == VOICE_CHAT_DEVICE_TYPE.Input then soundService:GetInputDevices() else soundService:GetOutputDevices()
	end)
	
	return ok, status, var136, var137
end

function t:VoiceChatAvailable() --[[ line: 2228 ]]
	-- upvalues: MIN_VOICE_CHAT_API_VERSION (ref), VOICE_CHAT_AVAILABILITY (ref)
	local service = self.service
	
	if self.available == nil and service then
		self.version = service:GetVoiceChatApiVersion()
		
		if MIN_VOICE_CHAT_API_VERSION <= self.version then
			self.available = service:GetVoiceChatAvailable()
			while self.available == VOICE_CHAT_AVAILABILITY.Checking do
				wait(1)
				self.available = service:GetVoiceChatAvailable()
			end
		end
	end
	return if service then MIN_VOICE_CHAT_API_VERSION <= self.version and self.available == VOICE_CHAT_AVAILABILITY.Available else false
end

function t:VoiceChatEnded() --[[ line: 2248 ]]
	-- upvalues: voiceEndedCheckDisregardIdleState (ref)
	if not self.service then
		return true
	end
	local voiceChatState = self.service.VoiceChatState
	
	return if voiceEndedCheckDisregardIdleState then voiceChatState == Enum.VoiceChatState.Ended elseif voiceChatState ~= Enum.VoiceChatState.Ended then voiceChatState == Enum.VoiceChatState.Idle else true
end

function t:UnmountPrompt() --[[ line: 2260 ]]
	-- upvalues: roactModule (ref)
	if self.voiceChatPromptInstance ~= nil then
		roactModule.unmount(self.voiceChatPromptInstance)
		self.voiceChatPromptInstance = nil
	end
end

t.default = t.new(coreVoiceManager.default, nil, httpRbxApiService, permissionsProtocol.default, blockingUtilityModule:GetAfterBlockedStatusChangedEvent())

if game:DefineFastFlag("VoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry", false) then
	require(corePackagesService.Workspace.Packages.PeopleService).getService("PerUserVoiceVolumeSessionLifecycle").ensureStarted()
end
return t