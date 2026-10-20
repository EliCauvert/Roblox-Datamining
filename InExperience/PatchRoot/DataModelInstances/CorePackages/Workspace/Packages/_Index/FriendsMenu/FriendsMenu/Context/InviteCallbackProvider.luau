local Parent = script.Parent
local ReactModule = require(Parent.Parent.Parent.React)
local InviteCallbackContextModule = require(Parent.InviteCallbackContext)

return function(p1)
	-- upvalues: ReactModule (copy), InviteCallbackContextModule (copy)
	return ReactModule.createElement(InviteCallbackContextModule.Provider, {
		value = {
			inviteSingleFriend = p1.inviteSingleFriend,
			inviteMultiFriends = p1.inviteMultiFriends
		}
	}, p1.children)
end