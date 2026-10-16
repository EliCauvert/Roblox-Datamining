local Parent = script:FindFirstAncestor("RoduxSquads").Parent
local SquadInviteeModelModule = require(script.Parent.SquadInviteeModel)
local SquadMemberModelModule = require(script.Parent.SquadMemberModel)
local SquadSelfPermissionsModelModule = require(script.Parent.SquadSelfPermissionsModel)
local CryoModule = require(Parent.Cryo)
local TModule = require(Parent.t)
local FFlagEnableSquadRegroupExperimentation = require(Parent.SharedFlags).FFlagEnableSquadRegroupExperimentation
local SquadModelModule = {}

function SquadModelModule.new(p1) --[[ Line: 15 ]]
	-- upvalues: SquadModelModule (copy)
	assert(SquadModelModule.isValid(p1))
	SquadModelModule.__index = SquadModelModule
	setmetatable(p1, SquadModelModule)
	
	return p1
end

function tryGetSquadId(p1) --[[ Line: 28 ]]
	return p1.groupUpId or p1.squadId
end

function SquadModelModule.mock(p1) --[[ Line: 32 ]]
	-- upvalues: CryoModule (copy), SquadMemberModelModule (copy), SquadInviteeModelModule (copy), SquadModelModule (copy), FFlagEnableSquadRegroupExperimentation (copy)
	local P2 = p1 or {}
	local config = {
		canSeeRegroupPromptToast = false,
		canSeeRegroupJoinButton = false
	}
	
	return (SquadModelModule.new({
		squadId = tryGetSquadId(P2) or "12345",
		initiatorId = P2.initiatorId or 54321,
		createdAtTime = P2.createdAtTime or "2024-07-19T21:02:47.777+00:00",
		updatedAtTime = P2.updatedAtTime or "2024-07-19T21:02:47.777+00:00",
		deletedAtTime = P2.deletedAtTime,
		parentChannelId = P2.parentChannelId or "23456",
		members = CryoModule.List.map(P2.members or { { userId = 1234 } }, function(p2) --[[ Line: 35 ]]
			-- upvalues: SquadMemberModelModule (upval)
			return SquadMemberModelModule.mock(p2)
		end),
		invitees = CryoModule.List.map(P2.invitees or { { userId = 2345, invitedAtTimestampMs = 3333333 } }, function(p2) --[[ Line: 41 ]]
			-- upvalues: SquadInviteeModelModule (upval)
			return SquadInviteeModelModule.mock(p2)
		end),
		selfPermissions = if FFlagEnableSquadRegroupExperimentation then P2.selfPermissions or config else nil
	}))
end

function SquadModelModule.format(p1) --[[ Line: 68 ]]
	-- upvalues: CryoModule (copy), SquadMemberModelModule (copy), SquadInviteeModelModule (copy), SquadModelModule (copy), FFlagEnableSquadRegroupExperimentation (copy)
	return (SquadModelModule.new({
		createdAtTime = p1.createdAtTime,
		deletedAtTime = p1.deletedAtTime,
		initiatorId = p1.initiatorId,
		invitees = CryoModule.List.map(p1.invitees, function(p2) --[[ Line: 73 ]]
			-- upvalues: SquadInviteeModelModule (upval)
			return SquadInviteeModelModule.format(p2)
		end),
		members = CryoModule.List.map(p1.members, function(p2) --[[ Line: 69 ]]
			-- upvalues: SquadMemberModelModule (upval)
			return SquadMemberModelModule.format(p2)
		end),
		parentChannelId = p1.parentChannelId,
		squadId = tryGetSquadId(p1),
		updatedAtTime = p1.updatedAtTime,
		selfPermissions = if FFlagEnableSquadRegroupExperimentation then p1.selfPermissions else nil
	}))
end

SquadModelModule.isValid = TModule.strictInterface({
	createdAtTime = TModule.string,
	deletedAtTime = TModule.optional(TModule.string),
	initiatorId = TModule.number,
	invitees = TModule.array(SquadInviteeModelModule.isValid),
	members = TModule.array(SquadMemberModelModule.isValid),
	parentChannelId = TModule.string,
	squadId = TModule.string,
	updatedAtTime = TModule.string,
	selfPermissions = if FFlagEnableSquadRegroupExperimentation then TModule.optional(SquadSelfPermissionsModelModule.isValid) else TModule.none
})

return SquadModelModule