local ProfileQRCode = script:FindFirstAncestor("ProfileQRCode")
local ConfigureRoduxFriendsModule = require(ProfileQRCode.Networking.configureRoduxFriends)
local UseDispatchFunction = require(ProfileQRCode.Parent.RoactUtils).Hooks.RoactRodux.useDispatch

return function()
	-- upvalues: UseDispatchFunction (copy), ConfigureRoduxFriendsModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	
	return function(CurrentUserId, TargetUserId)
		-- upvalues: UseDispatchResult (copy), ConfigureRoduxFriendsModule (upval)
		return UseDispatchResult(ConfigureRoduxFriendsModule.AcceptFriendRequestFromUserId.API({
			currentUserId = CurrentUserId,
			targetUserId = TargetUserId
		}))
	end
end