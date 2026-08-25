local playersService = game:GetService("Players")
local networkingFriendsModule = require(script:FindFirstAncestor("AppChat").Http.NetworkingFriends)

return function()
	-- upvalues: playersService (ref), networkingFriendsModule (ref)
	return function(p0)
		-- upvalues: playersService (copy), networkingFriendsModule (copy)
		if playersService.LocalPlayer then
			return p0:dispatch(networkingFriendsModule.GetFriendsCountFromUserId.API(playersService.LocalPlayer.UserId))
		end
	end
end