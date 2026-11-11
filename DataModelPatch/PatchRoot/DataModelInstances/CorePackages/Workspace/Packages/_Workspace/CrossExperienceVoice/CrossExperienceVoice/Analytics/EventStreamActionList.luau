local Parent = script:FindFirstAncestor("CrossExperienceVoice").Parent
local CryoModule = require(Parent.Cryo)
local DashModule = require(Parent.Dash)
local Enums = require(Parent.SocialLuaAnalytics).Analytics.Enums
local Contexts = Enums.Contexts
local EventTypes = Enums.EventTypes
local EventNamesModule = require(script.Parent.EventNames)
local config = {
	cevJoinAttemptId = DashModule.identity,
	clientTimeStamp = DashModule.identity
}

return {
	[EventNamesModule.PartyVoiceStateChanged] = {
		context = Contexts.PartyVoice,
		eventType = EventTypes.PartyVoiceStateChanged,
		formatRulesForAdditionalInfo = CryoModule.Dictionary.union(config, {
			userId = DashModule.identity,
			partyId = DashModule.identity,
			detail = DashModule.identity,
			voiceSessionId = DashModule.identity,
			voiceChannelId = DashModule.identity,
			status = DashModule.identity,
			previousStatus = DashModule.identity,
			activeDm = DashModule.identity
		})
	},
	[EventNamesModule.PartyVoiceJoinAttempt] = {
		context = Contexts.PartyVoice,
		eventType = EventTypes.PartyVoiceJoinAttempt,
		formatRulesForAdditionalInfo = CryoModule.Dictionary.union(config, {
			userId = DashModule.identity,
			partyId = DashModule.identity,
			targetPlaceId = DashModule.identity,
			isConnected = DashModule.identity,
			activeDm = DashModule.identity
		})
	},
	[EventNamesModule.PartyVoiceJoinFailure] = {
		context = Contexts.PartyVoice,
		eventType = EventTypes.PartyVoiceJoinFailure,
		formatRulesForAdditionalInfo = CryoModule.Dictionary.union(config, {
			userId = DashModule.identity,
			partyId = DashModule.identity,
			errorMessage = DashModule.identity
		})
	},
	[EventNamesModule.PartyVoiceConnectedParticipantsOnJoin] = {
		context = Contexts.PartyVoice,
		eventType = EventTypes.PartyVoiceConnectedParticipantsOnJoin,
		formatRulesForAdditionalInfo = CryoModule.Dictionary.union(config, {
			userId = DashModule.identity,
			partyId = DashModule.identity,
			status = DashModule.identity,
			voiceChannelId = DashModule.identity,
			voiceSessionId = DashModule.identity,
			voicePlaySessionId = DashModule.identity,
			participants = DashModule.identity,
			numberActive = DashModule.identity,
			activeDm = DashModule.identity
		})
	},
	[EventNamesModule.PartyVoiceUnmuteParticipant] = {
		context = Contexts.PartyVoice,
		eventType = EventTypes.PartyVoiceUnmuteParticipant,
		formatRulesForAdditionalInfo = CryoModule.Dictionary.union(config, {
			userId = DashModule.identity,
			partyId = DashModule.identity
		})
	},
	[EventNamesModule.PartyVoiceMuteParticipant] = {
		context = Contexts.PartyVoice,
		eventType = EventTypes.PartyVoiceMuteParticipant,
		formatRulesForAdditionalInfo = CryoModule.Dictionary.union(config, {
			userId = DashModule.identity,
			partyId = DashModule.identity
		})
	},
	[EventNamesModule.PartyVoiceBlockParticipant] = {
		context = Contexts.PartyVoice,
		eventType = EventTypes.PartyVoiceBlockParticipant,
		formatRulesForAdditionalInfo = CryoModule.Dictionary.union(config, {
			userId = DashModule.identity,
			partyId = DashModule.identity
		})
	},
	[EventNamesModule.PartyVoiceUnblockParticipant] = {
		context = Contexts.PartyVoice,
		eventType = EventTypes.PartyVoiceUnblockParticipant,
		formatRulesForAdditionalInfo = CryoModule.Dictionary.union(config, {
			userId = DashModule.identity,
			partyId = DashModule.identity
		})
	},
	[EventNamesModule.PartyVoiceOnCrossExperienceStartedSignalReceived] = {
		context = Contexts.PartyVoice,
		eventType = EventTypes.PartyVoiceOnCrossExperienceStartedSignalReceived,
		formatRulesForAdditionalInfo = CryoModule.Dictionary.union(config, {
			hasExperienceStarted = DashModule.identity,
			isActiveDM = DashModule.identity
		})
	},
	[EventNamesModule.PartyVoiceStateChangeHandlerRun] = {
		context = Contexts.PartyVoice,
		eventType = EventTypes.PartyVoiceStateChangeHandlerRun,
		formatRulesForAdditionalInfo = CryoModule.Dictionary.union(config, {
			isActiveDM = DashModule.identity,
			status = DashModule.identity,
			detail = DashModule.identity
		})
	}
}