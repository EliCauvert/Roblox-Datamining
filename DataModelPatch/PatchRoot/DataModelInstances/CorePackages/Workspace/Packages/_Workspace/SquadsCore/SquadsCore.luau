local _ = require(script.Enums.SquadRootViewType)
local _ = require(script.Enums.SquadState)
local _ = require(script.Types)

return {
	Actions = require(script.Actions),
	Analytics = {
		EventNames = require(script.Analytics).EventNames,
		logInExpCoplayTelemetry = require(script.Analytics).logInExpCoplayTelemetry
	},
	Common = {
		Constants = {
			CHANNEL_PARTICIPANT_ADDED_DETAIL_TYPE = require(script.Common.Constants).CHANNEL_PARTICIPANT_ADDED_DETAIL_TYPE,
			CHANNEL_PARTICIPANT_REMOVED_DETAIL_TYPE = require(script.Common.Constants).CHANNEL_PARTICIPANT_REMOVED_DETAIL_TYPE,
			COMMUNICATION_CHANNEL_RTN_NAMESPACE = require(script.Common.Constants).COMMUNICATION_CHANNEL_RTN_NAMESPACE,
			CONVERSATION_CHANNEL_GROUP_TYPE = require(script.Common.Constants).CONVERSATION_CHANNEL_GROUP_TYPE,
			CONVERSATION_CHANNEL_ONE_TO_ONE_TYPE = require(script.Common.Constants).CONVERSATION_CHANNEL_ONE_TO_ONE_TYPE,
			ACTIVE_SQUAD_APP_STORAGE_KEY = require(script.Common.Constants).ACTIVE_SQUAD_APP_STORAGE_KEY,
			SQUAD_CHANNEL_TYPE = require(script.Common.Constants).SQUAD_CHANNEL_TYPE,
			SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY = require(script.Common.Constants).SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY,
			SQUAD_VOICE_EU_MODAL_SEEN_KEY = require(script.Common.Constants).SQUAD_VOICE_EU_MODAL_SEEN_KEY,
			SQUAD_TOP_BANNER_TEST_ID = require(script.Common.Constants).SQUAD_TOP_BANNER_TEST_ID
		},
		getColorFromUserId = require(script.Common.getColorFromUserId),
		clearSquadStorage = require(script.Common.clearSquadStorage),
		validateSquadId = require(script.Common.validateSquadId),
		encodeSquadMembers = require(script.Common.encodeSquadMembers),
		encodeUserIds = require(script.Common.encodeUserIds)
	},
	Components = {
		LocalPlayerPartyVoiceEligibleBinder = require(script.Components).LocalPlayerPartyVoiceEligibleBinder
	},
	Enums = require(script.Enums),
	Flags = require(script.Flags),
	Hooks = require(script.Hooks),
	Http = require(script.Http),
	Models = require(script.Models),
	NetworkRequests = require(script.NetworkRequests),
	RoduxKey = require(script.Common.Constants).RODUX_KEY,
	RoduxSquads = require(script.RoduxSquads),
	SquadAppChatEventReceiver = require(script.Components).SquadAppChatEventReceiver,
	SquadEventReceiver = require(script.Components).SquadEventReceiver,
	SquadExternalContractProvider = require(script.Components).SquadExternalContractProvider,
	SquadOverlay = require(script.Components).SquadOverlay,
	SquadPrompt = require(script.Components).SquadPrompt,
	SquadSessionProvider = require(script.Components).SquadSessionProvider,
	Stores = require(script.Stores),
	Thunks = require(script.Thunks),
	Types = require(script.Types),
	installReducer = require(script.installReducer),
	Utils = {
		appStorageAccess = require(script.Utils.appStorageAccess),
		displayEuConsentPrompt = require(script.Utils.displayEuConsentPrompt)
	},
	["jest.config"] = script["jest.config"]
}