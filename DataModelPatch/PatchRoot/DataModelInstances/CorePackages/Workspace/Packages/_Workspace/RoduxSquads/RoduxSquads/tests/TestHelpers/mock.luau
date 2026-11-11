local RoduxSquads = script:FindFirstAncestor("RoduxSquads")
local Parent = RoduxSquads.Parent
local RoduxModule = require(Parent.Rodux)
local ExperienceInviteStateModule = require(RoduxSquads.Enums.ExperienceInviteState)
local ExperienceInviteVoteTypeModule = require(RoduxSquads.Enums.ExperienceInviteVoteType)
local _ = require(RoduxSquads.RoduxSquadsTypes)

local function CreateServerSquad(p1, p2)
	return {
		initiatorId = 123,
		createdAtTime = "2024-07-19T21:02:47.777+00:00",
		parentChannelId = "23456",
		groupUpId = p2 or "12345",
		updatedAtTime = p1 or "2024-07-19T21:02:47.777+00:00",
		members = { { userId = 123 }, { userId = 456 } },
		invitees = {
			{ userId = 123, invitedAtTimestampMs = 111111 },
			{ userId = 456, invitedAtTimestampMs = 111111 }
		}
	}
end

local function CreateExperienceInvite(p1, p2, p3, p4)
	-- upvalues: ExperienceInviteStateModule (copy)
	return {
		inviterId = 65432,
		membershipEntityId = "54321",
		totalSpots = 5,
		inviteType = "PlayWithPartyInPublicServer",
		createdAtTime = p1 or "2024-07-19T21:02:47.777+00:00",
		experienceDetail = { placeId = 15308759682, gameInstanceId = "instanceId" },
		experienceInviteId = p2 or "23456",
		state = ExperienceInviteStateModule.Active,
		versionId = p4 or 1,
		votes = p3 or {}
	}
end

return {
	mockCreateExperienceInvite = "CREATE_EXPERIENCE_INVITE",
	mockCreateOrJoinSquad = "CREATE_OR_JOIN_SQUAD",
	mockGetExperienceInvite = "GET_EXPERIENCE_INVITE",
	mockGetSquadActive = "GET_SQUAD_ACTIVE",
	mockGetSquadFromSquadId = "GET_SQUAD_FROM_SQUAD_ID",
	mockJoinSquad = "JOIN_SQUAD",
	mockLeaveSquad = "LEAVE_SQUAD",
	mockVoteForExperienceInvite = "VOTE_FOR_EXPERIENCE_INVITE",
	mockActOnPartyNudge = "ACT_ON_PARTY_NUDGE",
	mockSelfPermissionUpdated = "SELF_PERMISSION_UPDATED",
	createStorage = function()
		return {
			memStorageKey = "key",
			getItem = function()
				return nil
			end,
			setItem = function(_): boolean
				return true
			end,
			bindAndFire = function(_)
				return { Disconnect = function() end }
			end
		}
	end,
	createExperienceInvite = CreateExperienceInvite,
	createSquad = function(p1, p2, p3, p4, p5, p6, p7)
		return {
			squadId = p2 or "12345",
			initiatorId = p5 or 123,
			createdAtTime = p3 or "2024-07-19T21:02:47.777+00:00",
			updatedAtTime = p1 or "2024-07-19T21:02:47.777+00:00",
			parentChannelId = p4 or "23456",
			members = p6 or { { userId = 123 }, { userId = 456 } },
			invitees = p7 or {
				{ userId = 123, invitedAtTimestampMs = 111111 },
				{ userId = 456, invitedAtTimestampMs = 111111 }
			}
		}
	end,
	createServerSquad = CreateServerSquad,
	mock = require(Parent.Dev.LuaSocialLibrariesDeps).Mock,
	mockCreateExperienceInviteAction = RoduxModule.makeActionCreator("CREATE_EXPERIENCE_INVITE", function()
		-- upvalues: CreateExperienceInvite (copy)
		return { responseBody = CreateExperienceInvite() }
	end),
	mockCreateOrJoinSquadAction = RoduxModule.makeActionCreator("CREATE_OR_JOIN_SQUAD", function()
		-- upvalues: CreateServerSquad (copy)
		return { responseBody = { groupUp = CreateServerSquad() } }
	end),
	mockGetExperienceInviteAction = RoduxModule.makeActionCreator("GET_EXPERIENCE_INVITE", function(p1)
		-- upvalues: CreateExperienceInvite (copy)
		return {
			responseBody = CreateExperienceInvite("2024-07-19T21:02:47.777+00:00", p1)
		}
	end),
	mockGetSquadActiveAction = RoduxModule.makeActionCreator("GET_SQUAD_ACTIVE", function(p1)
		-- upvalues: CreateServerSquad (copy)
		return {
			responseBody = { groupUp = if p1 then CreateServerSquad() else nil }
		}
	end),
	mockGetSquadFromSquadIdAction = RoduxModule.makeActionCreator("GET_SQUAD_FROM_SQUAD_ID", function(p1)
		-- upvalues: CreateServerSquad (copy)
		return {
			responseBody = {
				groupUp = CreateServerSquad("2024-07-19T21:02:47.777+00:00", p1)
			}
		}
	end),
	mockJoinSquadAction = RoduxModule.makeActionCreator("JOIN_SQUAD", function(p1)
		-- upvalues: CreateServerSquad (copy)
		return {
			responseBody = {
				groupUp = CreateServerSquad("2024-07-19T21:02:47.777+00:00", p1)
			}
		}
	end),
	mockLeaveSquadAction = RoduxModule.makeActionCreator("LEAVE_SQUAD", function(GroupUpId)
		return { responseBody = {}, postBody = { groupUpId = GroupUpId } }
	end),
	mockVoteForExperienceInviteAction = RoduxModule.makeActionCreator("VOTE_FOR_EXPERIENCE_INVITE", function(p1)
		-- upvalues: CreateExperienceInvite (copy), ExperienceInviteVoteTypeModule (copy)
		return {
			responseBody = CreateExperienceInvite("2024-07-19T21:02:47.777+00:00", p1, {
				[1] = {
					userId = 123,
					voteIdentifier = "voteIdentifier",
					voteType = ExperienceInviteVoteTypeModule.Accept
				}
			})
		}
	end),
	mockActOnPartyNudgeAction = RoduxModule.makeActionCreator("ACT_ON_PARTY_NUDGE", function(p1)
		-- upvalues: CreateServerSquad (copy)
		return {
			responseBody = {
				groupUp = CreateServerSquad("2024-07-19T21:02:47.777+00:00", p1)
			}
		}
	end),
	mockSelfPermissionUpdatedAction = RoduxModule.makeActionCreator("SELF_PERMISSION_UPDATED", function(SelfPermissions)
		return { responseBody = { selfPermissions = SelfPermissions } }
	end)
}