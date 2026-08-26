local supportedTelemetryBackends = require(script:FindFirstAncestor("CrossExperienceVoice").Parent.SocialLuaAnalytics).Analytics.Enums.SupportedTelemetryBackends
local eventNamesModule = require(script.Parent.EventNames)

return {
	defaults = {
		links = "",
		throttlingThousandths = game:DefineFastInt("PartyVoiceTelemetryThrottlingThousandths", 1000)
	},
	[eventNamesModule.PartyVoiceStateChanged] = {
		description = "Event when a user transitions state during a party voice session",
		lastUpdated = { 24, 12, 8 },
		backendsList = {
			{
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
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
	[eventNamesModule.PartyVoiceConnectedParticipantsOnJoin] = {
		description = "Event when a user successfully connects to a party voice channel",
		lastUpdated = { 24, 11, 30 },
		backendsList = {
			{
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
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
	[eventNamesModule.PartyVoiceJoinFailure] = {
		description = "Event when a user attempts to connect to party voice and results in failure",
		lastUpdated = { 25, 3, 12 },
		backendsList = {
			{
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					errorMessage = function(p1)
						return p1
					end
				}
			}
		}
	},
	[eventNamesModule.PartyVoiceJoinAttempt] = {
		description = "Event when a user attempts to connect to party voice",
		lastUpdated = { 24, 12, 8 },
		backendsList = {
			{
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					activeDm = function(p1)
						return p1
					end
				}
			}
		}
	},
	[eventNamesModule.PartyVoiceUnmuteParticipant] = {
		description = "Event when a user unmutes a participant in party voice",
		lastUpdated = { 25, 3, 30 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.PartyVoiceMuteParticipant] = {
		description = "Event when a user mutes a participant in party voice",
		lastUpdated = { 25, 3, 30 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.PartyVoiceBlockParticipant] = {
		description = "Event when a user blocks a participant in party voice",
		lastUpdated = { 25, 3, 30 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.PartyVoiceUnblockParticipant] = {
		description = "Event when a user unblocks a participant in party voice",
		lastUpdated = { 25, 3, 30 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	}
}