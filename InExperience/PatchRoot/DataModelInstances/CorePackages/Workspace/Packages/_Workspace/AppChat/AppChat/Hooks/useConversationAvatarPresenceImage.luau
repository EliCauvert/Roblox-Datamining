local AppChat = script:FindFirstAncestor("AppChat")
local UseGetPresenceByUserIdFunction = require(AppChat.Parent.FriendsCommon).Hooks.useGetPresenceByUserId
local UserPresenceUtilsModule = require(AppChat.Users.userPresenceUtils)

return function(p1)
	-- upvalues: UseGetPresenceByUserIdFunction (copy), UserPresenceUtilsModule (copy)
	return UserPresenceUtilsModule.getUserDisplayPresence((UseGetPresenceByUserIdFunction(p1))).image
end