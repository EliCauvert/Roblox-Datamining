local parent = script:FindFirstAncestor("RoduxSquads").Parent
local squadInviteeModelModule = require(script.Parent.SquadInviteeModel)
local squadMemberModelModule = require(script.Parent.SquadMemberModel)
local squadSelfPermissionsModelModule = require(script.Parent.SquadSelfPermissionsModel)
local cryoModule = require(parent.Cryo)
local tModule = require(parent.t)
local fFlagEnableSquadRegroupExperimentation = require(parent.SharedFlags).FFlagEnableSquadRegroupExperimentation
local t = {}

function t.new(p0)
	-- upvalues: t (ref)
	assert(t.isValid(p0))
	t.__index = t
	setmetatable(p0, t)
	
	return p0
end

function tryGetSquadId(p1)
	return p1.groupUpId or p1.squadId
end

function t.mock(p2)
	-- upvalues: cryoModule (ref), squadMemberModelModule (ref), squadInviteeModelModule (ref), t (ref), fFlagEnableSquadRegroupExperimentation (ref)
	p2 = p2 or {}
	
	return t.new({
		squadId = tryGetSquadId(p2) or "12345",
		initiatorId = p2.initiatorId or 54321,
		createdAtTime = p2.createdAtTime or "2024-07-19T21:02:47.777+00:00",
		updatedAtTime = p2.updatedAtTime or "2024-07-19T21:02:47.777+00:00",
		deletedAtTime = p2.deletedAtTime,
		parentChannelId = p2.parentChannelId or "23456",
		members = cryoModule.List.map(p2.members or { { userId = 1234 } }, function(p3)
			-- upvalues: squadMemberModelModule (copy)
			return squadMemberModelModule.mock(p3)
		end),
		invitees = cryoModule.List.map(p2.invitees or { { userId = 2345, invitedAtTimestampMs = 3333333 } }, function(p4)
			-- upvalues: squadInviteeModelModule (copy)
			return squadInviteeModelModule.mock(p4)
		end),
		selfPermissions = if fFlagEnableSquadRegroupExperimentation then p2.selfPermissions or {
			canSeeRegroupPromptToast = false,
			canSeeRegroupJoinButton = false
		} else nil
	})
end

function t.format(p5)
	-- upvalues: cryoModule (ref), squadMemberModelModule (ref), squadInviteeModelModule (ref), t (ref), fFlagEnableSquadRegroupExperimentation (ref)
	return t.new({
		createdAtTime = p5.createdAtTime,
		deletedAtTime = p5.deletedAtTime,
		initiatorId = p5.initiatorId,
		invitees = cryoModule.List.map(p5.invitees, function(p6)
			-- upvalues: squadInviteeModelModule (copy)
			return squadInviteeModelModule.format(p6)
		end),
		members = cryoModule.List.map(p5.members, function(p7)
			-- upvalues: squadMemberModelModule (copy)
			return squadMemberModelModule.format(p7)
		end),
		parentChannelId = p5.parentChannelId,
		squadId = tryGetSquadId(p5),
		updatedAtTime = p5.updatedAtTime,
		selfPermissions = if fFlagEnableSquadRegroupExperimentation then p5.selfPermissions else nil
	})
end

t.isValid = tModule.strictInterface({
	createdAtTime = tModule.string,
	deletedAtTime = tModule.optional(tModule.string),
	initiatorId = tModule.number,
	invitees = tModule.array(squadInviteeModelModule.isValid),
	members = tModule.array(squadMemberModelModule.isValid),
	parentChannelId = tModule.string,
	squadId = tModule.string,
	updatedAtTime = tModule.string,
	selfPermissions = if fFlagEnableSquadRegroupExperimentation then tModule.optional(squadSelfPermissionsModelModule.isValid) else tModule.none
})

return t