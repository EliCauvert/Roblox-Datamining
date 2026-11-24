local FriendsChat = script:FindFirstAncestor("FriendsChat")
local GetLocalUserIdModule = require(FriendsChat.Utils.getLocalUserId)
local FIntFriendsChatSuggestedUsersFriendCountThresholdModule = require(FriendsChat.Flags.FIntFriendsChatSuggestedUsersFriendCountThreshold)
local UseGetFriendsCountByUserIdFunction = require(FriendsChat.Parent.FriendsHydrationReact).useGetFriendsCountByUserId

return function(): boolean
	-- upvalues: GetLocalUserIdModule (copy), UseGetFriendsCountByUserIdFunction (copy), FIntFriendsChatSuggestedUsersFriendCountThresholdModule (copy)
	local LocalUserIdModule = GetLocalUserIdModule()
	local UseGetFriendsCountByUserIdResult = UseGetFriendsCountByUserIdFunction(if LocalUserIdModule then tostring(LocalUserIdModule) else nil)
	
	return UseGetFriendsCountByUserIdResult ~= nil and UseGetFriendsCountByUserIdResult < FIntFriendsChatSuggestedUsersFriendCountThresholdModule
end