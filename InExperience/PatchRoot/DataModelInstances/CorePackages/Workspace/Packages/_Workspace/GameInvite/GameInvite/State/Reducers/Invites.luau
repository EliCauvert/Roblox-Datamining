local Parent = script.Parent.Parent
local Actions = Parent.Actions
local Immutable = require(Parent.Parent.Parent.AppCommonLib).Immutable
local ReceivedUserInviteStatusModule = require(Actions.ReceivedUserInviteStatus)
local ResetUserInviteStatusModule = require(Actions.ResetUserInviteStatus)

return function(p1, p2) --[[ Line: 11 ]]
	-- upvalues: ReceivedUserInviteStatusModule (copy), Immutable (copy), ResetUserInviteStatusModule (copy)
	local P0 = p1 or {}
	
	if p2.type == ReceivedUserInviteStatusModule.name then
		P0 = Immutable.Set(P0, p2.userId, p2.inviteStatus)
		
		return P0
	end
	if p2.type == ResetUserInviteStatusModule.name then
		P0 = {}
	end
	return P0
end