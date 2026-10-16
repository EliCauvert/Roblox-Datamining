local ProfileQRCode = script:FindFirstAncestor("ProfileQRCode")
local Parent = ProfileQRCode.Parent
local ConfigureRoduxFriendsModule = require(ProfileQRCode.Networking.configureRoduxFriends)
local FFlagMigrateFriendshipStatusesRemainingActions = require(Parent.SharedFlags).FFlagMigrateFriendshipStatusesRemainingActions
local GetResult = require(Parent.DataHydration).Friends.FriendsStore.get()
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch

return function() --[[ Line: 15 ]]
	-- upvalues: UseDispatchFunction (copy), FFlagMigrateFriendshipStatusesRemainingActions (copy), GetResult (copy), ConfigureRoduxFriendsModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	
	return function(CurrentUserId, TargetUserId) --[[ Line: 18 ]]
		-- upvalues: FFlagMigrateFriendshipStatusesRemainingActions (upval), GetResult (upval), UseDispatchResult (copy), ConfigureRoduxFriendsModule (upval)
		return if FFlagMigrateFriendshipStatusesRemainingActions then GetResult.AcceptFriendRequest(TargetUserId) else UseDispatchResult(ConfigureRoduxFriendsModule.AcceptFriendRequestFromUserId.API({
			currentUserId = CurrentUserId,
			targetUserId = TargetUserId
		}))
	end
end