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
					status = function(p0) --[[ line: 21 ]]
						return p0
					end,
					previousStatus = function(p1) --[[ line: 24 ]]
						return p1
					end,
					detail = function(p2) --[[ line: 27 ]]
						return p2
					end,
					activeDm = function(p3) --[[ line: 30 ]]
						return p3
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
					numberActive = function(p4) --[[ line: 44 ]]
						return p4
					end,
					activeDm = function(p5) --[[ line: 47 ]]
						return p5
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
					errorMessage = function(p6) --[[ line: 61 ]]
						return p6
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
					activeDm = function(p7) --[[ line: 75 ]]
						return p7
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