local contentProviderService = game:GetService("ContentProvider")
local t = {
	PlaceNotAvailable = -1,
	UserNotAvailable = 0,
	Checking = 1,
	Available = 2
}
local t_1 = { VoiceNotifications = true, VoiceModeration = true }
local list = {
	"ParticipantModeratedFromVoice",
	"VoiceToxicityModal",
	"VoiceToxicityToast",
	"VoiceReverseNudgeIconColorChange"
}
local t_2 = {
	IDLE = "Idle",
	VOICE_DISABLED = "Voice Disabled",
	LISTEN_AND_TALK = "Listen and Talk",
	LISTEN_ONLY = "Listen Only",
	PENDING_MIC = "Pending Mic"
}
local t_3 = {
	Idle = "Idle",
	Joining = "Joining",
	Suspended = "Suspended",
	Joined = "Joined",
	Left = "Left"
}
local t_4 = {
	ALL = "all",
	FRIENDS = "friends",
	NONFRIENDS = "nonfriends"
}
local _, _, var7 = (function() --[[ line: 54 | named "parseBaseUrlInformation" ]]
	-- upvalues: contentProviderService (ref)
	local baseUrl = contentProviderService.BaseUrl
	
	if baseUrl:sub(#baseUrl) ~= "/" then
		baseUrl ..= "/"
	end
	local _, var8 = baseUrl:find("://")
	local var9, var10 = baseUrl:find("%.", var8 + 1)
	
	return baseUrl, baseUrl:sub(var8 + 1, var9 - 1), baseUrl:sub(var10 + 1)
end)()

return {
	MIN_VOICE_CHAT_API_VERSION = 3,
	MIN_VOICE_CHAT_API_VERSION_LOCAL_MIC_ACTIVITY = 9,
	MIN_VOICE_CHAT_API_VERSION_IS_CONTEXT_ENABLED = 10,
	IN_EXP_PHONE_UPSELL_IXP_LAYER = "InExperience.UpsellCard",
	EXIT_CONFIRMATION_PHONE_UPSELL_IXP_LAYER = "ExitConfirmation.UpsellCard",
	VOICE_CONNECT_DISCONNECT_KEY = "InExpVoiceUIVisibility",
	VOICE_CONNECT_DISCONNECT_KEY_V2 = "SeamlessConnectToVoice",
	VOICE_CONNECT_DISCONNECT_KEY_V3 = "ConnectToVoice",
	SEAMLESS_VOICE_FTUX_KEY = "SeamlessVoiceFTUX",
	VOICE_REWARM_KEY = "VoiceRewarmOffered",
	REWARDED_VIDEO_AD_STARTED = "RewardedVideoAdStarted",
	REWARDED_VIDEO_AD_ENDED = "RewardedVideoAdEnded",
	FAE_ENABLED = "Enabled",
	FAE_SETTINGS_TOAST = "SettingsToast",
	VOICE_JOIN_PROGRESS = t_3,
	VOICE_CHAT_AVAILABILITY = t,
	WATCHED_NAMESPACES = t_1,
	VOICE_GROUP_TYPE = t_4,
	WATCHED_MESSAGE_TYPES = list,
	PERMISSION_STATE = t_2,
	VOICE_URL = string.format("https://voice.%s", var7),
	UPSELL_CARD_URL = string.format("https://apis.%supsellcard", var7),
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