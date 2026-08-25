local roduxSquads = script:FindFirstAncestor("RoduxSquads")
local parent = roduxSquads.Parent
local tModule = require(parent.t)
local experienceInviteStateModule = require(roduxSquads.Enums.ExperienceInviteState)
local experienceInviteVoteTypeModule = require(roduxSquads.Enums.ExperienceInviteVoteType)
local experienceInviteTypeModule = require(roduxSquads.Enums.ExperienceInviteType)
local fFlagEnablePrivatePartyAcceptInvite = require(parent.SharedFlags).FFlagEnablePrivatePartyAcceptInvite

local function _(p0)
	-- upvalues: experienceInviteVoteTypeModule (ref)
	local var6 = 0
	
	for i = 1, #p0 do
		if p0[i].voteType == experienceInviteVoteTypeModule.Accept then
			var6 += 1
		end
	end
	return var6
end

local t = {}

function t.new(p1)
	-- upvalues: t (ref)
	assert(t.isValid(p1))
	t.__index = t
	setmetatable(p1, t)
	
	return p1
end

function t.mock(p2)
	-- upvalues: experienceInviteVoteTypeModule (ref), t (ref), experienceInviteStateModule (ref), fFlagEnablePrivatePartyAcceptInvite (ref), experienceInviteTypeModule (ref)
	p2 = p2 or {}
	p2 = p2.votes or {
		[1] = {
			userId = 456,
			voteIdentifier = "voteIdentifier",
			voteType = experienceInviteVoteTypeModule.Accept
		}
	}
	local var8 = 0
	
	for i = 1, #p2 do
		if p2[i].voteType == experienceInviteVoteTypeModule.Accept then
			var8 += 1
		end
	end
	var8 = t.new({
		createdAtTime = p2.createdAtTime or "2024-07-19T21:02:47.777+00:00",
		experienceInviteId = p2.experienceInviteId or "987",
		experienceDetail = p2.experienceDetail or { placeId = 15308759682, gameInstanceId = "instanceId" },
		inviterId = p2.inviterId or 123456,
		membershipEntityId = p2.membershipEntityId or "54321",
		spotsTaken = var8,
		state = p2.state or experienceInviteStateModule.Active,
		totalSpots = p2.totalSpots or 6,
		versionId = p2.version or 1,
		votes = p2
	})
	
	if fFlagEnablePrivatePartyAcceptInvite then
		var8.inviteType = p2.inviteType or experienceInviteTypeModule.PlayWithPartyInPublicServer
	end
	return var8
end

function t.format(p3)
	-- upvalues: t (ref), experienceInviteVoteTypeModule (ref), fFlagEnablePrivatePartyAcceptInvite (ref), experienceInviteTypeModule (ref)
	local votes = p3.votes
	local new = t.new
	local t_1 = {
		createdAtTime = p3.createdAtTime,
		experienceDetail = p3.experienceDetail,
		experienceInviteId = p3.experienceInviteId,
		inviterId = p3.inviterId,
		membershipEntityId = p3.membershipEntityId
	}
	local var10 = 0
	
	for i = 1, #votes do
		if votes[i].voteType == experienceInviteVoteTypeModule.Accept then
			var10 += 1
		end
	end
	t_1.spotsTaken = var10
	t_1.state = p3.state
	t_1.totalSpots = p3.totalSpots
	t_1.versionId = p3.versionId
	t_1.votes = votes
	new = new(t_1)
	
	if fFlagEnablePrivatePartyAcceptInvite then
		new.inviteType = p3.inviteType or experienceInviteTypeModule.PlayWithPartyInPublicServer
	end
	return new
end

t.isValid = tModule.strictInterface({
	createdAtTime = tModule.string,
	experienceDetail = tModule.interface({
		placeId = tModule.number,
		gameInstanceId = tModule.optional(tModule.string)
	}),
	experienceInviteId = tModule.string,
	inviterId = tModule.number,
	membershipEntityId = tModule.string,
	spotsTaken = tModule.number,
	state = tModule.string,
	totalSpots = tModule.number,
	versionId = tModule.number,
	votes = tModule.array(tModule.interface({
		userId = tModule.number,
		voteIdentifier = tModule.optional(tModule.string),
		voteType = tModule.string
	})),
	inviteType = tModule.optional(tModule.union(tModule.literal(experienceInviteTypeModule.PlayWithPartyInPublicServer), tModule.literal(experienceInviteTypeModule.PlayWithPartyInPrivatePartyServer)))
})

return t