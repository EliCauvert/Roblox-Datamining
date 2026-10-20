local RoduxSquads = script:FindFirstAncestor("RoduxSquads")
local Parent = RoduxSquads.Parent
local TModule = require(Parent.t)
local ExperienceInviteStateModule = require(RoduxSquads.Enums.ExperienceInviteState)
local ExperienceInviteVoteTypeModule = require(RoduxSquads.Enums.ExperienceInviteVoteType)
local ExperienceInviteTypeModule = require(RoduxSquads.Enums.ExperienceInviteType)
local FFlagEnablePrivatePartyAcceptInvite = require(Parent.SharedFlags).FFlagEnablePrivatePartyAcceptInvite

local function _(p1): number
	-- upvalues: ExperienceInviteVoteTypeModule (copy)
	local Count = 0
	
	for i = 1, #p1 do
		if p1[i].voteType == ExperienceInviteVoteTypeModule.Accept then
			Count += 1
		end
	end
	return Count
end

local ExperienceInviteModelModule = {}

function ExperienceInviteModelModule.new(p2)
	-- upvalues: ExperienceInviteModelModule (copy)
	assert(ExperienceInviteModelModule.isValid(p2))
	ExperienceInviteModelModule.__index = ExperienceInviteModelModule
	setmetatable(p2, ExperienceInviteModelModule)
	
	return p2
end

function ExperienceInviteModelModule.mock(p2)
	-- upvalues: ExperienceInviteVoteTypeModule (copy), ExperienceInviteModelModule (copy), ExperienceInviteStateModule (copy), FFlagEnablePrivatePartyAcceptInvite (copy), ExperienceInviteTypeModule (copy)
	local P2 = p2 or {}
	local Votes = P2.votes or {
		[1] = {
			userId = 456,
			voteIdentifier = "voteIdentifier",
			voteType = ExperienceInviteVoteTypeModule.Accept
		}
	}
	local SpotsTaken = 0
	
	for i = 1, #Votes do
		if Votes[i].voteType == ExperienceInviteVoteTypeModule.Accept then
			SpotsTaken += 1
		end
	end
	local NewExperienceInviteModel = ExperienceInviteModelModule.new({
		createdAtTime = P2.createdAtTime or "2024-07-19T21:02:47.777+00:00",
		experienceInviteId = P2.experienceInviteId or "987",
		experienceDetail = P2.experienceDetail or { placeId = 15308759682, gameInstanceId = "instanceId" },
		inviterId = P2.inviterId or 123456,
		membershipEntityId = P2.membershipEntityId or "54321",
		spotsTaken = SpotsTaken,
		state = P2.state or ExperienceInviteStateModule.Active,
		totalSpots = P2.totalSpots or 6,
		versionId = P2.version or 1,
		votes = Votes
	})
	
	if FFlagEnablePrivatePartyAcceptInvite then
		NewExperienceInviteModel.inviteType = P2.inviteType or ExperienceInviteTypeModule.PlayWithPartyInPublicServer
	end
	return NewExperienceInviteModel
end

function ExperienceInviteModelModule.format(p3)
	-- upvalues: ExperienceInviteModelModule (copy), ExperienceInviteVoteTypeModule (copy), FFlagEnablePrivatePartyAcceptInvite (copy), ExperienceInviteTypeModule (copy)
	local Votes = p3.votes
	local NewFunction = ExperienceInviteModelModule.new
	local config = {
		createdAtTime = p3.createdAtTime,
		experienceDetail = p3.experienceDetail,
		experienceInviteId = p3.experienceInviteId,
		inviterId = p3.inviterId,
		membershipEntityId = p3.membershipEntityId
	}
	local SpotsTaken = 0
	
	for i = 1, #Votes do
		if Votes[i].voteType == ExperienceInviteVoteTypeModule.Accept then
			SpotsTaken += 1
		end
	end
	config.spotsTaken = SpotsTaken
	config.state = p3.state
	config.totalSpots = p3.totalSpots
	config.versionId = p3.versionId
	config.votes = Votes
	local NewResult = NewFunction(config)
	
	if FFlagEnablePrivatePartyAcceptInvite then
		NewResult.inviteType = p3.inviteType or ExperienceInviteTypeModule.PlayWithPartyInPublicServer
	end
	return NewResult
end

ExperienceInviteModelModule.isValid = TModule.strictInterface({
	createdAtTime = TModule.string,
	experienceDetail = TModule.interface({
		placeId = TModule.number,
		gameInstanceId = TModule.optional(TModule.string)
	}),
	experienceInviteId = TModule.string,
	inviterId = TModule.number,
	membershipEntityId = TModule.string,
	spotsTaken = TModule.number,
	state = TModule.string,
	totalSpots = TModule.number,
	versionId = TModule.number,
	votes = TModule.array(TModule.interface({
		userId = TModule.number,
		voteIdentifier = TModule.optional(TModule.string),
		voteType = TModule.string
	})),
	inviteType = TModule.optional(TModule.union(TModule.literal(ExperienceInviteTypeModule.PlayWithPartyInPublicServer), TModule.literal(ExperienceInviteTypeModule.PlayWithPartyInPrivatePartyServer)))
})

return ExperienceInviteModelModule