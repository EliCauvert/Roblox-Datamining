local squadsCore = script:FindFirstAncestor("SquadsCore")
local socialService = game:GetService("SocialService")
local sharedFlagsModule = require(squadsCore.Parent.SharedFlags)
local validateSquadIdModule = require(squadsCore.Common.validateSquadId)
local t = {}
t.__index = t
local fFlagPartyDevAPIToRespectThirdPartySettingsEnabled = sharedFlagsModule.FFlagPartyDevAPIToRespectThirdPartySettingsEnabled

function t.new()
	-- upvalues: t (ref)
	return setmetatable({ isLeaveSquadPending = false, lastFiredSquadId = "" }, t)
end

function t:setLeaveSquadPendingAndFireEvent(p1, p2)
	if self:_setLeaveSquadPending(p1) then
		self:fireSquadChangeEvent(nil, p2)
	end
end

function t:fireSquadChangeEvent(p1, p2)
	-- upvalues: validateSquadIdModule (ref), socialService (ref), fFlagPartyDevAPIToRespectThirdPartySettingsEnabled (ref)
	p1 = p1 or ""
	assert(if p1 ~= "" then validateSquadIdModule(p1) else true, "Try to fire with wrong squadId")
	
	if p1 ~= "" then
		self:_setLeaveSquadPending(false)
	end
	if (not self.isLeaveSquadPending or p1 ~= "") and self.lastFiredSquadId ~= p1 then
		self.lastFiredSquadId = p1
		socialService:UpdatePlayerPartyData(p1, if fFlagPartyDevAPIToRespectThirdPartySettingsEnabled then not p2 else nil)
	end
end

function t:_setLeaveSquadPending(p1)
	if self.isLeaveSquadPending == p1 then
		return false
	end
	self.isLeaveSquadPending = p1
	
	return true
end

t.default = t.new()

return t.default