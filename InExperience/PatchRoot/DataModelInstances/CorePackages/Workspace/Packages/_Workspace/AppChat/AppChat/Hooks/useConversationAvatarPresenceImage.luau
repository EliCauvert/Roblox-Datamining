local appChat = script:FindFirstAncestor("AppChat")
local useGetPresenceByUserId = require(appChat.Parent.FriendsCommon).Hooks.useGetPresenceByUserId
local userPresenceUtilsModule = require(appChat.Users.userPresenceUtils)

return function(p0) --[[ line: 7 | named "useConversationAvatarPresenceImage" ]]
	-- upvalues: useGetPresenceByUserId (ref), userPresenceUtilsModule (ref)
	return userPresenceUtilsModule.getUserDisplayPresence(useGetPresenceByUserId(p0)).image
end