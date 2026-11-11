local SquadsCore = script:FindFirstAncestor("SquadsCore")
local SocialService = game:GetService("SocialService")
local ValidateSquadIdModule = require(SquadsCore.Common.validateSquadId)
local Module = {}
Module.__index = Module
local FFlagPartyDevAPIToRespectThirdPartySettingsEnabled = require(SquadsCore.Parent.SharedFlags).FFlagPartyDevAPIToRespectThirdPartySettingsEnabled

function Module.new()
	-- upvalues: Module (copy)
	return (setmetatable({ isLeaveSquadPending = false, lastFiredSquadId = "" }, Module))
end

function Module:setLeaveSquadPendingAndFireEvent(IsLeaveSquadPending, p1)
	if self:_setLeaveSquadPending(IsLeaveSquadPending) then
		self:fireSquadChangeEvent(nil, p1)
	end
end

function Module:fireSquadChangeEvent(p1, p2)
	-- upvalues: ValidateSquadIdModule (copy), SocialService (copy), FFlagPartyDevAPIToRespectThirdPartySettingsEnabled (copy)
	local P4 = p1 or ""
	assert(P4 == "" or ValidateSquadIdModule(P4), "Try to fire with wrong squadId")
	
	if P4 ~= "" then
		self:_setLeaveSquadPending(false)
	end
	if (not self.isLeaveSquadPending or P4 ~= "") and self.lastFiredSquadId ~= P4 then
		self.lastFiredSquadId = P4
		SocialService:UpdatePlayerPartyData(P4, if FFlagPartyDevAPIToRespectThirdPartySettingsEnabled then not p2 else nil)
	end
end

function Module:_setLeaveSquadPending(IsLeaveSquadPending): boolean
	if self.isLeaveSquadPending == IsLeaveSquadPending then
		return false
	else
		self.isLeaveSquadPending = IsLeaveSquadPending
		
		return true
	end
end

Module.default = Module.new()

return Module.default