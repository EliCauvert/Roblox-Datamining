local parent = script.Parent
local reactModule = require(parent.Parent.Parent.React)
local inviteCallbackContextModule = require(parent.InviteCallbackContext)

return function(p1)
	-- upvalues: reactModule (ref), inviteCallbackContextModule (ref)
	return reactModule.createElement(inviteCallbackContextModule.Provider, {
		value = {
			inviteSingleFriend = p1.inviteSingleFriend,
			inviteMultiFriends = p1.inviteMultiFriends
		}
	}, p1.children)
end