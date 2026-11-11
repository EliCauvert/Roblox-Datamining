local _ = require(script:FindFirstAncestor("CrossExperience").Types)

return {
	STORAGE_CEV_STORE_KEY = "CrossExperienceVoiceStore",
	CEV_JOIN_ATTEMPT_ID_KEY = "cevJoinAttemptId",
	EXPERIENCE_TYPE_VOICE = "Voice",
	EXPERIENCE_TYPE_LUAAPP = "LuaApp",
	EXPERIENCE_TYPE_UGC = "Ugc",
	LOCAL_PLAYER_LOADING_TIMEOUT_ENUM = {
		Disable = "Disable",
		EnableManualRetry = "EnableManualRetry"
	},
	VOICE_STATUS = {
		DISCONNECTED = "DISCONNECTED",
		RCC_CONNECTING = "RCC_CONNECTING",
		RCC_CONNECTED = "RCC_CONNECTED",
		RCC_RECONNECTING = "RCC_RECONNECTING",
		VOICE_RECONNECTING = "VOICE_RECONNECTING",
		VOICE_CONNECTING = "VOICE_CONNECTING",
		VOICE_CONNECTED = "VOICE_CONNECTED",
		ERROR_RCC_TIMEOUT = "ERROR_RCC_TIMEOUT",
		ERROR_RCC_CONNECTING = "ERROR_RCC_CONNECTING",
		ERROR_JOIN_FEASIBILITY_CHECK_FAILED = "ERROR_JOIN_FEASIBILITY_CHECK_FAILED",
		ERROR_START_BACKGROUND_DM = "ERROR_START_BACKGROUND_DM",
		ERROR_VOICE_INIT = "ERROR_VOICE_INIT",
		ERROR_VOICE_SETUP = "ERROR_VOICE_SETUP",
		ERROR_VOICE_JOIN = "ERROR_VOICE_JOIN",
		ERROR_VOICE_MIC_REJECTED = "ERROR_VOICE_MIC_REJECTED",
		ERROR_VOICE_MODERATED = "ERROR_VOICE_MODERATED",
		ERROR_VOICE_FAILED = "ERROR_VOICE_FAILED",
		ERROR_VOICE_DISCONNECTED = "ERROR_VOICE_DISCONNECTED",
		ERROR_BACKGROUND_DM_LOAD_LOCALPLAYER_TIMEOUT = "ERROR_BACKGROUND_DM_LOAD_LOCALPLAYER_TIMEOUT"
	},
	BACKGROUND_DM_STATUS = {
		ACTIVE = "Active",
		BACKGROUND = "Background",
		PASSIVE = "Passive",
		NONE = "None"
	},
	COMMUNICATIONS = {
		EXECUTE_CHANGE_PARTY_VOICE_INPUT_DEVICE = "ExecutePartyVoiceInputDeviceChange",
		EXECUTE_CHANGE_PARTY_VOICE_OUTPUT_DEVICE = "ExecutePartyVoiceOutputDeviceChange",
		EXECUTE_GET_BACKGROUND_DM_STATE = "ExecutePartyVoiceGetBackgroundDMState",
		EXECUTE_PARTY_VOICE_IGNORE_LOW_MEMORY = "ExecutePartyVoiceIgnoreLowMemory"
	},
	EVENTS = {
		DEBUG_COMMAND = {
			ADD_OBSERVER = "AddObserverPartyVoiceDebugCommand",
			NOTIFY = "NotifyPartyVoiceDebugCommand",
			REMOVE_OBSERVER = "RemoveObserverPartyVoiceDebugCommand"
		},
		PARTY_VOICE_RECONNECT_REQUESTED = {
			ADD_OBSERVER = "AddObserverPartyVoiceReconnectRequested",
			NOTIFY = "NotifyPartyVoiceReconnectRequested",
			REMOVE_OBSERVER = "RemoveObserverPartyVoiceReconnectRequested"
		},
		PARTY_VOICE_PARTICIPANT_AUDIO_FOCUS_CHANGED = {
			ADD_OBSERVER = "AddObserverPartyVoiceParticipantAudioFocusChanged",
			NOTIFY = "NotifyPartyVoiceParticipantAudioFocusChanged",
			REMOVE_OBSERVER = "RemoveObserverPartyVoiceParticipantAudioFocusChanged"
		},
		PARTY_VOICE_GAME_JOIN_STARTED = {
			ADD_OBSERVER = "AddObserverPartyVoiceGameJoinStarted",
			NOTIFY = "NotifyPartyVoiceGameJoinStarted",
			REMOVE_OBSERVER = "RemoveObserverPartyVoiceGameJoinStarted"
		},
		PARTY_VOICE_GAME_JOIN_SUCCEEDED = {
			ADD_OBSERVER = "AddObserverPartyVoiceGameJoinSucceeded",
			NOTIFY = "NotifyPartyVoiceGameJoinSucceeded",
			REMOVE_OBSERVER = "RemoveObserverPartyVoiceGameJoinSucceeded"
		},
		PARTY_VOICE_GAME_JOIN_FAILED = {
			ADD_OBSERVER = "AddObserverPartyVoiceGameJoinFailed",
			NOTIFY = "NotifyPartyVoiceGameJoinFailed",
			REMOVE_OBSERVER = "RemoveObserverPartyVoiceGameJoinFailed"
		},
		PARTY_VOICE_STATUS_CHANGED = {
			ADD_OBSERVER = "AddObserverPartyVoiceStatusChanged",
			NOTIFY = "NotifyPartyVoiceStatusChanged",
			REMOVE_OBSERVER = "RemoveObserverPartyVoiceStatusChanged"
		},
		PARTY_VOICE_EXPERIENCE_JOINED = {
			ADD_OBSERVER = "AddObserverPartyVoiceExperienceStarted",
			NOTIFY = "NotifyPartyVoiceExperienceStarted",
			REMOVE_OBSERVER = "RemoveObserverPartyVoiceExperienceStarted"
		},
		PARTY_VOICE_PARTICIPANT_ADDED = {
			ADD_OBSERVER = "AddObserverPartyVoiceParticipantWasAdded",
			NOTIFY = "NotifyPartyVoiceParticipantWasAdded",
			REMOVE_OBSERVER = "RemoveObserverPartyVoiceParticipantWasAdded"
		},
		PARTY_VOICE_PARTICIPANT_REMOVED = {
			ADD_OBSERVER = "AddObserverPartyVoiceParticipantWasRemoved",
			NOTIFY = "NotifyPartyVoiceParticipantWasRemoved",
			REMOVE_OBSERVER = "RemoveObserverPartyVoiceParticipantWasRemoved"
		},
		PARTY_VOICE_PARTICIPANT_WAS_MUTED = {
			ADD_OBSERVER = "AddObserverPartyVoiceParticipantWasMuted",
			NOTIFY = "NotifyPartyVoiceParticipantWasMuted",
			REMOVE_OBSERVER = "RemoveObserverPartyVoiceParticipantWasMuted"
		},
		PARTY_VOICE_PARTICIPANT_WAS_UNMUTED = {
			ADD_OBSERVER = "AddObserverPartyVoiceParticipantWasUnmuted",
			NOTIFY = "NotifyPartyVoiceParticipantWasUnmuted",
			REMOVE_OBSERVER = "RemoveObserverPartyVoiceParticipantWasUnmuted"
		},
		PARTY_VOICE_PARTICIPANT_IS_ACTIVE = {
			ADD_OBSERVER = "AddObserverPartyVoiceParticipantIsActive",
			NOTIFY = "NotifyPartyVoiceParticipantIsActive",
			REMOVE_OBSERVER = "RemoveObserverPartyVoiceParticipantIsActive"
		},
		PARTY_VOICE_PARTICIPANT_IS_INACTIVE = {
			ADD_OBSERVER = "AddObserverPartyVoiceParticipantIsInactive",
			NOTIFY = "NotifyPartyVoiceParticipantIsInactive",
			REMOVE_OBSERVER = "RemoveObserverPartyVoiceParticipantIsInactive"
		},
		MUTE_PARTY_VOICE_PARTICIPANT = {
			ADD_OBSERVER = "AddObserverPartyVoiceParticipantMute",
			NOTIFY = "NotifyPartyVoiceParticipantMute",
			REMOVE_OBSERVER = "RemoveObserverPartyVoiceParticipantMute"
		},
		UNMUTE_PARTY_VOICE_PARTICIPANT = {
			ADD_OBSERVER = "AddObserverPartyVoiceParticipantUnmute",
			NOTIFY = "NotifyPartyVoiceParticipantUnmute",
			REMOVE_OBSERVER = "RemoveObserverPartyVoiceParticipantUnmute"
		},
		ENABLE_PARTY_VOICE_CHANGER = {
			ADD_OBSERVER = "AddObserverPartyVoiceChangerEnable",
			NOTIFY = "NotifyPartyVoiceChangerEnable",
			REMOVE_OBSERVER = "RemoveObserverPartyVoiceChangerEnable"
		},
		DISABLE_PARTY_VOICE_CHANGER = {
			ADD_OBSERVER = "AddObserverPartyVoiceChangerDisable",
			NOTIFY = "NotifyPartyVoiceChangerDisable",
			REMOVE_OBSERVER = "RemoveObserverPartyVoiceChangerDisable"
		},
		PARTY_VOICE_CHANGER_WAS_ENABLED = {
			ADD_OBSERVER = "AddObserverPartyVoiceChangerWasEnabled",
			NOTIFY = "NotifyPartyVoiceChangerWasEnabled",
			REMOVE_OBSERVER = "RemoveObserverPartyVoiceChangerWasEnabled"
		},
		PARTY_VOICE_CHANGER_WAS_DISABLED = {
			ADD_OBSERVER = "AddObserverPartyVoiceChangerWasDisabled",
			NOTIFY = "NotifyPartyVoiceChangerWasDisabled",
			REMOVE_OBSERVER = "RemoveObserverPartyVoiceChangerWasDisabled"
		},
		SET_PARTY_VOICE_PACK = {
			ADD_OBSERVER = "AddObserverPartyVoiceSetVoicePack",
			NOTIFY = "NotifyPartyVoiceSetVoicePack",
			REMOVE_OBSERVER = "RemoveObserverPartyVoiceSetVoicePack"
		},
		PARTY_VOICE_PACK_WAS_SET = {
			ADD_OBSERVER = "AddObserverPartyVoicePackWasSet",
			NOTIFY = "NotifyPartyVoicePackWasSet",
			REMOVE_OBSERVER = "RemoveObserverPartyVoicePackWasSet"
		},
		ENABLE_PARTY_VOICE_CHANGER_FEEDBACK = {
			ADD_OBSERVER = "AddObserverPartyVoiceChangerFeedbackEnable",
			NOTIFY = "NotifyPartyVoiceChangerFeedbackEnable",
			REMOVE_OBSERVER = "RemoveObserverPartyVoiceChangerFeedbackEnable"
		},
		DISABLE_PARTY_VOICE_CHANGER_FEEDBACK = {
			ADD_OBSERVER = "AddObserverPartyVoiceChangerFeedbackDisable",
			NOTIFY = "NotifyPartyVoiceChangerFeedbackDisable",
			REMOVE_OBSERVER = "RemoveObserverPartyVoiceChangerFeedbackDisable"
		},
		PARTY_VOICE_CHANGER_FEEDBACK_WAS_ENABLED = {
			ADD_OBSERVER = "AddObserverPartyVoiceChangerFeedbackWasEnabled",
			NOTIFY = "NotifyPartyVoiceChangerFeedbackWasEnabled",
			REMOVE_OBSERVER = "RemoveObserverPartyVoiceChangerFeedbackWasEnabled"
		},
		PARTY_VOICE_CHANGER_FEEDBACK_WAS_DISABLED = {
			ADD_OBSERVER = "AddObserverPartyVoiceChangerFeedbackWasDisabled",
			NOTIFY = "NotifyPartyVoiceChangerFeedbackWasDisabled",
			REMOVE_OBSERVER = "RemoveObserverPartyVoiceChangerFeedbackWasDisabled"
		},
		PARTY_VOICE_BLOCK_PARTICIPANT = {
			ADD_OBSERVER = "AddObserverPartyVoiceParticipantBlock",
			NOTIFY = "NotifyPartyVoiceParticipantBlock",
			REMOVE_OBSERVER = "RemoveObserverPartyVoiceParticipantBlock"
		},
		PARTY_VOICE_UNBLOCK_PARTICIPANT = {
			ADD_OBSERVER = "AddObserverPartyVoiceParticipantUnblock",
			NOTIFY = "NotifyPartyVoiceParticipantUnblock",
			REMOVE_OBSERVER = "RemoveObserverPartyVoiceParticipantUnblock"
		},
		PARTY_VOICE_MEMORY_LOW = {
			ADD_OBSERVER = "AddObserverPartyVoiceMemoryLow",
			NOTIFY = "NotifyPartyVoiceMemoryLow",
			REMOVE_OBSERVER = "RemoveObserverPartyVoiceMemoryLow"
		},
		PARTY_VOICE_MUTE_ALL = {
			ADD_OBSERVER = "AddObserverPartyVoiceMuteAll",
			NOTIFY = "NotifyPartyVoiceMuteAll",
			REMOVE_OBSERVER = "RemoveObserverPartyVoiceMuteAll"
		},
		PARTY_VOICE_UNMUTE_ALL = {
			ADD_OBSERVER = "AddObserverPartyVoiceUnmuteAll",
			NOTIFY = "NotifyPartyVoiceUnmuteAll",
			REMOVE_OBSERVER = "RemoveObserverPartyVoiceUnmuteAll"
		},
		FOREGROUND_UI_READY = {
			ADD_OBSERVER = "AddObserverForegroundUIReady",
			NOTIFY = "NotifyForegroundUIReady",
			REMOVE_OBSERVER = "RemoveObserverForegroundUIReady"
		}
	},
	AUDIO_FOCUS_MANAGEMENT = {
		CEV = { CONTEXT_ID = 2, FOCUS_PRIORITY = 2 },
		UGC = { CONTEXT_ID = 1, FOCUS_PRIORITY = 1 }
	}
}