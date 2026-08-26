local profileQRCode = script:FindFirstAncestor("ProfileQRCode")
local parent = profileQRCode.Parent
local roactUtilsModule = require(parent.RoactUtils)
local configureRoduxFriendsModule = require(profileQRCode.Networking.configureRoduxFriends)
local fFlagMigrateFriendshipStatusesRemainingActions = require(parent.SharedFlags).FFlagMigrateFriendshipStatusesRemainingActions
local var1 = require(parent.DataHydration).Friends.FriendsStore.get()
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch

return function()
	-- upvalues: useDispatch (ref), fFlagMigrateFriendshipStatusesRemainingActions (ref), var1 (ref), configureRoduxFriendsModule (ref)
	local var2 = useDispatch()
	
	return function(p1, p2)
		-- upvalues: fFlagMigrateFriendshipStatusesRemainingActions (copy), var1 (copy), var2 (ref), configureRoduxFriendsModule (copy)
		return if fFlagMigrateFriendshipStatusesRemainingActions then var1.AcceptFriendRequest(p2) else var2(configureRoduxFriendsModule.AcceptFriendRequestFromUserId.API({ currentUserId = p1, targetUserId = p2 }))
	end
end