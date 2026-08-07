return {
	VOICE_CHAT = {
		MIC_ANIMATION = { FRAME_BUFFER = 3 },
		ICONS = {
			DEFAULT_SPEAKER = "icons/controls/voice/speaker_0_dark",
			MUTED_SPEAKER = "rbxasset://textures/ui/VoiceChat/SpeakerLight/Muted.png",
			SPEAKER_OFF = "rbxasset://textures/ui/VoiceChat/SpeakerLight/Muted.png",
			ANIMATED_SPEAKER_FORMAT = "icons/controls/voice/speaker_%d_dark"
		},
		VOICE_VOLUME = { MIN = 0, MAX = 2, DEFAULT = 1 }
	},
	ANALYTICS = {
		IN_GAME_MENU_NAME = "ingame_menu",
		ENTRY_POINT = {
			PEOPLE_LIST = "people_list",
			PEOPLE_CARD = "people_card",
			PLAYER_PROFILE = "player_profile"
		},
		UX_VARIANT = {
			SYNC = "sync",
			DISABLE_WHEN_MUTED = "disable_when_muted",
			INDEPENDENT = "independent"
		}
	},
	FRIEND_STATUS = {},
	PERSON_BUTTONS = {
		MUTE_PLAYER = "mute",
		INSPECT = "inspect",
		REPORT_PLAYER = "report",
		BLOCK_PLAYER = "block",
		ADD_FRIEND = "addFriend"
	}
}