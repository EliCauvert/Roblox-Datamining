local SupportedTelemetryBackends = require(script:FindFirstAncestor("CrossExperienceVoice").Parent.SocialLuaAnalytics).Analytics.Enums.SupportedTelemetryBackends
local EventNamesModule = require(script.Parent.EventNames)

return {
	defaults = {
		links = "",
		throttlingThousandths = game:DefineFastInt("PartyVoiceTelemetryThrottlingThousandths", 1000)
	},
	[EventNamesModule.PartyVoiceStateChanged] = {
		description = "Event when a user transitions state during a party voice session",
		lastUpdated = { 24, 12, 8 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					status = function(p1)
						return p1
					end,
					previousStatus = function(p1)
						return p1
					end,
					detail = function(p1)
						return p1
					end,
					activeDm = function(p1)
						return p1
					end
				}
			}
		}
	},
	[EventNamesModule.PartyVoiceConnectedParticipantsOnJoin] = {
		description = "Event when a user successfully connects to a party voice channel",
		lastUpdated = { 24, 11, 30 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					numberActive = function(p1)
						return p1
					end,
					activeDm = function(p1)
						return p1
					end
				}
			}
		}
	},
	[EventNamesModule.PartyVoiceJoinFailure] = {
		description = "Event when a user attempts to connect to party voice and results in failure",
		lastUpdated = { 25, 3, 12 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					errorMessage = function(p1)
						return p1
					end
				}
			}
		}
	},
	[EventNamesModule.PartyVoiceJoinAttempt] = {
		description = "Event when a user attempts to connect to party voice",
		lastUpdated = { 24, 12, 8 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					activeDm = function(p1)
						return p1
					end
				}
			}
		}
	},
	[EventNamesModule.PartyVoiceUnmuteParticipant] = {
		description = "Event when a user unmutes a participant in party voice",
		lastUpdated = { 25, 3, 30 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.PartyVoiceMuteParticipant] = {
		description = "Event when a user mutes a participant in party voice",
		lastUpdated = { 25, 3, 30 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.PartyVoiceBlockParticipant] = {
		description = "Event when a user blocks a participant in party voice",
		lastUpdated = { 25, 3, 30 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.PartyVoiceUnblockParticipant] = {
		description = "Event when a user unblocks a participant in party voice",
		lastUpdated = { 25, 3, 30 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	}
}