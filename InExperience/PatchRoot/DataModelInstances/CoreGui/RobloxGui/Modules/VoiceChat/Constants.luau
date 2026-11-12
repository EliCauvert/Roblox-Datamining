return {
	IN_EXP_PHONE_UPSELL_IXP_LAYER = "InExperience.UpsellCard",
	EXIT_CONFIRMATION_PHONE_UPSELL_IXP_LAYER = "ExitConfirmation.UpsellCard",
	SEAMLESS_VOICE_FTUX_KEY = "SeamlessVoiceFTUX",
	SEAMLESS_VOICE_STUX_KEY = "SeamlessVoiceSTUXCount",
	SEAMLESS_VOICE_STATUS_ENABLED_NEW_USER = 3,
	VOICE_WITH_TC_TOAST_KEY = "VoiceWithTcToast",
	VOICE_CONTEXT_TYPE = {
		USER_AGENCY = "useragency",
		BUBBLE_CHAT = "bubblechat",
		IN_GAME_MENU = "ingamemenu",
		MUTE_TOGGLES = "mutetoggles",
		REPORT_MENU = "reportmenu",
		EASIER_UNMUTING = "easierunmuting",
		UNKNOWN = "unknown"
	},
	VOICE_CONNECTION_SOURCE = {
		AUTO_CONNECT = 1,
		IN_EXPERIENCE = 2,
		SETTINGS_TOGGLE_ON = 3
	},
	VOICE_DISCONNECT_REASON = { USER_DISCONNECT = 1, MODERATED = 2, SYSTEM = 3 },
	VOICE_JOIN_PROGRESS = {
		Idle = "Idle",
		Joining = "Joining",
		Suspended = "Suspended",
		Joined = "Joined",
		Left = "Left"
	},
	VOICE_GROUP_TYPE = {
		ALL = "all",
		FRIENDS = "friends",
		NONFRIENDS = "nonfriends"
	},
	VOICE_STATE = {
		INACTIVE = "Inactive",
		TALKING = "Talking",
		CONNECTING = "Connecting",
		MUTED = "Muted",
		LOCAL_MUTED = "LOCAL_MUTED",
		ERROR = "Error",
		HIDDEN = "Hidden"
	},
	BAN_REASON = { NUDGE_V3 = 7 },
	IN_EXP_UPSELL_VARIANT = {
		CONTROL = "control",
		VARIANT1 = "variant1",
		VARIANT2 = "variant2",
		VARIANT3 = "variant3"
	},
	MODAL_IDS = {
		IN_EXP_UPSELL = "in-experience-voice-upsell",
		DATA_CONSENT_TOAST = "data-consent-toast",
		IN_EXP_JOIN_VOICE_UPSELL = "join-voice-upsell-tooltip"
	},
	IN_EXP_UPSELL_ENTRYPOINTS = { JOIN_VOICE = "joinVoiceButton" },
	PHONE_UPSELL_VALUE_PROP = { None = 0, VoiceChat = 1, AccountSecurity = 2 }
}