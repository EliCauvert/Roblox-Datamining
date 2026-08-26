local parent = script.Parent.Parent
local actions = parent.Actions
local immutable = require(parent.Parent.Parent.AppCommonLib).Immutable
local receivedUserInviteStatusModule = require(actions.ReceivedUserInviteStatus)
local resetUserInviteStatusModule = require(actions.ResetUserInviteStatus)

return function(p1, p2)
	-- upvalues: receivedUserInviteStatusModule (ref), immutable (ref), resetUserInviteStatusModule (ref)
	p1 = p1 or {}
	
	if p2.type == receivedUserInviteStatusModule.name then
		p1 = immutable.Set(p1, p2.userId, p2.inviteStatus)
		
		return p1
	elseif p2.type == resetUserInviteStatusModule.name then
		p1 = {}
	end
	return p1
end