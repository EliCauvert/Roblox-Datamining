local parent = script:FindFirstAncestor("CrossExperienceVoice").Parent
local cryoModule = require(parent.Cryo)
local dashModule = require(parent.Dash)
local enums = require(parent.SocialLuaAnalytics).Analytics.Enums
local contexts = enums.Contexts
local eventTypes = enums.EventTypes
local eventNamesModule = require(script.Parent.EventNames)
local t = {
	cevJoinAttemptId = dashModule.identity,
	clientTimeStamp = dashModule.identity
}

return {
	[eventNamesModule.PartyVoiceStateChanged] = {
		context = contexts.PartyVoice,
		eventType = eventTypes.PartyVoiceStateChanged,
		formatRulesForAdditionalInfo = cryoModule.Dictionary.union(t, {
			userId = dashModule.identity,
			partyId = dashModule.identity,
			detail = dashModule.identity,
			voiceSessionId = dashModule.identity,
			voiceChannelId = dashModule.identity,
			status = dashModule.identity,
			previousStatus = dashModule.identity,
			activeDm = dashModule.identity
		})
	},
	[eventNamesModule.PartyVoiceJoinAttempt] = {
		context = contexts.PartyVoice,
		eventType = eventTypes.PartyVoiceJoinAttempt,
		formatRulesForAdditionalInfo = cryoModule.Dictionary.union(t, {
			userId = dashModule.identity,
			partyId = dashModule.identity,
			targetPlaceId = dashModule.identity,
			isConnected = dashModule.identity,
			activeDm = dashModule.identity
		})
	},
	[eventNamesModule.PartyVoiceJoinFailure] = {
		context = contexts.PartyVoice,
		eventType = eventTypes.PartyVoiceJoinFailure,
		formatRulesForAdditionalInfo = cryoModule.Dictionary.union(t, {
			userId = dashModule.identity,
			partyId = dashModule.identity,
			errorMessage = dashModule.identity
		})
	},
	[eventNamesModule.PartyVoiceConnectedParticipantsOnJoin] = {
		context = contexts.PartyVoice,
		eventType = eventTypes.PartyVoiceConnectedParticipantsOnJoin,
		formatRulesForAdditionalInfo = cryoModule.Dictionary.union(t, {
			userId = dashModule.identity,
			partyId = dashModule.identity,
			status = dashModule.identity,
			voiceChannelId = dashModule.identity,
			voiceSessionId = dashModule.identity,
			voicePlaySessionId = dashModule.identity,
			participants = dashModule.identity,
			numberActive = dashModule.identity,
			activeDm = dashModule.identity
		})
	},
	[eventNamesModule.PartyVoiceUnmuteParticipant] = {
		context = contexts.PartyVoice,
		eventType = eventTypes.PartyVoiceUnmuteParticipant,
		formatRulesForAdditionalInfo = cryoModule.Dictionary.union(t, {
			userId = dashModule.identity,
			partyId = dashModule.identity
		})
	},
	[eventNamesModule.PartyVoiceMuteParticipant] = {
		context = contexts.PartyVoice,
		eventType = eventTypes.PartyVoiceMuteParticipant,
		formatRulesForAdditionalInfo = cryoModule.Dictionary.union(t, {
			userId = dashModule.identity,
			partyId = dashModule.identity
		})
	},
	[eventNamesModule.PartyVoiceBlockParticipant] = {
		context = contexts.PartyVoice,
		eventType = eventTypes.PartyVoiceBlockParticipant,
		formatRulesForAdditionalInfo = cryoModule.Dictionary.union(t, {
			userId = dashModule.identity,
			partyId = dashModule.identity
		})
	},
	[eventNamesModule.PartyVoiceUnblockParticipant] = {
		context = contexts.PartyVoice,
		eventType = eventTypes.PartyVoiceUnblockParticipant,
		formatRulesForAdditionalInfo = cryoModule.Dictionary.union(t, {
			userId = dashModule.identity,
			partyId = dashModule.identity
		})
	},
	[eventNamesModule.PartyVoiceOnCrossExperienceStartedSignalReceived] = {
		context = contexts.PartyVoice,
		eventType = eventTypes.PartyVoiceOnCrossExperienceStartedSignalReceived,
		formatRulesForAdditionalInfo = cryoModule.Dictionary.union(t, {
			hasExperienceStarted = dashModule.identity,
			isActiveDM = dashModule.identity
		})
	},
	[eventNamesModule.PartyVoiceStateChangeHandlerRun] = {
		context = contexts.PartyVoice,
		eventType = eventTypes.PartyVoiceStateChangeHandlerRun,
		formatRulesForAdditionalInfo = cryoModule.Dictionary.union(t, {
			isActiveDM = dashModule.identity,
			status = dashModule.identity,
			detail = dashModule.identity
		})
	}
}