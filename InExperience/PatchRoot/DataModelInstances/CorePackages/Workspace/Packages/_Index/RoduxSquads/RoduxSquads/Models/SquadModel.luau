local parent = script:FindFirstAncestor("RoduxSquads").Parent
local squadInviteeModelModule = require(script.Parent.SquadInviteeModel)
local squadMemberModelModule = require(script.Parent.SquadMemberModel)
local squadSelfPermissionsModelModule = require(script.Parent.SquadSelfPermissionsModel)
local cryoModule = require(parent.Cryo)
local tModule = require(parent.t)
local fFlagEnableSquadRegroupExperimentation = require(parent.SharedFlags).FFlagEnableSquadRegroupExperimentation
local t = {}

function t.new(p1)
	-- upvalues: t (ref)
	assert(t.isValid(p1))
	t.__index = t
	setmetatable(p1, t)
	
	return p1
end

function tryGetSquadId(p1)
	return p1.groupUpId or p1.squadId
end

function t.mock(p1)
	-- upvalues: cryoModule (ref), squadMemberModelModule (ref), squadInviteeModelModule (ref), t (ref), fFlagEnableSquadRegroupExperimentation (ref)
	p1 = p1 or {}
	
	return t.new({
		squadId = tryGetSquadId(p1) or "12345",
		initiatorId = p1.initiatorId or 54321,
		createdAtTime = p1.createdAtTime or "2024-07-19T21:02:47.777+00:00",
		updatedAtTime = p1.updatedAtTime or "2024-07-19T21:02:47.777+00:00",
		deletedAtTime = p1.deletedAtTime,
		parentChannelId = p1.parentChannelId or "23456",
		members = cryoModule.List.map(p1.members or { { userId = 1234 } }, function(p2)
			-- upvalues: squadMemberModelModule (copy)
			return squadMemberModelModule.mock(p2)
		end),
		invitees = cryoModule.List.map(p1.invitees or { { userId = 2345, invitedAtTimestampMs = 3333333 } }, function(p2)
			-- upvalues: squadInviteeModelModule (copy)
			return squadInviteeModelModule.mock(p2)
		end),
		selfPermissions = if fFlagEnableSquadRegroupExperimentation then p1.selfPermissions or {
			canSeeRegroupPromptToast = false,
			canSeeRegroupJoinButton = false
		} else nil
	})
end

function t.format(p1)
	-- upvalues: cryoModule (ref), squadMemberModelModule (ref), squadInviteeModelModule (ref), t (ref), fFlagEnableSquadRegroupExperimentation (ref)
	return t.new({
		createdAtTime = p1.createdAtTime,
		deletedAtTime = p1.deletedAtTime,
		initiatorId = p1.initiatorId,
		invitees = cryoModule.List.map(p1.invitees, function(p2)
			-- upvalues: squadInviteeModelModule (copy)
			return squadInviteeModelModule.format(p2)
		end),
		members = cryoModule.List.map(p1.members, function(p2)
			-- upvalues: squadMemberModelModule (copy)
			return squadMemberModelModule.format(p2)
		end),
		parentChannelId = p1.parentChannelId,
		squadId = tryGetSquadId(p1),
		updatedAtTime = p1.updatedAtTime,
		selfPermissions = if fFlagEnableSquadRegroupExperimentation then p1.selfPermissions else nil
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