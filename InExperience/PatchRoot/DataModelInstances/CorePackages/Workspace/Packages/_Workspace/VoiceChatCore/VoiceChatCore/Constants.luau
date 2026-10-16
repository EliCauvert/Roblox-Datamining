local ContentProvider = game:GetService("ContentProvider")
local _, _, v1 = (function() --[[ Line: 54 | Named "parseBaseUrlInformation" ]]
	-- upvalues: ContentProvider (copy)
	local BaseUrl = ContentProvider.BaseUrl
	
	if BaseUrl:sub(#BaseUrl) ~= "/" then
		BaseUrl ..= "/"
	end
	local _, EndIndex = BaseUrl:find("://")
	local StartIndex, EndIndex1 = BaseUrl:find("%.", EndIndex + 1)
	
	return BaseUrl, BaseUrl:sub(EndIndex + 1, StartIndex - 1), (BaseUrl:sub(EndIndex1 + 1))
end)()

return {
	MIN_VOICE_CHAT_API_VERSION = 3,
	MIN_VOICE_CHAT_API_VERSION_LOCAL_MIC_ACTIVITY = 9,
	MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED = 10,
	IN_EXP_PHONE_UPSELL_IXP_LAYER = "InExperience.UpsellCard",
	EXIT_CONFIRMATION_PHONE_UPSELL_IXP_LAYER = "ExitConfirmation.UpsellCard",
	VOICE_CONNECT_DISCONNECT_KEY_V2 = "SeamlessConnectToVoice",
	VOICE_CONNECT_DISCONNECT_KEY_V3 = "ConnectToVoice",
	SEAMLESS_VOICE_FTUX_KEY = "SeamlessVoiceFTUX",
	VOICE_REWARM_KEY = "VoiceRewarmOffered",
	REWARDED_VIDEO_AD_STARTED = "RewardedVideoAdStarted",
	REWARDED_VIDEO_AD_ENDED = "RewardedVideoAdEnded",
	FAE_ENABLED = "Enabled",
	FAE_SETTINGS_TOAST = "SettingsToast",
	VOICE_JOIN_PROGRESS = {
		Idle = "Idle",
		Joining = "Joining",
		Suspended = "Suspended",
		Joined = "Joined",
		Left = "Left"
	},
	VOICE_CHAT_AVAILABILITY = {
		PlaceNotAvailable = -1,
		UserNotAvailable = 0,
		Checking = 1,
		Available = 2
	},
	WATCHED_NAMESPACES = { VoiceNotifications = true, VoiceModeration = true },
	VOICE_GROUP_TYPE = {
		ALL = "all",
		FRIENDS = "friends",
		NONFRIENDS = "nonfriends"
	},
	WATCHED_MESSAGE_TYPES = {
		"ParticipantModeratedFromVoice",
		"VoiceToxicityModal",
		"VoiceToxicityToast",
		"VoiceReverseNudgeIconColorChange"
	},
	PERMISSION_STATE = {
		IDLE = "Idle",
		VOICE_DISABLED = "Voice Disabled",
		LISTEN_AND_TALK = "Listen and Talk",
		LISTEN_ONLY = "Listen Only",
		PENDING_MIC = "Pending Mic"
	},
	VOICE_URL = string.format("https://voice.%s", v1),
	UPSELL_CARD_URL = string.format("https://apis.%supsellcard", v1),
	IN_EXP_UPSELL_VARIANT = {
		CONTROL = "control",
		VARIANT1 = "variant1",
		VARIANT2 = "variant2",
		VARIANT3 = "variant3"
	},
	PHONE_UPSELL_VOICE_CHAT_PROP = { None = 0, VoiceChat = 1, AccountSecurity = 2 },
	SeamlessVoiceStatus = {
		Invalid = 0,
		Disabled = 1,
		EnabledExistingUser = 2,
		EnabledNewUser = 3
	},
	SeamlessVoiceVariants = {
		Control = "Control",
		OnlyConnectDisconnect = "V2-Variant-1",
		HearingWithoutMicPermissions = "V2-Variant-2"
	},
	SeamlessVoiceFeatures = {
		Control = "Control",
		ConnectDisconnect = "ConnectDisconnect",
		HearingWithoutMicPermissions = "HearingWithoutMicPermissions",
		JoinVoiceIsMutedMic = "JoinVoiceIsMutedMic",
		JoinVoiceTooltip = "JoinVoiceTooltip",
		InitialJoinVoice = "InitialJoinVoice",
		DeferConnection = "DeferConnection",
		HideJoinToastSubtitle = "HideJoinToastSubtitle"
	}
}