local profileQRCode = script:FindFirstAncestor("ProfileQRCode")
local configureRoduxFriendsModule = require(profileQRCode.Networking.configureRoduxFriends)
local useDispatch = require(profileQRCode.Parent.RoactUtils).Hooks.RoactRodux.useDispatch

return function() --[[ line: 10 ]]
	-- upvalues: useDispatch (ref), configureRoduxFriendsModule (ref)
	local var2 = useDispatch()
	
	return function(p0, p1) --[[ line: 13 ]]
		-- upvalues: var2 (ref), configureRoduxFriendsModule (copy)
		return var2(configureRoduxFriendsModule.AcceptFriendRequestFromUserId.API({ currentUserId = p0, targetUserId = p1 }))
	end
end