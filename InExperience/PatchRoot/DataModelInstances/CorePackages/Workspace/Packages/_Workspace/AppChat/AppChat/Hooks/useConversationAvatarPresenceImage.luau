local appChat = script:FindFirstAncestor("AppChat")
local useGetPresenceByUserId = require(appChat.Parent.FriendsCommon).Hooks.useGetPresenceByUserId
local userPresenceUtilsModule = require(appChat.Users.userPresenceUtils)

return function(p1)
	-- upvalues: useGetPresenceByUserId (ref), userPresenceUtilsModule (ref)
	return userPresenceUtilsModule.getUserDisplayPresence(useGetPresenceByUserId(p1)).image
end