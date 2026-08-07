local parent = script.Parent.Parent
local actions = parent.Actions
local immutable = require(parent.Parent.Parent.AppCommonLib).Immutable
local receivedUserInviteStatusModule = require(actions.ReceivedUserInviteStatus)
local resetUserInviteStatusModule = require(actions.ResetUserInviteStatus)

return function(p0, p1) --[[ line: 11 ]]
	-- upvalues: receivedUserInviteStatusModule (ref), immutable (ref), resetUserInviteStatusModule (ref)
	p0 = p0 or {}
	
	if p1.type == receivedUserInviteStatusModule.name then
		p0 = immutable.Set(p0, p1.userId, p1.inviteStatus)
		
		return p0
	elseif p1.type == resetUserInviteStatusModule.name then
		p0 = {}
	end
	return p0
end