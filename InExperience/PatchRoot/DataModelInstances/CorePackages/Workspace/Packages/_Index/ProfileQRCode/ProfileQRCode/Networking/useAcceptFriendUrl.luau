local profileQRCode = script:FindFirstAncestor("ProfileQRCode")
local parent = profileQRCode.Parent
local roactUtilsModule = require(parent.RoactUtils)
local configureRoduxFriendsModule = require(profileQRCode.Networking.configureRoduxFriends)
local fFlagMigrateFriendshipStatusesRemainingActions = require(parent.SharedFlags).FFlagMigrateFriendshipStatusesRemainingActions
local var3 = require(parent.DataHydration).Friends.FriendsStore.get()
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch

return function()
	-- upvalues: useDispatch (ref), fFlagMigrateFriendshipStatusesRemainingActions (ref), var3 (ref), configureRoduxFriendsModule (ref)
	local var4 = useDispatch()
	
	return function(p0, p1)
		-- upvalues: fFlagMigrateFriendshipStatusesRemainingActions (copy), var3 (copy), var4 (ref), configureRoduxFriendsModule (copy)
		return if fFlagMigrateFriendshipStatusesRemainingActions then var3.AcceptFriendRequest(p1) else var4(configureRoduxFriendsModule.AcceptFriendRequestFromUserId.API({ currentUserId = p0, targetUserId = p1 }))
	end
end