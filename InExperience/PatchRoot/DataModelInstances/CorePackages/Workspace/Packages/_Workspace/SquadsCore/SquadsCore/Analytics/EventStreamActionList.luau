local parent = script:FindFirstAncestor("SquadsCore").Parent
local dashModule = require(parent.Dash)
local enums = require(parent.SocialLuaAnalytics).Analytics.Enums
local contexts = enums.Contexts
local eventTypes = enums.EventTypes
local eventNamesModule = require(script.Parent.EventNames)

return {
	[eventNamesModule.EnterSquadButtonPressed] = {
		context = contexts.Squads,
		eventType = eventTypes.EnterSquadButtonPressed,
		formatRulesForAdditionalInfo = {
			conversationId = dashModule.identity,
			partyAttemptId = dashModule.identity,
			squadButtonSource = dashModule.identity,
			squadId = dashModule.identity,
			squadLocation = dashModule.identity,
			userIntention = dashModule.identity
		}
	},
	[eventNamesModule.MultiInviteMenuActionStatus] = {
		context = contexts.Squads,
		eventType = eventTypes.MultiInviteMenuActionStatus,
		formatRulesForAdditionalInfo = {
			actionLocation = dashModule.identity,
			actionType = dashModule.identity,
			activeFriendsPresences = dashModule.identity,
			activeFriendsUserIds = dashModule.identity,
			clientTimeStamp = dashModule.identity,
			numActiveFriends = dashModule.identity,
			numSelectedFriends = dashModule.identity,
			partyAttemptId = dashModule.identity,
			selectedFriendsPresences = dashModule.identity,
			selectedFriendsUserIds = dashModule.identity,
			selectionPageType = dashModule.identity,
			squadId = dashModule.identity
		}
	},
	[eventNamesModule.NoResponseInviteAgainOrAddOthers] = {
		context = contexts.Squads,
		eventType = eventTypes.NoResponseInviteAgainOrAddOthers,
		formatRulesForAdditionalInfo = {
			actionType = dashModule.identity,
			conversationId = dashModule.identity,
			button = dashModule.identity,
			squadId = dashModule.identity,
			squadLocation = dashModule.identity
		}
	},
	[eventNamesModule.PartySheetAction] = {
		context = contexts.Squads,
		eventType = eventTypes.PartySheetAction,
		formatRulesForAdditionalInfo = {
			parentChannelId = dashModule.identity,
			actionType = dashModule.identity,
			squadId = dashModule.identity,
			squadLocation = dashModule.identity,
			isFtuxTooltipShown = dashModule.identity,
			voiceStatus = dashModule.identity
		}
	},
	[eventNamesModule.PartyCoplay] = {
		context = contexts.Squads,
		eventType = eventTypes.PartyCoplay,
		formatRulesForAdditionalInfo = {
			partyCoplayEvent = dashModule.identity,
			partyId = dashModule.identity,
			partyPlayersInGameInstanceCount = dashModule.identity,
			partyPlayersInGameInstanceUserIds = dashModule.identity,
			partyTotalSize = dashModule.identity,
			partyTotalSizeUserIds = dashModule.identity
		}
	},
	[eventNamesModule.SquadInvitePageNavSource] = {
		context = contexts.Squads,
		eventType = eventTypes.SquadInvitePageNavSource,
		formatRulesForAdditionalInfo = {
			parentChannelId = dashModule.identity,
			inviteNavSource = dashModule.identity,
			squadId = dashModule.identity,
			squadLocation = dashModule.identity
		}
	},
	[eventNamesModule.SquadExperienceInviteStateChange] = {
		context = contexts.Squads,
		eventType = eventTypes.SquadExperienceInviteStateChange,
		formatRulesForAdditionalInfo = {
			experienceInviteId = dashModule.identity,
			invitationGameInstanceId = dashModule.identity,
			invitationPlaceId = dashModule.identity,
			inviterId = dashModule.identity,
			inviteState = dashModule.identity,
			parentChannelId = dashModule.identity,
			squadId = dashModule.identity,
			squadLocation = dashModule.identity,
			joinAttemptId = dashModule.identity
		}
	},
	[eventNamesModule.SquadExperienceInviteApiCall] = {
		context = contexts.Squads,
		eventType = eventTypes.SquadExperienceInviteApiCall,
		formatRulesForAdditionalInfo = {
			parentChannelId = dashModule.identity,
			errorMessage = dashModule.identity,
			errorType = dashModule.identity,
			experienceInviteId = dashModule.identity,
			invitationPlaceId = dashModule.identity,
			isSuccess = dashModule.identity,
			squadId = dashModule.identity,
			squadLocation = dashModule.identity,
			squadMembers = dashModule.identity,
			squadMembersCount = dashModule.identity
		}
	},
	[eventNamesModule.SquadInvite] = {
		context = contexts.Squads,
		eventType = eventTypes.SquadInvite,
		formatRulesForAdditionalInfo = {
			parentChannelId = dashModule.identity,
			errorMessage = dashModule.identity,
			errorType = dashModule.identity,
			inviteeCount = dashModule.identity,
			inviteeUserIds = dashModule.identity,
			isSuccess = dashModule.identity,
			source = dashModule.identity,
			squadId = dashModule.identity,
			squadLocation = dashModule.identity,
			userId = dashModule.identity
		}
	},
	[eventNamesModule.SquadVoteApiCall] = {
		context = contexts.Squads,
		eventType = eventTypes.SquadVoteApiCall,
		formatRulesForAdditionalInfo = {
			parentChannelId = dashModule.identity,
			errorMessage = dashModule.identity,
			errorType = dashModule.identity,
			experienceInviteId = dashModule.identity,
			isSuccess = dashModule.identity,
			squadId = dashModule.identity,
			squadLocation = dashModule.identity,
			voteType = dashModule.identity
		}
	},
	[eventNamesModule.SquadToastActions] = {
		context = contexts.Squads,
		eventType = eventTypes.SquadToastActions,
		formatRulesForAdditionalInfo = {
			experienceInviteId = dashModule.identity,
			parentChannelId = dashModule.identity,
			partyAttemptId = dashModule.identity,
			nudgeId = dashModule.identity,
			nudgeType = dashModule.identity,
			squadId = dashModule.identity,
			squadLocation = dashModule.identity,
			toastAction = dashModule.identity,
			toastType = dashModule.identity
		}
	},
	[eventNamesModule.SquadTopBannerClicked] = {
		context = contexts.Squads,
		eventType = eventTypes.SquadTopBannerClicked,
		formatRulesForAdditionalInfo = {
			parentChannelId = dashModule.identity,
			squadId = dashModule.identity,
			squadMembers = dashModule.identity,
			timePassedSinceLastStateUpdatedInSec = dashModule.identity
		}
	},
	[eventNamesModule.SquadCreateOrJoinFromRCC] = {
		context = contexts.Squads,
		eventType = eventTypes.SquadCreateOrJoinFromRCC,
		formatRulesForAdditionalInfo = {
			partySourceType = dashModule.identity,
			nudgeId = dashModule.identity,
			nudgeType = dashModule.identity,
			partyAttemptId = dashModule.identity,
			inviteeUserIds = dashModule.identity
		}
	},
	[eventNamesModule.SquadPromptResponded] = {
		context = contexts.Squads,
		eventType = eventTypes.SquadPromptResponded,
		formatRulesForAdditionalInfo = {
			promptType = dashModule.identity,
			responseType = dashModule.identity,
			scheduledSquadId = dashModule.identity,
			squadId = dashModule.identity,
			squadLocation = dashModule.identity
		}
	},
	[eventNamesModule.ScheduledSquadAction] = {
		context = contexts.Squads,
		eventType = eventTypes.ScheduledSquadAction,
		formatRulesForAdditionalInfo = {
			actionType = dashModule.identity,
			conversationId = dashModule.identity,
			scheduledSquadId = dashModule.identity,
			source = dashModule.identity,
			squadId = dashModule.identity,
			squadLocation = dashModule.identity
		}
	},
	[eventNamesModule.SquadRegroupButtonClicked] = {
		context = contexts.Squads,
		eventType = eventTypes.SquadRegroupButtonClicked,
		formatRulesForAdditionalInfo = {
			clientTimestamp = dashModule.identity,
			squadId = dashModule.identity,
			initiatorId = dashModule.identity,
			gameInstanceId = dashModule.identity,
			rootPlaceId = dashModule.identity,
			placeId = dashModule.identity,
			universeId = dashModule.identity,
			playSessionId = dashModule.identity,
			experienceInviteId = dashModule.identity,
			button = dashModule.identity,
			entryPoint = dashModule.identity
		}
	},
	[eventNamesModule.SquadRegroupPromptShown] = {
		context = contexts.Squads,
		eventType = eventTypes.SquadRegroupPromptShown,
		formatRulesForAdditionalInfo = {
			clientTimestamp = dashModule.identity,
			squadId = dashModule.identity,
			initiatorId = dashModule.identity,
			gameInstanceId = dashModule.identity,
			rootPlaceId = dashModule.identity,
			placeId = dashModule.identity,
			universeId = dashModule.identity,
			playSessionId = dashModule.identity,
			experienceInviteId = dashModule.identity,
			button = dashModule.identity,
			entryPoint = dashModule.identity
		}
	},
	[eventNamesModule.SquadRegroupPromptClicked] = {
		context = contexts.Squads,
		eventType = eventTypes.SquadRegroupPromptClicked,
		formatRulesForAdditionalInfo = {
			clientTimestamp = dashModule.identity,
			squadId = dashModule.identity,
			initiatorId = dashModule.identity,
			gameInstanceId = dashModule.identity,
			rootPlaceId = dashModule.identity,
			placeId = dashModule.identity,
			universeId = dashModule.identity,
			playSessionId = dashModule.identity,
			experienceInviteId = dashModule.identity,
			button = dashModule.identity,
			entryPoint = dashModule.identity
		}
	},
	[eventNamesModule.SquadExperienceInviteImpression] = {
		context = contexts.Squads,
		eventType = eventTypes.SquadExperienceInviteImpression,
		formatRulesForAdditionalInfo = {
			experienceInviteId = dashModule.identity,
			notificationId = dashModule.identity,
			clientTimestamp = dashModule.identity
		}
	}
}