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
local alwaysSetJoinVoiceButtonContext = game:DefineFastFlag("AlwaysSetJoinVoiceButtonContext", false)
local _ = {
	FAE_UPSELL = "FaeUpsell",
	VOICE_FTUX = "VoiceFtux",
	REWARM = "Rewarm",
	AGE_CHECK_TOAST = "AgeCheckToast",
	PHONE_UPSELL = "PhoneUpsell",
	IN_EXP_UPSELL = "InExpUpsell"
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
local var1 = if getFFlagAvatarChatServiceEnabled() then game:GetService("AvatarChatService") else nil
local var2 = if getFFlagEnableVoiceChatMuteForVideoCaptures() then game:GetService("CaptureService") else nil
local expChatModule = require(corePackagesService.Workspace.Packages.ExpChat)
local default_2 = require(corePackagesService.Workspace.Packages.LinkingProtocol).LinkingProtocol.default
local settingsRoute = require(corePackagesService.Workspace.Packages.LinkingProtocol).Enums.SettingsRoute
local var3 = if getFFlagEnableInExpPhoneVoiceUpsellEntrypoints() then require(corePackagesService.Workspace.Packages.PhoneUpsell).PhoneUpsellController else nil
local var4 = if getFFlagEnableInExpPhoneVoiceUpsellEntrypoints() then require(corePackagesService.Workspace.Packages.PhoneUpsell).Http.Requests.PostPhoneUpsellDisplayed else nil
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
	AvatarChatService = var1,
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
	CaptureService = var2
}
local var5 = luauPolyfillModule.Set.new({
	"available", "participants", "recentUsersInteractionData", "permissionPromise",
	"canUseServicePromise", "localMuted", "isTalking", "previousGroupId",
	"previousMutedState", "userEligible", "sendMuteEvent", "mutedPlayers",
	"SignalREventTable", "audioDevices", "service", "previousSessionId",
	"voiceEnabled", "permissionState", "BlockStatusChanged", "isInCall",
	"callMutedState", "attemptVoiceRejoin", "VoiceJoinProgressChanged",
	"participantJoined", "participantLeft", "participantsUpdate", "muteChanged",
	"audioDeviceInputAdded", "talkingChanged", "canUseServiceResult"
})
var5:add("_mutedAnyone")
var5:add("muteAllChanged")
local t_1 = {}
local t_2 = {
	[constantsModule.IN_EXP_UPSELL_VARIANT.VARIANT1] = promptTypeModule.VoiceConsentModalV1,
	[constantsModule.IN_EXP_UPSELL_VARIANT.VARIANT2] = promptTypeModule.VoiceConsentModalV2,
	[constantsModule.IN_EXP_UPSELL_VARIANT.VARIANT3] = promptTypeModule.VoiceConsentModalV3
}

function getIconSrc(p1, p2)
	return "rbxasset://textures/ui/VoiceChat/" .. (if p2 then p2 .. "/" else "") .. p0 .. ".png"
end

function getIcon(p1, p2, p3)
	-- upvalues: VOICE_STATE (ref)
	return if p1 == VOICE_STATE.MUTED then getIconSrc("Muted", p3) elseif p1 == VOICE_STATE.CONNECTING then getIconSrc("Connecting", p3) elseif p1 == VOICE_STATE.INACTIVE then getIconSrc("Blank", p3) elseif p1 == VOICE_STATE.TALKING then p2 and getIconSrc("Unmuted" .. tostring(math.floor(0.5 + 5 * (p2 or math.random())) * 20), p3) or getIconSrc("Blank", p3) else getIconSrc("Error", p3)
end

t.__index = t

function t:__index(p1)
	-- upvalues: var5 (ref), t (ref)
	return if var5:has(p1) then self.coreVoiceManager[p1] else rawget(t, p1)
end

function t:__newindex(p1, p2)
	-- upvalues: var5 (ref), t (ref)
	if var5:has(p1) then
		self.coreVoiceManager[p1] = p2
		
		return
	end
	rawset(t, p1, p2)
end

function t.new(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10)
	-- upvalues: analytics (ref), getCamMicPermissionsModule (ref), t (ref), WATCHED_MESSAGE_TYPES (ref), getFIntThrottleParticipantsUpdateMs (ref), IXPServiceWrapper (ref), voiceUIImprovementsIXPLayerName (ref), throttleParticipantsUpdateIXPLayerValue (ref), getFFlagExpChatUseVoiceParticipantsStore (ref), expChatModule (ref), getFFlagEnableUniveralVoiceToastsModule (ref), fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule (ref), fFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule (ref), debugSkipVoicePermissionCheck (ref), fFlagDebugShowAudioDeviceInputDebugger (ref), fFlagEnablePartyVoiceChangersInLua (ref), microphoneDevicePermissionsLoggingModule (ref), voiceVolumeControlsGlobalVoiceVolumeSliderIxpExposure (ref), voiceVolumeControlsEligibility (ref), voiceVolumeControlsGlobalVoiceVolumeSliderIxpLayer (ref), VOICE_JOIN_PROGRESS (ref), constantsModule (ref), getFFlagEnableConnectDisconnectInSettingsAndChromeModule (ref), disableLeaveToastInStudio (ref), promptTypeModule (ref), debugSimulateConnectDisconnect (ref), name (ref), appStorageService (ref), getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (ref), voiceNudgeUseNewDACopyModule (ref), getFFlagShowDevicePermissionsModal (ref), getFFlagEnableSeamlessVoiceDataConsentToastModule (ref), getFFlagNonVoiceFTUX (ref), getFFlagEnableVoiceChatMuteForVideoCaptures (ref), getFFlagEnableCrossExperienceVoiceCaptureMute (ref), default_1 (ref)
	local tbl = setmetatable({
		_mutedAnyone = false,
		voiceConnectEventReportedForActiveSession = false,
		service = p2,
		HttpRbxApiService = p3,
		NotificationService = p7,
		PermissionsService = p4,
		BlockStatusChanged = p5,
		Analytics = analytics.new(p6),
		getPermissionsFunction = p8 or getCamMicPermissionsModule,
		AvatarChatService = p9,
		SequenceNumbers = {},
		SignalREventTable = {},
		coreVoiceManager = p1,
		CaptureService = p10
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
		local ok, status = pcall(function()
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
	local var6 = false
	local eventConnection = tbl.attemptVoiceRejoin.Event:Connect(function()
		-- upvalues: var6 (write)
		var6 = true
	end)
	local var7 = if getFFlagExpChatUseVoiceParticipantsStore() then expChatModule.Stores.GetVoiceStore(false) else nil
	tbl.coreVoiceManager:subscribe("GetPermissions", function(p11, p12, p13, p14)
		-- upvalues: tbl (ref)
		tbl.getPermissionsFunction(p11, p12, p13, if tbl.inExpUpsellEntrypoint ~= nil then tbl.inExpUpsellEntrypoint else "VoiceChatServiceManager.requestMicPermission", p14)
	end)
	tbl.coreVoiceManager:subscribe("OnVoiceParticipantRemoved", function(p11)
		-- upvalues: getFFlagExpChatUseVoiceParticipantsStore (copy), var7 (ref), expChatModule (copy)
		if getFFlagExpChatUseVoiceParticipantsStore() then
			var7.handleVoiceParticipantRemoved(p11)
			
			return
		elseif expChatModule.Events.VoiceParticipantRemoved then
			expChatModule.Events.VoiceParticipantRemoved(tostring(p11))
		end
	end)
	tbl.coreVoiceManager:subscribe("OnVoiceParticipantAdded", function(p11)
		-- upvalues: getFFlagExpChatUseVoiceParticipantsStore (copy), var7 (ref), expChatModule (copy)
		if getFFlagExpChatUseVoiceParticipantsStore() then
			var7.handleVoiceParticipantAdded(p11)
			
			return
		elseif expChatModule.Events.VoiceParticipantAdded then
			expChatModule.Events.VoiceParticipantAdded(tostring(p11))
		end
	end)
	tbl.coreVoiceManager:subscribe("OnVoiceParticipantToggleMuted", function(p11, p12)
		-- upvalues: expChatModule (copy)
		if expChatModule.Events.VoiceParticipantToggleMuted then
			expChatModule.Events.VoiceParticipantToggleMuted(tostring(p11), p12)
		end
	end)
	tbl.coreVoiceManager:subscribe("OnUserAndPlaceCanUseVoiceResolved", function(p11, p12)
		-- upvalues: tbl (ref)
		tbl:_onUserAndPlaceCanUseVoiceResolved(p11, p12)
	end)
	tbl.coreVoiceManager:subscribe("OnRequestMicPermissionResolved", function()
		-- upvalues: getFFlagEnableUniveralVoiceToastsModule (copy), fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule (copy), fFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule (copy), tbl (ref)
		if not getFFlagEnableUniveralVoiceToastsModule() then return end
		return if fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule and fFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule then tbl:CheckAndShowNotAudiblePrompt():andThen(function()
			-- upvalues: tbl (copy)
			return tbl:ShowNotAudiblePromptVoiceChatVolume()
		end) else tbl:CheckAndShowNotAudiblePrompt()
	end)
	tbl.coreVoiceManager:subscribe("OnRequestMicPermissionRejected", function()
		-- upvalues: tbl (ref), getFFlagEnableUniveralVoiceToastsModule (copy), debugSkipVoicePermissionCheck (copy)
		if tbl:IsSeamlessVoice() then
			tbl.deniedMicPermissions = true
		end
		if getFFlagEnableUniveralVoiceToastsModule() and not debugSkipVoicePermissionCheck then
			return tbl:CheckAndShowPermissionPrompt()
		end
	end)
	
	if fFlagDebugShowAudioDeviceInputDebugger then
		tbl.coreVoiceManager:subscribe("OnDevicePlayerChanged", function()
			-- upvalues: tbl (ref)
			tbl:UpdateAudioDeviceInputDebugger()
		end)
		tbl.coreVoiceManager:subscribe("OnDeviceActiveChanged", function()
			-- upvalues: tbl (ref)
			tbl:UpdateAudioDeviceInputDebugger()
		end)
		tbl.coreVoiceManager:subscribe("OnDeviceMuteChanged", function()
			-- upvalues: tbl (ref)
			tbl:UpdateAudioDeviceInputDebugger()
		end)
		
		if fFlagEnablePartyVoiceChangersInLua then
			tbl.coreVoiceManager:subscribe("OnVoiceChangerChanged", function()
				-- upvalues: tbl (ref)
				tbl:UpdateAudioDeviceInputDebugger()
			end)
		end
		tbl.coreVoiceManager:subscribe("OnPlayerMuted", function()
			-- upvalues: tbl (ref)
			tbl:UpdateAudioDeviceInputDebugger()
		end)
		tbl.coreVoiceManager:subscribe("OnAudioDeviceInputAdded", function()
			-- upvalues: tbl (ref)
			tbl:UpdateAudioDeviceInputDebugger()
		end)
		tbl.coreVoiceManager:subscribe("OnAudioDeviceInputRemoved", function()
			-- upvalues: tbl (ref)
			tbl:UpdateAudioDeviceInputDebugger()
		end)
		tbl.coreVoiceManager:subscribe("OnDeviceMutedByLocalUserChanged", function()
			-- upvalues: tbl (ref)
			tbl:UpdateAudioDeviceInputDebugger()
		end)
	end
	tbl.coreVoiceManager:subscribe("OnStateChanged", function(_, p11)
		-- upvalues: microphoneDevicePermissionsLoggingModule (copy), tbl (ref), voiceVolumeControlsGlobalVoiceVolumeSliderIxpExposure (copy), voiceVolumeControlsEligibility (copy), IXPServiceWrapper (copy), voiceVolumeControlsGlobalVoiceVolumeSliderIxpLayer (copy), VOICE_JOIN_PROGRESS (copy), constantsModule (copy), var6 (write), eventConnection (ref), getFFlagEnableConnectDisconnectInSettingsAndChromeModule (copy), disableLeaveToastInStudio (copy), promptTypeModule (copy)
		microphoneDevicePermissionsLoggingModule:setClientSessionId(tbl.coreVoiceManager:GetSessionId())
		
		if p11 == Enum.VoiceChatState.Ended or p11 == Enum.VoiceChatState.Failed then
			tbl.voiceConnectEventReportedForActiveSession = false
		end
		if p11 == Enum.VoiceChatState.Joined and voiceVolumeControlsGlobalVoiceVolumeSliderIxpExposure and voiceVolumeControlsEligibility.isVoiceChatVolumeSliderVisible(true, game:GetService("VoiceChatService").UseNewAudioApi) then
			IXPServiceWrapper:LogFlagLinkedUserLayerExposure(voiceVolumeControlsGlobalVoiceVolumeSliderIxpLayer)
		end
		if p11 == Enum.VoiceChatState.Joined and tbl:GetVoiceJoinProgress() == VOICE_JOIN_PROGRESS.Idle and not tbl.voiceConnectEventReportedForActiveSession then
			local connectDisconnectAnalyticsData = tbl:GetConnectDisconnectAnalyticsData()
			connectDisconnectAnalyticsData.connectionSource = constantsModule.VOICE_CONNECTION_SOURCE.AUTO_CONNECT
			tbl.pendingConnectionSource = nil
			tbl.Analytics:reportConnectDisconnectEvents("voiceConnectEvent", connectDisconnectAnalyticsData)
			tbl.voiceConnectEventReportedForActiveSession = true
			var6 = false
			eventConnection:Disconnect()
		end
		local var8 = p11 == Enum.VoiceChatState.Ended
		
		if var8 then
			local connectDisconnectAnalyticsData = tbl:GetConnectDisconnectAnalyticsData()
			connectDisconnectAnalyticsData.disconnectReason = tbl.pendingDisconnectReason or constantsModule.VOICE_DISCONNECT_REASON.SYSTEM
			tbl.Analytics:reportConnectDisconnectEvents("voiceDisconnectReasonEvent", connectDisconnectAnalyticsData)
			tbl.pendingDisconnectReason = nil
		end
		if var8 and tbl.bannedUntil == nil then
			if not getFFlagEnableConnectDisconnectInSettingsAndChromeModule() then
				tbl:HideVoiceUI()
			end
			if disableLeaveToastInStudio and tbl.runService:IsStudio() then return end
			tbl:showPrompt(promptTypeModule.LeaveVoice)
		end
	end)
	tbl.coreVoiceManager:subscribe("OnVoiceChatServiceInitialized", function()
		-- upvalues: tbl (ref), debugSimulateConnectDisconnect (copy), name (copy), appStorageService (copy), constantsModule (copy), promptTypeModule (copy)
		tbl:ShowVoiceUI()
		
		if debugSimulateConnectDisconnect then
			name:debug("Simulating join voice")
			tbl:simulateVoiceConnectDisconnect()
		end
		if not tbl.coreVoiceManager.initializedPostSuspension then
			local ok, status = pcall(function()
				-- upvalues: appStorageService (copy), constantsModule (copy)
				return appStorageService:GetItem(constantsModule.VOICE_WITH_TC_TOAST_KEY) == "true"
			end)
			
			if not (if ok then status else true) then
				tbl:showPrompt(promptTypeModule.UpdateOnAutoJoinToast)
				pcall(function()
					-- upvalues: appStorageService (copy), constantsModule (copy)
					appStorageService:SetItem(constantsModule.VOICE_WITH_TC_TOAST_KEY, "true")
					appStorageService:Flush()
				end)
			end
		end
	end)
	tbl.coreVoiceManager:subscribe("OnInitialJoinFailed", function()
		-- upvalues: tbl (ref)
		tbl:InitialJoinFailedPrompt()
	end)
	tbl.coreVoiceManager:subscribe("OnPlayerModerated", function()
		-- upvalues: tbl (ref), constantsModule (copy)
		tbl.pendingDisconnectReason = constantsModule.VOICE_DISCONNECT_REASON.MODERATED
		tbl:ShowPlayerModeratedMessage()
	end)
	tbl.coreVoiceManager:subscribe("OnRetryRequested", function()
		-- upvalues: tbl (ref), promptTypeModule (copy)
		tbl:showPrompt(promptTypeModule.Retry)
	end)
	tbl.coreVoiceManager:subscribe("OnVoiceToxicityModal", function()
		-- upvalues: name (copy), getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (copy), voiceNudgeUseNewDACopyModule (copy), tbl (ref), promptTypeModule (copy)
		name:debug("Showing Voice Toxicity Modal")
		
		if getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and voiceNudgeUseNewDACopyModule() then
			tbl:showPrompt(promptTypeModule.VoiceToxicityModalV2)
			
			return
		end
		tbl:showPrompt(promptTypeModule.VoiceToxicityModal)
	end)
	tbl.coreVoiceManager:subscribe("OnVoiceToxicityToast", function()
		-- upvalues: name (copy), getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (copy), voiceNudgeUseNewDACopyModule (copy), tbl (ref), promptTypeModule (copy)
		name:debug("Showing Voice Toxicity Toast")
		
		if getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and voiceNudgeUseNewDACopyModule() then
			tbl:showPrompt(promptTypeModule.VoiceToxicityToastV2)
			
			return
		end
		tbl:showPrompt(promptTypeModule.VoiceToxicityToast)
	end)
	tbl.coreVoiceManager:subscribe("OnPermissionRequested", function()
		-- upvalues: getFFlagShowDevicePermissionsModal (copy), tbl (ref), promptTypeModule (copy)
		if getFFlagShowDevicePermissionsModal() then
			tbl:showPrompt(promptTypeModule.DevicePermissionsModal)
			
			return
		end
		tbl:showPrompt(promptTypeModule.Permission)
	end)
	tbl.coreVoiceManager:subscribe("OnShowDataConsentToast", function()
		-- upvalues: getFFlagEnableSeamlessVoiceDataConsentToastModule (copy), tbl (ref)
		if getFFlagEnableSeamlessVoiceDataConsentToastModule() then
			tbl:showDataConsentToast()
		end
	end)
	tbl.coreVoiceManager:subscribe("OnVoiceReverseNudgeIconColorChange", function(p11)
		-- upvalues: name (copy), expChatModule (copy), tbl (ref)
		name:debug("Showing Reverse Nudge Icon Color Change")
		
		if expChatModule.Events.AddReverseNudgeToxicUser and expChatModule.Events.RemoveReverseNudgeToxicUser then
			tbl:AddReverseNudgeToxicUser(p11.toxicUserId, expChatModule.Events.AddReverseNudgeToxicUser, expChatModule.Events.RemoveReverseNudgeToxicUser)
		end
	end)
	tbl.coreVoiceManager.setVoiceUIVisibility.Event:Connect(function(p11)
		-- upvalues: tbl (ref)
		if p11 then
			tbl:ShowVoiceUI()
			
			return
		end
		tbl:HideVoiceUI()
	end)
	tbl.coreVoiceManager:subscribe("OnVoiceJoin", function()
		-- upvalues: getFFlagNonVoiceFTUX (copy), tbl (ref), promptTypeModule (copy), getFFlagEnableVoiceChatMuteForVideoCaptures (copy), getFFlagEnableCrossExperienceVoiceCaptureMute (copy), default_1 (copy), var6 (write), eventConnection (ref)
		if getFFlagNonVoiceFTUX() and tbl.hasLeftFTUX then
			tbl.hasLeftFTUX = false
			tbl:showJoinVoicePrompt()
			tbl.Analytics:reportConnectDisconnectEvents("voiceConnectFtuxLeaveEvent", tbl:GetConnectDisconnectAnalyticsData())
		elseif tbl:IsSeamlessVoice() then
			tbl:showJoinVoicePrompt()
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
		if var6 then
			local connectDisconnectAnalyticsData = tbl:GetConnectDisconnectAnalyticsData()
			connectDisconnectAnalyticsData.connectionSource = tbl.pendingConnectionSource
			tbl.pendingConnectionSource = nil
			tbl.Analytics:reportConnectDisconnectEvents("voiceConnectEvent", connectDisconnectAnalyticsData)
			tbl.voiceConnectEventReportedForActiveSession = true
			var6 = false
			eventConnection:Disconnect()
		end
	end)
	
	return tbl
end

local function _(p11)
	return "..." .. string.sub(tostring(p11), -4)
end

local _ = function(p11, p12)
	return function(...)
		-- upvalues: p11 (ref), p12 (ref)
		return p11[p12](p11, ...)
	end
end

function t:subscribe(p11, p12)
	return self.coreVoiceManager:subscribe(p11, p12)
end

function t:unsubscribe(p11, p12)
	self.coreVoiceManager:unsubscribe(p11, p12)
end

function t:_reportJoinFailed(p11, p12)
	return self.coreVoiceManager:_reportJoinFailed(p11, p12)
end

function t:_asyncInit()
	return self.coreVoiceManager:_asyncInit()
end

function t:asyncInit()
	return self.coreVoiceManager:asyncInit()
end

function t:CheckAudioInputExists()
	return self.coreVoiceManager:CheckAudioInputExists()
end

function t:getService()
	return self.service
end

function t:GetMutedAnyone()
	return self.coreVoiceManager:GetMutedAnyone()
end

function t:RecordGameSettingsOpened()
	self.coreVoiceManager:RecordGameSettingsOpened()
end

function t:ReportVoiceVolumeImpressionsIfNeeded()
	self.coreVoiceManager:ReportVoiceVolumeImpressionsIfNeeded()
end

function t:GetRequest(p11, p12)
	return self.coreVoiceManager:GetRequest(p11, p12)
end

function t.PostRequest(p11, p12, _, p13)
	-- upvalues: httpService (ref)
	local ok, status = pcall(function()
		-- upvalues: p11 (ref), p12 (ref), p13 (ref), httpService (copy)
		return httpService:JSONDecode(p11.HttpRbxApiService:PostAsyncFullUrl(p12, p13, Enum.ThrottlingPriority.Default, Enum.HttpContentType.ApplicationJson, Enum.HttpRequestType.Players))
	end)
	
	return ok and status
end

function t:_GetShowAgeVerificationOverlay(p11)
	return self.coreVoiceManager:_GetShowAgeVerificationOverlay(p11)
end

function t.simulateVoiceConnectDisconnect(p11)
	-- upvalues: debugConnectDisconnectInterval (ref), name (ref)
	task.spawn(function()
		-- upvalues: debugConnectDisconnectInterval (copy), p11 (ref), name (copy)
		while true do
			task.wait(debugConnectDisconnectInterval)
			if p11.voiceUIVisible then
				name:debug("Hiding Voice")
				p11:HideVoiceUI()
			else
				name:debug("Showing Voice")
				p11:ShowVoiceUI()
			end
		end
	end)
end

function t:FetchAgeVerificationOverlay(p12)
	return self.coreVoiceManager:FetchAgeVerificationOverlay(p12)
end

function t:FetchPhoneVerificationUpsell(p12, p13, p14)
	return self.coreVoiceManager:FetchPhoneVerificationUpsell(p12, p13, p14)
end

function t.RecordUserSeenModal(p12, p13)
	-- upvalues: postRecordUserSeenGeneralModal (ref)
	local var8 = "PostRequest"
	
	return postRecordUserSeenGeneralModal(function(...)
		-- upvalues: p12 (ref), var8 (ref)
		return p12[var8](p12, ...)
	end, p13)
end

function t:checkAndUpdateSequence(p12, p13)
	return self.coreVoiceManager:checkAndUpdateSequence(p12, p13)
end

function t:onMissedSequence(p12)
	return self.coreVoiceManager:onMissedSequence(p12)
end

function t:watchSignalR()
	return self.coreVoiceManager:watchSignalR()
end

function t:voicePermissionGranted(p12)
	return self.coreVoiceManager:voicePermissionGranted(p12)
end

function t:GetSignalREvent(p12)
	return self.coreVoiceManager:GetSignalREvent(p12)
end

function t:avatarChatUserAndPlaceSettingsValueOfClientFeatures(p12)
	return self.coreVoiceManager:avatarChatUserAndPlaceSettingsValueOfClientFeatures(p12)
end

function t:resolveAvatarChatUserAndPlaceSettings()
	return self.coreVoiceManager:resolveAvatarChatUserAndPlaceSettings()
end

function t:EnableVoice()
	return self.coreVoiceManager:EnableVoice()
end

function t:_VoiceChatFirstTimeUX(p12)
	-- upvalues: constantsModule (ref), name (ref), getFFlagNonVoiceFTUX (ref), expChatModule (ref), getFFlagEnableFtuxExitOnMuteToggle (ref), seamlessVoiceSTUXDisplayCount (ref), fixSTUXShowingIncorrectly (ref), promptTypeModule (ref)
	local var8 = nil
	local var9 = nil
	
	if not pcall(function()
		-- upvalues: p12 (ref), constantsModule (copy), var8 (write), var9 (write)
		local seamless_voice_stux_keyItem = p12:GetItem(constantsModule.SEAMLESS_VOICE_STUX_KEY)
		var8 = p12:GetItem(constantsModule.SEAMLESS_VOICE_FTUX_KEY) == "true"
		var9 = if seamless_voice_stux_keyItem == nil then 0 else tonumber(seamless_voice_stux_keyItem)
	end) then
		name:warning("Failed to read FTUX/STUX from AppStorage")
		
		return
	end
	name:trace("hasShownFTUX: {}. STUXCount: {}", var8, var9)
	name:debug("Showing FTUX")
	self.isShowingFTUX = true
	self.Analytics:reportConnectDisconnectEvents("voiceConnectFtuxJoinEvent", self:GetConnectDisconnectAnalyticsData())
	
	if getFFlagNonVoiceFTUX() then
		expChatModule.Events.VoiceUIVisibilityChanged(true)
	else
		self:MuteAll(true, "FTUX")
		self.muteAllChanged.Event:Once(function()
			-- upvalues: self (ref), p12 (ref)
			self:HideFTUX(p12)
			self.Analytics:reportConnectDisconnectEvents("voiceConnectFtuxLeaveEvent", self:GetConnectDisconnectAnalyticsData())
		end)
		self.talkingChanged.Event:Once(function()
			-- upvalues: self (ref), p12 (ref)
			self:HideFTUX(p12)
		end)
		
		if getFFlagEnableFtuxExitOnMuteToggle() then
			self.coreVoiceManager.onPlayerMuteToggled.Event:Once(function()
				-- upvalues: self (ref), p12 (ref)
				self:HideFTUX(p12)
			end)
		end
	end
end

function t:VoiceChatFirstTimeUX(p12)
	-- upvalues: fixSTUXShowingIncorrectly (ref), name (ref), debugSkipSeamlessVoiceAPICheck (ref), constantsModule (ref), getFFlagNonVoiceFTUX (ref)
	if fixSTUXShowingIncorrectly and not self:verifyUniverseAndPlaceCanUseVoice() then
		name:debug("Universe/place is not voice enabled, do not run FTUX/STUX")
		
		return
	elseif not debugSkipSeamlessVoiceAPICheck then
		local var8 = self:FetchAgeVerificationOverlay()
		
		if type(var8) == "table" and var8.voiceSettings and var8.voiceSettings.seamlessVoiceStatus ~= constantsModule.SEAMLESS_VOICE_STATUS_ENABLED_NEW_USER then
			name:debug("User not eligible for FTUX/STUX")
			
			return
		end
	end
	local function _()
		-- upvalues: name (copy), self (ref), p12 (ref)
		name:debug("Starting FTUX")
		self:_VoiceChatFirstTimeUX(p12)
	end
	
	if getFFlagNonVoiceFTUX() then
		name:debug("Starting FTUX")
		self:_VoiceChatFirstTimeUX(p12)
		
		return
	end
	self:asyncInit():andThen(function()
		-- upvalues: self (ref), name (copy), p12 (ref)
		local stateChangedConnection = nil
		
		if self.service.VoiceChatState and self.service.VoiceChatState == Enum.VoiceChatState.Joined then
			name:debug("Starting FTUX")
			self:_VoiceChatFirstTimeUX(p12)
		end
		stateChangedConnection = self.service.StateChanged:Connect(function(_, p13)
			-- upvalues: name (copy), self (copy), p12 (copy), stateChangedConnection (write)
			if p13 == Enum.VoiceChatState.Joined then
				name:debug("Starting FTUX")
				self:_VoiceChatFirstTimeUX(p12)
				stateChangedConnection:Disconnect()
			end
		end)
	end):catch(function(p13)
		-- upvalues: name (copy)
		name:trace("Failed to start FTUX: {}", p13)
	end)
end

function t:HideFTUX(p12)
	-- upvalues: constantsModule (ref), getFFlagNonVoiceFTUX (ref), promptTypeModule (ref)
	self.isShowingFTUX = false
	self.hideFTUXSignal:Fire()
	pcall(function()
		-- upvalues: p12 (ref), constantsModule (copy)
		p12:SetItem(constantsModule.SEAMLESS_VOICE_FTUX_KEY, "true")
		p12:Flush()
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

function t:_onUserAndPlaceCanUseVoiceResolved(p12, p13)
	-- upvalues: getInformedOfBan (ref), getFFlagAvatarChatServiceEnabled (ref), getFFlagVoiceChatServiceManagerUseAvatarChat (ref), promptTypeModule (ref), BAN_REASON (ref), getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (ref), voiceNudgeUseNewDACopyModule (ref), getFFlagEnableVoicePromptReasonTextModule (ref)
	self.bannedUntil = nil
	
	if p12 and p12.isBanned then
		local var8 = "GetRequest"
		local var9 = getInformedOfBan(function(...)
			-- upvalues: self (ref), var8 (ref)
			return self[var8](self, ...)
		end)
		
		if var9 and not var9.informedOfBan then
			if getFFlagAvatarChatServiceEnabled() and getFFlagVoiceChatServiceManagerUseAvatarChat() and p12.bannedUntil == nil then
				self:ShowPlayerModeratedMessage()
			elseif p12.bannedUntil == nil then
				self:showPrompt(promptTypeModule.VoiceChatSuspendedPermanent)
			else
				self.bannedUntil = p12.bannedUntil
				
				if p12.banReason ~= BAN_REASON.NUDGE_V3 then
					self:showPrompt(promptTypeModule.VoiceChatSuspendedTemporary)
				elseif getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and voiceNudgeUseNewDACopyModule() then
					self:showPrompt(promptTypeModule.VoiceChatSuspendedTemporaryBV2)
				else
					self:showPrompt(promptTypeModule.VoiceChatSuspendedTemporaryB)
				end
			end
		end
		if var9 and var9.informedOfBan then
			self:ShowPlayerModeratedMessage(true)
			
			return
		end
	elseif self.runService:IsStudio() and p12 and not p12.isVoiceEnabled then
		self:showPrompt(promptTypeModule.User)
		
		return
	elseif self.runService:IsStudio() and p13 and not p13.isPlaceEnabledForVoice then
		self:showPrompt(promptTypeModule.Place, getFFlagEnableVoicePromptReasonTextModule() and (table.concat(p13.reasons or {}, "") or nil))
	end
end

function t:ChangeVoiceJoinProgress(p12)
	return self.coreVoiceManager:ChangeVoiceJoinProgress(p12)
end

function t:GetVoiceJoinProgress()
	return self.coreVoiceManager.VoiceJoinProgress
end

function t:UserOnlyEligibleForVoice()
	return self.coreVoiceManager:UserOnlyEligibleForVoice()
end

function t:UserOnlyEligibleForVoiceViaOverlay()
	return self.coreVoiceManager:UserOnlyEligibleForVoiceViaOverlay()
end

function t:UserVoiceEnabled()
	return self.coreVoiceManager:UserVoiceEnabled()
end

function t:UserInInExperienceUpsellTreatment()
	return self.coreVoiceManager:UserInInExperienceUpsellTreatment()
end

function t:UserEligibleForInExperienceUpsell()
	return self.coreVoiceManager:UserEligibleForInExperienceUpsell()
end

function t:ShowInExperienceVoiceUpsell(p12)
	-- upvalues: guardVoiceInExpUpsellVariant (ref)
	local var8 = self:FetchAgeVerificationOverlay()
	
	if guardVoiceInExpUpsellVariant and type(var8) ~= "table" then
		return
	end
	local showVoiceInExperienceUpsellVariant = var8.showVoiceInExperienceUpsellVariant
	self:SetInExpUpsellEntrypoint(p12)
	self:showPrompt(self:GetInExpUpsellPromptFromEnum(showVoiceInExperienceUpsellVariant))
end

function t:ShowInExperiencePhoneVoiceUpsell(p12, p13)
	-- upvalues: var3 (ref), getFFlagInExperiencePhoneUpsellNewCopy (ref), var4 (ref), constantsModule (ref), promptTypeModule (ref)
	self:SetInExpUpsellEntrypoint(p12)
	var3.openPhoneUpsell({
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
		onSuccessBeforeToast = function()
			-- upvalues: self (ref), var4 (copy), p13 (ref)
			self.coreVoiceManager:DisablePhoneVerificationUpsell()
			local var8 = "PostRequest"
			var4(function(...)
				-- upvalues: self (ref), var8 (ref)
				return self[var8](self, ...)
			end, p13, os.time(), false)
		end,
		onSuccess = function()
			-- upvalues: self (ref), constantsModule (copy)
			if self.pendingConnectionSource == nil then
				self.pendingConnectionSource = constantsModule.VOICE_CONNECTION_SOURCE.IN_EXPERIENCE
			end
			self:EnableVoice()
		end,
		closeUpsell = function()
			-- upvalues: p12 (ref), constantsModule (copy), self (ref), promptTypeModule (copy), var4 (copy), p13 (ref)
			if p12 ~= constantsModule.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE then
				self:showPrompt(promptTypeModule.VoiceConsentDeclinedToast)
			end
			local var8 = "PostRequest"
			var4(function(...)
				-- upvalues: self (ref), var8 (ref)
				return self[var8](self, ...)
			end, p13, os.time(), true)
		end
	})
end

function t:DisablePhoneVerificationUpsell()
	self.coreVoiceManager:DisablePhoneVerificationUpsell()
end

function t:SetInExpUpsellEntrypoint(p12)
	self.inExpUpsellEntrypoint = p12
end

function t:userAndPlaceCanUseVoice()
	return self.coreVoiceManager:userAndPlaceCanUseVoice()
end

function t:verifyUniverseAndPlaceCanUseVoice()
	return self.coreVoiceManager:verifyUniverseAndPlaceCanUseVoice()
end

function t:GetVoiceConnectCookieValue()
	return self.coreVoiceManager:GetVoiceConnectCookieValue()
end

function t:GetVoiceConnectCookie()
	return self.coreVoiceManager:GetVoiceConnectCookie()
end

function t:SetVoiceConnectCookieValue(p12)
	return self.coreVoiceManager:SetVoiceConnectCookieValue(p12)
end

function t:GetVoiceRewarmCookie()
	return self.coreVoiceManager:GetVoiceRewarmCookie()
end

function t:SetVoiceRewarmCookie(p12)
	self.coreVoiceManager:SetVoiceRewarmCookie(p12)
end

function t:SetNewUserFTUXCookieValue(p12)
	return self.coreVoiceManager:SetNewUserFTUXCookieValue(p12)
end

function t:ShowPlayerModeratedMessage(p12)
	-- upvalues: getUserSettings (ref), analytics (ref), promptTypeModule (ref), BAN_REASON (ref), getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (ref), voiceNudgeUseNewDACopyModule (ref)
	local var8 = "GetRequest"
	local var9 = getUserSettings(function(...)
		-- upvalues: self (ref), var8 (ref)
		return self[var8](self, ...)
	end)
	
	if not var9 or not var9.isBanned then
		self:_reportJoinFailed("PlayerModeratedBadState", analytics.ERROR)
		
		return
	end
	self.banReason = var9.banReason
	
	if var9.bannedUntil == nil then
		self:showPrompt(promptTypeModule.VoiceChatSuspendedPermanent)
		
		return
	end
	self.bannedUntil = var9.bannedUntil
	
	if p12 then
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

function t:CheckCallState()
	return self.coreVoiceManager:CheckCallState()
end

function t:ShowVoiceChatLoadingMessage()
	-- upvalues: promptTypeModule (ref)
	self:showPrompt(promptTypeModule.VoiceLoading)
end

function t:requestMicPermission()
	return self.coreVoiceManager:requestMicPermission()
end

function t:canUseServiceAsync()
	return self.coreVoiceManager:canUseServiceAsync()
end

function t:canUseService()
	-- upvalues: httpRbxApiService (ref), httpService (ref), VOICE_CHAT_AVAILABILITY (ref)
	if self.available ~= nil or not game:GetEngineFeature("VoiceChatSupported") then
		return false
	end
	local ok, status = pcall(function()
		-- upvalues: httpRbxApiService (copy), httpService (copy)
		return httpService:JSONDecode(httpRbxApiService:GetAsyncFullUrl("https://voice.roblox.com/v1/settings", Enum.ThrottlingPriority.Default, Enum.HttpRequestType.Players))
	end)
	local isVoiceEnabled = ok and status.isVoiceEnabled
	
	if not isVoiceEnabled then
		self.available = VOICE_CHAT_AVAILABILITY.UserNotAvailable
	end
	return isVoiceEnabled
end

function t:ensureInitialized(p12)
	return self.coreVoiceManager:ensureInitialized(p12)
end

function t:GetSessionId()
	return self.coreVoiceManager:GetSessionId()
end

function t:GetChannelId()
	return self.coreVoiceManager:GetChannelId()
end

function t:JoinWithVoiceMuteData(p12)
	return self.coreVoiceManager:JoinWithVoiceMuteData(p12)
end

function t.calculateBanDuration(_, p12, p13)
	return math.ceil((p13 - p12) / 60)
end

function t:ShowVoiceUI()
	-- upvalues: expChatModule (ref)
	self.voiceUIVisible = true
	self.showVoiceUI:Fire()
	
	if expChatModule.Events.VoiceUIVisibilityChanged then
		expChatModule.Events.VoiceUIVisibilityChanged(true)
	end
end

function t:HideVoiceUI()
	-- upvalues: expChatModule (ref)
	self.voiceUIVisible = false
	self.hideVoiceUI:Fire()
	
	if expChatModule.Events.VoiceUIVisibilityChanged then
		expChatModule.Events.VoiceUIVisibilityChanged(false)
	end
end

function t:createPromptInstance(p12, p13)
	-- upvalues: getFFlagEnableVoicePromptReasonTextModule (ref), promptTypeModule (ref), getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (ref), localizationService (ref), getFFlagShowDevicePermissionsModal (ref), fFlagEnableRetryForLinkingProtocolFetch (ref), fIntLinkingProtocolFetchRetries (ref), default_2 (ref), settingsRoute (ref), fIntLinkingProtocolFetchTimeoutMS (ref), roactModule (ref), voiceChatPromptModule (ref), analytics (ref), postInformedOfBan (ref), constantsModule (ref), disablePermissionPromptDeeplink (ref), getFFlagJoinWithoutMicPermissions (ref), voiceChatPermissionPromptUseMicrophoneRoute (ref), name (ref), coreGuiService (ref)
	if self.promptSignal then
		self.promptSignal:Destroy()
		self.promptSignal = nil
	end
	self.promptSignal = Instance.new("BindableEvent")
	local var8 = if getFFlagEnableVoicePromptReasonTextModule() then self.errorText else nil
	local var9 = p13 == promptTypeModule.VoiceChatSuspendedTemporaryB
	
	if getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() then
		var9 = var9 or p13 == promptTypeModule.VoiceChatSuspendedTemporaryBV2
	end
	local var10 = if self.bannedUntil ~= nil then if var9 then tostring(self:calculateBanDuration(DateTime.now().UnixTimestamp, self.bannedUntil.Seconds)) else DateTime.fromUnixTimestamp(self.bannedUntil.Seconds):FormatLocalTime("l LT", localizationService.RobloxLocaleId) else ""
	local var11 = if p13 ~= promptTypeModule.VoiceToxicityModal then if p13 ~= promptTypeModule.VoiceToxicityToast then getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and (if p13 ~= promptTypeModule.VoiceToxicityModalV2 then p13 == promptTypeModule.VoiceToxicityToastV2 else true) else true else true
	local var12 = if p13 ~= promptTypeModule.VoiceConsentModalV1 then if p13 ~= promptTypeModule.VoiceConsentModalV2 then p13 == promptTypeModule.VoiceConsentModalV3 else true else true
	local var13 = false
	local var14 = nil
	
	if getFFlagShowDevicePermissionsModal() and p13 == promptTypeModule.DevicePermissionsModal and self.settingsAppAvailable == nil then
		if fFlagEnableRetryForLinkingProtocolFetch then
			for _ = 0, fIntLinkingProtocolFetchRetries do
				local thread = task.spawn(function()
					-- upvalues: var13 (write), var14 (write), default_2 (copy), settingsRoute (copy)
					local var15, var16 = default_2:supportsSwitchToSettingsApp(settingsRoute.Microphone):await()
					var13 = var15
					var14 = var16
				end)
				task.wait(fIntLinkingProtocolFetchTimeoutMS / 1000)
				task.cancel(thread)
				
				if var14 == nil then
					continue
				end
			end
		else
			local var15, var16 = default_2:supportsSwitchToSettingsApp(settingsRoute.Microphone):await()
			var13 = var15
			var14 = var16
		end
		self.settingsAppAvailable = var13 and var14
	end
	self.voiceChatPromptInstance = roactModule.mount(roactModule.createElement(voiceChatPromptModule, {
		Analytics = analytics.new(),
		promptSignal = self.promptSignal.Event,
		bannedUntil = var10,
		policyMapper = self.policyMapper,
		errorText = var8,
		onReadyForSignal = p12,
		VoiceChatServiceManager = self,
		settingsAppAvailable = if self.settingsAppAvailable == nil then false else self.settingsAppAvailable,
		onContinueFunc = if p13 == promptTypeModule.VoiceChatSuspendedTemporary or var9 then function()
			-- upvalues: postInformedOfBan (copy), self (ref)
			local var17 = "PostRequest"
			postInformedOfBan(function(...)
				-- upvalues: self (ref), var17 (ref)
				return self[var17](self, ...)
			end, true)
		end elseif var11 then function()
			-- upvalues: self (ref)
			self.Analytics:reportClosedNudge(self:GetNudgeAnalyticsData())
		end elseif var12 then function()
			-- upvalues: self (ref), constantsModule (copy)
			self:RecordUserSeenModal(constantsModule.MODAL_IDS.IN_EXP_UPSELL)
		end else nil,
		onPrimaryActivated = if var11 then function()
			-- upvalues: self (ref)
			self.Analytics:reportAcknowledgedNudge(self:GetNudgeAnalyticsData())
		end elseif not disablePermissionPromptDeeplink and getFFlagJoinWithoutMicPermissions() and p13 == promptTypeModule.Permission then if getFFlagJoinWithoutMicPermissions() and getFFlagShowDevicePermissionsModal() and p13 == promptTypeModule.DevicePermissionsModal then function()
			-- upvalues: name (copy), self (ref), default_2 (copy), settingsRoute (copy)
			name:debug("Settings app available: {}", self.settingsAppAvailable)
			self.Analytics:reportDevicePermissionsModalEvent(if self.settingsAppAvailable then "OpenedSettings" else "Acknowledged", self:GetSessionId(), self:GetInExpUpsellAnalyticsData())
			
			if self.settingsAppAvailable then
				name:debug("Switching to settings app")
				default_2:switchToSettingsApp(settingsRoute.Microphone):andThen(function()
					-- upvalues: name (copy)
					name:debug("Successfully switched to settings app")
				end):catch(function()
					-- upvalues: name (copy)
					name:error("Error switching to settings app")
				end)
				
				return
			end
			name:debug("Current platform does not support switching to settings app")
		end elseif var9 then function()
			-- upvalues: self (ref)
			self:reportBanMessage("Understood")
			self.Analytics:reportBanMessageEvent("Understood")
		end elseif var12 then function()
			-- upvalues: self (ref), constantsModule (copy)
			self.Analytics:reportInExpConsent("accepted", self.inExpUpsellEntrypoint, self:GetInExpUpsellAnalyticsData())
			
			if self.pendingConnectionSource == nil then
				self.pendingConnectionSource = constantsModule.VOICE_CONNECTION_SOURCE.IN_EXPERIENCE
			end
			self:EnableVoice()
		end else nil else function()
			-- upvalues: voiceChatPermissionPromptUseMicrophoneRoute (copy), settingsRoute (copy), default_2 (copy), name (copy)
			local var17 = if voiceChatPermissionPromptUseMicrophoneRoute then settingsRoute.Microphone else nil
			local var18 = default_2:supportsSwitchToSettingsApp(var17):await()
			name:debug("Settings app available: {}", var18)
			
			if var18 then
				name:debug("Switching to settings app")
				default_2:switchToSettingsApp(var17):andThen(function()
					-- upvalues: name (copy)
					name:debug("Successfully switched to settings app")
				end):catch(function()
					-- upvalues: name (copy)
					name:error("Error switching to settings app")
				end)
				
				return
			end
			name:debug("Current platform does not support switching to settings app")
		end,
		onSecondaryActivated = if p13 == promptTypeModule.VoiceToxicityModal or getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and p13 == promptTypeModule.VoiceToxicityModalV2 then function()
			-- upvalues: self (ref)
			self:ShowVoiceToxicityFeedbackToast()
			self.Analytics:reportDeniedNudge(self:GetNudgeAnalyticsData())
		end elseif var11 then function()
			-- upvalues: self (ref)
			self.Analytics:reportDeniedNudge(self:GetNudgeAnalyticsData())
		end elseif var9 then function()
			-- upvalues: self (ref)
			self:ShowVoiceToxicityFeedbackToast()
			self:reportBanMessage("Denied")
			self.Analytics:reportBanMessageEvent("Denied")
		end elseif var12 then function()
			-- upvalues: self (ref), constantsModule (copy), promptTypeModule (copy)
			self.Analytics:reportInExpConsent("denied", self.inExpUpsellEntrypoint, self:GetInExpUpsellAnalyticsData())
			
			if self.inExpUpsellEntrypoint ~= constantsModule.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE then
				self:showPrompt(promptTypeModule.VoiceConsentDeclinedToast)
			end
		end elseif p13 == promptTypeModule.DevicePermissionsModal then function()
			-- upvalues: self (ref)
			self.Analytics:reportDevicePermissionsModalEvent("Denied", self:GetSessionId(), self:GetInExpUpsellAnalyticsData())
		end else nil
	}), coreGuiService, "RobloxVoiceChatPromptGui")
end

function t:showPrompt(p14, p15)
	-- upvalues: getFFlagEnableVoicePromptReasonTextModule (ref), name (ref)
	if getFFlagEnableVoicePromptReasonTextModule() then
		self.errorText = p15 or nil
	end
	self:createPromptInstance(function()
		-- upvalues: name (copy), p14 (ref), self (ref)
		name:debug("Show Prompt: {}", p14)
		self.promptSignal:fire(p14)
	end, p14)
end

function t:showJoinVoicePrompt()
	-- upvalues: promptTypeModule (ref), appStorageService (ref), constantsModule (ref)
	self:showPrompt(promptTypeModule.UnifiedJoinVoiceToast)
	pcall(function()
		-- upvalues: appStorageService (copy), constantsModule (copy)
		appStorageService:SetItem(constantsModule.VOICE_WITH_TC_TOAST_KEY, "true")
		appStorageService:Flush()
	end)
end

function t:CheckAndShowPermissionPrompt()
	-- upvalues: permissionsProtocol (ref), promptTypeModule (ref), promiseModule (ref), getFFlagEnableUniveralVoiceToastsModule (ref)
	local function showPrompt()
		-- upvalues: self (ref), permissionsProtocol (copy), promptTypeModule (copy), promiseModule (copy)
		return if self.voiceEnabled or self.userEligible then self.PermissionsService:hasPermissions({ permissionsProtocol.Permissions.MICROPHONE_ACCESS }):andThen(function(p14)
			-- upvalues: permissionsProtocol (copy), self (copy), promptTypeModule (copy)
			if p14 and p14.status == permissionsProtocol.Status.DENIED then
				self:showPrompt(promptTypeModule.Permission)
			end
		end) else promiseModule.resolve()
	end
	
	return if getFFlagEnableUniveralVoiceToastsModule() then showPrompt() else self:asyncInit():andThen(function() end):catch(function()
		-- upvalues: showPrompt (ref)
		return showPrompt()
	end)
end

function t:showDataConsentToast()
	-- upvalues: getFFlagSeamlessVoiceConsentToastPolicy (ref), universalAppPolicyModule (ref), seamlessVoiceStatusModule (ref), constantsModule (ref), promptTypeModule (ref)
	local var17, showDataConsentToast
	local var18 = self:FetchAgeVerificationOverlay()
	local _ = nil
	local _ = nil
	local var19 = if getFFlagSeamlessVoiceConsentToastPolicy() then universalAppPolicyModule.getAppFeaturePolicies().getDisplayCheckboxInVoiceConsent() or false else false
	
	if type(var18) == "table" then
		var17 = if var18.voiceSettings then var18.voiceSettings.seamlessVoiceStatus else seamlessVoiceStatusModule.Invalid
		showDataConsentToast = var18.showDataConsentToast
	else
		showDataConsentToast = false
		var17 = seamlessVoiceStatusModule.Invalid
	end
	if showDataConsentToast and var19 then
		showDataConsentToast = type(self:_GetShowAgeVerificationOverlay()) == "table" and self:_GetShowAgeVerificationOverlay().showDataConsentToast
	end
	if var17 == seamlessVoiceStatusModule.EnabledExistingUser and showDataConsentToast and var19 then
		self:RecordUserSeenModal(constantsModule.MODAL_IDS.DATA_CONSENT_TOAST)
		
		return self:showPrompt(promptTypeModule.VoiceDataConsentOptOutToast)
	end
end

function t:CheckAndShowNotAudiblePrompt()
	-- upvalues: promptTypeModule (ref), promiseModule (ref)
	return if game:GetEngineFeature("VoiceChatSupported") then self:asyncInit():andThen(function()
		-- upvalues: self (ref), promptTypeModule (copy)
		if UserSettings().GameSettings.MasterVolume == 0 then
			self:showPrompt(promptTypeModule.NotAudible)
		end
	end):catch(function() end) else promiseModule.resolve()
end

function t:ShowNotAudiblePromptVoiceChatVolume()
	-- upvalues: fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule (ref), fFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule (ref), promiseModule (ref), voiceVolumeControlsEligibility (ref), voiceChatService (ref), promptTypeModule (ref)
	return if not (not fFlagVoiceVolumeControlsEnableNotAudibleVoiceChatVolumeToastModule or not fFlagVoiceVolumeControlsEnableVoiceChatVolumeSliderModule) then if game:GetEngineFeature("VoiceChatSupported") then self:asyncInit():andThen(function()
		-- upvalues: voiceVolumeControlsEligibility (copy), voiceChatService (copy), self (ref), promptTypeModule (copy)
		if UserSettings().GameSettings.MasterVolume > 0 and voiceVolumeControlsEligibility.isVoiceChatVolumeSliderVisible(true, voiceChatService.UseNewAudioApi) and UserSettings().GameSettings.VoiceChatVolume == 0 then
			self:showPrompt(promptTypeModule.NotAudibleVoiceChatVolume)
		end
	end):catch(function() end) else promiseModule.resolve() else promiseModule.resolve()
end

function t:InitialJoinFailedPrompt()
	-- upvalues: name (ref), getFFlagVoiceChatClientRewriteMasterLua (ref), promptTypeModule (ref)
	name:debug("JoinByGroupIdToken returns false")
	
	if not getFFlagVoiceChatClientRewriteMasterLua then
		self:showPrompt(promptTypeModule.Retry)
	end
end

function t:ShowVoiceToxicityFeedbackToast()
	-- upvalues: name (ref), promptTypeModule (ref)
	name:debug("Sending feedback toast")
	self:showPrompt(promptTypeModule.VoiceToxicityFeedbackToast)
end

function t:GetNudgeAnalyticsData()
	-- upvalues: playersService (ref)
	return playersService.LocalPlayer.UserId, self:GetSessionId()
end

function t.GetInExpUpsellAnalyticsData(_)
	-- upvalues: rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref), rbxAnalyticsService (ref)
	return game.GameId, game.PlaceId, if rbxAnalyticsServiceExposePlaySessionIdEngineFeature then rbxAnalyticsService:GetPlaySessionId() else ""
end

function t:reportBanMessage(p14)
	-- upvalues: playersService (ref)
	self.Analytics:reportBanMessageEventV2(p14, self.banReason, playersService.LocalPlayer.UserId, if self.service then self.previousSessionId else "")
end

function t:reportJoinVoiceUpsellEvent(p14, p15, p16)
	-- upvalues: rbxAnalyticsService (ref), fFlagVoiceRewarmTelemetry (ref)
	local playSessionId = rbxAnalyticsService:GetPlaySessionId()
	
	if fFlagVoiceRewarmTelemetry then
		self.Analytics:reportJoinVoiceUpsellEvent(p14, playSessionId, self:UserVoiceEnabled(), p15, p16)
		
		return
	end
	self.Analytics:reportJoinVoiceUpsellEvent(p14, playSessionId, self:UserVoiceEnabled())
end

function t:SetAndSyncActive(p14, p15)
	self.coreVoiceManager:SetAndSyncActive(p14, p15)
end

function t:CreateAudioDeviceData(p14)
	return self.coreVoiceManager:CreateAudioDeviceData(p14)
end

function t:onInstanceAdded(p14)
	return self.coreVoiceManager:onInstanceAdded(p14)
end

function t:UpdateAudioDeviceInputDebugger()
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

function t:AddReverseNudgeToxicUser(p14, p15, p16)
	-- upvalues: getFIntVoiceReverseNudgeUXDisplayTimeSecondsModule (ref)
	p15(p14, "iconColorChange")
	local var17 = self.reverseNudgeToxicUserRemovalCallbacks[p14]
	
	if var17 ~= nil then
		task.cancel(var17)
	end
	self.reverseNudgeToxicUserRemovalCallbacks[p14] = task.delay(getFIntVoiceReverseNudgeUXDisplayTimeSecondsModule(), function()
		-- upvalues: p16 (ref), p14 (ref), self (ref)
		p16(p14)
		self.reverseNudgeToxicUserRemovalCallbacks[p14] = nil
	end)
end

function t:onInstanceRemove(p14)
	return self.coreVoiceManager:onInstanceRemove(p14)
end

function t:hookupAudioDeviceInputListener()
	return self.coreVoiceManager:hookupAudioDeviceInputListener()
end

function t:ToggleMutePlayer(p14, p15)
	return self.coreVoiceManager:ToggleMutePlayer(p14, p15)
end

function t:MuteAll(p14, p15)
	return self.coreVoiceManager:MuteAll(p14, p15)
end

function t:ToggleMuteSome(p14, p15, p16, p17)
	return self.coreVoiceManager:ToggleMuteSome(p14, p15, p16, p17)
end

function t:FireMuteNonFriendsEvent()
	self.mutedNonFriends:Fire()
end

function t:EnsureCorrectMuteState(p14, p15)
	-- upvalues: voiceChatService (ref), enableMutedByLocalUserEngineFeature (ref), playersService (ref)
	local t = {}
	
	for i, v in p14 do
		local var17 = self.participants[tostring(v)]
		
		if var17 and var17.isMutedLocally ~= p15 then
			if voiceChatService.UseNewAudioApi then
				t[v] = true
				self.mutedPlayers[v] = p15
			else
				self.service:SubscribePause(v, p15)
			end
			var17.isMutedLocally = p15
			self.participantsUpdate:Fire(self.participants)
		end
	end
	if voiceChatService.UseNewAudioApi then
		for i_1 in self.audioDevices do
			if i_1.Player and t[i_1.Player.UserId] then
				if enableMutedByLocalUserEngineFeature and i_1.Player ~= playersService.LocalPlayer then
					i_1.MutedByLocalUser = p15
				else
					i_1.Active = not p15
				end
			end
		end
	end
end

function t:FireUserAgencySelectedEvent(p16)
	self.userAgencySelected:Fire(p16)
end

function t.ParticipantStateToIcon(_, p16, p17)
	-- upvalues: VOICE_STATE (ref)
	local INACTIVE = VOICE_STATE.INACTIVE
	
	if not p16.subscriptionCompleted then
		INACTIVE = VOICE_STATE.CONNECTING
	elseif p16.isMutedLocally then
		INACTIVE = VOICE_STATE.LOCAL_MUTED
	elseif p16.isMuted then
		INACTIVE = VOICE_STATE.MUTED
	elseif p16.isSignalActive then
		INACTIVE = VOICE_STATE.TALKING
	end
	return getIcon(INACTIVE, p17)
end

function t.VoiceStateToIcon(_, p16, p17, p18)
	return getIcon(p16, p17, p18)
end

function t.GetIcon(_, p16, p17)
	return getIconSrc(p16, p17)
end

function t:JoinVoice(p16)
	-- upvalues: fFlagVoiceRewarmTelemetry (ref), showJoinVoiceWhenDisconnectedV3 (ref), name (ref), guardVoiceInExpUpsellVariant (ref), constantsModule (ref), getFFlagEnableConnectDisconnectInSettingsAndChromeModule (ref), getFFlagNonVoiceFTUX (ref), appStorageService (ref), getFFlagEnableVrVoiceParity (ref), promiseModule (ref), seamlessVoiceV2JoinVoiceToast (ref), enableVerifiedCheckViaOverlay (ref), getFFlagDisableConsentModalForExistingUsersModule (ref), promptTypeModule (ref), getFFlagIntegratePhoneUpsellJoinVoice (ref), getFFlagEnableInExpPhoneVoiceUpsellEntrypoints (ref), getOverlayStore (ref), overlayTypes (ref), socialUpsellType (ref), enum (ref), sendUserConnectionStatus (ref)
	local joinVoiceButtonContext = nil
	local var18 = nil
	
	if fFlagVoiceRewarmTelemetry then
		joinVoiceButtonContext = self.joinVoiceButtonContext
		self.joinVoiceButtonContext = nil
	end
	if showJoinVoiceWhenDisconnectedV3 then
		name:debug("Consuming voice re-warm cookie on JoinVoice")
		self:SetVoiceRewarmCookie("true")
	end
	local var19 = self:FetchAgeVerificationOverlay()
	local var20 = (if guardVoiceInExpUpsellVariant then if type(var19) == "table" then var19.showVoiceInExperienceUpsellVariant else nil else var19.showVoiceInExperienceUpsellVariant) or constantsModule.IN_EXP_UPSELL_VARIANT.VARIANT3
	
	if not fFlagVoiceRewarmTelemetry then
		self.Analytics:reportJoinVoiceButtonEvent("clicked", self:GetInExpUpsellAnalyticsData())
	end
	if getFFlagEnableConnectDisconnectInSettingsAndChromeModule() and self.previousGroupId then
		if fFlagVoiceRewarmTelemetry then
			var18 = "RejoinPreviousChannel"
		end
		self:RejoinPreviousChannel()
		self:showJoinVoicePrompt()
		self:ShowVoiceUI()
		self:SetVoiceConnectCookieValue(true)
	elseif getFFlagNonVoiceFTUX() and self.isShowingFTUX then
		if fFlagVoiceRewarmTelemetry then
			var18 = "ExitFtux"
		end
		self:HideFTUX(appStorageService)
	elseif self.deniedMicPermissions then
		if fFlagVoiceRewarmTelemetry then
			var18 = "MicPermissionPrompt"
		end
		if getFFlagEnableVrVoiceParity() then
			self:CheckAndShowPermissionPrompt()
		else
			self:CheckAndShowPermissionPrompt():finallyReturn(promiseModule.reject())
		end
	elseif getFFlagEnableConnectDisconnectInSettingsAndChromeModule() and self:UserVoiceEnabled() then
		if fFlagVoiceRewarmTelemetry then
			var18 = "FirstJoinSession"
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
			var18 = "ConsentModal"
		end
		if getFFlagDisableConsentModalForExistingUsersModule() and self:IsSeamlessVoice() then
			self:EnableVoice()
		else
			self:SetInExpUpsellEntrypoint(constantsModule.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE)
			self:showPrompt(self:GetInExpUpsellPromptFromEnum(var20))
		end
	elseif self:EligibleForAgeCheckToast() then
		if fFlagVoiceRewarmTelemetry then
			var18 = "AgeCheckToast"
		end
		self:showPrompt(promptTypeModule.AgeCheckForVoiceToast)
	elseif getFFlagIntegratePhoneUpsellJoinVoice() and getFFlagEnableInExpPhoneVoiceUpsellEntrypoints() and (not self:UserVoiceEnabled() and self:FetchPhoneVerificationUpsell(constantsModule.IN_EXP_PHONE_UPSELL_IXP_LAYER) == constantsModule.PHONE_UPSELL_VALUE_PROP.VoiceChat) then
		if fFlagVoiceRewarmTelemetry then
			var18 = "PhoneUpsell"
		end
		if p16 then
			p16:SetVisibility(false, true)
		end
		self:ShowInExperiencePhoneVoiceUpsell(constantsModule.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE, constantsModule.IN_EXP_PHONE_UPSELL_IXP_LAYER)
	elseif self:EligibleForFaeUpsell() then
		if fFlagVoiceRewarmTelemetry then
			var18 = "FaeUpsell"
		end
		if self.pendingConnectionSource == nil then
			self.pendingConnectionSource = constantsModule.VOICE_CONNECTION_SOURCE.IN_EXPERIENCE
		end
		self.coreVoiceManager:OptUserToJoinVoice()
		local var21 = getOverlayStore(false)
		
		if not fFlagVoiceRewarmTelemetry then
			self:reportJoinVoiceUpsellEvent("Click")
		end
		var21.setCurrentOverlay(overlayTypes.SocialUpsell, {
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
		self.Analytics:reportJoinVoiceButtonEvent("clicked", inExpUpsellAnalyticsData, inExpUpsellAnalyticsData_1, inExpUpsellAnalyticsData_2, joinVoiceButtonContext, var18)
		self:reportJoinVoiceUpsellEvent("Click", joinVoiceButtonContext, var18)
	end
	if sendUserConnectionStatus and self:IsSeamlessVoice() then
		task.spawn(function()
			-- upvalues: self (ref)
			self.coreVoiceManager:PostUserVoiceConnectionStatus(true)
		end)
	end
end

function t:EligibleForFaeUpsell()
	-- upvalues: getFFlagEnableVoiceUxUpdates (ref), fFlagTestDeviceForFAEUpsell (ref), deviceMeetsRequirementsForFAE (ref)
	local var18 = getFFlagEnableVoiceUxUpdates()
	
	if var18 then
		var18 = self.coreVoiceManager:EligibleForFaeUpsell()
		
		if var18 then
			var18 = self.AvatarChatService:deviceMeetsRequirementsForFeature(Enum.DeviceFeatureType.InExperienceFAE)
			
			if var18 then
				if fFlagTestDeviceForFAEUpsell then
					return deviceMeetsRequirementsForFAE()
				end
				var18 = true
			end
		end
	end
	return var18
end

function t:EligibleForAgeCheckToast()
	return self.coreVoiceManager:EligibleForAgeCheckToast()
end

function t:ShouldShowJoinVoice()
	-- upvalues: getFFlagEnableVoiceUxUpdates (ref), fFlagVoiceRewarmTelemetry (ref), voiceChatCoreModule (ref), showJoinVoiceWhenDisconnectedV3 (ref), getFFlagOnlyEnableJoinVoiceInVoiceEnabledUniversesModule (ref), getFFlagEnableConnectDisconnectInSettingsAndChromeModule (ref), alwaysSetJoinVoiceButtonContext (ref), getFFlagIntegratePhoneUpsellJoinVoice (ref), getFFlagEnableInExpPhoneVoiceUpsellEntrypoints (ref), constantsModule (ref)
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
				if alwaysSetJoinVoiceButtonContext then
					self.joinVoiceButtonContext = "AgeCheckToast"
				end
				return true
			else
				local var18 = self:UserInInExperienceUpsellTreatment()
				local var19 = self:UserOnlyEligibleForVoice() or self:UserVoiceEnabled()
				
				if getFFlagIntegratePhoneUpsellJoinVoice() and getFFlagEnableInExpPhoneVoiceUpsellEntrypoints() and (not var19 and not self:UserVoiceEnabled()) and self:FetchPhoneVerificationUpsell(constantsModule.IN_EXP_PHONE_UPSELL_IXP_LAYER) == constantsModule.PHONE_UPSELL_VALUE_PROP.VoiceChat then
					if alwaysSetJoinVoiceButtonContext then
						self.joinVoiceButtonContext = "PhoneUpsell"
					end
					return true
				elseif alwaysSetJoinVoiceButtonContext and var18 and var19 then
					self.joinVoiceButtonContext = "InExpUpsell"
				end
				return var18 and var19
			end
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

function t:ShouldShowJoinVoiceOnDisconnect()
	return self.coreVoiceManager:ShouldShowJoinVoiceOnDisconnect()
end

function t:IsSeamlessVoice()
	-- upvalues: getFFlagCheckUniversePlaceBeforeSuspending (ref), name (ref), seamlessVoiceStatusModule (ref)
	if getFFlagCheckUniversePlaceBeforeSuspending() then
		return self.coreVoiceManager:IsSeamlessVoice()
	end
	local var18 = self:FetchAgeVerificationOverlay()
	
	if not var18 or not var18.voiceSettings then
		name:error("VoiceChatServiceManager:IsSeamlessVoice() - ageVerificationOverlayData or voiceSettings is nil")
		
		return false
	end
	local seamlessVoiceStatus = var18.voiceSettings.seamlessVoiceStatus
	
	return if seamlessVoiceStatus ~= seamlessVoiceStatusModule.EnabledExistingUser then seamlessVoiceStatus == seamlessVoiceStatusModule.EnabledNewUser else true
end

function t:HasSeamlessVoiceFeature(p16)
	return self.coreVoiceManager:HasSeamlessVoiceFeature(p16)
end

function t:IsNewSeamlessVoiceUserDisconnect()
	return self.coreVoiceManager:IsNewSeamlessVoiceUserDisconnect()
end

function t:GetConnectDisconnectButtonAnalyticsData(p16)
	-- upvalues: rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref), rbxAnalyticsService (ref)
	local list = {
		game.GameId,
		game.PlaceId,
		if rbxAnalyticsServiceExposePlaySessionIdEngineFeature then rbxAnalyticsService:GetPlaySessionId() else ""
	}
	
	if p16 and self:getService() then
		table.insert(list, self:GetSessionId())
	end
	return unpack(list)
end

function t:GetConnectDisconnectAnalyticsData()
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

function t:Leave()
	-- upvalues: getFFlagDisconnectToastClientRewrite (ref), getFFlagEnableConnectDisconnectInSettingsAndChromeModule (ref), getFFlagVoiceChatClientRewriteMasterLua (ref), sendUserConnectionStatus (ref)
	self:ensureInitialized("leave")
	
	if getFFlagDisconnectToastClientRewrite() and getFFlagEnableConnectDisconnectInSettingsAndChromeModule() then
		self:SetVoiceConnectCookieValue(false)
	end
	self.Analytics:reportConnectDisconnectEvents("voiceDisconnectEvent", self:GetConnectDisconnectAnalyticsData())
	local groupId = self.service:GetGroupId()
	local var18 = self.service:IsPublishPaused()
	
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
	self.previousMutedState = var18
	
	if not getFFlagDisconnectToastClientRewrite() and getFFlagEnableConnectDisconnectInSettingsAndChromeModule() then
		self:SetVoiceConnectCookieValue(false)
	end
	if sendUserConnectionStatus and self:IsSeamlessVoice() then
		task.spawn(function()
			-- upvalues: self (ref)
			self.coreVoiceManager:PostUserVoiceConnectionStatus(false)
		end)
	end
end

function t.GetVoiceStateFromEnum(_, p16)
	-- upvalues: t_1 (write), VOICE_STATE (ref)
	if not t_1[p16] then
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
	return t_1[p16]
end

function t.GetInExpUpsellPromptFromEnum(_, p16)
	-- upvalues: t_2 (ref)
	return t_2[p16]
end

function t:getRecentUsersInteractionData()
	return self.coreVoiceManager:getRecentUsersInteractionData()
end

function t:_setRecentUserState(p16, p17)
	return self.coreVoiceManager:_setRecentUserState(p16, p17)
end

function t:_updateRecentUsersInteractionData()
	return self.coreVoiceManager:_updateRecentUsersInteractionData()
end

function t:SetupParticipantListeners()
	return self.coreVoiceManager:SetupParticipantListeners()
end

function t:Disconnect()
	self.coreVoiceManager:Disconnect()
	self.coreVoiceManager:unsubscribeAll()
end

function t:GetSendMuteEvent()
	return self.coreVoiceManager:GetSendMuteEvent()
end

function t:ToggleMic(p16)
	return self.coreVoiceManager:ToggleMic(p16)
end

function t:SubscribeRetry(p16)
	-- upvalues: name (ref)
	self:ensureInitialized("subscribe retry")
	name:debug("Attempting to retry connection to user: {}", "..." .. string.sub(tostring(p16), -4))
	self.service:SubscribeRetry(p16)
end

function t:JoinByGroupIdToken(p16, p17)
	return self.coreVoiceManager:JoinByGroupIdToken(p16, p17)
end

function t:RejoinPreviousChannel()
	-- upvalues: name (ref), getFFlagVoiceChatClientRewriteMasterLua (ref)
	local previousGroupId = self.previousGroupId
	local previousMutedState = self.previousMutedState
	name:debug("Rejoining previous channel {} with mute status {}", previousGroupId, previousMutedState)
	pcall(function()
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

function t.SwitchDevice(_, p16, p17, p18)
	-- upvalues: VOICE_CHAT_DEVICE_TYPE (ref), soundService (ref), name (ref)
	if p16 == VOICE_CHAT_DEVICE_TYPE.Input then
		soundService:SetInputDevice(p17, p18)
		name:info("[InputDeviceSelection] Setting SS Mic Device To {} {}", p17, p18)
		
		return
	end
	soundService:SetOutputDevice(p17, p18)
	name:info("[OutputDeviceSelection] Setting SS Speaker Device To {} {}", p17, p18)
end

function t.GetDevices(_, p16)
	-- upvalues: VOICE_CHAT_DEVICE_TYPE (ref), soundService (ref)
	local ok, status, var18, var19 = pcall(function()
		-- upvalues: p16 (ref), VOICE_CHAT_DEVICE_TYPE (copy), soundService (copy)
		return if p16 == VOICE_CHAT_DEVICE_TYPE.Input then soundService:GetInputDevices() else soundService:GetOutputDevices()
	end)
	
	return ok, status, var18, var19
end

function t:VoiceChatAvailable()
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

function t:VoiceChatEnded()
	-- upvalues: voiceEndedCheckDisregardIdleState (ref)
	if not self.service then
		return true
	end
	local voiceChatState = self.service.VoiceChatState
	
	return if voiceEndedCheckDisregardIdleState then voiceChatState == Enum.VoiceChatState.Ended elseif voiceChatState ~= Enum.VoiceChatState.Ended then voiceChatState == Enum.VoiceChatState.Idle else true
end

function t:UnmountPrompt()
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