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
local voiceEndedCheckDisregardIdleState = game:DefineFastFlag("VoiceEndedCheckDisregardIdleState", false)
local disableLeaveToastInStudio = game:DefineFastFlag("DisableLeaveToastInStudio", false)
local enableVerifiedCheckViaOverlay = game:DefineFastFlag("EnableVerifiedCheckViaOverlay", false)
local getFIntThrottleParticipantsUpdateMs = voiceChatCoreModule.Flags.GetFIntThrottleParticipantsUpdateMs
local getFFlagEnableConnectDisconnectInSettingsAndChromeModule = require(robloxGui.Modules.Flags.GetFFlagEnableConnectDisconnectInSettingsAndChrome)
local voiceUIImprovementsIXPLayerName = game:DefineFastString("VoiceUIImprovementsIXPLayerName", "Voice.Exposure")
local throttleParticipantsUpdateIXPLayerValue = game:DefineFastString("ThrottleParticipantsUpdateIXPLayerValue", "ThrottleParticipantsUpdate")
local seamlessVoiceSTUXDisplayCount = game:DefineFastInt("SeamlessVoiceSTUXDisplayCount", 3)
local getFFlagEnableInExpPhoneVoiceUpsellEntrypoints = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagEnableInExpPhoneVoiceUpsellEntrypoints
local getFFlagShowDevicePermissionsModal = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagShowDevicePermissionsModal
local fFlagEnableRetryForLinkingProtocolFetch = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableRetryForLinkingProtocolFetch
local showJoinVoiceWhenDisconnectedV3 = game:DefineFastFlag("ShowJoinVoiceWhenDisconnectedV3", false)
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
local getFFlagEnableSeamlessVoiceV2 = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagEnableSeamlessVoiceV2
local getFFlagDisconnectToastClientRewrite = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagDisconnectToastClientRewrite
local getFFlagEnableVrVoiceParity = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagEnableVrVoiceParity
local analytics = voiceChatCoreModule.Analytics
local httpService = game:GetService("HttpService")
local httpRbxApiService = game:GetService("HttpRbxApiService")
local blockingUtilityModule = require(corePackagesService.Workspace.Packages.BlockingUtility)
local microphoneDevicePermissionsLoggingModule = require(robloxGui.Modules.Settings.Resources.MicrophoneDevicePermissionsLogging)
local var58 = if getFFlagAvatarChatServiceEnabled() then game:GetService("AvatarChatService") else nil
local var59 = if getFFlagEnableVoiceChatMuteForVideoCaptures() then game:GetService("CaptureService") else nil
local expChatModule = require(corePackagesService.Workspace.Packages.ExpChat)
local default_2 = require(corePackagesService.Workspace.Packages.LinkingProtocol).LinkingProtocol.default
local settingsRoute = require(corePackagesService.Workspace.Packages.LinkingProtocol).Enums.SettingsRoute
local var61 = if getFFlagEnableInExpPhoneVoiceUpsellEntrypoints() then require(corePackagesService.Workspace.Packages.PhoneUpsell).PhoneUpsellController else nil
local var62 = if getFFlagEnableInExpPhoneVoiceUpsellEntrypoints() then require(corePackagesService.Workspace.Packages.PhoneUpsell).Http.Requests.PostPhoneUpsellDisplayed else nil
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
local VOICE_STATE = constants.VOICE_STATE
local VOICE_CHAT_DEVICE_TYPE = constants.VOICE_CHAT_DEVICE_TYPE
local VOICE_CHAT_AVAILABILITY = constants.VOICE_CHAT_AVAILABILITY
local MIN_VOICE_CHAT_API_VERSION = constants.MIN_VOICE_CHAT_API_VERSION
local WATCHED_MESSAGE_TYPES = constants.WATCHED_MESSAGE_TYPES
local PERMISSION_STATE = constants.PERMISSION_STATE
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
	permissionState = if getFFlagJoinWithoutMicPermissions() then PERMISSION_STATE.IDLE else nil,
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
	AvatarChatService = var58,
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
	CaptureService = var59
}
local var66 = luauPolyfillModule.Set.new({
	"available", "participants", "recentUsersInteractionData", "permissionPromise",
	"canUseServicePromise", "localMuted", "isTalking", "previousGroupId",
	"previousMutedState", "userEligible", "sendMuteEvent", "mutedPlayers",
	"SignalREventTable", "audioDevices", "service", "previousSessionId",
	"voiceEnabled", "permissionState", "BlockStatusChanged", "isInCall",
	"callMutedState", "attemptVoiceRejoin", "VoiceJoinProgressChanged",
	"participantJoined", "participantLeft", "participantsUpdate", "muteChanged",
	"audioDeviceInputAdded", "talkingChanged", "canUseServiceResult"
})
var66:add("_mutedAnyone")
var66:add("muteAllChanged")
local t_1 = {}
local t_2 = {
	[constantsModule.IN_EXP_UPSELL_VARIANT.VARIANT1] = promptTypeModule.VoiceConsentModalV1,
	[constantsModule.IN_EXP_UPSELL_VARIANT.VARIANT2] = promptTypeModule.VoiceConsentModalV2,
	[constantsModule.IN_EXP_UPSELL_VARIANT.VARIANT3] = promptTypeModule.VoiceConsentModalV3
}

function getIconSrc(p0, p1) --[[ line: 344 ]]
	return "rbxasset://textures/ui/VoiceChat/" .. (if p1 then p1 .. "/" else "") .. p0 .. ".png"
end

function getIcon(p2, p3, p4) --[[ line: 349 ]]
	-- upvalues: VOICE_STATE (ref)
	return if p2 == VOICE_STATE.MUTED then getIconSrc("Muted", p4) elseif p2 == VOICE_STATE.CONNECTING then getIconSrc("Connecting", p4) elseif p2 == VOICE_STATE.INACTIVE then getIconSrc("Blank", p4) elseif p2 == VOICE_STATE.TALKING then p3 and getIconSrc("Unmuted" .. tostring(math.floor(0.5 + 5 * (p3 or math.random())) * 20), p4) or getIconSrc("Blank", p4) else getIconSrc("Error", p4)
end

t.__index = t

function t:__index(p5) --[[ line: 367 ]]
	-- upvalues: var66 (ref), t (ref)
	return if var66:has(p5) then self.coreVoiceManager[p5] else rawget(t, p5)
end

function t:__newindex(p6, p7) --[[ line: 374 ]]
	-- upvalues: var66 (ref), t (ref)
	if var66:has(p6) then
		self.coreVoiceManager[p6] = p7
		
		return
	end
	rawset(t, p6, p7)
end

function t.new(p8, p9, p10, p11, p12, p13, p14, p15, p16, p17) --[[ line: 382 ]]
	-- upvalues: analytics (ref), getCamMicPermissionsModule (ref), t (ref), WATCHED_MESSAGE_TYPES (ref), getFIntThrottleParticipantsUpdateMs (ref), IXPServiceWrapper (ref), voiceUIImprovementsIXPLayerName (ref), throttleParticipantsUpdateIXPLayerValue (ref), getFFlagExpChatUseVoiceParticipantsStore (ref), expChatModule (ref), getFFlagEnableUniveralVoiceToastsModule (ref), getFFlagEnableSeamlessVoiceV2 (ref), debugSkipVoicePermissionCheck (ref), fFlagDebugShowAudioDeviceInputDebugger (ref), fFlagEnablePartyVoiceChangersInLua (ref), microphoneDevicePermissionsLoggingModule (ref), VOICE_JOIN_PROGRESS (ref), constantsModule (ref), getFFlagEnableConnectDisconnectInSettingsAndChromeModule (ref), disableLeaveToastInStudio (ref), promptTypeModule (ref), debugSimulateConnectDisconnect (ref), name (ref), getFFlagEnableVoiceTrustedConnectionsToastsModule (ref), appStorageService (ref), getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (ref), voiceNudgeUseNewDACopyModule (ref), getFFlagShowDevicePermissionsModal (ref), getFFlagEnableSeamlessVoiceDataConsentToastModule (ref), getFFlagNonVoiceFTUX (ref), getFFlagUpdateVoiceConnectionToastsModule (ref), seamlessVoiceV2JoinVoiceToast (ref), getFFlagEnableVoiceChatMuteForVideoCaptures (ref), getFFlagEnableCrossExperienceVoiceCaptureMute (ref), default_1 (ref)
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
		local ok, status = pcall(function() --[[ line: 423 ]]
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
	local var70 = false
	local eventConnection = tbl.attemptVoiceRejoin.Event:Connect(function() --[[ line: 449 ]]
		-- upvalues: var70 (write)
		var70 = true
	end)
	local var72 = if getFFlagExpChatUseVoiceParticipantsStore() then expChatModule.Stores.GetVoiceStore(false) else nil
	tbl.coreVoiceManager:subscribe("GetPermissions", function(p18, p19, p20, p21) --[[ line: 456 ]]
		-- upvalues: tbl (ref)
		tbl.getPermissionsFunction(p18, p19, p20, if tbl.inExpUpsellEntrypoint ~= nil then tbl.inExpUpsellEntrypoint else "VoiceChatServiceManager.requestMicPermission", p21)
	end)
	tbl.coreVoiceManager:subscribe("OnVoiceParticipantRemoved", function(p22) --[[ line: 463 ]]
		-- upvalues: getFFlagExpChatUseVoiceParticipantsStore (copy), var72 (ref), expChatModule (copy)
		if getFFlagExpChatUseVoiceParticipantsStore() then
			var72.handleVoiceParticipantRemoved(p22)
			
			return
		elseif expChatModule.Events.VoiceParticipantRemoved then
			expChatModule.Events.VoiceParticipantRemoved(tostring(p22))
		end
	end)
	tbl.coreVoiceManager:subscribe("OnVoiceParticipantAdded", function(p23) --[[ line: 470 ]]
		-- upvalues: getFFlagExpChatUseVoiceParticipantsStore (copy), var72 (ref), expChatModule (copy)
		if getFFlagExpChatUseVoiceParticipantsStore() then
			var72.handleVoiceParticipantAdded(p23)
			
			return
		elseif expChatModule.Events.VoiceParticipantAdded then
			expChatModule.Events.VoiceParticipantAdded(tostring(p23))
		end
	end)
	tbl.coreVoiceManager:subscribe("OnVoiceParticipantToggleMuted", function(p24, p25) --[[ line: 477 ]]
		-- upvalues: expChatModule (copy)
		if expChatModule.Events.VoiceParticipantToggleMuted then
			expChatModule.Events.VoiceParticipantToggleMuted(tostring(p24), p25)
		end
	end)
	tbl.coreVoiceManager:subscribe("OnUserAndPlaceCanUseVoiceResolved", function(p26, p27) --[[ line: 482 ]]
		-- upvalues: tbl (ref)
		tbl:_onUserAndPlaceCanUseVoiceResolved(p26, p27)
	end)
	tbl.coreVoiceManager:subscribe("OnRequestMicPermissionResolved", function() --[[ line: 485 ]]
		-- upvalues: getFFlagEnableUniveralVoiceToastsModule (copy), tbl (ref)
		if getFFlagEnableUniveralVoiceToastsModule() then
			return tbl:CheckAndShowNotAudiblePrompt()
		end
	end)
	tbl.coreVoiceManager:subscribe("OnRequestMicPermissionRejected", function() --[[ line: 490 ]]
		-- upvalues: getFFlagEnableSeamlessVoiceV2 (copy), tbl (ref), getFFlagEnableUniveralVoiceToastsModule (copy), debugSkipVoicePermissionCheck (copy)
		if getFFlagEnableSeamlessVoiceV2() and tbl:IsSeamlessVoice() then
			tbl.deniedMicPermissions = true
		end
		if getFFlagEnableUniveralVoiceToastsModule() and not debugSkipVoicePermissionCheck then
			return tbl:CheckAndShowPermissionPrompt()
		end
	end)
	
	if fFlagDebugShowAudioDeviceInputDebugger then
		tbl.coreVoiceManager:subscribe("OnDevicePlayerChanged", function() --[[ line: 501 ]]
			-- upvalues: tbl (ref)
			tbl:UpdateAudioDeviceInputDebugger()
		end)
		tbl.coreVoiceManager:subscribe("OnDeviceActiveChanged", function() --[[ line: 504 ]]
			-- upvalues: tbl (ref)
			tbl:UpdateAudioDeviceInputDebugger()
		end)
		tbl.coreVoiceManager:subscribe("OnDeviceMuteChanged", function() --[[ line: 507 ]]
			-- upvalues: tbl (ref)
			tbl:UpdateAudioDeviceInputDebugger()
		end)
		
		if fFlagEnablePartyVoiceChangersInLua then
			tbl.coreVoiceManager:subscribe("OnVoiceChangerChanged", function() --[[ line: 511 ]]
				-- upvalues: tbl (ref)
				tbl:UpdateAudioDeviceInputDebugger()
			end)
		end
		tbl.coreVoiceManager:subscribe("OnPlayerMuted", function() --[[ line: 515 ]]
			-- upvalues: tbl (ref)
			tbl:UpdateAudioDeviceInputDebugger()
		end)
		tbl.coreVoiceManager:subscribe("OnAudioDeviceInputAdded", function() --[[ line: 518 ]]
			-- upvalues: tbl (ref)
			tbl:UpdateAudioDeviceInputDebugger()
		end)
		tbl.coreVoiceManager:subscribe("OnAudioDeviceInputRemoved", function() --[[ line: 521 ]]
			-- upvalues: tbl (ref)
			tbl:UpdateAudioDeviceInputDebugger()
		end)
		tbl.coreVoiceManager:subscribe("OnDeviceMutedByLocalUserChanged", function() --[[ line: 524 ]]
			-- upvalues: tbl (ref)
			tbl:UpdateAudioDeviceInputDebugger()
		end)
	end
	tbl.coreVoiceManager:subscribe("OnStateChanged", function(_, p28) --[[ line: 528 ]]
		-- upvalues: microphoneDevicePermissionsLoggingModule (copy), tbl (ref), VOICE_JOIN_PROGRESS (copy), constantsModule (copy), var70 (write), eventConnection (ref), getFFlagEnableConnectDisconnectInSettingsAndChromeModule (copy), disableLeaveToastInStudio (copy), promptTypeModule (copy)
		microphoneDevicePermissionsLoggingModule:setClientSessionId(tbl.coreVoiceManager:GetSessionId())
		
		if p28 == Enum.VoiceChatState.Ended or p28 == Enum.VoiceChatState.Failed then
			tbl.voiceConnectEventReportedForActiveSession = false
		end
		if p28 == Enum.VoiceChatState.Joined and tbl:GetVoiceJoinProgress() == VOICE_JOIN_PROGRESS.Idle and not tbl.voiceConnectEventReportedForActiveSession then
			local connectDisconnectAnalyticsData = tbl:GetConnectDisconnectAnalyticsData()
			connectDisconnectAnalyticsData.connectionSource = constantsModule.VOICE_CONNECTION_SOURCE.AUTO_CONNECT
			tbl.pendingConnectionSource = nil
			tbl.Analytics:reportConnectDisconnectEvents("voiceConnectEvent", connectDisconnectAnalyticsData)
			tbl.voiceConnectEventReportedForActiveSession = true
			var70 = false
			eventConnection:Disconnect()
		end
		local var74 = p28 == Enum.VoiceChatState.Ended
		
		if var74 then
			local connectDisconnectAnalyticsData = tbl:GetConnectDisconnectAnalyticsData()
			connectDisconnectAnalyticsData.disconnectReason = tbl.pendingDisconnectReason or constantsModule.VOICE_DISCONNECT_REASON.SYSTEM
			tbl.Analytics:reportConnectDisconnectEvents("voiceDisconnectReasonEvent", connectDisconnectAnalyticsData)
			tbl.pendingDisconnectReason = nil
		end
		if var74 and tbl.bannedUntil == nil then
			if not getFFlagEnableConnectDisconnectInSettingsAndChromeModule() then
				tbl:HideVoiceUI()
			end
			if disableLeaveToastInStudio and tbl.runService:IsStudio() then return end
			tbl:showPrompt(promptTypeModule.LeaveVoice)
		end
	end)
	tbl.coreVoiceManager:subscribe("OnVoiceChatServiceInitialized", function() --[[ line: 567 ]]
		-- upvalues: tbl (ref), debugSimulateConnectDisconnect (copy), name (copy), getFFlagEnableVoiceTrustedConnectionsToastsModule (copy), appStorageService (copy), constantsModule (copy), promptTypeModule (copy)
		tbl:ShowVoiceUI()
		
		if debugSimulateConnectDisconnect then
			name:debug("Simulating join voice")
			tbl:simulateVoiceConnectDisconnect()
		end
		if getFFlagEnableVoiceTrustedConnectionsToastsModule() and not tbl.coreVoiceManager.initializedPostSuspension then
			local ok, status = pcall(function() --[[ line: 575 ]]
				-- upvalues: appStorageService (copy), constantsModule (copy)
				return appStorageService:GetItem(constantsModule.VOICE_WITH_TC_TOAST_KEY) == "true"
			end)
			
			if not (if ok then status else true) then
				tbl:showPrompt(promptTypeModule.UpdateOnAutoJoinToast)
				pcall(function() --[[ line: 582 ]]
					-- upvalues: appStorageService (copy), constantsModule (copy)
					appStorageService:SetItem(constantsModule.VOICE_WITH_TC_TOAST_KEY, "true")
					appStorageService:Flush()
				end)
			end
		end
	end)
	tbl.coreVoiceManager:subscribe("OnInitialJoinFailed", function() --[[ line: 590 ]]
		-- upvalues: tbl (ref)
		tbl:InitialJoinFailedPrompt()
	end)
	tbl.coreVoiceManager:subscribe("OnPlayerModerated", function() --[[ line: 593 ]]
		-- upvalues: tbl (ref), constantsModule (copy)
		tbl.pendingDisconnectReason = constantsModule.VOICE_DISCONNECT_REASON.MODERATED
		tbl:ShowPlayerModeratedMessage()
	end)
	tbl.coreVoiceManager:subscribe("OnRetryRequested", function() --[[ line: 598 ]]
		-- upvalues: tbl (ref), promptTypeModule (copy)
		tbl:showPrompt(promptTypeModule.Retry)
	end)
	tbl.coreVoiceManager:subscribe("OnVoiceToxicityModal", function() --[[ line: 601 ]]
		-- upvalues: name (copy), getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (copy), voiceNudgeUseNewDACopyModule (copy), tbl (ref), promptTypeModule (copy)
		name:debug("Showing Voice Toxicity Modal")
		
		if getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and voiceNudgeUseNewDACopyModule() then
			tbl:showPrompt(promptTypeModule.VoiceToxicityModalV2)
			
			return
		end
		tbl:showPrompt(promptTypeModule.VoiceToxicityModal)
	end)
	tbl.coreVoiceManager:subscribe("OnVoiceToxicityToast", function() --[[ line: 609 ]]
		-- upvalues: name (copy), getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (copy), voiceNudgeUseNewDACopyModule (copy), tbl (ref), promptTypeModule (copy)
		name:debug("Showing Voice Toxicity Toast")
		
		if getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and voiceNudgeUseNewDACopyModule() then
			tbl:showPrompt(promptTypeModule.VoiceToxicityToastV2)
			
			return
		end
		tbl:showPrompt(promptTypeModule.VoiceToxicityToast)
	end)
	tbl.coreVoiceManager:subscribe("OnPermissionRequested", function() --[[ line: 617 ]]
		-- upvalues: getFFlagShowDevicePermissionsModal (copy), tbl (ref), promptTypeModule (copy)
		if getFFlagShowDevicePermissionsModal() then
			tbl:showPrompt(promptTypeModule.DevicePermissionsModal)
			
			return
		end
		tbl:showPrompt(promptTypeModule.Permission)
	end)
	tbl.coreVoiceManager:subscribe("OnShowDataConsentToast", function() --[[ line: 624 ]]
		-- upvalues: getFFlagEnableSeamlessVoiceDataConsentToastModule (copy), tbl (ref)
		if getFFlagEnableSeamlessVoiceDataConsentToastModule() then
			tbl:showDataConsentToast()
		end
	end)
	tbl.coreVoiceManager:subscribe("OnVoiceReverseNudgeIconColorChange", function(p29) --[[ line: 629 ]]
		-- upvalues: name (copy), expChatModule (copy), tbl (ref)
		name:debug("Showing Reverse Nudge Icon Color Change")
		
		if expChatModule.Events.AddReverseNudgeToxicUser and expChatModule.Events.RemoveReverseNudgeToxicUser then
			tbl:AddReverseNudgeToxicUser(p29.toxicUserId, expChatModule.Events.AddReverseNudgeToxicUser, expChatModule.Events.RemoveReverseNudgeToxicUser)
		end
	end)
	tbl.coreVoiceManager.setVoiceUIVisibility.Event:Connect(function(p30) --[[ line: 639 ]]
		-- upvalues: tbl (ref)
		if p30 then
			tbl:ShowVoiceUI()
			
			return
		end
		tbl:HideVoiceUI()
	end)
	tbl.coreVoiceManager:subscribe("OnVoiceJoin", function() --[[ line: 646 ]]
		-- upvalues: getFFlagNonVoiceFTUX (copy), tbl (ref), getFFlagEnableVoiceTrustedConnectionsToastsModule (copy), getFFlagUpdateVoiceConnectionToastsModule (copy), promptTypeModule (copy), getFFlagEnableSeamlessVoiceV2 (copy), seamlessVoiceV2JoinVoiceToast (copy), getFFlagEnableVoiceChatMuteForVideoCaptures (copy), getFFlagEnableCrossExperienceVoiceCaptureMute (copy), default_1 (copy), var70 (write), eventConnection (ref)
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
		elseif getFFlagEnableSeamlessVoiceV2() and tbl:IsSeamlessVoice() then
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
		if var70 then
			local connectDisconnectAnalyticsData = tbl:GetConnectDisconnectAnalyticsData()
			connectDisconnectAnalyticsData.connectionSource = tbl.pendingConnectionSource
			tbl.pendingConnectionSource = nil
			tbl.Analytics:reportConnectDisconnectEvents("voiceConnectEvent", connectDisconnectAnalyticsData)
			tbl.voiceConnectEventReportedForActiveSession = true
			var70 = false
			eventConnection:Disconnect()
		end
	end)
	
	return tbl
end

local function _(p31) --[[ line: 702 | named "shorten" ]]
	return "..." .. string.sub(tostring(p31), -4)
end

local _ = function(p32, p33) --[[ line: 706 | named "bind" ]]
	return function(...) --[[ line: 707 ]]
		-- upvalues: p32 (ref), p33 (ref)
		return p32[p33](p32, ...)
	end
end

function t:subscribe(p34, p35) --[[ line: 712 ]]
	return self.coreVoiceManager:subscribe(p34, p35)
end

function t:_reportJoinFailed(p36, p37) --[[ line: 716 ]]
	return self.coreVoiceManager:_reportJoinFailed(p36, p37)
end

function t:_asyncInit() --[[ line: 720 ]]
	return self.coreVoiceManager:_asyncInit()
end

function t:asyncInit() --[[ line: 724 ]]
	return self.coreVoiceManager:asyncInit()
end

function t:CheckAudioInputExists() --[[ line: 728 ]]
	return self.coreVoiceManager:CheckAudioInputExists()
end

function t:getService() --[[ line: 732 ]]
	return self.service
end

function t:GetMutedAnyone() --[[ line: 736 ]]
	return self.coreVoiceManager:GetMutedAnyone()
end

function t:GetRequest(p38, p39) --[[ line: 740 ]]
	return self.coreVoiceManager:GetRequest(p38, p39)
end

function t.PostRequest(p40, p41, _, p42) --[[ line: 744 ]]
	-- upvalues: httpService (ref)
	local ok, status = pcall(function() --[[ line: 745 ]]
		-- upvalues: p40 (ref), p41 (ref), p42 (ref), httpService (copy)
		return httpService:JSONDecode(p40.HttpRbxApiService:PostAsyncFullUrl(p41, p42, Enum.ThrottlingPriority.Default, Enum.HttpContentType.ApplicationJson, Enum.HttpRequestType.Players))
	end)
	
	return ok and status
end

function t:_GetShowAgeVerificationOverlay(p43) --[[ line: 766 ]]
	return self.coreVoiceManager:_GetShowAgeVerificationOverlay(p43)
end

function t.simulateVoiceConnectDisconnect(p44) --[[ line: 770 ]]
	-- upvalues: debugConnectDisconnectInterval (ref), name (ref)
	task.spawn(function() --[[ line: 771 ]]
		-- upvalues: debugConnectDisconnectInterval (copy), p44 (ref), name (copy)
		while true do
			task.wait(debugConnectDisconnectInterval)
			if p44.voiceUIVisible then
				name:debug("Hiding Voice")
				p44:HideVoiceUI()
			else
				name:debug("Showing Voice")
				p44:ShowVoiceUI()
			end
		end
	end)
end

function t:FetchAgeVerificationOverlay(p45) --[[ line: 785 ]]
	return self.coreVoiceManager:FetchAgeVerificationOverlay(p45)
end

function t:FetchPhoneVerificationUpsell(p46, p47, p48) --[[ line: 789 ]]
	return self.coreVoiceManager:FetchPhoneVerificationUpsell(p46, p47, p48)
end

function t.RecordUserSeenModal(p49, p50) --[[ line: 797 ]]
	-- upvalues: postRecordUserSeenGeneralModal (ref)
	local var77 = "PostRequest"
	
	return postRecordUserSeenGeneralModal(function(...) --[[ line: 707 ]]
		-- upvalues: p49 (ref), var77 (ref)
		return p49[var77](p49, ...)
	end, p50)
end

function t:checkAndUpdateSequence(p51, p52) --[[ line: 801 ]]
	return self.coreVoiceManager:checkAndUpdateSequence(p51, p52)
end

function t:onMissedSequence(p53) --[[ line: 805 ]]
	return self.coreVoiceManager:onMissedSequence(p53)
end

function t:watchSignalR() --[[ line: 809 ]]
	return self.coreVoiceManager:watchSignalR()
end

function t:voicePermissionGranted(p54) --[[ line: 817 ]]
	return self.coreVoiceManager:voicePermissionGranted(p54)
end

function t:GetSignalREvent(p55) --[[ line: 821 ]]
	return self.coreVoiceManager:GetSignalREvent(p55)
end

function t:avatarChatUserAndPlaceSettingsValueOfClientFeatures(p56) --[[ line: 826 ]]
	return self.coreVoiceManager:avatarChatUserAndPlaceSettingsValueOfClientFeatures(p56)
end

function t:resolveAvatarChatUserAndPlaceSettings() --[[ line: 830 ]]
	return self.coreVoiceManager:resolveAvatarChatUserAndPlaceSettings()
end

function t:EnableVoice() --[[ line: 834 ]]
	return self.coreVoiceManager:EnableVoice()
end

function t:_VoiceChatFirstTimeUX(p57) --[[ line: 838 ]]
	-- upvalues: constantsModule (ref), name (ref), getFFlagNonVoiceFTUX (ref), expChatModule (ref), getFFlagEnableFtuxExitOnMuteToggle (ref), seamlessVoiceSTUXDisplayCount (ref), fixSTUXShowingIncorrectly (ref), promptTypeModule (ref)
	local var78 = nil
	local var79 = nil
	
	if not pcall(function() --[[ line: 840 ]]
		-- upvalues: p57 (ref), constantsModule (copy), var78 (write), var79 (write)
		local seamless_voice_stux_keyItem = p57:GetItem(constantsModule.SEAMLESS_VOICE_STUX_KEY)
		var78 = p57:GetItem(constantsModule.SEAMLESS_VOICE_FTUX_KEY) == "true"
		var79 = if seamless_voice_stux_keyItem == nil then 0 else tonumber(seamless_voice_stux_keyItem)
	end) then
		name:warning("Failed to read FTUX/STUX from AppStorage")
		
		return
	end
	name:trace("hasShownFTUX: {}. STUXCount: {}", var78, var79)
	name:debug("Showing FTUX")
	self.isShowingFTUX = true
	self.Analytics:reportConnectDisconnectEvents("voiceConnectFtuxJoinEvent", self:GetConnectDisconnectAnalyticsData())
	
	if getFFlagNonVoiceFTUX() then
		expChatModule.Events.VoiceUIVisibilityChanged(true)
	else
		self:MuteAll(true, "FTUX")
		self.muteAllChanged.Event:Once(function() --[[ line: 866 ]]
			-- upvalues: self (ref), p57 (ref)
			self:HideFTUX(p57)
			self.Analytics:reportConnectDisconnectEvents("voiceConnectFtuxLeaveEvent", self:GetConnectDisconnectAnalyticsData())
		end)
		self.talkingChanged.Event:Once(function() --[[ line: 873 ]]
			-- upvalues: self (ref), p57 (ref)
			self:HideFTUX(p57)
		end)
		
		if getFFlagEnableFtuxExitOnMuteToggle() then
			self.coreVoiceManager.onPlayerMuteToggled.Event:Once(function() --[[ line: 877 ]]
				-- upvalues: self (ref), p57 (ref)
				self:HideFTUX(p57)
			end)
		end
	end
end

function t:VoiceChatFirstTimeUX(p58) --[[ line: 895 ]]
	-- upvalues: fixSTUXShowingIncorrectly (ref), name (ref), debugSkipSeamlessVoiceAPICheck (ref), constantsModule (ref), getFFlagNonVoiceFTUX (ref)
	if fixSTUXShowingIncorrectly and not self:verifyUniverseAndPlaceCanUseVoice() then
		name:debug("Universe/place is not voice enabled, do not run FTUX/STUX")
		
		return
	elseif not debugSkipSeamlessVoiceAPICheck then
		local var81 = self:FetchAgeVerificationOverlay()
		
		if type(var81) == "table" and var81.voiceSettings and var81.voiceSettings.seamlessVoiceStatus ~= constantsModule.SEAMLESS_VOICE_STATUS_ENABLED_NEW_USER then
			name:debug("User not eligible for FTUX/STUX")
			
			return
		end
	end
	local function _() --[[ line: 915 | named "startFTUX" ]]
		-- upvalues: name (copy), self (ref), p58 (ref)
		name:debug("Starting FTUX")
		self:_VoiceChatFirstTimeUX(p58)
	end
	
	if getFFlagNonVoiceFTUX() then
		name:debug("Starting FTUX")
		self:_VoiceChatFirstTimeUX(p58)
		
		return
	end
	self:asyncInit():andThen(function() --[[ line: 923 ]]
		-- upvalues: self (ref), name (copy), p58 (ref)
		local stateChangedConnection = nil
		
		if self.service.VoiceChatState and self.service.VoiceChatState == Enum.VoiceChatState.Joined then
			name:debug("Starting FTUX")
			self:_VoiceChatFirstTimeUX(p58)
		end
		stateChangedConnection = self.service.StateChanged:Connect(function(_, p60) --[[ line: 931 ]]
			-- upvalues: name (copy), self (copy), p58 (copy), stateChangedConnection (write)
			if p60 == Enum.VoiceChatState.Joined then
				name:debug("Starting FTUX")
				self:_VoiceChatFirstTimeUX(p58)
				stateChangedConnection:Disconnect()
			end
		end)
	end):catch(function(p59) --[[ line: 938 ]]
		-- upvalues: name (copy)
		name:trace("Failed to start FTUX: {}", p59)
	end)
end

function t:HideFTUX(p61) --[[ line: 944 ]]
	-- upvalues: constantsModule (ref), getFFlagNonVoiceFTUX (ref), promptTypeModule (ref)
	self.isShowingFTUX = false
	self.hideFTUXSignal:Fire()
	pcall(function() --[[ line: 947 ]]
		-- upvalues: p61 (ref), constantsModule (copy)
		p61:SetItem(constantsModule.SEAMLESS_VOICE_FTUX_KEY, "true")
		p61:Flush()
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

function t:_onUserAndPlaceCanUseVoiceResolved(p62, p63) --[[ line: 961 ]]
	-- upvalues: getInformedOfBan (ref), getFFlagAvatarChatServiceEnabled (ref), getFFlagVoiceChatServiceManagerUseAvatarChat (ref), promptTypeModule (ref), BAN_REASON (ref), getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (ref), voiceNudgeUseNewDACopyModule (ref), getFFlagEnableVoicePromptReasonTextModule (ref)
	self.bannedUntil = nil
	
	if p62 and p62.isBanned then
		local var83 = "GetRequest"
		local var84 = getInformedOfBan(function(...) --[[ line: 707 ]]
			-- upvalues: self (ref), var83 (ref)
			return self[var83](self, ...)
		end)
		
		if var84 and not var84.informedOfBan then
			if getFFlagAvatarChatServiceEnabled() and getFFlagVoiceChatServiceManagerUseAvatarChat() and p62.bannedUntil == nil then
				self:ShowPlayerModeratedMessage()
			elseif p62.bannedUntil == nil then
				self:showPrompt(promptTypeModule.VoiceChatSuspendedPermanent)
			else
				self.bannedUntil = p62.bannedUntil
				
				if p62.banReason ~= BAN_REASON.NUDGE_V3 then
					self:showPrompt(promptTypeModule.VoiceChatSuspendedTemporary)
				elseif getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and voiceNudgeUseNewDACopyModule() then
					self:showPrompt(promptTypeModule.VoiceChatSuspendedTemporaryBV2)
				else
					self:showPrompt(promptTypeModule.VoiceChatSuspendedTemporaryB)
				end
			end
		end
		if var84 and var84.informedOfBan then
			self:ShowPlayerModeratedMessage(true)
			
			return
		end
	elseif self.runService:IsStudio() and p62 and not p62.isVoiceEnabled then
		self:showPrompt(promptTypeModule.User)
		
		return
	elseif self.runService:IsStudio() and p63 and not p63.isPlaceEnabledForVoice then
		self:showPrompt(promptTypeModule.Place, getFFlagEnableVoicePromptReasonTextModule() and (table.concat(p63.reasons or {}, "") or nil))
	end
end

function t:ChangeVoiceJoinProgress(p64) --[[ line: 1009 ]]
	return self.coreVoiceManager:ChangeVoiceJoinProgress(p64)
end

function t:GetVoiceJoinProgress() --[[ line: 1013 ]]
	return self.coreVoiceManager.VoiceJoinProgress
end

function t:UserOnlyEligibleForVoice() --[[ line: 1017 ]]
	return self.coreVoiceManager:UserOnlyEligibleForVoice()
end

function t:UserOnlyEligibleForVoiceViaOverlay() --[[ line: 1021 ]]
	return self.coreVoiceManager:UserOnlyEligibleForVoiceViaOverlay()
end

function t:UserVoiceEnabled() --[[ line: 1025 ]]
	return self.coreVoiceManager:UserVoiceEnabled()
end

function t:UserInInExperienceUpsellTreatment() --[[ line: 1029 ]]
	return self.coreVoiceManager:UserInInExperienceUpsellTreatment()
end

function t:UserEligibleForInExperienceUpsell() --[[ line: 1033 ]]
	return self.coreVoiceManager:UserEligibleForInExperienceUpsell()
end

function t:ShowInExperienceVoiceUpsell(p65) --[[ line: 1038 ]]
	-- upvalues: guardVoiceInExpUpsellVariant (ref)
	local var85 = self:FetchAgeVerificationOverlay()
	
	if guardVoiceInExpUpsellVariant and type(var85) ~= "table" then
		return
	end
	local showVoiceInExperienceUpsellVariant = var85.showVoiceInExperienceUpsellVariant
	self:SetInExpUpsellEntrypoint(p65)
	self:showPrompt(self:GetInExpUpsellPromptFromEnum(showVoiceInExperienceUpsellVariant))
end

function t:ShowInExperiencePhoneVoiceUpsell(p66, p67) --[[ line: 1052 ]]
	-- upvalues: var61 (ref), getFFlagInExperiencePhoneUpsellNewCopy (ref), var62 (ref), constantsModule (ref), promptTypeModule (ref)
	self:SetInExpUpsellEntrypoint(p66)
	var61.openPhoneUpsell({
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
		onSuccessBeforeToast = function() --[[ line: 1069 ]]
			-- upvalues: self (ref), var62 (copy), p67 (ref)
			self.coreVoiceManager:DisablePhoneVerificationUpsell()
			local var86 = "PostRequest"
			var62(function(...) --[[ line: 707 ]]
				-- upvalues: self (ref), var86 (ref)
				return self[var86](self, ...)
			end, p67, os.time(), false)
		end,
		onSuccess = function() --[[ line: 1073 ]]
			-- upvalues: self (ref), constantsModule (copy)
			if self.pendingConnectionSource == nil then
				self.pendingConnectionSource = constantsModule.VOICE_CONNECTION_SOURCE.IN_EXPERIENCE
			end
			self:EnableVoice()
		end,
		closeUpsell = function() --[[ line: 1079 ]]
			-- upvalues: p66 (ref), constantsModule (copy), self (ref), promptTypeModule (copy), var62 (copy), p67 (ref)
			if p66 ~= constantsModule.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE then
				self:showPrompt(promptTypeModule.VoiceConsentDeclinedToast)
			end
			local var87 = "PostRequest"
			var62(function(...) --[[ line: 707 ]]
				-- upvalues: self (ref), var87 (ref)
				return self[var87](self, ...)
			end, p67, os.time(), true)
		end
	})
end

function t:DisablePhoneVerificationUpsell() --[[ line: 1088 ]]
	self.coreVoiceManager:DisablePhoneVerificationUpsell()
end

function t:SetInExpUpsellEntrypoint(p68) --[[ line: 1092 ]]
	self.inExpUpsellEntrypoint = p68
end

function t:userAndPlaceCanUseVoice() --[[ line: 1096 ]]
	return self.coreVoiceManager:userAndPlaceCanUseVoice()
end

function t:verifyUniverseAndPlaceCanUseVoice() --[[ line: 1100 ]]
	return self.coreVoiceManager:verifyUniverseAndPlaceCanUseVoice()
end

function t:GetVoiceConnectCookieValue() --[[ line: 1104 ]]
	return self.coreVoiceManager:GetVoiceConnectCookieValue()
end

function t:GetVoiceConnectCookie() --[[ line: 1108 ]]
	return self.coreVoiceManager:GetVoiceConnectCookie()
end

function t:SetVoiceConnectCookieValue(p69) --[[ line: 1112 ]]
	return self.coreVoiceManager:SetVoiceConnectCookieValue(p69)
end

function t:GetVoiceRewarmCookie() --[[ line: 1116 ]]
	return self.coreVoiceManager:GetVoiceRewarmCookie()
end

function t:SetVoiceRewarmCookie(p70) --[[ line: 1120 ]]
	self.coreVoiceManager:SetVoiceRewarmCookie(p70)
end

function t:SetNewUserFTUXCookieValue(p71) --[[ line: 1124 ]]
	return self.coreVoiceManager:SetNewUserFTUXCookieValue(p71)
end

function t:ShowPlayerModeratedMessage(p72) --[[ line: 1128 ]]
	-- upvalues: getUserSettings (ref), analytics (ref), promptTypeModule (ref), BAN_REASON (ref), getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (ref), voiceNudgeUseNewDACopyModule (ref)
	local var88 = "GetRequest"
	local var89 = getUserSettings(function(...) --[[ line: 707 ]]
		-- upvalues: self (ref), var88 (ref)
		return self[var88](self, ...)
	end)
	
	if not var89 or not var89.isBanned then
		self:_reportJoinFailed("PlayerModeratedBadState", analytics.ERROR)
		
		return
	end
	self.banReason = var89.banReason
	
	if var89.bannedUntil == nil then
		self:showPrompt(promptTypeModule.VoiceChatSuspendedPermanent)
		
		return
	end
	self.bannedUntil = var89.bannedUntil
	
	if p72 then
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

function t:CheckCallState() --[[ line: 1157 ]]
	return self.coreVoiceManager:CheckCallState()
end

function t:ShowVoiceChatLoadingMessage() --[[ line: 1161 ]]
	-- upvalues: promptTypeModule (ref)
	self:showPrompt(promptTypeModule.VoiceLoading)
end

function t:requestMicPermission() --[[ line: 1165 ]]
	return self.coreVoiceManager:requestMicPermission()
end

function t:canUseServiceAsync() --[[ line: 1169 ]]
	return self.coreVoiceManager:canUseServiceAsync()
end

function t:canUseService() --[[ line: 1174 ]]
	-- upvalues: httpRbxApiService (ref), httpService (ref), VOICE_CHAT_AVAILABILITY (ref)
	if self.available ~= nil or not game:GetEngineFeature("VoiceChatSupported") then
		return false
	end
	local ok, status = pcall(function() --[[ line: 1178 ]]
		-- upvalues: httpRbxApiService (copy), httpService (copy)
		return httpService:JSONDecode(httpRbxApiService:GetAsyncFullUrl("https://voice.roblox.com/v1/settings", Enum.ThrottlingPriority.Default, Enum.HttpRequestType.Players))
	end)
	local isVoiceEnabled = ok and status.isVoiceEnabled
	
	if not isVoiceEnabled then
		self.available = VOICE_CHAT_AVAILABILITY.UserNotAvailable
	end
	return isVoiceEnabled
end

function t:ensureInitialized(p73) --[[ line: 1194 ]]
	return self.coreVoiceManager:ensureInitialized(p73)
end

function t:GetSessionId() --[[ line: 1199 ]]
	return self.coreVoiceManager:GetSessionId()
end

function t:GetChannelId() --[[ line: 1203 ]]
	return self.coreVoiceManager:GetChannelId()
end

function t:JoinWithVoiceMuteData(p74) --[[ line: 1207 ]]
	return self.coreVoiceManager:JoinWithVoiceMuteData(p74)
end

function t.calculateBanDuration(_, p75, p76) --[[ line: 1211 ]]
	return math.ceil((p76 - p75) / 60)
end

function t:ShowVoiceUI() --[[ line: 1215 ]]
	-- upvalues: expChatModule (ref)
	self.voiceUIVisible = true
	self.showVoiceUI:Fire()
	
	if expChatModule.Events.VoiceUIVisibilityChanged then
		expChatModule.Events.VoiceUIVisibilityChanged(true)
	end
end

function t:HideVoiceUI() --[[ line: 1224 ]]
	-- upvalues: expChatModule (ref)
	self.voiceUIVisible = false
	self.hideVoiceUI:Fire()
	
	if expChatModule.Events.VoiceUIVisibilityChanged then
		expChatModule.Events.VoiceUIVisibilityChanged(false)
	end
end

function t:createPromptInstance(p77, p78) --[[ line: 1233 ]]
	-- upvalues: getFFlagEnableVoicePromptReasonTextModule (ref), promptTypeModule (ref), getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module (ref), localizationService (ref), getFFlagShowDevicePermissionsModal (ref), fFlagEnableRetryForLinkingProtocolFetch (ref), fIntLinkingProtocolFetchRetries (ref), default_2 (ref), settingsRoute (ref), fIntLinkingProtocolFetchTimeoutMS (ref), roactModule (ref), voiceChatPromptModule (ref), analytics (ref), postInformedOfBan (ref), constantsModule (ref), disablePermissionPromptDeeplink (ref), getFFlagJoinWithoutMicPermissions (ref), name (ref), coreGuiService (ref)
	if self.promptSignal then
		self.promptSignal:Destroy()
		self.promptSignal = nil
	end
	self.promptSignal = Instance.new("BindableEvent")
	local var91 = if getFFlagEnableVoicePromptReasonTextModule() then self.errorText else nil
	local var92 = p78 == promptTypeModule.VoiceChatSuspendedTemporaryB
	
	if getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() then
		var92 = var92 or p78 == promptTypeModule.VoiceChatSuspendedTemporaryBV2
	end
	local var93 = if self.bannedUntil ~= nil then if var92 then tostring(self:calculateBanDuration(DateTime.now().UnixTimestamp, self.bannedUntil.Seconds)) else DateTime.fromUnixTimestamp(self.bannedUntil.Seconds):FormatLocalTime("l LT", localizationService.RobloxLocaleId) else ""
	local var94 = if p78 ~= promptTypeModule.VoiceToxicityModal then if p78 ~= promptTypeModule.VoiceToxicityToast then getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and (if p78 ~= promptTypeModule.VoiceToxicityModalV2 then p78 == promptTypeModule.VoiceToxicityToastV2 else true) else true else true
	local var95 = if p78 ~= promptTypeModule.VoiceConsentModalV1 then if p78 ~= promptTypeModule.VoiceConsentModalV2 then p78 == promptTypeModule.VoiceConsentModalV3 else true else true
	local var96 = false
	local var97 = nil
	
	if getFFlagShowDevicePermissionsModal() and p78 == promptTypeModule.DevicePermissionsModal and self.settingsAppAvailable == nil then
		if fFlagEnableRetryForLinkingProtocolFetch then
			for _ = 0, fIntLinkingProtocolFetchRetries do
				local thread = task.spawn(function() --[[ line: 1282 ]]
					-- upvalues: var96 (write), var97 (write), default_2 (copy), settingsRoute (copy)
					local var101, var102 = default_2:supportsSwitchToSettingsApp(settingsRoute.Microphone):await()
					var96 = var101
					var97 = var102
				end)
				task.wait(fIntLinkingProtocolFetchTimeoutMS / 1000)
				task.cancel(thread)
				
				if var97 == nil then
					continue
				end
			end
		else
			local var99, var100 = default_2:supportsSwitchToSettingsApp(settingsRoute.Microphone):await()
			var96 = var99
			var97 = var100
		end
		self.settingsAppAvailable = var96 and var97
	end
	self.voiceChatPromptInstance = roactModule.mount(roactModule.createElement(voiceChatPromptModule, {
		Analytics = analytics.new(),
		promptSignal = self.promptSignal.Event,
		bannedUntil = var93,
		policyMapper = self.policyMapper,
		errorText = var91,
		onReadyForSignal = p77,
		VoiceChatServiceManager = self,
		settingsAppAvailable = if self.settingsAppAvailable == nil then false else self.settingsAppAvailable,
		onContinueFunc = if p78 == promptTypeModule.VoiceChatSuspendedTemporary or var92 then function() --[[ line: 1315 ]]
			-- upvalues: postInformedOfBan (copy), self (ref)
			local var103 = "PostRequest"
			postInformedOfBan(function(...) --[[ line: 707 ]]
				-- upvalues: self (ref), var103 (ref)
				return self[var103](self, ...)
			end, true)
		end elseif var94 then function() --[[ line: 1318 ]]
			-- upvalues: self (ref)
			self.Analytics:reportClosedNudge(self:GetNudgeAnalyticsData())
		end elseif var95 then function() --[[ line: 1321 ]]
			-- upvalues: self (ref), constantsModule (copy)
			self:RecordUserSeenModal(constantsModule.MODAL_IDS.IN_EXP_UPSELL)
		end else nil,
		onPrimaryActivated = if var94 then function() --[[ line: 1326 ]]
			-- upvalues: self (ref)
			self.Analytics:reportAcknowledgedNudge(self:GetNudgeAnalyticsData())
		end elseif not disablePermissionPromptDeeplink and getFFlagJoinWithoutMicPermissions() and p78 == promptTypeModule.Permission then if getFFlagJoinWithoutMicPermissions() and getFFlagShowDevicePermissionsModal() and p78 == promptTypeModule.DevicePermissionsModal then function() --[[ line: 1353 ]]
			-- upvalues: name (copy), self (ref), default_2 (copy), settingsRoute (copy)
			name:debug("Settings app available: {}", self.settingsAppAvailable)
			self.Analytics:reportDevicePermissionsModalEvent(if self.settingsAppAvailable then "OpenedSettings" else "Acknowledged", self:GetSessionId(), self:GetInExpUpsellAnalyticsData())
			
			if self.settingsAppAvailable then
				name:debug("Switching to settings app")
				default_2:switchToSettingsApp(settingsRoute.Microphone):andThen(function() --[[ line: 1364 ]]
					-- upvalues: name (copy)
					name:debug("Successfully switched to settings app")
				end):catch(function() --[[ line: 1367 ]]
					-- upvalues: name (copy)
					name:error("Error switching to settings app")
				end)
				
				return
			end
			name:debug("Current platform does not support switching to settings app")
		end elseif var92 then function() --[[ line: 1374 ]]
			-- upvalues: self (ref)
			self:reportBanMessage("Understood")
			self.Analytics:reportBanMessageEvent("Understood")
		end elseif var95 then function() --[[ line: 1378 ]]
			-- upvalues: self (ref), constantsModule (copy)
			self.Analytics:reportInExpConsent("accepted", self.inExpUpsellEntrypoint, self:GetInExpUpsellAnalyticsData())
			
			if self.pendingConnectionSource == nil then
				self.pendingConnectionSource = constantsModule.VOICE_CONNECTION_SOURCE.IN_EXPERIENCE
			end
			self:EnableVoice()
		end else nil else function() --[[ line: 1333 ]]
			-- upvalues: default_2 (copy), name (copy)
			local var104 = default_2:supportsSwitchToSettingsApp():await()
			name:debug("Settings app available: {}", var104)
			
			if var104 then
				name:debug("Switching to settings app")
				default_2:switchToSettingsApp():andThen(function() --[[ line: 1339 ]]
					-- upvalues: name (copy)
					name:debug("Successfully switched to settings app")
				end):catch(function() --[[ line: 1342 ]]
					-- upvalues: name (copy)
					name:error("Error switching to settings app")
				end)
				
				return
			end
			name:debug("Current platform does not support switching to settings app")
		end,
		onSecondaryActivated = if p78 == promptTypeModule.VoiceToxicityModal or getFFlagVoiceChatDisruptiveVoiceNudgeEnableVariant2Module() and p78 == promptTypeModule.VoiceToxicityModalV2 then function() --[[ line: 1391 ]]
			-- upvalues: self (ref)
			self:ShowVoiceToxicityFeedbackToast()
			self.Analytics:reportDeniedNudge(self:GetNudgeAnalyticsData())
		end elseif var94 then function() --[[ line: 1395 ]]
			-- upvalues: self (ref)
			self.Analytics:reportDeniedNudge(self:GetNudgeAnalyticsData())
		end elseif var92 then function() --[[ line: 1398 ]]
			-- upvalues: self (ref)
			self:ShowVoiceToxicityFeedbackToast()
			self:reportBanMessage("Denied")
			self.Analytics:reportBanMessageEvent("Denied")
		end elseif var95 then function() --[[ line: 1403 ]]
			-- upvalues: self (ref), constantsModule (copy), promptTypeModule (copy)
			self.Analytics:reportInExpConsent("denied", self.inExpUpsellEntrypoint, self:GetInExpUpsellAnalyticsData())
			
			if self.inExpUpsellEntrypoint ~= constantsModule.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE then
				self:showPrompt(promptTypeModule.VoiceConsentDeclinedToast)
			end
		end elseif p78 == promptTypeModule.DevicePermissionsModal then function() --[[ line: 1413 ]]
			-- upvalues: self (ref)
			self.Analytics:reportDevicePermissionsModalEvent("Denied", self:GetSessionId(), self:GetInExpUpsellAnalyticsData())
		end else nil
	}), coreGuiService, "RobloxVoiceChatPromptGui")
end

function t:showPrompt(p79, p80) --[[ line: 1427 ]]
	-- upvalues: getFFlagEnableVoicePromptReasonTextModule (ref), name (ref)
	if getFFlagEnableVoicePromptReasonTextModule() then
		self.errorText = p80 or nil
	end
	self:createPromptInstance(function() --[[ line: 1431 ]]
		-- upvalues: name (copy), p79 (ref), self (ref)
		name:debug("Show Prompt: {}", p79)
		self.promptSignal:fire(p79)
	end, p79)
end

function t:showJoinVoicePrompt() --[[ line: 1437 ]]
	-- upvalues: promptTypeModule (ref), appStorageService (ref), constantsModule (ref)
	self:showPrompt(promptTypeModule.UnifiedJoinVoiceToast)
	pcall(function() --[[ line: 1439 ]]
		-- upvalues: appStorageService (copy), constantsModule (copy)
		appStorageService:SetItem(constantsModule.VOICE_WITH_TC_TOAST_KEY, "true")
		appStorageService:Flush()
	end)
end

function t:CheckAndShowPermissionPrompt() --[[ line: 1445 ]]
	-- upvalues: getFFlagEnableSeamlessVoiceV2 (ref), getFFlagJoinWithoutMicPermissions (ref), PERMISSION_STATE (ref), promptTypeModule (ref), permissionsProtocol (ref), promiseModule (ref), getFFlagEnableUniveralVoiceToastsModule (ref)
	local function showPrompt() --[[ line: 1446 ]]
		-- upvalues: self (ref), getFFlagEnableSeamlessVoiceV2 (copy), getFFlagJoinWithoutMicPermissions (copy), PERMISSION_STATE (copy), promptTypeModule (copy), permissionsProtocol (copy), promiseModule (copy)
		if self.voiceEnabled or self.userEligible then
			if getFFlagEnableSeamlessVoiceV2() or not getFFlagJoinWithoutMicPermissions() then
				return self.PermissionsService:hasPermissions({ permissionsProtocol.Permissions.MICROPHONE_ACCESS }):andThen(function(p81) --[[ line: 1459 ]]
					-- upvalues: permissionsProtocol (copy), self (copy), promptTypeModule (copy)
					if p81 and p81.status == permissionsProtocol.Status.DENIED then
						self:showPrompt(promptTypeModule.Permission)
					end
				end)
			elseif self.permissionState == PERMISSION_STATE.LISTEN_ONLY then
				self:showPrompt(promptTypeModule.Permission)
			end
		end
		return promiseModule.resolve()
	end
	
	return if getFFlagEnableUniveralVoiceToastsModule() then showPrompt() else self:asyncInit():andThen(function() --[[ line: 1472 ]] end):catch(function() --[[ line: 1472 ]]
		-- upvalues: showPrompt (ref)
		return showPrompt()
	end)
end

function t:showDataConsentToast() --[[ line: 1478 ]]
	-- upvalues: getFFlagSeamlessVoiceConsentToastPolicy (ref), universalAppPolicyModule (ref), seamlessVoiceStatusModule (ref), constantsModule (ref), promptTypeModule (ref)
	local var108, showDataConsentToast
	local var106 = self:FetchAgeVerificationOverlay()
	local _ = nil
	local _ = nil
	local var107 = if getFFlagSeamlessVoiceConsentToastPolicy() then universalAppPolicyModule.getAppFeaturePolicies().getDisplayCheckboxInVoiceConsent() or false else false
	
	if type(var106) == "table" then
		var108 = if var106.voiceSettings then var106.voiceSettings.seamlessVoiceStatus else seamlessVoiceStatusModule.Invalid
		showDataConsentToast = var106.showDataConsentToast
	else
		showDataConsentToast = false
		var108 = seamlessVoiceStatusModule.Invalid
	end
	if showDataConsentToast and var107 then
		showDataConsentToast = type(self:_GetShowAgeVerificationOverlay()) == "table" and self:_GetShowAgeVerificationOverlay().showDataConsentToast
	end
	if var108 == seamlessVoiceStatusModule.EnabledExistingUser and showDataConsentToast and var107 then
		self:RecordUserSeenModal(constantsModule.MODAL_IDS.DATA_CONSENT_TOAST)
		
		return self:showPrompt(promptTypeModule.VoiceDataConsentOptOutToast)
	end
end

function t:CheckAndShowNotAudiblePrompt() --[[ line: 1512 ]]
	-- upvalues: promptTypeModule (ref), promiseModule (ref)
	return if game:GetEngineFeature("VoiceChatSupported") then self:asyncInit():andThen(function() --[[ line: 1515 ]]
		-- upvalues: self (ref), promptTypeModule (copy)
		if UserSettings().GameSettings.MasterVolume == 0 then
			self:showPrompt(promptTypeModule.NotAudible)
		end
	end):catch(function() --[[ line: 1521 ]] end) else promiseModule.resolve()
end

function t:InitialJoinFailedPrompt() --[[ line: 1526 ]]
	-- upvalues: name (ref), getFFlagVoiceChatClientRewriteMasterLua (ref), promptTypeModule (ref)
	name:debug("JoinByGroupIdToken returns false")
	
	if not getFFlagVoiceChatClientRewriteMasterLua then
		self:showPrompt(promptTypeModule.Retry)
	end
end

function t:ShowVoiceToxicityFeedbackToast() --[[ line: 1533 ]]
	-- upvalues: name (ref), promptTypeModule (ref)
	name:debug("Sending feedback toast")
	self:showPrompt(promptTypeModule.VoiceToxicityFeedbackToast)
end

function t:GetNudgeAnalyticsData() --[[ line: 1538 ]]
	-- upvalues: playersService (ref)
	return playersService.LocalPlayer.UserId, self:GetSessionId()
end

function t.GetInExpUpsellAnalyticsData(_) --[[ line: 1542 ]]
	-- upvalues: rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref), rbxAnalyticsService (ref)
	return game.GameId, game.PlaceId, if rbxAnalyticsServiceExposePlaySessionIdEngineFeature then rbxAnalyticsService:GetPlaySessionId() else ""
end

function t:reportBanMessage(p82) --[[ line: 1550 ]]
	-- upvalues: playersService (ref)
	self.Analytics:reportBanMessageEventV2(p82, self.banReason, playersService.LocalPlayer.UserId, if self.service then self.previousSessionId else "")
end

function t:reportJoinVoiceUpsellEvent(p83, p84, p85) --[[ line: 1559 ]]
	-- upvalues: rbxAnalyticsService (ref), fFlagVoiceRewarmTelemetry (ref)
	local playSessionId = rbxAnalyticsService:GetPlaySessionId()
	
	if fFlagVoiceRewarmTelemetry then
		self.Analytics:reportJoinVoiceUpsellEvent(p83, playSessionId, self:UserVoiceEnabled(), p84, p85)
		
		return
	end
	self.Analytics:reportJoinVoiceUpsellEvent(p83, playSessionId, self:UserVoiceEnabled())
end

function t:SetAndSyncActive(p86, p87) --[[ line: 1578 ]]
	self.coreVoiceManager:SetAndSyncActive(p86, p87)
end

function t:CreateAudioDeviceData(p88) --[[ line: 1582 ]]
	return self.coreVoiceManager:CreateAudioDeviceData(p88)
end

function t:onInstanceAdded(p89) --[[ line: 1586 ]]
	return self.coreVoiceManager:onInstanceAdded(p89)
end

function t:UpdateAudioDeviceInputDebugger() --[[ line: 1590 ]]
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

function t:AddReverseNudgeToxicUser(p90, p91, p92) --[[ line: 1614 ]]
	-- upvalues: getFIntVoiceReverseNudgeUXDisplayTimeSecondsModule (ref)
	p91(p90, "iconColorChange")
	local var110 = self.reverseNudgeToxicUserRemovalCallbacks[p90]
	
	if var110 ~= nil then
		task.cancel(var110)
	end
	self.reverseNudgeToxicUserRemovalCallbacks[p90] = task.delay(getFIntVoiceReverseNudgeUXDisplayTimeSecondsModule(), function() --[[ line: 1628 ]]
		-- upvalues: p92 (ref), p90 (ref), self (ref)
		p92(p90)
		self.reverseNudgeToxicUserRemovalCallbacks[p90] = nil
	end)
end

function t:onInstanceRemove(p93) --[[ line: 1635 ]]
	return self.coreVoiceManager:onInstanceRemove(p93)
end

function t:hookupAudioDeviceInputListener() --[[ line: 1639 ]]
	return self.coreVoiceManager:hookupAudioDeviceInputListener()
end

function t:ToggleMutePlayer(p94, p95) --[[ line: 1643 ]]
	return self.coreVoiceManager:ToggleMutePlayer(p94, p95)
end

function t:MuteAll(p96, p97) --[[ line: 1647 ]]
	return self.coreVoiceManager:MuteAll(p96, p97)
end

function t:ToggleMuteSome(p98, p99, p100, p101) --[[ line: 1651 ]]
	return self.coreVoiceManager:ToggleMuteSome(p98, p99, p100, p101)
end

function t:FireMuteNonFriendsEvent() --[[ line: 1660 ]]
	self.mutedNonFriends:Fire()
end

function t:EnsureCorrectMuteState(p102, p103) --[[ line: 1664 ]]
	-- upvalues: voiceChatService (ref), enableMutedByLocalUserEngineFeature (ref), playersService (ref)
	local t = {}
	
	for i, v in p102 do
		local var112 = self.participants[tostring(v)]
		
		if var112 and var112.isMutedLocally ~= p103 then
			if voiceChatService.UseNewAudioApi then
				t[v] = true
				self.mutedPlayers[v] = p103
			else
				self.service:SubscribePause(v, p103)
			end
			var112.isMutedLocally = p103
			self.participantsUpdate:Fire(self.participants)
		end
	end
	if voiceChatService.UseNewAudioApi then
		for i_1 in self.audioDevices do
			if i_1.Player and t[i_1.Player.UserId] then
				if enableMutedByLocalUserEngineFeature and i_1.Player ~= playersService.LocalPlayer then
					i_1.MutedByLocalUser = p103
				else
					i_1.Active = not p103
				end
			end
		end
	end
end

function t:FireUserAgencySelectedEvent(p104) --[[ line: 1696 ]]
	self.userAgencySelected:Fire(p104)
end

function t.ParticipantStateToIcon(_, p105, p106) --[[ line: 1700 ]]
	-- upvalues: VOICE_STATE (ref)
	local INACTIVE = VOICE_STATE.INACTIVE
	
	if not p105.subscriptionCompleted then
		INACTIVE = VOICE_STATE.CONNECTING
	elseif p105.isMutedLocally then
		INACTIVE = VOICE_STATE.LOCAL_MUTED
	elseif p105.isMuted then
		INACTIVE = VOICE_STATE.MUTED
	elseif p105.isSignalActive then
		INACTIVE = VOICE_STATE.TALKING
	end
	return getIcon(INACTIVE, p106)
end

function t.VoiceStateToIcon(_, p107, p108, p109) --[[ line: 1715 ]]
	return getIcon(p107, p108, p109)
end

function t.GetIcon(_, p110, p111) --[[ line: 1719 ]]
	return getIconSrc(p110, p111)
end

function t:JoinVoice(p112) --[[ line: 1723 ]]
	-- upvalues: fFlagVoiceRewarmTelemetry (ref), showJoinVoiceWhenDisconnectedV3 (ref), name (ref), guardVoiceInExpUpsellVariant (ref), constantsModule (ref), getFFlagEnableConnectDisconnectInSettingsAndChromeModule (ref), getFFlagEnableVoiceTrustedConnectionsToastsModule (ref), getFFlagUpdateVoiceConnectionToastsModule (ref), promptTypeModule (ref), getFFlagNonVoiceFTUX (ref), appStorageService (ref), getFFlagEnableVrVoiceParity (ref), promiseModule (ref), seamlessVoiceV2JoinVoiceToast (ref), getFFlagEnableSeamlessVoiceV2 (ref), enableVerifiedCheckViaOverlay (ref), getFFlagDisableConsentModalForExistingUsersModule (ref), getFFlagIntegratePhoneUpsellJoinVoice (ref), getFFlagEnableInExpPhoneVoiceUpsellEntrypoints (ref), getOverlayStore (ref), overlayTypes (ref), socialUpsellType (ref), enum (ref), sendUserConnectionStatus (ref)
	local joinVoiceButtonContext = nil
	local var113 = nil
	
	if fFlagVoiceRewarmTelemetry then
		joinVoiceButtonContext = self.joinVoiceButtonContext
		self.joinVoiceButtonContext = nil
	end
	if showJoinVoiceWhenDisconnectedV3 then
		name:debug("Consuming voice re-warm cookie on JoinVoice")
		self:SetVoiceRewarmCookie("true")
	end
	local var114 = self:FetchAgeVerificationOverlay()
	local var115 = (if guardVoiceInExpUpsellVariant then if type(var114) == "table" then var114.showVoiceInExperienceUpsellVariant else nil else var114.showVoiceInExperienceUpsellVariant) or constantsModule.IN_EXP_UPSELL_VARIANT.VARIANT3
	
	if not fFlagVoiceRewarmTelemetry then
		self.Analytics:reportJoinVoiceButtonEvent("clicked", self:GetInExpUpsellAnalyticsData())
	end
	if getFFlagEnableConnectDisconnectInSettingsAndChromeModule() and self.previousGroupId then
		if fFlagVoiceRewarmTelemetry then
			var113 = "RejoinPreviousChannel"
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
			var113 = "ExitFtux"
		end
		self:HideFTUX(appStorageService)
	elseif self.deniedMicPermissions then
		if fFlagVoiceRewarmTelemetry then
			var113 = "MicPermissionPrompt"
		end
		if getFFlagEnableVrVoiceParity() then
			self:CheckAndShowPermissionPrompt()
		else
			self:CheckAndShowPermissionPrompt():finallyReturn(promiseModule.reject())
		end
	elseif getFFlagEnableConnectDisconnectInSettingsAndChromeModule() and self:UserVoiceEnabled() then
		if fFlagVoiceRewarmTelemetry then
			var113 = "FirstJoinSession"
		end
		if seamlessVoiceV2JoinVoiceToast then
			self.isInitialJoin = true
		end
		self.attemptVoiceRejoin:Fire()
		
		if getFFlagEnableSeamlessVoiceV2() and self:IsNewSeamlessVoiceUserDisconnect() then
			self:SetVoiceConnectCookieValue(true)
			self:SetNewUserFTUXCookieValue(true)
		end
	elseif enableVerifiedCheckViaOverlay and self:UserOnlyEligibleForVoiceViaOverlay() or self:UserOnlyEligibleForVoice() then
		if fFlagVoiceRewarmTelemetry then
			var113 = "ConsentModal"
		end
		if getFFlagDisableConsentModalForExistingUsersModule() and self:IsSeamlessVoice() then
			self:EnableVoice()
		else
			self:SetInExpUpsellEntrypoint(constantsModule.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE)
			self:showPrompt(self:GetInExpUpsellPromptFromEnum(var115))
		end
	elseif self:EligibleForAgeCheckToast() then
		if fFlagVoiceRewarmTelemetry then
			var113 = "AgeCheckToast"
		end
		self:showPrompt(promptTypeModule.AgeCheckForVoiceToast)
	elseif getFFlagIntegratePhoneUpsellJoinVoice() and getFFlagEnableInExpPhoneVoiceUpsellEntrypoints() and (not self:UserVoiceEnabled() and self:FetchPhoneVerificationUpsell(constantsModule.IN_EXP_PHONE_UPSELL_IXP_LAYER) == constantsModule.PHONE_UPSELL_VALUE_PROP.VoiceChat) then
		if fFlagVoiceRewarmTelemetry then
			var113 = "PhoneUpsell"
		end
		if p112 then
			p112:SetVisibility(false, true)
		end
		self:ShowInExperiencePhoneVoiceUpsell(constantsModule.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE, constantsModule.IN_EXP_PHONE_UPSELL_IXP_LAYER)
	elseif self:EligibleForFaeUpsell() then
		if fFlagVoiceRewarmTelemetry then
			var113 = "FaeUpsell"
		end
		if self.pendingConnectionSource == nil then
			self.pendingConnectionSource = constantsModule.VOICE_CONNECTION_SOURCE.IN_EXPERIENCE
		end
		self.coreVoiceManager:OptUserToJoinVoice()
		local var116 = getOverlayStore(false)
		
		if not fFlagVoiceRewarmTelemetry then
			self:reportJoinVoiceUpsellEvent("Click")
		end
		var116.setCurrentOverlay(overlayTypes.SocialUpsell, {
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
		self.Analytics:reportJoinVoiceButtonEvent("clicked", inExpUpsellAnalyticsData, inExpUpsellAnalyticsData_1, inExpUpsellAnalyticsData_2, joinVoiceButtonContext, var113)
		self:reportJoinVoiceUpsellEvent("Click", joinVoiceButtonContext, var113)
	end
	if sendUserConnectionStatus and self:IsSeamlessVoice() then
		task.spawn(function() --[[ line: 1865 ]]
			-- upvalues: self (ref)
			self.coreVoiceManager:PostUserVoiceConnectionStatus(true)
		end)
	end
end

function t:EligibleForFaeUpsell() --[[ line: 1871 ]]
	-- upvalues: getFFlagEnableVoiceUxUpdates (ref), fFlagTestDeviceForFAEUpsell (ref), deviceMeetsRequirementsForFAE (ref)
	local var120 = getFFlagEnableVoiceUxUpdates()
	
	if var120 then
		var120 = self.coreVoiceManager:EligibleForFaeUpsell()
		
		if var120 then
			var120 = self.AvatarChatService:deviceMeetsRequirementsForFeature(Enum.DeviceFeatureType.InExperienceFAE)
			
			if var120 then
				if fFlagTestDeviceForFAEUpsell then
					return deviceMeetsRequirementsForFAE()
				end
				var120 = true
			end
		end
	end
	return var120
end

function t:EligibleForAgeCheckToast() --[[ line: 1878 ]]
	return self.coreVoiceManager:EligibleForAgeCheckToast()
end

function t:ShouldShowJoinVoice() --[[ line: 1883 ]]
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
			local var121 = self:UserOnlyEligibleForVoice() or self:UserVoiceEnabled()
			
			return if getFFlagIntegratePhoneUpsellJoinVoice() and getFFlagEnableInExpPhoneVoiceUpsellEntrypoints() and (not var121 and not self:UserVoiceEnabled()) and self:FetchPhoneVerificationUpsell(constantsModule.IN_EXP_PHONE_UPSELL_IXP_LAYER) == constantsModule.PHONE_UPSELL_VALUE_PROP.VoiceChat then true else self:UserInInExperienceUpsellTreatment() and var121
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

function t:ShouldShowJoinVoiceOnDisconnect() --[[ line: 1962 ]]
	return self.coreVoiceManager:ShouldShowJoinVoiceOnDisconnect()
end

function t:IsSeamlessVoice() --[[ line: 1966 ]]
	-- upvalues: getFFlagCheckUniversePlaceBeforeSuspending (ref), name (ref), seamlessVoiceStatusModule (ref)
	if getFFlagCheckUniversePlaceBeforeSuspending() then
		return self.coreVoiceManager:IsSeamlessVoice()
	end
	local var122 = self:FetchAgeVerificationOverlay()
	
	if not var122 or not var122.voiceSettings then
		name:error("VoiceChatServiceManager:IsSeamlessVoice() - ageVerificationOverlayData or voiceSettings is nil")
		
		return false
	end
	local seamlessVoiceStatus = var122.voiceSettings.seamlessVoiceStatus
	
	return if seamlessVoiceStatus ~= seamlessVoiceStatusModule.EnabledExistingUser then seamlessVoiceStatus == seamlessVoiceStatusModule.EnabledNewUser else true
end

function t:HasSeamlessVoiceFeature(p113) --[[ line: 1982 ]]
	return self.coreVoiceManager:HasSeamlessVoiceFeature(p113)
end

function t:IsNewSeamlessVoiceUserDisconnect() --[[ line: 1986 ]]
	return self.coreVoiceManager:IsNewSeamlessVoiceUserDisconnect()
end

function t:GetConnectDisconnectButtonAnalyticsData(p114) --[[ line: 1990 ]]
	-- upvalues: rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref), rbxAnalyticsService (ref)
	local list = {
		game.GameId,
		game.PlaceId,
		if rbxAnalyticsServiceExposePlaySessionIdEngineFeature then rbxAnalyticsService:GetPlaySessionId() else ""
	}
	
	if p114 and self:getService() then
		table.insert(list, self:GetSessionId())
	end
	return unpack(list)
end

function t:GetConnectDisconnectAnalyticsData() --[[ line: 2002 ]]
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

function t:Leave() --[[ line: 2022 ]]
	-- upvalues: getFFlagDisconnectToastClientRewrite (ref), getFFlagEnableConnectDisconnectInSettingsAndChromeModule (ref), getFFlagVoiceChatClientRewriteMasterLua (ref), sendUserConnectionStatus (ref)
	self:ensureInitialized("leave")
	
	if getFFlagDisconnectToastClientRewrite() and getFFlagEnableConnectDisconnectInSettingsAndChromeModule() then
		self:SetVoiceConnectCookieValue(false)
	end
	self.Analytics:reportConnectDisconnectEvents("voiceDisconnectEvent", self:GetConnectDisconnectAnalyticsData())
	local groupId = self.service:GetGroupId()
	local var126 = self.service:IsPublishPaused()
	
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
	self.previousMutedState = var126
	
	if not getFFlagDisconnectToastClientRewrite() and getFFlagEnableConnectDisconnectInSettingsAndChromeModule() then
		self:SetVoiceConnectCookieValue(false)
	end
	if sendUserConnectionStatus and self:IsSeamlessVoice() then
		task.spawn(function() --[[ line: 2045 ]]
			-- upvalues: self (ref)
			self.coreVoiceManager:PostUserVoiceConnectionStatus(false)
		end)
	end
end

function t.GetVoiceStateFromEnum(_, p115) --[[ line: 2051 ]]
	-- upvalues: t_1 (write), VOICE_STATE (ref)
	if not t_1[p115] then
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
	return t_1[p115]
end

function t.GetInExpUpsellPromptFromEnum(_, p116) --[[ line: 2071 ]]
	-- upvalues: t_2 (ref)
	return t_2[p116]
end

function t:getRecentUsersInteractionData() --[[ line: 2076 ]]
	return self.coreVoiceManager:getRecentUsersInteractionData()
end

function t:_setRecentUserState(p117, p118) --[[ line: 2080 ]]
	return self.coreVoiceManager:_setRecentUserState(p117, p118)
end

function t:_updateRecentUsersInteractionData() --[[ line: 2084 ]]
	return self.coreVoiceManager:_updateRecentUsersInteractionData()
end

function t:SetupParticipantListeners() --[[ line: 2088 ]]
	return self.coreVoiceManager:SetupParticipantListeners()
end

function t:Disconnect() --[[ line: 2092 ]]
	self.coreVoiceManager:Disconnect()
	self.coreVoiceManager:unsubscribeAll()
end

function t:GetSendMuteEvent() --[[ line: 2097 ]]
	return self.coreVoiceManager:GetSendMuteEvent()
end

function t:ToggleMic(p119) --[[ line: 2102 ]]
	return self.coreVoiceManager:ToggleMic(p119)
end

function t:SubscribeRetry(p120) --[[ line: 2106 ]]
	-- upvalues: name (ref)
	self:ensureInitialized("subscribe retry")
	name:debug("Attempting to retry connection to user: {}", "..." .. string.sub(tostring(p120), -4))
	self.service:SubscribeRetry(p120)
end

function t:JoinByGroupIdToken(p121, p122) --[[ line: 2112 ]]
	return self.coreVoiceManager:JoinByGroupIdToken(p121, p122)
end

function t:RejoinPreviousChannel() --[[ line: 2116 ]]
	-- upvalues: name (ref), getFFlagVoiceChatClientRewriteMasterLua (ref)
	local previousGroupId = self.previousGroupId
	local previousMutedState = self.previousMutedState
	name:debug("Rejoining previous channel {} with mute status {}", previousGroupId, previousMutedState)
	pcall(function() --[[ line: 2121 ]]
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

function t.SwitchDevice(_, p123, p124, p125) --[[ line: 2147 ]]
	-- upvalues: VOICE_CHAT_DEVICE_TYPE (ref), soundService (ref), name (ref)
	if p123 == VOICE_CHAT_DEVICE_TYPE.Input then
		soundService:SetInputDevice(p124, p125)
		name:info("[InputDeviceSelection] Setting SS Mic Device To {} {}", p124, p125)
		
		return
	end
	soundService:SetOutputDevice(p124, p125)
	name:info("[OutputDeviceSelection] Setting SS Speaker Device To {} {}", p124, p125)
end

function t.GetDevices(_, p126) --[[ line: 2157 ]]
	-- upvalues: VOICE_CHAT_DEVICE_TYPE (ref), soundService (ref)
	local ok, status, var130, var131 = pcall(function() --[[ line: 2158 ]]
		-- upvalues: p126 (ref), VOICE_CHAT_DEVICE_TYPE (copy), soundService (copy)
		return if p126 == VOICE_CHAT_DEVICE_TYPE.Input then soundService:GetInputDevices() else soundService:GetOutputDevices()
	end)
	
	return ok, status, var130, var131
end

function t:VoiceChatAvailable() --[[ line: 2169 ]]
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

function t:VoiceChatEnded() --[[ line: 2189 ]]
	-- upvalues: voiceEndedCheckDisregardIdleState (ref)
	if not self.service then
		return true
	end
	local voiceChatState = self.service.VoiceChatState
	
	return if voiceEndedCheckDisregardIdleState then voiceChatState == Enum.VoiceChatState.Ended elseif voiceChatState ~= Enum.VoiceChatState.Ended then voiceChatState == Enum.VoiceChatState.Idle else true
end

function t:UnmountPrompt() --[[ line: 2201 ]]
	-- upvalues: roactModule (ref)
	if self.voiceChatPromptInstance ~= nil then
		roactModule.unmount(self.voiceChatPromptInstance)
		self.voiceChatPromptInstance = nil
	end
end

t.default = t.new(coreVoiceManager.default, nil, httpRbxApiService, permissionsProtocol.default, blockingUtilityModule:GetAfterBlockedStatusChangedEvent())

return t