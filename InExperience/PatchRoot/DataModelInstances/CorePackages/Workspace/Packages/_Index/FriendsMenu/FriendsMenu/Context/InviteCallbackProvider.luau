local parent = script.Parent
local reactModule = require(parent.Parent.Parent.React)
local inviteCallbackContextModule = require(parent.InviteCallbackContext)

return function(p0)
	-- upvalues: reactModule (ref), inviteCallbackContextModule (ref)
	return reactModule.createElement(inviteCallbackContextModule.Provider, {
		value = {
			inviteSingleFriend = p0.inviteSingleFriend,
			inviteMultiFriends = p0.inviteMultiFriends
		}
	}, p0.children)
end