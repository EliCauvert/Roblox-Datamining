local Parent = script:FindFirstAncestor("SquadsCore").Parent
local DashModule = require(Parent.Dash)
local Enums = require(Parent.SocialLuaAnalytics).Analytics.Enums
local Contexts = Enums.Contexts
local EventTypes = Enums.EventTypes
local EventNamesModule = require(script.Parent.EventNames)

return {
	[EventNamesModule.EnterSquadButtonPressed] = {
		context = Contexts.Squads,
		eventType = EventTypes.EnterSquadButtonPressed,
		formatRulesForAdditionalInfo = {
			conversationId = DashModule.identity,
			partyAttemptId = DashModule.identity,
			squadButtonSource = DashModule.identity,
			squadId = DashModule.identity,
			squadLocation = DashModule.identity,
			userIntention = DashModule.identity
		}
	},
	[EventNamesModule.MultiInviteMenuActionStatus] = {
		context = Contexts.Squads,
		eventType = EventTypes.MultiInviteMenuActionStatus,
		formatRulesForAdditionalInfo = {
			actionLocation = DashModule.identity,
			actionType = DashModule.identity,
			activeFriendsPresences = DashModule.identity,
			activeFriendsUserIds = DashModule.identity,
			clientTimeStamp = DashModule.identity,
			numActiveFriends = DashModule.identity,
			numSelectedFriends = DashModule.identity,
			partyAttemptId = DashModule.identity,
			selectedFriendsPresences = DashModule.identity,
			selectedFriendsUserIds = DashModule.identity,
			selectionPageType = DashModule.identity,
			squadId = DashModule.identity
		}
	},
	[EventNamesModule.NoResponseInviteAgainOrAddOthers] = {
		context = Contexts.Squads,
		eventType = EventTypes.NoResponseInviteAgainOrAddOthers,
		formatRulesForAdditionalInfo = {
			actionType = DashModule.identity,
			conversationId = DashModule.identity,
			button = DashModule.identity,
			squadId = DashModule.identity,
			squadLocation = DashModule.identity
		}
	},
	[EventNamesModule.PartySheetAction] = {
		context = Contexts.Squads,
		eventType = EventTypes.PartySheetAction,
		formatRulesForAdditionalInfo = {
			parentChannelId = DashModule.identity,
			actionType = DashModule.identity,
			squadId = DashModule.identity,
			squadLocation = DashModule.identity,
			isFtuxTooltipShown = DashModule.identity,
			voiceStatus = DashModule.identity
		}
	},
	[EventNamesModule.PartyCoplay] = {
		context = Contexts.Squads,
		eventType = EventTypes.PartyCoplay,
		formatRulesForAdditionalInfo = {
			partyCoplayEvent = DashModule.identity,
			partyId = DashModule.identity,
			partyPlayersInGameInstanceCount = DashModule.identity,
			partyPlayersInGameInstanceUserIds = DashModule.identity,
			partyTotalSize = DashModule.identity,
			partyTotalSizeUserIds = DashModule.identity
		}
	},
	[EventNamesModule.SquadInvitePageNavSource] = {
		context = Contexts.Squads,
		eventType = EventTypes.SquadInvitePageNavSource,
		formatRulesForAdditionalInfo = {
			parentChannelId = DashModule.identity,
			inviteNavSource = DashModule.identity,
			squadId = DashModule.identity,
			squadLocation = DashModule.identity
		}
	},
	[EventNamesModule.SquadExperienceInviteStateChange] = {
		context = Contexts.Squads,
		eventType = EventTypes.SquadExperienceInviteStateChange,
		formatRulesForAdditionalInfo = {
			experienceInviteId = DashModule.identity,
			invitationGameInstanceId = DashModule.identity,
			invitationPlaceId = DashModule.identity,
			inviterId = DashModule.identity,
			inviteState = DashModule.identity,
			parentChannelId = DashModule.identity,
			squadId = DashModule.identity,
			squadLocation = DashModule.identity,
			joinAttemptId = DashModule.identity
		}
	},
	[EventNamesModule.SquadExperienceInviteApiCall] = {
		context = Contexts.Squads,
		eventType = EventTypes.SquadExperienceInviteApiCall,
		formatRulesForAdditionalInfo = {
			parentChannelId = DashModule.identity,
			errorMessage = DashModule.identity,
			errorType = DashModule.identity,
			experienceInviteId = DashModule.identity,
			invitationPlaceId = DashModule.identity,
			isSuccess = DashModule.identity,
			squadId = DashModule.identity,
			squadLocation = DashModule.identity,
			squadMembers = DashModule.identity,
			squadMembersCount = DashModule.identity
		}
	},
	[EventNamesModule.SquadInvite] = {
		context = Contexts.Squads,
		eventType = EventTypes.SquadInvite,
		formatRulesForAdditionalInfo = {
			parentChannelId = DashModule.identity,
			errorMessage = DashModule.identity,
			errorType = DashModule.identity,
			inviteeCount = DashModule.identity,
			inviteeUserIds = DashModule.identity,
			isSuccess = DashModule.identity,
			source = DashModule.identity,
			squadId = DashModule.identity,
			squadLocation = DashModule.identity,
			userId = DashModule.identity
		}
	},
	[EventNamesModule.SquadVoteApiCall] = {
		context = Contexts.Squads,
		eventType = EventTypes.SquadVoteApiCall,
		formatRulesForAdditionalInfo = {
			parentChannelId = DashModule.identity,
			errorMessage = DashModule.identity,
			errorType = DashModule.identity,
			experienceInviteId = DashModule.identity,
			isSuccess = DashModule.identity,
			squadId = DashModule.identity,
			squadLocation = DashModule.identity,
			voteType = DashModule.identity
		}
	},
	[EventNamesModule.SquadToastActions] = {
		context = Contexts.Squads,
		eventType = EventTypes.SquadToastActions,
		formatRulesForAdditionalInfo = {
			experienceInviteId = DashModule.identity,
			parentChannelId = DashModule.identity,
			partyAttemptId = DashModule.identity,
			nudgeId = DashModule.identity,
			nudgeType = DashModule.identity,
			squadId = DashModule.identity,
			squadLocation = DashModule.identity,
			toastAction = DashModule.identity,
			toastType = DashModule.identity
		}
	},
	[EventNamesModule.SquadTopBannerClicked] = {
		context = Contexts.Squads,
		eventType = EventTypes.SquadTopBannerClicked,
		formatRulesForAdditionalInfo = {
			parentChannelId = DashModule.identity,
			squadId = DashModule.identity,
			squadMembers = DashModule.identity,
			timePassedSinceLastStateUpdatedInSec = DashModule.identity
		}
	},
	[EventNamesModule.SquadCreateOrJoinFromRCC] = {
		context = Contexts.Squads,
		eventType = EventTypes.SquadCreateOrJoinFromRCC,
		formatRulesForAdditionalInfo = {
			partySourceType = DashModule.identity,
			nudgeId = DashModule.identity,
			nudgeType = DashModule.identity,
			partyAttemptId = DashModule.identity,
			inviteeUserIds = DashModule.identity
		}
	},
	[EventNamesModule.SquadPromptResponded] = {
		context = Contexts.Squads,
		eventType = EventTypes.SquadPromptResponded,
		formatRulesForAdditionalInfo = {
			promptType = DashModule.identity,
			responseType = DashModule.identity,
			scheduledSquadId = DashModule.identity,
			squadId = DashModule.identity,
			squadLocation = DashModule.identity
		}
	},
	[EventNamesModule.ScheduledSquadAction] = {
		context = Contexts.Squads,
		eventType = EventTypes.ScheduledSquadAction,
		formatRulesForAdditionalInfo = {
			actionType = DashModule.identity,
			conversationId = DashModule.identity,
			scheduledSquadId = DashModule.identity,
			source = DashModule.identity,
			squadId = DashModule.identity,
			squadLocation = DashModule.identity
		}
	},
	[EventNamesModule.SquadRegroupButtonClicked] = {
		context = Contexts.Squads,
		eventType = EventTypes.SquadRegroupButtonClicked,
		formatRulesForAdditionalInfo = {
			clientTimestamp = DashModule.identity,
			squadId = DashModule.identity,
			initiatorId = DashModule.identity,
			gameInstanceId = DashModule.identity,
			rootPlaceId = DashModule.identity,
			placeId = DashModule.identity,
			universeId = DashModule.identity,
			playSessionId = DashModule.identity,
			experienceInviteId = DashModule.identity,
			button = DashModule.identity,
			entryPoint = DashModule.identity
		}
	},
	[EventNamesModule.SquadRegroupPromptShown] = {
		context = Contexts.Squads,
		eventType = EventTypes.SquadRegroupPromptShown,
		formatRulesForAdditionalInfo = {
			clientTimestamp = DashModule.identity,
			squadId = DashModule.identity,
			initiatorId = DashModule.identity,
			gameInstanceId = DashModule.identity,
			rootPlaceId = DashModule.identity,
			placeId = DashModule.identity,
			universeId = DashModule.identity,
			playSessionId = DashModule.identity,
			experienceInviteId = DashModule.identity,
			button = DashModule.identity,
			entryPoint = DashModule.identity
		}
	},
	[EventNamesModule.SquadRegroupPromptClicked] = {
		context = Contexts.Squads,
		eventType = EventTypes.SquadRegroupPromptClicked,
		formatRulesForAdditionalInfo = {
			clientTimestamp = DashModule.identity,
			squadId = DashModule.identity,
			initiatorId = DashModule.identity,
			gameInstanceId = DashModule.identity,
			rootPlaceId = DashModule.identity,
			placeId = DashModule.identity,
			universeId = DashModule.identity,
			playSessionId = DashModule.identity,
			experienceInviteId = DashModule.identity,
			button = DashModule.identity,
			entryPoint = DashModule.identity
		}
	},
	[EventNamesModule.SquadExperienceInviteImpression] = {
		context = Contexts.Squads,
		eventType = EventTypes.SquadExperienceInviteImpression,
		formatRulesForAdditionalInfo = {
			experienceInviteId = DashModule.identity,
			notificationId = DashModule.identity,
			clientTimestamp = DashModule.identity
		}
	}
}