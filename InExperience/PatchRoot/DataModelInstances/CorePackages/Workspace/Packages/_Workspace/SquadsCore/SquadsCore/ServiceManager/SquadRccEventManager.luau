local squadsCore = script:FindFirstAncestor("SquadsCore")
local socialService = game:GetService("SocialService")
local sharedFlagsModule = require(squadsCore.Parent.SharedFlags)
local validateSquadIdModule = require(squadsCore.Common.validateSquadId)
local t = {}
t.__index = t
local fFlagPartyDevAPIToRespectThirdPartySettingsEnabled = sharedFlagsModule.FFlagPartyDevAPIToRespectThirdPartySettingsEnabled

function t.new() --[[ line: 29 ]]
	-- upvalues: t (ref)
	return setmetatable({ isLeaveSquadPending = false, lastFiredSquadId = "" }, t)
end

function t:setLeaveSquadPendingAndFireEvent(p0, p1) --[[ line: 40 ]]
	if self:_setLeaveSquadPending(p0) then
		self:fireSquadChangeEvent(nil, p1)
	end
end

function t:fireSquadChangeEvent(p2, p3) --[[ line: 46 ]]
	-- upvalues: validateSquadIdModule (ref), socialService (ref), fFlagPartyDevAPIToRespectThirdPartySettingsEnabled (ref)
	p2 = p2 or ""
	assert(if p2 ~= "" then validateSquadIdModule(p2) else true, "Try to fire with wrong squadId")
	
	if p2 ~= "" then
		self:_setLeaveSquadPending(false)
	end
	if (not self.isLeaveSquadPending or p2 ~= "") and self.lastFiredSquadId ~= p2 then
		self.lastFiredSquadId = p2
		socialService:UpdatePlayerPartyData(p2, if fFlagPartyDevAPIToRespectThirdPartySettingsEnabled then not p3 else nil)
	end
end

function t:_setLeaveSquadPending(p4) --[[ line: 63 ]]
	if self.isLeaveSquadPending == p4 then
		return false
	end
	self.isLeaveSquadPending = p4
	
	return true
end

t.default = t.new()

return t.default